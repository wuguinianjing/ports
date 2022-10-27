vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wuguinianjing/vcpkg-ports
    REF 41ff4505fa933b056fb49364c855d4c3da0d508a
    SHA512 e71a8b07bf86b478b85bc785805601e3e4b803bae48d5685796d7cd15ed40f3de10aae0c3bcd7dbcdc5941b2b7f46ec4b8e1c520d2d8a9cc6f53e568c72fc45f
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS 
        -DBUILD_K1EE_TESTS=OFF   
)

vcpkg_install_cmake() 
 
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/k1ee)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

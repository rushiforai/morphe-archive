cmake_minimum_required(VERSION 3.22.1)
project(waze_tile_cameras LANGUAGES CXX)
add_library(shadowhook_native SHARED IMPORTED)
set_target_properties(shadowhook_native PROPERTIES
    IMPORTED_LOCATION "${SHADOWHOOK_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${SHADOWHOOK_ROOT}/prefab/modules/shadowhook/include")
add_library(waze_tile_cameras SHARED native_tile_cameras.cpp)
# Assets are extracted together into a private, content-addressed directory.
# Android's toolchain disables CMake-managed RPATH; pass the ELF tag explicitly.
# Single shell quotes preserve the dynamic linker's literal token through Ninja.
set_target_properties(waze_tile_cameras PROPERTIES LINK_FLAGS "-Wl,-rpath,'$ORIGIN'")
target_compile_features(waze_tile_cameras PRIVATE cxx_std_17)
target_compile_options(waze_tile_cameras PRIVATE -Wall -Wextra -Werror -fvisibility=hidden)
# The helper must be dlopened by ShadowHook during its own constructor scan.
target_link_libraries(waze_tile_cameras PRIVATE shadowhook_native dl)

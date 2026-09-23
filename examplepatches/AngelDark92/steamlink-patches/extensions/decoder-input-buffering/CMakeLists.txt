cmake_minimum_required(VERSION 3.22)
project(gxr_decoder_input_buffering LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
foreach(build_code 5002322 5002363)
    add_library(gxr_dbuf_${build_code} SHARED src/decoder_buffering.cpp src/install_hooks.cpp src/pipeline_telemetry.cpp)
    target_compile_definitions(gxr_dbuf_${build_code} PRIVATE GXR_BUILD_CODE=${build_code})
    target_compile_options(gxr_dbuf_${build_code} PRIVATE -O2 -Wall -Wextra -Werror
        -ffunction-sections -fdata-sections)
    # The scene's dependency is redirected to this helper. Keep the real media
    # library as a dependency even though stock methods call its original APIs.
    target_link_libraries(gxr_dbuf_${build_code} PRIVATE log dl android
        "-Wl,--no-as-needed" mediandk "-Wl,--as-needed")
    target_link_options(gxr_dbuf_${build_code} PRIVATE
        -Wl,--gc-sections -Wl,--exclude-libs,ALL
        "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exports.map"
        -Wl,-z,max-page-size=16384 -Wl,-soname,libgxr_dbuf.so)
    set_property(TARGET gxr_dbuf_${build_code} APPEND PROPERTY LINK_DEPENDS
        "${CMAKE_CURRENT_SOURCE_DIR}/exports.map")
    set_target_properties(gxr_dbuf_${build_code} PROPERTIES
        NO_SONAME YES CXX_VISIBILITY_PRESET hidden VISIBILITY_INLINES_HIDDEN YES)
endForeach()

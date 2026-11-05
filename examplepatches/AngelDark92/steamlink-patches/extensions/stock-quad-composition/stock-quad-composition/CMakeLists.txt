cmake_minimum_required(VERSION 3.22)
project(gxr_stock_quad_composition LANGUAGES CXX)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Native helper build type" FORCE)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# OpenXR-SDK checkout (1.1.43 matches the Alpha-0 layer's headers). Headers only.
set(OPENXR_SDK_SOURCE_DIR "" CACHE PATH "Path to an OpenXR-SDK checkout")
if(NOT EXISTS "${OPENXR_SDK_SOURCE_DIR}/include/openxr/openxr.h")
    message(FATAL_ERROR "Set OPENXR_SDK_SOURCE_DIR to an OpenXR-SDK checkout (include/openxr/openxr.h)")
endif()

add_library(gxr_stock_quad_v1 SHARED src/stock_quad_layer.cpp)
target_include_directories(gxr_stock_quad_v1 PRIVATE "${OPENXR_SDK_SOURCE_DIR}/include")
target_compile_definitions(gxr_stock_quad_v1 PRIVATE NDEBUG)
target_compile_options(gxr_stock_quad_v1 PRIVATE -O2 -ffunction-sections -fdata-sections)
# Only xrNegotiateLoaderApiLayerInterface may be exported (no libc++ re-exports).
target_link_options(gxr_stock_quad_v1 PRIVATE -Wl,--gc-sections -Wl,--exclude-libs,ALL)
target_link_libraries(gxr_stock_quad_v1 PRIVATE log)
set_target_properties(gxr_stock_quad_v1 PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    OUTPUT_NAME gxr_stock_quad
)
if(CMAKE_STRIP)
    add_custom_command(TARGET gxr_stock_quad_v1 POST_BUILD
        COMMAND "${CMAKE_STRIP}" --strip-unneeded "$<TARGET_FILE:gxr_stock_quad_v1>"
        COMMENT "Strip unneeded symbols from libgxr_stock_quad.so"
        VERBATIM
    )
endif()

cmake_minimum_required(VERSION 3.22)
project(gxr_controller_extrapolation LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(FetchContent)
FetchContent_Declare(
    openxr_headers
    GIT_REPOSITORY https://github.com/KhronosGroup/OpenXR-SDK.git
    GIT_TAG release-1.1.43
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(openxr_headers)

add_library(gxr_controller_extrapolation SHARED src/controller_extrapolation_layer.cpp)
target_link_libraries(gxr_controller_extrapolation PRIVATE OpenXR::headers log)
target_compile_definitions(gxr_controller_extrapolation PRIVATE XR_USE_PLATFORM_ANDROID)
target_link_options(gxr_controller_extrapolation PRIVATE
    -Wl,-z,max-page-size=16384 -Wl,--no-undefined -Wl,-s)
set_target_properties(gxr_controller_extrapolation PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    OUTPUT_NAME gxr_controller_extrapolation
)

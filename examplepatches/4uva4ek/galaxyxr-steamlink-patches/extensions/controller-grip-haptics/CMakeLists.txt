cmake_minimum_required(VERSION 3.22)
project(gxr_haptic_main LANGUAGES CXX)

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

add_library(gxr_haptic_main SHARED src/controller_grip_haptics_layer.cpp)
target_link_libraries(gxr_haptic_main PRIVATE OpenXR::headers log binder_ndk)
target_compile_definitions(gxr_haptic_main PRIVATE XR_USE_PLATFORM_ANDROID)
target_link_options(gxr_haptic_main PRIVATE
    -Wl,-z,max-page-size=16384 -Wl,--no-undefined -Wl,-s)
set_target_properties(gxr_haptic_main PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    OUTPUT_NAME gxr_haptic_main
)

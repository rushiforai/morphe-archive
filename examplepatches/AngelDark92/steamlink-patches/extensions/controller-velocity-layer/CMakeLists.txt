cmake_minimum_required(VERSION 3.22)
project(gxr_controller_velocity LANGUAGES CXX)

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

add_library(velocity_math STATIC src/velocity_math.cpp)
target_include_directories(velocity_math PUBLIC src)

add_library(gxr_controller_velocity SHARED src/controller_velocity_layer.cpp)
target_link_libraries(gxr_controller_velocity PRIVATE velocity_math OpenXR::headers)
target_compile_definitions(gxr_controller_velocity PRIVATE XR_USE_PLATFORM_ANDROID)
set_target_properties(gxr_controller_velocity PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    OUTPUT_NAME gxr_controller_velocity
)

if(ANDROID)
    target_link_libraries(gxr_controller_velocity PRIVATE log)
endif()

if(NOT ANDROID)
    enable_testing()
    add_executable(velocity_math_tests tests/velocity_math_tests.cpp)
    target_link_libraries(velocity_math_tests PRIVATE velocity_math)
    add_test(NAME velocity_math_tests COMMAND velocity_math_tests)
endif()
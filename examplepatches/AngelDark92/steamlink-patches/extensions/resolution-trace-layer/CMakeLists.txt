cmake_minimum_required(VERSION 3.22)
project(gxr_android_surface_trigger_passthrough LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(OPENXR_SDK_SOURCE_DIR "" CACHE PATH "Path to an OpenXR-SDK checkout")
if(NOT OPENXR_SDK_SOURCE_DIR)
    set(_bundled_sdk "${CMAKE_CURRENT_SOURCE_DIR}/../../../GalaxyXR-APK/tools-galaxyxr-native/OpenXR-SDK-1.1.61")
    if(EXISTS "${_bundled_sdk}/include/openxr/openxr.h")
        set(OPENXR_SDK_SOURCE_DIR "${_bundled_sdk}")
    endif()
endif()
if(NOT EXISTS "${OPENXR_SDK_SOURCE_DIR}/include/openxr/openxr.h")
    message(FATAL_ERROR "Set OPENXR_SDK_SOURCE_DIR to the bundled OpenXR-SDK 1.1.61 checkout")
endif()

add_library(gxr_android_surface_trigger_passthrough_v1 SHARED
    src/android_surface_trigger_passthrough_layer.cpp
)
target_include_directories(gxr_android_surface_trigger_passthrough_v1 PRIVATE
    "${OPENXR_SDK_SOURCE_DIR}/include"
)
target_compile_definitions(gxr_android_surface_trigger_passthrough_v1 PRIVATE
    XR_USE_PLATFORM_ANDROID
)
target_link_libraries(gxr_android_surface_trigger_passthrough_v1 PRIVATE log android)
set_target_properties(gxr_android_surface_trigger_passthrough_v1 PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    OUTPUT_NAME gxr_ast
)

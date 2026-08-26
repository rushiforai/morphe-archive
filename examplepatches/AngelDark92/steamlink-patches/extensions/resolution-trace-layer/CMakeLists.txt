cmake_minimum_required(VERSION 3.22)
project(gxr_projection_diagnostics LANGUAGES CXX)

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

function(add_gxr_projection_mode target output mode layer_name)
    add_library(${target} SHARED src/resolution_trace_layer.cpp)
    target_include_directories(${target} PRIVATE "${OPENXR_SDK_SOURCE_DIR}/include")
    target_compile_definitions(${target} PRIVATE
        XR_USE_PLATFORM_ANDROID
        XR_USE_GRAPHICS_API_OPENGL_ES
        GXR_PROJECTION_MODE=${mode}
        GXR_LAYER_NAME="${layer_name}"
    )
    target_link_libraries(${target} PRIVATE log EGL)
    set_target_properties(${target} PROPERTIES
        CXX_VISIBILITY_PRESET hidden
        VISIBILITY_INLINES_HIDDEN YES
        OUTPUT_NAME ${output}
    )
endfunction()

add_gxr_projection_mode(
    gxr_projection_trace_control
    gxr_projection_trace_control
    0
    XR_APILAYER_local_GalaxyXR_projection_trace_control
)
add_gxr_projection_mode(
    gxr_projection_settings_quality
    gxr_projection_settings_quality
    1
    XR_APILAYER_local_GalaxyXR_projection_settings_quality
)
add_gxr_projection_mode(
    gxr_projection_settings_stripped
    gxr_projection_settings_stripped
    2
    XR_APILAYER_local_GalaxyXR_projection_settings_stripped
)

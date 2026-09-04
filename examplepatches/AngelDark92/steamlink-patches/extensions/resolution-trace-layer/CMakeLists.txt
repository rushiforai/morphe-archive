cmake_minimum_required(VERSION 3.22)
project(gxr_android_surface_trigger_passthrough LANGUAGES CXX)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Native helper build type" FORCE)
endif()

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

function(add_gxr_surface_trigger_target target output_name source_projection_count)
    add_library(${target} SHARED
        src/android_surface_trigger_passthrough_layer.cpp
    )
    target_include_directories(${target} PRIVATE
        "${OPENXR_SDK_SOURCE_DIR}/include"
    )
    target_compile_definitions(${target} PRIVATE
        XR_USE_PLATFORM_ANDROID
        NDEBUG
        GXR_AST_SOURCE_PROJECTION_COUNT=${source_projection_count}
    )
    target_compile_options(${target} PRIVATE
        -O2
        -ffunction-sections
        -fdata-sections
    )
    target_link_options(${target} PRIVATE
        -Wl,--gc-sections
    )
    target_link_libraries(${target} PRIVATE log android)
    set_target_properties(${target} PROPERTIES
        CXX_VISIBILITY_PRESET hidden
        VISIBILITY_INLINES_HIDDEN YES
        OUTPUT_NAME ${output_name}
    )
    if(CMAKE_STRIP)
        add_custom_command(TARGET ${target} POST_BUILD
            COMMAND "${CMAKE_STRIP}" --strip-unneeded "$<TARGET_FILE:${target}>"
            COMMENT "Strip unneeded symbols from ${output_name}"
            VERBATIM
        )
    endif()
endfunction()

# Shipping helper: keep the validated terminal 2x2 quad on every eligible frame.
add_gxr_surface_trigger_target(
    gxr_android_surface_trigger_passthrough_v1
    gxr_ast
    3
)

# Exact Steam Link 2.0.20/5001712 helper: Valve submits 2 projection layers.
add_gxr_surface_trigger_target(
    gxr_android_surface_trigger_passthrough_5001712_v1
    gxr_ast_5001712
    2
)

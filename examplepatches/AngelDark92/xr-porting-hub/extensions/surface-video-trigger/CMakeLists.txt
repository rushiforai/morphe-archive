cmake_minimum_required(VERSION 3.22)
project(gxr_surface_video_trigger LANGUAGES CXX)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Native helper build type" FORCE)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(OPENXR_SDK_SOURCE_DIR "" CACHE PATH "Path to an OpenXR-SDK checkout")
if(NOT OPENXR_SDK_SOURCE_DIR)
    set(_bundled_sdk
        "${CMAKE_CURRENT_SOURCE_DIR}/../../../builds/steamlink-patches/extensions/controller-velocity-layer/build-android/_deps/openxr_headers-src")
    if(EXISTS "${_bundled_sdk}/include/openxr/openxr.h")
        set(OPENXR_SDK_SOURCE_DIR "${_bundled_sdk}")
    endif()
endif()
if(NOT EXISTS "${OPENXR_SDK_SOURCE_DIR}/include/openxr/openxr.h")
    message(FATAL_ERROR "Set OPENXR_SDK_SOURCE_DIR to an OpenXR SDK checkout")
endif()

add_library(gxr_surface_video_trigger SHARED
    src/surface_video_trigger.cpp
)
target_include_directories(gxr_surface_video_trigger PRIVATE
    "${OPENXR_SDK_SOURCE_DIR}/include"
)
target_compile_definitions(gxr_surface_video_trigger PRIVATE
    XR_USE_PLATFORM_ANDROID
    XR_USE_GRAPHICS_API_OPENGL_ES
    NDEBUG
    GXR_VIDEO_PROJECTIONS=2
    GXR_VIDEO_FP16=0
)
target_compile_options(gxr_surface_video_trigger PRIVATE
    -O2
    -ffunction-sections
    -fdata-sections
)
target_link_options(gxr_surface_video_trigger PRIVATE
    -Wl,--gc-sections
)
target_link_libraries(gxr_surface_video_trigger PRIVATE
    EGL
    GLESv3
    android
    nativewindow
    log
)
set_target_properties(gxr_surface_video_trigger PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    OUTPUT_NAME gxr_surface_video_trigger
)
if(CMAKE_STRIP)
    add_custom_command(TARGET gxr_surface_video_trigger POST_BUILD
        COMMAND "${CMAKE_STRIP}" --strip-unneeded "$<TARGET_FILE:gxr_surface_video_trigger>"
        COMMENT "Strip unneeded symbols from gxr_surface_video_trigger"
        VERBATIM
    )
endif()

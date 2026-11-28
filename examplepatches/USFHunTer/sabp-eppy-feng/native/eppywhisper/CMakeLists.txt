# eppy's on-device transcription engine: whisper.cpp (MIT, ggml-org/whisper.cpp v1.9.5) with a
# small JNI layer for app.morphe.extension.sabp.read.Whisper. Built for Android arm64 in CI and
# for the host (Linux x86_64) to test the JNI layer on the JVM.
#
# Two Android variants: "eppywhisper" (armv8-a, runs everywhere) and "eppywhisper_v82"
# (armv8.2-a + fp16 + dotprod, much faster); Whisper.java picks the fast one only when the CPU
# reports both features.
cmake_minimum_required(VERSION 3.16)
project(eppywhisper C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(WHISPER_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(WHISPER_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(WHISPER_BUILD_SERVER OFF CACHE BOOL "" FORCE)
set(GGML_OPENMP OFF CACHE BOOL "" FORCE)
set(GGML_NATIVE OFF CACHE BOOL "" FORCE)

set(EPPY_VARIANT_FLAGS "" CACHE STRING "extra -march flags for this build")
if (EPPY_VARIANT_FLAGS)
    add_compile_options(${EPPY_VARIANT_FLAGS})
endif()

if (NOT WHISPER_SRC)
    message(FATAL_ERROR "Set -DWHISPER_SRC=/path/to/whisper.cpp (v1.9.5)")
endif()
add_subdirectory(${WHISPER_SRC} whisper EXCLUDE_FROM_ALL)

set(EPPY_LIB_NAME "eppywhisper" CACHE STRING "output library name")
add_library(${EPPY_LIB_NAME} SHARED jni.c)
target_link_libraries(${EPPY_LIB_NAME} PRIVATE whisper)
if (ANDROID)
    find_library(LOG_LIB log)
    target_link_libraries(${EPPY_LIB_NAME} PRIVATE ${LOG_LIB})
    target_link_options(${EPPY_LIB_NAME} PRIVATE -Wl,--gc-sections -Wl,--exclude-libs,ALL -Wl,-z,max-page-size=16384)
else()
    find_package(JNI REQUIRED)
    target_include_directories(${EPPY_LIB_NAME} PRIVATE ${JNI_INCLUDE_DIRS})
endif()
target_compile_options(${EPPY_LIB_NAME} PRIVATE -O3 -fvisibility=hidden)

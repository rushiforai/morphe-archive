cmake_minimum_required(VERSION 3.20)
project(nogoogle_native C CXX)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(DEPS $ENV{HOME}/gb)

# whisper.cpp / ggml: generic ARMv8.2 build (dot-product + fp16) without OpenMP (no libomp in the app).
set(GGML_NATIVE OFF CACHE BOOL "" FORCE)
set(GGML_OPENMP OFF CACHE BOOL "" FORCE)
set(GGML_CPU_ARM_ARCH "armv8.2-a+dotprod+fp16" CACHE STRING "" FORCE)
option(NOGOOGLE_VULKAN "Build the ggml Vulkan backend" OFF)
set(GGML_VULKAN ${NOGOOGLE_VULKAN} CACHE BOOL "" FORCE)
set(WHISPER_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(WHISPER_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(WHISPER_SDL2 OFF CACHE BOOL "" FORCE)
add_subdirectory(${DEPS}/whisper.cpp whisper EXCLUDE_FROM_ALL)

# slimt: gemmology (int8 GEMM, NEON) + ruy (float), static PCRE2.
set(WITH_GEMMOLOGY ON CACHE BOOL "" FORCE)
set(WITH_RUY ON CACHE BOOL "" FORCE)
set(WITH_BLAS OFF CACHE BOOL "" FORCE)
set(USE_NEON ON CACHE BOOL "" FORCE)
set(BUILD_SHARED OFF CACHE BOOL "" FORCE)
set(BUILD_STATIC ON CACHE BOOL "" FORCE)
set(PCRE2_INCLUDE_DIR ${DEPS}/native-deps/include CACHE PATH "" FORCE)
set(PCRE2_LIBRARY ${DEPS}/native-deps/lib/libpcre2-8.a CACHE FILEPATH "" FORCE)
set(PCRE2_LIBRARIES ${DEPS}/native-deps/lib/libpcre2-8.a CACHE FILEPATH "" FORCE)
list(APPEND CMAKE_PREFIX_PATH ${DEPS}/xsimd/inst ${DEPS}/native-deps)
include_directories(${DEPS}/slimt ${CMAKE_BINARY_DIR}/slimt)
add_subdirectory(${DEPS}/slimt slimt EXCLUDE_FROM_ALL)

add_library(nogoogle_jni SHARED nogoogle_jni.cpp)
target_include_directories(nogoogle_jni PRIVATE ${DEPS}/slimt)
target_link_libraries(nogoogle_jni PRIVATE whisper slimt-static log)
target_link_options(nogoogle_jni PRIVATE
    -Wl,--gc-sections -Wl,--exclude-libs,ALL -Wl,-z,max-page-size=16384 -Wl,--build-id=sha1)
set_target_properties(nogoogle_jni PROPERTIES CXX_VISIBILITY_PRESET hidden)

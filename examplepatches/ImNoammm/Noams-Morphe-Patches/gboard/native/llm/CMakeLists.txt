cmake_minimum_required(VERSION 3.20)
project(nogoogle_llm C CXX)

# libnogoogle_llm.so: llama.cpp for on-device translation (HY-MT), kept separate from
# libnogoogle_jni.so so each library carries its own private ggml.
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(DEPS $ENV{HOME}/gb)

set(GGML_NATIVE OFF CACHE BOOL "" FORCE)
set(GGML_OPENMP OFF CACHE BOOL "" FORCE)
set(GGML_CPU_ARM_ARCH "armv8.2-a+dotprod+fp16" CACHE STRING "" FORCE)
set(LLAMA_BUILD_COMMON OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_TOOLS OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_SERVER OFF CACHE BOOL "" FORCE)
set(LLAMA_BUILD_APP OFF CACHE BOOL "" FORCE)
set(LLAMA_OPENSSL OFF CACHE BOOL "" FORCE)
add_subdirectory(${DEPS}/llama.cpp llama EXCLUDE_FROM_ALL)

add_library(nogoogle_llm SHARED llm_jni.cpp)
target_link_libraries(nogoogle_llm PRIVATE llama log)
target_link_options(nogoogle_llm PRIVATE
    -Wl,--gc-sections -Wl,--exclude-libs,ALL -Wl,-z,max-page-size=16384 -Wl,--build-id=sha1)
set_target_properties(nogoogle_llm PROPERTIES CXX_VISIBILITY_PRESET hidden)

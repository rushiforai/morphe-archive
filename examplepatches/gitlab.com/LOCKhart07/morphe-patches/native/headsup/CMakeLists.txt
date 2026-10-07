cmake_minimum_required(VERSION 3.22)
project(morphe_headsup C)

# Directory holding the unpacked ShadowHook AAR (prefab/modules/shadowhook/...).
set(SHADOWHOOK_DIR "" CACHE PATH "Unpacked ShadowHook AAR")
set(SHADOWHOOK_MODULE "${SHADOWHOOK_DIR}/prefab/modules/shadowhook")

add_library(shadowhook SHARED IMPORTED)
set_target_properties(shadowhook PROPERTIES
    IMPORTED_LOCATION "${SHADOWHOOK_MODULE}/libs/android.${ANDROID_ABI}/libshadowhook.so"
    INTERFACE_INCLUDE_DIRECTORIES "${SHADOWHOOK_MODULE}/include")

add_library(morphe_headsup SHARED bridge.c)
target_compile_options(morphe_headsup PRIVATE -Wall -Wextra -Werror -O2 -fvisibility=hidden)
target_link_libraries(morphe_headsup PRIVATE shadowhook log)
target_link_options(morphe_headsup PRIVATE -Wl,--gc-sections -Wl,-z,max-page-size=16384)

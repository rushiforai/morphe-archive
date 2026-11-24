cmake_minimum_required(VERSION 3.24)

project(turbojpeg_vendor LANGUAGES C)

include(FetchContent)

set(ENABLE_SHARED OFF CACHE BOOL "" FORCE)
set(ENABLE_STATIC ON CACHE BOOL "" FORCE)
set(WITH_TURBOJPEG ON CACHE BOOL "" FORCE)
set(WITH_JAVA OFF CACHE BOOL "" FORCE)
set(WITH_FUZZ OFF CACHE BOOL "" FORCE)
set(CMAKE_POSITION_INDEPENDENT_CODE ON CACHE BOOL "" FORCE)

set(LJT_VERSION "3.1.1")
set(LJT_SHA256 "aadc97ea91f6ef078b0ae3a62bba69e008d9a7db19b34e4ac973b19b71b4217c")
set(LJT_URL "https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/${LJT_VERSION}/libjpeg-turbo-${LJT_VERSION}.tar.gz")
set(LJT_DOWNLOAD_DIR "${CMAKE_CURRENT_BINARY_DIR}/downloads")
set(LJT_ARCHIVE "${LJT_DOWNLOAD_DIR}/libjpeg-turbo-${LJT_VERSION}.tar.gz")
set(LJT_SOURCE_ROOT "${LJT_DOWNLOAD_DIR}/libjpeg-turbo-${LJT_VERSION}")

file(MAKE_DIRECTORY "${LJT_DOWNLOAD_DIR}")

# A cached archive is re-verified on every configure. Never promote a partial
# download: the transfer goes to `.part` and is renamed only after the
# expected hash matches.
if(EXISTS "${LJT_ARCHIVE}")
    file(SHA256 "${LJT_ARCHIVE}" LJT_CACHED_HASH)
    if(NOT "${LJT_CACHED_HASH}" STREQUAL "${LJT_SHA256}")
        message(STATUS "Discarding libjpeg-turbo archive with mismatched hash")
        file(REMOVE "${LJT_ARCHIVE}")
    endif()
endif()

if(NOT EXISTS "${LJT_ARCHIVE}")
    file(DOWNLOAD
        "${LJT_URL}" "${LJT_ARCHIVE}.part"
        EXPECTED_HASH SHA256=${LJT_SHA256}
        TLS_VERIFY ON
        TIMEOUT 120
        STATUS LJT_DOWNLOAD_STATUS
        LOG LJT_DOWNLOAD_LOG
    )
    list(GET LJT_DOWNLOAD_STATUS 0 LJT_DOWNLOAD_CODE)
    if(NOT "${LJT_DOWNLOAD_CODE}" EQUAL 0)
        file(REMOVE "${LJT_ARCHIVE}.part")
        message(FATAL_ERROR "Could not download ${LJT_URL}: ${LJT_DOWNLOAD_LOG}")
    endif()
    file(RENAME "${LJT_ARCHIVE}.part" "${LJT_ARCHIVE}")
endif()

if(NOT EXISTS "${LJT_SOURCE_ROOT}/CMakeLists.txt")
    set(LJT_EXTRACT_TMP "${LJT_DOWNLOAD_DIR}/extract-tmp")
    file(REMOVE_RECURSE "${LJT_EXTRACT_TMP}")
    file(MAKE_DIRECTORY "${LJT_EXTRACT_TMP}")
    file(ARCHIVE_EXTRACT INPUT "${LJT_ARCHIVE}" DESTINATION "${LJT_EXTRACT_TMP}")
    file(REMOVE_RECURSE "${LJT_SOURCE_ROOT}")
    file(RENAME
        "${LJT_EXTRACT_TMP}/libjpeg-turbo-${LJT_VERSION}"
        "${LJT_SOURCE_ROOT}"
    )
    file(REMOVE_RECURSE "${LJT_EXTRACT_TMP}")
endif()

# libjpeg-turbo refuses `add_subdirectory` integration by design. This patch
# only removes that build-system guard; codec sources are untouched.
execute_process(
    COMMAND ${CMAKE_COMMAND} -DSRC_DIR=${LJT_SOURCE_ROOT}
            -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake/patch_libjpeg.cmake"
    RESULT_VARIABLE LJT_PATCH_RESULT
)
if(NOT "${LJT_PATCH_RESULT}" EQUAL 0)
    message(FATAL_ERROR "Failed to prepare libjpeg-turbo for FetchContent integration")
endif()

FetchContent_Declare(libjpeg-turbo SOURCE_DIR "${LJT_SOURCE_ROOT}")
FetchContent_MakeAvailable(libjpeg-turbo)

# `turbojpeg-static` includes the libjpeg API objects, so linking this one
# archive is sufficient for the TurboJPEG C API.
if(TARGET turbojpeg-static)
    set_target_properties(turbojpeg-static PROPERTIES OUTPUT_NAME turbojpeg)
endif()

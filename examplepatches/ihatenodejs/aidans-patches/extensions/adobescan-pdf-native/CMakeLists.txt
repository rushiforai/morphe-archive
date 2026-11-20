cmake_minimum_required(VERSION 3.24)

if(ANDROID)
    set(CMAKE_DISABLE_FIND_PACKAGE_PkgConfig ON CACHE BOOL "" FORCE)
    set(PKG_CONFIG_EXECUTABLE "PKG_CONFIG_EXECUTABLE-NOTFOUND" CACHE FILEPATH "" FORCE)
endif()

# Enforce CMP0135 if available (download timestamps)
if(POLICY CMP0135)
    cmake_policy(SET CMP0135 NEW)
endif()

project(adobescan_pdf_native C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

option(AIDAN_SCAN_PDF_HOST_TESTS "Build native host test runner" OFF)

include(FetchContent)

# -----------------------------------------------------------------------------
# libjpeg-turbo 3.2.0
# -----------------------------------------------------------------------------
set(ENABLE_SHARED OFF CACHE BOOL "" FORCE)
set(ENABLE_STATIC ON CACHE BOOL "" FORCE)
set(CMAKE_POSITION_INDEPENDENT_CODE ON CACHE BOOL "" FORCE)
set(WITH_TURBOJPEG OFF CACHE BOOL "" FORCE)
set(WITH_TOOLS OFF CACHE BOOL "" FORCE)
set(WITH_TESTS OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    libjpeg-turbo
    URL https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/3.2.0/libjpeg-turbo-3.2.0.tar.gz
    URL_HASH SHA256=6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e841b0841f09878e
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    PATCH_COMMAND ${CMAKE_COMMAND} -DSRC_DIR=<SOURCE_DIR> -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake/patch_libjpeg.cmake"
)
FetchContent_MakeAvailable(libjpeg-turbo)

if(TARGET jpeg-static)
    if(NOT TARGET jpeg)
        add_library(jpeg ALIAS jpeg-static)
    endif()
    if(NOT TARGET JPEG::JPEG)
        add_library(JPEG::JPEG ALIAS jpeg-static)
    endif()
    target_include_directories(jpeg-static INTERFACE
        $<BUILD_INTERFACE:${libjpeg-turbo_SOURCE_DIR}/src>
        $<BUILD_INTERFACE:${libjpeg-turbo_BINARY_DIR}>
    )
endif()

# -----------------------------------------------------------------------------
# qpdf 12.4.2
# -----------------------------------------------------------------------------
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(BUILD_STATIC_LIBS ON CACHE BOOL "" FORCE)
set(USE_IMPLICIT_CRYPTO OFF CACHE BOOL "" FORCE)
set(REQUIRE_CRYPTO_NATIVE ON CACHE BOOL "" FORCE)
set(ENABLE_CLI OFF CACHE BOOL "" FORCE)
set(BUILD_DOC OFF CACHE BOOL "" FORCE)
set(INSTALL_MANUAL OFF CACHE BOOL "" FORCE)
set(BUILD_TESTING OFF CACHE BOOL "" FORCE)
set(CMAKE_POSITION_INDEPENDENT_CODE ON CACHE BOOL "" FORCE)

# Direct qpdf to the in-tree libjpeg-turbo
set(LIBJPEG_H_PATH "${libjpeg-turbo_SOURCE_DIR}/src;${libjpeg-turbo_BINARY_DIR}" CACHE STRING "" FORCE)
set(LIBJPEG_LIB_PATH "jpeg-static" CACHE STRING "" FORCE)
FetchContent_Declare(
    qpdf
    URL https://github.com/qpdf/qpdf/releases/download/v12.4.2/qpdf-12.4.2.tar.gz
    URL_HASH SHA256=8a58af5b6141319287c1883bec8bd1bd545b7567b7fc5e6ce5d25a1c85f36397
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    PATCH_COMMAND ${CMAKE_COMMAND} -DSRC_DIR=<SOURCE_DIR> -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake/patch_qpdf.cmake"
)
FetchContent_MakeAvailable(qpdf)

if(TARGET libqpdf AND NOT TARGET qpdf)
    add_library(qpdf ALIAS libqpdf)
endif()


# -----------------------------------------------------------------------------
# leptonica 1.85.0
# -----------------------------------------------------------------------------
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(BUILD_PROG OFF CACHE BOOL "" FORCE)
set(SW_BUILD OFF CACHE BOOL "" FORCE)
set(ENABLE_ZLIB ON CACHE BOOL "" FORCE)
set(ENABLE_PNG OFF CACHE BOOL "" FORCE)
set(ENABLE_JPEG OFF CACHE BOOL "" FORCE)
set(ENABLE_GIF OFF CACHE BOOL "" FORCE)
set(ENABLE_TIFF OFF CACHE BOOL "" FORCE)
set(ENABLE_WEBP OFF CACHE BOOL "" FORCE)
set(ENABLE_OPENJPEG OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    leptonica
    URL https://github.com/DanBloomberg/leptonica/releases/download/1.85.0/leptonica-1.85.0.tar.gz
    URL_HASH SHA256=3745ae3bf271a6801a2292eead83ac926e3a9bc1bf622e9cd4dd0f3786e17205
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    PATCH_COMMAND ${CMAKE_COMMAND} -DSRC_DIR=<SOURCE_DIR> -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake/patch_leptonica.cmake"
)
FetchContent_MakeAvailable(leptonica)

# -----------------------------------------------------------------------------
# tesseract 5.5.1
# -----------------------------------------------------------------------------
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(BUILD_TRAINING_TOOLS OFF CACHE BOOL "" FORCE)
set(BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(ENABLE_LTO OFF CACHE BOOL "" FORCE)
set(ENABLE_OPENMP OFF CACHE BOOL "" FORCE)
set(ENABLE_CURL OFF CACHE BOOL "" FORCE)
set(ENABLE_ARCHIVE OFF CACHE BOOL "" FORCE)
set(GRAPHICS_DISABLED ON CACHE BOOL "" FORCE)
set(DISABLE_CURL ON CACHE BOOL "" FORCE)
set(DISABLE_ARCHIVE ON CACHE BOOL "" FORCE)
set(FAST_FLOAT ON CACHE BOOL "" FORCE)
set(SW_BUILD OFF CACHE BOOL "" FORCE)

FetchContent_Declare(
    tesseract
    URL https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.5.1.tar.gz
    URL_HASH SHA256=a7a3f2a7420cb6a6a94d80c24163e183cf1d2f1bed2df3bbc397c81808a57237
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    PATCH_COMMAND ${CMAKE_COMMAND} -DSRC_DIR=<SOURCE_DIR> -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake/patch_tesseract.cmake"
)
FetchContent_MakeAvailable(tesseract)
# Common includes
set(AIDAN_SCAN_PDF_INCLUDES
    "${CMAKE_CURRENT_SOURCE_DIR}/src"
    "${libjpeg-turbo_SOURCE_DIR}/src"
    "${libjpeg-turbo_BINARY_DIR}"
)

# -----------------------------------------------------------------------------
# Android Target
# -----------------------------------------------------------------------------
if(ANDROID OR CMAKE_SYSTEM_NAME STREQUAL "Android")
    add_library(aidanscanpdf SHARED
        src/pdf_engine.cpp
        src/jni.cpp
    )

    target_include_directories(aidanscanpdf PRIVATE ${AIDAN_SCAN_PDF_INCLUDES})
    target_compile_options(aidanscanpdf PRIVATE -fvisibility=hidden -Wall -Wextra -Werror)
    target_link_options(aidanscanpdf PRIVATE -Wl,-z,max-page-size=16384)

    target_link_libraries(aidanscanpdf PRIVATE
        libqpdf
        jpeg-static
        libtesseract
        leptonica
        z
        log
        jnigraphics
    )
endif()

# -----------------------------------------------------------------------------
# Host Tests
# -----------------------------------------------------------------------------
if(AIDAN_SCAN_PDF_HOST_TESTS)
    enable_testing()

    add_library(aidanscanpdf_static STATIC
        src/pdf_engine.cpp
    )
    target_include_directories(aidanscanpdf_static PUBLIC ${AIDAN_SCAN_PDF_INCLUDES})
    target_compile_options(aidanscanpdf_static PRIVATE -fvisibility=hidden -Wall -Wextra -Werror)
    target_link_libraries(aidanscanpdf_static PUBLIC
        libqpdf
        jpeg-static
    )

    add_executable(adobescan_pdf_test
        tests/test_runner.cpp
    )
    target_include_directories(adobescan_pdf_test PRIVATE ${AIDAN_SCAN_PDF_INCLUDES})
    target_compile_options(adobescan_pdf_test PRIVATE -Wall -Wextra -Werror)

    find_package(ZLIB REQUIRED)
    target_link_libraries(adobescan_pdf_test PRIVATE
        aidanscanpdf_static
        libqpdf
        jpeg-static
        ZLIB::ZLIB
    )

    add_test(NAME adobescan_pdf_test COMMAND adobescan_pdf_test)
endif()

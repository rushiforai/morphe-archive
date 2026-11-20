file(READ "${SRC_DIR}/CMakeLists.txt" CONTENT)

# 1. Replace Leptonica find_package and tiff check
set(LEPT_FIND "find_package(PkgConfig)
  # Check for required library. option -DLeptonica_DIR=path => cmake hint where
  # to find leptonica
  find_package(Leptonica \${MINIMUM_LEPTONICA_VERSION} CONFIG)
  if(NOT Leptonica_FOUND AND PKG_CONFIG_EXECUTABLE)
    pkg_check_modules(Leptonica lept>=\${MINIMUM_LEPTONICA_VERSION})
    link_directories(\${Leptonica_LIBRARY_DIRS})
  endif()
  if(NOT Leptonica_FOUND)
    message(FATAL_ERROR \"Cannot find required library Leptonica. Quitting!\")
  else()
    message(STATUS \"Found leptonica version: \${Leptonica_VERSION}\")
  endif(NOT Leptonica_FOUND)
  include_directories(\${Leptonica_INCLUDE_DIRS})

  check_leptonica_tiff_support()
  if ((NOT LEPT_TIFF_RESULT EQUAL 0) AND LEPT_TIFF_COMPILE_SUCCESS)
    message(NOTICE \"Leptonica was build without TIFF support! Disabling TIFF support...\")
    set(DISABLE_TIFF ON)
  elseif(NOT \${CMAKE_VERSION} VERSION_LESS \"3.25\")
    message(STATUS \"Leptonica was build with TIFF support.\")
  endif()")

set(LEPT_REPLACE "set(Leptonica_FOUND TRUE)
  set(Leptonica_VERSION \"1.85.0\")
  set(Leptonica_LIBRARIES leptonica)
  set(DISABLE_TIFF ON)")

string(REPLACE "${LEPT_FIND}" "${LEPT_REPLACE}" CONTENT "${CONTENT}")

# 2. Disable Android CpuFeaturesNdkCompat requirement
set(ANDROID_CPU_FIND "if(ANDROID)
  add_definitions(-DANDROID)
  find_package(CpuFeaturesNdkCompat REQUIRED)
  target_include_directories(
    libtesseract
    PRIVATE \"\${CpuFeaturesNdkCompat_DIR}/../../../include/ndk_compat\")
  target_link_libraries(libtesseract PRIVATE CpuFeatures::ndk_compat)
endif()")

set(ANDROID_CPU_REPLACE "if(ANDROID)
  add_definitions(-DANDROID)
endif()")

string(REPLACE "${ANDROID_CPU_FIND}" "${ANDROID_CPU_REPLACE}" CONTENT "${CONTENT}")

# 3. Disable tesseract executable and its installation
string(REPLACE "add_executable(tesseract src/tesseract.cpp)" "# add_executable(tesseract src/tesseract.cpp)" CONTENT "${CONTENT}")
string(REPLACE "target_link_libraries(tesseract libtesseract)" "# target_link_libraries(tesseract libtesseract)" CONTENT "${CONTENT}")
string(REPLACE "install(TARGETS tesseract DESTINATION bin)" "# install(TARGETS tesseract DESTINATION bin)" CONTENT "${CONTENT}")

# 4. Make libtesseract include directories public
string(REPLACE
    "target_link_libraries(libtesseract PUBLIC \${Leptonica_LIBRARIES})"
    "target_link_libraries(libtesseract PUBLIC \${Leptonica_LIBRARIES})\ntarget_include_directories(libtesseract PUBLIC \"$<BUILD_INTERFACE:\${CMAKE_CURRENT_SOURCE_DIR}/include>\" \"$<BUILD_INTERFACE:\${CMAKE_CURRENT_BINARY_DIR}/include>\")"
    CONTENT
    "${CONTENT}"
)

file(WRITE "${SRC_DIR}/CMakeLists.txt" "${CONTENT}")

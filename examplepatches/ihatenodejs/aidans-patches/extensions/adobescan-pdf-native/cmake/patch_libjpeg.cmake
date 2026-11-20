file(READ "${SRC_DIR}/CMakeLists.txt" CONTENT)
string(REPLACE "message(FATAL_ERROR \"The \${CMAKE_PROJECT_NAME} build system cannot be integrated into another build system using add_subdirectory().  Use ExternalProject_Add() instead.\")" "message(STATUS \"libjpeg-turbo integrated via FetchContent\")" NEW_CONTENT "${CONTENT}")
file(WRITE "${SRC_DIR}/CMakeLists.txt" "${NEW_CONTENT}")

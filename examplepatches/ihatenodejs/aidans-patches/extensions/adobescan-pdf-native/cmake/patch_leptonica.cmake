# Patch leptonica to export headers to its target
file(READ "${SRC_DIR}/src/CMakeLists.txt" CONTENT)
string(REPLACE
    "add_library                     (leptonica \${src} \${hdr})"
    "add_library                     (leptonica \${src} \${hdr})\ntarget_include_directories(leptonica PUBLIC \"$<BUILD_INTERFACE:\${CMAKE_CURRENT_SOURCE_DIR}>\" \"$<BUILD_INTERFACE:\${CMAKE_CURRENT_BINARY_DIR}>\")\nfile(MAKE_DIRECTORY \"\${CMAKE_CURRENT_BINARY_DIR}/include/leptonica\")\nfile(COPY \${hdr} DESTINATION \"\${CMAKE_CURRENT_BINARY_DIR}/include/leptonica\")\ntarget_include_directories(leptonica PUBLIC \"$<BUILD_INTERFACE:\${CMAKE_CURRENT_BINARY_DIR}/include>\")"
    CONTENT
    "${CONTENT}"
)
file(WRITE "${SRC_DIR}/src/CMakeLists.txt" "${CONTENT}")

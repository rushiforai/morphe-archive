cmake_minimum_required(VERSION 3.16)
project(gxr_stock_quad_host_tests LANGUAGES CXX)

enable_testing()

# Host tests compile the production header and layer source with Android/OpenXR-runtime
# calls replaced by the fakes in the test files. OpenXR headers only; no SDK build needed.
set(OPENXR_SDK_SOURCE_DIR "" CACHE PATH "OpenXR SDK checkout with include/openxr headers")
if(NOT EXISTS "${OPENXR_SDK_SOURCE_DIR}/include/openxr/openxr.h")
    message(FATAL_ERROR "Set OPENXR_SDK_SOURCE_DIR to an OpenXR-SDK checkout")
endif()

foreach(test_name IN ITEMS stock_quad_core_tests stock_quad_layer_tests)
    add_executable(${test_name} ${test_name}.cpp)
    target_compile_features(${test_name} PRIVATE cxx_std_17)
    target_include_directories(${test_name} PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/stubs"
        "${OPENXR_SDK_SOURCE_DIR}/include")
    # Checks stay enabled in Release builds (CHECK never relies on assert/NDEBUG).
    add_test(NAME ${test_name} COMMAND ${test_name})
    set_tests_properties(${test_name} PROPERTIES TIMEOUT 30)
endforeach()

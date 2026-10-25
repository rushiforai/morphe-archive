cmake_minimum_required(VERSION 3.16)
project(gxr_resolution_host_tests LANGUAGES CXX)

enable_testing()
find_package(Threads REQUIRED)

# The real registry is platform-independent. These tests need neither an Android
# toolchain nor OpenXR headers, and their checks remain enabled in Release builds.
add_executable(session_registry_tests session_registry_tests.cpp)
target_compile_features(session_registry_tests PRIVATE cxx_std_17)
target_link_libraries(session_registry_tests PRIVATE Threads::Threads)
add_test(NAME session_registry_tests COMMAND session_registry_tests)
set_tests_properties(session_registry_tests PROPERTIES TIMEOUT 30)

# Optional production-layer integration tests use the SDK headers and host Android
# stubs. Keep the registry suite independently runnable without an SDK checkout.
set(OPENXR_SDK_SOURCE_DIR "" CACHE PATH "OpenXR SDK checkout with include/openxr headers")
if(OPENXR_SDK_SOURCE_DIR)
    foreach(projection_count IN ITEMS 2 3)
        set(test_target surface_trigger_tests_${projection_count})
        add_executable(${test_target} surface_trigger_tests.cpp)
        target_compile_features(${test_target} PRIVATE cxx_std_17)
        target_include_directories(${test_target} PRIVATE
            "${CMAKE_CURRENT_SOURCE_DIR}/stubs"
            "${OPENXR_SDK_SOURCE_DIR}/include")
        target_compile_definitions(${test_target} PRIVATE
            XR_USE_PLATFORM_ANDROID
            GXR_AST_SOURCE_PROJECTION_COUNT=${projection_count})
        target_link_libraries(${test_target} PRIVATE Threads::Threads)
        add_test(NAME ${test_target} COMMAND ${test_target})
        set_tests_properties(${test_target} PROPERTIES TIMEOUT 30)
    endforeach()

    # Exact 2.0.20/5001712 alpha-0 trial: the actual shipping source must keep
    # the 2-to-3 layer topology and write a zero alpha byte.
    add_executable(surface_trigger_tests_2_alpha0 surface_trigger_tests.cpp)
    target_compile_features(surface_trigger_tests_2_alpha0 PRIVATE cxx_std_17)
    target_include_directories(surface_trigger_tests_2_alpha0 PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/stubs"
        "${OPENXR_SDK_SOURCE_DIR}/include")
    target_compile_definitions(surface_trigger_tests_2_alpha0 PRIVATE
        XR_USE_PLATFORM_ANDROID
        GXR_AST_SOURCE_PROJECTION_COUNT=2
        GXR_AST_TRIGGER_ALPHA=0)
    target_link_libraries(surface_trigger_tests_2_alpha0 PRIVATE Threads::Threads)
    add_test(NAME surface_trigger_tests_2_alpha0 COMMAND surface_trigger_tests_2_alpha0)
    set_tests_properties(surface_trigger_tests_2_alpha0 PROPERTIES TIMEOUT 30)
endif()

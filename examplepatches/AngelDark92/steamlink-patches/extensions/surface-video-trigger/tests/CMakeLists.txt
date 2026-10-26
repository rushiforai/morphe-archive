cmake_minimum_required(VERSION 3.16)
project(gxr_surface_video_trigger_host_tests LANGUAGES CXX)

enable_testing()

set(OPENXR_SDK_SOURCE_DIR "" CACHE PATH "OpenXR SDK checkout with include/openxr headers")
if(OPENXR_SDK_SOURCE_DIR)
    add_executable(surface_video_frame_tests surface_video_frame_tests.cpp)
    target_compile_features(surface_video_frame_tests PRIVATE cxx_std_17)
    target_include_directories(surface_video_frame_tests PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/../../resolution-trace-layer/tests/stubs"
        "${OPENXR_SDK_SOURCE_DIR}/include")
    add_test(NAME surface_video_frame_tests COMMAND surface_video_frame_tests)
    set_tests_properties(surface_video_frame_tests PROPERTIES TIMEOUT 30)

    add_executable(surface_video_policy_tests surface_video_policy_tests.cpp)
    target_compile_features(surface_video_policy_tests PRIVATE cxx_std_17)
    target_include_directories(surface_video_policy_tests PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}/../../resolution-trace-layer/tests/stubs"
        "${OPENXR_SDK_SOURCE_DIR}/include")
    add_test(NAME surface_video_policy_tests COMMAND surface_video_policy_tests)
    set_tests_properties(surface_video_policy_tests PROPERTIES TIMEOUT 30)
endif()

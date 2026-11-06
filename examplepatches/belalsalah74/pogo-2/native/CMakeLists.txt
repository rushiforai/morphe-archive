cmake_minimum_required(VERSION 3.22.1)
project(pgo C)
set(CMAKE_C_STANDARD 11)

add_library(pgo_hook SHARED libpgo_hook.c)
add_library(pgo_main SHARED libmain_wrapper.c)
set_target_properties(pgo_main PROPERTIES OUTPUT_NAME main) # -> libmain.so

foreach(t pgo_hook pgo_main)
  target_compile_options(${t} PRIVATE -O2 -Wall -Wextra -fvisibility=hidden)
  target_link_libraries(${t} log dl)
  # 16 KB page alignment (Android 15+ devices)
  target_link_options(${t} PRIVATE -Wl,-z,max-page-size=16384 -Wl,-z,now)
endforeach()

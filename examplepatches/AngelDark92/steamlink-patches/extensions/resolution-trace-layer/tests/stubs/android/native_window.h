#pragma once
#include <cstdint>
struct ANativeWindow {};
struct ANativeWindow_Buffer {
    int32_t width{}, height{}, stride{}, format{};
    void* bits{};
};
constexpr int WINDOW_FORMAT_RGBA_8888 = 1;
void ANativeWindow_release(ANativeWindow*);
int ANativeWindow_setBuffersGeometry(ANativeWindow*, int32_t, int32_t, int32_t);
int ANativeWindow_lock(ANativeWindow*, ANativeWindow_Buffer*, void*);
int ANativeWindow_unlockAndPost(ANativeWindow*);

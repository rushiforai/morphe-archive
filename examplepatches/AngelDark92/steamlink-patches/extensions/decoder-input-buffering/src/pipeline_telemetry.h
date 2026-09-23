#pragma once
#include "install_hooks.h"
#include <cstdint>

namespace gxr::pipeline {
// No decoder/helper mutex is acquired here, including on output callbacks.
#ifdef GXR_DBUF_HOST_TEST
inline void enable(bool) {}
inline void bind(dbuf::HookBindings&) {}
inline void event(const char*, int64_t = -1, int64_t = 0, int64_t = 0, int64_t = 0) {}
struct Scope { Scope(const char*, int64_t = -1) {} };
struct Frame { explicit Frame(uint32_t) {} };
#else
void enable(bool enabled);
void bind(dbuf::HookBindings& bindings);
void event(const char* stage, int64_t frame = -1, int64_t a = 0, int64_t b = 0, int64_t c = 0);
struct Scope {
    explicit Scope(const char* stage, int64_t frame = -1);
    ~Scope();
    Scope(const Scope&) = delete;
    Scope& operator=(const Scope&) = delete;
private:
    bool active;
};
struct Frame {
    explicit Frame(uint32_t frame);
    ~Frame();
private:
    int64_t previous;
};
#endif
}

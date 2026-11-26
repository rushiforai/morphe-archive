#pragma once

#include <cstdint>
#include <cstring>
#include <sys/mman.h>
#include <unistd.h>
#include <android/log.h>

namespace arm64_hook {

// Allocates a single RWX page for all trampolines (each trampoline uses 32 bytes).
inline uint8_t* alloc_trampoline_slot() {
    static uint8_t* pool = nullptr;
    static size_t used = 0;
    static size_t page_sz = 0;
    if (!pool) {
        page_sz = static_cast<size_t>(sysconf(_SC_PAGESIZE));
        if (page_sz < 4096) page_sz = 4096;
        void* p = mmap(nullptr, page_sz, PROT_READ | PROT_WRITE | PROT_EXEC,
                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (p == MAP_FAILED) return nullptr;
        pool = static_cast<uint8_t*>(p);
        used = 0;
    }
    if (used + 32 > page_sz) return nullptr;
    uint8_t* slot = pool + used;
    used += 32;
    return slot;
}

// Writes an absolute 16-byte ARM64 jump:
//   LDR X16, #8   (0x58000050)
//   BR  X16       (0xD61F0200)
//   .quad target
inline void write_abs_jump(void* dst, void* target) {
    uint32_t* code = static_cast<uint32_t*>(dst);
    code[0] = 0x58000050u; // LDR X16, .+8
    code[1] = 0xD61F0200u; // BR X16
    uint64_t addr = reinterpret_cast<uint64_t>(target);
    std::memcpy(code + 2, &addr, sizeof(addr));
}

// Hooks a function whose first 4 instructions (16 bytes) are position-independent.
// Returns true on success and stores the callable trampoline pointer in *out_orig.
template <typename Fn>
bool install(void* target, Fn replacement, Fn* out_orig) {
    if (!target || !replacement || !out_orig) return false;

    uint8_t* tramp = alloc_trampoline_slot();
    if (!tramp) return false;

    // Copy original 4 instructions (16 bytes) into trampoline
    std::memcpy(tramp, target, 16);
    // Append jump back to target + 16
    write_abs_jump(tramp + 16, static_cast<uint8_t*>(target) + 16);
    __builtin___clear_cache(reinterpret_cast<char*>(tramp),
                            reinterpret_cast<char*>(tramp + 32));

    // Make target page(s) writable
    uintptr_t page_sz = static_cast<uintptr_t>(sysconf(_SC_PAGESIZE));
    if (page_sz < 4096) page_sz = 4096;
    uintptr_t start = reinterpret_cast<uintptr_t>(target) & ~(page_sz - 1);
    uintptr_t end = (reinterpret_cast<uintptr_t>(target) + 16 + page_sz - 1) & ~(page_sz - 1);
    size_t len = static_cast<size_t>(end - start);

    if (mprotect(reinterpret_cast<void*>(start), len, PROT_READ | PROT_WRITE | PROT_EXEC) != 0) {
        return false;
    }

    write_abs_jump(target, reinterpret_cast<void*>(replacement));
    __builtin___clear_cache(reinterpret_cast<char*>(target),
                            reinterpret_cast<char*>(target) + 16);

    mprotect(reinterpret_cast<void*>(start), len, PROT_READ | PROT_EXEC);

    *out_orig = reinterpret_cast<Fn>(tramp);
    return true;
}

} // namespace arm64_hook

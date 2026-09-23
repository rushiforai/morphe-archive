#include "install_hooks.h"
#include "fec_guard_compat.h"

#include <android/log.h>
#include <atomic>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include <elf.h>
#include <link.h>
#include <limits>
#include <sys/mman.h>
#include <unistd.h>

namespace gxr::dbuf {
namespace {

static_assert(sizeof(void*) == 8, "The audited decoder layouts require arm64 pointers");
constexpr char kTag[] = "GXRDecoderBuffer";
constexpr std::size_t kSlotCount = 11;
constexpr std::size_t kNativeHookCount = 8;
constexpr std::size_t kMaxSlotCount = kSlotCount + 7;
constexpr std::size_t kMaxPages = kMaxSlotCount;
struct Function { std::uintptr_t va; std::size_t size; std::uint64_t fnv; };
struct Slot { std::uintptr_t va; HookId id; };

// Generated from actual function bytes recorded by decoder-hook-layouts.json.
// FNV checks complete code here; the APK installer also checks SHA-256.
// AcceptPacket alone permits the exact duplicate-guard instruction, normalized
// to stock before the complete function is checked.
#if GXR_BUILD_CODE == 5002322
constexpr unsigned char kBuildId[20] = {
    0x58,0x5d,0x88,0xd6,0x46,0xa8,0xc6,0xef,0xe9,0x4b,
    0xdd,0x9f,0xc6,0xc9,0xdb,0xbc,0x68,0xfc,0x13,0xba};
constexpr Function kFunctions[kNativeHookCount] = {
    {0xfd110,0xf8,0x40034be38d07dfc3ULL},
    {0xfd208,0x2a4,0x20bafaa65d1bfa01ULL},
    {0xfc928,0x3fc,0xeb909bc5729bd084ULL},
    {0xfd81c,0x140,0xf86bab7e1015220bULL},
    {0xfd95c,0x1cc,0xff4bfec8b474c441ULL},
    {0xfdb28,0xd4,0xb74824191a6dfc65ULL},
    {0x166ecc,0x180,0x1c3bc1c71ca78655ULL},
    {0x167050,0x294,0x9a55ea26b84322b3ULL}};
constexpr Slot kSlots[kMaxSlotCount] = {
    {0x222a60,HookId::Acquire}, {0x222a58,HookId::Submit},
    {0x222a50,HookId::Init}, {0x222a78,HookId::Flush},
    {0x222a80,HookId::Stop}, {0x22d6c8,HookId::Stop},
    {0x222a40,HookId::Destructor}, {0x22d6e8,HookId::Destructor},
    {0x22f208,HookId::Periodic},
    {0x224e78,HookId::AcceptPacket}, {0x224f70,HookId::AcceptPacket},
    {0x22d660,HookId::DequeueInput}, {0x22d670,HookId::QueueInput},
    {0x22d640,HookId::DequeueOutput}, {0x22d648,HookId::ReleaseOutput},
    {0x22d680,HookId::AcquireLatestImage}, {0x22d688,HookId::ImageTimestamp},
    {0x22d658,HookId::NativeFault}};
constexpr Function kFaultFunction{0x165fb8,0xc,0x1332d003845cad11ULL};
#elif GXR_BUILD_CODE == 5002363
constexpr unsigned char kBuildId[20] = {
    0xc3,0x1b,0xb9,0x79,0x12,0x3b,0x76,0x73,0x69,0x30,
    0xd3,0xc8,0x20,0xd8,0xd0,0x61,0x9f,0xb5,0xbe,0xd2};
constexpr Function kFunctions[kNativeHookCount] = {
    {0xfded8,0xf8,0x6d1678c899b6672aULL},
    {0xfdfd0,0x2a4,0xe0f694e071a5887cULL},
    {0xfd6f0,0x3fc,0x5a4b00256043ab3bULL},
    {0xfe5e4,0x140,0x7ddd23ce832f3783ULL},
    {0xfe724,0x1cc,0x993f5e8d7c97ebf6ULL},
    {0xfe8f0,0xd4,0x6790d1bbfc3615b5ULL},
    {0x167d98,0x180,0xa7f0789574c539d0ULL},
    {0x167f1c,0x294,0x3bc1adb38942122dULL}};
constexpr Slot kSlots[kMaxSlotCount] = {
    {0x224ab0,HookId::Acquire}, {0x224aa8,HookId::Submit},
    {0x224aa0,HookId::Init}, {0x224ac8,HookId::Flush},
    {0x224ad0,HookId::Stop}, {0x22f7a8,HookId::Stop},
    {0x224a90,HookId::Destructor}, {0x22f7c8,HookId::Destructor},
    {0x2312f8,HookId::Periodic},
    {0x226ec8,HookId::AcceptPacket}, {0x226fc0,HookId::AcceptPacket},
    {0x22f740,HookId::DequeueInput}, {0x22f750,HookId::QueueInput},
    {0x22f720,HookId::DequeueOutput}, {0x22f728,HookId::ReleaseOutput},
    {0x22f760,HookId::AcquireLatestImage}, {0x22f768,HookId::ImageTimestamp},
    {0x22f738,HookId::NativeFault}};
constexpr Function kFaultFunction{0x166dec,0xc,0x1332d003845cad11ULL};
#else
#error "GXR_BUILD_CODE must select the exact audited 5002322 or 5002363 layout"
#endif

struct Scene {
    std::uintptr_t base = 0;
    const ElfW(Phdr)* phdr = nullptr;
    std::size_t phnum = 0;
    unsigned count = 0;
};
struct Page { std::uintptr_t address = 0; int protection = 0; bool writable = false; };
std::atomic<bool> gActive{false};
std::atomic<std::uintptr_t> gBase{0};
std::atomic<void*> gOriginal[kHookCount]{};
void* gReplacement[kHookCount]{};
std::atomic_flag gInstalling = ATOMIC_FLAG_INIT;
bool gAttempted = false;  // Accessed only while gInstalling is held.
bool gDiagnostic = false;
// Deliberately retained for the lifetime of all installed API pointers, including
// a partial rollback. Never use RTLD_DEFAULT, which may resolve another hook.
void* gMediaHandle = nullptr;

bool resolveMediaFunctions(std::uintptr_t* functions) noexcept {
    constexpr const char* names[] = {
        "AMediaCodec_dequeueInputBuffer", "AMediaCodec_queueInputBuffer",
        "AMediaCodec_dequeueOutputBuffer", "AMediaCodec_releaseOutputBuffer",
        "AImageReader_acquireLatestImage", "AImage_getTimestamp"};
    if (!gMediaHandle) gMediaHandle = dlopen("libmediandk.so", RTLD_NOW | RTLD_LOCAL);
    if (!gMediaHandle) return false;
    for (std::size_t i = 0; i < sizeof(names) / sizeof(names[0]); ++i) {
        void* symbol = dlsym(gMediaHandle, names[i]);
        Dl_info info{};
        if (!symbol || !dladdr(symbol, &info) || !info.dli_fname) return false;
        const char* slash = std::strrchr(info.dli_fname, '/');
        if (std::strcmp(slash ? slash + 1 : info.dli_fname, "libmediandk.so") != 0) return false;
        functions[kNativeHookCount + i] = reinterpret_cast<std::uintptr_t>(symbol);
    }
    return true;
}

bool fail(const char* why) noexcept {
    __android_log_print(ANDROID_LOG_ERROR, kTag, "hook installation disabled: %s", why);
    return false;
}

bool sum(std::uintptr_t a, std::uintptr_t b, std::uintptr_t& out) noexcept {
    if (b > std::numeric_limits<std::uintptr_t>::max() - a) return false;
    out = a + b;
    return true;
}

int findScene(dl_phdr_info* info, std::size_t, void* context) {
    const char* name = info->dlpi_name;
    if (!name) return 0;
    const char* slash = std::strrchr(name, '/');
    if (std::strcmp(slash ? slash + 1 : name, "libvrlink_scene.so") != 0) return 0;
    auto& scene = *static_cast<Scene*>(context);
    ++scene.count;
    scene.base = static_cast<std::uintptr_t>(info->dlpi_addr);
    scene.phdr = info->dlpi_phdr;
    scene.phnum = info->dlpi_phnum;
    return 0;
}

bool contains(const Scene& scene, std::uintptr_t va, std::size_t length,
              ElfW(Word) required, ElfW(Word) type = PT_LOAD) noexcept {
    std::uintptr_t end;
    if (!sum(va, length, end)) return false;
    for (std::size_t i = 0; i < scene.phnum; ++i) {
        const auto& p = scene.phdr[i];
        std::uintptr_t segmentEnd;
        if (p.p_type == type && (p.p_flags & required) == required &&
            sum(p.p_vaddr, p.p_memsz, segmentEnd) &&
            p.p_vaddr <= va && end <= segmentEnd) return true;
    }
    return false;
}

bool addressOf(const Scene& scene, std::uintptr_t va, std::size_t length,
               std::uintptr_t& address) noexcept {
    std::uintptr_t end;
    return sum(scene.base, va, address) && sum(address, length, end);
}

std::uint64_t hashCode(std::uintptr_t address, std::size_t length) noexcept {
    auto* bytes = reinterpret_cast<const unsigned char*>(address);
    std::uint64_t value = 14695981039346656037ULL;
    for (std::size_t i = 0; i < length; ++i) value = (value ^ bytes[i]) * 1099511628211ULL;
    return value;
}

bool verifyIdentity(const Scene& scene) noexcept {
    std::uintptr_t address;
    if (!contains(scene, 0, sizeof(ElfW(Ehdr)), PF_R) ||
        !addressOf(scene, 0, sizeof(ElfW(Ehdr)), address)) return false;
    ElfW(Ehdr) header;
    std::memcpy(&header, reinterpret_cast<void*>(address), sizeof(header));
    if (std::memcmp(header.e_ident, ELFMAG, SELFMAG) != 0 ||
        header.e_ident[EI_CLASS] != ELFCLASS64 || header.e_ident[EI_DATA] != ELFDATA2LSB ||
        header.e_machine != EM_AARCH64 || header.e_type != ET_DYN) return false;
    constexpr std::uintptr_t noteVa = 0x2d0;
    constexpr std::size_t noteSize = sizeof(ElfW(Nhdr)) + 4 + sizeof(kBuildId);
    // The supported HMD prediction patch repurposes the PT_NOTE header as a
    // separate PT_LOAD code mapping. Its original GNU note bytes remain in the
    // first readable load segment, so pin those bytes without requiring PT_NOTE.
    if (!contains(scene, noteVa, noteSize, PF_R) ||
        !addressOf(scene, noteVa, noteSize, address)) return false;
    ElfW(Nhdr) note;
    std::memcpy(&note, reinterpret_cast<void*>(address), sizeof(note));
    const auto* bytes = reinterpret_cast<const unsigned char*>(address);
    return note.n_namesz == 4 && note.n_descsz == sizeof(kBuildId) && note.n_type == NT_GNU_BUILD_ID &&
           std::memcmp(bytes + sizeof(note), "GNU\0", 4) == 0 &&
           std::memcmp(bytes + sizeof(note) + 4, kBuildId, sizeof(kBuildId)) == 0;
}

// /proc/self/maps records actual permissions. PT_LOAD/RELRO independently limits
// which pages may be edited; rejecting a disagreement avoids guessing a previous
// hook's permissions. Works with both 4 KiB and 16 KiB runtime pages.
bool pageProtection(std::uintptr_t page, std::size_t pageSize, int& result) noexcept {
    std::uintptr_t pageEnd;
    if (!sum(page, pageSize, pageEnd)) return false;
    FILE* maps = std::fopen("/proc/self/maps", "re");
    if (!maps) return false;
    char line[1024];
    bool found = false;
    while (std::fgets(line, sizeof(line), maps)) {
        unsigned long start = 0, end = 0;
        char permissions[5]{};
        if (std::sscanf(line, "%lx-%lx %4s", &start, &end, permissions) != 3) continue;
        if (start <= page && pageEnd <= end) {
            result = (permissions[0] == 'r' ? PROT_READ : 0) |
                     (permissions[1] == 'w' ? PROT_WRITE : 0) |
                     (permissions[2] == 'x' ? PROT_EXEC : 0);
            found = permissions[3] == 'p';
            break;
        }
    }
    std::fclose(maps);
    return found;
}

bool restorePages(Page* pages, std::size_t count, std::size_t pageSize) noexcept {
    bool ok = true;
    for (std::size_t i = 0; i < count; ++i) {
        if (!pages[i].writable) continue;
        if (mprotect(reinterpret_cast<void*>(pages[i].address), pageSize, pages[i].protection) != 0) {
            ok = false;
        } else {
            pages[i].writable = false;
        }
    }
    return ok;
}

bool rollback(Page* pages, std::size_t pageCount, std::size_t pageSize,
              const std::uintptr_t* addresses, void* const* originals,
              std::size_t slotCount) noexcept {
    gActive.store(false, std::memory_order_release);
    bool complete = true;
    for (std::size_t p = 0; p < pageCount; ++p) {
        if (!pages[p].writable) {
            if (mprotect(reinterpret_cast<void*>(pages[p].address), pageSize,
                         pages[p].protection | PROT_WRITE) != 0) {
                complete = false;
                continue;
            }
            pages[p].writable = true;
        }
        for (std::size_t i = 0; i < slotCount; ++i) {
            if ((addresses[i] & ~(pageSize - 1)) == pages[p].address)
                __atomic_store_n(reinterpret_cast<void**>(addresses[i]), originals[i], __ATOMIC_RELEASE);
        }
    }
    if (!restorePages(pages, pageCount, pageSize)) complete = false;
    if (!complete) fail("OS rejected complete rollback; buffering inactive, wrappers must pass through");
    return complete;
}

}  // namespace

bool hooksActive() noexcept { return gActive.load(std::memory_order_acquire); }
void* originalFunction(HookId id) noexcept {
    const auto index = static_cast<std::size_t>(id);
    return index < kHookCount ? gOriginal[index].load(std::memory_order_acquire) : nullptr;
}
std::uintptr_t sceneAddress(std::uintptr_t offset) noexcept {
    const auto base = gBase.load(std::memory_order_acquire);
    std::uintptr_t address;
    return base && sum(base, offset, address) ? address : 0;
}

bool installHooks(HookBindings& bindings, bool diagnostic) noexcept {
    const std::size_t hookCount = diagnostic ? kHookCount : kNativeHookCount;
    const std::size_t slotCount = diagnostic ? kMaxSlotCount : kSlotCount;
    if (gInstalling.test_and_set(std::memory_order_acquire)) return fail("concurrent installation");
    struct Unlock { ~Unlock() { gInstalling.clear(std::memory_order_release); } } unlock;
    if (gAttempted) {
        if (!hooksActive()) return fail("previous installation did not complete; retry disallowed");
        if (diagnostic != gDiagnostic) return fail("different diagnostic mode");
        for (std::size_t i = 0; i < hookCount; ++i)
            if (bindings.replacement[i] != gReplacement[i]) return fail("different replacement set");
        bindings.base = gBase.load(std::memory_order_acquire);
        Scene current;
        dl_iterate_phdr(findScene, &current);
        if (current.count != 1 || current.base != bindings.base || !current.phdr || !current.phnum ||
            !verifyIdentity(current)) {
            gActive.store(false, std::memory_order_release);
            return fail("scene disappeared or reloaded; retry disallowed");
        }
        for (std::size_t i = 0; i < hookCount; ++i) bindings.orig[i] = originalFunction(static_cast<HookId>(i));
        for (std::size_t i = 0; i < slotCount; ++i) {
            const auto& slot = kSlots[i];
            auto** ptr = reinterpret_cast<void**>(bindings.base + slot.va);
            if (__atomic_load_n(ptr, __ATOMIC_ACQUIRE) != gReplacement[static_cast<std::size_t>(slot.id)]) {
                gActive.store(false, std::memory_order_release);
                return fail("installed slot changed; foreign hook or reload");
            }
        }
        return true;
    }
    gAttempted = true;
    for (std::size_t i = 0; i < hookCount; ++i)
        if (!bindings.replacement[i]) return fail("missing replacement");
    Scene scene;
    dl_iterate_phdr(findScene, &scene);
    if (scene.count != 1 || !scene.base || !scene.phdr || !scene.phnum)
        return fail("expected one mapped libvrlink_scene.so");
    if (!verifyIdentity(scene)) return fail("ELF identity/build ID mismatch");
    const long pageValue = sysconf(_SC_PAGESIZE);
    if (pageValue <= 0 || (pageValue & (pageValue - 1)) != 0)
        return fail("invalid runtime page size");
    const auto pageSize = static_cast<std::size_t>(pageValue);
    std::uintptr_t functions[kHookCount]{};
    for (std::size_t i = 0; i < kNativeHookCount; ++i) {
        const auto& fn = kFunctions[i];
        if (!contains(scene, fn.va, fn.size, PF_R | PF_X) ||
            !addressOf(scene, fn.va, fn.size, functions[i]))
            return fail("immutable function bytes differ");
        const auto checksum = i == static_cast<std::size_t>(HookId::AcceptPacket)
            ? normalizedFecPacketHash(reinterpret_cast<const unsigned char*>(functions[i]), fn.size)
            : hashCode(functions[i], fn.size);
        if (checksum != fn.fnv)
            return fail("immutable function bytes differ");
    }
    if (diagnostic) {
        const auto faultIndex = static_cast<std::size_t>(HookId::NativeFault);
        if (!contains(scene, kFaultFunction.va, kFaultFunction.size, PF_R | PF_X) ||
            !addressOf(scene, kFaultFunction.va, kFaultFunction.size, functions[faultIndex]) ||
            hashCode(functions[faultIndex], kFaultFunction.size) != kFaultFunction.fnv)
            return fail("stock fault function bytes differ");
        if (!resolveMediaFunctions(functions)) return fail("could not resolve genuine media API originals");
    }
    Page pages[kMaxPages]{};
    std::size_t pageCount = 0;
    std::uintptr_t addresses[kMaxSlotCount]{};
    void* originals[kMaxSlotCount]{};
    for (std::size_t i = 0; i < slotCount; ++i) {
        const auto& slot = kSlots[i];
        if ((slot.va & (alignof(void*) - 1)) ||
            !contains(scene, slot.va, sizeof(void*), PF_R | PF_W) ||
            !contains(scene, slot.va, sizeof(void*), PF_R, PT_GNU_RELRO) ||
            !addressOf(scene, slot.va, sizeof(void*), addresses[i]))
            return fail("pointer slot outside audited data/RELRO mapping");
        originals[i] = reinterpret_cast<void*>(functions[static_cast<std::size_t>(slot.id)]);
        if (__atomic_load_n(reinterpret_cast<void**>(addresses[i]), __ATOMIC_ACQUIRE) != originals[i])
            return fail("pointer slot already changed or unresolved");
        const auto page = addresses[i] & ~(pageSize - 1);
        bool known = false;
        for (std::size_t p = 0; p < pageCount; ++p) known |= pages[p].address == page;
        if (!known) {
            int protection = 0;
            if (!pageProtection(page, pageSize, protection) || protection != PROT_READ)
                return fail("actual RELRO page protection differs from read-only data");
            pages[pageCount++] = Page{page, protection, false};
        }
    }
    // Make every page writable before changing any slot. No executable page is edited.
    for (std::size_t p = 0; p < pageCount; ++p) {
        if (mprotect(reinterpret_cast<void*>(pages[p].address), pageSize,
                     pages[p].protection | PROT_WRITE) != 0) {
            if (!restorePages(pages, pageCount, pageSize)) fail("could not restore page protection after preflight");
            return fail("could not make all target pages writable");
        }
        pages[p].writable = true;
    }
    // Recheck after protection changes before publishing originals or mutating slots.
    for (std::size_t i = 0; i < slotCount; ++i) {
        if (__atomic_load_n(reinterpret_cast<void**>(addresses[i]), __ATOMIC_ACQUIRE) != originals[i]) {
            if (!restorePages(pages, pageCount, pageSize)) fail("could not restore pages after pointer conflict");
            return fail("pointer changed during installation");
        }
    }
    bindings.base = scene.base;
    gDiagnostic = diagnostic;
    gBase.store(scene.base, std::memory_order_release);
    for (std::size_t i = 0; i < hookCount; ++i) {
        bindings.orig[i] = reinterpret_cast<void*>(functions[i]);
        gOriginal[i].store(bindings.orig[i], std::memory_order_release);
        gReplacement[i] = bindings.replacement[i];
    }
    for (std::size_t i = 0; i < slotCount; ++i)
        __atomic_store_n(reinterpret_cast<void**>(addresses[i]),
                         bindings.replacement[static_cast<std::size_t>(kSlots[i].id)], __ATOMIC_RELEASE);
    if (!restorePages(pages, pageCount, pageSize)) {
        rollback(pages, pageCount, pageSize, addresses, originals, slotCount);
        return fail("could not restore target page protections");
    }
    gActive.store(true, std::memory_order_release);
    __android_log_print(ANDROID_LOG_INFO, kTag, "installed %zu data hooks for build %d on %zu-byte pages",
                        slotCount, GXR_BUILD_CODE, pageSize);
    return true;
}

}  // namespace gxr::dbuf

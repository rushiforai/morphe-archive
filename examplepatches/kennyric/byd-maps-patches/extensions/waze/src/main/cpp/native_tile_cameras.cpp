#include <jni.h>
#include <elf.h>
#include <link.h>
#include <shadowhook.h>
#include <array>
#include <cstdint>
#include <cstring>
#include <mutex>

// Waze 5.27.0.1 ARM64 only. The resource patch must independently pin the full ELF hash.
// No native pointer escapes an interception. Only inspected native value getters are called; no JNI.
namespace {
constexpr uintptr_t kInvoke = 0x2c8bc88;
constexpr uintptr_t kAddedReturn = 0x3be7e10;
constexpr uintptr_t kRemovedReturn = 0x3be80e4;
constexpr size_t kCapacity = 2048;
constexpr uint8_t kBuildId[] = {0xa5,0xc1,0x1c,0xd5,0x0f,0xb4,0xe3,0x30,
                              0x2f,0x06,0x46,0xe0,0x08,0xf7,0x12,0xd8};
struct Point {
    uint32_t tile = 0;
    uint64_t id = 0;
    uint32_t kind = 0;
    int32_t longitude = 0, latitude = 0;
    bool used = false;
};
std::array<Point, kCapacity> points;
std::mutex mutex;
uintptr_t libraryBase = 0;
void* interception = nullptr;
bool overflow = false;
constexpr size_t kLineCapacity = 8192, kRangeCapacity = 128;
struct Coordinate { int32_t longitude = 0, latitude = 0; };
struct Line { uint64_t key = 0; Coordinate first, last; bool used = false; };
struct Range { int32_t tile = 0, line = 0; Coordinate start, end; uint32_t boundaries = 0; };
struct RangeBuild {
    std::array<Line, kLineCapacity> lines;
    std::array<Range, kRangeCapacity> ranges;
    size_t count = 0;
    uint64_t generation = 0, firstRouteLine = 0;
    bool routeLinesObserved = false;
    bool active = false, invalid = false;
};
thread_local RangeBuild rangeBuild;
std::array<Range, kRangeCapacity> ranges;
size_t rangeCount = 0;
uint64_t rangeGeneration = 0;
std::array<void*, 6> rangeInterceptions{};
bool rangeHooksAttempted = false;
constexpr uintptr_t kRangeBegin = 0x3bdda24, kRouteLines = 0x3bdda78, kLineResolved = 0x2d5acb8;
constexpr uintptr_t kRangeAppend = 0x3bddb34, kRangeAppendLast = 0x3bddbc0, kRangeEnd = 0x3bddbe4;
constexpr uintptr_t kLineVtable = 0x438ab18, kFirstNode = 0x3c98458, kLastNode = 0x3c984a0;


template<class T> T read(uintptr_t address) {
    T result;
    std::memcpy(&result, reinterpret_cast<const void*>(address), sizeof(result));
    return result;
}

bool verifiedBuild(const dl_phdr_info* info) {
    for (ElfW(Half) i = 0; i < info->dlpi_phnum; ++i) {
        const auto& ph = info->dlpi_phdr[i];
        if (ph.p_type != PT_NOTE) continue;
        const auto* bytes = reinterpret_cast<const uint8_t*>(info->dlpi_addr + ph.p_vaddr);
        size_t offset = 0;
        while (offset + sizeof(ElfW(Nhdr)) <= ph.p_memsz) {
            ElfW(Nhdr) note;
            std::memcpy(&note, bytes + offset, sizeof(note));
            offset += sizeof(note);
            size_t nameSize = (static_cast<size_t>(note.n_namesz) + 3) & ~size_t(3);
            size_t valueSize = (static_cast<size_t>(note.n_descsz) + 3) & ~size_t(3);
            if (nameSize > ph.p_memsz - offset || valueSize > ph.p_memsz - offset - nameSize) break;
            if (note.n_type == NT_GNU_BUILD_ID && note.n_namesz == 4 &&
                note.n_descsz == sizeof(kBuildId) && std::memcmp(bytes + offset, "GNU", 4) == 0 &&
                std::memcmp(bytes + offset + nameSize, kBuildId, sizeof(kBuildId)) == 0) return true;
            offset += nameSize + valueSize;
        }
    }
    return false;
}

int locate(dl_phdr_info* info, size_t, void*) {
    const char* path = info->dlpi_name;
    const char* leaf = std::strrchr(path, '/');
    if (std::strcmp(leaf ? leaf + 1 : path, "libwaze.so") != 0) return 0;
    if (!verifiedBuild(info)) return 1;
    // Require every observed instruction in the shared invocation entry, not just a version label.
    constexpr uint32_t expected[] = {0xf9401000, 0xb4000080, 0xf9400008, 0xf9401902};
    bool executable = false;
    for (ElfW(Half) i = 0; i < info->dlpi_phnum; ++i) {
        const auto& ph = info->dlpi_phdr[i];
        if (ph.p_type == PT_LOAD && (ph.p_flags & PF_X) && kInvoke >= ph.p_vaddr &&
            kInvoke + sizeof(expected) <= ph.p_vaddr + ph.p_memsz) executable = true;
    }
    if (executable && std::memcmp(reinterpret_cast<void*>(info->dlpi_addr + kInvoke),
                                  expected, sizeof(expected)) == 0) libraryBase = info->dlpi_addr;
    return 1;
}

#if defined(__aarch64__)
void observe(shadowhook_cpu_context_t* context, void*) {
    const uintptr_t caller = context->regs[30] - libraryBase;
    if (caller != kAddedReturn && caller != kRemovedReturn) return;
    const uintptr_t insight = context->regs[1];
    const uint32_t kind = read<uint32_t>(insight + 0x20);
    if (kind < 69 || kind > 80) return;
    const uintptr_t feature = read<uintptr_t>(insight);
    const uint32_t tile = read<uint32_t>(feature);
    const uint64_t id = read<uint64_t>(feature + 8);
    std::lock_guard<std::mutex> lock(mutex);
    if (overflow) return;
    Point* vacant = nullptr;
    for (auto& point : points) {
        if (!point.used) { if (!vacant) vacant = &point; continue; }
        if (point.tile == tile && point.id == id && point.kind == kind) { vacant = &point; break; }
    }
    if (caller == kRemovedReturn) {
        if (vacant && vacant->used) vacant->used = false;
        return;
    }
    const int32_t longitude = read<int32_t>(feature + 0x10);
    const int32_t latitude = read<int32_t>(feature + 0x14);
    if (longitude < -180000000 || longitude > 180000000 || latitude < -90000000 ||
        latitude > 90000000 || (longitude == 0 && latitude == 0)) return;
    if (!vacant) {
        // Losing one insertion makes completeness unknown. Empty output until a source restart.
        for (auto& point : points) point.used = false;
        overflow = true;
        return;
    }
    *vacant = {tile, id, kind, longitude, latitude, true};
}

bool valid(Coordinate point) {
    return point.longitude >= -180000000 && point.longitude <= 180000000 &&
        point.latitude >= -90000000 && point.latitude <= 90000000 &&
        (point.longitude != 0 || point.latitude != 0);
}
Coordinate coordinate(uint64_t packed) {
    return {static_cast<int32_t>(packed), static_cast<int32_t>(packed >> 32)};
}
uint64_t lineKey(uintptr_t descriptor) {
    return read<uint32_t>(descriptor) | (static_cast<uint64_t>(read<uint32_t>(descriptor + 4)) << 32);
}
Line* findLine(uint64_t key, bool insert) {
    size_t slot = ((key ^ (key >> 33)) * UINT64_C(0xff51afd7ed558ccd)) % kLineCapacity;
    for (size_t i = 0; i < kLineCapacity; ++i) {
        auto& line = rangeBuild.lines[(slot + i) % kLineCapacity];
        if (line.used && line.key == key) return &line;
        if (!line.used) return insert ? &line : nullptr;
    }
    rangeBuild.invalid = true;
    return nullptr;
}
void beginRanges(shadowhook_cpu_context_t*, void*) {
    auto& build = rangeBuild;
    build.active = true; build.invalid = false; build.count = 0; build.routeLinesObserved = false;
    for (auto& line : build.lines) line.used = false;
    std::lock_guard<std::mutex> lock(mutex);
    // A new route invalidates the old geometry before any replacement is available.
    rangeCount = 0; build.generation = ++rangeGeneration;
}
void routeLines(shadowhook_cpu_context_t* context, void*) {
    auto& build = rangeBuild;
    if (!build.active || context->regs[22] == context->regs[27]) return;
    build.firstRouteLine = lineKey(context->regs[22]); build.routeLinesObserved = true;
}
void resolvedLine(shadowhook_cpu_context_t* context, void*) {
    auto& build = rangeBuild;
    if (!build.active || build.invalid) return;
    const uintptr_t descriptor = context->regs[19];
    const uintptr_t line = read<uintptr_t>(context->regs[20]);
    if (!line) return; // The original lookup can legitimately return no loaded line.
    if (read<uintptr_t>(line) != libraryBase + kLineVtable || read<uint8_t>(descriptor + 8) > 1) {
        build.invalid = true; return;
    }
    // These original getters copy the native tile's endpoint nodes. They retain no pointer or state.
    using Getter = uint64_t (*)(uintptr_t);
    const auto first = coordinate(reinterpret_cast<Getter>(libraryBase + kFirstNode)(line));
    const auto last = coordinate(reinterpret_cast<Getter>(libraryBase + kLastNode)(line));
    if (!valid(first) || !valid(last)) { build.invalid = true; return; }
    const uint64_t key = lineKey(descriptor);
    if (auto* target = findLine(key, true)) *target = {key, first, last, true};
}
void appendRange(shadowhook_cpu_context_t* context, void* trailing) {
    auto& build = rangeBuild;
    if (!build.active || build.invalid) return;
    const uintptr_t first = context->regs[26], last = context->regs[25];
    if (!first || !last || read<uint8_t>(first + 8) > 1 || read<uint8_t>(last + 8) > 1 ||
        build.count == kRangeCapacity) { build.invalid = true; return; }
    const Line* a = findLine(lineKey(first), false);
    const Line* b = findLine(lineKey(last), false);
    const int64_t start = read<int32_t>(first + 0xc);
    const int64_t end = static_cast<int64_t>(read<int32_t>(last + 0xc)) + read<int32_t>(last + 0x10);
    if (!a || !b || !build.routeLinesObserved || start < 0 || end <= start) { build.invalid = true; return; }
    Range result{read<int32_t>(first), read<int32_t>(first + 4),
        read<uint8_t>(first + 8) ? a->last : a->first,
        read<uint8_t>(last + 8) ? b->first : b->last,
        static_cast<uint32_t>((lineKey(first) != build.firstRouteLine ? 1 : 0) | (trailing ? 0 : 2))};
    // The route can begin/end inside a control. Those truncated edges are not control boundaries.
    for (size_t i = 0; i < build.count; ++i) {
        if (build.ranges[i].tile == result.tile && build.ranges[i].line == result.line) {
            build.invalid = true; return; // A repeated native identity cannot be correlated unambiguously.
        }
    }
    build.ranges[build.count++] = result;
}
void endRanges(shadowhook_cpu_context_t*, void*) {
    auto& build = rangeBuild;
    if (!build.active) return;
    std::lock_guard<std::mutex> lock(mutex);
    if (build.generation == rangeGeneration && !build.invalid) {
        rangeCount = build.count;
        for (size_t i = 0; i < rangeCount; ++i) ranges[i] = build.ranges[i];
    }
    build.active = false;
}
void installRanges() {
    if (rangeHooksAttempted) return;
    rangeHooksAttempted = true;
    constexpr uintptr_t addresses[] = {kRangeBegin, kRouteLines, kLineResolved, kRangeAppend, kRangeAppendLast, kRangeEnd};
    constexpr uint32_t words[] = {0xd10203ff, 0xaa1f03fa, 0xf9400288, 0x97c75e0c, 0x97c75de9, 0xd65f03c0};
    const shadowhook_interceptor_t callbacks[] = {beginRanges, routeLines, resolvedLine, appendRange, appendRange, endRanges};
    for (size_t i = 0; i < rangeInterceptions.size(); ++i)
        if (read<uint32_t>(libraryBase + addresses[i]) != words[i]) return;
    for (size_t i = 0; i < rangeInterceptions.size(); ++i) {
        rangeInterceptions[i] = shadowhook_intercept_instr_addr(reinterpret_cast<void*>(libraryBase + addresses[i]),
            callbacks[i], addresses[i] == kRangeAppendLast ? reinterpret_cast<void*>(1) : nullptr,
            SHADOWHOOK_INTERCEPT_WITH_FPSIMD_READ_ONLY);
        if (!rangeInterceptions[i]) {
            for (auto& installed : rangeInterceptions) if (installed) {
                shadowhook_unintercept(installed); installed = nullptr;
            }
            std::lock_guard<std::mutex> lock(mutex);
            rangeCount = 0; ++rangeGeneration;
            return;
        }
    }
}

#endif
}

// ART looks up JNI_OnLoad through dlsym, including dependencies. Own this entry so
// it cannot accidentally invoke ShadowHook's optional Java-facade registration.
extern "C" JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void*) {
    return vm ? JNI_VERSION_1_6 : JNI_ERR;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_ungoogled_waze_NativeTileCameras_nativeInstall(JNIEnv*, jclass) {
#if defined(__aarch64__)
    if (interception) return true;
    dl_iterate_phdr(locate, nullptr);
    if (!libraryBase || shadowhook_init(SHADOWHOOK_MODE_UNIQUE, false) != 0) return false;
    interception = shadowhook_intercept_func_addr(reinterpret_cast<void*>(libraryBase + kInvoke),
        observe, nullptr, SHADOWHOOK_INTERCEPT_WITH_FPSIMD_READ_ONLY);
    if (interception) installRanges();
    return interception != nullptr;
#else
    return false;
#endif
}

extern "C" JNIEXPORT jlongArray JNICALL
Java_org_ungoogled_waze_NativeTileCameras_nativeSnapshot(JNIEnv* env, jclass) {
    std::array<jlong, kCapacity * 5> values;
    size_t length = 0;
    {
        std::lock_guard<std::mutex> lock(mutex);
        if (!overflow) for (const auto& point : points) if (point.used) {
            values[length++] = point.tile;
            values[length++] = static_cast<jlong>(point.id);
            values[length++] = point.kind;
            values[length++] = point.longitude;
            values[length++] = point.latitude;
        }
    }
    jlongArray result = env->NewLongArray(static_cast<jsize>(length));
    if (result && length) env->SetLongArrayRegion(result, 0, static_cast<jsize>(length), values.data());
    return result;
}

extern "C" JNIEXPORT void JNICALL
Java_org_ungoogled_waze_NativeTileCameras_nativeClear(JNIEnv*, jclass) {
    std::lock_guard<std::mutex> lock(mutex);
    for (auto& point : points) point.used = false;
    overflow = false;
    rangeCount = 0; ++rangeGeneration;
}

extern "C" JNIEXPORT jlongArray JNICALL
Java_org_ungoogled_waze_NativeTileCameras_nativeZoneSnapshot(JNIEnv* env, jclass) {
    std::array<jlong, 1 + kRangeCapacity * 7> values;
    size_t length = 1;
    {
        std::lock_guard<std::mutex> lock(mutex);
        values[0] = static_cast<jlong>(rangeGeneration);
        for (size_t i = 0; i < rangeCount; ++i) {
            const auto& range = ranges[i];
            values[length++] = range.tile; values[length++] = range.line;
            values[length++] = range.start.longitude; values[length++] = range.start.latitude;
            values[length++] = range.end.longitude; values[length++] = range.end.latitude;
            values[length++] = range.boundaries;
        }
    }
    jlongArray result = env->NewLongArray(static_cast<jsize>(length));
    if (result) env->SetLongArrayRegion(result, 0, static_cast<jsize>(length), values.data());
    return result;
}

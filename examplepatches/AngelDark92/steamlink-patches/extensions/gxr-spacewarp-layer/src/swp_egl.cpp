// gxr-spacewarp: eglCreateImageKHR post-hook — decoded-frame arrival learning
// (09-LAYER-B1b component 4).
//
// The scene library imports exactly one eglCreateImageKHR (verified: one JUMP_SLOT
// relocation in libvrlink_scene.so of the 2.0.23/5002363 decoded tree; slot vaddr
// 0x22fcc8 in the Gate-0 JSON). swp_hooks.cpp redirects that GOT slot to the
// wrapper below, which:
//   1. calls the original FIRST (pure passthrough; the image must exist either way),
//   2. on success feeds the arrival observer:
//      - a monotonically increasing ARRIVAL EPOCH bumped when the created image
//        handle differs from the previous call's handle (dedup consecutive),
//      - a CLOCK_MONOTONIC timestamp per epoch bump (swp_dispatch later converts
//        it into XrTime through the xrBeginFrame anchor pairs),
//      - the (display, context) the image was created with (the "frame-asset
//        context" the dispatch verifies against eglGetCurrentContext()).
//
// Exact assumption + risk (RE-SHARED-IMPL.md component 4, kept MINIMAL):
//   The missed-tick logic works if the scene lib creates exactly one image per
//   decoded frame on this import and reuses its buffer pool round-robin
//   (maxImages 20; any handle re-occurrence after a different handle still bumps
//   the epoch because we compare against the PREVIOUS call only). If instead the
//   producer stops creating images on this import (e.g. a different code path owns
//   the video frames), the epoch stalls — the dispatch then classifies every tick
//   as missed and would extrapolate repeatedly, which is bounded by the dispatch's
//   2-consecutive-tick cap, still fail-safe but useless; if unrelated images (UI/
//   overlays) arrive on this import, the epoch over-increments — real ticks then
//   dominate and the feature stays stock (safe direction). A pool wider than 64
//   distinct handles disables the arrival learning outright (SwpEglLearningDisabled)
//   and the whole feature passes stock. Documented in README + mirrored by
//   tests/swp_host_tests.cpp (round-robin + anomaly vectors).

#include <android/log.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <time.h>

#include <algorithm>
#include <array>
#include <cstdint>
#include <mutex>

extern "C" {
void SwpEglSetOriginal(void* originalCreateImageKHR);
bool SwpEglArrivalSnapshot(uint64_t* epoch, void** arrivalCtx, void** arrivalDpy);
int SwpEglArrivalHistory(uint64_t* outEpochs, uint64_t* outMonoNs, int maxEntries);
bool SwpEglLearningDisabled();
uint64_t SwpEglMonotonicNs();
void SwpEglArrivalObserved(void* image, void* ctx, void* dpy, uint64_t monoNs);
uint32_t SwpVtsMode();
}

#define LOG(...) __android_log_print(ANDROID_LOG_INFO, "GXRSwarp", __VA_ARGS__)

namespace {

constexpr size_t kHistoryCap = 8;         // arrival (epoch, mono) ring consumed by dispatch
constexpr size_t kPoolAnomalyHandles = 64; // distinct-handle cap (maxImages 20 + slack)

std::recursive_mutex g_mutex;

// Original eglCreateImageKHR, captured from the scene GOT by SwpHooksArm.
using EglCreateImageKHRFn = void* (*)(void*, void*, unsigned, void*, const int*);
EglCreateImageKHRFn g_original = nullptr;

#ifdef SWP_HOST_TESTS
// Host/device test clock (deterministic arrival + anchor conversions). Gated on
// the test build, not on Windows: the suite also builds and runs as an arm64
// binary on the headset, where clock_gettime would defeat the fixed vectors.
uint64_t g_testNowNs = 0;
uint64_t g_testClockReads = 0;
#endif

// Arrival learning state (process lifetime; the dispatch holds the session view).
uint64_t g_epoch = 0;
uint64_t g_lastImage = 0;
uint64_t g_totalArrivals = 0;
void* g_lastCtx = nullptr;
void* g_lastDpy = nullptr;
bool g_learningDisabled = false;
// Fixed control storage: no arrival-owned heap allocation, even after On -> Off.
std::array<uint64_t, kHistoryCap> g_historyEpochs{};
std::array<uint64_t, kHistoryCap> g_historyMono{};
size_t g_historyHead = 0;
size_t g_historyCount = 0;
std::array<uintptr_t, kPoolAnomalyHandles> g_imageSeen{};
size_t g_imageSeenCount = 0;

uint64_t NowNs() {
#ifdef SWP_HOST_TESTS
    ++g_testClockReads;
    return g_testNowNs;  // test builds control the clock (never a production build)
#else
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return static_cast<uint64_t>(ts.tv_sec) * 1000000000ull + static_cast<uint64_t>(ts.tv_nsec);
#endif
}

}  // namespace

extern "C" {

void SwpEglSetOriginal(void* originalCreateImageKHR) {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    g_original = reinterpret_cast<EglCreateImageKHRFn>(originalCreateImageKHR);
}

uint64_t SwpEglMonotonicNs() { return NowNs(); }

// Arrival observer (called by the GOT wrapper and directly by host tests with a
// synthetic clock). image/ctx/dpy as the real call carried them.
void SwpEglArrivalObserved(void* image, void* ctx, void* dpy, uint64_t monoNs) {
    const uintptr_t imageId = reinterpret_cast<uintptr_t>(image);
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    if (g_learningDisabled) return;
    g_totalArrivals++;
    if (imageId == g_lastImage) return;  // consecutive duplicate: not a new arrival
    const auto seenEnd = g_imageSeen.begin() + g_imageSeenCount;
    const bool seen = std::find(g_imageSeen.begin(), seenEnd, imageId) != seenEnd;
    if (g_imageSeenCount >= kPoolAnomalyHandles && !seen) {
        // Pool wider than any Steam Link AImageReader round-robin (maxImages 20):
        // this is not the decoded-frame path we assume; disable learning outright.
        g_learningDisabled = true;
        g_historyHead = 0;
        g_historyCount = 0;
        LOG("arrival pool exceeded %zu distinct handles; arrival learning disabled",
            kPoolAnomalyHandles);
        return;
    }
    if (!seen) g_imageSeen[g_imageSeenCount++] = imageId;
    g_epoch++;
    g_historyEpochs[g_historyHead] = g_epoch;
    g_historyMono[g_historyHead] = monoNs;
    g_historyHead = (g_historyHead + 1) % kHistoryCap;
    if (g_historyCount < kHistoryCap) ++g_historyCount;
    g_lastImage = imageId;
    g_lastCtx = ctx;
    g_lastDpy = dpy;
}

bool SwpEglArrivalSnapshot(uint64_t* epoch, void** arrivalCtx, void** arrivalDpy) {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    if (!epoch || !arrivalCtx || !arrivalDpy) return false;
    if (g_epoch == 0 && !g_learningDisabled) return false;  // nothing arrived yet
    *epoch = g_epoch;
    *arrivalCtx = g_lastCtx;
    *arrivalDpy = g_lastDpy;
    return true;
}

int SwpEglArrivalHistory(uint64_t* outEpochs, uint64_t* outMonoNs, int maxEntries) {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    if (!outEpochs || !outMonoNs || maxEntries <= 0) return 0;
    const int count = static_cast<int>(g_historyCount);
    const int out = std::min(count, maxEntries);
    for (int i = 0; i < out; i++) {
        const size_t at = (g_historyHead + kHistoryCap - 1 - static_cast<size_t>(i)) % kHistoryCap;
        outEpochs[i] = g_historyEpochs[at];
        outMonoNs[i] = g_historyMono[at];
    }
    return out;
}

bool SwpEglLearningDisabled() {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    return g_learningDisabled;
}

// The GOT wrapper installed by swp_hooks.cpp into libvrlink_scene.so. Exact C ABI
// of eglCreateImageKHR; forwards first, then records the arrival. Never throws,
// never blocks beyond a mutex hold over counter updates.
void* SwpWrapEglCreateImageKHR(void* dpy, void* ctx, unsigned target, void* buffer,
                               const int* attrs) {
    if (!g_original) return nullptr;  // unarmed: never installed in this state
    void* image = g_original(dpy, ctx, target, buffer, attrs);
    // Settled Off is only the original import plus one atomic mode read: no
    // clock, mutex, arrival learning, history update or allocation.
    if (image && SwpVtsMode() != 0) {
        SwpEglArrivalObserved(image, ctx, dpy, NowNs());
    }
    return image;
}

}  // extern "C"

#ifdef SWP_HOST_TESTS
// Test clock control (test builds only; hidden visibility keeps it out of any
// export table regardless). The reset below is benign on any build (it only
// clears counters) but is still only reachable from inside the binary.
extern "C" uint64_t SwpEglTestSetNowNs(uint64_t nowNs) {
    const uint64_t previous = g_testNowNs;
    g_testNowNs = nowNs;
    return previous;
}
extern "C" uint64_t SwpEglTestClockReads() { return g_testClockReads; }
extern "C" void SwpEglTestResetClockReads() { g_testClockReads = 0; }
extern "C" uint64_t SwpEglTestArrivalCount() {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    return g_totalArrivals;
}
#endif

// Arrival-state reset: an internal (hidden-visibility) ABI used by the host test
// suites and available for the device-side reset path if the dispatch grows one.
extern "C" void SwpEglResetArrivals() {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    g_epoch = 0;
    g_lastImage = 0;
    g_totalArrivals = 0;
    g_lastCtx = nullptr;
    g_lastDpy = nullptr;
    g_learningDisabled = false;
    g_historyHead = 0;
    g_historyCount = 0;
    g_imageSeenCount = 0;
    g_historyEpochs.fill(0);
    g_historyMono.fill(0);
    g_imageSeen.fill(0);
}

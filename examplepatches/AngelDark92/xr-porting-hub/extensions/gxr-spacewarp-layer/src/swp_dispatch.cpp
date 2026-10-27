// gxr-spacewarp dispatch (2026-10-26 half-rate revival).
//
// Carrier contract: 0 Off, 1 late-frame recovery, 2 half rate. Mode 2 uses a
// scheduler driven by OpenXR predicted display time and period, never decoded
// arrivals or previous presentation success. After warmup the selected-real and
// synthetic display slots alternate. A fresh frame arriving in a synthetic slot
// is discarded from presentation and history. Duplicate/out-of-order predicted
// times do not advance the phase; skipped display slots do. Failures submit the
// original composite and never shift the phase.
//
// Two immutable selected composites A/B are retained. Motion is estimated from
// A->B after rotation-aligning A into B; B is extrapolated with the nominal
// interleaved scale 1.5 (derived from the matching display timestamps). The
// synthetic pixels are rendered into layer-owned runtime swapchains and the
// frame-local projection views carry B's pose/FOV, so runtime late reprojection
// does not apply head rotation twice.
//
// Source images are captured only while acquired AND successfully waited, on
// the release call, before forwarding that release. Released stock images are
// never written. Every synthetic eye/component is acquired, waited, rendered
// and released before substitution; any failure releases the private images
// and submits the original composite.

#include <EGL/egl.h>
#include <android/log.h>
#include <jni.h>
#include <openxr/openxr.h>
#include <openxr/openxr_platform.h>

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <deque>
#include <map>
#include <mutex>
#include <set>
#include <vector>

#include "spacewarp_est.h"

#if !defined(SWP_HAVE_ESTIMATOR) && defined(__has_include)
#if __has_include("spacewarp_est.h")
#define SWP_HAVE_ESTIMATOR 1
#endif
#endif

extern "C" {
bool SwpVtsSynthesisAllowed();
uint32_t SwpVtsMode();
uint64_t SwpVtsGeneration();
bool SwpVtsArm();
void SwpVtsResetSession();
void SwpVtsSessionEnded();
void SwpVtsNoteEndFrame();
bool SwpHooksArm();
bool SwpHooksArmed();
void SwpEglSetOriginal(void* originalCreateImageKHR);
bool SwpEglArrivalSnapshot(uint64_t* epoch, void** arrivalCtx, void** arrivalDpy);
int SwpEglArrivalHistory(uint64_t* outEpochs, uint64_t* outMonoNs, int maxEntries);
bool SwpEglLearningDisabled();
uint64_t SwpEglMonotonicNs();
void SwpEglResetArrivals();
}

#define LOG(...) __android_log_print(ANDROID_LOG_INFO, "GXRSwarp", __VA_ARGS__)

namespace {

constexpr uint32_t kStatusStandDown = 16u;
constexpr const char* kDisableEnv = "GXR_DISABLE_GXR_SPACEWARP";
constexpr int kMaxSlots = 2;
constexpr int kEyes = 2;
constexpr int kHistorySets = 3;  // write target + A + B (never overwrite in-flight A/B)
constexpr uint32_t kMaxProjectionLayers = 8;
constexpr uint32_t kMaxCompositionLayers = 16;
constexpr uint32_t kModeHalfRate = 2;
constexpr int kClockPairsCap = 8;
constexpr int kMaxConsecutiveMissed = 2;
constexpr float kMinScaleFactor = 1.0f;
constexpr float kMaxScaleFactor = 3.0f;
constexpr uint64_t kWaitTimeoutNs = 10000000ull;  // 10 ms explicit wait timeout
constexpr unsigned long long kAdmissionCeilingBytes = 512ull * 1024ull * 1024ull;
constexpr unsigned long long kMetadataAllowanceBytes = 64ull * 1024ull;

enum class TickKind { Real, Missed, Stalled };

struct AppSwapchain {
    XrSwapchainCreateInfo info{};
    bool haveInfo = false;
    std::vector<uint32_t> textures;
    bool glesValid = false;
    // OpenXR permits more than one outstanding acquisition. Acquisition,
    // wait and release are FIFO; capture must use the image whose wait
    // actually completed, not merely the latest acquired index.
    std::deque<uint32_t> acquiredQueue;
    std::deque<uint32_t> waitedQueue;
};

struct PrivateSwapchain {
    XrSwapchain handle = XR_NULL_HANDLE;
    std::vector<uint32_t> textures;
    int w = 0, h = 0;
    GLint format = 0;
    uint32_t arraySize = 1;
};

struct CaptureTarget {
    XrSwapchain swapchain = XR_NULL_HANDLE;
    uint32_t arrayIndex = 0;
    bool layered = false;
    int slot = 0;
    int eye = 0;
    XrRect2Di rect{};
    int w = 0, h = 0;
    GLint format = 0;
};

struct SlotView {
    XrSwapchain srcSwap = XR_NULL_HANDLE;
    XrSwapchain outSwap = XR_NULL_HANDLE;
    uint32_t arrayIndex = 0;
    bool layered = false;
    XrRect2Di rect{};
    int w = 0, h = 0;
    GLint format = 0;
    uint32_t mvTex = 0;
    int mvW = 0, mvH = 0;
    uint32_t alignTex = 0;
};

struct SlotState {
    SlotView view[kEyes];
};

struct HistorySet {
    uint32_t tex[kMaxSlots][kEyes] = {};
    bool valid = false;
    uint64_t displayTime = 0;
    uint64_t sourceSerial = 0;
    float mat[kMaxSlots][kEyes][16] = {};
    float fov[kMaxSlots][kEyes][4] = {};
    // B's original per-projection pose is submitted verbatim; round-tripping
    // through a view matrix is unnecessary and previously inverted the yaw.
    XrPosef pose[kMaxSlots][kEyes] = {};
};

struct DispatchState {
    bool decisionMade = false;
    bool enabledForSession = false;
    bool glesBinding = false;
    bool estimatorInited = false;
    bool estimatorNeedsDestroy = false;
    bool dormantCleanupPending = false;
    bool estimatorFailed = false;
    bool overBudget = false;
    bool resourcesReady = false;
    int slotCount = 0;
    uint32_t inputW = 0, inputH = 0;
    int mvDefaultW = 0, mvDefaultH = 0;

    std::map<XrSwapchain, AppSwapchain> appSwapchains;
    std::map<XrSwapchain, PrivateSwapchain> privateSwapchains;
    std::vector<CaptureTarget> captureTargets;
    SlotState slots[kMaxSlots];

    HistorySet history[kHistorySets];
    int historyNewest = -1;
    int historyCount = 0;
    int captureSet = -1;
    bool captureValid = false;
    bool captureFailed = false;
    uint32_t captureMask = 0;
    uint32_t captureRequiredMask = 0;
    uint64_t captureFrameSerial = 0;
    uint64_t frameSerial = 0;
    bool captureAllowed = true;

    struct PendingOutput {
        XrSwapchain swapchain = XR_NULL_HANDLE;
        uint32_t index = 0;
        uint32_t texture = 0;
        bool waited = false;
    };
    static constexpr int kMaxPendingOutputs = 4;
    PendingOutput pendingOutputs[kMaxPendingOutputs];
    int pendingOutputCount = 0;

    bool schedInit = false;
    uint64_t schedLastPred = 0;
    uint64_t schedPeriod = 0;
    int schedPhase = 0;
    bool warmed = false;
    bool haveWaitPred = false;
    uint64_t waitPred = 0;
    uint64_t lastEndFramePred = 0;
    bool haveEndFramePred = false;

    bool haveTickEpoch = false;
    uint64_t tickEpoch = 0;
    int consecutiveMissed = 0;

    uint64_t layoutHash = 0;
    uint64_t layoutGeneration = 0;
    bool haveLayout = false;

    void* creationCtx = nullptr;
    uint32_t liveTextures = 0;
    uint32_t liveFbos = 0;
    bool ownsCounted = false;
    unsigned long long ownedBytes = 0;

    uint32_t lastMode = 0;
    uint64_t modeGeneration = 0;
    bool synthesisWasAllowed = false;

    int standDownTicks = 0;
    bool arrivalUnavailableLogged = false;
    bool estimatorFailedLogged = false;
    const char* fallbackReason = "none";

    uint64_t selectedFrames = 0;
    uint64_t discardedFrames = 0;
    uint64_t synthesizedFrames = 0;
    uint64_t committedFrames = 0;
    uint64_t lateFrames = 0;
    uint64_t fallbackFrames = 0;

    uint64_t pairMono[kClockPairsCap] = {0};
    uint64_t pairXr[kClockPairsCap] = {0};
    int pairCount = 0;
};

std::recursive_mutex g_mutex;
std::map<XrSession, DispatchState> g_sessions;
std::atomic<bool> g_userEnabled{true};
std::atomic<int> g_armState{0};
std::atomic<uint64_t> g_armRetryEndframes{0};
std::atomic<uint32_t> g_lastEstimatorStatus{0};
bool g_glTableSet = false;

PFN_xrGetInstanceProcAddr g_nextGipa = nullptr;
PFN_xrCreateSession g_nextCreateSession = nullptr;
PFN_xrDestroySession g_nextDestroySession = nullptr;
PFN_xrBeginFrame g_nextBeginFrame = nullptr;
PFN_xrWaitFrame g_nextWaitFrame = nullptr;
PFN_xrLocateViews g_nextLocateViews = nullptr;
PFN_xrEndFrame g_nextEndFrame = nullptr;
PFN_xrCreateSwapchain g_nextCreateSwapchain = nullptr;
PFN_xrDestroySwapchain g_nextDestroySwapchain = nullptr;
PFN_xrEnumerateSwapchainImages g_nextEnumerateImages = nullptr;
PFN_xrAcquireSwapchainImage g_nextAcquireImage = nullptr;
PFN_xrWaitSwapchainImage g_nextWaitImage = nullptr;
PFN_xrReleaseSwapchainImage g_nextReleaseImage = nullptr;

// ---------------------------------------------------------------------------
// Pure helpers (host tests drive these directly).
// ---------------------------------------------------------------------------

void SwpPoseToViewMatrix(const float pos[3], const float quat[4], float out[16]) {
    const float w = quat[0], x = quat[1], y = quat[2], z = quat[3];
    const float xx = x * x, yy = y * y, zz = z * z;
    const float xy = x * y, xz = x * z, yz = y * z;
    const float wx = w * x, wy = w * y, wz = w * z;
    // R_pose is the camera-local -> world rotation carried by XrPosef.
    const float r00 = 1.0f - 2.0f * (yy + zz), r01 = 2.0f * (xy - wz),
                r02 = 2.0f * (xz + wy);
    const float r10 = 2.0f * (xy + wz), r11 = 1.0f - 2.0f * (xx + zz),
                r12 = 2.0f * (yz - wx);
    const float r20 = 2.0f * (xz - wy), r21 = 2.0f * (yz + wx),
                r22 = 1.0f - 2.0f * (xx + yy);
    // The world->camera view rotation is R_pose^T. Column-major storage.
    out[0] = r00;  out[1] = r01;  out[2] = r02;  out[3] = 0.0f;
    out[4] = r10;  out[5] = r11;  out[6] = r12;  out[7] = 0.0f;
    out[8] = r20;  out[9] = r21;  out[10] = r22; out[11] = 0.0f;
    out[12] = -(r00 * pos[0] + r10 * pos[1] + r20 * pos[2]);
    out[13] = -(r01 * pos[0] + r11 * pos[1] + r21 * pos[2]);
    out[14] = -(r02 * pos[0] + r12 * pos[1] + r22 * pos[2]);
    out[15] = 1.0f;
}

bool SwpScaleFactorForMissedTick(uint64_t predDisp, uint64_t arrivalPrev, uint64_t arrivalNewest,
                                 float* outScale) {
    if (!outScale || !predDisp || !arrivalPrev || !arrivalNewest) return false;
    if (arrivalNewest <= arrivalPrev || predDisp < arrivalNewest) return false;
    const double numer = static_cast<double>(predDisp - arrivalPrev);
    const double denom = static_cast<double>(arrivalNewest - arrivalPrev);
    const double scale = numer / denom;
    if (std::isnan(scale) || scale < kMinScaleFactor || scale > kMaxScaleFactor) return false;
    *outScale = static_cast<float>(scale);
    return true;
}

[[maybe_unused]] bool SwpMonoToXrTime(uint64_t monoNewest, uint64_t xrNewest, uint64_t monoOlder,
                     uint64_t xrOlder, uint64_t monoArrival, uint64_t* outXr) {
    if (!outXr || monoNewest <= monoOlder || xrNewest <= xrOlder) return false;
    if (monoArrival < monoOlder || monoArrival > monoNewest) return false;
    const double spanMono = static_cast<double>(monoNewest - monoOlder);
    const double spanXr = static_cast<double>(xrNewest - xrOlder);
    const double offset = static_cast<double>(monoArrival - monoOlder);
    const double xr = static_cast<double>(xrOlder) + (offset / spanMono) * spanXr;
    *outXr = static_cast<uint64_t>(xr);
    return true;
}

TickKind SwpClassifyTick(uint64_t epochNow, uint64_t epochPrev, bool haveEpochPrev,
                         bool learningDisabled) {
    if (learningDisabled) return TickKind::Stalled;
    if (!haveEpochPrev) return TickKind::Real;
    if (epochNow == epochPrev) return TickKind::Missed;
    return TickKind::Real;
}

bool EnvDisabled() {
    static const bool disabled = std::getenv(kDisableEnv) != nullptr;
    return disabled;
}

// ---------------------------------------------------------------------------
// Estimator stubs (skeleton build only).
// ---------------------------------------------------------------------------
#if !defined(SWP_HAVE_ESTIMATOR)
#ifndef SWP_HOST_TESTS
extern "C" {
bool SwpInit(const SwpInitInfo*) { return false; }
void SwpDestroy() {}
bool SwpGenerateVectorsStereo(u32, u32, u32, u32, const float*, const float*, const float*,
                              const float*, u32, u32) { return false; }
bool SwpGenerateVectorsStereoEx(u32, u32, u32, u32, const float*, const float*, const float*,
                                const float*, u32, u32, u32, u32, u32, u32) { return false; }
bool SwpExtrapolateStereo(u32, u32, u32, u32, u32, u32, float) { return false; }
bool SwpExtrapolateStereoEx(u32, u32, u32, u32, u32, u32, int, int, float, u32, u32) {
    return false;
}
bool SwpAlignHistoryStereo(u32, u32, u32, u32, const float*, const float*, const float*,
                           const float*, const float*, const float*, const float*,
                           const float*, u32, u32) { return false; }
u32 SwpLastStatus() { return kStatusStandDown; }
unsigned long long SwpEstimatorFootprintBytes() { return 0; }
bool SwpGpuTimingAvailable() { return false; }
unsigned long long SwpLastGpuMicros() { return 0; }
}
#endif
#endif

DispatchState* StateForLocked(XrSession session) {
    auto it = g_sessions.find(session);
    return it == g_sessions.end() ? nullptr : &it->second;
}

void RateLimitedLog(DispatchState& state, const char* what) {
    state.standDownTicks++;
    if (state.standDownTicks % 30 == 1) {
        LOG("%s (fallback this tick; occurrences=%d status=0x%x)", what, state.standDownTicks,
            g_lastEstimatorStatus.load());
    }
}

void NoteFallback(DispatchState& state, const char* reason) {
    state.fallbackReason = reason;
    state.fallbackFrames++;
    RateLimitedLog(state, reason);
}

bool HasGlesBinding(const XrSessionCreateInfo* info) {
    for (const XrBaseInStructure* node = static_cast<const XrBaseInStructure*>(info->next); node;
         node = node->next) {
        if (node->type == XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR) return true;
    }
    return false;
}

int BytesPerPixel(GLint format) {
    switch (format) {
        case GL_RGBA16F: return 8;
        case GL_RGBA8:
        case GL_SRGB8_ALPHA8:
        case GL_RGB10_A2: return 4;
        case GL_RGB565:
        case GL_RGBA4: return 2;
        default: return 4;
    }
}

// --- owned GL names ---------------------------------------------------------

// Independent of the texture count: estimator/private initialization can fail
// before the first history texture exists. Settled Off reads only this flag.
std::atomic<bool> g_dormantCleanupPending{false};
std::atomic<uint32_t> g_synthOwners{0};
std::atomic<bool> g_deferredPending{false};
std::atomic<uint32_t> g_leakedTextures{0};
std::atomic<uint32_t> g_leakedFbos{0};

struct DeferredReclaim {
    void* ctx = nullptr;
    GLuint textures[40] = {};
    GLuint fbos[8] = {};
    uint32_t textureCount = 0;
    uint32_t fboCount = 0;
};
DeferredReclaim g_deferred;

bool ContextIsOwner(const DispatchState& state, void* ctx) {
    return ctx && ctx != EGL_NO_CONTEXT && state.creationCtx && ctx == state.creationCtx;
}

void MarkDormantCleanupLocked(DispatchState& state) {
    state.dormantCleanupPending = true;
    g_dormantCleanupPending.store(true, std::memory_order_relaxed);
}

void RefreshDormantCleanupLocked() {
    bool pending = false;
    for (const auto& entry : g_sessions) pending |= entry.second.dormantCleanupPending;
    g_dormantCleanupPending.store(pending, std::memory_order_relaxed);
}

void NoteOwnedLocked(DispatchState& state, uint32_t textures, uint32_t fbos) {
    MarkDormantCleanupLocked(state);
    if (!state.ownsCounted) {
        state.ownsCounted = true;
        g_synthOwners.fetch_add(1, std::memory_order_relaxed);
    }
    state.liveTextures += textures;
    state.liveFbos += fbos;
}

void NoteReleasedLocked(DispatchState& state, uint32_t textures, uint32_t fbos) {
    state.liveTextures = textures > state.liveTextures ? 0u : state.liveTextures - textures;
    state.liveFbos = fbos > state.liveFbos ? 0u : state.liveFbos - fbos;
    if (state.liveTextures == 0 && state.liveFbos == 0 && state.ownsCounted) {
        state.ownsCounted = false;
        g_synthOwners.fetch_sub(1, std::memory_order_relaxed);
    }
}

bool QueueTexture(DeferredReclaim& q, GLuint& id) {
    if (!id || q.textureCount >= 40) return false;
    q.textures[q.textureCount++] = id;
    id = 0;
    return true;
}

bool DeferReclaimLocked(DispatchState& state) {
    if (state.liveTextures == 0 && state.liveFbos == 0) return true;
    if (!state.creationCtx) {
        LOG("cannot defer reclaim: no creating context (%u textures, %u fbos)",
            state.liveTextures, state.liveFbos);
        return false;
    }
    if (g_deferred.ctx && g_deferred.ctx != state.creationCtx) {
        LOG("deferred reclaim holds another context; %u textures, %u fbos cannot be queued",
            state.liveTextures, state.liveFbos);
        return false;
    }
    g_deferred.ctx = state.creationCtx;
    uint32_t tex = 0, fbo = 0;
    for (int s = 0; s < kMaxSlots; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            for (int h = 0; h < kHistorySets; ++h) {
                if (QueueTexture(g_deferred, state.history[h].tex[s][e])) ++tex;
            }
            if (QueueTexture(g_deferred, state.slots[s].view[e].mvTex)) ++tex;
            if (QueueTexture(g_deferred, state.slots[s].view[e].alignTex)) ++tex;
        }
    }
    NoteReleasedLocked(state, tex, fbo);
    g_deferredPending.store(true, std::memory_order_relaxed);
    LOG("queued %u textures for reclaim on their creating context", tex);
    return true;
}

void DrainDeferredLocked(void* ctx) {
    if (!g_deferredPending.load(std::memory_order_relaxed)) return;
    if (!ctx || ctx != g_deferred.ctx) return;
    uint32_t tex = 0, fbo = 0;
    for (uint32_t i = 0; i < g_deferred.textureCount; ++i) {
        if (g_deferred.textures[i]) {
            glDeleteTextures(1, &g_deferred.textures[i]);
            ++tex;
        }
    }
    for (uint32_t i = 0; i < g_deferred.fboCount; ++i) {
        if (g_deferred.fbos[i]) {
            glDeleteFramebuffers(1, &g_deferred.fbos[i]);
            ++fbo;
        }
    }
    g_deferred = DeferredReclaim{};
    g_deferredPending.store(false, std::memory_order_relaxed);
    LOG("reclaimed %u deferred textures, %u framebuffers", tex, fbo);
}

bool ReleaseSynthesisResourcesLocked(DispatchState& state, void* ctx) {
    if (state.liveTextures == 0 && state.liveFbos == 0) return true;
    if (!ContextIsOwner(state, ctx)) return false;
    uint32_t tex = 0, fbo = 0;
    for (int s = 0; s < kMaxSlots; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            for (int h = 0; h < kHistorySets; ++h) {
                if (state.history[h].tex[s][e]) {
                    glDeleteTextures(1, &state.history[h].tex[s][e]);
                    ++tex;
                }
            }
            SlotView& view = state.slots[s].view[e];
            if (view.mvTex) { glDeleteTextures(1, &view.mvTex); view.mvTex = 0; ++tex; }
            if (view.alignTex) { glDeleteTextures(1, &view.alignTex); view.alignTex = 0; ++tex; }
        }
    }
    for (int h = 0; h < kHistorySets; ++h) state.history[h] = HistorySet{};
    state.historyNewest = -1;
    state.historyCount = 0;
    state.captureValid = false;
    state.captureFailed = false;
    state.captureMask = 0;
    state.captureSet = -1;
    state.pendingOutputCount = 0;
    state.ownedBytes = 0;
    state.resourcesReady = false;
    NoteReleasedLocked(state, tex, fbo);
    LOG("spacewarp resources released: %u textures, %u framebuffers (live %u/%u)", tex, fbo,
        state.liveTextures, state.liveFbos);
    return true;
}

void DestroyEstimatorForAllSessionsLocked() {
    bool any = false;
    for (auto& entry : g_sessions) {
        if (entry.second.estimatorNeedsDestroy) {
            entry.second.estimatorInited = false;
            entry.second.estimatorNeedsDestroy = false;
            any = true;
        }
    }
    if (any) SwpDestroy();
}


// One immutable history texture in the source's internal format.
bool AllocHistoryTexture(DispatchState& state, int w, int h, GLint format, uint32_t* out) {
    if (!out || w <= 0 || h <= 0 || format == 0) return false;
    glGenTextures(1, out);
    if (!*out) return false;
    GLint prevActive = GL_TEXTURE0, prevBinding = 0;
    glGetIntegerv(GL_ACTIVE_TEXTURE, &prevActive);
    glActiveTexture(GL_TEXTURE0);
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &prevBinding);
    glBindTexture(GL_TEXTURE_2D, *out);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexStorage2D(GL_TEXTURE_2D, 1, static_cast<GLenum>(format), w, h);
    const bool ok = glGetError() == GL_NO_ERROR;
    glBindTexture(GL_TEXTURE_2D, static_cast<GLuint>(prevBinding));
    glActiveTexture(static_cast<GLenum>(prevActive));
    if (!ok) {
        glDeleteTextures(1, out);
        *out = 0;
        return false;
    }
    NoteOwnedLocked(state, 1, 0);
    state.ownedBytes += static_cast<unsigned long long>(w) * h * BytesPerPixel(format);
    return true;
}

bool AllocMvTexture(DispatchState& state, int w, int h, uint32_t* out) {
    if (!out || w < 8 || h < 8) return false;
    glGenTextures(1, out);
    if (!*out) return false;
    GLint prevActive = GL_TEXTURE0, prevBinding = 0;
    glGetIntegerv(GL_ACTIVE_TEXTURE, &prevActive);
    glActiveTexture(GL_TEXTURE0);
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &prevBinding);
    glBindTexture(GL_TEXTURE_2D, *out);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA16F, w, h);
    const bool ok = glGetError() == GL_NO_ERROR;
    glBindTexture(GL_TEXTURE_2D, static_cast<GLuint>(prevBinding));
    glActiveTexture(static_cast<GLenum>(prevActive));
    if (!ok) {
        glDeleteTextures(1, out);
        *out = 0;
        return false;
    }
    NoteOwnedLocked(state, 1, 0);
    state.ownedBytes += static_cast<unsigned long long>(w) * h * 8ull;
    return true;
}

// --- app/private swapchain bookkeeping --------------------------------------

bool EnumeratePrivateImages(const PrivateSwapchain& priv, std::vector<uint32_t>* out) {
    if (!g_nextEnumerateImages || !out || priv.handle == XR_NULL_HANDLE) return false;
    struct SwapchainImageGles {
        XrStructureType type;
        const void* next;
        uint32_t image;
        uint32_t pad;
    };
    static_assert(sizeof(SwapchainImageGles) == 24, "GLES swapchain image stride mismatch");
    uint32_t count = 0;
    XrResult result = g_nextEnumerateImages(priv.handle, 0, &count, nullptr);
    if (XR_FAILED(result) || count == 0) return false;
    std::vector<SwapchainImageGles> images(count);
    for (auto& image : images) {
        image.type = XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR;
        image.next = nullptr;
    }
    result = g_nextEnumerateImages(
        priv.handle, count, &count,
        reinterpret_cast<XrSwapchainImageBaseHeader*>(images.data()));
    if (XR_FAILED(result) || count == 0 || count > images.size()) return false;
    out->clear();
    for (uint32_t i = 0; i < count; ++i) {
        if (images[i].type != XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR ||
            images[i].next != nullptr) {
            return false;
        }
        out->push_back(images[i].image);
    }
    return !out->empty();
}

PrivateSwapchain* PrivateForLocked(DispatchState& state, XrSwapchain appSwap) {
    auto it = state.privateSwapchains.find(appSwap);
    return it == state.privateSwapchains.end() ? nullptr : &it->second;
}

void RemovePendingOutputLocked(DispatchState& state, int index) {
    if (index < 0 || index >= state.pendingOutputCount) return;
    for (int i = index; i + 1 < state.pendingOutputCount; ++i) {
        state.pendingOutputs[i] = state.pendingOutputs[i + 1];
    }
    state.pendingOutputs[--state.pendingOutputCount] = DispatchState::PendingOutput{};
}

// OpenXR requires a successful wait before release. A timed-out acquisition is
// retained (bounded) and its wait is retried on a later tick; it is never
// released in an invalid order. Returns true when no pending acquisition
// remains.
bool DrainPendingOutputsLocked(DispatchState& state) {
    for (int i = 0; i < state.pendingOutputCount;) {
        DispatchState::PendingOutput& pending = state.pendingOutputs[i];
        if (!pending.waited) {
            XrSwapchainImageWaitInfo waitInfo{};
            waitInfo.type = XR_TYPE_SWAPCHAIN_IMAGE_WAIT_INFO;
            waitInfo.timeout = kWaitTimeoutNs;
            const XrResult waitResult = g_nextWaitImage(pending.swapchain, &waitInfo);
            if (waitResult == XR_TIMEOUT_EXPIRED) {
                ++i;
                continue;
            }
            if (XR_FAILED(waitResult)) {
                NoteFallback(state, "pending private wait failed");
                return false;
            }
            pending.waited = true;
        }
        if (XR_FAILED(g_nextReleaseImage(pending.swapchain, nullptr))) {
            NoteFallback(state, "pending private release failed");
            return false;
        }
        RemovePendingOutputLocked(state, i);
    }
    return state.pendingOutputCount == 0;
}

void DestroyPrivateForLocked(DispatchState& state, XrSwapchain appSwap) {
    auto it = state.privateSwapchains.find(appSwap);
    if (it == state.privateSwapchains.end()) return;
    if (g_nextDestroySwapchain && it->second.handle != XR_NULL_HANDLE) {
        g_nextDestroySwapchain(it->second.handle);
    }
    state.privateSwapchains.erase(it);
}

void DestroyAllPrivateLocked(DispatchState& state) {
    // Pending acquisitions cannot be released after their swapchains are
    // destroyed; the runtime owns their lifetime. Drop the bounded records.
    state.pendingOutputCount = 0;
    for (auto& entry : state.privateSwapchains) {
        if (g_nextDestroySwapchain && entry.second.handle != XR_NULL_HANDLE) {
            g_nextDestroySwapchain(entry.second.handle);
        }
    }
    state.privateSwapchains.clear();
}

bool EnsurePrivateSwapchainLocked(DispatchState& state, XrSession session, XrSwapchain appSwap,
                                  PrivateSwapchain** out) {
    auto existing = state.privateSwapchains.find(appSwap);
    if (existing != state.privateSwapchains.end()) {
        *out = &existing->second;
        return true;
    }
    auto appIt = state.appSwapchains.find(appSwap);
    if (appIt == state.appSwapchains.end() || !appIt->second.haveInfo) {
        NoteFallback(state, "app swapchain create-info unavailable");
        return false;
    }
    const AppSwapchain& app = appIt->second;
    XrSwapchainCreateInfo info = app.info;
    info.next = nullptr;
    info.sampleCount = 1;
    info.mipCount = 1;
    info.faceCount = 1;
    info.usageFlags |= XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT |
                       XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
    XrSwapchain handle = XR_NULL_HANDLE;
    MarkDormantCleanupLocked(state);
    const XrResult result = g_nextCreateSwapchain(session, &info, &handle);
    if (XR_FAILED(result) || handle == XR_NULL_HANDLE) {
        NoteFallback(state, "private swapchain create failed");
        return false;
    }
    PrivateSwapchain priv;
    priv.handle = handle;
    priv.w = static_cast<int>(info.width);
    priv.h = static_cast<int>(info.height);
    priv.format = static_cast<GLint>(info.format);
    priv.arraySize = info.arraySize;
    if (!EnumeratePrivateImages(priv, &priv.textures)) {
        g_nextDestroySwapchain(handle);
        NoteFallback(state, "private swapchain enumeration failed");
        return false;
    }
    priv.format = static_cast<GLint>(info.format);
    auto inserted = state.privateSwapchains.emplace(appSwap, std::move(priv));
    *out = &inserted.first->second;
    LOG("private swapchain created for app %p: %dx%d format 0x%x images %u", appSwap, info.width,
        info.height, (unsigned)priv.format, (unsigned)out[0]->textures.size());
    return true;
}

// --- capture ---------------------------------------------------------------

bool CopyTargetToHistory(DispatchState& state, const CaptureTarget& target, uint32_t srcTex,
                         uint32_t dstTex, int dstW, int dstH) {
    (void)state;
    if (!srcTex || !dstTex || target.w <= 0 || target.h <= 0) return false;
    GLuint readFbo = 0, drawFbo = 0;
    GLint prevRead = 0, prevDraw = 0;
    const GLboolean scissor = glIsEnabled(GL_SCISSOR_TEST);
    glGetIntegerv(GL_READ_FRAMEBUFFER_BINDING, &prevRead);
    glGetIntegerv(GL_DRAW_FRAMEBUFFER_BINDING, &prevDraw);
    glGenFramebuffers(1, &readFbo);
    glGenFramebuffers(1, &drawFbo);
    if (!readFbo || !drawFbo) {
        if (readFbo) glDeleteFramebuffers(1, &readFbo);
        if (drawFbo) glDeleteFramebuffers(1, &drawFbo);
        return false;
    }
    if (scissor) glDisable(GL_SCISSOR_TEST);
    glBindFramebuffer(GL_READ_FRAMEBUFFER, readFbo);
    if (target.layered) {
        glFramebufferTextureLayer(GL_READ_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, srcTex, 0,
                                  static_cast<GLint>(target.arrayIndex));
    } else {
        glFramebufferTexture2D(GL_READ_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, srcTex,
                               0);
    }
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, drawFbo);
    glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, dstTex, 0);
    bool ok = glCheckFramebufferStatus(GL_READ_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE &&
              glCheckFramebufferStatus(GL_DRAW_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE;
    if (ok) {
        glBlitFramebuffer(target.rect.offset.x, target.rect.offset.y,
                          target.rect.offset.x + target.w, target.rect.offset.y + target.h,
                          0, 0, dstW, dstH, GL_COLOR_BUFFER_BIT, GL_NEAREST);
    }
    if (glGetError() != GL_NO_ERROR) ok = false;
    glBindFramebuffer(GL_READ_FRAMEBUFFER, static_cast<GLuint>(prevRead));
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, static_cast<GLuint>(prevDraw));
    if (scissor) glEnable(GL_SCISSOR_TEST);
    glDeleteFramebuffers(1, &readFbo);
    glDeleteFramebuffers(1, &drawFbo);
    return ok;
}

void CaptureOnReleaseLocked(DispatchState& state, XrSwapchain swapchain, uint32_t releaseIndex) {
    if (!state.captureAllowed || state.slotCount <= 0 || state.captureRequiredMask == 0) return;
    auto appIt = state.appSwapchains.find(swapchain);
    if (appIt == state.appSwapchains.end()) return;
    if (releaseIndex >= appIt->second.textures.size()) return;
    const uint32_t srcTex = appIt->second.textures[releaseIndex];
    void* ctx = eglGetCurrentContext();
    if (!ctx || ctx == EGL_NO_CONTEXT) return;
    if (state.creationCtx && state.creationCtx != ctx) {
        NoteFallback(state, "capture context mismatch");
        return;
    }
    if (!state.creationCtx) state.creationCtx = ctx;
    const int writeSet = (state.historyNewest + 1) % kHistorySets;
    for (const CaptureTarget& target : state.captureTargets) {
        if (target.swapchain != swapchain) continue;
        HistorySet& set = state.history[writeSet];
        const uint32_t dst = set.tex[target.slot][target.eye];
        const uint32_t bit = 1u << static_cast<uint32_t>(target.slot * kEyes + target.eye);
        if (!dst) {
            NoteFallback(state, "history capture target missing");
            state.captureFailed = true;
            break;
        }
        if (!CopyTargetToHistory(state, target, srcTex, dst, target.w, target.h)) {
            NoteFallback(state, "history capture blit failed");
            state.captureFailed = true;
            break;
        }
        state.captureMask |= bit;
    }
    // A candidate is complete only when every required component/eye for this
    // frame copied successfully. One missing/reused component poisons the whole
    // candidate rather than producing a valid-looking stereo history.
    state.captureValid = !state.captureFailed &&
                         (state.captureMask & state.captureRequiredMask) ==
                             state.captureRequiredMask;
    if (state.captureValid) {
        state.captureSet = writeSet;
        state.captureFrameSerial = state.frameSerial;
    }
}

// --- layout -----------------------------------------------------------------

uint64_t HashLayout(const DispatchState& state) {
    uint64_t h = 1469598103934665603ull;
    auto mix = [&](uint64_t v) {
        h ^= v;
        h *= 1099511628211ull;
    };
    mix(static_cast<uint64_t>(state.slotCount));
    for (int s = 0; s < state.slotCount; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            const SlotView& v = state.slots[s].view[e];
            mix(reinterpret_cast<uintptr_t>(v.srcSwap));
            mix(v.arrayIndex);
            mix(static_cast<uint64_t>(v.rect.offset.x));
            mix(static_cast<uint64_t>(v.rect.offset.y));
            mix(static_cast<uint64_t>(v.rect.extent.width));
            mix(static_cast<uint64_t>(v.rect.extent.height));
            auto it = state.appSwapchains.find(v.srcSwap);
            if (it != state.appSwapchains.end()) {
                mix(it->second.info.width);
                mix(it->second.info.height);
                mix(it->second.info.format);
                mix(it->second.info.arraySize);
            }
        }
    }
    return h;
}

void ClearSynthesisStateLocked(DispatchState& state) {
    state.historyNewest = -1;
    state.historyCount = 0;
    state.captureValid = false;
    state.captureFailed = false;
    state.captureMask = 0;
    state.captureSet = -1;
    state.schedInit = false;
    state.warmed = false;
    state.consecutiveMissed = 0;
    state.haveTickEpoch = false;
    state.haveEndFramePred = false;
    state.haveWaitPred = false;
    state.pairCount = 0;
    state.fallbackReason = "none";
}

void SettleDormantLocked(DispatchState& state, void* ctx) {
    if (!state.dormantCleanupPending) return;
    if (state.synthesisWasAllowed || state.lastMode != 0 || state.haveTickEpoch) {
        SwpEglResetArrivals();
    }
    ClearSynthesisStateLocked(state);
    state.synthesisWasAllowed = false;
    state.lastMode = 0;
    state.haveLayout = false;
    state.captureAllowed = false;
    state.captureTargets.clear();
    // App acquisition/wait FIFO ownership survives mode and layout changes.
    // Outstanding app images may span this EndFrame and a later hot enable.
    DestroyAllPrivateLocked(state);
    const bool released = ReleaseSynthesisResourcesLocked(state, ctx);
    if (state.estimatorNeedsDestroy && ContextIsOwner(state, ctx)) {
        DestroyEstimatorForAllSessionsLocked();
    }
    if (released && !state.estimatorNeedsDestroy) {
        state.resourcesReady = false;
        state.estimatorFailed = false;
        state.creationCtx = nullptr;
        state.dormantCleanupPending = false;
    }
}

bool EnsureEstimatorLocked(DispatchState& state, int width, int height) {
    if (state.estimatorInited && state.inputW == static_cast<uint32_t>(width) &&
        state.inputH == static_cast<uint32_t>(height)) {
        return true;
    }
    if (state.estimatorFailed) return false;
#ifdef SWP_HAVE_ESTIMATOR
    if (!g_glTableSet) {
        static SwpGlTable table{};
        static bool built = false;
        if (!built) {
            table.glCreateShader = &glCreateShader;
            table.glShaderSource = &glShaderSource;
            table.glCompileShader = &glCompileShader;
            table.glGetShaderiv = &glGetShaderiv;
            table.glGetShaderInfoLog = &glGetShaderInfoLog;
            table.glDeleteShader = &glDeleteShader;
            table.glCreateProgram = &glCreateProgram;
            table.glAttachShader = &glAttachShader;
            table.glLinkProgram = &glLinkProgram;
            table.glGetProgramiv = &glGetProgramiv;
            table.glGetProgramInfoLog = &glGetProgramInfoLog;
            table.glDeleteProgram = &glDeleteProgram;
            table.glGetUniformLocation = &glGetUniformLocation;
            table.glUniform1i = &glUniform1i;
            table.glUniform2i = &glUniform2i;
            table.glUniform1f = &glUniform1f;
            table.glUniform2f = &glUniform2f;
            table.glUniform4f = &glUniform4f;
            table.glUniformMatrix3fv = &glUniformMatrix3fv;
            table.glUseProgram = &glUseProgram;
            table.glDrawArrays = &glDrawArrays;
            table.glViewport = &glViewport;
            table.glFlush = &glFlush;
            table.glGetError = &glGetError;
            table.glGenFramebuffers = &glGenFramebuffers;
            table.glDeleteFramebuffers = &glDeleteFramebuffers;
            table.glBindFramebuffer = &glBindFramebuffer;
            table.glFramebufferTexture2D = &glFramebufferTexture2D;
            table.glFramebufferTextureLayer = &glFramebufferTextureLayer;
            table.glCheckFramebufferStatus = &glCheckFramebufferStatus;
            table.glBlitFramebuffer = &glBlitFramebuffer;
            table.glGenTextures = &glGenTextures;
            table.glDeleteTextures = &glDeleteTextures;
            table.glBindTexture = &glBindTexture;
            table.glActiveTexture = &glActiveTexture;
            table.glTexStorage2D = &glTexStorage2D;
            table.glTexParameteri = &glTexParameteri;
            table.glTexSubImage2D = &glTexSubImage2D;
            table.glReadPixels = &glReadPixels;
            table.glGenSamplers = &glGenSamplers;
            table.glDeleteSamplers = &glDeleteSamplers;
            table.glBindSampler = &glBindSampler;
            table.glSamplerParameteri = &glSamplerParameteri;
            table.glGenQueries = &glGenQueries;
            table.glDeleteQueries = &glDeleteQueries;
            table.glBeginQuery = &glBeginQuery;
            table.glEndQuery = &glEndQuery;
            table.glGetQueryObjectuiv = &glGetQueryObjectuiv;
            table.glGetQueryiv = &glGetQueryiv;
            table.glGetString = &glGetString;
            table.glGetIntegerv = &glGetIntegerv;
            table.glIsEnabled = &glIsEnabled;
            table.glEnable = &glEnable;
            table.glDisable = &glDisable;
            table.glColorMask = &glColorMask;
            table.glGetBooleanv = &glGetBooleanv;
            table.getCurrentContext = []() -> void* {
                return reinterpret_cast<void*>(eglGetCurrentContext());
            };
            table.nowMicros = []() -> unsigned long long {
                return SwpEglMonotonicNs() / 1000ull;
            };
            built = true;
        }
        if (!SwpSetGlTable(&table)) {
            state.estimatorFailed = true;
            g_lastEstimatorStatus.store(SwpLastStatus() | kStatusStandDown);
            NoteFallback(state, "GL routing table rejected");
            return false;
        }
        g_glTableSet = true;
    }
#else
    state.estimatorFailed = true;
    NoteFallback(state, "estimator core absent");
    return false;
#endif

    SwpInitInfo init{};
    init.inputWidth = static_cast<uint32_t>(width);
    init.inputHeight = static_cast<uint32_t>(height);
    init.mvWidth = 0;
    init.mvHeight = 0;
    init.fovScale = 0.0f;
    init.flags = 0;
#ifdef SWP_HAVE_ESTIMATOR
    MarkDormantCleanupLocked(state);
    state.estimatorNeedsDestroy = true;
    if (!SwpInit(&init)) {
        state.estimatorFailed = true;
        g_lastEstimatorStatus.store(SwpLastStatus() | kStatusStandDown);
        NoteFallback(state, "estimator init failed");
        return false;
    }
    uint32_t mvW = 0, mvH = 0;
    if (!SwpResolvedMvSize(&mvW, &mvH) || mvW == 0 || mvH == 0) {
        state.estimatorFailed = true;
        DestroyEstimatorForAllSessionsLocked();
        NoteFallback(state, "estimator mv size unresolved");
        return false;
    }
    state.mvDefaultW = static_cast<int>(mvW);
    state.mvDefaultH = static_cast<int>(mvH);
#else
    return false;
#endif
    state.estimatorInited = true;
    state.inputW = static_cast<uint32_t>(width);
    state.inputH = static_cast<uint32_t>(height);
    g_lastEstimatorStatus.store(SwpLastStatus());
    LOG("estimator init native=%dx%d mv-default=%dx%d", width, height, state.mvDefaultW,
        state.mvDefaultH);
    return true;
}

bool EnsureLayoutResourcesLocked(DispatchState& state, XrSession session, int maxW, int maxH) {
    (void)maxW;
    (void)maxH;
    if (state.resourcesReady) return true;
    void* ctx = eglGetCurrentContext();
    if (!ctx || ctx == EGL_NO_CONTEXT) {
        NoteFallback(state, "no EGL context for layout resources");
        return false;
    }
    if (state.creationCtx && state.creationCtx != ctx) {
        NoteFallback(state, "layout context mismatch");
        return false;
    }
    if (!state.creationCtx) state.creationCtx = ctx;

    // Private outputs first (runtime objects), then GL history/maps.
    for (int s = 0; s < state.slotCount; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            SlotView& view = state.slots[s].view[e];
            PrivateSwapchain* priv = nullptr;
            if (!EnsurePrivateSwapchainLocked(state, session, view.srcSwap, &priv)) return false;
            view.outSwap = priv->handle;
            view.format = priv->format;
        }
    }

    for (int s = 0; s < state.slotCount; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            SlotView& view = state.slots[s].view[e];
            const int w = view.rect.extent.width;
            const int h = view.rect.extent.height;
            if (w <= 0 || h <= 0) return false;
            for (int hs = 0; hs < kHistorySets; ++hs) {
                if (!state.history[hs].tex[s][e] &&
                    !AllocHistoryTexture(state, w, h, view.format,
                                         &state.history[hs].tex[s][e])) {
                    NoteFallback(state, "history allocation failed");
                    return false;
                }
            }
            view.mvW = std::min(512, std::max(64, w / 2));
            view.mvH = std::min(512, std::max(64, h / 2));
            if (!view.mvTex && !AllocMvTexture(state, view.mvW, view.mvH, &view.mvTex)) {
                NoteFallback(state, "mv map allocation failed");
                return false;
            }
            if (!view.alignTex && !AllocMvTexture(state, w, h, &view.alignTex)) {
                NoteFallback(state, "alignment texture allocation failed");
                return false;
            }
        }
    }

    // Admission ledger: actual runtime output image counts + histories + maps
    // + the estimator's working pyramid. The 512 MiB ceiling is provisional.
    unsigned long long bytes = state.ownedBytes + kMetadataAllowanceBytes;
    for (const auto& entry : state.privateSwapchains) {
        const PrivateSwapchain& priv = entry.second;
        bytes += static_cast<unsigned long long>(priv.textures.size()) * priv.w * priv.h *
                 BytesPerPixel(priv.format) * std::max(1u, priv.arraySize);
    }
    if (state.estimatorInited) bytes += SwpEstimatorFootprintBytes();
    if (bytes > kAdmissionCeilingBytes) {
        state.overBudget = true;
        NoteFallback(state, "ASW resource admission over 512 MiB");
        LOG("ASW admission rejected: %llu bytes > %llu ceiling; preserving settings and stock pacing",
            bytes, kAdmissionCeilingBytes);
        return false;
    }
    state.overBudget = false;
    state.resourcesReady = true;
    LOG("ASW admission: %llu bytes (histories, %u outputs, maps, estimator)",
        bytes, (unsigned)state.privateSwapchains.size());
    return true;
}

bool BuildLayoutLocked(DispatchState& state, XrSession session, const XrCompositionLayerProjection* const* projs,
                       int firstSlot, int slotCount) {
    int maxW = 0, maxH = 0;
    for (int s = 0; s < slotCount; ++s) {
        const XrCompositionLayerProjection* p = projs[firstSlot + s];
        if (!p || p->viewCount != 2) return false;
        for (int e = 0; e < kEyes; ++e) {
            const XrCompositionLayerProjectionView& src = p->views[e];
            SlotView& view = state.slots[s].view[e];
            view.srcSwap = src.subImage.swapchain;
            view.arrayIndex = src.subImage.imageArrayIndex;
            view.rect = src.subImage.imageRect;
            view.w = src.subImage.imageRect.extent.width;
            view.h = src.subImage.imageRect.extent.height;
            if (view.srcSwap == XR_NULL_HANDLE || view.w <= 0 || view.h <= 0) return false;
            auto it = state.appSwapchains.find(view.srcSwap);
            if (it == state.appSwapchains.end() || !it->second.glesValid) return false;
            if (view.arrayIndex >= it->second.info.arraySize) return false;
            view.layered = it->second.info.arraySize > 1;
            view.format = static_cast<GLint>(it->second.info.format);
            maxW = std::max(maxW, view.w);
            maxH = std::max(maxH, view.h);
        }
    }
    state.slotCount = slotCount;

    uint32_t requiredMask = 0;
    for (int s = 0; s < slotCount; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            requiredMask |= 1u << static_cast<uint32_t>(s * kEyes + e);
        }
    }
    state.captureRequiredMask = requiredMask;

    const uint64_t hash = HashLayout(state);
    if (!state.haveLayout || hash != state.layoutHash) {
        // Retire the old set before arming the new layout. The caller holds the
        // creating context on this path; otherwise the tick stays stock.
        void* ctx = eglGetCurrentContext();
        if (state.liveTextures || state.liveFbos) {
            if (!ReleaseSynthesisResourcesLocked(state, ctx)) {
                NoteFallback(state, "layout change awaits creating context");
                return false;
            }
        }
        for (auto& entry : state.privateSwapchains) {
            if (g_nextDestroySwapchain && entry.second.handle != XR_NULL_HANDLE) {
                g_nextDestroySwapchain(entry.second.handle);
            }
        }
        state.privateSwapchains.clear();
        if (state.estimatorInited) {
            if (!ContextIsOwner(state, ctx)) {
                NoteFallback(state, "layout change awaits estimator context");
                return false;
            }
            DestroyEstimatorForAllSessionsLocked();
        }
        ClearSynthesisStateLocked(state);
        state.layoutHash = hash;
        ++state.layoutGeneration;
        state.haveLayout = true;
        state.captureTargets.clear();
        for (int s = 0; s < slotCount; ++s) {
            for (int e = 0; e < kEyes; ++e) {
                CaptureTarget target;
                target.swapchain = state.slots[s].view[e].srcSwap;
                target.arrayIndex = state.slots[s].view[e].arrayIndex;
                target.layered = state.slots[s].view[e].layered;
                target.slot = s;
                target.eye = e;
                target.rect = state.slots[s].view[e].rect;
                target.w = state.slots[s].view[e].w;
                target.h = state.slots[s].view[e].h;
                target.format = state.slots[s].view[e].format;
                state.captureTargets.push_back(target);
            }
        }
        LOG("spacewarp layout generation %llu: %d slots, max %dx%d", (unsigned long long)
                state.layoutGeneration, slotCount, maxW, maxH);
    }

    if (!EnsureEstimatorLocked(state, std::max(maxW, maxH), std::max(maxW, maxH))) return false;
    if (!EnsureLayoutResourcesLocked(state, session, maxW, maxH)) return false;
    return true;
}

// --- motion / synthesis -----------------------------------------------------

bool CommitCaptureLocked(DispatchState& state, const XrCompositionLayerProjection* const* projs,
                         int firstSlot, int slotCount, uint64_t displayTime) {
    if (!state.captureValid || state.captureSet < 0 ||
        state.captureFrameSerial != state.frameSerial ||
        state.captureFailed ||
        (state.captureMask & state.captureRequiredMask) != state.captureRequiredMask) {
        return false;
    }
    if (state.historyNewest >= 0 &&
        displayTime != 0 && displayTime <= state.history[state.historyNewest].displayTime) {
        state.captureValid = false;
        state.captureSet = -1;
        return false;  // duplicate/out-of-order presentation timestamp
    }
    HistorySet& set = state.history[state.captureSet];
    set.displayTime = displayTime;
    set.sourceSerial = state.frameSerial;
    set.valid = true;
    for (int s = 0; s < slotCount; ++s) {
        const XrCompositionLayerProjection* p = projs[firstSlot + s];
        for (int e = 0; e < kEyes; ++e) {
            const XrCompositionLayerProjectionView& v = p->views[e];
            const float pos[3] = {v.pose.position.x, v.pose.position.y, v.pose.position.z};
            const float quat[4] = {v.pose.orientation.w, v.pose.orientation.x,
                                   v.pose.orientation.y, v.pose.orientation.z};
            SwpPoseToViewMatrix(pos, quat, set.mat[s][e]);
            set.pose[s][e] = v.pose;
            set.fov[s][e][0] = v.fov.angleLeft;
            set.fov[s][e][1] = v.fov.angleRight;
            set.fov[s][e][2] = v.fov.angleUp;
            set.fov[s][e][3] = v.fov.angleDown;
        }
    }
    state.historyNewest = state.captureSet;
    if (state.historyCount < kHistorySets) ++state.historyCount;
    state.committedFrames++;
    state.captureValid = false;
    state.captureSet = -1;
    return true;
}

int PreviousHistoryIndex(const DispatchState& state) {
    if (state.historyCount < 2 || state.historyNewest < 0) return -1;
    int idx = (state.historyNewest + kHistorySets - 1) % kHistorySets;
    if (!state.history[idx].valid) idx = (state.historyNewest + 1) % kHistorySets;
    return state.history[idx].valid ? idx : -1;
}

bool GenerateVectorsLocked(DispatchState& state, int prevIndex) {
    if (prevIndex < 0 || state.historyNewest < 0) return false;
    const HistorySet& a = state.history[prevIndex];
    const HistorySet& b = state.history[state.historyNewest];
    for (int s = 0; s < state.slotCount; ++s) {
        const int w = state.slots[s].view[0].w;
        const int h = state.slots[s].view[0].h;
        for (int e = 0; e < kEyes; ++e) {
            SlotView& view = state.slots[s].view[e];
            if (!view.alignTex || !view.mvTex) return false;
        }
        if (!SwpAlignHistoryStereo(a.tex[s][0], a.tex[s][1], state.slots[s].view[0].alignTex,
                                   state.slots[s].view[1].alignTex,
                                   a.mat[s][0], a.mat[s][1], a.fov[s][0], a.fov[s][1],
                                   b.mat[s][0], b.mat[s][1], b.fov[s][0], b.fov[s][1], w, h)) {
            NoteFallback(state, "history rotation alignment failed");
            return false;
        }
        if (!SwpGenerateVectorsStereoEx(state.slots[s].view[0].alignTex,
                                        b.tex[s][0], state.slots[s].view[1].alignTex,
                                        b.tex[s][1], b.mat[s][0], b.mat[s][1],
                                        b.fov[s][0], b.fov[s][1],
                                        state.slots[s].view[0].mvTex,
                                        state.slots[s].view[1].mvTex, w, h,
                                        state.slots[s].view[0].mvW,
                                        state.slots[s].view[0].mvH)) {
            NoteFallback(state, "vector generation failed");
            return false;
        }
    }
    g_lastEstimatorStatus.store(SwpLastStatus());
    return true;
}

bool RenderSyntheticLocked(DispatchState& state, uint64_t predDisplayTime,
                           const XrCompositionLayerProjection* const* projs, int firstSlot,
                           int slotCount, XrCompositionLayerProjection* localProjs,
                           XrCompositionLayerProjectionView localViews[kMaxSlots][kEyes]) {
    if (state.historyNewest < 0 || state.historyCount < 2) {
        NoteFallback(state, "no A/B history for synthesis");
        return false;
    }
    const int prevIndex = PreviousHistoryIndex(state);
    if (prevIndex < 0) {
        NoteFallback(state, "no previous composite for synthesis");
        return false;
    }
    const HistorySet& a = state.history[prevIndex];
    const HistorySet& b = state.history[state.historyNewest];
    float scale = 0.0f;
    if (!SwpScaleFactorForMissedTick(predDisplayTime, a.displayTime, b.displayTime, &scale)) {
        NoteFallback(state, "synthesis scale out of range");
        return false;
    }
    if (state.schedPeriod != 0 && predDisplayTime > b.displayTime) {
        const uint64_t selectedPeriod = state.schedPeriod * 2ull;
        if (predDisplayTime - b.displayTime > selectedPeriod * 2ull) {
            NoteFallback(state, "source age exceeds two selected-real periods");
            return false;
        }
    }

    // Group the unique output swapchains required by every selected view.
    std::vector<XrSwapchain> outputs;
    for (int s = 0; s < slotCount; ++s) {
        for (int e = 0; e < kEyes; ++e) {
            const XrSwapchain out = state.slots[s].view[e].outSwap;
            if (out == XR_NULL_HANDLE) {
                NoteFallback(state, "private output unavailable");
                return false;
            }
            if (std::find(outputs.begin(), outputs.end(), out) == outputs.end()) {
                outputs.push_back(out);
            }
        }
    }

    if (state.pendingOutputCount > 0 && !DrainPendingOutputsLocked(state)) {
        NoteFallback(state, "pending private acquisition still incomplete");
        return false;
    }

    bool ok = true;
    for (XrSwapchain out : outputs) {
        PrivateSwapchain* priv = nullptr;
        for (int s = 0; s < slotCount && !priv; ++s) {
            for (int e = 0; e < kEyes && !priv; ++e) {
                if (state.slots[s].view[e].outSwap == out) {
                    priv = PrivateForLocked(state, state.slots[s].view[e].srcSwap);
                }
            }
        }
        if (!priv) { ok = false; break; }
        if (state.pendingOutputCount >= DispatchState::kMaxPendingOutputs) {
            NoteFallback(state, "pending private acquisition bound reached");
            ok = false;
            break;
        }
        uint32_t index = 0;
        XrResult r = g_nextAcquireImage(out, nullptr, &index);
        if (XR_FAILED(r) || index >= priv->textures.size()) { ok = false; break; }
        DispatchState::PendingOutput& pending =
            state.pendingOutputs[state.pendingOutputCount++];
        pending.swapchain = out;
        pending.index = index;
        pending.texture = priv->textures[index];
        pending.waited = false;
        XrSwapchainImageWaitInfo waitInfo{};
        waitInfo.type = XR_TYPE_SWAPCHAIN_IMAGE_WAIT_INFO;
        waitInfo.timeout = kWaitTimeoutNs;
        r = g_nextWaitImage(out, &waitInfo);
        if (r == XR_TIMEOUT_EXPIRED) {
            NoteFallback(state, "private swapchain wait timeout");
            ok = false;
            break;
        }
        if (XR_FAILED(r)) {
            NoteFallback(state, "private swapchain wait failed");
            ok = false;
            break;
        }
        pending.waited = true;
    }

    if (ok) {
        for (int s = 0; s < slotCount; ++s) {
            const SlotView& v0 = state.slots[s].view[0];
            const SlotView& v1 = state.slots[s].view[1];
            // One output swapchain may back both eyes (array layout). Find each
            // eye's acquired texture.
            uint32_t texL = 0, texR = 0;
            int layerL = -1, layerR = -1;
            for (int i = 0; i < state.pendingOutputCount; ++i) {
                const DispatchState::PendingOutput& aq = state.pendingOutputs[i];
                if (aq.swapchain == v0.outSwap) {
                    texL = aq.texture;
                    layerL = v0.layered ? static_cast<int>(v0.arrayIndex) : -1;
                }
                if (aq.swapchain == v1.outSwap) {
                    texR = aq.texture;
                    layerR = v1.layered ? static_cast<int>(v1.arrayIndex) : -1;
                }
            }
            if (!texL || !texR) { ok = false; break; }
            if (!SwpExtrapolateStereoEx(v0.mvTex, v1.mvTex, b.tex[s][0], b.tex[s][1], texL,
                                        texR, layerL, layerR, v0.rect.offset.x,
                                        v0.rect.offset.y, v1.rect.offset.x, v1.rect.offset.y,
                                        scale, v0.w, v0.h)) {
                NoteFallback(state, "synthetic warp failed");
                ok = false;
                break;
            }
        }
    }

    // A failed render still releases only images whose wait succeeded. A
    // timed-out acquisition stays pending for a later tick (never released in
    // an invalid order).
    const bool drained = DrainPendingOutputsLocked(state);
    if (!ok || !drained) {
        if (!drained) NoteFallback(state, "private outputs still pending after render");
        return false;
    }

    // Build frame-local projection copies only after every eye/component
    // rendered and released successfully.
    for (int s = 0; s < slotCount; ++s) {
        const XrCompositionLayerProjection* src = projs[firstSlot + s];
        localProjs[s] = *src;
        for (int e = 0; e < kEyes; ++e) {
            localViews[s][e] = src->views[e];
            localViews[s][e].subImage.swapchain = state.slots[s].view[e].outSwap;
            localViews[s][e].subImage.imageRect = state.slots[s].view[e].rect;
            localViews[s][e].subImage.imageArrayIndex = state.slots[s].view[e].arrayIndex;
            // B's original per-projection pose and FOV are submitted verbatim.
            // No view-matrix round trip: that inverted yaw sign in the previous
            // implementation. Runtime late reprojection then applies only the
            // display-time head delta.
            const HistorySet& hist = state.history[state.historyNewest];
            localViews[s][e].pose = hist.pose[s][e];
            localViews[s][e].fov.angleLeft = hist.fov[s][e][0];
            localViews[s][e].fov.angleRight = hist.fov[s][e][1];
            localViews[s][e].fov.angleUp = hist.fov[s][e][2];
            localViews[s][e].fov.angleDown = hist.fov[s][e][3];
        }
        localProjs[s].views = localViews[s];
    }
    state.synthesizedFrames++;
    return true;
}

}  // namespace

// ---------------------------------------------------------------------------
// Forwarding install.
// ---------------------------------------------------------------------------
extern "C" bool SwpDispatchSetNext(PFN_xrGetInstanceProcAddr gipa,
                                   PFN_xrCreateSession createSession,
                                   PFN_xrDestroySession destroySession,
                                   PFN_xrBeginFrame beginFrame,
                                   PFN_xrWaitFrame waitFrame,
                                   PFN_xrLocateViews locateViews,
                                   PFN_xrEndFrame endFrame,
                                   PFN_xrCreateSwapchain createSwapchain,
                                   PFN_xrDestroySwapchain destroySwapchain,
                                   PFN_xrEnumerateSwapchainImages enumerateSwapchainImages,
                                   PFN_xrAcquireSwapchainImage acquireSwapchainImage,
                                   PFN_xrWaitSwapchainImage waitSwapchainImage,
                                   PFN_xrReleaseSwapchainImage releaseSwapchainImage) {
    if (!gipa || !createSession || !destroySession || !beginFrame || !waitFrame ||
        !locateViews || !endFrame || !createSwapchain || !destroySwapchain ||
        !enumerateSwapchainImages || !acquireSwapchainImage || !waitSwapchainImage ||
        !releaseSwapchainImage) {
        return false;
    }
    g_nextGipa = gipa;
    g_nextCreateSession = createSession;
    g_nextDestroySession = destroySession;
    g_nextBeginFrame = beginFrame;
    g_nextWaitFrame = waitFrame;
    g_nextLocateViews = locateViews;
    g_nextEndFrame = endFrame;
    g_nextCreateSwapchain = createSwapchain;
    g_nextDestroySwapchain = destroySwapchain;
    g_nextEnumerateImages = enumerateSwapchainImages;
    g_nextAcquireImage = acquireSwapchainImage;
    g_nextWaitImage = waitSwapchainImage;
    g_nextReleaseImage = releaseSwapchainImage;
    return true;
}

extern "C" {

void SwpDispatchTryArm() {
    if (g_armState.load(std::memory_order_relaxed) != 0) return;
    if (EnvDisabled()) {
        g_armState.store(2, std::memory_order_relaxed);
        LOG("disabled by %s", kDisableEnv);
        return;
    }
    if (SwpHooksArm()) g_armState.store(1, std::memory_order_relaxed);
    SwpVtsArm();
}

XrResult SwpDispatchCreateSession(XrInstance instance, const XrSessionCreateInfo* createInfo,
                                  XrSession* session) {
    SwpDispatchTryArm();
    const XrResult result = g_nextCreateSession(instance, createInfo, session);
    if (XR_FAILED(result) || !session || !*session || !createInfo) return result;
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    DispatchState state;
    state.glesBinding = HasGlesBinding(createInfo);
    state.enabledForSession = state.glesBinding && g_userEnabled.load() && !EnvDisabled();
    state.decisionMade = true;
    SwpVtsResetSession();
    g_sessions[*session] = state;
    return result;
}

XrResult SwpDispatchDestroySession(XrSession session) {
    SwpDispatchTryArm();
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    auto it = g_sessions.find(session);
    if (it != g_sessions.end()) {
        DispatchState& state = it->second;
        // Private runtime swapchains must be destroyed before their parent
        // session; GL names are released only on their creating context.
        DestroyAllPrivateLocked(state);
        void* ctx = state.dormantCleanupPending ? eglGetCurrentContext() : nullptr;
        if (!ReleaseSynthesisResourcesLocked(state, ctx)) {
            const uint32_t stillTextures = state.liveTextures;
            const uint32_t stillFbos = state.liveFbos;
            if (DeferReclaimLocked(state)) {
                LOG("session destroy: %u textures, %u framebuffers queued", stillTextures,
                    stillFbos);
            } else {
                g_leakedTextures.fetch_add(stillTextures);
                g_leakedFbos.fetch_add(stillFbos);
                NoteReleasedLocked(state, state.liveTextures, state.liveFbos);
                LOG("session destroy: %u textures, %u framebuffers LEAKED", stillTextures,
                    stillFbos);
            }
        }
        const bool gpuTiming = state.estimatorNeedsDestroy && SwpGpuTimingAvailable();
        const unsigned long long gpuMicros = state.estimatorNeedsDestroy ? SwpLastGpuMicros() : 0;
        if (state.estimatorNeedsDestroy) {
            if (ContextIsOwner(state, ctx)) {
                DestroyEstimatorForAllSessionsLocked();
            } else {
                LOG("session destroy: estimator teardown deferred");
            }
        }
        LOG("spacewarp counters: selected=%llu discarded=%llu synthesized=%llu committed=%llu late=%llu fallback=%llu reason=%s gpu-timing=%d gpu-us=%llu",
            (unsigned long long)state.selectedFrames,
            (unsigned long long)state.discardedFrames,
            (unsigned long long)state.synthesizedFrames,
            (unsigned long long)state.committedFrames,
            (unsigned long long)state.lateFrames,
            (unsigned long long)state.fallbackFrames, state.fallbackReason,
            gpuTiming ? 1 : 0, gpuMicros);
        SwpVtsSessionEnded();
        g_sessions.erase(it);
        RefreshDormantCleanupLocked();
    }
    return g_nextDestroySession(session);
}

XrResult SwpDispatchBeginFrame(XrSession session, const XrFrameBeginInfo* frameBeginInfo) {
    return g_nextBeginFrame(session, frameBeginInfo);
}

XrResult SwpDispatchWaitFrame(XrSession session, const XrFrameWaitInfo* frameWaitInfo,
                              XrFrameState* frameState) {
    const XrResult result = g_nextWaitFrame(session, frameWaitInfo, frameState);
    if (XR_FAILED(result) || !frameState) return result;
    if (SwpVtsMode() == 0) return result;
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    DispatchState* state = StateForLocked(session);
    if (!state || !state->enabledForSession) return result;
    MarkDormantCleanupLocked(*state);
    const uint64_t pred = frameState->predictedDisplayTime;
    const uint64_t period = frameState->predictedDisplayPeriod;
    if (pred == 0) return result;
    const uint32_t mode = SwpVtsMode();
    if (!state->schedInit) {
        state->schedInit = true;
        state->schedLastPred = pred;
        state->schedPeriod = period;
        state->schedPhase = 0;
        state->waitPred = pred;
        state->haveWaitPred = true;
        ++state->frameSerial;
        state->captureMask = 0;
        state->captureFailed = false;
        state->captureValid = false;
        state->captureSet = -1;
        state->captureAllowed = true;
        return result;
    }
    if (period != 0) {
        if (state->schedPeriod != 0 &&
            std::llabs(static_cast<long long>(period) - static_cast<long long>(state->schedPeriod)) >
                static_cast<long long>(state->schedPeriod / 20)) {  // >5% refresh change
            ClearSynthesisStateLocked(*state);
            state->schedInit = true;
            state->schedLastPred = pred;
            state->schedPeriod = period;
            state->schedPhase = 0;
            state->waitPred = pred;
            state->haveWaitPred = true;
            ++state->frameSerial;
            state->captureMask = 0;
            state->captureFailed = false;
            state->captureValid = false;
            state->captureSet = -1;
            state->captureAllowed = true;
            LOG("spacewarp refresh change (period %llu -> %llu); rewarming",
                (unsigned long long)state->schedPeriod, (unsigned long long)period);
            return result;
        }
        state->schedPeriod = period;
    }
    if (pred > state->schedLastPred) {
        const uint64_t delta = pred - state->schedLastPred;
        int steps = 1;
        if (state->schedPeriod != 0 && delta >= state->schedPeriod) {
            steps = static_cast<int>((delta + state->schedPeriod / 2) / state->schedPeriod);
            if (steps < 1) steps = 1;
        }
        state->schedLastPred = pred;
        state->schedPhase = state->warmed ? ((state->schedPhase + steps) & 1) : 0;
        state->waitPred = pred;
        state->haveWaitPred = true;
        ++state->frameSerial;
        state->captureMask = 0;
        state->captureFailed = false;
        state->captureValid = false;
        state->captureSet = -1;
        state->captureAllowed = mode != kModeHalfRate || !state->warmed ||
                                state->schedPhase == 0;
    } else {
        // Duplicate/out-of-order predicted time: do not advance the phase or
        // the frame serial.
        state->captureAllowed = false;
    }
    return result;
}

XrResult SwpDispatchLocateViews(XrSession session, const XrViewLocateInfo* viewLocateInfo,
                                XrViewState* viewState, uint32_t viewCapacityInput,
                                uint32_t* viewCountOutput, XrView* views) {
    return g_nextLocateViews(session, viewLocateInfo, viewState, viewCapacityInput,
                             viewCountOutput, views);
}

XrResult SwpDispatchEndFrame(XrSession session, const XrFrameEndInfo* frameEndInfo) {
    // Session creation tries immediately. If the scene library loads later,
    // retry discovery before the matching control poll, never every XR call.
    if (g_armState.load(std::memory_order_relaxed) == 0 &&
        (g_armRetryEndframes.fetch_add(1, std::memory_order_relaxed) + 1) % 60 == 0) {
        SwpDispatchTryArm();
    }
    if (SwpVtsMode() == 0) {
        if (g_dormantCleanupPending.load(std::memory_order_relaxed) ||
            g_deferredPending.load(std::memory_order_relaxed)) {
            std::lock_guard<std::recursive_mutex> offLock(g_mutex);
            void* offCtx = eglGetCurrentContext();
            DrainDeferredLocked(offCtx);
            if (DispatchState* offState = StateForLocked(session)) {
                SettleDormantLocked(*offState, offCtx);
            }
            RefreshDormantCleanupLocked();
        }
        SwpVtsNoteEndFrame();
        return g_nextEndFrame(session, frameEndInfo);
    }
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    if (g_deferredPending.load(std::memory_order_relaxed)) DrainDeferredLocked(eglGetCurrentContext());

    DispatchState* state = StateForLocked(session);
    if (!state || !state->enabledForSession) {
        if (state && (state->liveTextures || state->liveFbos || state->estimatorInited)) {
            void* ctx = eglGetCurrentContext();
            if (!ReleaseSynthesisResourcesLocked(*state, ctx)) {
                RateLimitedLog(*state, "disabled session: GL names await their context");
            }
            DestroyAllPrivateLocked(*state);
        }
        return g_nextEndFrame(session, frameEndInfo);
    }

    SwpVtsNoteEndFrame();
    const uint32_t mode = SwpVtsMode();
    if (mode == 0) {
        SettleDormantLocked(*state, eglGetCurrentContext());
        RefreshDormantCleanupLocked();
        return g_nextEndFrame(session, frameEndInfo);
    }
    MarkDormantCleanupLocked(*state);
    // Retry pending private waits only while synthesis is enabled.
    if (state->pendingOutputCount > 0) DrainPendingOutputsLocked(*state);
    const uint64_t generation = SwpVtsGeneration();
    if (!state->synthesisWasAllowed || generation != state->modeGeneration ||
        mode != state->lastMode) {
        if (state->lastMode != 0 || state->modeGeneration != 0) SwpEglResetArrivals();
        ClearSynthesisStateLocked(*state);
        state->warmed = false;
    }
    state->synthesisWasAllowed = true;
    state->lastMode = mode;
    state->modeGeneration = generation;

    if (!frameEndInfo) return g_nextEndFrame(session, frameEndInfo);
    if (frameEndInfo->layerCount > kMaxCompositionLayers) {
        NoteFallback(*state, "composition layer count exceeds the audited bound");
        return g_nextEndFrame(session, frameEndInfo);
    }
    const uint64_t displayTime = frameEndInfo->displayTime != 0
                                     ? frameEndInfo->displayTime
                                     : (state->haveWaitPred ? state->waitPred : 0);
    if (displayTime != 0) {
        state->lastEndFramePred = displayTime;
        state->haveEndFramePred = true;
    }

    // Clock anchors for the late-frame path's arrival conversion.
    for (int i = state->pairCount - 1; i > 0 && i < kClockPairsCap; --i) {
        state->pairMono[i] = state->pairMono[i - 1];
        state->pairXr[i] = state->pairXr[i - 1];
    }
    if (state->pairCount < kClockPairsCap) ++state->pairCount;
    state->pairMono[0] = SwpEglMonotonicNs();
    state->pairXr[0] = displayTime;

    // Projection slots (audited [base,foveated] or [underside,base,foveated]).
    const XrCompositionLayerProjection* projs[kMaxProjectionLayers] = {};
    uint32_t projCount = 0;
    for (uint32_t i = 0; i < frameEndInfo->layerCount; ++i) {
        const XrCompositionLayerBaseHeader* layer = frameEndInfo->layers[i];
        if (!layer || layer->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION) continue;
        if (projCount < kMaxProjectionLayers) {
            projs[projCount] = reinterpret_cast<const XrCompositionLayerProjection*>(layer);
        }
        ++projCount;
    }
    int firstSlot = -1;
    if (projCount == 2) firstSlot = 0;
    else if (projCount == 3) firstSlot = 1;
    if (firstSlot < 0 || projCount > kMaxProjectionLayers) {
        NoteFallback(*state, "unaudited projection composition");
        return g_nextEndFrame(session, frameEndInfo);
    }
    const int slotCount = 2;
    for (int s = 0; s < slotCount; ++s) {
        const XrCompositionLayerProjection* p = projs[firstSlot + s];
        if (!p || p->viewCount != 2) {
            state->enabledForSession = false;
            NoteFallback(*state, "unsupported projection viewCount");
            return g_nextEndFrame(session, frameEndInfo);
        }
        const XrExtent2Di& e0 = p->views[0].subImage.imageRect.extent;
        const XrExtent2Di& e1 = p->views[1].subImage.imageRect.extent;
        if (e0.width != e1.width || e0.height != e1.height || e0.width <= 0 || e0.height <= 0) {
            NoteFallback(*state, "projection eyes disagree on extent");
            return g_nextEndFrame(session, frameEndInfo);
        }
    }

    void* currentCtx = eglGetCurrentContext();
    if (!currentCtx || currentCtx == EGL_NO_CONTEXT) {
        NoteFallback(*state, "no current EGL context");
        return g_nextEndFrame(session, frameEndInfo);
    }
    if (state->creationCtx && state->creationCtx != currentCtx) {
        NoteFallback(*state, "current EGL context does not match");
        // A new context invalidates the old GL namespace. Queue the old names
        // for their creating context, reset the decision/history, and let the
        // next tick allocate the enabled set on the new context.
        if (state->liveTextures || state->liveFbos) DeferReclaimLocked(*state);
        DestroyAllPrivateLocked(*state);
        ClearSynthesisStateLocked(*state);
        state->creationCtx = nullptr;
        state->resourcesReady = false;
        state->estimatorInited = false;
        return g_nextEndFrame(session, frameEndInfo);
    }
    if (!state->creationCtx) state->creationCtx = currentCtx;
#ifdef SWP_HAVE_ESTIMATOR
    SwpBindIdentityContext(currentCtx);
#endif

    if (!BuildLayoutLocked(*state, session, projs, firstSlot, slotCount)) {
        return g_nextEndFrame(session, frameEndInfo);
    }

    // Local frame copies only when a synthetic tick substitutes views.
    XrCompositionLayerProjection localProjs[kMaxSlots]{};
    XrCompositionLayerProjectionView localViews[kMaxSlots][kEyes]{};
    const XrCompositionLayerBaseHeader* localLayerPtrs[kMaxCompositionLayers] = {};
    XrFrameEndInfo localInfo{};
    bool substituted = false;

    auto commitAndGenerate = [&]() {
        const bool committed = CommitCaptureLocked(*state, projs, firstSlot, slotCount, displayTime);
        if (committed) {
            state->selectedFrames++;
            const int prev = PreviousHistoryIndex(*state);
            if (prev >= 0) {
                if (!GenerateVectorsLocked(*state, prev)) {
                    state->warmed = false;
                } else {
                    state->warmed = true;
                }
            }
        }
        return committed;
    };

    if (mode == kModeHalfRate) {
        const bool synthetic = state->warmed && state->schedPhase == 1;
        if (synthetic) {
            // Fresh frames arriving during a synthetic slot are discarded from
            // presentation and history.
            state->captureValid = false;
            state->captureSet = -1;
            state->discardedFrames++;
            if (RenderSyntheticLocked(*state, displayTime, projs, firstSlot, slotCount,
                                      localProjs, localViews)) {
                localInfo = *frameEndInfo;
                uint32_t outIndex = 0;
                for (uint32_t i = 0; i < frameEndInfo->layerCount && outIndex < kMaxCompositionLayers; ++i) {
                    const XrCompositionLayerBaseHeader* layer = frameEndInfo->layers[i];
                    bool replaced = false;
                    if (layer && layer->type == XR_TYPE_COMPOSITION_LAYER_PROJECTION) {
                        const auto* p = reinterpret_cast<const XrCompositionLayerProjection*>(layer);
                        for (int s = 0; s < slotCount; ++s) {
                            if (p == projs[firstSlot + s]) {
                                localLayerPtrs[outIndex] =
                                    reinterpret_cast<const XrCompositionLayerBaseHeader*>(&localProjs[s]);
                                replaced = true;
                                break;
                            }
                        }
                    }
                    if (!replaced) localLayerPtrs[outIndex] = layer;
                    ++outIndex;
                }
                localInfo.layers = localLayerPtrs;
                localInfo.layerCount = outIndex;
                substituted = true;
            } else {
                return g_nextEndFrame(session, frameEndInfo);
            }
        } else {
            commitAndGenerate();
            // A selected-real slot always presents the app's own composite.
        }
    } else {
        // Late-frame recovery: classify from the captured arrival epoch.
        uint64_t epochNow = 0;
        void* arrivalCtx = nullptr;
        void* arrivalDpy = nullptr;
        const bool haveArrival = SwpEglArrivalSnapshot(&epochNow, &arrivalCtx, &arrivalDpy);
        const bool learningDisabled = SwpEglLearningDisabled();
        if (!haveArrival || learningDisabled) {
            if (!state->arrivalUnavailableLogged) {
                state->arrivalUnavailableLogged = true;
                LOG("%s; late-frame synthesis stays stock for this session",
                    learningDisabled ? "arrival learning disabled" : "arrival snapshot unavailable");
            }
            return g_nextEndFrame(session, frameEndInfo);
        }
        const TickKind kind = SwpClassifyTick(epochNow, state->tickEpoch, state->haveTickEpoch,
                                              false);
        state->tickEpoch = epochNow;
        state->haveTickEpoch = true;
        const bool committed = commitAndGenerate();
        if (kind == TickKind::Real || committed) {
            state->consecutiveMissed = 0;
        } else {
            state->consecutiveMissed++;
            if (state->consecutiveMissed > kMaxConsecutiveMissed) {
                NoteFallback(*state, "consecutive missed-tick cap");
                return g_nextEndFrame(session, frameEndInfo);
            }
            if (!state->warmed) {
                NoteFallback(*state, "late-frame history not warm");
                return g_nextEndFrame(session, frameEndInfo);
            }
            if (RenderSyntheticLocked(*state, displayTime, projs, firstSlot, slotCount,
                                      localProjs, localViews)) {
                localInfo = *frameEndInfo;
                uint32_t outIndex = 0;
                for (uint32_t i = 0; i < frameEndInfo->layerCount && outIndex < kMaxCompositionLayers; ++i) {
                    const XrCompositionLayerBaseHeader* layer = frameEndInfo->layers[i];
                    bool replaced = false;
                    if (layer && layer->type == XR_TYPE_COMPOSITION_LAYER_PROJECTION) {
                        const auto* p = reinterpret_cast<const XrCompositionLayerProjection*>(layer);
                        for (int s = 0; s < slotCount; ++s) {
                            if (p == projs[firstSlot + s]) {
                                localLayerPtrs[outIndex] =
                                    reinterpret_cast<const XrCompositionLayerBaseHeader*>(&localProjs[s]);
                                replaced = true;
                                break;
                            }
                        }
                    }
                    if (!replaced) localLayerPtrs[outIndex] = layer;
                    ++outIndex;
                }
                localInfo.layers = localLayerPtrs;
                localInfo.layerCount = outIndex;
                substituted = true;
                state->lateFrames++;
            } else {
                return g_nextEndFrame(session, frameEndInfo);
            }
        }
    }

    return substituted ? g_nextEndFrame(session, &localInfo)
                       : g_nextEndFrame(session, frameEndInfo);
}

XrResult SwpDispatchCreateSwapchain(XrSession session, const XrSwapchainCreateInfo* createInfo,
                                    XrSwapchain* swapchain) {
    const XrResult result = g_nextCreateSwapchain(session, createInfo, swapchain);
    if (XR_SUCCEEDED(result) && createInfo && swapchain && *swapchain) {
        std::lock_guard<std::recursive_mutex> lock(g_mutex);
        auto it = g_sessions.find(session);
        if (it != g_sessions.end()) {
            AppSwapchain app;
            app.info = *createInfo;
            app.info.next = nullptr;
            app.haveInfo = true;
            it->second.appSwapchains[*swapchain] = app;
        }
    }
    return result;
}

XrResult SwpDispatchDestroySwapchain(XrSwapchain swapchain) {
    std::lock_guard<std::recursive_mutex> lock(g_mutex);
    for (auto& entry : g_sessions) {
        DispatchState& state = entry.second;
        DestroyPrivateForLocked(state, swapchain);
        auto it = state.appSwapchains.find(swapchain);
        if (it != state.appSwapchains.end()) {
            state.appSwapchains.erase(it);
            state.haveLayout = false;  // next endframe rebuilds the layout
        }
    }
    return g_nextDestroySwapchain(swapchain);
}

XrResult SwpDispatchEnumerateSwapchainImages(XrSwapchain swapchain, uint32_t countInput,
                                             uint32_t* countOutput,
                                             XrSwapchainImageBaseHeader* images) {
    const XrResult result = g_nextEnumerateImages(swapchain, countInput, countOutput, images);
    if (XR_SUCCEEDED(result) && images && countOutput && *countOutput > 0) {
        std::lock_guard<std::recursive_mutex> lock(g_mutex);
        struct SwapchainImageGles {
            XrStructureType type;
            const void* next;
            uint32_t image;
            uint32_t pad;
        };
        static_assert(sizeof(SwapchainImageGles) == 24, "GLES swapchain image stride mismatch");
        for (auto& sessionPair : g_sessions) {
            DispatchState& state = sessionPair.second;
            auto it = state.appSwapchains.find(swapchain);
            if (it == state.appSwapchains.end()) continue;
            AppSwapchain& app = it->second;
            app.glesValid = true;
            app.textures.clear();
            for (uint32_t i = 0; i < *countOutput; ++i) {
                SwapchainImageGles probe{};
                std::memcpy(&probe, reinterpret_cast<const char*>(images) + i * sizeof(probe),
                            sizeof(probe));
                if (probe.type != XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR) {
                    app.glesValid = false;
                    break;
                }
                app.textures.push_back(probe.image);
            }
        }
    }
    return result;
}

XrResult SwpDispatchAcquireSwapchainImage(XrSwapchain swapchain,
                                          const XrSwapchainImageAcquireInfo* acquireInfo,
                                          uint32_t* index) {
    const XrResult result = g_nextAcquireImage(swapchain, acquireInfo, index);
    if (XR_SUCCEEDED(result) && index) {
        std::lock_guard<std::recursive_mutex> lock(g_mutex);
        for (auto& sessionPair : g_sessions) {
            auto it = sessionPair.second.appSwapchains.find(swapchain);
            if (it == sessionPair.second.appSwapchains.end()) continue;
            it->second.acquiredQueue.push_back(*index);
        }
    }
    return result;
}

XrResult SwpDispatchWaitSwapchainImage(XrSwapchain swapchain,
                                       const XrSwapchainImageWaitInfo* waitInfo) {
    const XrResult result = g_nextWaitImage(swapchain, waitInfo);
    // XR_TIMEOUT_EXPIRED is a nonnegative status, but does not complete the
    // wait or move the oldest acquisition into the releasable FIFO.
    if (XR_SUCCEEDED(result) && result != XR_TIMEOUT_EXPIRED) {
        std::lock_guard<std::recursive_mutex> lock(g_mutex);
        for (auto& sessionPair : g_sessions) {
            auto it = sessionPair.second.appSwapchains.find(swapchain);
            if (it == sessionPair.second.appSwapchains.end()) continue;
            if (!it->second.acquiredQueue.empty()) {
                const uint32_t waited = it->second.acquiredQueue.front();
                it->second.acquiredQueue.pop_front();
                it->second.waitedQueue.push_back(waited);
            }
        }
    }
    return result;
}

XrResult SwpDispatchReleaseSwapchainImage(XrSwapchain swapchain,
                                          const XrSwapchainImageReleaseInfo* releaseInfo) {
    uint32_t releaseIndex = 0;
    bool haveReleaseIndex = false;
    {
        std::lock_guard<std::recursive_mutex> lock(g_mutex);
        for (auto& sessionPair : g_sessions) {
            DispatchState& state = sessionPair.second;
            auto it = state.appSwapchains.find(swapchain);
            if (it == state.appSwapchains.end() || it->second.waitedQueue.empty()) continue;
            releaseIndex = it->second.waitedQueue.front();
            haveReleaseIndex = true;
            if (SwpVtsMode() != 0 && state.enabledForSession && state.captureAllowed) {
                CaptureOnReleaseLocked(state, swapchain, releaseIndex);
            }
        }
    }
    const XrResult result = g_nextReleaseImage(swapchain, releaseInfo);
    if (XR_SUCCEEDED(result) && haveReleaseIndex) {
        std::lock_guard<std::recursive_mutex> lock(g_mutex);
        for (auto& sessionPair : g_sessions) {
            auto it = sessionPair.second.appSwapchains.find(swapchain);
            if (it != sessionPair.second.appSwapchains.end() &&
                !it->second.waitedQueue.empty()) {
                it->second.waitedQueue.pop_front();
            }
        }
    }
    return result;
}

#if defined(_MSC_VER)
#define EXPORT
#elif !defined(EXPORT)
#define EXPORT __attribute__((visibility("default")))
#endif
EXPORT void SwpSetEnabled(bool enabled) {
    g_userEnabled.store(enabled, std::memory_order_relaxed);
}
EXPORT bool SwpGetEnabled() { return g_userEnabled.load(std::memory_order_relaxed); }

}  // extern "C"

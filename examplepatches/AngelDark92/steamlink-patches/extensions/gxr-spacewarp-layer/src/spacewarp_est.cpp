// spacewarp_est.cpp — contract entries + orchestration for the spacewarp
// estimator core (gxr-spacewarp-layer).
//
// 2026-10-26 dense coarse-to-fine revision:
//   - input dimensions may be nonaligned; the working image's longest side is
//     capped at 1024 and half-resolution levels continue down to 64;
//   - per-call geometry (native rect + caller map size) lets independently
//     mapped projections share the estimator without rewriting settings;
//   - the status/identity/context contract is unchanged.
//
// All GL work lives in swp_est_worker.cpp.

#include <cmath>
#include <cstring>

#include "spacewarp_est.h"

#ifndef SWP_EST_LOG
#define SWP_EST_LOG(...) ((void)0)
#endif

namespace {

using gxr::swp_internal::kSwpDefaultBudgetMicros;
using gxr::swp_internal::kSwpMaxInputDim;
using gxr::swp_internal::kSwpMaxMvDim;
using gxr::swp_internal::kSwpMinInputDim;
using gxr::swp_internal::kSwpMinMvDim;
using gxr::swp_internal::SwpEstConfig;
using gxr::swp_internal::SwpEstTickOut;

uint32_t g_status = 0;
bool g_tableSet = false;
bool g_inited = false;
SwpGlTable g_tbl{};
void* g_expectCtx = nullptr;
SwpEstConfig g_cfg{};
bool g_qcomArmed = false;
bool g_standdownLogged = false;

static void LogOnce(const char* what) {
    (void)what;
    SWP_EST_LOG("GXRSwarp: stand-down: %s (status 0x%x)", what, (unsigned)g_status);
}

static void StandDown(const char* why) {
    g_status |= 0x10u;
    if (!g_standdownLogged) {
        g_standdownLogged = true;
        LogOnce(why);
    }
}

static bool ContextOk() {
    if (!g_tableSet) return false;
    if (!g_tbl.getCurrentContext) return true;
    void* cur = g_tbl.getCurrentContext();
    if (!cur) return false;
    if (g_expectCtx && cur != g_expectCtx) return false;
    return true;
}

static bool EntryGate() {
    if (!g_tableSet || !g_inited) return false;
    if (g_status & 0x10u) return false;
    if (!ContextOk()) {
        StandDown("context identity wrong");
        return false;
    }
    return true;
}

static bool MatrixSane(const float* m) {
    if (!m) return false;
    for (int i = 0; i < 16; ++i) {
        if (!std::isfinite(m[i])) return false;
    }
    return true;
}

static bool FovSane(const float* f) {
    if (!f) return false;
    for (int i = 0; i < 4; ++i) {
        if (!std::isfinite(f[i])) return false;
    }
    if (!(f[1] > f[0])) return false;
    if (!(f[2] > f[3])) return false;
    return true;
}

static int WorkDim(int native, double scale) {
    int v = static_cast<int>(std::lround(native * scale));
    if (v < 64) v = 64;
    return v;
}

static bool ResolveConfig(const SwpInitInfo& info, SwpEstConfig* out) {
    SwpEstConfig c{};
    c.forceFallbackSad = (info.flags & SWP_INIT_FLAG_FORCE_SAD_FALLBACK) != 0;
    c.verboseLog = (info.flags & SWP_INIT_FLAG_VERBOSE_LOG) != 0;
    c.budgetMicros = (info.flags & SWP_INIT_FLAG_BUDGET_OFF) ? 0u : kSwpDefaultBudgetMicros;
    c.fovScale = (info.fovScale > 0.0f && std::isfinite(info.fovScale)) ? info.fovScale : 1.0f;

    c.inputW = static_cast<int>(info.inputWidth);
    c.inputH = static_cast<int>(info.inputHeight);
    if (c.inputW < kSwpMinInputDim || c.inputH < kSwpMinInputDim ||
        c.inputW > kSwpMaxInputDim || c.inputH > kSwpMaxInputDim) {
        SWP_EST_LOG("GXRSwarp: init: input size impossibly large or small: %dx%d",
                    c.inputW, c.inputH);
        return false;
    }
    // Nonaligned dimensions are accepted; partial edge blocks are handled by
    // the matcher's per-texel bounds checks.
    const int longest = c.inputW > c.inputH ? c.inputW : c.inputH;
    const double workScale = longest > 1024 ? 1024.0 / static_cast<double>(longest) : 1.0;
    c.workW = WorkDim(c.inputW, workScale);
    c.workH = WorkDim(c.inputH, workScale);

    int levels = 1;
    int w = c.workW, h = c.workH;
    while ((w > 64 || h > 64) && levels < 8) {
        w = w > 64 ? (w + 1) / 2 : w;
        h = h > 64 ? (h + 1) / 2 : h;
        ++levels;
    }
    c.maxLevels = levels;

    c.mvW = info.mvWidth ? static_cast<int>(info.mvWidth)
                         : (c.workW / 2 > 64 ? c.workW / 2 : 64);
    c.mvH = info.mvHeight ? static_cast<int>(info.mvHeight)
                          : (c.workH / 2 > 64 ? c.workH / 2 : 64);
    if (c.mvW < kSwpMinMvDim || c.mvH < kSwpMinMvDim || c.mvW > kSwpMaxMvDim ||
        c.mvH > kSwpMaxMvDim) {
        SWP_EST_LOG("GXRSwarp: init: mv map size unusable: %dx%d", c.mvW, c.mvH);
        return false;
    }

    c.block = 8;
    c.refineBlock = 4;
    c.nativeSearch = 2;
    c.levelSearch = 2;
    c.minImprovementRatio = 0.01f;
    c.minImprovementAbs = 1e-6f;

    c.clampMagUv = 48.0f / static_cast<float>(longest);
    c.srRadiusUv = 16.0f / static_cast<float>(longest);
    c.srMode = 0;
    *out = c;
    return true;
}

static bool GeometrySane(uint32_t width, uint32_t height, uint32_t mvW, uint32_t mvH) {
    if (width < 64 || height < 64 || width > kSwpMaxInputDim || height > kSwpMaxInputDim) {
        return false;
    }
    if (mvW < kSwpMinMvDim || mvH < kSwpMinMvDim || mvW > kSwpMaxMvDim ||
        mvH > kSwpMaxMvDim) {
        return false;
    }
    return true;
}

}  // namespace

const char* SwpLogTag = "GXRSwarp";

bool SwpSetGlTable(const SwpGlTable* table) {
    if (!table) {
        g_tableSet = false;
        g_tbl = SwpGlTable{};
        SWP_EST_LOG("GXRSwarp: table cleared");
        return false;
    }
    std::memcpy(&g_tbl, table, sizeof(SwpGlTable));
    g_tableSet = true;
    if (g_inited) {
        SwpDestroy();
        StandDown("GL table replaced while initialized");
    }
    return true;
}

void SwpBindIdentityContext(void* currentCtx) {
    g_expectCtx = currentCtx;
}

bool SwpResolvedMvSize(u32* outW, u32* outH) {
    if (!g_inited) return false;
    if (outW) *outW = static_cast<u32>(g_cfg.mvW);
    if (outH) *outH = static_cast<u32>(g_cfg.mvH);
    return true;
}

bool SwpInit(const SwpInitInfo* info) {
    SwpDestroy();
    g_standdownLogged = false;
    if (!info) {
        g_status |= 0x10u;
        g_standdownLogged = true;
        SWP_EST_LOG("GXRSwarp: init: null info");
        return false;
    }
    if (!g_tableSet) {
        g_status |= 0x10u;
        g_standdownLogged = true;
        SWP_EST_LOG("GXRSwarp: init: no GL table set");
        return false;
    }
    if (!ContextOk()) {
        g_status |= 0x10u;
        g_standdownLogged = true;
        SWP_EST_LOG("GXRSwarp: init: no current context / identity mismatch");
        return false;
    }

    SwpEstConfig cfg{};
    if (!ResolveConfig(*info, &cfg)) {
        g_status |= 0x10u;
        g_standdownLogged = true;
        return false;
    }

    g_cfg = cfg;
    gxr::swp_internal::EstiSetTable(&g_tbl);
    bool qcomArmed = false;
    if (!gxr::swp_internal::EstiGlSetup(g_cfg, &qcomArmed)) {
        g_status |= 0x10u;
        g_standdownLogged = true;
        return false;
    }
    g_qcomArmed = qcomArmed;
    g_inited = true;

    g_status = 0x1u | (qcomArmed ? 0u : 0x8u);
    SWP_EST_LOG("GXRSwarp: init ok native %dx%d work %dx%d levels %d qcom %d",
                cfg.inputW, cfg.inputH, cfg.workW, cfg.workH, cfg.maxLevels,
                qcomArmed ? 1 : 0);
    return true;
}

void SwpDestroy() {
    if (g_inited && ContextOk()) {
        gxr::swp_internal::EstiGlShutdown();
    } else {
        gxr::swp_internal::EstiDropHandles();
    }
    g_inited = false;
    g_status = 0;
    g_expectCtx = nullptr;
}

bool SwpGenerateVectorsStereoEx(u32 prevTexL, u32 currTexL, u32 prevTexR, u32 currTexR,
                                const float* viewMatrixL, const float* viewMatrixR,
                                const float* fovL, const float* fovR,
                                u32 mvTexL, u32 mvTexR,
                                u32 width, u32 height, u32 mvWidth, u32 mvHeight) {
    g_status &= ~(0x2u | 0x20u);
    if (!EntryGate()) return false;
    if (!prevTexL || !currTexL || !prevTexR || !currTexR || !mvTexL || !mvTexR) {
        SWP_EST_LOG("GXRSwarp: mv: zero texture id");
        return false;
    }
    if (!MatrixSane(viewMatrixL) || !MatrixSane(viewMatrixR) ||
        !FovSane(fovL) || !FovSane(fovR)) {
        SWP_EST_LOG("GXRSwarp: mv: null/insane pose or fov input");
        return false;
    }
    if (!GeometrySane(width, height, mvWidth, mvHeight)) {
        SWP_EST_LOG("GXRSwarp: mv: unusable geometry %ux%u map %ux%u", width, height,
                    mvWidth, mvHeight);
        return false;
    }

    SwpEstTickOut lOut{}, rOut{};
    const bool ok =
        gxr::swp_internal::EstiMvMapOneEyeEx(g_cfg, prevTexL, currTexL, mvTexL,
                                             static_cast<int>(width), static_cast<int>(height),
                                             static_cast<int>(mvWidth), static_cast<int>(mvHeight),
                                             &lOut) &&
        gxr::swp_internal::EstiMvMapOneEyeEx(g_cfg, prevTexR, currTexR, mvTexR,
                                             static_cast<int>(width), static_cast<int>(height),
                                             static_cast<int>(mvWidth), static_cast<int>(mvHeight),
                                             &rOut);
    if (ok) g_status |= 0x2u;
    if (lOut.budgetExceeded || rOut.budgetExceeded) g_status |= 0x20u;
    return ok;
}

bool SwpGenerateVectorsStereo(u32 prevTexL, u32 currTexL, u32 prevTexR, u32 currTexR,
                              const float* viewMatrixL, const float* viewMatrixR,
                              const float* fovL, const float* fovR,
                              u32 mvTexL, u32 mvTexR) {
    return SwpGenerateVectorsStereoEx(
        prevTexL, currTexL, prevTexR, currTexR, viewMatrixL, viewMatrixR, fovL, fovR,
        mvTexL, mvTexR, static_cast<u32>(g_cfg.inputW), static_cast<u32>(g_cfg.inputH),
        static_cast<u32>(g_cfg.mvW), static_cast<u32>(g_cfg.mvH));
}

bool SwpExtrapolateStereoEx(u32 mvTexL, u32 mvTexR, u32 srcTexL, u32 srcTexR,
                            u32 dstTexL, u32 dstTexR, int layerL, int layerR,
                            int dstX0, int dstY0, int dstX1, int dstY1,
                            float scaleFactor, u32 width, u32 height) {
    g_status &= ~(0x4u | 0x20u);
    if (!EntryGate()) return false;
    if (!mvTexL || !mvTexR || !srcTexL || !srcTexR || !dstTexL || !dstTexR) {
        SWP_EST_LOG("GXRSwarp: extrap: zero texture id");
        return false;
    }
    if (!GeometrySane(width, height, 64, 64)) {
        SWP_EST_LOG("GXRSwarp: extrap: unusable geometry %ux%u", width, height);
        return false;
    }
    if (!(scaleFactor >= 1.0f)) scaleFactor = 1.0f;

    SwpEstTickOut lOut{}, rOut{};
    const bool ok =
        gxr::swp_internal::EstiExtrapolateOneEyeEx(g_cfg, scaleFactor, mvTexL, srcTexL, dstTexL,
                                                   layerL, dstX0, dstY0, static_cast<int>(width),
                                                   static_cast<int>(height), &lOut) &&
        gxr::swp_internal::EstiExtrapolateOneEyeEx(g_cfg, scaleFactor, mvTexR, srcTexR, dstTexR,
                                                   layerR, dstX1, dstY1, static_cast<int>(width),
                                                   static_cast<int>(height), &rOut);
    if (ok) g_status |= 0x4u;
    if (lOut.budgetExceeded || rOut.budgetExceeded) g_status |= 0x20u;
    return ok;
}

bool SwpExtrapolateStereo(u32 mvTexL, u32 mvTexR, u32 srcTexL, u32 srcTexR,
                          u32 dstTexL, u32 dstTexR, float scaleFactor) {
    return SwpExtrapolateStereoEx(
        mvTexL, mvTexR, srcTexL, srcTexR, dstTexL, dstTexR, -1, -1, 0, 0, 0, 0, scaleFactor,
        static_cast<u32>(g_cfg.inputW), static_cast<u32>(g_cfg.inputH));
}

bool SwpAlignHistoryStereo(u32 prevTexL, u32 prevTexR, u32 dstTexL, u32 dstTexR,
                           const float* prevViewL, const float* prevViewR,
                           const float* prevFovL, const float* prevFovR,
                           const float* currViewL, const float* currViewR,
                           const float* currFovL, const float* currFovR,
                           u32 width, u32 height) {
    g_status &= ~(0x40u | 0x20u);
    if (!EntryGate()) return false;
    if (!prevTexL || !prevTexR || !dstTexL || !dstTexR) {
        SWP_EST_LOG("GXRSwarp: align: zero texture id");
        return false;
    }
    if (!MatrixSane(prevViewL) || !MatrixSane(prevViewR) ||
        !MatrixSane(currViewL) || !MatrixSane(currViewR) ||
        !FovSane(prevFovL) || !FovSane(prevFovR) ||
        !FovSane(currFovL) || !FovSane(currFovR)) {
        return false;
    }
    if (!GeometrySane(width, height, 64, 64)) return false;

    SwpEstTickOut lOut{}, rOut{};
    const bool ok =
        gxr::swp_internal::EstiAlignOneEye(g_cfg, prevViewL, prevFovL, currViewL, currFovL,
                                           prevTexL, dstTexL, static_cast<int>(width),
                                           static_cast<int>(height), &lOut) &&
        gxr::swp_internal::EstiAlignOneEye(g_cfg, prevViewR, prevFovR, currViewR, currFovR,
                                           prevTexR, dstTexR, static_cast<int>(width),
                                           static_cast<int>(height), &rOut);
    if (ok) g_status |= 0x40u;
    if (lOut.budgetExceeded || rOut.budgetExceeded) g_status |= 0x20u;
    return ok;
}

u32 SwpLastStatus() {
    return g_status;
}

unsigned long long SwpEstimatorFootprintBytes() {
    return g_inited ? gxr::swp_internal::EstiFootprintBytes() : 0ull;
}

bool SwpGpuTimingAvailable() {
    return g_inited && gxr::swp_internal::EstiGpuTimingAvailable();
}

unsigned long long SwpLastGpuMicros() {
    return g_inited ? gxr::swp_internal::EstiLastGpuMicros() : 0ull;
}

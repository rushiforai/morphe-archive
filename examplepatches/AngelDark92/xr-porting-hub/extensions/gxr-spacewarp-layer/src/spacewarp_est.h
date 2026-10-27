// spacewarp_est.h — on-device spacewarp estimator core for gxr-spacewarp-layer.
//
// Pure estimator (C++17 + GLES 3.2 fragment passes), independent of the
// OpenXR/PLT/EGL plumbing that B1b wires around it. Mechanism re-derived from
// the Virtual Desktop libMotionEngine REA (see RE-SHARED-IMPL.md and
// 04-rea-motionengine/REPORT.md §3-5 + EVIDENCE-shaders-deobfuscated.txt):
//
//   1. SwpGenerateVectorsStereo  — motion estimation from two consecutive
//      decoded COLOR frames per eye: coarse global-motion search (GME) seeds a
//      hierarchical block-match SAD (four uniform block-size quadrant SADs per
//      candidate, the VD L1 structure), a 9-element sorting-network median
//      smooths the raw field, and a fused H1 pass refines it around the median
//      with a 3x3 window plus parabolic subpel, writing an RGBA16F motion
//      vector map per eye into caller-owned textures.
//   2. SwpExtrapolateStereo      — single-texture warp (VD's sr.mode/radius/
//      clampMagnitude semantics): the newest decoded frame is warped onto the
//      projection swapchain image the client submits on a missed-tick frame by
//      the time-shifted motion field (extrapolation == warp with time-shifted
//      vectors, REPORT.md §5).
//
// Guided filtering, temporal statistics, scene-change detection and the
// TFLite "Smart" stage are documented gaps (RE-SHARED-IMPL.md) and are NOT
// implemented here.
//
// ---------------------------------------------------------------------------
// UNITS (pinned; both estimator sides obey this):
//   MV map texel .rg = (uv displacement) = (NDC displacement / 2.0), i.e. the
//   contract's "v.xy/scale" with v = the NDC delta and scale = 2.0. .ba = 0.
//   The extrapolation pass therefore multiplies the stored .rg by 2 in spirit
//   (it works directly in uv space) and folds init fovScale on top.
//   Internally the matcher works in INPUT-TEXEL offsets and converts at the
//   final write (uv = texel / inputSize). VD's finalize divides by a
//   configurable output scale; ours is self-consistent by construction.
//
// STATUS BITS (SwpLastStatus):
//   1  init ok (last successful SwpInit)
//   2  mv ok (last SwpGenerateVectorsStereo)
//   4  extrapolation ok (last SwpExtrapolateStereo)
//   8  portable GLSL baseline armed (QCOM hardware path intentionally unarmed
//      until a genuine hardware-SAD parity path exists; sticky)
//   16 stand-down (any construction/GL error; sticky until a fresh SwpInit)
//   32 estimator budget exceeded during the last mv/extrapolation call
//      (bits 2/4 are then not set: the call returned false)
// ---------------------------------------------------------------------------

#pragma once
#include <cstdint>

#include <GLES3/gl3.h>  // GL entry-point typedefs + enums only; no GL calls here.

// Diagnostics: the estimator is used on Android and in host tests. A native
// builder must not silently compile the detailed compile/link/framebuffer
// diagnostics to a no-op.
#if !defined(SWP_EST_LOG)
#if defined(__ANDROID__) || defined(SWP_HOST_TESTS)
#include <android/log.h>
#define SWP_EST_LOG(...) __android_log_print(ANDROID_LOG_INFO, "GXRSwarp", __VA_ARGS__)
#else
#define SWP_EST_LOG(...) ((void)0)
#endif
#endif

typedef uint32_t u32;  // contract's u32

extern "C" {

// ---- shared interface contract (exact; RE-SHARED-IMPL.md) -----------------

struct SwpInitInfo {
    u32 inputWidth;    // decoded-frame texels; % 16 == 0, >= 256, <= 8192
    u32 inputHeight;   // ditto
    u32 mvWidth;       // motion-vector map texels; 0 => default input/2 clamped to >= 64, <= 2048
    u32 mvHeight;      // ditto
    float fovScale;    // folds onto stored vectors at extrapolation; 0 => 1.0
                       // (compensates a fixed stream-FOV <-> swapchain-FOV ratio;
                       // 1.0 = same-FOV path, the validated default)
    u32 flags;         // SWP_INIT_FLAG_* below
};

bool SwpInit(const SwpInitInfo* info);
void SwpDestroy();

// viewMatrix = column-major 4x4 exactly as the client's LocateViews produce
// (the currTex frame's pose; validated, NaN-guarded); fov = 4 floats
// angleLeft, angleRight, angleUp, angleDown in radians exactly as XrFov
// passes them (validated, finite). The block matcher measures the actual
// image flow prev->curr, which carries camera + object motion; the VD
// per-frame reprojection matrices cannot be reproduced from one matrix per
// call by contract design (see receipt, conservative approximation note).
// History rotation between calls is the CALLER's duty.
bool SwpGenerateVectorsStereo(u32 prevTexL, u32 currTexL, u32 prevTexR, u32 currTexR,
                          const float* viewMatrixL, const float* viewMatrixR,
                          const float* fovL, const float* fovR,
                          u32 mvTexL, u32 mvTexR);

// Per-call geometry (2026-10-26): the selected projections can carry different
// rect extents / array layouts. width/height are the native rect texels of THIS
// pair; mvWidth/mvHeight are the caller-owned map texels for THIS call. The
// estimator's internal working pyramid is capped at 1024 on its longest side
// and never rewrites the caller's settings or output resolution.
bool SwpGenerateVectorsStereoEx(u32 prevTexL, u32 currTexL, u32 prevTexR, u32 currTexR,
                                const float* viewMatrixL, const float* viewMatrixR,
                                const float* fovL, const float* fovR,
                                u32 mvTexL, u32 mvTexR,
                                u32 width, u32 height, u32 mvWidth, u32 mvHeight);

// scaleFactor = normalized progress between the history frame indexes
// (>= 1.0; values < 1.0 are clamped to 1.0 conservatively). dst = the
// projection swapchain image the client is submitting this tick.
bool SwpExtrapolateStereo(u32 mvTexL, u32 mvTexR, u32 srcTexL, u32 srcTexR,
                      u32 dstTexL, u32 dstTexR, float scaleFactor);

// Layer-aware variant for admitted array swapchains: dstTex must be an array
// texture and layer selects the view's imageArrayIndex.
bool SwpExtrapolateStereoEx(u32 mvTexL, u32 mvTexR, u32 srcTexL, u32 srcTexR,
                            u32 dstTexL, u32 dstTexR, int layerL, int layerR,
                            int dstX0, int dstY0, int dstX1, int dstY1,
                            float scaleFactor, u32 width, u32 height);

// Rotation-align the older composite (prev) into the newer composite's camera
// frame before residual motion estimation. Both inputs are 2D textures; the
// matrices are the column-major world->camera views captured with each frame,
// and fov is angleLeft/Right/Up/Down. Output preserves the newer frame's
// alpha; the caller later submits with the newer frame's pose/FOV so runtime
// late reprojection does not apply head rotation twice.
bool SwpAlignHistoryStereo(u32 prevTexL, u32 prevTexR, u32 dstTexL, u32 dstTexR,
                           const float* prevViewL, const float* prevViewR,
                           const float* prevFovL, const float* prevFovR,
                           const float* currViewL, const float* currViewR,
                           const float* currFovL, const float* currFovR,
                           u32 width, u32 height);

u32 SwpLastStatus();  // bitmask above

// Bytes retained by the enabled-only estimator (programs excluded): pyramids,
// maps and scratch. Used by the dispatch admission ledger.
unsigned long long SwpEstimatorFootprintBytes();
// Completed-GPU timing (EXT_disjoint_timer_query) availability + last sample.
bool SwpGpuTimingAvailable();
unsigned long long SwpLastGpuMicros();

extern const char* SwpLogTag;  // "GXRSwarp"

// ---- B1b-owned dispatch plumbing ------------------------------------------

// GL function table (the estimator performs every GL call through it so B1b
// can route through its own dispatch — RE-SHARED-IMPL.md, context-agnostic).
// Optional entries may be NULL: getCurrentContext (then context identity
// cannot be verified from here), nowMicros (then no budget is enforced).
// 34 entries total (the brief's "~20"); all typed from GLES3 headers.
struct SwpGlTable {
    // Shaders / programs
    PFNGLCREATESHADERPROC glCreateShader;
    PFNGLSHADERSOURCEPROC glShaderSource;
    PFNGLCOMPILESHADERPROC glCompileShader;
    PFNGLGETSHADERIVPROC glGetShaderiv;
    PFNGLGETSHADERINFOLOGPROC glGetShaderInfoLog;
    PFNGLDELETESHADERPROC glDeleteShader;
    PFNGLCREATEPROGRAMPROC glCreateProgram;
    PFNGLATTACHSHADERPROC glAttachShader;
    PFNGLLINKPROGRAMPROC glLinkProgram;
    PFNGLGETPROGRAMIVPROC glGetProgramiv;
    PFNGLGETPROGRAMINFOLOGPROC glGetProgramInfoLog;
    PFNGLDELETEPROGRAMPROC glDeleteProgram;
    PFNGLGETUNIFORMLOCATIONPROC glGetUniformLocation;
    PFNGLUNIFORM1IPROC glUniform1i;
    PFNGLUNIFORM2IPROC glUniform2i;
    PFNGLUNIFORM1FPROC glUniform1f;
    PFNGLUNIFORM2FPROC glUniform2f;
    PFNGLUNIFORM4FPROC glUniform4f;
    void (*glUniformMatrix3fv)(GLint location, GLsizei count, GLboolean transpose,
                               const GLfloat* value);
    PFNGLUSEPROGRAMPROC glUseProgram;
    // Draw / state
    PFNGLDRAWARRAYSPROC glDrawArrays;
    PFNGLVIEWPORTPROC glViewport;
    PFNGLFLUSHPROC glFlush;
    PFNGLGETERRORPROC glGetError;
    // Framebuffers
    PFNGLGENFRAMEBUFFERSPROC glGenFramebuffers;
    PFNGLDELETEFRAMEBUFFERSPROC glDeleteFramebuffers;
    PFNGLBINDFRAMEBUFFERPROC glBindFramebuffer;
    PFNGLFRAMEBUFFERTEXTURE2DPROC glFramebufferTexture2D;
    void (*glFramebufferTextureLayer)(GLenum target, GLenum attachment, GLuint texture,
                                      GLint level, GLint layer);
    PFNGLCHECKFRAMEBUFFERSTATUSPROC glCheckFramebufferStatus;
    PFNGLBLITFRAMEBUFFERPROC glBlitFramebuffer;
    // Textures
    PFNGLGENTEXTURESPROC glGenTextures;
    PFNGLDELETETEXTURESPROC glDeleteTextures;
    PFNGLBINDTEXTUREPROC glBindTexture;
    PFNGLACTIVETEXTUREPROC glActiveTexture;
    PFNGLTEXSTORAGE2DPROC glTexStorage2D;
    PFNGLTEXPARAMETERIPROC glTexParameteri;
    void (*glTexSubImage2D)(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                            GLsizei width, GLsizei height, GLenum format, GLenum type,
                            const void* pixels);
    void (*glReadPixels)(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format,
                         GLenum type, void* pixels);
    // Sampler objects: the warp must not inherit client sampler state and must
    // restore every unit it touches (2026-10-26).
    void (*glGenSamplers)(GLsizei count, GLuint* samplers);
    void (*glDeleteSamplers)(GLsizei count, const GLuint* samplers);
    void (*glBindSampler)(GLuint unit, GLuint sampler);
    void (*glSamplerParameteri)(GLuint sampler, GLenum pname, GLint param);
    // Asynchronous completed-GPU timing (EXT_disjoint_timer_query).
    void (*glGenQueries)(GLsizei n, GLuint* ids);
    void (*glDeleteQueries)(GLsizei n, const GLuint* ids);
    void (*glBeginQuery)(GLenum target, GLuint id);
    void (*glEndQuery)(GLenum target);
    void (*glGetQueryObjectuiv)(GLuint id, GLenum pname, GLuint* params);
    void (*glGetQueryiv)(GLenum target, GLenum pname, GLint* params);
    // Query
    PFNGLGETSTRINGPROC glGetString;
    PFNGLGETINTEGERVPROC glGetIntegerv;
    // Raster-state control: the warp must not inherit the client's scissor,
    // blend, depth, cull or colour mask. Saved before every public call and
    // restored after it (2026-10-20). Rasterizer discard is saved too
    // (2026-10-26): a transform-feedback pass must not swallow the warp.
    GLboolean (*glIsEnabled)(GLenum cap);
    void (*glEnable)(GLenum cap);
    void (*glDisable)(GLenum cap);
    void (*glColorMask)(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
    void (*glGetBooleanv)(GLenum pname, GLboolean* data);
    // Hooks
    void* (*getCurrentContext)(void);  // eglGetCurrentContext route (optional; may be NULL)
    unsigned long long (*nowMicros)(void);  // monotonic microsecond clock (optional; NULL = no budget)
};

// Call in the GL thread BEFORE SwpInit, with the target context current.
// Ownership: the table is copied (a stack local is fine). Replacing the table
// while initialized forces stand-down until a fresh SwpInit.
bool SwpSetGlTable(const SwpGlTable* table);

// Identity anchor: B1b calls this with eglGetCurrentContext() (or its own
// dispatch's context id) whenever a context becomes current and the estimator
// must run on it. Every entry point then bails with status 16 if the current
// context differs or none is current (never assume a context — RE-SHARED-IMPL.md).
void SwpBindIdentityContext(void* currentCtx);

// Post-init getter for the resolved mv-map size (defaults applied when
// SwpInitInfo.mvWidth/Height were 0). False when not initialized.
bool SwpResolvedMvSize(u32* outW, u32* outH);

// ---- init flags ------------------------------------------------------------
#define SWP_INIT_FLAG_FORCE_SAD_FALLBACK 0x1u  // skip QCOM direct path even when present
#define SWP_INIT_FLAG_VERBOSE_LOG        0x2u  // extra (still rate-limited) log lines
#define SWP_INIT_FLAG_BUDGET_OFF         0x4u  // disable the per-call time budget

}  // extern "C"

// ---------------------------------------------------------------------------
// INTERNAL — B1a only (spacewarp_est.cpp <-> swp_est_worker.cpp).
// Not part of the shared contract; B1b must not call these.
// ---------------------------------------------------------------------------
namespace gxr {
namespace swp_internal {

static const int kSwpBlock = 16;              // direct-path block size (QCOM path)
static const int kSwpFallbackBlock = 8;       // fallback block size (cheaper manual SAD)
static const int kSwpMaxInputDim = 8192;      // "impossibly large" guard (VD: REPORT.md §1)
static const int kSwpMinInputDim = 256;       // keeps the origin clamp margin sane
static const int kSwpMaxMvDim = 2048;
static const int kSwpMinMvDim = 8;
static const uint32_t kSwpDefaultBudgetMicros = 12000;  // per-call hard budget

struct SwpEstConfig {
    bool forceFallbackSad;
    bool verboseLog;
    uint32_t budgetMicros;
    float fovScale;

    int inputW, inputH;    // native rect texels (the per-call maximum)
    int mvW, mvH;          // default map texels (per-call overrides allowed)
    int workW, workH;      // level 0 working image (longest side <= 1024)
    int maxLevels;         // half-resolution levels down to >= 64
    int block;             // 8 px matching block at every level
    int refineBlock;       // 4 px native refinement block
    int nativeSearch;      // +-2 native texels around the upsampled seed
    int levelSearch;       // +-2 level texels around the upsampled seed

    // Normalized matching error: mean per-channel |delta| in [0,1]. A nonzero
    // displacement must improve on zero by at least
    // max(1e-6, 0.01 * zeroError).
    float minImprovementRatio;
    float minImprovementAbs;

    float clampMagUv;  // extrapolation clamp magnitude, uv units
    float srRadiusUv;  // stretch radius, uv units
    int srMode;        // 0 = stretch ramp then clamp (default), 1 = hard clamp
};

struct SwpEstTickOut {
    bool ok;               // the call's work completed
    bool budgetExceeded;   // budget bit 32 companion
};

// GL-side engine: compile + allocate (fails => stand-down, no partial state).
// qcomArmed reports whether the direct QCOM SAD path was armed.
bool EstiGlSetup(const SwpEstConfig& cfg, bool* qcomArmed);
void EstiSetTable(const SwpGlTable* table);  // pass a table with a stable address
void EstiGlShutdown();
void EstiDropHandles();  // teardown WITHOUT GL calls (wrong context at destroy)
bool EstiMvMapOneEye(const SwpEstConfig& cfg, u32 prevTex, u32 currTex, u32 mvTex,
                     SwpEstTickOut* out);
bool EstiMvMapOneEyeEx(const SwpEstConfig& cfg, u32 prevTex, u32 currTex, u32 mvTex,
                       int width, int height, int mvW, int mvH, SwpEstTickOut* out);
bool EstiExtrapolateOneEye(const SwpEstConfig& cfg, float scaleFactor, u32 mvTex,
                           u32 srcTex, u32 dstTex, SwpEstTickOut* out);
bool EstiExtrapolateOneEyeEx(const SwpEstConfig& cfg, float scaleFactor, u32 mvTex,
                             u32 srcTex, u32 dstTex, int layer, int dstX, int dstY,
                             int width, int height, SwpEstTickOut* out);
bool EstiAlignOneEye(const SwpEstConfig& cfg, const float* prevView, const float* prevFov,
                     const float* currView, const float* currFov, u32 prevTex, u32 dstTex,
                     int width, int height, SwpEstTickOut* out);
unsigned long long EstiFootprintBytes();
bool EstiGpuTimingAvailable();
unsigned long long EstiLastGpuMicros();

}  // namespace swp_internal
}  // namespace gxr
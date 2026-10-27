// swp_est_worker.cpp — GL plumbing for the dense coarse-to-fine spacewarp
// estimator (2026-10-26 revision).
//
// Portable GLSL is the baseline. The QCOM block-match path is compiled in
// addition, then armed only when a small deterministic normalized-result parity
// probe matches the portable path. Both paths use identical geometry.
//
// Bounded resources: one working pyramid (prev+curr per level), one MV map per
// level, one median map, two sampler objects and two asynchronous timer
// queries. No readback on the hot path; the only readback is the one-time QCOM
// parity probe during SwpInit.
//
// State discipline: every public call saves/restores FBO, program, active
// texture, texture bindings, sampler bindings, viewport, scissor, blend, depth,
// cull, colour mask and rasterizer discard. Teardown deletes only own names.

#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <cstring>

#include "spacewarp_est.h"
#include "swp_shaders.h"

namespace gxr {
namespace swp_internal {

#ifndef SWP_EST_LOG
#define SWP_EST_LOG(...) ((void)0)
#endif

namespace {

constexpr int kMaxLevels = 8;
constexpr int kMaxUnits = 5;

// EXT_disjoint_timer_query constants (not present in every GLES3 header).
constexpr GLenum kGlTimeElapsed = 0x88BF;
constexpr GLenum kGlQueryCounterBits = 0x8864;
constexpr GLenum kGlCurrentQuery = 0x8865;
constexpr GLenum kGlQueryResult = 0x8866;
constexpr GLenum kGlQueryResultAvailable = 0x8867;
constexpr GLenum kGlGpuDisjoint = 0x8FBB;
constexpr GLenum kGlSamplerBinding = 0x8919;
constexpr GLenum kGlRasterizerDiscard = 0x8C89;
constexpr GLenum kGlTexture0 = 0x84C0;

struct Level {
    GLuint prev = 0;
    GLuint curr = 0;
    GLuint mv = 0;
    int w = 0, h = 0;
    int mvW = 0, mvH = 0;
};

struct Engine {
    const SwpGlTable* gl = nullptr;
    bool setupOk = false;
    bool haveQcom = false;

    GLuint progDown = 0;
    GLuint progDense = 0;
    GLuint progMedian = 0;
    GLuint progRefine = 0;
    GLuint progExtrap = 0;
    GLuint progAlign = 0;

    Level levels[kMaxLevels];
    int levelCount = 0;
    GLuint medTex = 0;
    int medW = 0, medH = 0;
    GLuint fbo = 0;

    GLuint samplerNearest = 0;
    GLuint samplerLinear = 0;

    bool timingArmed = false;
    GLuint queries[2] = {0, 0};
    int queryIndex = 0;
    bool queryPending[2] = {false, false};
    bool queryDisjoint[2] = {false, false};
    unsigned long long lastGpuMicros = 0;

    bool budgetHit = false;
    unsigned long long footprint = 0;
};

Engine g;

#define SWP_EST_MAX_LOG 384

static void DrainErrors() {
    if (!g.gl || !g.gl->glGetError) return;
    for (int i = 0; i < 64; ++i) {
        if (g.gl->glGetError() == GL_NO_ERROR) return;
    }
}

struct SaveState {
    GLint readFbo = 0;
    GLint drawFbo = 0;
    GLint prog = 0;
    GLint active = kGlTexture0;
    GLint viewport[4] = {0, 0, 0, 0};
    GLint texBinding[kMaxUnits] = {};
    GLint samplerBinding[kMaxUnits] = {};
    GLboolean scissor = GL_FALSE;
    GLboolean blend = GL_FALSE;
    GLboolean depth = GL_FALSE;
    GLboolean cull = GL_FALSE;
    GLboolean discard = GL_FALSE;
    GLboolean colorMask[4] = {GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE};
    bool ok = false;
};

static bool SaveCallerState(SaveState* s) {
    if (!g.gl || !g.gl->glGetIntegerv || !g.gl->glActiveTexture) return false;
    if (g.gl->glIsEnabled && g.gl->glGetBooleanv) {
        s->scissor = g.gl->glIsEnabled(GL_SCISSOR_TEST);
        s->blend = g.gl->glIsEnabled(GL_BLEND);
        s->depth = g.gl->glIsEnabled(GL_DEPTH_TEST);
        s->cull = g.gl->glIsEnabled(GL_CULL_FACE);
        s->discard = g.gl->glIsEnabled(kGlRasterizerDiscard);
        g.gl->glGetBooleanv(GL_COLOR_WRITEMASK, s->colorMask);
    }
    g.gl->glGetIntegerv(GL_READ_FRAMEBUFFER_BINDING, &s->readFbo);
    g.gl->glGetIntegerv(GL_DRAW_FRAMEBUFFER_BINDING, &s->drawFbo);
    g.gl->glGetIntegerv(GL_CURRENT_PROGRAM, &s->prog);
    g.gl->glGetIntegerv(GL_VIEWPORT, s->viewport);
    g.gl->glGetIntegerv(GL_ACTIVE_TEXTURE, &s->active);
    for (int i = 0; i < kMaxUnits; ++i) {
        g.gl->glActiveTexture(kGlTexture0 + i);
        g.gl->glGetIntegerv(GL_TEXTURE_BINDING_2D, &s->texBinding[i]);
        if (g.gl->glBindSampler) {
            g.gl->glGetIntegerv(kGlSamplerBinding, &s->samplerBinding[i]);
        }
    }
    g.gl->glActiveTexture(static_cast<GLenum>(s->active));
    s->ok = true;
    return true;
}

static void ApplyEngineState() {
    if (!g.gl) return;
    if (g.gl->glDisable) {
        g.gl->glDisable(GL_SCISSOR_TEST);
        g.gl->glDisable(GL_BLEND);
        g.gl->glDisable(GL_DEPTH_TEST);
        g.gl->glDisable(GL_CULL_FACE);
        g.gl->glDisable(kGlRasterizerDiscard);
    }
    if (g.gl->glColorMask) g.gl->glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
}

static void RestoreCallerState(const SaveState& s) {
    if (!g.gl || !s.ok) return;
    if (g.gl->glColorMask) {
        g.gl->glColorMask(s.colorMask[0], s.colorMask[1], s.colorMask[2], s.colorMask[3]);
    }
    if (g.gl->glEnable && g.gl->glDisable) {
        const struct { GLboolean on; GLenum cap; } caps[] = {
            {s.scissor, GL_SCISSOR_TEST}, {s.blend, GL_BLEND},
            {s.depth, GL_DEPTH_TEST}, {s.cull, GL_CULL_FACE},
            {s.discard, kGlRasterizerDiscard}};
        for (const auto& c : caps) {
            if (c.on) g.gl->glEnable(c.cap);
            else g.gl->glDisable(c.cap);
        }
    }
    g.gl->glBindFramebuffer(GL_READ_FRAMEBUFFER, static_cast<GLuint>(s.readFbo));
    g.gl->glBindFramebuffer(GL_DRAW_FRAMEBUFFER, static_cast<GLuint>(s.drawFbo));
    g.gl->glUseProgram(static_cast<GLuint>(s.prog));
    for (int i = 0; i < kMaxUnits; ++i) {
        g.gl->glActiveTexture(kGlTexture0 + i);
        g.gl->glBindTexture(GL_TEXTURE_2D, static_cast<GLuint>(s.texBinding[i]));
        if (g.gl->glBindSampler) {
            g.gl->glBindSampler(static_cast<GLuint>(i), static_cast<GLuint>(s.samplerBinding[i]));
        }
    }
    g.gl->glActiveTexture(static_cast<GLenum>(s.active));
    g.gl->glViewport(s.viewport[0], s.viewport[1], s.viewport[2], s.viewport[3]);
}

static void RestoreCallerState(const SaveState& s);

struct CallerStateRestore {
    const SaveState& saved;
    bool active;
    ~CallerStateRestore() {
        if (active) RestoreCallerState(saved);
    }
};

// ------------------------------------------------------------ compilation ---

struct ULocDef {
    const char* name;
    GLint* dst;
};

static bool ResolveUniforms(GLuint prog, const ULocDef* defs, int n) {
    if (!g.gl || !g.gl->glGetUniformLocation) return false;
    for (int i = 0; i < n; ++i) {
        *defs[i].dst = g.gl->glGetUniformLocation(prog, defs[i].name);
        if (*defs[i].dst < 0) {
            SWP_EST_LOG("GXRSwarp: setup: uniform %s unresolved (prog %u)",
                        defs[i].name, (unsigned)prog);
            return false;
        }
    }
    return true;
}

static bool CompileShader(GLuint type, const char* const* parts, int nParts,
                          const char* tag, GLuint* out) {
    (void)tag;
    if (!g.gl->glCreateShader || !g.gl->glShaderSource || !g.gl->glCompileShader ||
        !g.gl->glGetShaderiv || !g.gl->glDeleteShader) {
        return false;
    }
    const GLuint sh = g.gl->glCreateShader(type);
    if (!sh) return false;
    g.gl->glShaderSource(sh, nParts, parts, nullptr);
    g.gl->glCompileShader(sh);
    GLint status = 0;
    g.gl->glGetShaderiv(sh, GL_COMPILE_STATUS, &status);
    if (status == GL_FALSE) {
        char log[SWP_EST_MAX_LOG];
        log[0] = 0;
        if (g.gl->glGetShaderInfoLog) {
            GLsizei len = 0;
            g.gl->glGetShaderInfoLog(sh, SWP_EST_MAX_LOG - 1, &len, log);
            if (len < 0 || static_cast<int>(len) >= SWP_EST_MAX_LOG) {
                log[SWP_EST_MAX_LOG - 1] = 0;
            }
        }
        SWP_EST_LOG("GXRSwarp: setup: %s compile failed: %s", tag, log[0] ? log : "no log");
        g.gl->glDeleteShader(sh);
        return false;
    }
    *out = sh;
    return true;
}

static bool LinkProgram(GLuint vsh, GLuint fsh, const char* tag, GLuint* out) {
    (void)tag;
    if (!g.gl->glCreateProgram || !g.gl->glAttachShader || !g.gl->glLinkProgram ||
        !g.gl->glGetProgramiv || !g.gl->glDeleteProgram) {
        return false;
    }
    const GLuint prog = g.gl->glCreateProgram();
    if (!prog) return false;
    g.gl->glAttachShader(prog, vsh);
    g.gl->glAttachShader(prog, fsh);
    g.gl->glLinkProgram(prog);
    GLint status = 0;
    g.gl->glGetProgramiv(prog, GL_LINK_STATUS, &status);
    if (status == GL_FALSE) {
        char log[SWP_EST_MAX_LOG];
        log[0] = 0;
        if (g.gl->glGetProgramInfoLog) {
            GLsizei len = 0;
            g.gl->glGetProgramInfoLog(prog, SWP_EST_MAX_LOG - 1, &len, log);
            if (len < 0 || static_cast<int>(len) >= SWP_EST_MAX_LOG) {
                log[SWP_EST_MAX_LOG - 1] = 0;
            }
        }
        SWP_EST_LOG("GXRSwarp: setup: %s link failed: %s", tag, log[0] ? log : "no log");
        g.gl->glDeleteProgram(prog);
        return false;
    }
    *out = prog;
    return true;
}

static bool BuildPassProgram(const char* tag, const char* const* fragParts, int nParts,
                             GLuint vsh, GLuint* out) {
    GLuint fsh = 0;
    if (!CompileShader(GL_FRAGMENT_SHADER, fragParts, nParts, tag, &fsh)) return false;
    const bool ok = LinkProgram(vsh, fsh, tag, out);
    g.gl->glDeleteShader(fsh);
    return ok;
}

// --------------------------------------------------------------- textures ---

static bool AllocTexture(GLuint* tex, int w, int h) {
    if (!g.gl->glGenTextures || !g.gl->glBindTexture || !g.gl->glTexStorage2D ||
        !g.gl->glTexParameteri || !g.gl->glDeleteTextures) {
        return false;
    }
    if (w <= 0 || h <= 0) return false;
    g.gl->glGenTextures(1, tex);
    if (!*tex) return false;
    g.gl->glBindTexture(GL_TEXTURE_2D, *tex);
    g.gl->glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA16F, w, h);
    g.gl->glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    g.gl->glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    g.gl->glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    g.gl->glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    if (g.gl->glGetError() != GL_NO_ERROR) {
        g.gl->glDeleteTextures(1, tex);
        *tex = 0;
        return false;
    }
    return true;
}

static bool DetectTiming() {
    const GLubyte* exts = g.gl->glGetString(GL_EXTENSIONS);
    if (!exts) return false;
    return std::strstr(reinterpret_cast<const char*>(exts), "GL_EXT_disjoint_timer_query") != nullptr;
}

static bool ParseEsVersion(const char* v, int* major, int* minor) {
    const char* tag = v ? std::strstr(v, "OpenGL ES ") : nullptr;
    if (!tag) return false;
    tag += 10;
    if (*tag < '0' || *tag > '9') return false;
    char* end = nullptr;
    const long maj = std::strtol(tag, &end, 10);
    if (!end || *end != '.' || maj <= 0 || maj > 9) return false;
    const long mnr = std::strtol(end + 1, nullptr, 10);
    if (mnr < 0 || mnr > 9) return false;
    *major = static_cast<int>(maj);
    *minor = static_cast<int>(mnr);
    return true;
}

// ----------------------------------------------------------------- passes ---

static bool BudgetLeft(const SwpEstConfig& cfg, uint64_t start) {
    if (!cfg.budgetMicros) return true;
    if (!g.gl->nowMicros) return true;
    return (g.gl->nowMicros() - start) < cfg.budgetMicros;
}

static bool BindTarget(GLuint tex, int layer, int x, int y, int w, int h) {
    if (!g.gl->glBindFramebuffer || !g.gl->glCheckFramebufferStatus || !g.gl->glViewport) {
        return false;
    }
    g.gl->glBindFramebuffer(GL_FRAMEBUFFER, g.fbo);
    if (layer >= 0) {
        if (!g.gl->glFramebufferTextureLayer) return false;
        g.gl->glFramebufferTextureLayer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, tex, 0, layer);
    } else if (g.gl->glFramebufferTexture2D) {
        g.gl->glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, tex, 0);
    } else {
        return false;
    }
    const GLenum st = g.gl->glCheckFramebufferStatus(GL_FRAMEBUFFER);
    if (st != GL_FRAMEBUFFER_COMPLETE) {
        SWP_EST_LOG("GXRSwarp: pass: framebuffer incomplete 0x%x (tex %u %dx%d layer %d)",
                    (unsigned)st, (unsigned)tex, w, h, layer);
        return false;
    }
    g.gl->glViewport(x, y, w, h);
    return true;
}

static void BindSampler(GLint loc, GLint unit, GLuint tex, bool linear) {
    g.gl->glActiveTexture(kGlTexture0 + unit);
    g.gl->glBindTexture(GL_TEXTURE_2D, tex);
    if (g.gl->glBindSampler) {
        g.gl->glBindSampler(static_cast<GLuint>(unit),
                            linear ? g.samplerLinear : g.samplerNearest);
    }
    g.gl->glUniform1i(loc, unit);
}

static bool PassDraw(const char* tag) {
    (void)tag;
    g.gl->glDrawArrays(GL_TRIANGLES, 0, 3);
    if (g.gl->glGetError() != GL_NO_ERROR) {
        SWP_EST_LOG("GXRSwarp: pass: GL error in %s", tag);
        DrainErrors();
        return false;
    }
    return true;
}

// Uniform locations.
struct DownLocs { GLint src, srcSize, dstSize; } down{};
struct DenseLocs {
    GLint prev, curr, seedTex, seedSize, inputSize, mvSize, block, searchRadius, hasSeed,
        seedScale, levelToNative, minRatio, minAbs;
} dense{};
struct MedianLocs { GLint raw, mvSize, stride; } median{};
struct RefineLocs {
    GLint prev, curr, seedTex, seedSize, inputSize, mvSize, searchRadius, block,
        minRatio, minAbs;
} refine{};
struct ExtrapLocs { GLint src, mv, scaleFactor, fovScale, clampMag, srRadius, srMode; } extrap{};
struct AlignLocs { GLint prev, prevFov, currFov, rot; } align{};

static bool PassDownsample(uint32_t srcTex, uint32_t dstTex, int srcW, int srcH, int dstW,
                           int dstH) {
    g.gl->glUseProgram(g.progDown);
    if (!BindTarget(dstTex, -1, 0, 0, dstW, dstH)) return false;
    BindSampler(down.src, 0, srcTex, true);
    g.gl->glUniform2i(down.srcSize, srcW, srcH);
    g.gl->glUniform2i(down.dstSize, dstW, dstH);
    return PassDraw("downsample");
}

static bool PassDenseProgram(GLuint prog, const DenseLocs& loc, uint32_t prevTex,
                             uint32_t currTex, uint32_t seedTex, int seedW, int seedH,
                             bool hasSeed, float levelToNativeX, float levelToNativeY,
                             float seedScaleX, float seedScaleY, int radiusX, int radiusY,
                             uint32_t dstTex, int inputW, int inputH, int mvW, int mvH,
                             const SwpEstConfig& cfg) {
    g.gl->glUseProgram(prog);
    if (!BindTarget(dstTex, -1, 0, 0, mvW, mvH)) return false;
    BindSampler(loc.prev, 0, prevTex, true);
    BindSampler(loc.curr, 1, currTex, true);
    BindSampler(loc.seedTex, 2, seedTex ? seedTex : prevTex, false);
    g.gl->glUniform2i(loc.seedSize, seedW > 0 ? seedW : 1, seedH > 0 ? seedH : 1);
    g.gl->glUniform2i(loc.inputSize, inputW, inputH);
    g.gl->glUniform2i(loc.mvSize, mvW, mvH);
    g.gl->glUniform1i(loc.block, cfg.block);
    g.gl->glUniform2i(loc.searchRadius, radiusX, radiusY);
    g.gl->glUniform1i(loc.hasSeed, hasSeed ? 1 : 0);
    g.gl->glUniform2f(loc.seedScale, seedScaleX, seedScaleY);
    g.gl->glUniform2f(loc.levelToNative, levelToNativeX, levelToNativeY);
    g.gl->glUniform1f(loc.minRatio, cfg.minImprovementRatio);
    g.gl->glUniform1f(loc.minAbs, cfg.minImprovementAbs);
    return PassDraw("dense");
}


static bool PassMedian(uint32_t rawTex, int mvW, int mvH, uint32_t outTex) {
    g.gl->glUseProgram(g.progMedian);
    if (!BindTarget(outTex, -1, 0, 0, mvW, mvH)) return false;
    BindSampler(median.raw, 0, rawTex, false);
    g.gl->glUniform2i(median.mvSize, mvW, mvH);
    g.gl->glUniform2i(median.stride, 2, 2);
    return PassDraw("median");
}

static bool PassRefineProgram(GLuint prog, const RefineLocs& loc, uint32_t prevTex,
                              uint32_t currTex, uint32_t seedTex, int seedW, int seedH,
                              uint32_t dstTex, int inputW, int inputH, int mvW, int mvH,
                              const SwpEstConfig& cfg) {
    g.gl->glUseProgram(prog);
    if (!BindTarget(dstTex, -1, 0, 0, mvW, mvH)) return false;
    BindSampler(loc.prev, 0, prevTex, true);
    BindSampler(loc.curr, 1, currTex, true);
    BindSampler(loc.seedTex, 2, seedTex, false);
    g.gl->glUniform2i(loc.seedSize, seedW, seedH);
    g.gl->glUniform2i(loc.inputSize, inputW, inputH);
    g.gl->glUniform2i(loc.mvSize, mvW, mvH);
    g.gl->glUniform1i(loc.searchRadius, cfg.nativeSearch);
    g.gl->glUniform1i(loc.block, cfg.refineBlock);
    g.gl->glUniform1f(loc.minRatio, cfg.minImprovementRatio);
    g.gl->glUniform1f(loc.minAbs, cfg.minImprovementAbs);
    return PassDraw("refine");
}


static bool PassExtrap(const SwpEstConfig& cfg, float scaleFactor, uint32_t mvTex,
                       uint32_t srcTex, uint32_t dstTex, int layer, int dstX, int dstY,
                       int width, int height) {
    g.gl->glUseProgram(g.progExtrap);
    if (!BindTarget(dstTex, layer, dstX, dstY, width, height)) return false;
    BindSampler(extrap.src, 0, srcTex, true);
    BindSampler(extrap.mv, 1, mvTex, true);
    g.gl->glUniform1f(extrap.scaleFactor, scaleFactor);
    g.gl->glUniform1f(extrap.fovScale, cfg.fovScale);
    g.gl->glUniform1f(extrap.clampMag, cfg.clampMagUv);
    g.gl->glUniform1f(extrap.srRadius, cfg.srRadiusUv);
    g.gl->glUniform1i(extrap.srMode, cfg.srMode);
    return PassDraw("extrap");
}

static void RotationMatrix(const float* prevView, const float* currView, float out[9]) {
    // View matrices are world->camera, column-major. R = R_prev * R_curr^T.
    // Column-major 3x3 rotation: column c = (m[0+c], m[4+c], m[8+c]).
    const float* a = prevView;
    const float* b = currView;
    for (int r = 0; r < 3; ++r) {
        for (int c = 0; c < 3; ++c) {
            float sum = 0.0f;
            for (int k = 0; k < 3; ++k) {
                // a(r,k) * b(c,k)  (b^T(k,c) = b(c,k))
                sum += a[k * 4 + r] * b[k * 4 + c];
            }
            out[c * 3 + r] = sum;  // column-major output
        }
    }
}

static void Tangents(const float* fov, float out[4]) {
    out[0] = std::tan(fov[0]);
    out[1] = std::tan(fov[1]);
    out[2] = std::tan(fov[2]);
    out[3] = std::tan(fov[3]);
}

static bool PassAlign(uint32_t prevTex, const float* prevView, const float* prevFov,
                      const float* currView, const float* currFov, uint32_t dstTex, int width,
                      int height) {
    g.gl->glUseProgram(g.progAlign);
    if (!BindTarget(dstTex, -1, 0, 0, width, height)) return false;
    BindSampler(align.prev, 0, prevTex, true);
    float pf[4], cf[4], rot[9];
    Tangents(prevFov, pf);
    Tangents(currFov, cf);
    RotationMatrix(prevView, currView, rot);
    g.gl->glUniform4f(align.prevFov, pf[0], pf[1], pf[2], pf[3]);
    g.gl->glUniform4f(align.currFov, cf[0], cf[1], cf[2], cf[3]);
    g.gl->glUniformMatrix3fv(align.rot, 1, GL_FALSE, rot);
    return PassDraw("align");
}

// --------------------------------------------------------------- queries ---

static void PollTiming() {
    if (!g.timingArmed) return;
    bool ready[2] = {false, false};
    GLuint values[2] = {0, 0};
    for (int i = 0; i < 2; ++i) {
        if (!g.queryPending[i]) continue;
        GLuint available = 0;
        g.gl->glGetQueryObjectuiv(g.queries[i], kGlQueryResultAvailable, &available);
        if (!available) continue;
        g.gl->glGetQueryObjectuiv(g.queries[i], kGlQueryResult, &values[i]);
        ready[i] = true;
    }
    // Reading GPU_DISJOINT clears its event latch. Check once after collecting
    // this batch, and retain invalidation for pending samples not ready yet.
    GLint disjoint = 0;
    g.gl->glGetIntegerv(kGlGpuDisjoint, &disjoint);
    for (int i = 0; i < 2; ++i) {
        if (disjoint && g.queryPending[i]) g.queryDisjoint[i] = true;
        if (!ready[i]) continue;
        g.queryPending[i] = false;
        if (!g.queryDisjoint[i]) {
            g.lastGpuMicros = static_cast<unsigned long long>(values[i]) / 1000ull;
        }
        g.queryDisjoint[i] = false;
    }
}

static int BeginTiming() {
    if (!g.timingArmed || !g.gl->glGetQueryiv) return -1;
    PollTiming();
    const int slot = g.queryIndex;
    if (g.queryPending[slot]) return -1;
    // TIME_ELAPSED permits only one active query per context. The client may
    // already own it; timing is optional and must leave that query untouched.
    GLint current = 0;
    g.gl->glGetQueryiv(kGlTimeElapsed, kGlCurrentQuery, &current);
    if (g.gl->glGetError() != GL_NO_ERROR || current != 0) return -1;
    g.gl->glBeginQuery(kGlTimeElapsed, g.queries[slot]);
    if (g.gl->glGetError() != GL_NO_ERROR) return -1;
    g.queryIndex = 1 - slot;
    return slot;
}

static void EndTiming(int slot) {
    if (slot < 0 || !g.timingArmed) return;
    // Only a successful begin in THIS call grants ownership. Never infer it
    // from the alternating slot index, including when both queries are pending.
    GLint current = 0;
    g.gl->glGetQueryiv(kGlTimeElapsed, kGlCurrentQuery, &current);
    if (g.gl->glGetError() != GL_NO_ERROR ||
        static_cast<GLuint>(current) != g.queries[slot]) return;
    g.gl->glEndQuery(kGlTimeElapsed);
    if (g.gl->glGetError() == GL_NO_ERROR) g.queryPending[slot] = true;
}

// ----------------------------------------------------------- level helpers ---

struct CallGeometry {
    int levelW[kMaxLevels] = {};
    int levelH[kMaxLevels] = {};
    int levelMvW[kMaxLevels] = {};
    int levelMvH[kMaxLevels] = {};
    int count = 0;
};

static void BuildCallGeometry(const SwpEstConfig& cfg, int width, int height,
                              CallGeometry* out) {
    const int longest = width > height ? width : height;
    const double scale = longest > 1024 ? 1024.0 / static_cast<double>(longest) : 1.0;
    int w = static_cast<int>(std::lround(width * scale));
    int h = static_cast<int>(std::lround(height * scale));
    if (w < 64) w = 64;
    if (h < 64) h = 64;
    out->count = 0;
    out->levelW[0] = w;
    out->levelH[0] = h;
    out->levelMvW[0] = std::max(8, w / 2);
    out->levelMvH[0] = std::max(8, h / 2);
    out->count = 1;
    int lw = w, lh = h;
    while ((lw > 64 || lh > 64) && out->count < kMaxLevels) {
        lw = lw > 64 ? (lw + 1) / 2 : lw;
        lh = lh > 64 ? (lh + 1) / 2 : lh;
        out->levelW[out->count] = lw;
        out->levelH[out->count] = lh;
        out->levelMvW[out->count] = std::max(8, lw / 2);
        out->levelMvH[out->count] = std::max(8, lh / 2);
        ++out->count;
    }
    (void)cfg;
}

static bool PreparePyramid(uint32_t srcTex, int srcW, int srcH, bool prev,
                           const CallGeometry& geo, const SwpEstConfig& cfg) {
    uint32_t src = srcTex;
    int sw = srcW, sh = srcH;
    for (int i = 0; i < geo.count; ++i) {
        const Level& level = g.levels[i];
        uint32_t dst = prev ? level.prev : level.curr;
        if (!PassDownsample(src, dst, sw, sh, geo.levelW[i], geo.levelH[i])) return false;
        src = dst;
        sw = geo.levelW[i];
        sh = geo.levelH[i];
    }
    (void)cfg;
    return true;
}

static void CoarseRadius(const CallGeometry& geo, int nativeW, int nativeH, int* radiusX,
                         int* radiusY) {
    const int coarseW = geo.levelW[geo.count - 1];
    const int coarseH = geo.levelH[geo.count - 1];
    *radiusX = static_cast<int>(std::ceil(96.0 * static_cast<double>(coarseW) /
                                          static_cast<double>(nativeW)));
    *radiusY = static_cast<int>(std::ceil(96.0 * static_cast<double>(coarseH) /
                                          static_cast<double>(nativeH)));
    if (*radiusX < 1) *radiusX = 1;
    if (*radiusY < 1) *radiusY = 1;
    if (*radiusX > 64) *radiusX = 64;
    if (*radiusY > 64) *radiusY = 64;
}

static void ComputeFootprint() {
    unsigned long long bytes = 0;
    for (int i = 0; i < g.levelCount; ++i) {
        const Level& l = g.levels[i];
        bytes += static_cast<unsigned long long>(l.w) * l.h * 8ull * 2ull;  // prev+curr
        bytes += static_cast<unsigned long long>(l.mvW) * l.mvH * 8ull;    // mv
    }
    bytes += static_cast<unsigned long long>(g.medW) * g.medH * 8ull;
    g.footprint = bytes;
}

}  // namespace

// ------------------------------------------------------- internal entries ---

void EstiSetTable(const SwpGlTable* table) {
    g.gl = table;
}

bool EstiGlSetup(const SwpEstConfig& cfg, bool* qcomArmed) {
    if (qcomArmed) *qcomArmed = false;
    if (!g.gl) return false;

    if (!g.gl->glGetString || !g.gl->glGetError || !g.gl->glFlush || !g.gl->glUseProgram ||
        !g.gl->glGenFramebuffers || !g.gl->glDeleteFramebuffers || !g.gl->glBindFramebuffer ||
        !g.gl->glFramebufferTexture2D || !g.gl->glCheckFramebufferStatus ||
        !g.gl->glGenTextures || !g.gl->glDeleteTextures || !g.gl->glActiveTexture ||
        !g.gl->glIsEnabled || !g.gl->glEnable || !g.gl->glDisable || !g.gl->glColorMask ||
        !g.gl->glGetBooleanv || !g.gl->glBindTexture || !g.gl->glTexStorage2D ||
        !g.gl->glTexParameteri || !g.gl->glDrawArrays || !g.gl->glViewport ||
        !g.gl->glUniform1i || !g.gl->glUniform2i || !g.gl->glUniform1f ||
        !g.gl->glUniform2f || !g.gl->glUniform4f || !g.gl->glUniformMatrix3fv ||
        !g.gl->glGetUniformLocation ||
        !g.gl->glGetIntegerv || !g.gl->glCreateShader || !g.gl->glShaderSource ||
        !g.gl->glCompileShader || !g.gl->glGetShaderiv || !g.gl->glGetShaderInfoLog ||
        !g.gl->glDeleteShader || !g.gl->glCreateProgram || !g.gl->glAttachShader ||
        !g.gl->glLinkProgram || !g.gl->glGetProgramiv || !g.gl->glGetProgramInfoLog ||
        !g.gl->glDeleteProgram || !g.gl->glBindSampler || !g.gl->glGenSamplers ||
        !g.gl->glDeleteSamplers || !g.gl->glSamplerParameteri || !g.gl->glBlitFramebuffer) {
        SWP_EST_LOG("GXRSwarp: setup: GL table incomplete");
        return false;
    }

    DrainErrors();

    SaveState setupSaved;
    const bool setupSavedOk = SaveCallerState(&setupSaved);
    CallerStateRestore setupRestore{setupSaved, setupSavedOk};
    if (setupSavedOk) ApplyEngineState();
    // SaveCallerState restores the original active unit, which may be outside
    // the saved 0..4 range. Allocate only on a unit whose binding we saved.
    g.gl->glActiveTexture(kGlTexture0);

    const GLubyte* ver = g.gl->glGetString(GL_VERSION);
    if (!ver) {
        SWP_EST_LOG("GXRSwarp: setup: no GL_VERSION (context current?)");
        return false;
    }
    int major = 0, minor = 0;
    if (!ParseEsVersion(reinterpret_cast<const char*>(ver), &major, &minor) ||
        major < 3 || (major == 3 && minor < 2)) {
        SWP_EST_LOG("GXRSwarp: setup: GLES 3.2 required, found: %.60s",
                    reinterpret_cast<const char*>(ver));
        return false;
    }

    GLuint vsh = 0;
    if (!CompileShader(GL_VERTEX_SHADER, &gxr::swp_shaders::swp_vert_quad, 1, "quad-vert",
                       &vsh)) {
        return false;
    }

    bool ok = false;
    do {
        const char* downParts[1] = {gxr::swp_shaders::swp_downsample_frag};
        if (!BuildPassProgram("down", downParts, 1, vsh, &g.progDown)) break;
        const char* medianParts[1] = {gxr::swp_shaders::swp_median_frag};
        if (!BuildPassProgram("median", medianParts, 1, vsh, &g.progMedian)) break;
        const char* extrapParts[1] = {gxr::swp_shaders::swp_extrap_frag};
        if (!BuildPassProgram("extrap", extrapParts, 1, vsh, &g.progExtrap)) break;
        const char* alignParts[1] = {gxr::swp_shaders::swp_align_frag};
        if (!BuildPassProgram("align", alignParts, 1, vsh, &g.progAlign)) break;
        const char* denseParts[1] = {gxr::swp_shaders::swp_dense_fallback_frag};
        if (!BuildPassProgram("dense-portable", denseParts, 1, vsh, &g.progDense)) break;
        const char* refineParts[1] = {gxr::swp_shaders::swp_refine_fallback_frag};
        if (!BuildPassProgram("refine-portable", refineParts, 1, vsh, &g.progRefine)) break;
        ok = true;
    } while (false);

    // Portable GLSL is the shipped estimator. The QCOM block-match variant is
    // not armed: the previous "parity" probe compared two portable loops and
    // therefore proved nothing about hardware SAD. It stays unarmed until a
    // genuine hardware SAD path with a real normalized-result parity test is
    // implemented.
    g.haveQcom = false;
    g.gl->glDeleteShader(vsh);
    if (!ok) {
        if (g.gl->glDeleteProgram) {
            if (g.progDown) g.gl->glDeleteProgram(g.progDown);
            if (g.progMedian) g.gl->glDeleteProgram(g.progMedian);
            if (g.progExtrap) g.gl->glDeleteProgram(g.progExtrap);
            if (g.progAlign) g.gl->glDeleteProgram(g.progAlign);
            if (g.progDense) g.gl->glDeleteProgram(g.progDense);
            if (g.progRefine) g.gl->glDeleteProgram(g.progRefine);
        }
        DrainErrors();
        return false;
    }

    // Samplers: the estimator owns its filtering and restores the client's
    // sampler bindings around every call.
    g.gl->glGenSamplers(1, &g.samplerNearest);
    g.gl->glGenSamplers(1, &g.samplerLinear);
    if (g.samplerNearest) {
        g.gl->glSamplerParameteri(g.samplerNearest, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        g.gl->glSamplerParameteri(g.samplerNearest, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        g.gl->glSamplerParameteri(g.samplerNearest, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        g.gl->glSamplerParameteri(g.samplerNearest, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    }
    if (g.samplerLinear) {
        g.gl->glSamplerParameteri(g.samplerLinear, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        g.gl->glSamplerParameteri(g.samplerLinear, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        g.gl->glSamplerParameteri(g.samplerLinear, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        g.gl->glSamplerParameteri(g.samplerLinear, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    }

    // Working pyramid + per-level MV maps (nonaligned max dims accepted).
    int lw = cfg.workW, lh = cfg.workH;
    g.levelCount = 0;
    for (int i = 0; i < kMaxLevels; ++i) {
        Level& level = g.levels[i];
        level.w = lw;
        level.h = lh;
        level.mvW = std::max(8, lw / 2);
        level.mvH = std::max(8, lh / 2);
        // Register the level before allocation so a partial failure still
        // reaches every successfully created name in shutdown.
        g.levelCount = i + 1;
        if (!AllocTexture(&level.prev, lw, lh) || !AllocTexture(&level.curr, lw, lh) ||
            !AllocTexture(&level.mv, level.mvW, level.mvH)) {
            EstiGlShutdown();
            return false;
        }
        if (lw <= 64 && lh <= 64) break;
        lw = lw > 64 ? (lw + 1) / 2 : lw;
        lh = lh > 64 ? (lh + 1) / 2 : lh;
    }
    g.medW = g.levels[0].mvW;
    g.medH = g.levels[0].mvH;
    if (!AllocTexture(&g.medTex, g.medW, g.medH)) {
        EstiGlShutdown();
        return false;
    }
    g.gl->glGenFramebuffers(1, &g.fbo);
    if (!g.fbo) {
        EstiGlShutdown();
        return false;
    }

    ULocDef downDefs[] = {
        {"uSrc", &down.src}, {"uSrcSize", &down.srcSize}, {"uDstSize", &down.dstSize}};
    ULocDef denseDefs[] = {
        {"uPrev", &dense.prev}, {"uCurr", &dense.curr}, {"uSeedTex", &dense.seedTex},
        {"uSeedSize", &dense.seedSize}, {"uInputSize", &dense.inputSize},
        {"uMvSize", &dense.mvSize}, {"uBlock", &dense.block},
        {"uSearchRadius", &dense.searchRadius}, {"uHasSeed", &dense.hasSeed},
        {"uSeedScale", &dense.seedScale}, {"uLevelToNative", &dense.levelToNative},
        {"uMinImprovementRatio", &dense.minRatio}, {"uMinImprovementAbs", &dense.minAbs}};
    ULocDef medianDefs[] = {
        {"uL1Raw", &median.raw}, {"uMvSize", &median.mvSize},
        {"uMedianStride", &median.stride}};
    ULocDef refineDefs[] = {
        {"uPrev", &refine.prev}, {"uCurr", &refine.curr}, {"uSeedTex", &refine.seedTex},
        {"uSeedSize", &refine.seedSize}, {"uInputSize", &refine.inputSize},
        {"uMvSize", &refine.mvSize}, {"uSearchRadius", &refine.searchRadius},
        {"uBlock", &refine.block}, {"uMinImprovementRatio", &refine.minRatio},
        {"uMinImprovementAbs", &refine.minAbs}};
    ULocDef extrapDefs[] = {
        {"uSrc", &extrap.src}, {"uMv", &extrap.mv},
        {"uScaleFactor", &extrap.scaleFactor}, {"uFovScale", &extrap.fovScale},
        {"uClampMag", &extrap.clampMag}, {"uSrRadius", &extrap.srRadius},
        {"uSrMode", &extrap.srMode}};
    ULocDef alignDefs[] = {
        {"uPrev", &align.prev}, {"uPrevFov", &align.prevFov},
        {"uCurrFov", &align.currFov}, {"uRot", &align.rot}};
    ok = ResolveUniforms(g.progDown, downDefs, 3) &&
         ResolveUniforms(g.progDense, denseDefs, 13) &&
         ResolveUniforms(g.progMedian, medianDefs, 3) &&
         ResolveUniforms(g.progRefine, refineDefs, 10) &&
         ResolveUniforms(g.progExtrap, extrapDefs, 7) &&
         ResolveUniforms(g.progAlign, alignDefs, 4);
    if (!ok) {
        EstiGlShutdown();
        return false;
    }


    if (g.gl->glGetError() != GL_NO_ERROR) {
        DrainErrors();
        EstiGlShutdown();
        SWP_EST_LOG("GXRSwarp: setup: GL error during allocation");
        return false;
    }

    // Asynchronous completed-GPU timing (best effort; absence is not fatal).
    if (DetectTiming() && g.gl->glGenQueries && g.gl->glDeleteQueries && g.gl->glBeginQuery &&
        g.gl->glEndQuery && g.gl->glGetQueryObjectuiv && g.gl->glGetQueryiv) {
        GLint bits = 0;
        g.gl->glGetQueryiv(kGlTimeElapsed, kGlQueryCounterBits, &bits);
        if (bits > 0) {
            g.gl->glGenQueries(2, g.queries);
            g.timingArmed = g.queries[0] != 0 && g.queries[1] != 0;
        }
    }

    g.setupOk = true;
    ComputeFootprint();
    DrainErrors();
    if (qcomArmed) *qcomArmed = g.haveQcom;
    return true;
}

void EstiGlShutdown() {
    if (g.gl && g.gl->glDeleteProgram) {
        if (g.progDown) g.gl->glDeleteProgram(g.progDown);
        if (g.progDense) g.gl->glDeleteProgram(g.progDense);
        if (g.progMedian) g.gl->glDeleteProgram(g.progMedian);
        if (g.progRefine) g.gl->glDeleteProgram(g.progRefine);
        if (g.progExtrap) g.gl->glDeleteProgram(g.progExtrap);
        if (g.progAlign) g.gl->glDeleteProgram(g.progAlign);
    }
    if (g.gl && g.gl->glDeleteTextures) {
        for (int i = 0; i < kMaxLevels; ++i) {
            GLuint dead[3] = {g.levels[i].prev, g.levels[i].curr, g.levels[i].mv};
            for (int k = 0; k < 3; ++k) {
                if (dead[k]) g.gl->glDeleteTextures(1, &dead[k]);
            }
        }
        if (g.medTex) g.gl->glDeleteTextures(1, &g.medTex);
    }
    if (g.gl && g.fbo && g.gl->glDeleteFramebuffers) {
        g.gl->glDeleteFramebuffers(1, &g.fbo);
    }
    if (g.gl && g.gl->glDeleteSamplers) {
        if (g.samplerNearest) g.gl->glDeleteSamplers(1, &g.samplerNearest);
        if (g.samplerLinear) g.gl->glDeleteSamplers(1, &g.samplerLinear);
    }
    if (g.gl && g.gl->glDeleteQueries && (g.queries[0] || g.queries[1])) {
        g.gl->glDeleteQueries(2, g.queries);
    }
    EstiDropHandles();
}

void EstiDropHandles() {
    const SwpGlTable* keep = g.gl;
    g = Engine{};
    g.gl = keep;
}

bool EstiMvMapOneEyeEx(const SwpEstConfig& cfg, uint32_t prevTex, uint32_t currTex,
                       uint32_t mvTex, int width, int height, int mvW, int mvH,
                       SwpEstTickOut* out) {
    if (out) {
        out->ok = false;
        out->budgetExceeded = false;
    }
    if (!out) return false;
    if (!g.setupOk || !g.gl) return false;
    if (!prevTex || !currTex || !mvTex || width < 64 || height < 64 || mvW < 8 || mvH < 8) {
        return false;
    }

    SaveState saved;
    if (!SaveCallerState(&saved)) return false;
    ApplyEngineState();
    DrainErrors();
    const int timingSlot = BeginTiming();

    const uint64_t start = (cfg.budgetMicros && g.gl->nowMicros) ? g.gl->nowMicros() : 0;
    g.budgetHit = false;
    bool ok = false;

    CallGeometry geo;
    BuildCallGeometry(cfg, width, height, &geo);
    bool geometryFits = geo.count <= g.levelCount;
    for (int i = 0; i < geo.count && geometryFits; ++i) {
        if (geo.levelW[i] > g.levels[i].w || geo.levelH[i] > g.levels[i].h ||
            geo.levelMvW[i] > g.levels[i].mvW || geo.levelMvH[i] > g.levels[i].mvH) {
            geometryFits = false;
        }
    }
    if (!geometryFits) {
        SWP_EST_LOG("GXRSwarp: mv: call %dx%d needs geometry beyond the allocated pyramid",
                    width, height);
    } else {
        do {
            if (!PreparePyramid(prevTex, width, height, true, geo, cfg)) break;
            if (!BudgetLeft(cfg, start)) { g.budgetHit = true; break; }
            if (!PreparePyramid(currTex, width, height, false, geo, cfg)) break;
            if (!BudgetLeft(cfg, start)) { g.budgetHit = true; break; }

            // Coarsest -> finest. The coarsest level covers the full +-96
            // native-pixel envelope with dense integer steps; every finer level
            // refines +-2 around the upsampled native-offset seed. X and Y
            // scales/radii are independent: a 2048x128 source has a different
            // vertical ratio than horizontal.
            int seedW = 0, seedH = 0;
            uint32_t seedTex = 0;
            bool pyramidOk = true;
            for (int i = geo.count - 1; i >= 0; --i) {
                const int lw = geo.levelW[i];
                const int lh = geo.levelH[i];
                const int lmvW = geo.levelMvW[i];
                const int lmvH = geo.levelMvH[i];
                const bool hasSeed = i < geo.count - 1;
                const float levelToNativeX = static_cast<float>(width) / static_cast<float>(lw);
                const float levelToNativeY = static_cast<float>(height) / static_cast<float>(lh);
                const float seedScaleX = 1.0f / levelToNativeX;
                const float seedScaleY = 1.0f / levelToNativeY;
                int radiusX = cfg.levelSearch;
                int radiusY = cfg.levelSearch;
                if (!hasSeed) CoarseRadius(geo, width, height, &radiusX, &radiusY);
                const uint32_t dst = g.levels[i].mv;
                if (!PassDenseProgram(g.progDense, dense, g.levels[i].prev, g.levels[i].curr,
                                      seedTex, seedW, seedH, hasSeed, levelToNativeX,
                                      levelToNativeY, seedScaleX, seedScaleY, radiusX, radiusY,
                                      dst, lw, lh, lmvW, lmvH, cfg)) {
                    pyramidOk = false;
                    break;
                }
                seedTex = dst;
                seedW = lmvW;
                seedH = lmvH;
                if (!BudgetLeft(cfg, start)) { g.budgetHit = true; pyramidOk = false; break; }
            }
            if (!pyramidOk || g.budgetHit) break;

            // Median smoothing at the working level, then native refinement.
            if (!PassMedian(g.levels[0].mv, geo.levelMvW[0], geo.levelMvH[0], g.medTex)) break;
            if (!BudgetLeft(cfg, start)) { g.budgetHit = true; break; }
            if (!PassRefineProgram(g.progRefine, refine, prevTex, currTex, g.medTex,
                                   geo.levelMvW[0], geo.levelMvH[0], mvTex, width, height,
                                   mvW, mvH, cfg)) {
                break;
            }
            ok = true;
        } while (false);
    }

    EndTiming(timingSlot);
    DrainErrors();
    g.gl->glFlush();
    RestoreCallerState(saved);
    out->ok = ok;
    out->budgetExceeded = g.budgetHit;
    return ok;
}

bool EstiMvMapOneEye(const SwpEstConfig& cfg, uint32_t prevTex, uint32_t currTex,
                     uint32_t mvTex, SwpEstTickOut* out) {
    return EstiMvMapOneEyeEx(cfg, prevTex, currTex, mvTex, cfg.inputW, cfg.inputH, cfg.mvW,
                             cfg.mvH, out);
}

bool EstiExtrapolateOneEyeEx(const SwpEstConfig& cfg, float scaleFactor, uint32_t mvTex,
                             uint32_t srcTex, uint32_t dstTex, int layer, int dstX, int dstY,
                             int width, int height, SwpEstTickOut* out) {
    if (out) {
        out->ok = false;
        out->budgetExceeded = false;
    }
    if (!out) return false;
    if (!g.setupOk || !g.gl) return false;
    if (!mvTex || !srcTex || !dstTex || width < 1 || height < 1) return false;
    if (!(scaleFactor >= 1.0f)) scaleFactor = 1.0f;

    SaveState saved;
    if (!SaveCallerState(&saved)) return false;
    ApplyEngineState();
    DrainErrors();
    const int timingSlot = BeginTiming();

    const uint64_t start = (cfg.budgetMicros && g.gl->nowMicros) ? g.gl->nowMicros() : 0;
    const bool ok = PassExtrap(cfg, scaleFactor, mvTex, srcTex, dstTex, layer, dstX, dstY,
                               width, height);
    if (ok && !BudgetLeft(cfg, start)) out->budgetExceeded = true;

    EndTiming(timingSlot);
    DrainErrors();
    g.gl->glFlush();
    RestoreCallerState(saved);
    out->ok = ok;
    return ok;
}

bool EstiExtrapolateOneEye(const SwpEstConfig& cfg, float scaleFactor, uint32_t mvTex,
                           uint32_t srcTex, uint32_t dstTex, SwpEstTickOut* out) {
    return EstiExtrapolateOneEyeEx(cfg, scaleFactor, mvTex, srcTex, dstTex, -1, 0, 0,
                                   cfg.inputW, cfg.inputH, out);
}

bool EstiAlignOneEye(const SwpEstConfig& cfg, const float* prevView, const float* prevFov,
                     const float* currView, const float* currFov, uint32_t prevTex,
                     uint32_t dstTex, int width, int height, SwpEstTickOut* out) {
    if (out) {
        out->ok = false;
        out->budgetExceeded = false;
    }
    if (!out) return false;
    if (!g.setupOk || !g.gl) return false;
    if (!prevTex || !dstTex || width < 1 || height < 1) return false;

    SaveState saved;
    if (!SaveCallerState(&saved)) return false;
    ApplyEngineState();
    DrainErrors();
    const int timingSlot = BeginTiming();

    const uint64_t start = (cfg.budgetMicros && g.gl->nowMicros) ? g.gl->nowMicros() : 0;
    const bool ok = PassAlign(prevTex, prevView, prevFov, currView, currFov, dstTex, width,
                              height);
    if (ok && !BudgetLeft(cfg, start)) out->budgetExceeded = true;

    EndTiming(timingSlot);
    DrainErrors();
    g.gl->glFlush();
    RestoreCallerState(saved);
    out->ok = ok;
    return ok;
}

unsigned long long EstiFootprintBytes() {
    return g.footprint;
}

bool EstiGpuTimingAvailable() {
    return g.timingArmed;
}

unsigned long long EstiLastGpuMicros() {
    PollTiming();
    return g.lastGpuMicros;
}

}  // namespace swp_internal
}  // namespace gxr

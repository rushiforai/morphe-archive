// Focused real-worker tests for the 2026-10-26 estimator repairs.
//
// Compiles the PRODUCTION swp_est_worker.cpp with GL stubs and drives the
// internal entry points directly. Covers geometry admission, pyramid-pass
// failure propagation, and read/draw framebuffer restoration. It does not
// claim real GPU shader output.

#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <algorithm>

#include "../src/swp_est_worker.cpp"

static int g_checks = 0;
static int g_failures = 0;
#define CHECK(cond, label)                                                     \
    do {                                                                       \
        g_checks++;                                                            \
        if (!(cond)) {                                                         \
            g_failures++;                                                      \
            std::printf("FAIL: %s (line %d)\n", label, __LINE__);              \
        }                                                                      \
    } while (0)

extern "C" int __android_log_print(int, const char*, const char*, ...) { return 1; }

static GLenum g_error = GL_NO_ERROR;
static int g_drawCalls = 0;
static int g_failDrawAt = -1;
static GLint g_readBinding = 7;
static GLint g_drawBinding = 8;
static GLint g_lastReadBinding = -1;
static GLint g_lastDrawBinding = -1;
static GLuint g_nextName = 100;
static GLuint g_boundTextures[16] = {};
static GLint g_activeUnit = GL_TEXTURE0;
static int g_genTextureCalls = 0;
static int g_failGenTextureAt = -1;
static int g_liveTextures = 0;
static GLuint g_activeQuery = 0;
static int g_beginQueryCalls = 0;
static int g_endQueryCalls = 0;
static bool g_failBeginQuery = false;
static bool g_timingExtension = false;
static GLuint g_queryAvailable = 0;
static GLuint g_unavailableQuery = 0;
static GLint g_disjointEvent = 0;
static int g_disjointReads = 0;

extern "C" {
GLuint glCreateShader(GLenum) { return ++g_nextName; }
void glShaderSource(GLuint, GLsizei, const GLchar* const*, const GLint*) {}
void glCompileShader(GLuint) {}
void glGetShaderiv(GLuint, GLenum, GLint* p) { if (p) *p = GL_TRUE; }
void glGetShaderInfoLog(GLuint, GLsizei, GLsizei* n, GLchar* log) {
    if (n) *n = 0;
    if (log) log[0] = 0;
}
void glDeleteShader(GLuint) {}
GLuint glCreateProgram() { return ++g_nextName; }
void glAttachShader(GLuint, GLuint) {}
void glLinkProgram(GLuint) {}
void glGetProgramiv(GLuint, GLenum, GLint* p) { if (p) *p = GL_TRUE; }
void glGetProgramInfoLog(GLuint, GLsizei, GLsizei* n, GLchar* log) {
    if (n) *n = 0;
    if (log) log[0] = 0;
}
void glDeleteProgram(GLuint) {}
GLint glGetUniformLocation(GLuint, const GLchar*) { return 0; }
void glUniform1i(GLint, GLint) {}
void glUniform2i(GLint, GLint, GLint) {}
void glUniform1f(GLint, GLfloat) {}
void glUniform2f(GLint, GLfloat, GLfloat) {}
void glUniform4f(GLint, GLfloat, GLfloat, GLfloat, GLfloat) {}
void glUniformMatrix3fv(GLint, GLsizei, GLboolean, const GLfloat*) {}
void glUseProgram(GLuint) {}
void glDrawArrays(GLenum, GLint, GLsizei) {
    ++g_drawCalls;
    if (g_drawCalls == g_failDrawAt) g_error = GL_INVALID_OPERATION;
}
void glViewport(GLint, GLint, GLsizei, GLsizei) {}
void glFlush() {}
GLenum glGetError() {
    const GLenum e = g_error;
    g_error = GL_NO_ERROR;
    return e;
}
void glGenFramebuffers(GLsizei n, GLuint* ids) { for (GLsizei i = 0; i < n; ++i) ids[i] = ++g_nextName; }
void glDeleteFramebuffers(GLsizei, const GLuint*) {}
void glBindFramebuffer(GLenum target, GLuint id) {
    if (target == GL_READ_FRAMEBUFFER) { g_readBinding = static_cast<GLint>(id); g_lastReadBinding = g_readBinding; }
    if (target == GL_DRAW_FRAMEBUFFER) { g_drawBinding = static_cast<GLint>(id); g_lastDrawBinding = g_drawBinding; }
    if (target == GL_FRAMEBUFFER) { g_readBinding = g_drawBinding = static_cast<GLint>(id); }
}
void glFramebufferTexture2D(GLenum, GLenum, GLenum, GLuint, GLint) {}
void glFramebufferTextureLayer(GLenum, GLenum, GLuint, GLint, GLint) {}
GLenum glCheckFramebufferStatus(GLenum) { return GL_FRAMEBUFFER_COMPLETE; }
void glBlitFramebuffer(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum) {}
void glGenTextures(GLsizei n, GLuint* ids) {
    for (GLsizei i = 0; i < n; ++i) {
        ++g_genTextureCalls;
        if (g_genTextureCalls == g_failGenTextureAt) {
            ids[i] = 0;
            continue;
        }
        ids[i] = ++g_nextName;
        ++g_liveTextures;
    }
}
void glDeleteTextures(GLsizei n, const GLuint* ids) {
    for (GLsizei i = 0; i < n; ++i) {
        if (ids[i] && g_liveTextures > 0) --g_liveTextures;
    }
}
void glBindTexture(GLenum target, GLuint texture) {
    if (target == GL_TEXTURE_2D) g_boundTextures[g_activeUnit - GL_TEXTURE0] = texture;
}
void glActiveTexture(GLenum texture) { g_activeUnit = static_cast<GLint>(texture); }
void glTexStorage2D(GLenum, GLsizei, GLenum, GLsizei, GLsizei) {}
void glTexSubImage2D(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, const void*) {}
void glReadPixels(GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, void*) {}
void glTexParameteri(GLenum, GLenum, GLint) {}
const GLubyte* glGetString(GLenum name) {
    if (name == GL_EXTENSIONS) {
        return reinterpret_cast<const GLubyte*>(g_timingExtension ? "GL_EXT_disjoint_timer_query" : "");
    }
    return reinterpret_cast<const GLubyte*>("OpenGL ES 3.2 stub");
}
void glGetIntegerv(GLenum pname, GLint* p) {
    if (!p) return;
    if (pname == GL_READ_FRAMEBUFFER_BINDING) *p = g_readBinding;
    else if (pname == GL_DRAW_FRAMEBUFFER_BINDING) *p = g_drawBinding;
    else if (pname == GL_TEXTURE_BINDING_2D) *p = static_cast<GLint>(g_boundTextures[g_activeUnit - GL_TEXTURE0]);
    else if (pname == GL_ACTIVE_TEXTURE) *p = g_activeUnit;
    else if (pname == 0x8FBB /* GL_GPU_DISJOINT_EXT */) {
        *p = g_disjointEvent;
        g_disjointEvent = 0;
        ++g_disjointReads;
    }
    else *p = 0;
}
GLboolean glIsEnabled(GLenum) { return GL_FALSE; }
void glEnable(GLenum) {}
void glDisable(GLenum) {}
void glColorMask(GLboolean, GLboolean, GLboolean, GLboolean) {}
void glGetBooleanv(GLenum, GLboolean* data) { if (data) { data[0] = data[1] = data[2] = data[3] = GL_TRUE; } }
void glGenSamplers(GLsizei n, GLuint* ids) { for (GLsizei i = 0; i < n; ++i) ids[i] = ++g_nextName; }
void glDeleteSamplers(GLsizei, const GLuint*) {}
void glBindSampler(GLuint, GLuint) {}
void glSamplerParameteri(GLuint, GLenum, GLint) {}
void glGenQueries(GLsizei n, GLuint* ids) { for (GLsizei i = 0; i < n; ++i) ids[i] = ++g_nextName; }
void glDeleteQueries(GLsizei, const GLuint*) {}
void glBeginQuery(GLenum, GLuint id) {
    ++g_beginQueryCalls;
    if (g_failBeginQuery || g_activeQuery) g_error = GL_INVALID_OPERATION;
    else g_activeQuery = id;
}
void glEndQuery(GLenum) {
    ++g_endQueryCalls;
    if (!g_activeQuery) g_error = GL_INVALID_OPERATION;
    else g_activeQuery = 0;
}
void glGetQueryObjectuiv(GLuint id, GLenum pname, GLuint* p) {
    if (p) *p = pname == 0x8867 /* GL_QUERY_RESULT_AVAILABLE */
                    ? (id == g_unavailableQuery ? 0 : g_queryAvailable) : 123000;
}
void glGetQueryiv(GLenum, GLenum pname, GLint* p) {
    if (p) *p = pname == 0x8864 /* GL_QUERY_COUNTER_BITS */ ? 32 : static_cast<GLint>(g_activeQuery);
}
}

static SwpGlTable MakeTable() {
    SwpGlTable t{};
    t.glCreateShader = &glCreateShader;
    t.glShaderSource = &glShaderSource;
    t.glCompileShader = &glCompileShader;
    t.glGetShaderiv = &glGetShaderiv;
    t.glGetShaderInfoLog = &glGetShaderInfoLog;
    t.glDeleteShader = &glDeleteShader;
    t.glCreateProgram = &glCreateProgram;
    t.glAttachShader = &glAttachShader;
    t.glLinkProgram = &glLinkProgram;
    t.glGetProgramiv = &glGetProgramiv;
    t.glGetProgramInfoLog = &glGetProgramInfoLog;
    t.glDeleteProgram = &glDeleteProgram;
    t.glGetUniformLocation = &glGetUniformLocation;
    t.glUniform1i = &glUniform1i;
    t.glUniform2i = &glUniform2i;
    t.glUniform1f = &glUniform1f;
    t.glUniform2f = &glUniform2f;
    t.glUniform4f = &glUniform4f;
    t.glUniformMatrix3fv = &glUniformMatrix3fv;
    t.glUseProgram = &glUseProgram;
    t.glDrawArrays = &glDrawArrays;
    t.glViewport = &glViewport;
    t.glFlush = &glFlush;
    t.glGetError = &glGetError;
    t.glGenFramebuffers = &glGenFramebuffers;
    t.glDeleteFramebuffers = &glDeleteFramebuffers;
    t.glBindFramebuffer = &glBindFramebuffer;
    t.glFramebufferTexture2D = &glFramebufferTexture2D;
    t.glFramebufferTextureLayer = &glFramebufferTextureLayer;
    t.glCheckFramebufferStatus = &glCheckFramebufferStatus;
    t.glBlitFramebuffer = &glBlitFramebuffer;
    t.glGenTextures = &glGenTextures;
    t.glDeleteTextures = &glDeleteTextures;
    t.glBindTexture = &glBindTexture;
    t.glActiveTexture = &glActiveTexture;
    t.glTexStorage2D = &glTexStorage2D;
    t.glTexSubImage2D = &glTexSubImage2D;
    t.glReadPixels = &glReadPixels;
    t.glTexParameteri = &glTexParameteri;
    t.glGetString = &glGetString;
    t.glGetIntegerv = &glGetIntegerv;
    t.glIsEnabled = &glIsEnabled;
    t.glEnable = &glEnable;
    t.glDisable = &glDisable;
    t.glColorMask = &glColorMask;
    t.glGetBooleanv = &glGetBooleanv;
    t.glGenSamplers = &glGenSamplers;
    t.glDeleteSamplers = &glDeleteSamplers;
    t.glBindSampler = &glBindSampler;
    t.glSamplerParameteri = &glSamplerParameteri;
    t.glGenQueries = &glGenQueries;
    t.glDeleteQueries = &glDeleteQueries;
    t.glBeginQuery = &glBeginQuery;
    t.glEndQuery = &glEndQuery;
    t.glGetQueryObjectuiv = &glGetQueryObjectuiv;
    t.glGetQueryiv = &glGetQueryiv;
    t.getCurrentContext = []() -> void* { return reinterpret_cast<void*>(0xC0DE); };
    t.nowMicros = []() -> unsigned long long { return 0; };
    return t;
}

namespace gxr {
namespace swp_internal {

static void PrepareEngine(int levelW, int levelH) {
    static SwpGlTable table = MakeTable();
    gxr::swp_internal::EstiSetTable(&table);
    g = gxr::swp_internal::Engine{};
    g.gl = &table;
    g.setupOk = true;
    g.fbo = 1;
    g.progDown = 2;
    g.progDense = 3;
    g.progMedian = 4;
    g.progRefine = 5;
    g.progExtrap = 6;
    g.progAlign = 7;
    g.levelCount = 0;
    int lw = levelW, lh = levelH;
    for (int i = 0; i < 4; ++i) {
        gxr::swp_internal::Level& level = g.levels[i];
        level.w = lw;
        level.h = lh;
        level.mvW = std::max(8, lw / 2);
        level.mvH = std::max(8, lh / 2);
        level.prev = 100 + i * 3;
        level.curr = 101 + i * 3;
        level.mv = 102 + i * 3;
        ++g.levelCount;
        if (lw <= 64 && lh <= 64) break;
        lw = lw > 64 ? (lw + 1) / 2 : lw;
        lh = lh > 64 ? (lh + 1) / 2 : lh;
    }
    g.medW = g.levels[0].mvW;
    g.medH = g.levels[0].mvH;
    g.medTex = 90;
    g_drawCalls = 0;
    g_failDrawAt = -1;
    g_error = GL_NO_ERROR;
    g_readBinding = 7;
    g_drawBinding = 8;
    g_lastReadBinding = -1;
    g_lastDrawBinding = -1;
    g_activeQuery = 0;
    g_beginQueryCalls = g_endQueryCalls = 0;
    g_failBeginQuery = false;
    g_queryAvailable = 0;
    g_unavailableQuery = 0;
    g_disjointEvent = 0;
    g_disjointReads = 0;
}

static gxr::swp_internal::SwpEstConfig MakeConfig(int w, int h) {
    gxr::swp_internal::SwpEstConfig cfg{};
    cfg.inputW = w;
    cfg.inputH = h;
    cfg.mvW = std::max(64, w / 2);
    cfg.mvH = std::max(64, h / 2);
    cfg.workW = std::min(1024, w);
    cfg.workH = std::min(1024, h);
    cfg.block = 8;
    cfg.refineBlock = 4;
    cfg.nativeSearch = 2;
    cfg.levelSearch = 2;
    cfg.minImprovementRatio = 0.01f;
    cfg.minImprovementAbs = 1e-6f;
    cfg.budgetMicros = 0;
    return cfg;
}

static void CheckGeometryAdmission() {
    PrepareEngine(1024, 512);
    auto cfg = MakeConfig(1024, 1024);
    gxr::swp_internal::SwpEstTickOut out{};
    const bool ok = gxr::swp_internal::EstiMvMapOneEyeEx(cfg, 11, 12, 13, 1024, 1024,
                                                         512, 512, &out);
    CHECK(!ok, "a component taller than the allocated pyramid is rejected before drawing");
    CHECK(g_drawCalls == 0, "geometry rejection performs no clipped draws");
}

static void CheckDenseFailurePropagation() {
    PrepareEngine(512, 256);
    auto cfg = MakeConfig(512, 256);
    // Downsample passes = 2 per level, then the coarsest dense pass. Fail that
    // dense draw and require the whole estimation to fail instead of running
    // median/refinement on stale maps.
    g_failDrawAt = g.levelCount * 2 + 1;
    gxr::swp_internal::SwpEstTickOut out{};
    const bool ok = gxr::swp_internal::EstiMvMapOneEyeEx(cfg, 11, 12, 13, 512, 256, 256, 128,
                                                         &out);
    CHECK(!ok, "a failed dense pyramid pass fails the whole estimation");
}

static void CheckIndependentScales() {
    auto cfg = MakeConfig(2048, 128);
    CallGeometry geo;
    BuildCallGeometry(cfg, 2048, 128, &geo);
    int rx = 0, ry = 0;
    CoarseRadius(geo, 2048, 128, &rx, &ry);
    CHECK(rx == 3 && ry == 48,
          "coarse search radius is independent on X and Y (3 and 48 level texels)");
}

static void CheckSetupStateAndLeak() {
    static SwpGlTable table = MakeTable();
    CHECK(SwpSetGlTable(&table), "GL table accepted for setup tests");
    GLuint savedTextures[16];
    for (int i = 0; i < 16; ++i) savedTextures[i] = g_boundTextures[i] = 1000 + i;
    g_activeUnit = GL_TEXTURE0 + 7;
    g_timingExtension = true;
    SwpInitInfo info{};
    info.inputWidth = 512;
    info.inputHeight = 512;
    info.flags = SWP_INIT_FLAG_BUDGET_OFF;
    CHECK(SwpInit(&info), "estimator setup succeeds with the stub table");
    CHECK(std::equal(savedTextures, savedTextures + 16, g_boundTextures) &&
              g_activeUnit == GL_TEXTURE0 + 7,
          "setup preserves per-unit texture bindings with caller unit 7 active");
    CHECK(SwpGpuTimingAvailable(), "setup queries counter bits and arms supported timing");
    SwpDestroy();
    g_timingExtension = false;

    // Fail one allocation after several pyramid levels have succeeded. All
    // successfully created names must be deleted by the failure path.
    g_genTextureCalls = 0;
    g_failGenTextureAt = 4;
    g_liveTextures = 0;
    CHECK(!SwpInit(&info), "a partial pyramid allocation fails setup");
    CHECK(g_liveTextures == 0, "partial pyramid allocation leaks no textures");
    CHECK(std::equal(savedTextures, savedTextures + 16, g_boundTextures) &&
              g_activeUnit == GL_TEXTURE0 + 7,
          "failed setup preserves per-unit texture bindings with caller unit 7 active");
    g_failGenTextureAt = -1;
    SwpDestroy();
}

static void CheckFboRestoration() {
    PrepareEngine(256, 128);
    auto cfg = MakeConfig(256, 128);
    gxr::swp_internal::SwpEstTickOut out{};
    (void)gxr::swp_internal::EstiMvMapOneEyeEx(cfg, 11, 12, 13, 256, 128, 128, 64, &out);
    CHECK(g_lastReadBinding == 7 && g_lastDrawBinding == 8,
          "read and draw framebuffer bindings are restored separately");
}

static bool RunTimedEye() {
    const auto cfg = MakeConfig(256, 128);
    SwpEstTickOut out{};
    return EstiMvMapOneEyeEx(cfg, 11, 12, 13, 256, 128, 128, 64, &out);
}

static void PrepareTiming() {
    PrepareEngine(256, 128);
    g.timingArmed = true;
    g.queries[0] = 901;
    g.queries[1] = 902;
}

static void CheckTimerOwnership() {
    PrepareTiming();
    g_activeQuery = 777;
    CHECK(RunTimedEye(), "client timer does not prevent estimation");
    CHECK(g_beginQueryCalls == 0 && g_endQueryCalls == 0 && g_activeQuery == 777,
          "an active client timer is neither begun over nor ended");
    CHECK(!g.queryPending[0] && !g.queryPending[1], "client timer never becomes an owned pending sample");

    PrepareTiming();
    g_failBeginQuery = true;
    CHECK(RunTimedEye(), "optional timer begin failure does not fail estimation");
    CHECK(g_beginQueryCalls == 1 && g_endQueryCalls == 0 && g_activeQuery == 0,
          "failed timer begin is never paired with an end");
    CHECK(g.queryIndex == 0 && !g.queryPending[0] && !g.queryPending[1],
          "failed timer begin neither advances nor creates a pending slot");

    PrepareTiming();
    g.queryIndex = 1;
    g.queryPending[1] = true;
    CHECK(RunTimedEye(), "pending selected timer slot does not prevent estimation");
    CHECK(g_beginQueryCalls == 0 && g_endQueryCalls == 0 && !g.queryPending[0] && g.queryPending[1],
          "skipped begin on a pending slot does not end or mark the other slot");

    PrepareTiming();
    g.queryPending[0] = g.queryPending[1] = true;
    CHECK(RunTimedEye(), "two unavailable timer samples do not block estimation");
    CHECK(g_beginQueryCalls == 0 && g_endQueryCalls == 0,
          "pending samples trigger no timer begin or end");

    PrepareTiming();
    CHECK(RunTimedEye(), "owned timer query permits estimation");
    CHECK(g_beginQueryCalls == 1 && g_endQueryCalls == 1 && g_activeQuery == 0 &&
              g.queryPending[0] && !g.queryPending[1] && g.queryIndex == 1,
          "successful timer begin ends exactly its owned query and marks that slot pending");
    CHECK(RunTimedEye(), "second timer slot permits estimation without waiting");
    CHECK(g_beginQueryCalls == 2 && g_endQueryCalls == 2 && g.queryPending[1],
          "successful timer calls alternate owned slots");
    g_queryAvailable = 1;
    CHECK(RunTimedEye() && g.lastGpuMicros == 123,
          "completed owned timer samples are polled without blocking");
}

static void CheckDisjointBatch() {
    PrepareTiming();
    g.queryPending[0] = g.queryPending[1] = true;
    g.lastGpuMicros = 555;
    g_queryAvailable = 1;
    g_disjointEvent = 1;
    PollTiming();
    CHECK(g_disjointReads == 1 && g_disjointEvent == 0,
          "a ready batch reads and clears the disjoint event exactly once");
    CHECK(!g.queryPending[0] && !g.queryPending[1] && g.lastGpuMicros == 555,
          "one disjoint event rejects both ready timing samples");

    PrepareTiming();
    g.queryPending[0] = g.queryPending[1] = true;
    g.lastGpuMicros = 555;
    g_queryAvailable = 1;
    g_unavailableQuery = g.queries[1];
    g_disjointEvent = 1;
    PollTiming();
    CHECK(!g.queryPending[0] && g.queryPending[1] && g.queryDisjoint[1] &&
              g.lastGpuMicros == 555,
          "disjoint invalidation covers a sample whose result is not ready yet");
    g_unavailableQuery = 0;
    PollTiming();
    CHECK(!g.queryPending[1] && !g.queryDisjoint[1] && g.lastGpuMicros == 555,
          "a delayed invalid sample stays rejected after the disjoint latch clears");
    CHECK(RunTimedEye(), "a collected invalid sample slot can be reused");
    PollTiming();
    CHECK(g.lastGpuMicros == 123, "fresh samples after disjoint recovery can publish timing");

    PrepareTiming();
    g.queryPending[0] = g.queryPending[1] = true;
    g.lastGpuMicros = 555;
    g_disjointEvent = 1;
    PollTiming();
    CHECK(g_disjointReads == 1 && g.queryDisjoint[0] && g.queryDisjoint[1],
          "a disjoint event invalidates outstanding samples even when neither is ready");
    g_queryAvailable = 1;
    PollTiming();
    CHECK(!g.queryPending[0] && !g.queryPending[1] && g.lastGpuMicros == 555,
          "later collection never publishes samples invalidated while unavailable");
}

}  // namespace swp_internal
}  // namespace gxr

int main() {
    gxr::swp_internal::CheckGeometryAdmission();
    gxr::swp_internal::CheckDenseFailurePropagation();
    gxr::swp_internal::CheckIndependentScales();
    gxr::swp_internal::CheckSetupStateAndLeak();
    gxr::swp_internal::CheckFboRestoration();
    gxr::swp_internal::CheckTimerOwnership();
    gxr::swp_internal::CheckDisjointBatch();
    std::printf("gxr-spacewarp estimator worker tests: %d checks, %d failures\n", g_checks,
                g_failures);
    return g_failures == 0 ? 0 : 1;
}

// Host tests for the gxr-spacewarp dispatch (2026-10-26 half-rate revival).
//
// Compiles the PRODUCTION dispatch TU with estimator fakes and fake next-chain
// XR functions. Covers: late-frame ownership, the predicted-display-time
// scheduler, synthetic-slot discard, phase-preserving failures, duplicate /
// out-of-order timestamps, odd and array layouts, private-output substitution,
// and teardown ordering.

#include <algorithm>
#include <array>
#include <cmath>
#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <map>
#include <string>
#include <vector>

#define SWP_HAVE_ESTIMATOR 1
#include "../src/swp_dispatch.cpp"

#include <GLES3/gl3.h>

extern "C" {
uint64_t SwpEglTestSetNowNs(uint64_t nowNs);
void SwpEglResetArrivals();
uint64_t SwpEglTestClockReads();
void SwpEglTestResetClockReads();
uint64_t SwpEglTestArrivalCount();
void* SwpWrapEglCreateImageKHR(void*, void*, unsigned, void*, const int*);
void SwpEglArrivalObserved(void* image, void* ctx, void* dpy, uint64_t monoNs);
}

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

std::vector<std::string> g_logLines;
extern "C" int __android_log_print(int, const char*, const char* format, ...) {
    char line[256];
    va_list args;
    va_start(args, format);
    std::vsnprintf(line, sizeof(line), format, args);
    va_end(args);
    g_logLines.push_back(line);
    return 1;
}

// --- GLES3 stubs -----------------------------------------------------------
static int g_glCalls = 0;
static int g_contextReads = 0;
static GLuint g_nextTextureId = 500;
static std::vector<GLuint> g_deletedTextures;
static std::vector<GLuint> g_deletedFbos;
static int g_blitCalls = 0;
static std::vector<GLuint> g_captureSources;
static int g_layerBlits = 0;
extern "C" GLuint glCreateShader(GLenum) { ++g_glCalls; return ++g_nextTextureId; }
extern "C" void glShaderSource(GLuint, GLsizei, const GLchar* const*, const GLint*) { ++g_glCalls; }
extern "C" void glCompileShader(GLuint) { ++g_glCalls; }
extern "C" void glGetShaderiv(GLuint, GLenum, GLint* params) { ++g_glCalls; if (params) *params = GL_TRUE; }
extern "C" void glGetShaderInfoLog(GLuint, GLsizei, GLsizei* length, GLchar* log) { ++g_glCalls;
    if (length) *length = 0;
    if (log) log[0] = 0;
}
extern "C" void glDeleteShader(GLuint) { ++g_glCalls; }
extern "C" GLuint glCreateProgram() { ++g_glCalls; return ++g_nextTextureId; }
extern "C" void glAttachShader(GLuint, GLuint) { ++g_glCalls; }
extern "C" void glLinkProgram(GLuint) { ++g_glCalls; }
extern "C" void glGetProgramiv(GLuint, GLenum, GLint* params) { ++g_glCalls; if (params) *params = GL_TRUE; }
extern "C" void glGetProgramInfoLog(GLuint, GLsizei, GLsizei* length, GLchar* log) { ++g_glCalls;
    if (length) *length = 0;
    if (log) log[0] = 0;
}
extern "C" void glDeleteProgram(GLuint) { ++g_glCalls; }
extern "C" GLint glGetUniformLocation(GLuint, const GLchar*) { ++g_glCalls; return 0; }
extern "C" void glUniform1i(GLint, GLint) { ++g_glCalls; }
extern "C" void glUniform2i(GLint, GLint, GLint) { ++g_glCalls; }
extern "C" void glUniform1f(GLint, GLfloat) { ++g_glCalls; }
extern "C" void glUniform2f(GLint, GLfloat, GLfloat) { ++g_glCalls; }
extern "C" void glUniform4f(GLint, GLfloat, GLfloat, GLfloat, GLfloat) { ++g_glCalls; }
extern "C" void glUniformMatrix3fv(GLint, GLsizei, GLboolean, const GLfloat*) { ++g_glCalls; }
extern "C" void glUseProgram(GLuint) { ++g_glCalls; }
extern "C" void glDrawArrays(GLenum, GLint, GLsizei) { ++g_glCalls; }
extern "C" void glViewport(GLint, GLint, GLsizei, GLsizei) { ++g_glCalls; }
extern "C" void glFlush() { ++g_glCalls; }
extern "C" GLenum glGetError() { ++g_glCalls; return GL_NO_ERROR; }
extern "C" void glGenFramebuffers(GLsizei n, GLuint* ids) { ++g_glCalls;
    for (GLsizei i = 0; i < n; i++) ids[i] = ++g_nextTextureId;
}
extern "C" void glDeleteFramebuffers(GLsizei n, const GLuint* ids) { ++g_glCalls;
    for (GLsizei i = 0; i < n; i++) g_deletedFbos.push_back(ids[i]);
}
extern "C" void glBindFramebuffer(GLenum, GLuint) { ++g_glCalls; }
extern "C" void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum, GLuint texture,
                                        GLint) {
    ++g_glCalls;
    if (target == GL_READ_FRAMEBUFFER && attachment == GL_COLOR_ATTACHMENT0) {
        g_captureSources.push_back(texture);
    }
}
extern "C" void glFramebufferTextureLayer(GLenum, GLenum, GLuint, GLint, GLint) { ++g_glCalls; ++g_layerBlits; }
extern "C" GLenum glCheckFramebufferStatus(GLenum) { ++g_glCalls; return GL_FRAMEBUFFER_COMPLETE; }
extern "C" void glGenTextures(GLsizei n, GLuint* ids) { ++g_glCalls;
    for (GLsizei i = 0; i < n; i++) ids[i] = ++g_nextTextureId;
}
extern "C" void glDeleteTextures(GLsizei n, const GLuint* ids) { ++g_glCalls;
    for (GLsizei i = 0; i < n; i++) g_deletedTextures.push_back(ids[i]);
}
extern "C" void glBindTexture(GLenum, GLuint) { ++g_glCalls; }
extern "C" void glActiveTexture(GLenum) { ++g_glCalls; }
extern "C" void glTexStorage2D(GLenum, GLsizei, GLenum, GLsizei, GLsizei) { ++g_glCalls; }
extern "C" void glTexSubImage2D(GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum,
                                const void*) { ++g_glCalls; }
extern "C" void glReadPixels(GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, void*) { ++g_glCalls; }
extern "C" GLboolean glIsEnabled(GLenum) { ++g_glCalls; return GL_FALSE; }
extern "C" void glEnable(GLenum) { ++g_glCalls; }
extern "C" void glDisable(GLenum) { ++g_glCalls; }
extern "C" void glColorMask(GLboolean, GLboolean, GLboolean, GLboolean) { ++g_glCalls; }
extern "C" void glGetBooleanv(GLenum, GLboolean*) { ++g_glCalls; }
extern "C" const GLubyte* glGetString(GLenum) { ++g_glCalls;
    return reinterpret_cast<const GLubyte*>("OpenGL ES 3.2 gxr-stub");
}
extern "C" void glGetIntegerv(GLenum, GLint*) { ++g_glCalls; }
extern "C" void glTexParameteri(GLenum, GLenum, GLint) { ++g_glCalls; }
extern "C" void glGetTexLevelParameteriv(GLenum, GLint, GLenum pname, GLint* params) { ++g_glCalls;
    if (params) *params = pname == GL_TEXTURE_INTERNAL_FORMAT ? GL_SRGB8_ALPHA8 : 0;
}
extern "C" void glBlitFramebuffer(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint,
                                  GLbitfield, GLenum) { ++g_glCalls; ++g_blitCalls; }
extern "C" void glGenSamplers(GLsizei n, GLuint* ids) { ++g_glCalls;
    for (GLsizei i = 0; i < n; i++) ids[i] = ++g_nextTextureId;
}
extern "C" void glDeleteSamplers(GLsizei, const GLuint*) { ++g_glCalls; }
extern "C" void glBindSampler(GLuint, GLuint) { ++g_glCalls; }
extern "C" void glSamplerParameteri(GLuint, GLenum, GLint) { ++g_glCalls; }
extern "C" void glGenQueries(GLsizei, GLuint*) { ++g_glCalls; }
extern "C" void glDeleteQueries(GLsizei, const GLuint*) { ++g_glCalls; }
extern "C" void glBeginQuery(GLenum, GLuint) { ++g_glCalls; }
extern "C" void glEndQuery(GLenum) { ++g_glCalls; }
extern "C" void glGetQueryObjectuiv(GLuint, GLenum, GLuint*) { ++g_glCalls; }
extern "C" void glGetQueryiv(GLenum, GLenum, GLint* params) { ++g_glCalls; if (params) *params = 0; }

static void* g_currentCtx = reinterpret_cast<void*>(0xC0DE);
extern "C" EGLContext eglGetCurrentContext() { ++g_contextReads; return g_currentCtx; }

// --- estimator fakes -------------------------------------------------------
struct EstimatorCalls {
    bool initCalled = false;
    int initCalls = 0;
    int metricCalls = 0;
    int initW = 0, initH = 0;
    int alignCalls = 0;
    int generateCalls = 0;
    int extrapolateCalls = 0;
    uint32_t lastPrevTexL = 0, lastCurrTexL = 0;
    uint32_t lastDstL = 0, lastDstR = 0;
    int lastLayerL = -1, lastLayerR = -1;
    uint32_t lastSrcL = 0, lastSrcR = 0;
    float lastScale = 0.0f;
    int lastDstX0 = 0, lastDstY0 = 0, lastDstX1 = 0, lastDstY1 = 0;
    std::vector<std::array<int, 4>> dstOffsets;
    std::vector<int> generateWidths;
    std::vector<std::pair<int, int>> layers;
    bool initResult = true;
    bool generateResult = true;
    bool extrapolateResult = true;
    int destroyCalls = 0;
} g_est;
uint32_t g_estStatus = 0;

extern "C" {
bool SwpInit(const SwpInitInfo* info) {
    g_est.initCalled = true;
    ++g_est.initCalls;
    g_est.initW = static_cast<int>(info->inputWidth);
    g_est.initH = static_cast<int>(info->inputHeight);
    g_estStatus = 1u;
    return g_est.initResult;
}
void SwpDestroy() { g_est.destroyCalls++; g_estStatus = 0; }
bool SwpGenerateVectorsStereo(uint32_t, uint32_t, uint32_t, uint32_t, const float*, const float*,
                              const float*, const float*, uint32_t, uint32_t) {
    return false;
}
bool SwpGenerateVectorsStereoEx(uint32_t prevL, uint32_t currL, uint32_t prevR, uint32_t,
                                const float*, const float*, const float*, const float*, uint32_t,
                                uint32_t, uint32_t width, uint32_t, uint32_t, uint32_t) {
    g_est.generateCalls++;
    g_est.lastPrevTexL = prevL;
    g_est.lastCurrTexL = currL;
    g_est.generateWidths.push_back(static_cast<int>(width));
    g_estStatus = 2u;
    return g_est.generateResult;
}
bool SwpExtrapolateStereo(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, float) {
    return false;
}
bool SwpExtrapolateStereoEx(uint32_t, uint32_t, uint32_t srcL, uint32_t srcR, uint32_t dstL,
                            uint32_t dstR, int layerL, int layerR, int dstX0, int dstY0,
                            int dstX1, int dstY1, float scale, uint32_t,
                            uint32_t) {
    g_est.extrapolateCalls++;
    g_est.lastSrcL = srcL;
    g_est.lastSrcR = srcR;
    g_est.lastDstL = dstL;
    g_est.lastDstR = dstR;
    g_est.lastLayerL = layerL;
    g_est.lastLayerR = layerR;
    g_est.layers.push_back({layerL, layerR});
    g_est.lastScale = scale;
    g_est.lastDstX0 = dstX0;
    g_est.lastDstY0 = dstY0;
    g_est.lastDstX1 = dstX1;
    g_est.lastDstY1 = dstY1;
    g_est.dstOffsets.push_back({dstX0, dstY0, dstX1, dstY1});
    g_estStatus = 4u;
    return g_est.extrapolateResult;
}
bool SwpAlignHistoryStereo(uint32_t, uint32_t, uint32_t, uint32_t, const float*, const float*,
                           const float*, const float*, const float*, const float*, const float*,
                           const float*, uint32_t, uint32_t) {
    g_est.alignCalls++;
    g_estStatus |= 0x40u;
    return true;
}
u32 SwpLastStatus() { return g_estStatus; }
const char* SwpLogTag = "GXRSwarp";
int g_glTableCalls = 0;
bool SwpSetGlTable(const SwpGlTable* table) {
    ++g_glTableCalls;
    return table && table->glCreateShader && table->glGenFramebuffers &&
           table->glUniform4f && table->glUniformMatrix3fv && table->glFramebufferTextureLayer &&
           table->glBlitFramebuffer && table->glBindSampler;
}
void SwpBindIdentityContext(void*) {}
bool SwpResolvedMvSize(u32* w, u32* h) {
    if (w) *w = 512;
    if (h) *h = 512;
    return true;
}
bool g_hooksArmResult = true;
int g_hooksArmCalls = 0;
bool SwpHooksArm() { ++g_hooksArmCalls; return g_hooksArmResult; }
bool SwpHooksArmed() { return true; }
u32 SwpLastStatus();
unsigned long long SwpEstimatorFootprintBytes() { ++g_est.metricCalls; return 0; }
bool SwpGpuTimingAvailable() { ++g_est.metricCalls; return false; }
unsigned long long SwpLastGpuMicros() { ++g_est.metricCalls; return 0; }
}

// --- bridge mock -----------------------------------------------------------
using BridgeFn = bool (*)(void*, uint32_t, void*, uint32_t);
extern "C" {
void SwpVtsTestSetTable(BridgeFn fn);
void SwpVtsTestSetArmed(bool armed);
void SwpVtsTestSetRoot(void* root);
void SwpVtsTestPublish(uint32_t value);
void SwpVtsTestResetAll();
void SwpVtsNoteEndFrame();
void SwpVtsTestSetHalfRateRetired(bool retired);
}
static int g_mockBridgeReads = 0;
static bool g_mockBridgePresent = true;
static uint32_t g_mockBridgeValue = 1;
extern "C" bool BridgeMock(void*, uint32_t, void* out, uint32_t) {
    ++g_mockBridgeReads;
    if (!g_mockBridgePresent) return false;
    if (out) *static_cast<uint32_t*>(out) = g_mockBridgeValue;
    return true;
}

// --- fake next chain -------------------------------------------------------
static const XrSession kSession = reinterpret_cast<XrSession>(0xA11);
static const XrSwapchain kAppSwap = reinterpret_cast<XrSwapchain>(0xBEEF);
static const XrSwapchain kAppSwapFov = reinterpret_cast<XrSwapchain>(0xF0F0);
static const XrSwapchain kAppSwapUnd = reinterpret_cast<XrSwapchain>(0x0D0D);

struct NextCalls {
    int createSession = 0, destroySession = 0, beginFrame = 0, waitFrame = 0, endFrame = 0;
    int createSwapchain = 0, destroySwapchain = 0, enumerate = 0, acquire = 0, wait = 0,
        release = 0;
    uint32_t lastLayerCount = 0;
    const void* lastLayersPtr = nullptr;
    int32_t lastViewOffsetX[2] = {0, 0};
    int32_t lastViewOffsetY[2] = {0, 0};
    int32_t lastViewWidth[2] = {0, 0};
    std::vector<XrSwapchain> destroyedPrivate;
    std::vector<char> destroyOrder;
    bool sessionDestroyed = false;
} g_next;

static std::map<XrSwapchain, XrSwapchainCreateInfo> g_createInfo;
static std::map<XrSwapchain, std::vector<uint32_t>> g_images;
static std::map<XrSwapchain, uint32_t> g_privateBase;
static uint32_t g_nextSwapchainHandle = 0x1000;
static XrSwapchain g_overrideAppHandle = XR_NULL_HANDLE;
static int g_privateImageCount = 3;
static int g_privateCreatesBeforeFailure = -1;
static int g_privateEnumerationsBeforeFailure = -1;
static int g_eglOriginalCalls = 0;
static uint64_t g_fakePred = 100000;
static uint64_t g_fakePeriod = 11111111;
static XrResult g_waitResult = XR_SUCCESS;
static uint32_t g_appAcquireIndex = 0;
static std::map<XrSwapchain, uint32_t> g_privateAcquire;

static XrResult XRAPI_PTR FakeCreateSession(XrInstance, const XrSessionCreateInfo*, XrSession* s) {
    ++g_next.createSession;
    *s = kSession;
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeDestroySession(XrSession) {
    ++g_next.destroySession;
    g_next.sessionDestroyed = true;
    g_next.destroyOrder.push_back('S');
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeBeginFrame(XrSession, const XrFrameBeginInfo*) {
    ++g_next.beginFrame;
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeWaitFrame(XrSession, const XrFrameWaitInfo*, XrFrameState* state) {
    ++g_next.waitFrame;
    state->type = XR_TYPE_FRAME_STATE;
    state->predictedDisplayTime = g_fakePred;
    state->predictedDisplayPeriod = g_fakePeriod;
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeLocateViews(XrSession, const XrViewLocateInfo*, XrViewState*,
                                          uint32_t, uint32_t*, XrView*) {
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeCreateSwapchain(XrSession, const XrSwapchainCreateInfo* info,
                                              XrSwapchain* swapchain) {
    ++g_next.createSwapchain;
    if (g_overrideAppHandle == XR_NULL_HANDLE) {
        if (g_privateCreatesBeforeFailure == 0) return XR_ERROR_VALIDATION_FAILURE;
        if (g_privateCreatesBeforeFailure > 0) --g_privateCreatesBeforeFailure;
    }
    XrSwapchain handle = g_overrideAppHandle;
    if (handle != XR_NULL_HANDLE) {
        g_overrideAppHandle = XR_NULL_HANDLE;
    } else {
        handle = reinterpret_cast<XrSwapchain>(static_cast<uintptr_t>(++g_nextSwapchainHandle));
    }
    g_createInfo[handle] = *info;
    g_images[handle].clear();
    const int count = handle == kAppSwap || handle == kAppSwapFov || handle == kAppSwapUnd
                          ? 3
                          : g_privateImageCount;
    for (int i = 0; i < count; ++i) {
        uint32_t image = 0;
        if (handle == kAppSwap || handle == kAppSwapFov || handle == kAppSwapUnd) {
            image = static_cast<uint32_t>(100 + i);
        } else {
            if (!g_privateBase.count(handle)) {
                g_privateBase[handle] = 2000u + static_cast<uint32_t>(g_privateBase.size()) * 8u;
            }
            image = g_privateBase[handle] + static_cast<uint32_t>(i);
        }
        g_images[handle].push_back(image);
    }
    *swapchain = handle;
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeDestroySwapchain(XrSwapchain swapchain) {
    ++g_next.destroySwapchain;
    if (swapchain != kAppSwap && swapchain != kAppSwapFov && swapchain != kAppSwapUnd) {
        g_next.destroyedPrivate.push_back(swapchain);
        g_next.destroyOrder.push_back('P');
    }
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeEnumerate(XrSwapchain swapchain, uint32_t, uint32_t* countOutput,
                                        XrSwapchainImageBaseHeader* images) {
    ++g_next.enumerate;
    if (g_privateBase.count(swapchain)) {
        if (g_privateEnumerationsBeforeFailure == 0) return XR_ERROR_VALIDATION_FAILURE;
        if (g_privateEnumerationsBeforeFailure > 0) --g_privateEnumerationsBeforeFailure;
    }
    struct SwapchainImageGles {
        XrStructureType type;
        const void* next;
        uint32_t image;
        uint32_t pad;
    };
    const auto it = g_images.find(swapchain);
    if (it == g_images.end()) return XR_ERROR_VALIDATION_FAILURE;
    *countOutput = static_cast<uint32_t>(it->second.size());
    if (!images) return XR_SUCCESS;
    auto* out = reinterpret_cast<SwapchainImageGles*>(images);
    for (size_t i = 0; i < it->second.size(); ++i) {
        if (out[i].type != XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR || out[i].next != nullptr) {
            return XR_ERROR_VALIDATION_FAILURE;
        }
    }
    for (size_t i = 0; i < it->second.size(); ++i) {
        out[i].image = it->second[i];
        out[i].pad = 0;
    }
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeAcquire(XrSwapchain swapchain, const XrSwapchainImageAcquireInfo*,
                                      uint32_t* index) {
    ++g_next.acquire;
    if (swapchain == kAppSwap || swapchain == kAppSwapFov || swapchain == kAppSwapUnd) {
        *index = g_appAcquireIndex;
    } else {
        uint32_t& v = g_privateAcquire[swapchain];
        *index = v;
        v = (v + 1) % static_cast<uint32_t>(g_images[swapchain].size());
    }
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeWaitImage(XrSwapchain, const XrSwapchainImageWaitInfo*) {
    ++g_next.wait;
    return g_waitResult;
}
static XrResult XRAPI_PTR FakeReleaseImage(XrSwapchain, const XrSwapchainImageReleaseInfo*) {
    ++g_next.release;
    return XR_SUCCESS;
}
static XrResult XRAPI_PTR FakeEndFrame(XrSession, const XrFrameEndInfo* info) {
    ++g_next.endFrame;
    if (info) {
        g_next.lastLayerCount = info->layerCount;
        g_next.lastLayersPtr = info->layers;
        for (uint32_t i = 0; i < info->layerCount; ++i) {
            const auto* layer = info->layers[i];
            if (!layer || layer->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION) continue;
            const auto* projection =
                reinterpret_cast<const XrCompositionLayerProjection*>(layer);
            for (uint32_t e = 0; e < projection->viewCount && e < 2; ++e) {
                g_next.lastViewOffsetX[e] = projection->views[e].subImage.imageRect.offset.x;
                g_next.lastViewOffsetY[e] = projection->views[e].subImage.imageRect.offset.y;
                g_next.lastViewWidth[e] = projection->views[e].subImage.imageRect.extent.width;
            }
            break;
        }
    }
    return XR_SUCCESS;
}
static XrResult StubGipa(XrInstance, const char*, PFN_xrVoidFunction* fn) {
    *fn = nullptr;
    return XR_ERROR_FUNCTION_UNSUPPORTED;
}
static bool InstallNext() {
    return SwpDispatchSetNext(&StubGipa, &FakeCreateSession, &FakeDestroySession, &FakeBeginFrame,
                              &FakeWaitFrame, &FakeLocateViews, &FakeEndFrame,
                              &FakeCreateSwapchain, &FakeDestroySwapchain, &FakeEnumerate,
                              &FakeAcquire, &FakeWaitImage, &FakeReleaseImage);
}

// --- harness ---------------------------------------------------------------
static XrSessionCreateInfo GlesSessionInfo() {
    struct Binding {
        XrStructureType type;
        const void* next;
        void* display;
        void* config;
        void* context;
    };
    static Binding binding{};
    binding.type = XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR;
    XrSessionCreateInfo info{};
    info.type = XR_TYPE_SESSION_CREATE_INFO;
    info.next = &binding;
    return info;
}

static XrSwapchainCreateInfo SwapInfo(uint32_t w, uint32_t h, uint32_t arraySize = 1) {
    XrSwapchainCreateInfo info{};
    info.type = XR_TYPE_SWAPCHAIN_CREATE_INFO;
    info.width = w;
    info.height = h;
    info.format = GL_SRGB8_ALPHA8;
    info.arraySize = arraySize;
    info.mipCount = 1;
    info.faceCount = 1;
    info.sampleCount = 1;
    info.usageFlags = XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT |
                      XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
    return info;
}

static void MakeSession() {
    XrSessionCreateInfo info = GlesSessionInfo();
    XrSession session = nullptr;
    CHECK(XR_SUCCEEDED(SwpDispatchCreateSession((XrInstance)0x1, &info, &session)) &&
              session == kSession,
          "session create forwards");
    SwpVtsTestPublish(g_mockBridgeValue);
}

static void CreateAppSwapchain(XrSwapchain handle, uint32_t w, uint32_t h, uint32_t arraySize = 1) {
    // The fake returns its own handle; force the known app handle by mapping it
    // after creation (the layer records create info by the returned handle).
    XrSwapchainCreateInfo info = SwapInfo(w, h, arraySize);
    g_overrideAppHandle = handle;
    XrSwapchain created = XR_NULL_HANDLE;
    CHECK(XR_SUCCEEDED(SwpDispatchCreateSwapchain(kSession, &info, &created)) &&
              created == handle,
          "app swapchain create forwards with the expected handle");
    g_images[handle].clear();
    for (int i = 0; i < 3; ++i) {
        g_images[handle].push_back(handle == kAppSwapFov ? 200u + i
                                     : handle == kAppSwapUnd ? 300u + i
                                                             : 100u + i);
    }
    uint32_t count = 0;
    std::vector<uint32_t> dummy(3);
    struct SwapchainImageGles {
        XrStructureType type;
        const void* next;
        uint32_t image;
        uint32_t pad;
    };
    SwapchainImageGles images[3]{};
    for (int i = 0; i < 3; ++i) {
        images[i].type = XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR;
        images[i].image = g_images[handle][i];
    }
    CHECK(XR_SUCCEEDED(SwpDispatchEnumerateSwapchainImages(
              handle, 3, &count, reinterpret_cast<XrSwapchainImageBaseHeader*>(images))),
          "app swapchain enumeration forwards");
}

struct Layers {
    XrCompositionLayerProjection proj[3]{};
    XrCompositionLayerProjectionView views[3][2]{};
    const XrCompositionLayerBaseHeader* list[3] = {nullptr, nullptr, nullptr};
    XrFrameEndInfo info{};
    XrSwapchain swaps[3] = {kAppSwap, kAppSwapFov, kAppSwapUnd};
    uint32_t arrayIndex[3][2] = {{0, 0}, {0, 0}, {0, 0}};
    int w[3] = {2048, 2048, 2048};
    int h[3] = {2048, 2048, 2048};
    int count = 2;
};

static void BuildLayers(Layers& l, bool three = false) {
    l.count = three ? 3 : 2;
    const int first = three ? 1 : 0;
    for (int i = 0; i < l.count; ++i) {
        l.proj[i].type = XR_TYPE_COMPOSITION_LAYER_PROJECTION;
        l.proj[i].viewCount = 2;
        l.proj[i].views = l.views[i];
        l.list[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&l.proj[i]);
        for (int e = 0; e < 2; ++e) {
            auto& v = l.views[i][e];
            v.type = XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW;
            v.subImage.swapchain = l.swaps[first + i];
            v.subImage.imageArrayIndex = l.arrayIndex[i][e];
            v.subImage.imageRect.offset.x = 0;
            v.subImage.imageRect.offset.y = 0;
            v.subImage.imageRect.extent.width = l.w[i];
            v.subImage.imageRect.extent.height = l.h[i];
            v.pose.orientation.w = 1.0f;
            v.pose.position.x = static_cast<float>(e) * 0.03f;
            v.fov.angleLeft = -1.2f;
            v.fov.angleRight = 1.2f;
            v.fov.angleUp = 1.0f;
            v.fov.angleDown = -1.0f;
        }
    }
    l.info.type = XR_TYPE_FRAME_END_INFO;
    l.info.displayTime = g_fakePred;
    l.info.layerCount = static_cast<uint32_t>(l.count);
    l.info.layers = l.list;
}

static void WaitSlot(uint64_t pred, uint64_t period = 11111111) {
    g_fakePred = pred;
    g_fakePeriod = period;
    XrFrameState state{};
    CHECK(XR_SUCCEEDED(SwpDispatchWaitFrame(kSession, nullptr, &state)), "wait frame forwards");
}

static void AcquireSources(Layers& l, uint32_t index) {
    g_appAcquireIndex = index;
    const int first = l.count == 3 ? 1 : 0;
    for (int i = 0; i < l.count; ++i) {
        if (i == 0 && l.count == 3) {
            uint32_t idx = 0;
            SwpDispatchAcquireSwapchainImage(kAppSwapUnd, nullptr, &idx);
            SwpDispatchWaitSwapchainImage(kAppSwapUnd, nullptr);
            continue;
        }
        uint32_t idx = 0;
        CHECK(XR_SUCCEEDED(SwpDispatchAcquireSwapchainImage(l.swaps[first + i], nullptr, &idx)),
              "source acquire");
        CHECK(XR_SUCCEEDED(SwpDispatchWaitSwapchainImage(l.swaps[first + i], nullptr)),
              "source wait");
    }
}

static void ReleaseSources(Layers& l) {
    const int first = l.count == 3 ? 1 : 0;
    for (int i = 0; i < l.count; ++i) {
        if (i == 0 && l.count == 3) {
            SwpDispatchReleaseSwapchainImage(kAppSwapUnd, nullptr);
            continue;
        }
        CHECK(XR_SUCCEEDED(SwpDispatchReleaseSwapchainImage(l.swaps[first + i], nullptr)),
              "source release");
    }
}

static void EndTick(Layers& l) {
    l.info.displayTime = g_fakePred;
    CHECK(XR_SUCCEEDED(SwpDispatchEndFrame(kSession, &l.info)), "end frame forwards");
}

static void FullTick(uint64_t pred, Layers& l, uint32_t acquireIndex, bool release = true,
                     uint64_t period = 11111111) {
    WaitSlot(pred, period);
    AcquireSources(l, acquireIndex);
    if (release) ReleaseSources(l);
    EndTick(l);
}

static DispatchState* State() {
    auto it = g_sessions.find(kSession);
    return it == g_sessions.end() ? nullptr : &it->second;
}

static void ResetAll() {
    g_logLines.clear();
    g_next = NextCalls{};
    g_est = EstimatorCalls{};
    g_estStatus = 0;
    g_nextTextureId = 500;
    g_sessions.clear();
    g_synthOwners.store(0);
    g_armState.store(0);
    g_armRetryEndframes.store(0);
    g_hooksArmResult = true;
    g_hooksArmCalls = 0;
    g_dormantCleanupPending.store(false);
    g_glCalls = 0;
    g_contextReads = 0;
    g_privateCreatesBeforeFailure = -1;
    g_privateEnumerationsBeforeFailure = -1;
    g_eglOriginalCalls = 0;
    g_deferred = DeferredReclaim{};
    g_deferredPending.store(false);
    g_leakedTextures.store(0);
    g_leakedFbos.store(0);
    g_deletedTextures.clear();
    g_deletedFbos.clear();
    g_blitCalls = 0;
    g_captureSources.clear();
    g_layerBlits = 0;
    g_glTableSet = false;
    g_glTableCalls = 0;
    g_mockBridgeReads = 0;
    g_mockBridgePresent = true;
    g_mockBridgeValue = 1;
    g_privateImageCount = 3;
    g_privateAcquire.clear();
    g_createInfo.clear();
    g_images.clear();
    g_privateBase.clear();
    g_nextSwapchainHandle = 0x1000;
    g_overrideAppHandle = XR_NULL_HANDLE;
    g_waitResult = XR_SUCCESS;
    g_appAcquireIndex = 0;
    g_fakePred = 100000;
    g_fakePeriod = 11111111;
    g_currentCtx = reinterpret_cast<void*>(0xC0DE);
    SwpVtsTestResetAll();
    SwpVtsTestSetArmed(true);
    SwpVtsTestSetRoot(reinterpret_cast<void*>(0x5A1E));
    SwpVtsTestSetTable(&BridgeMock);
    SwpVtsTestPublish(g_mockBridgeValue);
    SwpEglResetArrivals();
    SwpEglTestSetNowNs(0);
    SwpEglTestResetClockReads();
    SwpSetEnabled(true);
}

static void CheckPureHelpers() {
    float mat[16];
    const float p[3] = {0, 0, 0};
    const float q[4] = {1, 0, 0, 0};
    SwpPoseToViewMatrix(p, q, mat);
    CHECK(mat[0] == 1 && mat[5] == 1 && mat[10] == 1 && mat[15] == 1,
          "pose matrix identity");
    const float half = 0.70710678f;
    const float yaw[4] = {half, 0.0f, half, 0.0f};  // +90 degrees about Y
    SwpPoseToViewMatrix(p, yaw, mat);
    CHECK(std::fabs(mat[2] - 1.0f) < 1e-5f && std::fabs(mat[8] + 1.0f) < 1e-5f,
          "pose matrix uses the inverse (world->camera) rotation, not +90 as -90");
    float scale = 0;
    CHECK(SwpScaleFactorForMissedTick(3000, 1000, 2000, &scale) && scale == 2.0f,
          "nominal one-slot scale is 2.0");
    CHECK(!SwpScaleFactorForMissedTick(1000, 1000, 2000, &scale),
          "pred before newest refuses");
    CHECK(SwpClassifyTick(5, 5, true, false) == TickKind::Missed, "unchanged epoch is missed");
}

static void CheckLateFlow() {
    ResetAll();
    CHECK(InstallNext(), "next chain installs");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 2048, 2048);
    CreateAppSwapchain(kAppSwapFov, 2048, 2048);
    Layers l;
    l.views[0][0].pose.orientation.w = 0.70710678f;
    l.views[0][0].pose.orientation.y = 0.70710678f;
    l.views[0][0].pose.position.z = 0.25f;
    BuildLayers(l);
    // BuildLayers rewrites the views; apply the nonidentity B pose afterwards.
    l.views[0][0].pose.orientation.w = 0.70710678f;
    l.views[0][0].pose.orientation.y = 0.70710678f;
    l.views[0][0].pose.position.z = 0.25f;
    SwpEglTestSetNowNs(1000);
    SwpEglArrivalObserved((void*)10, g_currentCtx, nullptr, 1100);
    FullTick(100000, l, 1);
    CHECK(g_est.initCalled && g_est.initW == 2048, "estimator init from the selected rect");
    CHECK(g_next.endFrame == 1, "first endframe forwards");

    SwpEglTestSetNowNs(2000);
    SwpEglArrivalObserved((void*)11, g_currentCtx, nullptr, 2100);
    FullTick(111111, l, 2);
    CHECK(g_blitCalls >= 4, "capture copies both components/eyes into history");
    CHECK(g_next.createSwapchain >= 4, "private swapchains are created for both components");

    SwpEglTestSetNowNs(3000);
    SwpEglArrivalObserved((void*)12, g_currentCtx, nullptr, 3100);
    FullTick(122222, l, 0);
    CHECK(g_est.alignCalls == 2, "A is rotation-aligned into B for both components");
    CHECK(g_est.generateCalls == 2, "one estimation per distinct source pair");
    DispatchState* s = State();
    CHECK(s && s->warmed, "late mode warms after two distinct composites");
    if (s && s->historyNewest >= 0) {
        const XrPosef stored = s->history[s->historyNewest].pose[0][0];
        CHECK(std::fabs(stored.orientation.w - 0.70710678f) < 1e-5f &&
                  std::fabs(stored.orientation.y - 0.70710678f) < 1e-5f &&
                  std::fabs(stored.position.z - 0.25f) < 1e-5f,
              "history stores B's original pose without a sign inversion");
    } else {
        CHECK(false, "history stores B's original pose without a sign inversion");
    }

    // No release/arrival: a missed tick synthesizes into private outputs.
    SwpEglTestSetNowNs(4000);
    WaitSlot(133333);
    AcquireSources(l, 1);
    EndTick(l);
    CHECK(g_est.extrapolateCalls == 2, "missed tick warps both components (one call per component/eye pair)");
    CHECK(g_est.lastDstL >= 2000 && g_est.lastDstR >= 2000,
          "synthetic output targets layer-owned private images");
    CHECK(g_next.endFrame == 4, "synthetic endframe forwards once");
    const void* stock = nullptr;
    CHECK(g_next.lastLayersPtr != nullptr && g_next.lastLayerCount == 2,
          "substituted layer list is forwarded");
    (void)stock;

    // Three consecutive missed ticks: the cap falls back to stock.
    const int before = g_est.extrapolateCalls;
    for (int i = 0; i < 3; ++i) {
        WaitSlot(144444 + static_cast<uint64_t>(i) * 11111);
        AcquireSources(l, 2);
        EndTick(l);
    }
    CHECK(g_est.extrapolateCalls <= before + 8, "consecutive missed ticks are capped");
}

static void CheckHalfRateScheduler() {
    ResetAll();
    g_mockBridgeValue = 2;
    SwpVtsTestPublish(2);
    CHECK(InstallNext(), "next chain installs (half rate)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 2048, 2048);
    CreateAppSwapchain(kAppSwapFov, 2048, 2048);
    Layers l;
    BuildLayers(l);

    uint64_t pred = 1000000;
    SwpEglTestSetNowNs(1000);
    for (int slot = 0; slot < 90; ++slot) {
        SwpEglArrivalObserved(reinterpret_cast<void*>(static_cast<uintptr_t>(100 + slot)),
                              g_currentCtx, nullptr, 1000 + static_cast<uint64_t>(slot) * 1000);
        pred += 11111111;
        FullTick(pred, l, static_cast<uint32_t>(slot % 3));
    }
    DispatchState* s = State();
    CHECK(s != nullptr, "half-rate session state exists");
    if (!s) return;
    CHECK(s->selectedFrames >= 40, "half rate selects about 45 real slots/s");
    CHECK(s->synthesizedFrames >= 40, "half rate synthesizes about 45 slots/s");
    CHECK(s->discardedFrames >= s->synthesizedFrames, "fresh frames in synthetic slots are discarded");
    CHECK(s->historyCount == kHistorySets, "A/B ring retains three distinct composites");
    CHECK(g_est.lastDstL >= 2000, "synthetic output never targets a stock app image");
    CHECK(s->fallbackFrames == 0, "warm half-rate run has no fallback");
    CHECK(g_est.generateCalls <= static_cast<int>(s->selectedFrames) * 2,
          "one estimation per selected-real pair, not per slot");

    // Duplicate predicted time does not advance the phase.
    const int phase = s->schedPhase;
    g_fakePred = pred;
    XrFrameState dup{};
    SwpDispatchWaitFrame(kSession, nullptr, &dup);
    CHECK(s->schedPhase == phase, "duplicate predicted time preserves the phase");

    // A skipped display slot advances parity by the elapsed periods (three
    // periods toggles once relative to one).
    g_fakePred = pred + 3 * g_fakePeriod;
    XrFrameState skipped{};
    SwpDispatchWaitFrame(kSession, nullptr, &skipped);
    CHECK(s->schedPhase == (phase ^ 1), "skipped display slots advance the phase");
    pred = g_fakePred;

    // A failed synthetic tick submits the original composite and leaves the
    // next slot as selected-real (the phase already advanced at wait).
    bool sawFailure = false;
    for (int i = 0; i < 8 && !sawFailure; ++i) {
        pred += 11111111;
        WaitSlot(pred);
        if (s->schedPhase == 1 && s->warmed) {
            g_est.extrapolateResult = false;
            AcquireSources(l, 0);
            ReleaseSources(l);
            EndTick(l);
            CHECK(g_est.lastDstL >= 2000, "failure still attempted the private output");
            CHECK(s->fallbackFrames > 0, "synthetic failure records a fallback");
            sawFailure = true;
        } else {
            AcquireSources(l, 1);
            ReleaseSources(l);
            EndTick(l);
        }
    }
    CHECK(sawFailure, "a synthetic slot was exercised for failure");
    g_est.extrapolateResult = true;

    // Teardown: private swapchains are destroyed before the parent session and
    // all owned GL names are released on their creating context.
    const size_t privateCount = s->privateSwapchains.size();
    CHECK(privateCount >= 2, "both components own private swapchains");
    CHECK(XR_SUCCEEDED(SwpDispatchDestroySession(kSession)), "destroy session forwards");
    CHECK(g_next.destroySwapchain >= static_cast<int>(privateCount),
          "private swapchains destroyed");
    bool privateBeforeSession = true;
    bool sawSession = false;
    for (char c : g_next.destroyOrder) {
        if (c == 'S') sawSession = true;
        else if (sawSession) privateBeforeSession = false;
    }
    CHECK(sawSession && privateBeforeSession,
          "private swapchains are destroyed before the parent session");
    CHECK(g_next.destroySession == 1, "parent session destroyed once");
    CHECK(g_synthOwners.load() == 0, "teardown releases the owner count");
    CHECK(g_leakedTextures.load() == 0 && g_leakedFbos.load() == 0, "teardown leaks nothing");
}

static void CheckHalfRate72() {
    ResetAll();
    g_mockBridgeValue = 2;
    SwpVtsTestPublish(2);
    CHECK(InstallNext(), "next chain installs (72 Hz)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 1832, 1920);
    CreateAppSwapchain(kAppSwapFov, 1832, 1920);
    Layers l;
    l.w[0] = l.w[1] = 1832;
    l.h[0] = l.h[1] = 1920;
    BuildLayers(l);

    constexpr uint64_t kPeriod72 = 13888889ull;
    uint64_t pred = 1000000;
    SwpEglTestSetNowNs(1000);
    for (int slot = 0; slot < 72; ++slot) {
        SwpEglArrivalObserved(reinterpret_cast<void*>(static_cast<uintptr_t>(500 + slot)),
                              g_currentCtx, nullptr, 1000 + static_cast<uint64_t>(slot) * 1000);
        pred += kPeriod72;
        FullTick(pred, l, static_cast<uint32_t>(slot % 3), true, kPeriod72);
    }
    DispatchState* s = State();
    CHECK(s != nullptr, "72 Hz session state exists");
    if (!s) return;
    CHECK(s->selectedFrames >= 32, "72 Hz half rate selects about 36 real slots/s");
    CHECK(s->synthesizedFrames >= 32, "72 Hz half rate synthesizes about 36 slots/s");
    CHECK(g_est.lastDstL >= 2000, "72 Hz synthetic output is a private image");
    CHECK(s->fallbackFrames == 0, "72 Hz warm run has no fallback");
}

static void CheckOddAndArrayLayout() {    ResetAll();
    g_mockBridgeValue = 2;
    SwpVtsTestPublish(2);
    CHECK(InstallNext(), "next chain installs (odd/array)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 2204, 2352, 2);
    CreateAppSwapchain(kAppSwapFov, 1024, 1024);
    Layers l;
    l.w[0] = 2204;
    l.h[0] = 2352;
    l.w[1] = 1024;
    l.h[1] = 1024;
    l.arrayIndex[0][0] = 0;
    l.arrayIndex[0][1] = 1;
    BuildLayers(l);

    uint64_t pred = 1000000;
    for (int i = 0; i < 6; ++i) {
        pred += 11111111;
        SwpEglArrivalObserved(reinterpret_cast<void*>(static_cast<uintptr_t>(200 + i)),
                              g_currentCtx, nullptr, 1000 + i * 1000);
        FullTick(pred, l, static_cast<uint32_t>(i % 3));
    }
    CHECK(g_est.initW == 2352 && g_est.initH == 2352,
          "estimator allocates a square maximum pyramid covering every component geometry");
    bool sawDifferent = false;
    for (int width : g_est.generateWidths) {
        if (width == 1024) sawDifferent = true;
    }
    CHECK(sawDifferent, "per-component geometry reaches the estimator independently");
    CHECK(g_est.lastDstL >= 2000, "array layout renders into a private image");
    bool sawLayerOne = false;
    for (const auto& entry : g_est.layers) {
        if (entry.first == 1 || entry.second == 1) sawLayerOne = true;
    }
    CHECK(sawLayerOne, "array layer index is forwarded to the output render");
    CHECK(g_layerBlits > 0, "array-layer capture uses a layer attachment");
}

static void CheckPackedStereoOffsets() {
    ResetAll();
    g_mockBridgeValue = 2;
    SwpVtsTestPublish(2);
    CHECK(InstallNext(), "next chain installs (packed stereo)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 4096, 1024);
    CreateAppSwapchain(kAppSwapFov, 2048, 1024);
    Layers l;
    l.w[0] = 2048;
    l.h[0] = 1024;
    l.w[1] = 2048;
    l.h[1] = 1024;
    BuildLayers(l);
    // Packed left/right in one non-array source texture.
    l.views[0][1].subImage.imageRect.offset.x = 2048;
    uint64_t pred = 1000000;
    for (int i = 0; i < 8; ++i) {
        pred += 11111111;
        SwpEglArrivalObserved(reinterpret_cast<void*>(static_cast<uintptr_t>(800 + i)),
                              g_currentCtx, nullptr, 1000 + i * 1000);
        FullTick(pred, l, static_cast<uint32_t>(i % 3));
    }
    bool packedOffsetRendered = false;
    for (const auto& off : g_est.dstOffsets) {
        if (off[0] == 0 && off[2] == 2048) packedOffsetRendered = true;
    }
    CHECK(packedOffsetRendered,
          "packed 2D stereo renders each eye at its own destination rect offset");
    DispatchState* s = State();
    CHECK(s && s->synthesizedFrames > 0, "packed stereo reached a synthetic slot");
    if (s) {
        CHECK(s->privateSwapchains.size() == 2,
              "packed left/right share one private output while the other component keeps its own");
    }
}

static void CheckPrivateImageCounts() {
    for (int count : {2, 3, 4}) {
        ResetAll();
        g_privateImageCount = count;
        CHECK(InstallNext(), "next chain installs (image count)");
        MakeSession();
        CreateAppSwapchain(kAppSwap, 1024, 1024);
        CreateAppSwapchain(kAppSwapFov, 1024, 1024);
        Layers l;
        BuildLayers(l);
        uint64_t pred = 1000000;
        for (int i = 0; i < 3; ++i) {
            pred += 11111111;
            SwpEglArrivalObserved(reinterpret_cast<void*>(static_cast<uintptr_t>(700 + i)),
                                  g_currentCtx, nullptr, 1000 + i * 1000);
            FullTick(pred, l, static_cast<uint32_t>(i % count));
        }
        DispatchState* s = State();
        CHECK(s != nullptr, "image-count session state exists");
        if (s) {
            bool sizesMatch = !s->privateSwapchains.empty();
            for (const auto& entry : s->privateSwapchains) {
                if (entry.second.textures.size() != static_cast<size_t>(count)) sizesMatch = false;
            }
            CHECK(sizesMatch, "actual runtime image count is tracked, not assumed");
        }
        CHECK(XR_SUCCEEDED(SwpDispatchDestroySession(kSession)), "image-count teardown forwards");
        CHECK(g_synthOwners.load() == 0, "image-count teardown releases owned resources");
    }
}

static void CheckPartialCapturePoisoning() {
    ResetAll();
    CHECK(InstallNext(), "next chain installs (partial capture)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 1024, 1024);
    CreateAppSwapchain(kAppSwapFov, 1024, 1024);
    Layers l;
    BuildLayers(l);
    SwpEglTestSetNowNs(1000);
    SwpEglArrivalObserved((void*)10, g_currentCtx, nullptr, 1100);
    FullTick(100000, l, 1);
    SwpEglTestSetNowNs(2000);
    SwpEglArrivalObserved((void*)11, g_currentCtx, nullptr, 2100);
    FullTick(111111, l, 2);
    DispatchState* s = State();
    CHECK(s && s->historyCount == 1, "partial-capture baseline has one complete composite");
    if (!s) return;
    const int writeSet = (s->historyNewest + 1) % kHistorySets;
    s->history[writeSet].tex[1][1] = 0;  // simulate one component never reaching history
    const uint64_t selectedBefore = s->selectedFrames;
    const uint64_t fallbackBefore = s->fallbackFrames;
    SwpEglTestSetNowNs(3000);
    SwpEglArrivalObserved((void*)12, g_currentCtx, nullptr, 3100);
    FullTick(122222, l, 0);
    CHECK(s->selectedFrames == selectedBefore,
          "an incomplete stereo capture never becomes a selected composite");
    CHECK(s->historyCount == 1, "the previous complete composite remains the only history");
    CHECK(s->fallbackFrames > fallbackBefore, "the partial capture records a fallback");
    CHECK(!s->captureValid, "a poisoned capture cannot look complete");
    CHECK(XR_SUCCEEDED(SwpDispatchDestroySession(kSession)), "partial-capture teardown forwards");
}

static void CheckHostileGLStateAndTimeout() {
    ResetAll();
    g_mockBridgeValue = 2;
    SwpVtsTestPublish(2);
    CHECK(InstallNext(), "next chain installs (timeout)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 2048, 2048);
    CreateAppSwapchain(kAppSwapFov, 2048, 2048);
    Layers l;
    BuildLayers(l);
    uint64_t pred = 1000000;
    for (int i = 0; i < 4; ++i) {
        pred += 11111111;
        SwpEglArrivalObserved(reinterpret_cast<void*>(static_cast<uintptr_t>(300 + i)),
                              g_currentCtx, nullptr, 1000 + i * 1000);
        FullTick(pred, l, static_cast<uint32_t>(i % 3));
    }
    // Reach a synthetic slot, then make the private wait time out. The layer
    // must NOT release an image whose wait has not succeeded. It retains the
    // bounded acquisition and drains it on a later tick.
    DispatchState* s = State();
    bool syntheticPending = false;
    for (int i = 0; i < 10 && s && !syntheticPending; ++i) {
        pred += 11111111;
        WaitSlot(pred);
        if (s->schedPhase == 1 && s->warmed) {
            syntheticPending = true;
            break;
        }
        AcquireSources(l, static_cast<uint32_t>(i % 3));
        ReleaseSources(l);
        EndTick(l);
    }
    CHECK(syntheticPending, "a synthetic slot was reached for timeout injection");
    if (!syntheticPending) return;
    g_waitResult = XR_SUCCESS;
    AcquireSources(l, 0);
    ReleaseSources(l);
    const int releasesBefore = g_next.release;
    g_waitResult = XR_TIMEOUT_EXPIRED;
    EndTick(l);
    CHECK(g_next.endFrame >= 5, "timeout endframe forwards exactly once");
    CHECK(g_next.release == releasesBefore,
          "a timed-out private acquisition is not released before a successful wait");
    CHECK(s && s->pendingOutputCount == 1, "the timed-out acquisition stays bounded and pending");
    g_waitResult = XR_SUCCESS;
    pred += 11111111;
    WaitSlot(pred);
    AcquireSources(l, 1);
    ReleaseSources(l);
    EndTick(l);
    CHECK(s && s->pendingOutputCount == 0, "the pending acquisition is drained on a later tick");
    CHECK(g_next.release > releasesBefore, "the drained acquisition is released after its wait");
}

static void* FakeEglCreate(void*, void*, unsigned, void* buffer, const int*) {
    ++g_eglOriginalCalls;
    return buffer;
}

static void CheckDormantLazyArmCadence() {
    ResetAll();
    g_hooksArmResult = false;
    g_mockBridgeValue = 0;
    CHECK(InstallNext(), "next chain installs (dormant lazy arm)");
    MakeSession();
    CHECK(g_hooksArmCalls == 1 && g_armState.load() == 0,
          "session creation attempts immediate hook discovery once");
    for (int i = 0; i < 59; ++i) {
        SwpDispatchBeginFrame(kSession, nullptr);
        SwpDispatchEndFrame(kSession, nullptr);
    }
    CHECK(g_hooksArmCalls == 1 && g_mockBridgeReads == 0,
          "dormant BeginFrame and the first 59 EndFrames perform no discovery retry");
    g_hooksArmResult = true;  // scene library becomes available after creation
    SwpDispatchEndFrame(kSession, nullptr);
    CHECK(g_hooksArmCalls == 2 && g_armState.load() == 1 && g_mockBridgeReads == 1,
          "lazy discovery retries at frame 60 before the independent control poll");
    for (int i = 0; i < 120; ++i) {
        SwpDispatchBeginFrame(kSession, nullptr);
        SwpDispatchEndFrame(kSession, nullptr);
    }
    CHECK(g_hooksArmCalls == 2 && g_mockBridgeReads == 3,
          "successful lazy arming stops discovery while control polling continues");
}

static void CheckDormantFailureCleanup() {
    // Both failures occur after the estimator is live, before any counted GL
    // history exists. Enumeration fails on the second private output so the
    // first fully owned private swapchain must also be torn down by Off.
    for (bool enumerateFailure : {false, true}) {
        ResetAll();
        CHECK(InstallNext(), "next chain installs (partial initialization Off)");
        MakeSession();
        CreateAppSwapchain(kAppSwap, 1024, 1024);
        CreateAppSwapchain(kAppSwapFov, 1024, 1024);
        Layers l;
        BuildLayers(l);
        if (enumerateFailure) g_privateEnumerationsBeforeFailure = 2;
        else g_privateCreatesBeforeFailure = 0;
        FullTick(100000, l, 0);
        DispatchState* state = State();
        CHECK(state && state->estimatorInited && g_synthOwners.load() == 0,
              "partial initialization owns an estimator without counted history textures");
        CHECK(g_dormantCleanupPending.load(), "partial initialization marks dormant cleanup");
        if (!state) return;
        const size_t ownedPrivate = state->privateSwapchains.size();
        CHECK(ownedPrivate == (enumerateFailure ? 1u : 0u),
              "failure fixture reaches the intended private ownership boundary");
        const int destroyed = g_next.destroySwapchain;
        const int estimatorDestroyed = g_est.destroyCalls;
        g_mockBridgeValue = 0;
        SwpVtsTestPublish(0);
        // A foreign context cannot destroy the estimator; retain the dirty
        // marker until the creating context returns.
        void* owner = g_currentCtx;
        g_currentCtx = reinterpret_cast<void*>(0xBAD);
        EndTick(l);
        CHECK(state->estimatorInited && g_est.destroyCalls == estimatorDestroyed &&
                  g_dormantCleanupPending.load(),
              "Off retains estimator cleanup until its owner context returns");
        g_currentCtx = owner;
        EndTick(l);
        CHECK(!state->estimatorInited && !state->estimatorNeedsDestroy &&
                  g_est.destroyCalls == estimatorDestroyed + 1,
              "Off destroys the partial estimator on its owner context exactly once");
        CHECK(state->privateSwapchains.empty() &&
                  g_next.destroySwapchain == destroyed + static_cast<int>(ownedPrivate),
              "Off destroys every successfully owned private output after partial failure");
        CHECK(!g_dormantCleanupPending.load() && !state->dormantCleanupPending,
              "partial initialization cleanup settles the dormant fast path");
        CHECK(!state->haveLayout && state->pairCount == 0 && !state->schedInit,
              "Off clears layout, scheduler and clock history");
        g_privateCreatesBeforeFailure = -1;
        g_privateEnumerationsBeforeFailure = -1;
        SwpVtsTestPublish(1);
        g_mockBridgeValue = 1;
        FullTick(200000, l, 1);
        CHECK(state->resourcesReady && state->estimatorInited &&
                  state->privateSwapchains.size() == 2 && g_synthOwners.load() == 1,
              "hot enable retries partial initialization using retained app descriptors");
        // The admission EndFrame invalidates the previous scheduler as part of
        // rebuilding the layout. The next WaitFrame establishes its fresh
        // epoch; verify real capture/estimation recovery over the next pair.
        const int blitsBefore = g_blitCalls;
        const int vectorsBefore = g_est.generateCalls;
        for (int i = 0; i < 2; ++i) {
            SwpEglArrivalObserved(reinterpret_cast<void*>(uintptr_t(100 + i)),
                                  g_currentCtx, nullptr, 1000 + i * 1000);
            FullTick(211111 + i * 11111, l, (i + 2) % 3);
        }
        CHECK(state->schedInit && state->historyCount >= 2 && state->warmed &&
                  g_blitCalls >= blitsBefore + 8 && g_est.generateCalls > vectorsBefore,
              "hot enable rearms scheduling and resumes stereo capture plus estimation");
    }
}

static void CheckSettledOffAndHotEnable() {
    ResetAll();
    CHECK(InstallNext(), "next chain installs (settled Off)");
    MakeSession();
    CreateAppSwapchain(kAppSwap, 1024, 1024);
    CreateAppSwapchain(kAppSwapFov, 1024, 1024);
    Layers l;
    BuildLayers(l);
    for (int i = 0; i < 4; ++i) {
        SwpEglArrivalObserved(reinterpret_cast<void*>(uintptr_t(10 + i)), g_currentCtx,
                              nullptr, 1000 + i * 1000);
        FullTick(100000 + i * 11111, l, i % 3);
    }
    DispatchState* state = State();
    CHECK(state && state->resourcesReady, "enabled baseline owns synthesis resources");
    if (!state) return;
    // Inject a bounded private acquisition to ensure Off drops its record by
    // destroying the private swapchain, without issuing another GPU wait.
    state->pendingOutputCount = 1;
    state->pendingOutputs[0].swapchain = state->privateSwapchains.begin()->second.handle;
    const int waitBefore = g_next.wait;
    g_mockBridgeValue = 0;
    SwpVtsTestPublish(0);
    EndTick(l);
    CHECK(state->pendingOutputCount == 0 && g_next.wait == waitBefore,
          "Off destroys pending private outputs without retrying their image waits");
    CHECK(g_synthOwners.load() == 0 && !g_dormantCleanupPending.load(),
          "Off releases full synthesis ownership and settles");
    CHECK(SwpEglTestArrivalCount() == 0, "Off clears global decoded-arrival history");
    const int glBefore = g_glCalls, contextsBefore = g_contextReads;
    const int blitsBefore = g_blitCalls, createsBefore = g_next.createSwapchain;
    const int initBefore = g_est.initCalls, destroyBefore = g_est.destroyCalls;
    const int metricsBefore = g_est.metricCalls, vectorsBefore = g_est.generateCalls;
    const int alignBefore = g_est.alignCalls, synthBefore = g_est.extrapolateCalls;
    const int readsBefore = g_mockBridgeReads;
    const int endBefore = g_next.endFrame, acquireBefore = g_next.acquire;
    const int releaseBefore = g_next.release;
    const int beginBefore = g_next.beginFrame;
    SwpEglSetOriginal(reinterpret_cast<void*>(&FakeEglCreate));
    SwpEglTestResetClockReads();
    for (int i = 0; i < 120; ++i) {
        CHECK(SwpWrapEglCreateImageKHR(nullptr, g_currentCtx, 0,
                  reinterpret_cast<void*>(uintptr_t(100 + i)), nullptr) ==
                  reinterpret_cast<void*>(uintptr_t(100 + i)),
              "Off EGL wrapper preserves the original result");
        SwpDispatchBeginFrame(kSession, nullptr);
        FullTick(200000 + i * 11111, l, i % 3);
        SwpDispatchLocateViews(kSession, nullptr, nullptr, 0, nullptr, nullptr);
    }
    CHECK(g_glCalls == glBefore && g_contextReads == contextsBefore && g_blitCalls == blitsBefore,
          "settled Off performs no GL calls, context queries or captures");
    CHECK(g_est.initCalls == initBefore && g_est.destroyCalls == destroyBefore &&
              g_est.metricCalls == metricsBefore && g_est.generateCalls == vectorsBefore &&
              g_est.alignCalls == alignBefore && g_est.extrapolateCalls == synthBefore,
          "settled Off performs no estimator work or queries");
    CHECK(g_next.createSwapchain == createsBefore && state->privateSwapchains.empty(),
          "settled Off creates no private outputs");
    bool queuesEmpty = true;
    for (const auto& entry : state->appSwapchains) {
        queuesEmpty &= entry.second.acquiredQueue.empty() && entry.second.waitedQueue.empty();
    }
    CHECK(queuesEmpty && state->pairCount == 0 && !state->schedInit,
          "settled Off balances app image ownership without scheduler or clock bookkeeping");
    CHECK(SwpEglTestClockReads() == 0 && SwpEglTestArrivalCount() == 0,
          "settled Off samples no clocks and records no decoded arrivals");
    CHECK(g_mockBridgeReads == readsBefore + 2,
          "settled Off retains exactly one control poll per 60 endframes");
    CHECK(g_next.endFrame == endBefore + 120 && g_next.beginFrame == beginBefore + 120 &&
              g_next.acquire == acquireBefore + 240 && g_next.release == releaseBefore + 240 &&
              g_eglOriginalCalls == 120,
          "settled Off forwards every original XR and EGL call");
    g_mockBridgeValue = 1;
    for (int i = 0; i < 60; ++i) EndTick(l);
    CHECK(SwpVtsMode() == 1, "fixed control polling discovers hot enable while Off");
    SwpEglArrivalObserved((void*)1000, g_currentCtx, nullptr, 10000);
    for (int i = 0; i < 4; ++i) {
        SwpEglArrivalObserved(reinterpret_cast<void*>(uintptr_t(1001 + i)), g_currentCtx,
                              nullptr, 11000 + i * 1000);
        FullTick(2000000 + i * 11111, l, i % 3);
    }
    CHECK(state->resourcesReady && state->estimatorInited && state->historyCount >= 2 &&
              g_blitCalls > blitsBefore,
          "hot enable rebuilds resources and resumes valid pre-release captures");
    SwpEglSetOriginal(nullptr);
}

static void CheckPipelinedOwnershipAcrossOff() {
    // Cover both images already owned when cleanup runs and images acquired
    // during settled Off. A/B/C are distinct runtime image indices 0/1/2.
    for (bool acquiredBeforeCleanup : {false, true}) {
        ResetAll();
        CHECK(InstallNext(), "next chain installs (pipelined Off ownership)");
        MakeSession();
        CreateAppSwapchain(kAppSwap, 1024, 1024);
        CreateAppSwapchain(kAppSwapFov, 1024, 1024);
        Layers l;
        BuildLayers(l);
        FullTick(100000, l, 0);
        DispatchState* state = State();
        CHECK(state && state->resourcesReady, "pipelined baseline admits the layout");
        if (!state) return;
        auto acquire = [](uint32_t image) {
            g_appAcquireIndex = image;
            uint32_t returned = 99;
            CHECK(SwpDispatchAcquireSwapchainImage(kAppSwap, nullptr, &returned) == XR_SUCCESS &&
                      returned == image, "pipelined acquisition forwards its actual image index");
        };
        auto acquireAB = [&]() {
            acquire(0);
            CHECK(SwpDispatchWaitSwapchainImage(kAppSwap, nullptr) == XR_SUCCESS,
                  "oldest A wait succeeds");
            acquire(1);
        };
        if (acquiredBeforeCleanup) acquireAB();
        g_mockBridgeValue = 0;
        SwpVtsTestPublish(0);
        EndTick(l);
        const int offGlCalls = g_glCalls, offBlits = g_blitCalls;
        const int offVectors = g_est.generateCalls;
        if (!acquiredBeforeCleanup) acquireAB();
        AppSwapchain& app = state->appSwapchains.at(kAppSwap);
        CHECK(!app.waitedQueue.empty() && app.waitedQueue.front() == 0 &&
                  !app.acquiredQueue.empty() && app.acquiredQueue.front() == 1,
              "Off and cleanup preserve waited A and older acquired B");
        const int releasesBefore = g_next.release;
        CHECK(SwpDispatchReleaseSwapchainImage(kAppSwap, nullptr) == XR_SUCCESS,
              "Off release of A forwards");
        EndTick(l);  // B remains outstanding across a settled Off EndFrame.
        CHECK(app.waitedQueue.empty() && !app.acquiredQueue.empty() &&
                  app.acquiredQueue.front() == 1,
              "Off release consumes A and retains B across EndFrame");
        CHECK(g_glCalls == offGlCalls && g_blitCalls == offBlits &&
                  g_est.generateCalls == offVectors,
              "Off FIFO bookkeeping performs no GL capture or estimation");
        g_mockBridgeValue = 1;
        SwpVtsTestPublish(1);
        EndTick(l);  // Rebuild the private layout while B is still acquired.
        WaitSlot(300000);
        acquire(2);  // C is newer than B, and has not been waited.
        CHECK(SwpDispatchWaitSwapchainImage(kAppSwap, nullptr) == XR_SUCCESS,
              "enabled wait completes the older B acquisition");
        CHECK(!app.waitedQueue.empty() && app.waitedQueue.front() == 1 &&
                  !app.acquiredQueue.empty() && app.acquiredQueue.front() == 2,
              "hot enable attributes the successful wait to B rather than newer C");
        g_captureSources.clear();
        CHECK(SwpDispatchReleaseSwapchainImage(kAppSwap, nullptr) == XR_SUCCESS,
              "enabled B release forwards");
        CHECK(g_captureSources.size() == 2 && g_captureSources[0] == 101 &&
                  g_captureSources[1] == 101,
              "enabled release captures older waited B in both eyes, never un-waited C");
        CHECK(app.waitedQueue.empty() && !app.acquiredQueue.empty() &&
                  app.acquiredQueue.front() == 2,
              "B release leaves C owned and still awaiting its wait");
        EndTick(l);
        WaitSlot(311111);
        g_waitResult = XR_TIMEOUT_EXPIRED;
        CHECK(SwpDispatchWaitSwapchainImage(kAppSwap, nullptr) == XR_TIMEOUT_EXPIRED &&
                  app.waitedQueue.empty() && !app.acquiredQueue.empty() &&
                  app.acquiredQueue.front() == 2,
              "a positive timeout status does not make C releasable");
        g_waitResult = XR_SESSION_LOSS_PENDING;
        CHECK(SwpDispatchWaitSwapchainImage(kAppSwap, nullptr) == XR_SESSION_LOSS_PENDING &&
                  app.acquiredQueue.empty() && !app.waitedQueue.empty() &&
                  app.waitedQueue.front() == 2,
              "session-loss-pending completion still makes successfully waited C releasable");
        g_waitResult = XR_SUCCESS;
        g_captureSources.clear();
        CHECK(SwpDispatchReleaseSwapchainImage(kAppSwap, nullptr) == XR_SUCCESS,
              "third C release forwards");
        CHECK(g_captureSources.size() == 2 && g_captureSources[0] == 102 &&
                  g_captureSources[1] == 102 && app.acquiredQueue.empty() &&
                  app.waitedQueue.empty() && g_next.release == releasesBefore + 3,
              "third release captures C once per eye and balances app FIFO ownership");
    }
}

int main() {
    CheckPipelinedOwnershipAcrossOff();
    CheckDormantLazyArmCadence();
    CheckDormantFailureCleanup();
    CheckSettledOffAndHotEnable();
    CheckPureHelpers();
    CheckLateFlow();
    CheckHalfRateScheduler();
    CheckHalfRate72();
    CheckOddAndArrayLayout();
    CheckPackedStereoOffsets();
    CheckPrivateImageCounts();
    CheckPartialCapturePoisoning();
    CheckHostileGLStateAndTimeout();
    std::printf("gxr-spacewarp dispatch host tests: %d checks, %d failures\n", g_checks,
                g_failures);
    return g_failures == 0 ? 0 : 1;
}

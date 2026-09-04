#include <ctime>
#include <cstdlib>
#include <iostream>
#include <string>

// Exercise the actual shipping source, with only platform/runtime calls replaced.
// No headset or Android runtime is contacted by these host tests.
static int testClockGetTime(int, timespec* value) { *value = {}; return 0; }
#define CLOCK_BOOTTIME 7
#define clock_gettime testClockGetTime
#ifdef _MSC_VER
// GCC symbol visibility has no meaning in this host-only executable.
#define __attribute__(...)
#endif
#include "../src/android_surface_trigger_passthrough_layer.cpp"
#undef clock_gettime
#ifdef _MSC_VER
#undef __attribute__
#endif

#define CHECK(expression) do { if (!(expression)) { \
    std::cerr << "CHECK failed line " << __LINE__ << ": " #expression "\n"; \
    std::abort(); } } while (false)

namespace {
ANativeWindow testWindow;
JavaVM testVm;
std::array<uint8_t, 16> pixels{};
size_t logs{}, queued{}, released{}, destroyedSwapchains{}, destroyedSpaces{};
XrResult pollResult = XR_EVENT_UNAVAILABLE;
XrEventDataSessionStateChanged nextEvent{XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED};
XrResult endResult = XR_SUCCESS;
const XrFrameEndInfo* originalFrame{};
const SessionState* expectedSession{};
bool expectQuad{};
uint64_t submitCalls{};

template <typename T> T fakeHandle(uintptr_t value) { return reinterpret_cast<T>(value); }

XrResult XRAPI_PTR testCreateSession(XrInstance, const XrSessionCreateInfo*, XrSession* session) {
    *session = fakeHandle<XrSession>(11);
    return XR_SUCCESS;
}
XrResult XRAPI_PTR testGetProperties(XrInstance, XrSystemId, XrSystemProperties* properties) {
    properties->graphicsProperties.maxLayerCount = kRequiredLayerCount;
    return XR_SUCCESS;
}
XrResult XRAPI_PTR testCreateSpace(XrSession, const XrReferenceSpaceCreateInfo*, XrSpace* space) {
    *space = fakeHandle<XrSpace>(12);
    return XR_SUCCESS;
}
XrResult XRAPI_PTR testCreateSurface(XrSession, const XrSwapchainCreateInfo* info,
                                    XrSwapchain* swapchain, jobject* surface) {
    CHECK(info->width == 2 && info->height == 2);
    CHECK(info->format == 0 && info->sampleCount == 0 && info->arraySize == 0);
    *swapchain = fakeHandle<XrSwapchain>(13);
    *surface = &testWindow;
    return XR_SUCCESS;
}
XrResult XRAPI_PTR testDestroySwapchain(XrSwapchain) { ++destroyedSwapchains; return XR_SUCCESS; }
XrResult XRAPI_PTR testDestroySpace(XrSpace) { ++destroyedSpaces; return XR_SUCCESS; }
XrResult XRAPI_PTR testDestroySession(XrSession) { return XR_SUCCESS; }
XrResult XRAPI_PTR testDestroyInstance(XrInstance) { return XR_SUCCESS; }
XrResult XRAPI_PTR testPollEvent(XrInstance, XrEventDataBuffer* data) {
    if (pollResult == XR_SUCCESS && data) std::memcpy(data, &nextEvent, sizeof(nextEvent));
    // Deliberately leave old bytes on no-event/error returns. The wrapper must
    // ignore them, regardless of whether Valve happens to reinitialize the buffer.
    return pollResult;
}
XrResult XRAPI_PTR testEndFrame(XrSession, const XrFrameEndInfo* output) {
    ++submitCalls;
    CHECK(output);
    if (!expectQuad) {
        CHECK(output == originalFrame);
        return endResult;
    }
    CHECK(output->layerCount == kRequiredLayerCount);
    CHECK(output->displayTime == originalFrame->displayTime);
    CHECK(output->environmentBlendMode == originalFrame->environmentBlendMode);
    CHECK(output->next == originalFrame->next);
    for (uint32_t i = 0; i < kSourceProjectionCount; ++i) {
        CHECK(output->layers[i] == originalFrame->layers[i]);
    }
    CHECK(output->layers[kSourceProjectionCount] ==
          reinterpret_cast<const XrCompositionLayerBaseHeader*>(&expectedSession->triggerQuad));
    const auto& quad = expectedSession->triggerQuad;
    CHECK(quad.type == XR_TYPE_COMPOSITION_LAYER_QUAD);
    CHECK(quad.subImage.imageRect.extent.width == 2 && quad.subImage.imageRect.extent.height == 2);
    CHECK(quad.eyeVisibility == XR_EYE_VISIBILITY_BOTH);
    CHECK(quad.layerFlags == XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT);
    CHECK(quad.size.width == 0.001f && quad.size.height == 0.001f);
    CHECK(quad.pose.position.z == -1.0f);
    return endResult;
}

void initializeDispatch() {
    g = {};
    g.createSession = testCreateSession;
    g.getSystemProperties = testGetProperties;
    g.createReferenceSpace = testCreateSpace;
    g.createAndroidSurfaceSwapchain = testCreateSurface;
    g.destroySwapchain = testDestroySwapchain;
    g.destroySpace = testDestroySpace;
    g.destroySession = testDestroySession;
    g.destroyInstance = testDestroyInstance;
    g.pollEvent = testPollEvent;
    g.endFrame = testEndFrame;
    extensionEnabled = true;
    applicationVm = &testVm;
}
} // namespace

int __android_log_write(int, const char*, const char*) { ++logs; return 0; }
void ANativeWindow_release(ANativeWindow*) { ++released; }
int ANativeWindow_setBuffersGeometry(ANativeWindow*, int32_t w, int32_t h, int32_t format) {
    CHECK(w == 2 && h == 2 && format == WINDOW_FORMAT_RGBA_8888);
    return 0;
}
int ANativeWindow_lock(ANativeWindow*, ANativeWindow_Buffer* buffer, void*) {
    *buffer = {2, 2, 2, WINDOW_FORMAT_RGBA_8888, pixels.data()};
    return 0;
}
int ANativeWindow_unlockAndPost(ANativeWindow*) { ++queued; return 0; }
ANativeWindow* ANativeWindow_fromSurface(JNIEnv*, jobject) { return &testWindow; }

int main() {
    initializeDispatch();
    XrSessionCreateInfo createInfo{XR_TYPE_SESSION_CREATE_INFO};
    XrSession handle{};
    CHECK(layerCreateSession({}, &createInfo, &handle) == XR_SUCCESS);
    auto state = findSession(handle);
    CHECK(state && !state->triggerReady.load());
    CHECK(queued == 0); // Must not write the Surface before VISIBLE/FOCUSED.
    nextEvent.session = handle;
    nextEvent.state = XR_SESSION_STATE_FOCUSED;
    XrEventDataBuffer eventBuffer{XR_TYPE_EVENT_DATA_BUFFER};
    pollResult = XR_SUCCESS;
    CHECK(layerPollEvent({}, &eventBuffer) == XR_SUCCESS);
    CHECK(state->triggerReady.load() && queued == 1);
    for (size_t i = 0; i < 4; ++i) {
        CHECK(pixels[4*i] == 0 && pixels[4*i+1] == 0 && pixels[4*i+2] == 0 && pixels[4*i+3] == 1);
    }

    const auto logsBeforeEmptyPoll = logs;
    pollResult = XR_EVENT_UNAVAILABLE;
    for (int i = 0; i < 1000; ++i) CHECK(layerPollEvent({}, &eventBuffer) == XR_EVENT_UNAVAILABLE);
    CHECK(logs == logsBeforeEmptyPoll && queued == 1);
    pollResult = XR_ERROR_RUNTIME_FAILURE;
    CHECK(layerPollEvent({}, &eventBuffer) == XR_ERROR_RUNTIME_FAILURE);
    CHECK(logs == logsBeforeEmptyPoll);
    pollResult = XR_SUCCESS;
    CHECK(layerPollEvent({}, nullptr) == XR_SUCCESS);
    CHECK(logs == logsBeforeEmptyPoll);

    std::array<std::array<XrCompositionLayerProjectionView, 2>, kSourceProjectionCount> views{};
    std::array<XrCompositionLayerProjection, kSourceProjectionCount> projections{};
    std::array<const XrCompositionLayerBaseHeader*, kSourceProjectionCount> pointers{};
    for (uint32_t i = 0; i < kSourceProjectionCount; ++i) {
        projections[i].type = XR_TYPE_COMPOSITION_LAYER_PROJECTION;
        projections[i].viewCount = 2;
        projections[i].views = views[i].data();
        pointers[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&projections[i]);
    }
    XrFrameEndInfo frame{XR_TYPE_FRAME_END_INFO};
    frame.layerCount = kSourceProjectionCount;
    frame.layers = pointers.data();
    frame.displayTime = 123456;
    frame.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_OPAQUE;
    originalFrame = &frame;
    expectedSession = state.get();
    expectQuad = true;
    for (int i = 0; i < 3; ++i) CHECK(layerEndFrame(handle, &frame) == XR_SUCCESS);
    const auto steadyLogs = logs;
    for (int i = 0; i < 1000; ++i) CHECK(layerEndFrame(handle, &frame) == XR_SUCCESS);
    CHECK(logs == steadyLogs && queued == 1 && state->appendedFrames == 1003);

    // The topology guard still rejects unexpected source layouts without rewriting.
    expectQuad = false;
    frame.layerCount = kSourceProjectionCount - 1;
    CHECK(layerEndFrame(handle, &frame) == XR_SUCCESS);
    frame.layerCount = kSourceProjectionCount;
    projections[0].viewCount = 1;
    CHECK(layerEndFrame(handle, &frame) == XR_SUCCESS);
    projections[0].viewCount = 2;
    state->state.store(XR_SESSION_STATE_SYNCHRONIZED);
    CHECK(layerEndFrame(handle, &frame) == XR_SUCCESS);
    state->state.store(XR_SESSION_STATE_FOCUSED);

    // Runtime rejection is forwarded once; later frames remain Valve-only.
    expectQuad = true;
    endResult = XR_ERROR_LAYER_INVALID;
    const auto beforeFailure = submitCalls;
    CHECK(layerEndFrame(handle, &frame) == XR_ERROR_LAYER_INVALID);
    CHECK(submitCalls == beforeFailure + 1 && !state->triggerReady.load());
    expectQuad = false;
    endResult = XR_SUCCESS;
    CHECK(layerEndFrame(handle, &frame) == XR_SUCCESS);

    const auto oldAddress = state.get();
    CHECK(layerDestroySession(handle) == XR_SUCCESS);
    CHECK(released == 1 && destroyedSwapchains == 1 && destroyedSpaces == 1);
    CHECK(sessions.findForFrame(handle, renderSessionCache) == nullptr);
    // Keep 1 cold reader alive to prove a reused numeric handle finds a new object.
    CHECK(layerCreateSession({}, &createInfo, &handle) == XR_SUCCESS);
    CHECK(sessions.findForFrame(handle, renderSessionCache) != oldAddress);
    CHECK(!state->triggerReady.load());
    state.reset();
    CHECK(layerDestroyInstance({}) == XR_SUCCESS);
    CHECK(released == 2 && destroyedSwapchains == 2 && destroyedSpaces == 2);
    CHECK(sessions.findForFrame(handle, renderSessionCache) == nullptr);
    initializeDispatch();
    CHECK(layerCreateSession({}, &createInfo, &handle) == XR_SUCCESS);
    CHECK(sessions.findForFrame(handle, renderSessionCache) != nullptr);
    CHECK(layerDestroyInstance({}) == XR_SUCCESS);
    CHECK(released == 3 && destroyedSwapchains == 3 && destroyedSpaces == 3);
    std::cout << "surface trigger integration: " << kSourceProjectionCount << " projections PASS\n";
}

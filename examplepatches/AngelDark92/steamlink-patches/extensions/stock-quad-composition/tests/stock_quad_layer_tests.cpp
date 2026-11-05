// Lifecycle tests that compile the real src/stock_quad_layer.cpp. Only the downstream OpenXR
// runtime, the Android log sink and the clock are replaced. No headset is contacted.
#include <ctime>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <new>
#include <string>
#include <type_traits>
#include <vector>

#include "test_support.h"

static int testClockGetTime(int, timespec* value) { *value = {}; return 0; }
#ifndef CLOCK_BOOTTIME
#define CLOCK_BOOTTIME 7
#endif
#define clock_gettime testClockGetTime
#include "../src/stock_quad_layer.cpp"
#undef clock_gettime

using namespace testsupport;

// ---- allocation / log accounting ----------------------------------------------------
static bool countAllocations = false;
static size_t allocations = 0;
void* operator new(size_t size) {
    if (countAllocations) ++allocations;
    if (void* p = std::malloc(size ? size : 1)) return p;
    throw std::bad_alloc();
}
void operator delete(void* p) noexcept { std::free(p); }
void operator delete(void* p, size_t) noexcept { std::free(p); }

static size_t logCount = 0;
static std::vector<std::string> logLines;
int __android_log_write(int, const char*, const char* text) {
    ++logCount;
    logLines.emplace_back(text);
    return 0;
}

namespace {

constexpr char kPackage[] = "com.valvesoftware.steamlinkvr";

template <typename T> T fake(uintptr_t v) { return reinterpret_cast<T>(v); }

struct Runtime {
    std::vector<std::string> events;
    uint32_t maxLayerCount = 16;
    XrResult createSpaceResult = XR_SUCCESS;
    uintptr_t nextSpace = 700;
    uintptr_t nextSession = 11;
    XrSpace lastSpace{};
    // locate
    int locateCalls = 0;
    XrResult locateResult = XR_SUCCESS;
    XrViewStateFlags locateFlags =
        XR_VIEW_STATE_ORIENTATION_VALID_BIT | XR_VIEW_STATE_POSITION_VALID_BIT;
    uint32_t locateCount = 2;
    XrPosef eyes[2] = {kGolden[1].eye, kGolden[1].eye};
    XrSpace locateSpace{};
    XrTime locateTime = 0;
    XrViewConfigurationType locateType{};
    // endFrame
    int endCalls = 0;
    XrResult endResult = XR_SUCCESS;
    const XrFrameEndInfo* lastInfo{};
    XrFrameEndInfo lastCopy{};
    const XrCompositionLayerBaseHeader* lastLayers[kMaxOutputLayers]{};
    bool capture = true;
    XrSpace destroyedSpace{};
    // poll
    XrEventDataSessionStateChanged event{XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED};
    int destroyInstanceCalls = 0;
    XrSession lastSession{};
    const char* gipaFailName = nullptr;  // downstream GIPA refuses this entry point
};
// Two independent fake downstream runtimes (instance 77 uses RT[0] == R, instance 78 uses RT[1]).
Runtime RT[2];
Runtime& R = RT[0];

template <int I> XrResult XRAPI_PTR fakeGetPropsT(XrInstance, XrSystemId, XrSystemProperties* p) {
    p->graphicsProperties.maxLayerCount = RT[I].maxLayerCount;
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeCreateSessionT(XrInstance, const XrSessionCreateInfo*,
                                                       XrSession* s) {
    *s = fake<XrSession>(RT[I].nextSession);
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeDestroySessionT(XrSession) {
    RT[I].events.push_back("destroySession");
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeCreateSpaceT(
    XrSession, const XrReferenceSpaceCreateInfo* info, XrSpace* s) {
    CHECK(info->referenceSpaceType == XR_REFERENCE_SPACE_TYPE_VIEW);
    CHECK(info->poseInReferenceSpace.orientation.w == 1.0f &&
          info->poseInReferenceSpace.position.x == 0.0f);
    if (XR_FAILED(RT[I].createSpaceResult)) return RT[I].createSpaceResult;
    *s = fake<XrSpace>(RT[I].nextSpace++);
    RT[I].lastSpace = *s;
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeDestroySpaceT(XrSpace s) {
    RT[I].events.push_back("destroySpace");
    RT[I].destroyedSpace = s;
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeLocateT(
    XrSession, const XrViewLocateInfo* info, XrViewState* state, uint32_t capacity,
    uint32_t* count, XrView* views) {
    Runtime& r = RT[I];
    ++r.locateCalls;
    CHECK(info->type == XR_TYPE_VIEW_LOCATE_INFO && info->next == nullptr && capacity >= 2);
    r.locateSpace = info->space;
    r.locateTime = info->displayTime;
    r.locateType = info->viewConfigurationType;
    if (XR_FAILED(r.locateResult)) return r.locateResult;
    state->viewStateFlags = r.locateFlags;
    *count = r.locateCount;
    for (uint32_t i = 0; i < 2; ++i) views[i].pose = r.eyes[i];
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeEndFrameT(XrSession session, const XrFrameEndInfo* info) {
    Runtime& r = RT[I];
    ++r.endCalls;
    r.lastInfo = info;
    r.lastSession = session;
    if (r.capture) {
        r.lastCopy = *info;
        CHECK(info->layerCount <= kMaxOutputLayers);
        for (uint32_t i = 0; i < info->layerCount; ++i) r.lastLayers[i] = info->layers[i];
    }
    return r.endResult;
}
template <int I> XrResult XRAPI_PTR fakePollT(XrInstance, XrEventDataBuffer* data) {
    std::memcpy(data, &RT[I].event, sizeof(RT[I].event));
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeDestroyInstanceT(XrInstance) {
    ++RT[I].destroyInstanceCalls;
    RT[I].events.push_back("destroyInstance");
    return XR_SUCCESS;
}
template <int I> XrResult XRAPI_PTR fakeGipaT(XrInstance, const char* name, PFN_xrVoidFunction* fn) {
#define MAP(n, f) if (!std::strcmp(name, n)) { *fn = reinterpret_cast<PFN_xrVoidFunction>(f); return XR_SUCCESS; }
    if (RT[I].gipaFailName && !std::strcmp(name, RT[I].gipaFailName)) {
        *fn = nullptr;
        return XR_ERROR_FUNCTION_UNSUPPORTED;
    }
    MAP("xrDestroyInstance", fakeDestroyInstanceT<I>)
    MAP("xrGetSystemProperties", fakeGetPropsT<I>)
    MAP("xrCreateSession", fakeCreateSessionT<I>)
    MAP("xrDestroySession", fakeDestroySessionT<I>)
    MAP("xrCreateReferenceSpace", fakeCreateSpaceT<I>)
    MAP("xrDestroySpace", fakeDestroySpaceT<I>)
    MAP("xrLocateViews", fakeLocateT<I>)
    MAP("xrEndFrame", fakeEndFrameT<I>)
    MAP("xrPollEvent", fakePollT<I>)
#undef MAP
    *fn = nullptr;
    return XR_ERROR_FUNCTION_UNSUPPORTED;
}
template <int I> XrResult XRAPI_PTR fakeCreateLayerInstanceT(
    const XrInstanceCreateInfo*, const XrApiLayerCreateInfo*, XrInstance* instance) {
    *instance = fake<XrInstance>(77 + I);
    return XR_SUCCESS;
}
// Instance 0 aliases used by the single-instance tests.
const auto fakeEndFrame = &fakeEndFrameT<0>;
const auto fakeCreateSession = &fakeCreateSessionT<0>;
const auto fakeDestroySession = &fakeDestroySessionT<0>;
const auto fakePoll = &fakePollT<0>;

struct Api {
    XrInstance instance{};
    PFN_xrCreateSession createSession{};
    PFN_xrDestroySession destroySession{};
    PFN_xrEndFrame endFrame{};
    PFN_xrPollEvent poll{};
    PFN_xrDestroyInstance destroyInstance{};
    PFN_xrGetInstanceProcAddr gipa{};
    int index{};  // which fake downstream runtime this instance sits on
};

bool instanceActive(const Api& api) {
    const auto owner = findInstance(api.instance);
    return owner && owner->active;
}
size_t liveInstances() {
    std::lock_guard<std::mutex> lock(instancesMutex);
    return instances.size();
}

void writeCmdline(const std::string& name) {
    std::ofstream out("stock_quad_cmdline_test.bin", std::ios::binary | std::ios::trunc);
    out.write(name.c_str(), static_cast<std::streamsize>(name.size() + 1));
}

// index 0 resets all test state; index 1 adds a second instance next to a live first one.
Api bootstrap(const std::string& process = kPackage, bool missingCmdline = false, int index = 0,
              const char* gipaFailName = nullptr) {
    RT[index] = Runtime{};
    RT[index].gipaFailName = gipaFailName;
    if (index == 0) {
        logLines.clear();
        logCount = 0;
    }
    writeCmdline(process);
    cmdlinePath = missingCmdline ? "stock_quad_cmdline_missing.bin" : "stock_quad_cmdline_test.bin";

    XrNegotiateLoaderInfo loader{XR_LOADER_INTERFACE_STRUCT_LOADER_INFO};
    loader.maxInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    loader.maxApiVersion = XR_CURRENT_API_VERSION;
    XrNegotiateApiLayerRequest request{XR_LOADER_INTERFACE_STRUCT_API_LAYER_REQUEST};
    CHECK(xrNegotiateLoaderApiLayerInterface(&loader, "wrong_name", &request) != XR_SUCCESS);
    CHECK(xrNegotiateLoaderApiLayerInterface(&loader, kLayerName, &request) == XR_SUCCESS);

    XrApiLayerNextInfo nextInfo{XR_LOADER_INTERFACE_STRUCT_API_LAYER_NEXT_INFO};
    nextInfo.nextGetInstanceProcAddr = index == 0 ? fakeGipaT<0> : fakeGipaT<1>;
    nextInfo.nextCreateApiLayerInstance =
        index == 0 ? fakeCreateLayerInstanceT<0> : fakeCreateLayerInstanceT<1>;
    XrApiLayerCreateInfo layerInfo{XR_LOADER_INTERFACE_STRUCT_API_LAYER_CREATE_INFO};
    layerInfo.nextInfo = &nextInfo;
    XrInstanceCreateInfo createInfo{XR_TYPE_INSTANCE_CREATE_INFO};
    Api api;
    api.index = index;
    CHECK(request.createApiLayerInstance(&createInfo, &layerInfo, &api.instance) == XR_SUCCESS);
    api.gipa = request.getInstanceProcAddr;
    const auto get = [&](const char* name, auto& out) {
        PFN_xrVoidFunction f{};
        const XrResult lookup = api.gipa(api.instance, name, &f);
        // A deliberately missing entry point reports the downstream failure, nothing else may.
        CHECK(lookup == XR_SUCCESS ||
              (gipaFailName && !std::strcmp(gipaFailName, name) && !f));
        out = reinterpret_cast<std::remove_reference_t<decltype(out)>>(f);
    };
    get("xrCreateSession", api.createSession);
    get("xrDestroySession", api.destroySession);
    get("xrEndFrame", api.endFrame);
    get("xrPollEvent", api.poll);
    get("xrDestroyInstance", api.destroyInstance);
    return api;
}

XrSession startSession(Api& api, uintptr_t handle) {
    RT[api.index].nextSession = handle;
    XrSessionCreateInfo info{XR_TYPE_SESSION_CREATE_INFO};
    XrSession session{};
    CHECK(api.createSession(api.instance, &info, &session) == XR_SUCCESS);
    return session;
}

void setState(Api& api, XrSession session, XrSessionState state) {
    RT[api.index].event.session = session;
    RT[api.index].event.state = state;
    XrEventDataBuffer buffer{XR_TYPE_EVENT_DATA_BUFFER};
    CHECK(api.poll(api.instance, &buffer) == XR_SUCCESS);
}

void setEyes(float leftX, float rightX) {
    R.eyes[0] = kGolden[1].eye;
    R.eyes[1] = kGolden[1].eye;
    R.eyes[0].position.x = leftX;
    R.eyes[1].position.x = rightX;
}

bool logContains(const std::string& needle) {
    for (const auto& line : logLines) {
        if (line.find(needle) != std::string::npos) return true;
    }
    return false;
}
int logCountOf(const std::string& needle) {
    int n = 0;
    for (const auto& line : logLines) n += line.find(needle) != std::string::npos;
    return n;
}

struct Fixture {
    Api api;
    XrSession session{};
    explicit Fixture(uintptr_t handle = 11, bool visible = true) {
        api = bootstrap();
        setEyes(-0.032f, 0.032f);
        session = startSession(api, handle);
        if (visible) setState(api, session, XR_SESSION_STATE_FOCUSED);
    }
    ~Fixture() { api.destroyInstance(api.instance); }
};

Source goldenSource(int projections, int tail) {
    return Source(projections, tail, kGolden[1].head, kGolden[1].fov, fovFovea());
}

// ---- tests --------------------------------------------------------------------------

void convertsBothLayouts() {
    for (int projections : {2, 3}) {
        Fixture f;
        Source source(projections, 1, kGolden[1].head, kGolden[1].fov, fovFovea());
        source.info.next = reinterpret_cast<const void*>(uintptr_t{0xabc});
        CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
        CHECK(R.endCalls == 1 && R.locateCalls == 1);
        CHECK(R.lastInfo != &source.info);  // converted submission
        CHECK(R.lastCopy.layerCount == 5);   // 4 quads + 1 tail
        CHECK(R.lastCopy.displayTime == source.info.displayTime);
        CHECK(R.lastCopy.environmentBlendMode == XR_ENVIRONMENT_BLEND_MODE_OPAQUE);
        CHECK(R.lastCopy.next == source.info.next);
        const XrEyeVisibility vis[4] = {XR_EYE_VISIBILITY_LEFT, XR_EYE_VISIBILITY_RIGHT,
                                        XR_EYE_VISIBILITY_LEFT, XR_EYE_VISIBILITY_RIGHT};
        for (uint32_t i = 0; i < 4; ++i) {
            const auto* quad = reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[i]);
            CHECK(quad->type == XR_TYPE_COMPOSITION_LAYER_QUAD);
            CHECK(quad->eyeVisibility == vis[i]);
            CHECK(quad->layerFlags == (i < 2 ? 0u : 6u));
            const auto& family = i < 2 ? source.base() : source.fovea();
            CHECK(quad->next == family.next && quad->space == family.space);
            CHECK(quad->subImage.swapchain == family.views[i % 2].subImage.swapchain);
        }
        // No source projection layer is forwarded; the tail keeps its identity and position.
        for (uint32_t i = 0; i < R.lastCopy.layerCount; ++i) {
            for (int p = 0; p < projections; ++p) {
                CHECK(R.lastLayers[i] != reinterpret_cast<const XrCompositionLayerBaseHeader*>(
                                              &source.projections[p]));
            }
        }
        CHECK(R.lastLayers[4] == source.layers.back());
        // Head pose comes from the original view, eye offsets from the VIEW locate.
        const auto* baseL = reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[0]);
        XrPosef expectedPose{};
        XrExtent2Df expectedSize{};
        XrPosef eyeL = kGolden[1].eye;
        eyeL.position.x = -0.032f;
        CHECK(composeQuad(kGolden[1].head, eyeL, kGolden[1].fov, &expectedPose, &expectedSize));
        CHECK_NEAR(baseL->pose.position.x, expectedPose.position.x, 1e-6);
        CHECK_NEAR(baseL->pose.position.y, expectedPose.position.y, 1e-6);
        CHECK_NEAR(baseL->pose.position.z, expectedPose.position.z, 1e-6);
        CHECK_NEAR(baseL->size.width, expectedSize.width, 1e-6);
        // Eye locate used this session's own VIEW space, stereo config and the frame time.
        CHECK(R.locateSpace == R.lastSpace);
        CHECK(R.locateType == XR_VIEW_CONFIGURATION_TYPE_PRIMARY_STEREO);
        CHECK(R.locateTime == source.info.displayTime);
        CHECK(logContains("eye_offsets_located"));
    }
}

void stockLayoutAndForeignShapesPassThrough() {
    Fixture f;
    XrCompositionLayerQuad quads[4]{};
    const XrCompositionLayerBaseHeader* layers[4];
    for (int i = 0; i < 4; ++i) {
        quads[i].type = XR_TYPE_COMPOSITION_LAYER_QUAD;
        layers[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&quads[i]);
    }
    XrFrameEndInfo info{XR_TYPE_FRAME_END_INFO};
    info.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_OPAQUE;
    info.layerCount = 4;
    info.layers = layers;
    CHECK(f.api.endFrame(f.session, &info) == XR_SUCCESS);
    CHECK(R.endCalls == 1 && R.lastInfo == &info && R.locateCalls == 0);
    CHECK(logContains("not_applicable"));
}

void rejectedShapesForwardOriginalOnceAndRecover() {
    Fixture f;
    const auto run = [&](auto mutate, const char* reason) {
        Source source = goldenSource(3, 1);
        mutate(source);
        const int before = R.endCalls;
        CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
        CHECK(R.endCalls == before + 1);
        CHECK(R.lastInfo == &source.info);  // original object, byte for byte
        CHECK(logContains(reason));
        // A rejected conversion is not a session-wide disable: the next valid frame converts.
        Source good = goldenSource(3, 0);
        CHECK(f.api.endFrame(f.session, &good.info) == XR_SUCCESS);
        CHECK(R.endCalls == before + 2 && R.lastInfo != &good.info && R.lastCopy.layerCount == 4);
    };
    run([](Source& s) { s.baseView(0).next = &s.settings[0]; }, "bad_view_next");
    run([](Source& s) { s.base().next = &s.tail[0]; }, "bad_layer_next");
    run([](Source& s) { s.fovea().layerFlags = 0; }, "bad_layer_flags");
    run([](Source& s) { s.baseView(0).fov.angleLeft = 1.0f; }, "bad_fov");
    run([](Source& s) { s.baseView(1).pose.position.x = 1.0f; }, "pose_mismatch");
    run([](Source& s) { s.info.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_ADDITIVE; },
        "non_opaque_blend");
    run([](Source& s) { s.baseView(0).pose.orientation = {0, 0, 0, 0}; }, "bad_pose");
    CHECK(!logContains("stock_quad_disabled"));
}

void layerCapRejectsOversizedAndUnknown() {
    Fixture f;
    f.api.destroySession(f.session);
    R.maxLayerCount = 4;  // 3 projections + 1 tail needs 5 output layers
    f.session = startSession(f.api, 11);
    setState(f.api, f.session, XR_SESSION_STATE_VISIBLE);
    Source source = goldenSource(3, 1);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    CHECK(R.lastInfo == &source.info && logContains("layer_cap"));
    Source fits = goldenSource(3, 0);
    CHECK(f.api.endFrame(f.session, &fits.info) == XR_SUCCESS);
    CHECK(R.lastInfo != &fits.info && R.lastCopy.layerCount == 4);
    // Unknown cap (system properties unavailable => 0) fails closed.
    f.api.destroySession(f.session);
    R.maxLayerCount = 0;
    f.session = startSession(f.api, 11);
    setState(f.api, f.session, XR_SESSION_STATE_VISIBLE);
    CHECK(f.api.endFrame(f.session, &fits.info) == XR_SUCCESS && R.lastInfo == &fits.info);
}

void sessionStateGatesConversion() {
    Fixture f(11, false);
    Source source = goldenSource(2, 0);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    CHECK(R.lastInfo == &source.info && R.locateCalls == 0);  // state UNKNOWN
    setState(f.api, f.session, XR_SESSION_STATE_READY);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS && R.lastInfo == &source.info);
    setState(f.api, f.session, XR_SESSION_STATE_VISIBLE);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS && R.lastInfo != &source.info);
    setState(f.api, f.session, XR_SESSION_STATE_STOPPING);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS && R.lastInfo == &source.info);
    CHECK(R.endCalls == 4);
}

void locateFailuresForwardOriginalOnce() {
    Fixture f;
    const auto expectOriginal = [&](const char* what) {
        Source source = goldenSource(3, 0);
        const int before = R.endCalls;
        CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
        CHECK_NEAR(R.endCalls, before + 1, 0);
        if (R.lastInfo != &source.info) {
            std::cerr << "converted despite " << what << "\n";
            std::abort();
        }
    };
    R.locateResult = XR_ERROR_RUNTIME_FAILURE;
    expectOriginal("locate error");
    R.locateResult = XR_SUCCESS;
    R.locateFlags = XR_VIEW_STATE_ORIENTATION_VALID_BIT;
    expectOriginal("position invalid");
    R.locateFlags = XR_VIEW_STATE_ORIENTATION_VALID_BIT | XR_VIEW_STATE_POSITION_VALID_BIT;
    R.locateCount = 1;
    expectOriginal("one view");
    R.locateCount = 2;
    R.eyes[0].orientation = {0, 0, 0, 0};
    expectOriginal("bad eye quaternion");
    setEyes(0.0f, 0.0f);
    expectOriginal("zero ipd");
    CHECK(R.locateCalls == 5);  // nothing invalid was cached
    setEyes(-0.032f, 0.032f);
    Source ok = goldenSource(3, 0);
    CHECK(f.api.endFrame(f.session, &ok.info) == XR_SUCCESS);
    CHECK(R.lastInfo != &ok.info && R.locateCalls == 6);
    CHECK(logCountOf("eye_locate_failed") == 1);  // logged once
}

void persistentLocateFailureDisables() {
    Fixture f;
    R.locateResult = XR_ERROR_RUNTIME_FAILURE;
    for (uint32_t i = 0; i < kMaxLocateFailures + 5; ++i) {
        Source source = goldenSource(2, 0);
        CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
        CHECK(R.lastInfo == &source.info);
    }
    CHECK(R.locateCalls == static_cast<int>(kMaxLocateFailures));
    CHECK(logCountOf("stock_quad_disabled") == 1 && logContains("eye_locate_failed"));
}

void endFrameRejectionDisablesWithoutRetry() {
    Fixture f;
    R.endResult = XR_ERROR_LAYER_INVALID;
    Source source = goldenSource(3, 0);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_ERROR_LAYER_INVALID);
    CHECK(R.endCalls == 1);  // never a second xrEndFrame for the same frame
    CHECK(R.lastInfo != &source.info);
    CHECK(logCountOf("end_frame_rejected") == 1);
    R.endResult = XR_SUCCESS;
    for (int i = 0; i < 5; ++i) {
        Source next = goldenSource(3, 0);
        CHECK(f.api.endFrame(f.session, &next.info) == XR_SUCCESS);
        CHECK(R.lastInfo == &next.info);  // stands down for the rest of the session
    }
    CHECK(R.endCalls == 6 && logCountOf("end_frame_rejected") == 1);
    f.api.destroySession(f.session);
    CHECK(logContains("\"disabled\":true") && logContains("stock_quad_summary"));
}

void eyeCacheIsPerSession() {
    Fixture f;
    Source one = goldenSource(3, 0);
    CHECK(f.api.endFrame(f.session, &one.info) == XR_SUCCESS);
    const float firstX =
        reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[1])->pose.position.x;
    for (int i = 0; i < 10; ++i) CHECK(f.api.endFrame(f.session, &one.info) == XR_SUCCESS);
    CHECK(R.locateCalls == 1);  // cached for the session

    // Second session: different eyes; must locate on its own and never see session 1's cache.
    setEyes(-0.040f, 0.040f);
    XrSession other = startSession(f.api, 12);
    setState(f.api, other, XR_SESSION_STATE_VISIBLE);
    CHECK(f.api.endFrame(other, &one.info) == XR_SUCCESS);
    CHECK(R.locateCalls == 2);
    const float otherX =
        reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[1])->pose.position.x;
    CHECK(otherX > firstX + 0.003f);
    // Session 1 keeps its own cache.
    CHECK(f.api.endFrame(f.session, &one.info) == XR_SUCCESS);
    CHECK_NEAR(reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[1])->pose.position.x,
               firstX, 1e-7);
    CHECK(R.locateCalls == 2);

    // Reused handle after destroy: fresh state, fresh locate, nothing carried over.
    f.api.destroySession(other);
    setEyes(-0.020f, 0.020f);
    other = startSession(f.api, 12);
    CHECK(f.api.endFrame(other, &one.info) == XR_SUCCESS);
    CHECK(R.lastInfo == &one.info);  // new session is UNKNOWN until its first state event
    setState(f.api, other, XR_SESSION_STATE_FOCUSED);
    CHECK(f.api.endFrame(other, &one.info) == XR_SUCCESS && R.locateCalls == 3);
    CHECK(reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[1])->pose.position.x <
          firstX);
    // A destroyed handle is simply forwarded.
    f.api.destroySession(other);
    const int before = R.endCalls;
    CHECK(f.api.endFrame(other, &one.info) == XR_SUCCESS);
    CHECK(R.endCalls == before + 1 && R.lastInfo == &one.info);
}

void viewSpaceLifecycle() {
    {
        Fixture f;
        const XrSpace space = R.lastSpace;
        R.events.clear();
        CHECK(f.api.destroySession(f.session) == XR_SUCCESS);
        CHECK(R.events.size() == 2 && R.events[0] == "destroySpace" && R.events[1] == "destroySession");
        CHECK(R.destroyedSpace == space);
    }
    {
        // Instance destroyed while a session is still alive: the layer frees its own space
        // first, then forwards xrDestroyInstance exactly once.
        Api api = bootstrap();
        setEyes(-0.032f, 0.032f);
        (void)startSession(api, 21);
        const XrSpace space = R.lastSpace;
        CHECK(api.destroyInstance(api.instance) == XR_SUCCESS);
        CHECK(R.events.size() == 2 && R.events[0] == "destroySpace" &&
              R.events[1] == "destroyInstance" && R.destroyedSpace == space);
        CHECK(R.destroyInstanceCalls == 1);
    }
    {
        // Instance recreation with an identical session handle works from a clean slate.
        for (int round = 0; round < 3; ++round) {
            Fixture f(11);
            Source source = goldenSource(2, 0);
            CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
            CHECK(R.lastInfo != &source.info && R.locateCalls == 1);
        }
    }
    {
        // VIEW space creation failure => session passes everything through.
        Api api = bootstrap();
        R.createSpaceResult = XR_ERROR_RUNTIME_FAILURE;
        XrSession session = startSession(api, 31);
        setState(api, session, XR_SESSION_STATE_VISIBLE);
        Source source = goldenSource(3, 0);
        CHECK(api.endFrame(session, &source.info) == XR_SUCCESS);
        CHECK(R.lastInfo == &source.info && R.locateCalls == 0);
        CHECK(logContains("view_space_failed"));
        R.events.clear();
        api.destroySession(session);
        CHECK(R.events.size() == 1 && R.events[0] == "destroySession");  // no space to free
        api.destroyInstance(api.instance);
    }
}

void packageGuardMakesLayerInert() {
    for (const char* process : {"com.example.other", "com.valvesoftware.steamlinkvr:remote",
                                "com.valvesoftware.steamlinkvrx"}) {
        Api api = bootstrap(process);
        CHECK(!instanceActive(api));
        // Nothing but destroy-instance is intercepted; the downstream entry points are exposed.
        CHECK(api.createSession == fakeCreateSession);
        CHECK(api.destroySession == fakeDestroySession);
        CHECK(api.endFrame == fakeEndFrame);
        CHECK(api.poll == fakePoll);
        XrSession session = startSession(api, 41);
        Source source = goldenSource(3, 0);
        CHECK(api.endFrame(session, &source.info) == XR_SUCCESS);
        CHECK(R.lastInfo == &source.info && R.locateCalls == 0 && R.lastSpace == nullptr);
        CHECK(api.destroyInstance(api.instance) == XR_SUCCESS);
        CHECK(R.destroyInstanceCalls == 1);
    }
    // Unreadable cmdline => inert as well.
    std::remove("stock_quad_cmdline_missing.bin");
    Api missing = bootstrap(kPackage, true);
    CHECK(!instanceActive(missing) && missing.endFrame == fakeEndFrame && missing.createSession == fakeCreateSession);
    CHECK(missing.destroyInstance(missing.instance) == XR_SUCCESS);
    CHECK(liveInstances() == 0);
    // The exact package activates the layer.
    Api exact = bootstrap();
    CHECK(instanceActive(exact) && exact.endFrame != fakeEndFrame && exact.createSession != fakeCreateSession);
    exact.destroyInstance(exact.instance);
}

void steadyStateIsSilentAndAllocationFree() {
    Fixture f;
    Source source = goldenSource(3, 1);
    for (int i = 0; i < 3; ++i) CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    CHECK(logCountOf("stock_quad_frame") == 3);  // first three converted frames only
    CHECK(R.locateCalls == 1);
    R.capture = false;
    logCount = 0;
    countAllocations = true;
    allocations = 0;
    for (int i = 0; i < 1000; ++i) CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    countAllocations = false;
    CHECK(allocations == 0);
    CHECK(logCount == 0);
    CHECK(R.endCalls == 1003 && R.locateCalls == 1);
    // Rejected-frame steady state is silent after the first occurrence as well.
    source.baseView(0).next = &source.settings[0];
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    logCount = 0;
    countAllocations = true;
    allocations = 0;
    for (int i = 0; i < 1000; ++i) CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    countAllocations = false;
    CHECK(allocations == 0 && logCount == 0);
    R.capture = true;
}

void setEyesOf(int index, float leftX, float rightX) {
    RT[index].eyes[0] = kGolden[1].eye;
    RT[index].eyes[1] = kGolden[1].eye;
    RT[index].eyes[0].position.x = leftX;
    RT[index].eyes[1].position.x = rightX;
}

float quadX(int index, int layer) {
    return reinterpret_cast<const XrCompositionLayerQuad*>(RT[index].lastLayers[layer])
        ->pose.position.x;
}

// Two live instances with interleaved sessions, locates and frames. Each call must reach only its
// own instance's downstream functions; destroying one instance must not disturb the other.
void twoInstancesInterleaved(bool destroyFirstFirst, bool destroySessionsFirst) {
    Api a = bootstrap(kPackage, false, 0);
    Api b = bootstrap(kPackage, false, 1);
    CHECK(a.instance != b.instance && liveInstances() == 2);
    CHECK(instanceActive(a) && instanceActive(b));
    RT[0].nextSpace = 700;
    RT[1].nextSpace = 800;
    setEyesOf(0, -0.032f, 0.032f);
    setEyesOf(1, -0.040f, 0.040f);
    RT[0].maxLayerCount = 16;
    RT[1].maxLayerCount = 16;
    // Interleaved creation, distinct handles.
    const XrSession sa = startSession(a, 11);
    const XrSession sb = startSession(b, 21);
    CHECK(sa != sb);
    const XrSpace spaceA = RT[0].lastSpace;
    const XrSpace spaceB = RT[1].lastSpace;
    CHECK(spaceA != spaceB);
    setState(a, sa, XR_SESSION_STATE_FOCUSED);
    setState(b, sb, XR_SESSION_STATE_VISIBLE);
    // A state event delivered by one instance never changes the other instance's session.
    setState(b, sa, XR_SESSION_STATE_STOPPING);
    setState(a, sb, XR_SESSION_STATE_STOPPING);

    Source sourceA = goldenSource(3, 1);
    Source sourceB = goldenSource(2, 0);
    for (int round = 0; round < 3; ++round) {
        CHECK(a.endFrame(sa, &sourceA.info) == XR_SUCCESS);
        CHECK(b.endFrame(sb, &sourceB.info) == XR_SUCCESS);
    }
    CHECK(RT[0].endCalls == 3 && RT[1].endCalls == 3);
    CHECK(RT[0].lastSession == sa && RT[1].lastSession == sb);
    CHECK(RT[0].lastInfo != &sourceA.info && RT[1].lastInfo != &sourceB.info);  // both converted
    CHECK(RT[0].lastCopy.layerCount == 5 && RT[1].lastCopy.layerCount == 4);
    CHECK(RT[0].locateCalls == 1 && RT[1].locateCalls == 1);
    CHECK(RT[0].locateSpace == spaceA && RT[1].locateSpace == spaceB);
    // Each session used its own instance's eyes (wider IPD on instance B).
    CHECK(quadX(1, 1) - quadX(1, 0) > quadX(0, 1) - quadX(0, 0) + 0.005f);

    const auto destroyOne = [&](Api& api, XrSession session, bool sessionFirst) {
        RT[api.index].events.clear();
        if (sessionFirst) {
            CHECK(api.destroySession(session) == XR_SUCCESS);
            CHECK(RT[api.index].events.size() == 2 && RT[api.index].events[0] == "destroySpace" &&
                  RT[api.index].events[1] == "destroySession");
            CHECK(RT[api.index].destroyedSpace == (api.index == 0 ? spaceA : spaceB));
            RT[api.index].events.clear();
        }
        CHECK(api.destroyInstance(api.instance) == XR_SUCCESS);
        if (sessionFirst) {
            CHECK(RT[api.index].events.size() == 1 && RT[api.index].events[0] == "destroyInstance");
        } else {
            // Live session: its own VIEW space goes first, then the instance, nothing else.
            CHECK(RT[api.index].events.size() == 2 && RT[api.index].events[0] == "destroySpace" &&
                  RT[api.index].events[1] == "destroyInstance");
        }
        CHECK(RT[api.index].destroyInstanceCalls == 1);
    };
    Api& first = destroyFirstFirst ? a : b;
    Api& second = destroyFirstFirst ? b : a;
    const XrSession firstSession = destroyFirstFirst ? sa : sb;
    const XrSession secondSession = destroyFirstFirst ? sb : sa;
    Source& secondSource = destroyFirstFirst ? sourceB : sourceA;
    const int firstIndex = first.index;
    const int secondIndex = second.index;
    const int secondEnd = RT[secondIndex].endCalls;
    const int secondLocates = RT[secondIndex].locateCalls;
    const int secondDestroys = RT[secondIndex].destroyInstanceCalls;

    destroyOne(first, firstSession, destroySessionsFirst);
    CHECK(liveInstances() == 1);
    CHECK(RT[secondIndex].events.empty() && RT[secondIndex].destroyInstanceCalls == secondDestroys);
    // The destroyed instance is gone for good; lookups and a second destroy are rejected.
    PFN_xrVoidFunction f{};
    CHECK(first.gipa(first.instance, "xrEndFrame", &f) == XR_ERROR_HANDLE_INVALID && !f);
    CHECK(first.destroyInstance(first.instance) == XR_ERROR_HANDLE_INVALID);
    CHECK(RT[firstIndex].destroyInstanceCalls == 1);
    // The survivor still converts through its own, untouched session/cache/dispatch.
    for (int i = 0; i < 3; ++i) {
        CHECK(second.endFrame(secondSession, &secondSource.info) == XR_SUCCESS);
        CHECK(RT[secondIndex].lastInfo != &secondSource.info);
    }
    CHECK(RT[secondIndex].endCalls == secondEnd + 3 && RT[secondIndex].locateCalls == secondLocates);
    CHECK(RT[firstIndex].endCalls == 3);  // nothing leaked into the destroyed instance's runtime
    // The survivor's own lookups still work and still resolve to its hooks.
    CHECK(second.gipa(second.instance, "xrEndFrame", &f) == XR_SUCCESS &&
          f == reinterpret_cast<PFN_xrVoidFunction>(second.endFrame));
    destroyOne(second, secondSession, destroySessionsFirst);
    CHECK(liveInstances() == 0);
}

void reusedSessionHandlesAcrossInstances() {
    Api a = bootstrap(kPackage, false, 0);
    Api b = bootstrap(kPackage, false, 1);
    RT[1].nextSpace = 800;
    setEyesOf(0, -0.032f, 0.032f);
    setEyesOf(1, -0.040f, 0.040f);
    Source source = goldenSource(3, 0);
    XrSession sa = startSession(a, 11);
    setState(a, sa, XR_SESSION_STATE_FOCUSED);
    CHECK(a.endFrame(sa, &source.info) == XR_SUCCESS && RT[0].lastInfo != &source.info);
    CHECK(a.destroySession(sa) == XR_SUCCESS);
    // The runtime hands the freed handle value to the other instance: it is now B's session.
    XrSession sb = startSession(b, 11);
    CHECK(sb == sa);
    setState(b, sb, XR_SESSION_STATE_FOCUSED);
    CHECK(b.endFrame(sb, &source.info) == XR_SUCCESS);
    CHECK(RT[1].endCalls == 1 && RT[1].lastInfo != &source.info && RT[0].endCalls == 1);
    CHECK(RT[1].locateCalls == 1);
    // A live handle value cannot be claimed by a second instance: refused, nothing stolen.
    RT[0].nextSession = 11;
    XrSessionCreateInfo createInfo{XR_TYPE_SESSION_CREATE_INFO};
    XrSession clash{};
    CHECK(a.createSession(a.instance, &createInfo, &clash) == XR_ERROR_RUNTIME_FAILURE);
    CHECK(logContains("session_handle_collision"));
    CHECK(b.endFrame(sb, &source.info) == XR_SUCCESS && RT[1].endCalls == 2 && RT[0].endCalls == 1);
    // Untracked handle with two live instances: no owner to ask, so no downstream call.
    CHECK(b.destroySession(sb) == XR_SUCCESS);
    const int callsA = RT[0].endCalls, callsB = RT[1].endCalls;
    CHECK(a.endFrame(sb, &source.info) == XR_ERROR_HANDLE_INVALID);
    CHECK(RT[0].endCalls == callsA && RT[1].endCalls == callsB);
    CHECK(a.destroySession(sb) == XR_ERROR_HANDLE_INVALID);
    // Now A may legitimately own the value again, and a different one stays independent.
    sa = startSession(a, 11);
    setState(a, sa, XR_SESSION_STATE_FOCUSED);
    CHECK(a.endFrame(sa, &source.info) == XR_SUCCESS && RT[0].endCalls == callsA + 1);
    CHECK(RT[1].endCalls == callsB);
    CHECK(a.destroyInstance(a.instance) == XR_SUCCESS);
    CHECK(b.destroyInstance(b.instance) == XR_SUCCESS);
    CHECK(liveInstances() == 0);
}

void recreatedInstanceHandleReplacesStaleEntry() {
    Api first = bootstrap(kPackage, false, 0);
    (void)startSession(first, 11);
    // A runtime that reuses the instance handle without a destroy: the stale entry is replaced,
    // its sessions are dropped, and the new instance works on its own.
    Api second = bootstrap(kPackage, false, 0);
    CHECK(first.instance == second.instance && liveInstances() == 1);
    setEyesOf(0, -0.032f, 0.032f);
    XrSession session = startSession(second, 12);
    setState(second, session, XR_SESSION_STATE_FOCUSED);
    Source source = goldenSource(3, 0);
    CHECK(second.endFrame(session, &source.info) == XR_SUCCESS && R.lastInfo != &source.info);
    CHECK(second.destroyInstance(second.instance) == XR_SUCCESS && liveInstances() == 0);
}

void dispatchFailureBeforeSessionCreation() {
    // A missing core entry point leaves the instance a clean pass-through.
    for (const char* missing : {"xrLocateViews", "xrCreateReferenceSpace", "xrGetSystemProperties",
                                "xrDestroySpace"}) {
        Api api = bootstrap(kPackage, false, 0, missing);
        CHECK(liveInstances() == 1 && !instanceActive(api));
        // Not hooked: the application talks straight to the downstream runtime.
        CHECK(api.createSession == fakeCreateSession && api.endFrame == fakeEndFrame);
        XrSession session = startSession(api, 11);
        Source source = goldenSource(3, 0);
        CHECK(api.endFrame(session, &source.info) == XR_SUCCESS);
        CHECK(R.lastInfo == &source.info && R.locateCalls == 0 && R.lastSpace == nullptr);
        CHECK(api.destroySession(session) == XR_SUCCESS);
        CHECK(R.events.size() == 1 && R.events[0] == "destroySession");
        CHECK(api.destroyInstance(api.instance) == XR_SUCCESS);
        CHECK(R.destroyInstanceCalls == 1 && liveInstances() == 0);
    }
    for (const char* missing : {"xrCreateSession", "xrDestroySession", "xrEndFrame", "xrPollEvent"}) {
        Api api = bootstrap(kPackage, false, 0, missing);
        CHECK(liveInstances() == 1 && !instanceActive(api));
        CHECK(api.destroyInstance(api.instance) == XR_SUCCESS);
        CHECK(R.destroyInstanceCalls == 1 && R.events.size() == 1 && liveInstances() == 0);
    }
    // Without a downstream xrDestroyInstance the instance cannot be tracked: creation fails.
    RT[0] = Runtime{};
    RT[0].gipaFailName = "xrDestroyInstance";
    writeCmdline(kPackage);
    cmdlinePath = "stock_quad_cmdline_test.bin";
    XrNegotiateLoaderInfo loader{XR_LOADER_INTERFACE_STRUCT_LOADER_INFO};
    loader.maxInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    loader.maxApiVersion = XR_CURRENT_API_VERSION;
    XrNegotiateApiLayerRequest request{XR_LOADER_INTERFACE_STRUCT_API_LAYER_REQUEST};
    CHECK(xrNegotiateLoaderApiLayerInterface(&loader, kLayerName, &request) == XR_SUCCESS);
    XrApiLayerNextInfo nextInfo{XR_LOADER_INTERFACE_STRUCT_API_LAYER_NEXT_INFO};
    nextInfo.nextGetInstanceProcAddr = fakeGipaT<0>;
    nextInfo.nextCreateApiLayerInstance = fakeCreateLayerInstanceT<0>;
    XrApiLayerCreateInfo layerInfo{XR_LOADER_INTERFACE_STRUCT_API_LAYER_CREATE_INFO};
    layerInfo.nextInfo = &nextInfo;
    XrInstanceCreateInfo createInfo{XR_TYPE_INSTANCE_CREATE_INFO};
    XrInstance instance{};
    CHECK(request.createApiLayerInstance(&createInfo, &layerInfo, &instance) ==
          XR_ERROR_INITIALIZATION_FAILED);
    CHECK(instance == XR_NULL_HANDLE && liveInstances() == 0);
    // Malformed negotiation chains are rejected without touching global state.
    RT[0] = Runtime{};
    XrInstance out{};
    CHECK(request.createApiLayerInstance(nullptr, &layerInfo, &out) == XR_ERROR_INITIALIZATION_FAILED);
    CHECK(request.createApiLayerInstance(&createInfo, nullptr, &out) == XR_ERROR_INITIALIZATION_FAILED);
    CHECK(request.createApiLayerInstance(&createInfo, &layerInfo, nullptr) ==
          XR_ERROR_INITIALIZATION_FAILED);
    XrApiLayerCreateInfo noChain = layerInfo;
    noChain.nextInfo = nullptr;
    CHECK(request.createApiLayerInstance(&createInfo, &noChain, &out) == XR_ERROR_INITIALIZATION_FAILED);
    XrApiLayerNextInfo noGipa = nextInfo;
    noGipa.nextGetInstanceProcAddr = nullptr;
    layerInfo.nextInfo = &noGipa;
    CHECK(request.createApiLayerInstance(&createInfo, &layerInfo, &out) == XR_ERROR_INITIALIZATION_FAILED);
    XrApiLayerNextInfo noCreate = nextInfo;
    noCreate.nextCreateApiLayerInstance = nullptr;
    layerInfo.nextInfo = &noCreate;
    CHECK(request.createApiLayerInstance(&createInfo, &layerInfo, &out) == XR_ERROR_INITIALIZATION_FAILED);
    CHECK(liveInstances() == 0 && RT[0].events.empty());
}

void nullAndUnknownInstancesAreRejected() {
    Api api = bootstrap();
    PFN_xrVoidFunction f = reinterpret_cast<PFN_xrVoidFunction>(layerEndFrame);
    // Global (instance-less) lookups: only the layer's own entry point is answerable.
    CHECK(api.gipa(XR_NULL_HANDLE, "xrGetInstanceProcAddr", &f) == XR_SUCCESS && f);
    CHECK(api.gipa(XR_NULL_HANDLE, "xrEndFrame", &f) == XR_ERROR_HANDLE_INVALID && !f);
    f = reinterpret_cast<PFN_xrVoidFunction>(layerEndFrame);
    CHECK(api.gipa(reinterpret_cast<XrInstance>(uintptr_t{9999}), "xrEndFrame", &f) ==
          XR_ERROR_HANDLE_INVALID && !f);
    CHECK(api.gipa(api.instance, nullptr, &f) == XR_ERROR_VALIDATION_FAILURE);
    CHECK(api.gipa(api.instance, "xrEndFrame", nullptr) == XR_ERROR_VALIDATION_FAILURE);
    XrSessionCreateInfo createInfo{XR_TYPE_SESSION_CREATE_INFO};
    XrSession session{};
    XrEventDataBuffer buffer{XR_TYPE_EVENT_DATA_BUFFER};
    CHECK(layerCreateSession(XR_NULL_HANDLE, &createInfo, &session) == XR_ERROR_HANDLE_INVALID);
    CHECK(layerPollEvent(XR_NULL_HANDLE, &buffer) == XR_ERROR_HANDLE_INVALID);
    CHECK(layerDestroyInstance(XR_NULL_HANDLE) == XR_ERROR_HANDLE_INVALID);
    CHECK(layerDestroyInstance(reinterpret_cast<XrInstance>(uintptr_t{9999})) ==
          XR_ERROR_HANDLE_INVALID);
    CHECK(R.destroyInstanceCalls == 0 && R.endCalls == 0 && liveInstances() == 1);
    CHECK(api.destroyInstance(api.instance) == XR_SUCCESS && liveInstances() == 0);
}

void goldenThroughLayer() {
    Fixture f;
    // Left eye of the golden case 1 through the whole production path.
    R.eyes[0] = kGolden[1].eye;
    R.eyes[1] = kGolden[1].eye;
    R.eyes[1].position.x = 0.032f;
    Source source = goldenSource(2, 0);
    CHECK(f.api.endFrame(f.session, &source.info) == XR_SUCCESS);
    const auto* quad = reinterpret_cast<const XrCompositionLayerQuad*>(R.lastLayers[0]);
    constexpr double tol = 2e-5;
    CHECK_NEAR(quad->pose.orientation.x, kGolden[1].outQ.x, tol);
    CHECK_NEAR(quad->pose.orientation.w, kGolden[1].outQ.w, tol);
    CHECK_NEAR(quad->pose.position.x, kGolden[1].outP.x, tol);
    CHECK_NEAR(quad->pose.position.y, kGolden[1].outP.y, tol);
    CHECK_NEAR(quad->pose.position.z, kGolden[1].outP.z, tol);
    CHECK_NEAR(quad->size.width, kGolden[1].outSize.width, tol);
    CHECK_NEAR(quad->size.height, kGolden[1].outSize.height, tol);
}

}  // namespace

int main() {
    convertsBothLayouts();
    stockLayoutAndForeignShapesPassThrough();
    rejectedShapesForwardOriginalOnceAndRecover();
    layerCapRejectsOversizedAndUnknown();
    sessionStateGatesConversion();
    locateFailuresForwardOriginalOnce();
    persistentLocateFailureDisables();
    endFrameRejectionDisablesWithoutRetry();
    eyeCacheIsPerSession();
    viewSpaceLifecycle();
    packageGuardMakesLayerInert();
    steadyStateIsSilentAndAllocationFree();
    goldenThroughLayer();
    for (bool destroyFirstFirst : {true, false}) {
        for (bool sessionsFirst : {true, false}) twoInstancesInterleaved(destroyFirstFirst, sessionsFirst);
    }
    reusedSessionHandlesAcrossInstances();
    recreatedInstanceHandleReplacesStaleEntry();
    dispatchFailureBeforeSessionCreation();
    nullAndUnknownInstancesAreRejected();
    CHECK(liveInstances() == 0);
    std::remove("stock_quad_cmdline_test.bin");
    std::cout << "stock_quad_layer_tests passed\n";
    return 0;
}

#include <android/log.h>
#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <atomic>
#include <cstdio>
#include <cstring>
#include <map>
#include <memory>
#include <mutex>
#include <sstream>
#include <string>
#include <time.h>
#include <unistd.h>

#include "session_registry.h"
#include "stock_quad_core.h"

#define GXR_EXPORT extern "C" __attribute__((visibility("default")))

namespace {

// Experimental, default-off API layer. It reproduces the stock Steam Link 5002527 submission
// (four per-eye quads, no underside layer) from the projection layers older bases submit.
// It converts only fully verified shapes; everything else is forwarded to xrEndFrame untouched.

using namespace gxr::sq;

constexpr char kLayerName[] = "XR_APILAYER_local_GalaxyXR_stock_quad_v1";
constexpr char kModeName[] = "stock_quad_5002527_v1";
constexpr char kBuildId[] = "stock-quad-5002527-v1";
constexpr char kLogTag[] = "GXRStockQuad";
constexpr char kTargetPackage[] = "com.valvesoftware.steamlinkvr";
constexpr uint64_t kInitialDiagnosticFrames = 3;
constexpr uint32_t kMaxLocateFailures = 60;

struct Dispatch {
    XrInstance instance{XR_NULL_HANDLE};
    PFN_xrGetInstanceProcAddr getInstanceProcAddr{};
    PFN_xrDestroyInstance destroyInstance{};
    PFN_xrGetSystemProperties getSystemProperties{};
    PFN_xrCreateSession createSession{};
    PFN_xrDestroySession destroySession{};
    PFN_xrCreateReferenceSpace createReferenceSpace{};
    PFN_xrDestroySpace destroySpace{};
    PFN_xrLocateViews locateViews{};
    PFN_xrEndFrame endFrame{};
    PFN_xrPollEvent pollEvent{};
};

// One per XrInstance: its own downstream dispatch table. Nothing here is ever shared with,
// or overwritten by, another instance.
struct InstanceState {
    Dispatch d;
    bool active{};  // false: package guard or missing core entry points => pure pass-through
};
using InstancePtr = std::shared_ptr<InstanceState>;

struct SessionState {
    InstancePtr owner;  // the instance this session belongs to (dispatch + lifetime)
    XrSession session{XR_NULL_HANDLE};
    std::atomic<XrSessionState> state{XR_SESSION_STATE_UNKNOWN};
    uint32_t maxLayerCount{};
    XrSpace viewSpace{XR_NULL_HANDLE};
    // Everything below is touched only by the externally synchronized xrEndFrame /
    // xrDestroySession path of this session and is never shared with another session.
    bool disabled{};
    const char* disableReason{};
    bool eyeValid{};
    XrPosef eyes[2]{};
    uint32_t locateFailures{};
    uint32_t rejectLogged{};  // bit per Reject value
    uint64_t convertedFrames{};
    uint64_t passthroughFrames{};
    XrCompositionLayerQuad quads[kQuadCount]{};
};

// XrSession handles are unique among live sessions of a process, so one registry maps a
// session to its owning instance. Instances are looked up under a mutex only on lifecycle
// calls; the steady xrEndFrame path touches neither the map nor the mutex.
std::mutex instancesMutex;
std::map<XrInstance, InstancePtr> instances;
using Sessions = gxr::SessionRegistry<XrSession, SessionState>;
Sessions sessions;
thread_local Sessions::RenderCache renderSessionCache;
const char* cmdlinePath = "/proc/self/cmdline";  // overridable by host tests

uint64_t elapsedMs() {
    timespec value{};
    clock_gettime(CLOCK_BOOTTIME, &value);
    return static_cast<uint64_t>(value.tv_sec) * 1000ULL +
        static_cast<uint64_t>(value.tv_nsec) / 1000000ULL;
}

template <typename Handle>
uint64_t handleValue(Handle handle) {
    return static_cast<uint64_t>(reinterpret_cast<uintptr_t>(handle));
}

void emit(const char* event, const std::string& fields = {}) {
    std::ostringstream output;
    output << "{\"schema\":2,\"runId\":\"pid-" << getpid()
           << "\",\"source\":\"openxr\",\"mode\":\"" << kModeName
           << "\",\"buildId\":\"" << kBuildId
           << "\",\"elapsedMs\":" << elapsedMs()
           << ",\"event\":\"" << event << '"';
    if (!fields.empty()) output << ',' << fields;
    output << '}';
    __android_log_write(ANDROID_LOG_INFO, kLogTag, output.str().c_str());
}

template <typename Function>
bool load(const Dispatch& d, const char* name, Function& function) {
    PFN_xrVoidFunction address{};
    const XrResult result = d.getInstanceProcAddr(d.instance, name, &address);
    function = reinterpret_cast<Function>(address);
    return XR_SUCCEEDED(result) && function;
}

InstancePtr findInstance(XrInstance instance) {
    if (instance == XR_NULL_HANDLE) return nullptr;
    std::lock_guard<std::mutex> lock(instancesMutex);
    const auto iterator = instances.find(instance);
    return iterator == instances.end() ? nullptr : iterator->second;
}

// Only for a session handle we no longer track (already destroyed): with exactly one active
// instance its dispatch is unambiguous. With several instances there is no owner to ask.
InstancePtr soleActiveInstance() {
    std::lock_guard<std::mutex> lock(instancesMutex);
    InstancePtr found;
    for (const auto& entry : instances) {
        if (!entry.second->active) continue;
        if (found) return nullptr;
        found = entry.second;
    }
    return found;
}

bool isVisible(XrSessionState state) {
    return state == XR_SESSION_STATE_VISIBLE || state == XR_SESSION_STATE_FOCUSED;
}

bool processIsTarget() {
    char buffer[256]{};
    std::FILE* file = std::fopen(cmdlinePath, "rb");
    if (!file) return false;
    const size_t length = std::fread(buffer, 1, sizeof(buffer) - 1, file);
    std::fclose(file);
    return isTargetProcess(buffer, static_cast<uint32_t>(length), kTargetPackage);
}

void releaseSessionResources(SessionState& state) {
    XrSpace space = state.viewSpace;
    state.viewSpace = XR_NULL_HANDLE;
    if (space != XR_NULL_HANDLE && state.owner && state.owner->d.destroySpace) {
        state.owner->d.destroySpace(space);
    }
}

void disable(SessionState& state, const char* reason, XrResult result) {
    if (state.disabled) return;
    state.disabled = true;
    state.disableReason = reason;
    emit("stock_quad_disabled",
        "\"session\":" + std::to_string(handleValue(state.session)) +
        ",\"reason\":\"" + reason + "\",\"result\":" + std::to_string(result) +
        ",\"futureFramesPassThrough\":true");
}

// Eye-to-head offsets, located once in this session's own VIEW space and then cached.
bool ensureEyes(SessionState& state, XrTime displayTime) {
    if (state.eyeValid) return true;
    XrViewLocateInfo locate{XR_TYPE_VIEW_LOCATE_INFO};
    locate.viewConfigurationType = XR_VIEW_CONFIGURATION_TYPE_PRIMARY_STEREO;
    locate.displayTime = displayTime;
    locate.space = state.viewSpace;
    XrViewState viewState{XR_TYPE_VIEW_STATE};
    XrView views[2]{{XR_TYPE_VIEW}, {XR_TYPE_VIEW}};
    uint32_t count = 0;
    const XrResult result =
        state.owner->d.locateViews(state.session, &locate, &viewState, 2, &count, views);
    XrPosef located[2]{};
    if (XR_SUCCEEDED(result) &&
        validateLocatedEyes(viewState.viewStateFlags, count, views, located)) {
        state.eyes[0] = located[0];
        state.eyes[1] = located[1];
        state.eyeValid = true;
        const float dx = located[1].position.x - located[0].position.x;
        const float dy = located[1].position.y - located[0].position.y;
        const float dz = located[1].position.z - located[0].position.z;
        std::ostringstream fields;
        fields << "\"session\":" << handleValue(state.session)
               << ",\"displayTime\":" << displayTime
               << ",\"ipdMeters\":" << std::sqrt(dx * dx + dy * dy + dz * dz)
               << ",\"eyes\":[";
        for (int eye = 0; eye < 2; ++eye) {
            const XrPosef& p = located[eye];
            if (eye) fields << ',';
            fields << "{\"q\":[" << p.orientation.x << ',' << p.orientation.y << ','
                   << p.orientation.z << ',' << p.orientation.w << "],\"p\":["
                   << p.position.x << ',' << p.position.y << ',' << p.position.z << "]}";
        }
        fields << ']';
        emit("eye_offsets_located", fields.str());
        return true;
    }
    if (++state.locateFailures == 1) {
        emit("eye_locate_failed",
            "\"session\":" + std::to_string(handleValue(state.session)) +
            ",\"result\":" + std::to_string(result) +
            ",\"viewCount\":" + std::to_string(count) +
            ",\"viewStateFlags\":" + std::to_string(viewState.viewStateFlags));
    }
    if (state.locateFailures >= kMaxLocateFailures) {
        disable(state, "eye_locate_failed", result);
    }
    return false;
}

void logConvertedFrame(const SessionState& state, const XrFrameEndInfo& source,
                       const XrFrameEndInfo& output, const Plan& plan, uint64_t frame,
                       XrResult result) {
    std::ostringstream fields;
    fields << "\"session\":" << handleValue(state.session) << ",\"frame\":" << frame
           << ",\"layout\":\""
           << (plan.layout == Layout::ThreeProjection ? "3proj_drop_underside" : "2proj") << '"'
           << ",\"sourceLayerCount\":" << source.layerCount
           << ",\"sourceProjectionCount\":" << plan.sourceProjectionCount
           << ",\"tailLayerCount\":" << plan.tailCount
           << ",\"outputLayerCount\":" << output.layerCount
           << ",\"distance\":" << kQuadDistance << ",\"result\":" << result
           << ",\"quads\":[";
    for (uint32_t i = 0; i < kQuadCount; ++i) {
        const XrCompositionLayerQuad& q = state.quads[i];
        if (i) fields << ',';
        fields << "{\"swapchain\":" << handleValue(q.subImage.swapchain)
               << ",\"eye\":" << q.eyeVisibility << ",\"flags\":" << q.layerFlags
               << ",\"next\":" << handleValue(q.next)
               << ",\"rect\":[" << q.subImage.imageRect.offset.x << ','
               << q.subImage.imageRect.offset.y << ',' << q.subImage.imageRect.extent.width << ','
               << q.subImage.imageRect.extent.height << ']'
               << ",\"q\":[" << q.pose.orientation.x << ',' << q.pose.orientation.y << ','
               << q.pose.orientation.z << ',' << q.pose.orientation.w << "],\"p\":["
               << q.pose.position.x << ',' << q.pose.position.y << ',' << q.pose.position.z
               << "],\"size\":[" << q.size.width << ',' << q.size.height << "]}";
    }
    fields << ']';
    emit("stock_quad_frame", fields.str());
}

void logPassthroughOnce(SessionState& state, Reject reason, const XrFrameEndInfo* info) {
    const uint32_t bit = 1u << static_cast<uint32_t>(reason);
    if (state.rejectLogged & bit) return;
    state.rejectLogged |= bit;
    emit("stock_quad_passthrough",
        "\"session\":" + std::to_string(handleValue(state.session)) +
        ",\"reason\":\"" + rejectName(reason) + "\",\"sourceLayerCount\":" +
        std::to_string(info ? info->layerCount : 0) + ",\"changed\":false");
}

XrResult XRAPI_PTR layerCreateSession(
    XrInstance instance, const XrSessionCreateInfo* info, XrSession* session) {
    const InstancePtr owner = findInstance(instance);
    if (!owner) return XR_ERROR_HANDLE_INVALID;
    const Dispatch& d = owner->d;
    const XrResult result = d.createSession(instance, info, session);
    if (XR_FAILED(result) || !info || !session) return result;
    if (const auto existing = sessions.find(*session)) {
        if (existing->owner != owner) {
            // A live session of another instance already owns this handle value; ownership
            // could not be told apart later, so refuse to track instead of stealing it.
            emit("session_handle_collision",
                "\"session\":" + std::to_string(handleValue(*session)));
            return XR_ERROR_RUNTIME_FAILURE;
        }
    }
    auto state = std::make_shared<SessionState>();
    state->owner = owner;
    state->session = *session;
    XrSystemProperties properties{XR_TYPE_SYSTEM_PROPERTIES};
    const XrResult propertiesResult =
        d.getSystemProperties(instance, info->systemId, &properties);
    if (XR_SUCCEEDED(propertiesResult)) {
        state->maxLayerCount = properties.graphicsProperties.maxLayerCount;
    }
    XrReferenceSpaceCreateInfo spaceInfo{XR_TYPE_REFERENCE_SPACE_CREATE_INFO};
    spaceInfo.referenceSpaceType = XR_REFERENCE_SPACE_TYPE_VIEW;
    spaceInfo.poseInReferenceSpace.orientation.w = 1.0f;
    const XrResult spaceResult =
        d.createReferenceSpace(*session, &spaceInfo, &state->viewSpace);
    if (XR_FAILED(spaceResult)) {
        state->viewSpace = XR_NULL_HANDLE;
        disable(*state, "view_space_failed", spaceResult);
    }
    sessions.insert(*session, state);
    emit("session_created",
        "\"session\":" + std::to_string(handleValue(*session)) +
        ",\"instance\":" + std::to_string(handleValue(instance)) +
        ",\"systemPropertiesResult\":" + std::to_string(propertiesResult) +
        ",\"maxLayerCount\":" + std::to_string(state->maxLayerCount) +
        ",\"viewSpaceResult\":" + std::to_string(spaceResult));
    return result;
}

XrResult XRAPI_PTR layerDestroySession(XrSession session) {
    // Erase invalidates every thread's render cache. Our VIEW space is destroyed before the
    // downstream runtime tears the session down, through the owning instance's dispatch.
    const auto state = sessions.erase(session);
    const InstancePtr owner = state ? state->owner : soleActiveInstance();
    if (!owner) return XR_ERROR_HANDLE_INVALID;
    if (state) {
        emit("stock_quad_summary",
            "\"session\":" + std::to_string(handleValue(session)) +
            ",\"convertedFrames\":" + std::to_string(state->convertedFrames) +
            ",\"passthroughFrames\":" + std::to_string(state->passthroughFrames) +
            ",\"disabled\":" + (state->disabled ? std::string("true") : "false") +
            ",\"disableReason\":\"" + (state->disableReason ? state->disableReason : "") + '"');
        releaseSessionResources(*state);
    }
    return owner->d.destroySession(session);
}

XrResult XRAPI_PTR layerEndFrame(XrSession session, const XrFrameEndInfo* info) {
    auto* const state = sessions.findForFrame(session, renderSessionCache);
    if (!state) {
        // Unknown/destroyed handle: forward through the only unambiguous owner, if any.
        const InstancePtr owner = soleActiveInstance();
        return owner ? owner->d.endFrame(session, info) : XR_ERROR_HANDLE_INVALID;
    }
    // The state keeps its instance (and dispatch) alive until the session is destroyed.
    const Dispatch& d = state->owner->d;
    // Every path below calls the downstream xrEndFrame exactly once.
    if (state->disabled || !isVisible(state->state.load(std::memory_order_acquire))) {
        ++state->passthroughFrames;
        return d.endFrame(session, info);
    }
    Plan plan;
    const Reject rejected = planFrame(info, state->maxLayerCount, &plan);
    if (rejected != Reject::None) {
        ++state->passthroughFrames;
        logPassthroughOnce(*state, rejected, info);
        return d.endFrame(session, info);
    }
    if (!ensureEyes(*state, info->displayTime)) {
        ++state->passthroughFrames;
        return d.endFrame(session, info);
    }
    if (!buildQuads(plan, state->eyes, state->quads)) {
        ++state->passthroughFrames;
        logPassthroughOnce(*state, Reject::BadPose, info);
        return d.endFrame(session, info);
    }

    const XrCompositionLayerBaseHeader* layers[kMaxOutputLayers];
    for (uint32_t i = 0; i < kQuadCount; ++i) {
        layers[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&state->quads[i]);
    }
    for (uint32_t i = 0; i < plan.tailCount; ++i) {
        layers[kQuadCount + i] = info->layers[plan.tailStart + i];
    }
    XrFrameEndInfo output = *info;  // keeps next / displayTime / blend mode
    output.layerCount = plan.outputCount;
    output.layers = layers;
    const XrResult result = d.endFrame(session, &output);
    if (XR_FAILED(result)) {
        // Never submit this begun frame a second time: report the runtime's verdict and stand
        // down for the rest of the session.
        logConvertedFrame(*state, *info, output, plan, state->convertedFrames + 1, result);
        disable(*state, "end_frame_rejected", result);
        return result;
    }
    const uint64_t frame = ++state->convertedFrames;
    if (frame <= kInitialDiagnosticFrames) {
        logConvertedFrame(*state, *info, output, plan, frame, result);
    }
    return result;
}

XrResult XRAPI_PTR layerPollEvent(XrInstance instance, XrEventDataBuffer* data) {
    const InstancePtr owner = findInstance(instance);
    if (!owner) return XR_ERROR_HANDLE_INVALID;
    const XrResult result = owner->d.pollEvent(instance, data);
    if (result != XR_SUCCESS || !data) return result;
    if (data->type == XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED) {
        const auto* event = reinterpret_cast<const XrEventDataSessionStateChanged*>(data);
        // Only this instance's own sessions react to this instance's events.
        if (const auto state = sessions.find(event->session); state && state->owner == owner) {
            state->state.store(event->state, std::memory_order_release);
        }
    }
    return result;
}

XrResult XRAPI_PTR layerDestroyInstance(XrInstance instance) {
    const InstancePtr owner = findInstance(instance);
    if (!owner) return XR_ERROR_HANDLE_INVALID;
    // Only this instance's sessions are removed; other instances are untouched.
    const auto states = sessions.eraseIf([&](const SessionState& s) { return s.owner == owner; });
    for (const auto& state : states) releaseSessionResources(*state);
    emit("destroy_instance",
        "\"instance\":" + std::to_string(handleValue(instance)) +
        ",\"sessions\":" + std::to_string(states.size()));
    const XrResult result = owner->d.destroyInstance(instance);
    {
        std::lock_guard<std::mutex> lock(instancesMutex);
        const auto iterator = instances.find(instance);
        if (iterator != instances.end() && iterator->second == owner) instances.erase(iterator);
    }
    return result;
}

XrResult XRAPI_PTR layerGetInstanceProcAddr(
    XrInstance instance, const char* name, PFN_xrVoidFunction* function) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
    if (std::strcmp(name, "xrGetInstanceProcAddr") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerGetInstanceProcAddr);
        return XR_SUCCESS;
    }
    // Every other lookup belongs to one instance and is forwarded down that instance's own
    // chain. A null or unknown instance has no chain, so there is nothing to forward to.
    const InstancePtr owner = findInstance(instance);
    if (!owner) {
        *function = nullptr;
        return XR_ERROR_HANDLE_INVALID;
    }
    if (std::strcmp(name, "xrDestroyInstance") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerDestroyInstance);
    } else if (owner->active && std::strcmp(name, "xrCreateSession") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerCreateSession);
    } else if (owner->active && std::strcmp(name, "xrDestroySession") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerDestroySession);
    } else if (owner->active && std::strcmp(name, "xrEndFrame") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerEndFrame);
    } else if (owner->active && std::strcmp(name, "xrPollEvent") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerPollEvent);
    } else {
        return owner->d.getInstanceProcAddr(instance, name, function);
    }
    return XR_SUCCESS;
}

XrResult XRAPI_PTR layerCreateApiLayerInstance(
    const XrInstanceCreateInfo* createInfo, const XrApiLayerCreateInfo* layerInfo,
    XrInstance* instance) {
    if (!createInfo || !layerInfo || !layerInfo->nextInfo || !instance ||
        !layerInfo->nextInfo->nextGetInstanceProcAddr ||
        !layerInfo->nextInfo->nextCreateApiLayerInstance) {
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    XrApiLayerCreateInfo next = *layerInfo;
    next.nextInfo = layerInfo->nextInfo->next;
    const XrResult result =
        layerInfo->nextInfo->nextCreateApiLayerInstance(createInfo, &next, instance);
    if (XR_FAILED(result)) return result;
    if (*instance == XR_NULL_HANDLE) return XR_ERROR_INITIALIZATION_FAILED;

    auto owner = std::make_shared<InstanceState>();
    Dispatch& d = owner->d;
    d.instance = *instance;
    d.getInstanceProcAddr = layerInfo->nextInfo->nextGetInstanceProcAddr;
    if (!load(d, "xrDestroyInstance", d.destroyInstance)) {
        // Without a downstream destroy this instance can never be torn down cleanly.
        *instance = XR_NULL_HANDLE;
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    const bool targetPackage = processIsTarget();
    // Any missing core entry point leaves this instance as a pure pass-through; the application
    // keeps working and other instances are unaffected.
    const bool coreLoaded = targetPackage &&
        load(d, "xrGetSystemProperties", d.getSystemProperties) &&
        load(d, "xrCreateSession", d.createSession) &&
        load(d, "xrDestroySession", d.destroySession) &&
        load(d, "xrCreateReferenceSpace", d.createReferenceSpace) &&
        load(d, "xrDestroySpace", d.destroySpace) &&
        load(d, "xrLocateViews", d.locateViews) &&
        load(d, "xrEndFrame", d.endFrame) &&
        load(d, "xrPollEvent", d.pollEvent);
    owner->active = coreLoaded;
    {
        std::lock_guard<std::mutex> lock(instancesMutex);
        instances[*instance] = owner;  // a stale entry with a reused handle is replaced
    }
    // Sessions of a replaced stale instance can no longer be reached through its handle.
    sessions.eraseIf([&](const SessionState& s) {
        return s.owner != owner && s.owner->d.instance == owner->d.instance;
    });
    emit("layer_initialized",
        "\"layerName\":\"" + std::string(kLayerName) + "\",\"instance\":" +
        std::to_string(handleValue(*instance)) + ",\"targetPackage\":" +
        (targetPackage ? std::string("true") : "false") + ",\"active\":" +
        (owner->active ? std::string("true") : "false"));
    return XR_SUCCESS;
}

}  // namespace

GXR_EXPORT XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
    const XrNegotiateLoaderInfo* loaderInfo, const char* layerName,
    XrNegotiateApiLayerRequest* request) {
    if (!loaderInfo || !layerName || !request || std::strcmp(layerName, kLayerName) != 0) {
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    if (loaderInfo->maxInterfaceVersion < XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loaderInfo->maxApiVersion < XR_CURRENT_API_VERSION) {
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    request->layerInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion = XR_CURRENT_API_VERSION;
    request->getInstanceProcAddr = layerGetInstanceProcAddr;
    request->createApiLayerInstance = layerCreateApiLayerInstance;
    return XR_SUCCESS;
}

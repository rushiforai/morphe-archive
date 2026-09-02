#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <jni.h>
#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>
#include <openxr/openxr_platform.h>

#include <array>
#include <atomic>
#include <cstring>
#include <map>
#include <memory>
#include <mutex>
#include <optional>
#include <sstream>
#include <string>
#include <time.h>
#include <unistd.h>
#include <vector>

#define GXR_EXPORT extern "C" __attribute__((visibility("default")))

namespace {

// This API layer is intentionally append-only. Steam Link continues to render its
// native 3 projection layers (6 views) into Valve-owned swapchains. We neither sample
// nor rewrite those images. The only added composition work is a static 2x2 Android
// Surface quad that activates the Galaxy XR compositor path observed to retain full
// sharpness without SYSTEM_ALERT_WINDOW.

constexpr char kLayerName[] =
    "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1";
constexpr char kModeName[] = "android_surface_trigger_passthrough_v1";
constexpr char kBuildId[] = "android-surface-trigger-forced-probe-v1.1-20260901";
constexpr char kLogTag[] = "GXRSurfaceTrigger";
constexpr uint32_t kTriggerWidth = 2;
constexpr uint32_t kTriggerHeight = 2;
constexpr uint32_t kRequiredLayerCount = 4;
constexpr uint64_t kSummaryInterval = 900;

struct Dispatch {
    XrInstance instance{XR_NULL_HANDLE};
    PFN_xrGetInstanceProcAddr getInstanceProcAddr{};
    PFN_xrDestroyInstance destroyInstance{};
    PFN_xrEnumerateViewConfigurationViews enumerateViews{};
    PFN_xrGetSystemProperties getSystemProperties{};
    PFN_xrCreateSession createSession{};
    PFN_xrDestroySession destroySession{};
    PFN_xrCreateReferenceSpace createReferenceSpace{};
    PFN_xrDestroySpace destroySpace{};
    PFN_xrCreateSwapchain createSwapchain{};
    PFN_xrCreateSwapchainAndroidSurfaceKHR createAndroidSurfaceSwapchain{};
    PFN_xrDestroySwapchain destroySwapchain{};
    PFN_xrWaitFrame waitFrame{};
    PFN_xrEndFrame endFrame{};
    PFN_xrPollEvent pollEvent{};
};

struct SwapchainContract {
    // Retain the application's exact format for diagnostics only. In particular, a
    // future RGB10_A2 Valve swapchain passes through unchanged; this helper never
    // substitutes an 8-bit projection swapchain or converts projection pixels.
    int64_t format{};
    uint32_t width{};
    uint32_t height{};
};

struct SessionState {
    std::mutex mutex;
    XrSession session{XR_NULL_HANDLE};
    XrSessionState state{XR_SESSION_STATE_UNKNOWN};
    uint32_t maxLayerCount{};
    XrSpace viewSpace{XR_NULL_HANDLE};
    XrSwapchain surfaceSwapchain{XR_NULL_HANDLE};
    ANativeWindow* window{};
    bool bufferQueued{};
    bool triggerReady{};
    bool failureLogged{};
    uint64_t appendedFrames{};
};

Dispatch g;
JavaVM* applicationVm{};
bool extensionAdvertised{};
bool extensionEnabled{};
std::mutex sessionsMutex;
std::map<XrSession, std::shared_ptr<SessionState>> sessions;
std::mutex swapchainsMutex;
std::map<XrSwapchain, SwapchainContract> applicationSwapchains;
std::atomic<uint64_t> frameCounter{0};
std::atomic<uint64_t> waitCounter{0};

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

bool sample(uint64_t value) {
    return value <= 3 || value % kSummaryInterval == 0;
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
bool load(const char* name, Function& function) {
    PFN_xrVoidFunction address{};
    const XrResult result = g.getInstanceProcAddr(g.instance, name, &address);
    function = reinterpret_cast<Function>(address);
    return XR_SUCCEEDED(result) && function;
}

bool runtimeAdvertisesExtension(
    PFN_xrGetInstanceProcAddr getInstanceProcAddr,
    const char* extensionName
) {
    PFN_xrVoidFunction address{};
    if (!getInstanceProcAddr || XR_FAILED(getInstanceProcAddr(
            XR_NULL_HANDLE, "xrEnumerateInstanceExtensionProperties", &address)) || !address) {
        return false;
    }
    auto enumerate = reinterpret_cast<PFN_xrEnumerateInstanceExtensionProperties>(address);
    uint32_t count{};
    if (XR_FAILED(enumerate(nullptr, 0, &count, nullptr)) || count == 0) return false;
    std::vector<XrExtensionProperties> properties(count);
    for (auto& property : properties) property.type = XR_TYPE_EXTENSION_PROPERTIES;
    if (XR_FAILED(enumerate(nullptr, count, &count, properties.data()))) return false;
    for (const auto& property : properties) {
        if (std::strcmp(property.extensionName, extensionName) == 0) return true;
    }
    return false;
}

JavaVM* findApplicationVm(const XrInstanceCreateInfo* createInfo) {
    const auto* next = createInfo ?
        static_cast<const XrBaseInStructure*>(createInfo->next) : nullptr;
    for (uint32_t depth = 0; next && depth < 32; ++depth, next = next->next) {
        if (next->type == XR_TYPE_INSTANCE_CREATE_INFO_ANDROID_KHR) {
            const auto* androidInfo =
                reinterpret_cast<const XrInstanceCreateInfoAndroidKHR*>(next);
            return static_cast<JavaVM*>(androidInfo->applicationVM);
        }
    }
    return nullptr;
}

bool isVisible(XrSessionState state) {
    return state == XR_SESSION_STATE_VISIBLE || state == XR_SESSION_STATE_FOCUSED;
}

std::shared_ptr<SessionState> findSession(XrSession session) {
    std::lock_guard<std::mutex> lock(sessionsMutex);
    const auto iterator = sessions.find(session);
    return iterator != sessions.end() ? iterator->second : nullptr;
}

std::optional<SwapchainContract> findApplicationSwapchain(XrSwapchain swapchain) {
    std::lock_guard<std::mutex> lock(swapchainsMutex);
    const auto iterator = applicationSwapchains.find(swapchain);
    return iterator != applicationSwapchains.end() ?
        std::optional<SwapchainContract>(iterator->second) : std::nullopt;
}

void cleanupTrigger(SessionState& state) {
    ANativeWindow* window{};
    XrSwapchain surfaceSwapchain{XR_NULL_HANDLE};
    XrSpace viewSpace{XR_NULL_HANDLE};
    {
        std::lock_guard<std::mutex> lock(state.mutex);
        state.triggerReady = false;
        state.bufferQueued = false;
        window = state.window;
        state.window = nullptr;
        surfaceSwapchain = state.surfaceSwapchain;
        state.surfaceSwapchain = XR_NULL_HANDLE;
        viewSpace = state.viewSpace;
        state.viewSpace = XR_NULL_HANDLE;
    }
    if (window) ANativeWindow_release(window);
    if (surfaceSwapchain != XR_NULL_HANDLE && g.destroySwapchain) {
        g.destroySwapchain(surfaceSwapchain);
    }
    if (viewSpace != XR_NULL_HANDLE && g.destroySpace) g.destroySpace(viewSpace);
}

bool obtainNativeWindow(jobject surface, ANativeWindow*& window) {
    if (!applicationVm || !surface) return false;
    JNIEnv* environment{};
    bool attached = false;
    const jint getEnvironment = applicationVm->GetEnv(
        reinterpret_cast<void**>(&environment), JNI_VERSION_1_6);
    if (getEnvironment == JNI_EDETACHED) {
        if (applicationVm->AttachCurrentThread(&environment, nullptr) != JNI_OK) return false;
        attached = true;
    } else if (getEnvironment != JNI_OK || !environment) {
        return false;
    }
    window = ANativeWindow_fromSurface(environment, surface);
    environment->DeleteLocalRef(surface);
    if (attached) applicationVm->DetachCurrentThread();
    return window != nullptr;
}

bool createTrigger(SessionState& state) {
    if (!extensionEnabled || !g.createAndroidSurfaceSwapchain || !applicationVm ||
        state.maxLayerCount < kRequiredLayerCount) {
        emit("surface_trigger_unavailable",
            "\"session\":" + std::to_string(handleValue(state.session)) +
            ",\"extensionEnabled\":" + (extensionEnabled ? std::string("true") : "false") +
            ",\"hasCreateFunction\":" +
                (g.createAndroidSurfaceSwapchain ? std::string("true") : "false") +
            ",\"hasJavaVm\":" + (applicationVm ? std::string("true") : "false") +
            ",\"maxLayerCount\":" + std::to_string(state.maxLayerCount));
        return false;
    }

    XrReferenceSpaceCreateInfo spaceInfo{};
    spaceInfo.type = XR_TYPE_REFERENCE_SPACE_CREATE_INFO;
    spaceInfo.referenceSpaceType = XR_REFERENCE_SPACE_TYPE_VIEW;
    spaceInfo.poseInReferenceSpace.orientation.w = 1.0f;
    const XrResult spaceResult =
        g.createReferenceSpace(state.session, &spaceInfo, &state.viewSpace);
    if (XR_FAILED(spaceResult)) {
        emit("surface_trigger_create_result",
            "\"session\":" + std::to_string(handleValue(state.session)) +
            ",\"spaceResult\":" + std::to_string(spaceResult) +
            ",\"swapchainResult\":" + std::to_string(XR_ERROR_HANDLE_INVALID));
        cleanupTrigger(state);
        return false;
    }

    XrSwapchainCreateInfo swapchainInfo{};
    swapchainInfo.type = XR_TYPE_SWAPCHAIN_CREATE_INFO;
    swapchainInfo.createFlags = 0;
    swapchainInfo.usageFlags = XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
    // XR_KHR_android_surface_swapchain requires format/sample/face/array/mip to be 0.
    // This describes only the independent 2x2 trigger Surface. It does not constrain
    // or alter the format (sRGB8 today, potentially RGB10_A2 later) of Valve's views.
    swapchainInfo.format = 0;
    swapchainInfo.sampleCount = 0;
    swapchainInfo.width = kTriggerWidth;
    swapchainInfo.height = kTriggerHeight;
    swapchainInfo.faceCount = 0;
    swapchainInfo.arraySize = 0;
    swapchainInfo.mipCount = 0;
    jobject surface{};
    const XrResult swapchainResult = g.createAndroidSurfaceSwapchain(
        state.session, &swapchainInfo, &state.surfaceSwapchain, &surface);
    const bool windowReady = XR_SUCCEEDED(swapchainResult) &&
        state.surfaceSwapchain != XR_NULL_HANDLE && obtainNativeWindow(surface, state.window);
    emit("surface_trigger_create_result",
        "\"session\":" + std::to_string(handleValue(state.session)) +
        ",\"spaceResult\":" + std::to_string(spaceResult) +
        ",\"swapchainResult\":" + std::to_string(swapchainResult) +
        ",\"swapchain\":" + std::to_string(handleValue(state.surfaceSwapchain)) +
        ",\"width\":2,\"height\":2,\"usageFlags\":" +
            std::to_string(XR_SWAPCHAIN_USAGE_SAMPLED_BIT) +
        ",\"format\":0,\"sampleCount\":0," +
        "\"faceCount\":0,\"arraySize\":0,\"mipCount\":0," +
        "\"nativeWindowReady\":" + (windowReady ? std::string("true") : "false"));
    if (!windowReady) {
        cleanupTrigger(state);
        return false;
    }
    return true;
}

bool queueTriggerBuffer(SessionState& state) {
    bool queued = false;
    {
        std::lock_guard<std::mutex> lock(state.mutex);
        if (!state.window || state.bufferQueued || !isVisible(state.state)) return false;
        const int geometryResult = ANativeWindow_setBuffersGeometry(
            state.window, kTriggerWidth, kTriggerHeight, WINDOW_FORMAT_RGBA_8888);
        ANativeWindow_Buffer buffer{};
        const int lockResult = geometryResult == 0 ?
            ANativeWindow_lock(state.window, &buffer, nullptr) : geometryResult;
        int postResult = lockResult;
        const bool writableBuffer = lockResult == 0 && buffer.bits &&
            buffer.stride >= static_cast<int32_t>(kTriggerWidth);
        if (writableBuffer) {
            for (uint32_t y = 0; y < kTriggerHeight; ++y) {
                auto* row = static_cast<uint8_t*>(buffer.bits) +
                    static_cast<size_t>(y) * static_cast<size_t>(buffer.stride) * 4;
                for (uint32_t x = 0; x < kTriggerWidth; ++x) {
                    row[x * 4 + 0] = 0;
                    row[x * 4 + 1] = 0;
                    row[x * 4 + 2] = 0;
                    row[x * 4 + 3] = 1;
                }
            }
        }
        if (lockResult == 0) postResult = ANativeWindow_unlockAndPost(state.window);
        state.bufferQueued = geometryResult == 0 && writableBuffer && postResult == 0;
        state.triggerReady = state.bufferQueued;
        queued = state.bufferQueued;
        emit("surface_buffer_queued",
            "\"session\":" + std::to_string(handleValue(state.session)) +
            ",\"sessionState\":" + std::to_string(static_cast<int>(state.state)) +
            ",\"geometryResult\":" + std::to_string(geometryResult) +
            ",\"lockResult\":" + std::to_string(lockResult) +
            ",\"postResult\":" + std::to_string(postResult) +
            ",\"rgba\":[0,0,0,1],\"queued\":" +
                (state.bufferQueued ? std::string("true") : "false"));
    }
    if (!queued) cleanupTrigger(state);
    return queued;
}

bool valveThreeProjectionShape(const XrFrameEndInfo* info) {
    if (!info || info->type != XR_TYPE_FRAME_END_INFO || info->layerCount != 3 ||
        !info->layers) return false;
    for (uint32_t index = 0; index < 3; ++index) {
        const auto* base = info->layers[index];
        if (!base || base->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION) return false;
        const auto* projection =
            reinterpret_cast<const XrCompositionLayerProjection*>(base);
        if (projection->viewCount != 2 || !projection->views) return false;
    }
    return true;
}

std::string sourceFrameContract(const XrFrameEndInfo* info, uint64_t frame) {
    std::ostringstream output;
    output << "\"frame\":" << frame
           << ",\"sourceLayerCount\":3,\"sourceProjectionCount\":3,"
           << "\"sourceViewCount\":6,\"projections\":[";
    for (uint32_t layerIndex = 0; layerIndex < 3; ++layerIndex) {
        if (layerIndex) output << ',';
        const auto* projection = reinterpret_cast<const XrCompositionLayerProjection*>(
            info->layers[layerIndex]);
        output << "{\"layerIndex\":" << layerIndex
               << ",\"pointer\":" << handleValue(info->layers[layerIndex])
               << ",\"viewCount\":2,\"views\":[";
        for (uint32_t viewIndex = 0; viewIndex < 2; ++viewIndex) {
            if (viewIndex) output << ',';
            const auto& subImage = projection->views[viewIndex].subImage;
            const auto contract = findApplicationSwapchain(subImage.swapchain);
            output << "{\"viewIndex\":" << viewIndex
                   << ",\"swapchain\":" << handleValue(subImage.swapchain)
                   << ",\"format\":"
                   << (contract ? contract->format : 0)
                   << ",\"swapchainWidth\":"
                   << (contract ? contract->width : 0)
                   << ",\"swapchainHeight\":"
                   << (contract ? contract->height : 0)
                   << ",\"arrayIndex\":" << subImage.imageArrayIndex
                   << ",\"offsetX\":" << subImage.imageRect.offset.x
                   << ",\"offsetY\":" << subImage.imageRect.offset.y
                   << ",\"width\":" << subImage.imageRect.extent.width
                   << ",\"height\":" << subImage.imageRect.extent.height << '}';
        }
        output << "]}";
    }
    output << ']';
    return output.str();
}

XrResult XRAPI_PTR layerEnumerateViews(
    XrInstance instance,
    XrSystemId system,
    XrViewConfigurationType type,
    uint32_t capacity,
    uint32_t* count,
    XrViewConfigurationView* views
) {
    const XrResult result = g.enumerateViews(instance, system, type, capacity, count, views);
    if (XR_SUCCEEDED(result) && type == XR_VIEW_CONFIGURATION_TYPE_PRIMARY_STEREO &&
        count && views && capacity >= *count) {
        for (uint32_t eye = 0; eye < *count; ++eye) {
            emit("view_configuration_eye",
                "\"eye\":" + std::to_string(eye) +
                ",\"viewCount\":" + std::to_string(*count) +
                ",\"recommendedWidth\":" +
                    std::to_string(views[eye].recommendedImageRectWidth) +
                ",\"recommendedHeight\":" +
                    std::to_string(views[eye].recommendedImageRectHeight) +
                ",\"maxWidth\":" + std::to_string(views[eye].maxImageRectWidth) +
                ",\"maxHeight\":" + std::to_string(views[eye].maxImageRectHeight));
        }
    }
    return result;
}

XrResult XRAPI_PTR layerCreateSession(
    XrInstance instance,
    const XrSessionCreateInfo* info,
    XrSession* session
) {
    const XrResult result = g.createSession(instance, info, session);
    if (XR_FAILED(result) || !info || !session) return result;
    auto state = std::make_shared<SessionState>();
    state->session = *session;
    XrSystemProperties properties{};
    properties.type = XR_TYPE_SYSTEM_PROPERTIES;
    const XrResult propertiesResult =
        g.getSystemProperties(instance, info->systemId, &properties);
    if (XR_SUCCEEDED(propertiesResult)) {
        state->maxLayerCount = properties.graphicsProperties.maxLayerCount;
    }
    createTrigger(*state);
    {
        std::lock_guard<std::mutex> lock(sessionsMutex);
        sessions[*session] = state;
    }
    emit("session_created",
        "\"session\":" + std::to_string(handleValue(*session)) +
        ",\"result\":" + std::to_string(result) +
        ",\"systemPropertiesResult\":" + std::to_string(propertiesResult) +
        ",\"maxLayerCount\":" + std::to_string(state->maxLayerCount));
    return result;
}

XrResult XRAPI_PTR layerDestroySession(XrSession session) {
    std::shared_ptr<SessionState> state;
    {
        std::lock_guard<std::mutex> lock(sessionsMutex);
        const auto iterator = sessions.find(session);
        if (iterator != sessions.end()) {
            state = iterator->second;
            sessions.erase(iterator);
        }
    }
    if (state) {
        uint64_t appendedFrames{};
        {
            std::lock_guard<std::mutex> lock(state->mutex);
            appendedFrames = state->appendedFrames;
        }
        emit("surface_trigger_summary",
            "\"session\":" + std::to_string(handleValue(session)) +
            ",\"appendedFrames\":" + std::to_string(appendedFrames));
        cleanupTrigger(*state);
    }
    return g.destroySession(session);
}

XrResult XRAPI_PTR layerCreateSwapchain(
    XrSession session,
    const XrSwapchainCreateInfo* info,
    XrSwapchain* swapchain
) {
    const XrResult result = g.createSwapchain(session, info, swapchain);
    if (XR_SUCCEEDED(result) && info && swapchain && *swapchain != XR_NULL_HANDLE) {
        std::lock_guard<std::mutex> lock(swapchainsMutex);
        applicationSwapchains[*swapchain] = {info->format, info->width, info->height};
    }
    if (info) {
        emit("create_swapchain",
            "\"session\":" + std::to_string(handleValue(session)) +
            ",\"result\":" + std::to_string(result) +
            ",\"swapchain\":" + std::to_string(
                XR_SUCCEEDED(result) && swapchain ? handleValue(*swapchain) : 0) +
            ",\"format\":" + std::to_string(info->format) +
            ",\"width\":" + std::to_string(info->width) +
            ",\"height\":" + std::to_string(info->height) +
            ",\"androidSurfaceSwapchain\":false");
    }
    return result;
}

XrResult XRAPI_PTR layerDestroySwapchain(XrSwapchain swapchain) {
    const XrResult result = g.destroySwapchain(swapchain);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(swapchainsMutex);
        applicationSwapchains.erase(swapchain);
    }
    return result;
}

XrResult XRAPI_PTR layerWaitFrame(
    XrSession session,
    const XrFrameWaitInfo* info,
    XrFrameState* state
) {
    const XrResult result = g.waitFrame(session, info, state);
    const uint64_t wait = ++waitCounter;
    if (XR_FAILED(result) || sample(wait)) {
        emit("wait_frame",
            "\"session\":" + std::to_string(handleValue(session)) +
            ",\"wait\":" + std::to_string(wait) +
            ",\"result\":" + std::to_string(result) +
            (state ? ",\"shouldRender\":" +
                std::string(state->shouldRender ? "true" : "false") : std::string{}));
    }
    return result;
}

XrResult XRAPI_PTR layerEndFrame(XrSession session, const XrFrameEndInfo* info) {
    const uint64_t frame = ++frameCounter;
    const auto state = findSession(session);
    XrSessionState sessionState = XR_SESSION_STATE_UNKNOWN;
    XrSpace viewSpace = XR_NULL_HANDLE;
    XrSwapchain surfaceSwapchain = XR_NULL_HANDLE;
    bool triggerReady = false;
    if (state) {
        std::lock_guard<std::mutex> lock(state->mutex);
        sessionState = state->state;
        viewSpace = state->viewSpace;
        surfaceSwapchain = state->surfaceSwapchain;
        triggerReady = state->triggerReady;
    }
    const bool exactValveShape = valveThreeProjectionShape(info);
    const bool willAppend = state && triggerReady && isVisible(sessionState) && exactValveShape;
    if (sample(frame) && exactValveShape) {
        emit("surface_trigger_frame", sourceFrameContract(info, frame) +
            ",\"sessionState\":" + std::to_string(static_cast<int>(sessionState)) +
            ",\"outputLayerCount\":" + std::to_string(willAppend ? 4 : 3) +
            ",\"triggerTerminal\":" + (willAppend ? std::string("true") : "false"));
    }
    if (!willAppend) {
        if (sample(frame)) {
            emit("surface_trigger_passthrough",
                "\"session\":" + std::to_string(handleValue(session)) +
                ",\"frame\":" + std::to_string(frame) +
                ",\"sourceLayerCount\":" + std::to_string(info ? info->layerCount : 0) +
                ",\"triggerReady\":" +
                    (triggerReady ? std::string("true") : "false") +
                ",\"changed\":false,\"noCopy\":true,\"noReconstruction\":true");
        }
        return g.endFrame(session, info);
    }

    XrCompositionLayerQuad quad{};
    quad.type = XR_TYPE_COMPOSITION_LAYER_QUAD;
    quad.layerFlags = XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT;
    quad.space = viewSpace;
    quad.eyeVisibility = XR_EYE_VISIBILITY_BOTH;
    quad.subImage.swapchain = surfaceSwapchain;
    quad.subImage.imageRect = {{0, 0}, {static_cast<int32_t>(kTriggerWidth),
        static_cast<int32_t>(kTriggerHeight)}};
    quad.subImage.imageArrayIndex = 0;
    quad.pose.orientation.w = 1.0f;
    quad.pose.position.z = -1.0f;
    quad.size = {0.001f, 0.001f};

    // Preserve Valve's layer objects and order byte-for-byte. Appending the terminal
    // quad changes compositor topology from 3 to 4 layers, but it performs no image
    // reconstruction, resampling, blit, shader pass, or private stereo allocation.
    std::array<const XrCompositionLayerBaseHeader*, kRequiredLayerCount> layers{};
    for (uint32_t index = 0; index < 3; ++index) layers[index] = info->layers[index];
    layers[3] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(&quad);
    XrFrameEndInfo output = *info;
    output.layerCount = kRequiredLayerCount;
    output.layers = layers.data();
    const bool pointersPreserved = layers[0] == info->layers[0] &&
        layers[1] == info->layers[1] && layers[2] == info->layers[2];
    const XrResult result = g.endFrame(session, &output);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(state->mutex);
        ++state->appendedFrames;
    }
    if (sample(frame) || XR_FAILED(result)) {
        emit("surface_trigger_submission",
            "\"session\":" + std::to_string(handleValue(session)) +
            ",\"frame\":" + std::to_string(frame) +
            ",\"sourceLayerCount\":3,\"sourceProjectionCount\":3," +
            "\"sourceViewCount\":6,\"outputLayerCount\":4," +
            "\"submittedProjectionCount\":3,\"triggerQuadCount\":1," +
            "\"originalPointersPreserved\":" +
                (pointersPreserved ? std::string("true") : "false") +
            ",\"sourcePointer0\":" + std::to_string(handleValue(info->layers[0])) +
            ",\"sourcePointer1\":" + std::to_string(handleValue(info->layers[1])) +
            ",\"sourcePointer2\":" + std::to_string(handleValue(info->layers[2])) +
            ",\"noCopy\":true,\"noReconstruction\":true," +
            "\"quadWidthMeters\":0.001,\"quadHeightMeters\":0.001," +
            "\"quadDistanceMeters\":1.0,\"result\":" + std::to_string(result));
    }
    if (XR_FAILED(result)) {
        // xrEndFrame is not replayable. Return this frame's runtime error, disable the
        // trigger, and let later frames use Valve's untouched 3-layer submission.
        bool logFailure = false;
        {
            std::lock_guard<std::mutex> lock(state->mutex);
            state->triggerReady = false;
            if (!state->failureLogged) {
                state->failureLogged = true;
                logFailure = true;
            }
        }
        if (logFailure) {
            emit("surface_trigger_disabled",
                "\"session\":" + std::to_string(handleValue(session)) +
                ",\"reason\":\"end_frame_rejected\",\"result\":" +
                    std::to_string(result) +
                ",\"futureFramesFailOpen\":true");
        }
    }
    return result;
}

XrResult XRAPI_PTR layerPollEvent(XrInstance instance, XrEventDataBuffer* data) {
    const XrResult result = g.pollEvent(instance, data);
    if (XR_FAILED(result) || !data) return result;
    if (data->type == XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED) {
        const auto* event = reinterpret_cast<const XrEventDataSessionStateChanged*>(data);
        const auto state = findSession(event->session);
        bool shouldQueue = false;
        if (state) {
            {
                std::lock_guard<std::mutex> lock(state->mutex);
                state->state = event->state;
                shouldQueue = isVisible(event->state) && !state->bufferQueued && state->window;
            }
            if (shouldQueue) queueTriggerBuffer(*state);
        }
        bool triggerReady = false;
        if (state) {
            std::lock_guard<std::mutex> lock(state->mutex);
            triggerReady = state->triggerReady;
        }
        emit("session_state_changed",
            "\"session\":" + std::to_string(handleValue(event->session)) +
            ",\"state\":" + std::to_string(static_cast<int>(event->state)) +
            ",\"triggerReady\":" +
                (triggerReady ? std::string("true") : "false"));
    }
    return result;
}

XrResult XRAPI_PTR layerDestroyInstance(XrInstance instance) {
    std::vector<std::shared_ptr<SessionState>> states;
    {
        std::lock_guard<std::mutex> lock(sessionsMutex);
        for (auto& [session, state] : sessions) states.push_back(state);
        sessions.clear();
    }
    for (const auto& state : states) cleanupTrigger(*state);
    {
        std::lock_guard<std::mutex> lock(swapchainsMutex);
        applicationSwapchains.clear();
    }
    emit("destroy_instance");
    const XrResult result = g.destroyInstance(instance);
    g = {};
    applicationVm = nullptr;
    extensionAdvertised = false;
    extensionEnabled = false;
    frameCounter.store(0);
    waitCounter.store(0);
    return result;
}

XrResult XRAPI_PTR layerGetInstanceProcAddr(
    XrInstance instance,
    const char* name,
    PFN_xrVoidFunction* function
) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
#define ROUTE(n, f) if (std::strcmp(name, n) == 0) \
    *function = reinterpret_cast<PFN_xrVoidFunction>(f)
    ROUTE("xrGetInstanceProcAddr", layerGetInstanceProcAddr);
    else ROUTE("xrDestroyInstance", layerDestroyInstance);
    else ROUTE("xrEnumerateViewConfigurationViews", layerEnumerateViews);
    else ROUTE("xrCreateSession", layerCreateSession);
    else ROUTE("xrDestroySession", layerDestroySession);
    else ROUTE("xrCreateSwapchain", layerCreateSwapchain);
    else ROUTE("xrDestroySwapchain", layerDestroySwapchain);
    else ROUTE("xrWaitFrame", layerWaitFrame);
    else ROUTE("xrEndFrame", layerEndFrame);
    else ROUTE("xrPollEvent", layerPollEvent);
    else return g.getInstanceProcAddr ?
        g.getInstanceProcAddr(instance, name, function) : XR_ERROR_FUNCTION_UNSUPPORTED;
#undef ROUTE
    return XR_SUCCESS;
}

XrResult XRAPI_PTR layerCreateApiLayerInstance(
    const XrInstanceCreateInfo* createInfo,
    const XrApiLayerCreateInfo* layerInfo,
    XrInstance* instance
) {
    if (!createInfo || !layerInfo || !layerInfo->nextInfo || !instance) {
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    applicationVm = findApplicationVm(createInfo);
    bool appEnabled = false;
    for (uint32_t index = 0; index < createInfo->enabledExtensionCount; ++index) {
        if (std::strcmp(createInfo->enabledExtensionNames[index],
                XR_KHR_ANDROID_SURFACE_SWAPCHAIN_EXTENSION_NAME) == 0) {
            appEnabled = true;
            break;
        }
    }
    extensionAdvertised = runtimeAdvertisesExtension(
        layerInfo->nextInfo->nextGetInstanceProcAddr,
        XR_KHR_ANDROID_SURFACE_SWAPCHAIN_EXTENSION_NAME);
    // Android XR documentation lists this extension as supported, but Galaxy XR did
    // not enumerate it. The validated runtime nevertheless accepts it when requested.
    // Keep the guarded direct request for that exact behavior; if another runtime
    // rejects it, retry once with Valve's original create-info and change nothing.
    const bool forcedExtensionAttempt = !extensionAdvertised && !appEnabled;
    const bool appended = !appEnabled;
    std::vector<const char*> extensions;
    extensions.reserve(createInfo->enabledExtensionCount + (appended ? 1 : 0));
    for (uint32_t index = 0; index < createInfo->enabledExtensionCount; ++index) {
        extensions.push_back(createInfo->enabledExtensionNames[index]);
    }
    if (appended) extensions.push_back(XR_KHR_ANDROID_SURFACE_SWAPCHAIN_EXTENSION_NAME);
    XrInstanceCreateInfo patched = *createInfo;
    if (appended) {
        patched.enabledExtensionCount = static_cast<uint32_t>(extensions.size());
        patched.enabledExtensionNames = extensions.data();
    }
    XrApiLayerCreateInfo next = *layerInfo;
    next.nextInfo = layerInfo->nextInfo->next;
    XrResult result = layerInfo->nextInfo->nextCreateApiLayerInstance(
        appended ? &patched : createInfo, &next, instance);
    const XrResult extensionRequestResult = result;
    bool retriedWithoutExtension = false;
    if (XR_FAILED(result) && appended) {
        retriedWithoutExtension = true;
        result = layerInfo->nextInfo->nextCreateApiLayerInstance(createInfo, &next, instance);
    }
    if (XR_FAILED(result)) return result;

    extensionEnabled = appEnabled || (appended && !retriedWithoutExtension);
    g.instance = *instance;
    g.getInstanceProcAddr = layerInfo->nextInfo->nextGetInstanceProcAddr;
    const bool coreLoaded =
        load("xrDestroyInstance", g.destroyInstance) &&
        load("xrEnumerateViewConfigurationViews", g.enumerateViews) &&
        load("xrGetSystemProperties", g.getSystemProperties) &&
        load("xrCreateSession", g.createSession) &&
        load("xrDestroySession", g.destroySession) &&
        load("xrCreateReferenceSpace", g.createReferenceSpace) &&
        load("xrDestroySpace", g.destroySpace) &&
        load("xrCreateSwapchain", g.createSwapchain) &&
        load("xrDestroySwapchain", g.destroySwapchain) &&
        load("xrWaitFrame", g.waitFrame) &&
        load("xrEndFrame", g.endFrame) &&
        load("xrPollEvent", g.pollEvent);
    const bool surfaceFunctionLookupAttempted = extensionEnabled;
    const bool surfaceFunctionLoaded = surfaceFunctionLookupAttempted &&
        load("xrCreateSwapchainAndroidSurfaceKHR", g.createAndroidSurfaceSwapchain);
    if (!coreLoaded) {
        if (g.destroyInstance) g.destroyInstance(*instance);
        g = {};
        *instance = XR_NULL_HANDLE;
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    if (!surfaceFunctionLoaded) extensionEnabled = false;
    emit("layer_initialized",
        "\"layerName\":\"" + std::string(kLayerName) +
        "\",\"extensionAdvertised\":" +
            (extensionAdvertised ? std::string("true") : "false") +
        ",\"extensionAppEnabled\":" + (appEnabled ? std::string("true") : "false") +
        ",\"extensionAppended\":" + (appended ? std::string("true") : "false") +
        ",\"forcedExtensionAttempt\":" +
            (forcedExtensionAttempt ? std::string("true") : "false") +
        ",\"extensionRequestResult\":" + std::to_string(extensionRequestResult) +
        ",\"retriedWithoutExtension\":" +
            (retriedWithoutExtension ? std::string("true") : "false") +
        ",\"extensionEnabled\":" + (extensionEnabled ? std::string("true") : "false") +
        ",\"surfaceFunctionLookupAttempted\":" +
            (surfaceFunctionLookupAttempted ? std::string("true") : "false") +
        ",\"surfaceFunctionLoaded\":" +
            (surfaceFunctionLoaded ? std::string("true") : "false") +
        ",\"hasJavaVm\":" + (applicationVm ? std::string("true") : "false") +
        ",\"preservesValveProjectionLayers\":true," +
        "\"noCopy\":true,\"noReconstruction\":true");
    return XR_SUCCESS;
}

}  // namespace

GXR_EXPORT XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
    const XrNegotiateLoaderInfo* loaderInfo,
    const char* layerName,
    XrNegotiateApiLayerRequest* request
) {
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

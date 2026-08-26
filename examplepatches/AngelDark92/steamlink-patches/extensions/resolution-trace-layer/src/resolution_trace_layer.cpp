#include <android/log.h>
#include <EGL/egl.h>
#include <jni.h>
#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>
#include <openxr/openxr_platform.h>

#include <atomic>
#include <cinttypes>
#include <cstring>
#include <iomanip>
#include <mutex>
#include <sstream>
#include <string>
#include <time.h>
#include <unordered_map>
#include <unistd.h>
#include <vector>

#define GXR_EXPORT extern "C" __attribute__((visibility("default")))

#ifndef GXR_PROJECTION_MODE
#define GXR_PROJECTION_MODE 0
#endif
#ifndef GXR_LAYER_NAME
#define GXR_LAYER_NAME "XR_APILAYER_local_GalaxyXR_projection_trace_control"
#endif

namespace {

static_assert(GXR_PROJECTION_MODE >= 0 && GXR_PROJECTION_MODE <= 2,
              "GXR_PROJECTION_MODE must be control, quality, or stripped");

constexpr char kLayerName[] = GXR_LAYER_NAME;
constexpr char kLogTag[] = "GXRResolutionTrace";
constexpr XrCompositionLayerSettingsFlagsFB kQualityFlags =
    XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SUPER_SAMPLING_BIT_FB |
    XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SHARPENING_BIT_FB;

const char* modeName() {
    if constexpr (GXR_PROJECTION_MODE == 1) return "projection_settings_quality";
    if constexpr (GXR_PROJECTION_MODE == 2) return "projection_settings_stripped";
    return "projection_trace_control";
}

struct Dispatch {
    XrInstance instance{XR_NULL_HANDLE};
    PFN_xrGetInstanceProcAddr getInstanceProcAddr{nullptr};
    PFN_xrDestroyInstance destroyInstance{nullptr};
    PFN_xrEnumerateViewConfigurationViews enumerateViews{nullptr};
    PFN_xrCreateSwapchain createSwapchain{nullptr};
    PFN_xrDestroySwapchain destroySwapchain{nullptr};
    PFN_xrEndFrame endFrame{nullptr};
    PFN_xrPollEvent pollEvent{nullptr};
    PFN_xrWaitFrame waitFrame{nullptr};
    PFN_xrSyncActions syncActions{nullptr};
    PFN_xrGetActionStatePose getActionStatePose{nullptr};
    PFN_xrLocateSpace locateSpace{nullptr};
    PFN_xrUpdateSwapchainFB updateSwapchain{nullptr};
};

struct ChainHeader {
    XrStructureType type;
    const void* next;
};

Dispatch g_dispatch;
std::mutex g_mutex;
std::unordered_map<XrSwapchain, XrSwapchainCreateInfo> g_swapchains;
std::atomic<uint64_t> g_frameCount{0};
bool g_compositionSettingsEnabled{false};

bool shouldSampleFrame(uint64_t frame = g_frameCount.load()) {
    return frame <= 3 || (frame % 90) == 0;
}

std::string runId() { return "pid-" + std::to_string(getpid()); }

uint64_t elapsedMs() {
    timespec value{};
    clock_gettime(CLOCK_BOOTTIME, &value);
    return static_cast<uint64_t>(value.tv_sec) * 1000ULL +
           static_cast<uint64_t>(value.tv_nsec) / 1000000ULL;
}

std::string jsonString(const char* value) {
    std::ostringstream out;
    out << '"';
    for (const unsigned char c : std::string(value ? value : "")) {
        switch (c) {
            case '\\': out << "\\\\"; break;
            case '"': out << "\\\""; break;
            case '\n': out << "\\n"; break;
            case '\r': out << "\\r"; break;
            case '\t': out << "\\t"; break;
            default:
                if (c < 0x20) {
                    out << "\\u" << std::hex << std::setw(4) << std::setfill('0')
                        << static_cast<unsigned>(c) << std::dec;
                } else {
                    out << static_cast<char>(c);
                }
        }
    }
    out << '"';
    return out.str();
}

template <typename Handle>
uint64_t handleValue(Handle handle) {
    return static_cast<uint64_t>(reinterpret_cast<uintptr_t>(handle));
}

void emit(const char* event, const std::string& fields = {}) {
    std::ostringstream out;
    out << "{\"schema\":2,\"runId\":\"" << runId()
        << "\",\"source\":\"openxr\",\"mode\":\"" << modeName()
        << "\",\"elapsedMs\":" << elapsedMs()
        << ",\"event\":\"" << event << "\"";
    if (!fields.empty()) out << ',' << fields;
    out << '}';
    __android_log_write(ANDROID_LOG_INFO, kLogTag, out.str().c_str());
}

template <typename Function>
void load(const char* name, Function& function) {
    PFN_xrVoidFunction address = nullptr;
    if (g_dispatch.getInstanceProcAddr &&
        XR_SUCCEEDED(g_dispatch.getInstanceProcAddr(g_dispatch.instance, name, &address))) {
        function = reinterpret_cast<Function>(address);
    }
}

std::string chainTypes(const void* next) {
    std::ostringstream out;
    out << '[';
    const auto* node = static_cast<const ChainHeader*>(next);
    for (uint32_t i = 0; node && i < 64; ++i) {
        if (i) out << ',';
        out << static_cast<int64_t>(node->type);
        node = static_cast<const ChainHeader*>(node->next);
    }
    if (node) out << ",\"truncated\"";
    out << ']';
    return out.str();
}

struct SettingsScan {
    const XrCompositionLayerSettingsFB* first{nullptr};
    uint32_t count{0};
    bool firstAtHead{false};
    bool truncated{false};
};

SettingsScan scanSettings(const void* next) {
    SettingsScan scan;
    const auto* node = static_cast<const ChainHeader*>(next);
    for (uint32_t i = 0; node && i < 64; ++i) {
        if (node->type == XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB) {
            if (!scan.first) {
                scan.first = reinterpret_cast<const XrCompositionLayerSettingsFB*>(node);
                scan.firstAtHead = (i == 0);
            }
            ++scan.count;
        }
        node = static_cast<const ChainHeader*>(node->next);
    }
    scan.truncated = node != nullptr;
    return scan;
}

void appendPose(std::ostringstream& out, const XrPosef& pose) {
    out << "{\"orientation\":[" << pose.orientation.x << ',' << pose.orientation.y << ','
        << pose.orientation.z << ',' << pose.orientation.w << "],\"position\":["
        << pose.position.x << ',' << pose.position.y << ',' << pose.position.z << "]}";
}

void appendFov(std::ostringstream& out, const XrFovf& fov) {
    out << '[' << fov.angleLeft << ',' << fov.angleRight << ','
        << fov.angleUp << ',' << fov.angleDown << ']';
}

XrResult XRAPI_PTR traceDestroyInstance(XrInstance instance) {
    emit("destroy_instance");
    PFN_xrDestroyInstance next = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_mutex);
        next = g_dispatch.destroyInstance;
        g_swapchains.clear();
    }
    const XrResult result = next ? next(instance) : XR_ERROR_FUNCTION_UNSUPPORTED;
    std::lock_guard<std::mutex> lock(g_mutex);
    g_dispatch = {};
    g_compositionSettingsEnabled = false;
    return result;
}

XrResult XRAPI_PTR traceEnumerateViewConfigurationViews(
    XrInstance instance, XrSystemId systemId,
    XrViewConfigurationType viewConfigurationType, uint32_t capacity,
    uint32_t* count, XrViewConfigurationView* views) {
    const XrResult result = g_dispatch.enumerateViews(
        instance, systemId, viewConfigurationType, capacity, count, views);
    if (XR_SUCCEEDED(result) && count && views && capacity >= *count) {
        for (uint32_t i = 0; i < *count; ++i) {
            std::ostringstream fields;
            fields << "\"view\":" << i
                   << ",\"viewType\":" << static_cast<int>(viewConfigurationType)
                   << ",\"recommendedWidth\":" << views[i].recommendedImageRectWidth
                   << ",\"recommendedHeight\":" << views[i].recommendedImageRectHeight
                   << ",\"maxWidth\":" << views[i].maxImageRectWidth
                   << ",\"maxHeight\":" << views[i].maxImageRectHeight
                   << ",\"recommendedSamples\":" << views[i].recommendedSwapchainSampleCount
                   << ",\"maxSamples\":" << views[i].maxSwapchainSampleCount;
            emit("view_configuration", fields.str());
        }
    }
    return result;
}

XrResult XRAPI_PTR traceCreateSwapchain(
    XrSession session, const XrSwapchainCreateInfo* createInfo, XrSwapchain* swapchain) {
    const XrResult result = g_dispatch.createSwapchain(session, createInfo, swapchain);
    if (XR_SUCCEEDED(result) && createInfo && swapchain) {
        {
            std::lock_guard<std::mutex> lock(g_mutex);
            g_swapchains[*swapchain] = *createInfo;
        }
        std::ostringstream fields;
        fields << "\"swapchain\":" << handleValue(*swapchain)
               << ",\"width\":" << createInfo->width
               << ",\"height\":" << createInfo->height
               << ",\"arraySize\":" << createInfo->arraySize
               << ",\"sampleCount\":" << createInfo->sampleCount
               << ",\"faceCount\":" << createInfo->faceCount
               << ",\"mipCount\":" << createInfo->mipCount
               << ",\"format\":" << createInfo->format
               << ",\"usageFlags\":" << createInfo->usageFlags;
        emit("create_swapchain", fields.str());
    }
    return result;
}

XrResult XRAPI_PTR traceDestroySwapchain(XrSwapchain swapchain) {
    {
        std::lock_guard<std::mutex> lock(g_mutex);
        g_swapchains.erase(swapchain);
    }
    return g_dispatch.destroySwapchain(swapchain);
}

XrResult XRAPI_PTR tracePollEvent(XrInstance instance, XrEventDataBuffer* eventData) {
    const XrResult result = g_dispatch.pollEvent(instance, eventData);
    if (XR_SUCCEEDED(result) && eventData) {
        if (eventData->type == XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED) {
            const auto* changed = reinterpret_cast<const XrEventDataSessionStateChanged*>(eventData);
            std::ostringstream fields;
            fields << "\"session\":" << handleValue(changed->session)
                   << ",\"state\":" << static_cast<int>(changed->state)
                   << ",\"time\":" << changed->time;
            emit("session_state_changed", fields.str());
        } else if (eventData->type == XR_TYPE_EVENT_DATA_RECOMMENDED_RESOLUTION_CHANGED_ANDROID) {
            emit("recommended_resolution_changed");
        }
    }
    return result;
}

XrResult XRAPI_PTR traceWaitFrame(
    XrSession session, const XrFrameWaitInfo* frameWaitInfo, XrFrameState* frameState) {
    const XrResult result = g_dispatch.waitFrame(session, frameWaitInfo, frameState);
    std::ostringstream fields;
    fields << "\"session\":" << handleValue(session) << ",\"result\":" << result;
    if (XR_SUCCEEDED(result) && frameState) {
        fields << ",\"predictedDisplayTime\":" << frameState->predictedDisplayTime
               << ",\"predictedDisplayPeriod\":" << frameState->predictedDisplayPeriod
               << ",\"shouldRender\":" << (frameState->shouldRender ? "true" : "false");
    }
    if (shouldSampleFrame()) emit("wait_frame", fields.str());
    return result;
}

XrResult XRAPI_PTR traceSyncActions(
    XrSession session, const XrActionsSyncInfo* syncInfo) {
    const XrResult result = g_dispatch.syncActions(session, syncInfo);
    std::ostringstream fields;
    fields << "\"session\":" << handleValue(session)
           << ",\"activeActionSetCount\":" << (syncInfo ? syncInfo->countActiveActionSets : 0)
           << ",\"result\":" << result;
    if (shouldSampleFrame()) emit("sync_actions", fields.str());
    return result;
}

XrResult XRAPI_PTR traceGetActionStatePose(
    XrSession session, const XrActionStateGetInfo* getInfo, XrActionStatePose* state) {
    const XrResult result = g_dispatch.getActionStatePose(session, getInfo, state);
    std::ostringstream fields;
    fields << "\"session\":" << handleValue(session)
           << ",\"action\":" << (getInfo ? handleValue(getInfo->action) : 0)
           << ",\"subactionPath\":" << (getInfo ? getInfo->subactionPath : XR_NULL_PATH)
           << ",\"result\":" << result;
    if (XR_SUCCEEDED(result) && state) {
        fields << ",\"isActive\":" << (state->isActive ? "true" : "false");
    }
    if (shouldSampleFrame()) emit("action_state_pose", fields.str());
    return result;
}

XrResult XRAPI_PTR traceLocateSpace(
    XrSpace space, XrSpace baseSpace, XrTime time, XrSpaceLocation* location) {
    const XrResult result = g_dispatch.locateSpace(space, baseSpace, time, location);
    std::ostringstream fields;
    fields << "\"space\":" << handleValue(space)
           << ",\"baseSpace\":" << handleValue(baseSpace)
           << ",\"time\":" << time << ",\"result\":" << result;
    if (XR_SUCCEEDED(result) && location) {
        fields << ",\"locationFlags\":" << location->locationFlags << ",\"pose\":";
        appendPose(fields, location->pose);
    }
    if (shouldSampleFrame()) emit("locate_space", fields.str());
    return result;
}

XrResult XRAPI_PTR traceUpdateSwapchainFB(
    XrSwapchain swapchain, const XrSwapchainStateBaseHeaderFB* state) {
    const XrResult result = g_dispatch.updateSwapchain(swapchain, state);
    std::ostringstream fields;
    fields << "\"swapchain\":" << handleValue(swapchain)
           << ",\"stateType\":" << (state ? static_cast<int64_t>(state->type) : 0)
           << ",\"result\":" << result;
#ifdef XR_FB_swapchain_update_state_opengl_es
    if (state && state->type == XR_TYPE_SWAPCHAIN_STATE_SAMPLER_OPENGL_ES_FB) {
        const auto* sampler = reinterpret_cast<const XrSwapchainStateSamplerOpenGLESFB*>(state);
        fields << ",\"sampler\":{\"minFilter\":" << sampler->minFilter
               << ",\"magFilter\":" << sampler->magFilter
               << ",\"wrapS\":" << sampler->wrapModeS
               << ",\"wrapT\":" << sampler->wrapModeT
               << ",\"maxAnisotropy\":" << sampler->maxAnisotropy << '}';
    }
#endif
    emit("update_swapchain", fields.str());
    return result;
}

struct ModifiedFrame {
    XrFrameEndInfo info{};
    std::vector<const XrCompositionLayerBaseHeader*> layers;
    std::vector<XrCompositionLayerProjection> projections;
    std::vector<XrCompositionLayerSettingsFB> settings;
    bool changed{false};
};

ModifiedFrame makeModifiedFrame(const XrFrameEndInfo* source) {
    ModifiedFrame modified;
    if (!source || !source->layers || source->layerCount == 0) return modified;
    modified.info = *source;
    modified.layers.assign(source->layers, source->layers + source->layerCount);
    modified.projections.reserve(source->layerCount);
    modified.settings.reserve(source->layerCount);

    if constexpr (GXR_PROJECTION_MODE == 0) return modified;
    if constexpr (GXR_PROJECTION_MODE == 1) {
        if (!g_compositionSettingsEnabled) return modified;
    }

    for (uint32_t i = 0; i < source->layerCount; ++i) {
        const auto* base = source->layers[i];
        if (!base || base->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION) continue;
        const auto* projection = reinterpret_cast<const XrCompositionLayerProjection*>(base);
        const SettingsScan scan = scanSettings(projection->next);
        if (scan.truncated) {
            if (shouldSampleFrame()) emit("settings_transform_skipped", "\"layer\":" +
                 std::to_string(i) + ",\"reason\":\"chain_truncated\"");
            continue;
        }

        if constexpr (GXR_PROJECTION_MODE == 1) {
            if (scan.count > 1 || (scan.first && !scan.firstAtHead)) {
                if (shouldSampleFrame()) emit("settings_transform_skipped", "\"layer\":" +
                     std::to_string(i) + ",\"reason\":\"unsafe_chain\"");
                continue;
            }
            XrCompositionLayerSettingsFB replacement{XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB};
            replacement.next = scan.first ? scan.first->next : projection->next;
            replacement.layerFlags = kQualityFlags;
            modified.settings.push_back(replacement);
            modified.projections.push_back(*projection);
            modified.projections.back().next = &modified.settings.back();
        } else {
            if (!scan.first) continue;
            if (!scan.firstAtHead) {
                if (shouldSampleFrame()) emit("settings_transform_skipped", "\"layer\":" +
                     std::to_string(i) + ",\"reason\":\"unsafe_chain\"");
                continue;
            }
            const void* next = projection->next;
            while (next && static_cast<const ChainHeader*>(next)->type ==
                               XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB) {
                next = static_cast<const ChainHeader*>(next)->next;
            }
            if (scan.count > 1) {
                const SettingsScan remaining = scanSettings(next);
                if (remaining.first) {
                    if (shouldSampleFrame()) emit("settings_transform_skipped", "\"layer\":" +
                         std::to_string(i) + ",\"reason\":\"unsafe_chain\"");
                    continue;
                }
            }
            modified.projections.push_back(*projection);
            modified.projections.back().next = next;
        }
        modified.layers[i] = reinterpret_cast<const XrCompositionLayerBaseHeader*>(
            &modified.projections.back());
        modified.changed = true;
    }

    if (modified.changed) {
        modified.info.layers = modified.layers.data();
    }
    return modified;
}

std::string describeFrame(uint64_t frame, const XrFrameEndInfo* frameEndInfo,
                          bool modified) {
    std::ostringstream fields;
    fields << "\"frame\":" << frame
           << ",\"modified\":" << (modified ? "true" : "false")
           << ",\"displayTime\":" << (frameEndInfo ? frameEndInfo->displayTime : 0)
           << ",\"environmentBlendMode\":"
           << (frameEndInfo ? static_cast<int>(frameEndInfo->environmentBlendMode) : 0)
           << ",\"layerCount\":" << (frameEndInfo ? frameEndInfo->layerCount : 0)
           << ",\"projections\":[";
    bool comma = false;
    if (frameEndInfo && frameEndInfo->layers) {
        for (uint32_t layerIndex = 0; layerIndex < frameEndInfo->layerCount; ++layerIndex) {
            const auto* base = frameEndInfo->layers[layerIndex];
            if (!base || base->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION) continue;
            const auto* projection = reinterpret_cast<const XrCompositionLayerProjection*>(base);
            if (comma) fields << ',';
            comma = true;
            fields << "{\"order\":" << layerIndex
                   << ",\"flags\":" << projection->layerFlags
                   << ",\"space\":" << handleValue(projection->space)
                   << ",\"nextTypes\":" << chainTypes(projection->next);
            const SettingsScan scan = scanSettings(projection->next);
            fields << ",\"settingsFlags\":[";
            const auto* node = static_cast<const ChainHeader*>(projection->next);
            bool settingsComma = false;
            for (uint32_t chainIndex = 0; node && chainIndex < 64; ++chainIndex) {
                if (node->type == XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB) {
                    if (settingsComma) fields << ',';
                    settingsComma = true;
                    fields << reinterpret_cast<const XrCompositionLayerSettingsFB*>(node)->layerFlags;
                }
                node = static_cast<const ChainHeader*>(node->next);
            }
            fields << "],\"views\":[";
            for (uint32_t viewIndex = 0; viewIndex < projection->viewCount; ++viewIndex) {
                if (viewIndex) fields << ',';
                const auto& view = projection->views[viewIndex];
                fields << "{\"view\":" << viewIndex << ",\"pose\":";
                appendPose(fields, view.pose);
                fields << ",\"fov\":";
                appendFov(fields, view.fov);
                fields << ",\"swapchain\":" << handleValue(view.subImage.swapchain)
                       << ",\"rect\":[" << view.subImage.imageRect.offset.x << ','
                       << view.subImage.imageRect.offset.y << ','
                       << view.subImage.imageRect.extent.width << ','
                       << view.subImage.imageRect.extent.height << ']'
                       << ",\"arrayIndex\":" << view.subImage.imageArrayIndex << '}';
            }
            fields << "]}";
        }
    }
    fields << ']';
    return fields.str();
}

XrResult XRAPI_PTR traceEndFrame(XrSession session, const XrFrameEndInfo* frameEndInfo) {
    const uint64_t frame = ++g_frameCount;
    if constexpr (GXR_PROJECTION_MODE == 0) {
        const bool sampled = shouldSampleFrame(frame);
        if (sampled) emit("end_frame_submit", describeFrame(frame, frameEndInfo, false));
        const XrResult result = g_dispatch.endFrame(session, frameEndInfo);
        if (sampled) emit("end_frame_result", "\"frame\":" + std::to_string(frame) +
             ",\"result\":" + std::to_string(result));
        return result;
    }

    ModifiedFrame modified = makeModifiedFrame(frameEndInfo);
    const XrFrameEndInfo* submitted = modified.changed ? &modified.info : frameEndInfo;
    const bool sampled = shouldSampleFrame(frame);
    if (sampled) emit("end_frame_submit", describeFrame(frame, submitted, modified.changed));
    const XrResult result = g_dispatch.endFrame(session, submitted);
    if (sampled) emit("end_frame_result", "\"frame\":" + std::to_string(frame) +
         ",\"result\":" + std::to_string(result));
    return result;
}

XrResult XRAPI_PTR traceGetInstanceProcAddr(
    XrInstance instance, const char* name, PFN_xrVoidFunction* function) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
    if (std::strcmp(name, "xrGetInstanceProcAddr") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceGetInstanceProcAddr);
    else if (std::strcmp(name, "xrDestroyInstance") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceDestroyInstance);
    else if (std::strcmp(name, "xrEnumerateViewConfigurationViews") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceEnumerateViewConfigurationViews);
    else if (std::strcmp(name, "xrCreateSwapchain") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceCreateSwapchain);
    else if (std::strcmp(name, "xrDestroySwapchain") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceDestroySwapchain);
    else if (std::strcmp(name, "xrEndFrame") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceEndFrame);
    else if (std::strcmp(name, "xrPollEvent") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(tracePollEvent);
    else if (std::strcmp(name, "xrWaitFrame") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceWaitFrame);
    else if (std::strcmp(name, "xrSyncActions") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceSyncActions);
    else if (std::strcmp(name, "xrGetActionStatePose") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceGetActionStatePose);
    else if (std::strcmp(name, "xrLocateSpace") == 0)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceLocateSpace);
    else if (std::strcmp(name, "xrUpdateSwapchainFB") == 0 && g_dispatch.updateSwapchain)
        *function = reinterpret_cast<PFN_xrVoidFunction>(traceUpdateSwapchainFB);
    else
        return g_dispatch.getInstanceProcAddr
            ? g_dispatch.getInstanceProcAddr(instance, name, function)
            : XR_ERROR_FUNCTION_UNSUPPORTED;
    return XR_SUCCESS;
}

XrResult XRAPI_PTR traceCreateApiLayerInstance(
    const XrInstanceCreateInfo* instanceCreateInfo,
    const XrApiLayerCreateInfo* apiLayerInfo, XrInstance* instance) {
    if (!apiLayerInfo || !apiLayerInfo->nextInfo) return XR_ERROR_INITIALIZATION_FAILED;
    XrApiLayerCreateInfo nextInfo = *apiLayerInfo;
    nextInfo.nextInfo = apiLayerInfo->nextInfo->next;
    const XrResult result = apiLayerInfo->nextInfo->nextCreateApiLayerInstance(
        instanceCreateInfo, &nextInfo, instance);
    if (XR_FAILED(result)) return result;

    {
        std::lock_guard<std::mutex> lock(g_mutex);
        g_dispatch.instance = *instance;
        g_dispatch.getInstanceProcAddr = apiLayerInfo->nextInfo->nextGetInstanceProcAddr;
        load("xrDestroyInstance", g_dispatch.destroyInstance);
        load("xrEnumerateViewConfigurationViews", g_dispatch.enumerateViews);
        load("xrCreateSwapchain", g_dispatch.createSwapchain);
        load("xrDestroySwapchain", g_dispatch.destroySwapchain);
        load("xrEndFrame", g_dispatch.endFrame);
        load("xrPollEvent", g_dispatch.pollEvent);
        load("xrWaitFrame", g_dispatch.waitFrame);
        load("xrSyncActions", g_dispatch.syncActions);
        load("xrGetActionStatePose", g_dispatch.getActionStatePose);
        load("xrLocateSpace", g_dispatch.locateSpace);
        load("xrUpdateSwapchainFB", g_dispatch.updateSwapchain);
    }

    std::ostringstream extensions;
    extensions << '[';
    g_compositionSettingsEnabled = false;
    if (instanceCreateInfo) {
        for (uint32_t i = 0; i < instanceCreateInfo->enabledExtensionCount; ++i) {
            if (i) extensions << ',';
            const char* extension = instanceCreateInfo->enabledExtensionNames[i];
            extensions << jsonString(extension);
            if (extension && std::strcmp(extension,
                    XR_FB_COMPOSITION_LAYER_SETTINGS_EXTENSION_NAME) == 0) {
                g_compositionSettingsEnabled = true;
            }
        }
    }
    extensions << ']';
    emit("layer_initialized", "\"layerName\":" + jsonString(kLayerName) +
         ",\"enabledExtensions\":" + extensions.str() +
         ",\"compositionSettingsEnabled\":" +
         (g_compositionSettingsEnabled ? std::string("true") : std::string("false")));
    return XR_SUCCESS;
}

}  // namespace

GXR_EXPORT XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
    const XrNegotiateLoaderInfo* loaderInfo, const char* layerName,
    XrNegotiateApiLayerRequest* request) {
    if (!loaderInfo || !layerName || !request || std::strcmp(layerName, kLayerName) != 0)
        return XR_ERROR_INITIALIZATION_FAILED;
    if (loaderInfo->maxInterfaceVersion < XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loaderInfo->maxApiVersion < XR_CURRENT_API_VERSION)
        return XR_ERROR_INITIALIZATION_FAILED;
    request->layerInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion = XR_CURRENT_API_VERSION;
    request->getInstanceProcAddr = traceGetInstanceProcAddr;
    request->createApiLayerInstance = traceCreateApiLayerInstance;
    return XR_SUCCESS;
}

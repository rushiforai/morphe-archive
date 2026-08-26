#include "velocity_math.h"

#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <cstring>
#include <mutex>
#include <string>
#include <unordered_map>

#if defined(__ANDROID__)
#include <android/log.h>
#define GXR_LOG(...) __android_log_print(ANDROID_LOG_INFO, "GxrVelocity", __VA_ARGS__)
#else
#define GXR_LOG(...) ((void)0)
#endif

#if defined(_WIN32)
#define GXR_EXPORT extern "C" __declspec(dllexport)
#define GXR_USED
#else
#define GXR_EXPORT extern "C" __attribute__((visibility("default")))
#define GXR_USED __attribute__((used))
#endif

namespace {

constexpr char LAYER_NAME[] = "XR_APILAYER_local_GalaxyXR_controller_velocity";

struct ConfigBlob {
    char magic[16];
    std::uint32_t version;
    std::int64_t minDeltaNs;
    std::int64_t maxDeltaNs;
    float maxLinearSpeed;
    float maxAngularSpeed;
    float smoothing;
    std::uint32_t checksum;
};

GXR_USED ConfigBlob CONFIG = {
    {'G', 'X', 'R', 'V', 'E', 'L', 'C', 'F', 'G', '0', '0', '0', '0', '0', '0', '1'},
    1,
    1'000'000,
    50'000'000,
    20.0F,
    50.0F,
    0.0F,
    0,
};

enum class SpaceKind { Controller, Other };

struct HistoryKey {
    XrSpace space;
    XrSpace baseSpace;

    bool operator==(const HistoryKey& other) const {
        return space == other.space && baseSpace == other.baseSpace;
    }
};

struct HistoryKeyHash {
    std::size_t operator()(const HistoryKey& key) const {
        return std::hash<std::uintptr_t>{}(reinterpret_cast<std::uintptr_t>(key.space)) ^
            (std::hash<std::uintptr_t>{}(reinterpret_cast<std::uintptr_t>(key.baseSpace)) << 1U);
    }
};

struct InstanceState {
    XrInstance instance = XR_NULL_HANDLE;
    PFN_xrGetInstanceProcAddr getInstanceProcAddr = nullptr;
    PFN_xrDestroyInstance destroyInstance = nullptr;
    PFN_xrCreateAction createAction = nullptr;
    PFN_xrDestroyAction destroyAction = nullptr;
    PFN_xrSuggestInteractionProfileBindings suggestBindings = nullptr;
    PFN_xrCreateActionSpace createActionSpace = nullptr;
    PFN_xrDestroySpace destroySpace = nullptr;
    PFN_xrLocateSpace locateSpace = nullptr;
    PFN_xrPathToString pathToString = nullptr;
};

std::mutex STATE_MUTEX;
InstanceState STATE;
std::unordered_map<XrAction, bool> POSE_ACTIONS;
std::unordered_map<XrAction, SpaceKind> ACTION_KINDS;
std::unordered_map<XrSpace, SpaceKind> SPACE_KINDS;
std::unordered_map<HistoryKey, gxr::PoseSample, HistoryKeyHash> HISTORIES;
std::unordered_map<HistoryKey, gxr::Velocity, HistoryKeyHash> SMOOTHED_VELOCITIES;

bool controllerBinding(XrPath path) {
    if (!STATE.pathToString) return false;
    char buffer[XR_MAX_PATH_LENGTH]{};
    std::uint32_t count = 0;
    if (XR_FAILED(STATE.pathToString(STATE.instance, path, sizeof(buffer), &count, buffer))) return false;
    const std::string value(buffer);
    const bool hand = value.find("/user/hand/left/") != std::string::npos ||
        value.find("/user/hand/right/") != std::string::npos;
    const bool pose = value.find("/input/grip/pose") != std::string::npos ||
        value.find("/input/aim/pose") != std::string::npos;
    return hand && pose;
}

XrSpaceVelocity* velocityInChain(XrSpaceLocation* location) {
    auto* next = reinterpret_cast<XrBaseOutStructure*>(location->next);
    while (next) {
        if (next->type == XR_TYPE_SPACE_VELOCITY) return reinterpret_cast<XrSpaceVelocity*>(next);
        next = next->next;
    }
    return nullptr;
}

gxr::PoseSample poseSample(XrTime time, const XrPosef& pose) {
    return {
        time,
        {pose.position.x, pose.position.y, pose.position.z},
        {pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w},
    };
}

template <typename T>
void loadFunction(const char* name, T& function) {
    STATE.getInstanceProcAddr(STATE.instance, name, reinterpret_cast<PFN_xrVoidFunction*>(&function));
}

XrResult XRAPI_PTR layerDestroyInstance(XrInstance instance) {
    PFN_xrDestroyInstance next = nullptr;
    {
        std::lock_guard<std::mutex> lock(STATE_MUTEX);
        next = STATE.destroyInstance;
        POSE_ACTIONS.clear();
        ACTION_KINDS.clear();
        SPACE_KINDS.clear();
        HISTORIES.clear();
        SMOOTHED_VELOCITIES.clear();
        STATE = {};
    }
    return next(instance);
}

XrResult XRAPI_PTR layerCreateAction(
    XrActionSet actionSet,
    const XrActionCreateInfo* createInfo,
    XrAction* action
) {
    const XrResult result = STATE.createAction(actionSet, createInfo, action);
    if (XR_SUCCEEDED(result) && createInfo->actionType == XR_ACTION_TYPE_POSE_INPUT) {
        std::lock_guard<std::mutex> lock(STATE_MUTEX);
        POSE_ACTIONS[*action] = true;
    }
    return result;
}

XrResult XRAPI_PTR layerDestroyAction(XrAction action) {
    const XrResult result = STATE.destroyAction(action);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(STATE_MUTEX);
        POSE_ACTIONS.erase(action);
        ACTION_KINDS.erase(action);
    }
    return result;
}

XrResult XRAPI_PTR layerSuggestInteractionProfileBindings(
    XrInstance instance,
    const XrInteractionProfileSuggestedBinding* suggestedBindings
) {
    const XrResult result = STATE.suggestBindings(instance, suggestedBindings);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(STATE_MUTEX);
        for (std::uint32_t i = 0; i < suggestedBindings->countSuggestedBindings; ++i) {
            const XrActionSuggestedBinding& binding = suggestedBindings->suggestedBindings[i];
            if (POSE_ACTIONS.count(binding.action) != 0 && controllerBinding(binding.binding)) {
                ACTION_KINDS[binding.action] = SpaceKind::Controller;
            }
        }
    }
    return result;
}

XrResult XRAPI_PTR layerCreateActionSpace(
    XrSession session,
    const XrActionSpaceCreateInfo* createInfo,
    XrSpace* space
) {
    const XrResult result = STATE.createActionSpace(session, createInfo, space);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(STATE_MUTEX);
        const auto found = ACTION_KINDS.find(createInfo->action);
        if (found != ACTION_KINDS.end()) SPACE_KINDS[*space] = found->second;
    }
    return result;
}

XrResult XRAPI_PTR layerDestroySpace(XrSpace space) {
    const XrResult result = STATE.destroySpace(space);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(STATE_MUTEX);
        SPACE_KINDS.erase(space);
        for (auto it = HISTORIES.begin(); it != HISTORIES.end();) {
            if (it->first.space == space || it->first.baseSpace == space) it = HISTORIES.erase(it);
            else ++it;
        }
        for (auto it = SMOOTHED_VELOCITIES.begin(); it != SMOOTHED_VELOCITIES.end();) {
            if (it->first.space == space || it->first.baseSpace == space) {
                it = SMOOTHED_VELOCITIES.erase(it);
            } else {
                ++it;
            }
        }
    }
    return result;
}

XrResult XRAPI_PTR layerLocateSpace(
    XrSpace space,
    XrSpace baseSpace,
    XrTime time,
    XrSpaceLocation* location
) {
    const XrResult result = STATE.locateSpace(space, baseSpace, time, location);
    if (XR_FAILED(result)) return result;

    constexpr XrSpaceLocationFlags REQUIRED =
        XR_SPACE_LOCATION_POSITION_VALID_BIT | XR_SPACE_LOCATION_ORIENTATION_VALID_BIT;
    XrSpaceVelocity* runtimeVelocity = velocityInChain(location);

    std::lock_guard<std::mutex> lock(STATE_MUTEX);
    if (SPACE_KINDS.count(space) == 0 || runtimeVelocity == nullptr) return result;

    const HistoryKey key{space, baseSpace};
    if ((location->locationFlags & REQUIRED) != REQUIRED) {
        HISTORIES.erase(key);
        SMOOTHED_VELOCITIES.erase(key);
        return result;
    }

    const gxr::PoseSample current = poseSample(time, location->pose);
    const auto previous = HISTORIES.find(key);
    const bool hasPrevious = previous != HISTORIES.end();
    const gxr::PoseSample previousSample = hasPrevious ? previous->second : gxr::PoseSample{};
    HISTORIES[key] = current;
    if (!hasPrevious) return result;

    const gxr::EstimatorConfig config{
        CONFIG.minDeltaNs,
        CONFIG.maxDeltaNs,
        CONFIG.maxLinearSpeed,
        CONFIG.maxAngularSpeed,
    };
    gxr::Velocity derived{};
    if (!gxr::deriveVelocity(previousSample, current, config, derived)) {
        SMOOTHED_VELOCITIES.erase(key);
        return result;
    }

    const auto smoothed = SMOOTHED_VELOCITIES.find(key);
    if (CONFIG.smoothing > 0.0F && smoothed != SMOOTHED_VELOCITIES.end()) {
        const float previousWeight = CONFIG.smoothing;
        const float currentWeight = 1.0F - previousWeight;
        derived.linear = {
            smoothed->second.linear.x * previousWeight + derived.linear.x * currentWeight,
            smoothed->second.linear.y * previousWeight + derived.linear.y * currentWeight,
            smoothed->second.linear.z * previousWeight + derived.linear.z * currentWeight,
        };
        derived.angular = {
            smoothed->second.angular.x * previousWeight + derived.angular.x * currentWeight,
            smoothed->second.angular.y * previousWeight + derived.angular.y * currentWeight,
            smoothed->second.angular.z * previousWeight + derived.angular.z * currentWeight,
        };
    }
    SMOOTHED_VELOCITIES[key] = derived;

    runtimeVelocity->linearVelocity = {derived.linear.x, derived.linear.y, derived.linear.z};
    runtimeVelocity->angularVelocity = {derived.angular.x, derived.angular.y, derived.angular.z};
    runtimeVelocity->velocityFlags =
        XR_SPACE_VELOCITY_LINEAR_VALID_BIT | XR_SPACE_VELOCITY_ANGULAR_VALID_BIT;
    return result;
}

XrResult XRAPI_PTR layerGetInstanceProcAddr(
    XrInstance instance,
    const char* name,
    PFN_xrVoidFunction* function
) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
    if (std::strcmp(name, "xrGetInstanceProcAddr") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerGetInstanceProcAddr);
        return XR_SUCCESS;
    }
    if (std::strcmp(name, "xrDestroyInstance") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerDestroyInstance);
    else if (std::strcmp(name, "xrCreateAction") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerCreateAction);
    else if (std::strcmp(name, "xrDestroyAction") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerDestroyAction);
    else if (std::strcmp(name, "xrSuggestInteractionProfileBindings") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerSuggestInteractionProfileBindings);
    else if (std::strcmp(name, "xrCreateActionSpace") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerCreateActionSpace);
    else if (std::strcmp(name, "xrDestroySpace") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerDestroySpace);
    else if (std::strcmp(name, "xrLocateSpace") == 0) *function = reinterpret_cast<PFN_xrVoidFunction>(layerLocateSpace);
    else {
        if (!STATE.getInstanceProcAddr) {
            *function = nullptr;
            return XR_ERROR_FUNCTION_UNSUPPORTED;
        }
        return STATE.getInstanceProcAddr(instance, name, function);
    }
    return XR_SUCCESS;
}

XrResult XRAPI_PTR layerCreateApiLayerInstance(
    const XrInstanceCreateInfo* instanceCreateInfo,
    const XrApiLayerCreateInfo* apiLayerInfo,
    XrInstance* instance
) {
    if (!apiLayerInfo || !apiLayerInfo->nextInfo) return XR_ERROR_INITIALIZATION_FAILED;
    XrApiLayerCreateInfo nextInfo = *apiLayerInfo;
    nextInfo.nextInfo = apiLayerInfo->nextInfo->next;
    const XrResult result = apiLayerInfo->nextInfo->nextCreateApiLayerInstance(
        instanceCreateInfo,
        &nextInfo,
        instance
    );
    if (XR_FAILED(result)) return result;

    std::lock_guard<std::mutex> lock(STATE_MUTEX);
    STATE.instance = *instance;
    STATE.getInstanceProcAddr = apiLayerInfo->nextInfo->nextGetInstanceProcAddr;
    loadFunction("xrDestroyInstance", STATE.destroyInstance);
    loadFunction("xrCreateAction", STATE.createAction);
    loadFunction("xrDestroyAction", STATE.destroyAction);
    loadFunction("xrSuggestInteractionProfileBindings", STATE.suggestBindings);
    loadFunction("xrCreateActionSpace", STATE.createActionSpace);
    loadFunction("xrDestroySpace", STATE.destroySpace);
    loadFunction("xrLocateSpace", STATE.locateSpace);
    loadFunction("xrPathToString", STATE.pathToString);
    GXR_LOG("controller velocity layer initialized");
    return XR_SUCCESS;
}

}  // namespace

GXR_EXPORT XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
    const XrNegotiateLoaderInfo* loaderInfo,
    const char* layerName,
    XrNegotiateApiLayerRequest* request
) {
    if (!loaderInfo || !layerName || !request || std::strcmp(layerName, LAYER_NAME) != 0) {
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
#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <android/log.h>
#include <dlfcn.h>
#include <sys/system_properties.h>

#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <mutex>
#include <unordered_set>

#define GXR_LOG(...) __android_log_print(ANDROID_LOG_INFO, "GxrVelocityFrame", __VA_ARGS__)

namespace {

constexpr char LAYER_NAME[] = "XR_APILAYER_local_GalaxyXR_controller_velocity_frame";

// VRLink streams the controllers from this pose action (bound to the controller grip pose).
constexpr char STREAM_POSE_ACTION[] = "pamir-stream-pose";

// The Galaxy XR runtime reports the controller's linear and angular velocity in a frame attached
// to the controller, pitched against the grip pose, instead of in the base space. VRLink forwards
// both unchanged: SteamVR reads the linear one as a world vector and the angular one as local to
// the streamed pose. Measured on the PC side against the motion of the streamed positions
// (2026-10-04): both sit about 42 degrees of pitch away from the streamed pose's frame, which is
// itself pitched -20.6 degrees against the runtime's grip pose. The exact angle is the pitch of
// the grip pose against the controller HAL's own pose, 42.25 degrees, measured on still
// controllers to 0.04 degrees: the velocities are in the HAL's frame.
constexpr double DEFAULT_LINEAR_PITCH_DEG = -62.85;
constexpr double DEFAULT_ANGULAR_PITCH_DEG = -42.25;

// The angular velocity local to the streamed pose is what VRLink 2.0.23 expects. VRLink 2.0.20
// hands it to SteamVR as a base-space vector, as OpenXR defines it (measured 2026-10-06 with the
// controller HAL pose layer, which reports the same frames), so there it is rotated into the base
// space. Written by the Morphe patch per Steam Link base, located by the 16-byte magic. Version 1:
//   +16 version          uint32
//   +20 angularWorld     uint32  0 = local to the pose (VRLink 2.0.23), 1 = base space (2.0.20 - 2.0.22)
struct ConfigBlob {
    char magic[16];
    std::uint32_t version;
    std::uint32_t angularWorld;
    std::uint32_t reserved[2];
};

__attribute__((used)) volatile ConfigBlob CONFIG = {
    {'G', 'X', 'R', 'V', 'F', 'R', 'C', 'F', 'G', '0', '0', '0', '0', '0', '0', '1'},
    1,
    0,
    {0, 0},
};

PFN_xrGetInstanceProcAddr NEXT_GET_INSTANCE_PROC_ADDR = nullptr;
PFN_xrCreateAction NEXT_CREATE_ACTION = nullptr;
PFN_xrDestroyAction NEXT_DESTROY_ACTION = nullptr;
PFN_xrCreateActionSpace NEXT_CREATE_ACTION_SPACE = nullptr;
PFN_xrDestroySpace NEXT_DESTROY_SPACE = nullptr;
PFN_xrDestroySession NEXT_DESTROY_SESSION = nullptr;
PFN_xrLocateSpace NEXT_LOCATE_SPACE = nullptr;

std::mutex MUTEX;
std::unordered_set<XrAction> STREAM_ACTIONS;
std::unordered_set<XrSpace> STREAM_SPACES;

struct Pitch {
    double sine = 0.0;
    double cosine = 1.0;
};
// The controller HAL pose layer reports the HAL's own velocities, already in the right frames.
constexpr char HAL_POSE_LIBRARY[] = "libgxr_controller_hal_pose.so";
constexpr char HAL_VELOCITY_ACTIVE_SYMBOL[] = "gxr_controller_hal_velocity_active";
constexpr unsigned HAL_LOOKUP_EVERY = 512;
int (*HAL_VELOCITY_ACTIVE)() = nullptr;
unsigned HAL_LOOKUP_COUNT = 0;
bool ENABLED = true;
bool ANGULAR_WORLD = false;
Pitch LINEAR_PITCH;
Pitch ANGULAR_PITCH;

bool readProperty(const char* name, char* value) {
    return __system_property_get(name, value) > 0;
}

Pitch pitchFromProperty(const char* name, double fallbackDegrees) {
    char value[PROP_VALUE_MAX]{};
    double degrees = fallbackDegrees;
    if (readProperty(name, value)) {
        char* end = nullptr;
        const double parsed = std::strtod(value, &end);
        if (end != value && std::isfinite(parsed) && parsed >= -180.0 && parsed <= 180.0) degrees = parsed;
    }
    const double radians = degrees * 3.14159265358979323846 / 180.0;
    return {std::sin(radians), std::cos(radians)};
}

// Read when the instance is created:
//   debug.gxr.velocity_frame 0            report the runtime's velocities unchanged
//   debug.gxr.velocity_pitch_linear  deg  pitch of the linear velocity's frame against the grip pose
//   debug.gxr.velocity_pitch_angular deg  pitch applied to the angular velocity
//   debug.gxr.velocity_frame.angular local / world: frame of the angular velocity (default from CONFIG)
void readConfig() {
    char value[PROP_VALUE_MAX]{};
    ENABLED = !readProperty("debug.gxr.velocity_frame", value) || std::atoi(value) != 0;
    LINEAR_PITCH = pitchFromProperty("debug.gxr.velocity_pitch_linear", DEFAULT_LINEAR_PITCH_DEG);
    ANGULAR_PITCH = pitchFromProperty("debug.gxr.velocity_pitch_angular", DEFAULT_ANGULAR_PITCH_DEG);
    ANGULAR_WORLD = CONFIG.angularWorld != 0;
    if (readProperty("debug.gxr.velocity_frame.angular", value)) {
        if (std::strcmp(value, "world") == 0) ANGULAR_WORLD = true;
        if (std::strcmp(value, "local") == 0) ANGULAR_WORLD = false;
    }
    GXR_LOG("controller velocity frame correction %s (angular %s)", ENABLED ? "on" : "off",
        ANGULAR_WORLD ? "world" : "local");
}

// Rotation about +X by the pitch.
XrVector3f pitched(const Pitch& pitch, const XrVector3f& v) {
    return {
        v.x,
        static_cast<float>(v.y * pitch.cosine - v.z * pitch.sine),
        static_cast<float>(v.y * pitch.sine + v.z * pitch.cosine),
    };
}

XrVector3f rotated(const XrQuaternionf& q, const XrVector3f& v) {
    // v + 2 * (w * (u x v) + u x (u x v)), u = (x, y, z)
    const double cx = q.y * v.z - q.z * v.y;
    const double cy = q.z * v.x - q.x * v.z;
    const double cz = q.x * v.y - q.y * v.x;
    const double dx = q.y * cz - q.z * cy;
    const double dy = q.z * cx - q.x * cz;
    const double dz = q.x * cy - q.y * cx;
    return {
        static_cast<float>(v.x + 2.0 * (q.w * cx + dx)),
        static_cast<float>(v.y + 2.0 * (q.w * cy + dy)),
        static_cast<float>(v.z + 2.0 * (q.w * cz + dz)),
    };
}

XrSpaceVelocity* velocityOf(XrSpaceLocation* location) {
    for (auto* next = static_cast<XrBaseOutStructure*>(location->next); next; next = next->next) {
        if (next->type == XR_TYPE_SPACE_VELOCITY) return reinterpret_cast<XrSpaceVelocity*>(next);
    }
    return nullptr;
}

XrResult XRAPI_PTR layerCreateAction(
    XrActionSet actionSet,
    const XrActionCreateInfo* createInfo,
    XrAction* action
) {
    const XrResult result = NEXT_CREATE_ACTION(actionSet, createInfo, action);
    if (XR_SUCCEEDED(result) && createInfo->actionType == XR_ACTION_TYPE_POSE_INPUT &&
        std::strcmp(createInfo->actionName, STREAM_POSE_ACTION) == 0) {
        std::lock_guard<std::mutex> lock(MUTEX);
        STREAM_ACTIONS.insert(*action);
    }
    return result;
}

XrResult XRAPI_PTR layerDestroyAction(XrAction action) {
    const XrResult result = NEXT_DESTROY_ACTION(action);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(MUTEX);
        STREAM_ACTIONS.erase(action);
    }
    return result;
}

XrResult XRAPI_PTR layerCreateActionSpace(
    XrSession session,
    const XrActionSpaceCreateInfo* createInfo,
    XrSpace* space
) {
    const XrResult result = NEXT_CREATE_ACTION_SPACE(session, createInfo, space);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(MUTEX);
        if (STREAM_ACTIONS.count(createInfo->action) != 0) {
            STREAM_SPACES.insert(*space);
            GXR_LOG("controller stream pose space tracked");
        }
    }
    return result;
}

XrResult XRAPI_PTR layerDestroySpace(XrSpace space) {
    {
        std::lock_guard<std::mutex> lock(MUTEX);
        STREAM_SPACES.erase(space);
    }
    return NEXT_DESTROY_SPACE(space);
}

XrResult XRAPI_PTR layerDestroySession(XrSession session) {
    {
        // Destroying the session destroys its spaces without xrDestroySpace calls.
        std::lock_guard<std::mutex> lock(MUTEX);
        STREAM_SPACES.clear();
    }
    return NEXT_DESTROY_SESSION(session);
}

XrResult XRAPI_PTR layerLocateSpace(
    XrSpace space,
    XrSpace baseSpace,
    XrTime time,
    XrSpaceLocation* location
) {
    const XrResult result = NEXT_LOCATE_SPACE(space, baseSpace, time, location);
    if (XR_FAILED(result) || !ENABLED || !location) return result;
    if ((location->locationFlags & XR_SPACE_LOCATION_ORIENTATION_VALID_BIT) == 0) return result;
    XrSpaceVelocity* velocity = velocityOf(location);
    if (!velocity) return result;
    {
        std::lock_guard<std::mutex> lock(MUTEX);
        if (STREAM_SPACES.count(space) == 0) return result;
        if (!HAL_VELOCITY_ACTIVE && HAL_LOOKUP_COUNT++ % HAL_LOOKUP_EVERY == 0) {
            // Only looks at a library that is already loaded.
            if (void* library = dlopen(HAL_POSE_LIBRARY, RTLD_NOW | RTLD_NOLOAD)) {
                HAL_VELOCITY_ACTIVE =
                    reinterpret_cast<int (*)()>(dlsym(library, HAL_VELOCITY_ACTIVE_SYMBOL));
            }
        }
    }
    if (HAL_VELOCITY_ACTIVE && HAL_VELOCITY_ACTIVE()) return result;
    if (velocity->velocityFlags & XR_SPACE_VELOCITY_LINEAR_VALID_BIT) {
        velocity->linearVelocity =
            rotated(location->pose.orientation, pitched(LINEAR_PITCH, velocity->linearVelocity));
    }
    if (velocity->velocityFlags & XR_SPACE_VELOCITY_ANGULAR_VALID_BIT) {
        const XrVector3f local = pitched(ANGULAR_PITCH, velocity->angularVelocity);
        velocity->angularVelocity = ANGULAR_WORLD ? rotated(location->pose.orientation, local) : local;
    }
    return result;
}

template <typename Function>
void loadNext(XrInstance instance, const char* name, Function& function) {
    PFN_xrVoidFunction loaded = nullptr;
    function = nullptr;
    if (XR_SUCCEEDED(NEXT_GET_INSTANCE_PROC_ADDR(instance, name, &loaded))) {
        function = reinterpret_cast<Function>(loaded);
    }
}

XrResult XRAPI_PTR layerGetInstanceProcAddr(
    XrInstance instance,
    const char* name,
    PFN_xrVoidFunction* function
) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
    const auto is = [name](const char* other) { return std::strcmp(name, other) == 0; };
    const auto set = [function](auto pointer) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(pointer);
        return XR_SUCCESS;
    };
    if (is("xrGetInstanceProcAddr")) return set(layerGetInstanceProcAddr);
    if (is("xrCreateAction") && NEXT_CREATE_ACTION) return set(layerCreateAction);
    if (is("xrDestroyAction") && NEXT_DESTROY_ACTION) return set(layerDestroyAction);
    if (is("xrCreateActionSpace") && NEXT_CREATE_ACTION_SPACE) return set(layerCreateActionSpace);
    if (is("xrDestroySpace") && NEXT_DESTROY_SPACE) return set(layerDestroySpace);
    if (is("xrDestroySession") && NEXT_DESTROY_SESSION) return set(layerDestroySession);
    if (is("xrLocateSpace") && NEXT_LOCATE_SPACE) return set(layerLocateSpace);
    if (!NEXT_GET_INSTANCE_PROC_ADDR) {
        *function = nullptr;
        return XR_ERROR_FUNCTION_UNSUPPORTED;
    }
    return NEXT_GET_INSTANCE_PROC_ADDR(instance, name, function);
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
    NEXT_GET_INSTANCE_PROC_ADDR = apiLayerInfo->nextInfo->nextGetInstanceProcAddr;
    {
        std::lock_guard<std::mutex> lock(MUTEX);
        STREAM_ACTIONS.clear();
        STREAM_SPACES.clear();
    }
    loadNext(*instance, "xrCreateAction", NEXT_CREATE_ACTION);
    loadNext(*instance, "xrDestroyAction", NEXT_DESTROY_ACTION);
    loadNext(*instance, "xrCreateActionSpace", NEXT_CREATE_ACTION_SPACE);
    loadNext(*instance, "xrDestroySpace", NEXT_DESTROY_SPACE);
    loadNext(*instance, "xrDestroySession", NEXT_DESTROY_SESSION);
    loadNext(*instance, "xrLocateSpace", NEXT_LOCATE_SPACE);
    readConfig();
    return XR_SUCCESS;
}

}  // namespace

extern "C" __attribute__((visibility("default"))) XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
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

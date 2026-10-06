#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <android/log.h>
#include <dlfcn.h>
#include <elf.h>
#include <link.h>
#include <sys/mman.h>
#include <sys/system_properties.h>
#include <time.h>
#include <unistd.h>

#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <mutex>
#include <string>
#include <unordered_map>
#include <unordered_set>

#define GXR_LOG(...) __android_log_print(ANDROID_LOG_INFO, "GxrExtrapolation", __VA_ARGS__)

namespace {

constexpr char LAYER_NAME[] = "XR_APILAYER_local_GalaxyXR_controller_extrapolation";

// The Galaxy XR runtime's app-side library extrapolates controller poses to the requested
// XrTime only when this server flag is set. A user build never sets it, so xrLocateSpace returns
// the last per-frame sample for every requested time.
constexpr char FLAG_NAME[] = "com.android.xr.flags.enable_controller_pose_extrapolation_consumer_side";
constexpr char RUNTIME_LIBRARY[] = "libopenxr_android.so";
constexpr char FLAG_READER_SYMBOL[] = "25GetServerConfigurableFlag";

using GetFlagFn = std::string (*)(const std::string&, const std::string&, const std::string&);
GetFlagFn ORIGINAL_GET_FLAG = nullptr;
bool HOOKED = false;
PFN_xrGetInstanceProcAddr NEXT_GET_INSTANCE_PROC_ADDR = nullptr;

// VRLink streams the controllers from this pose action (bound to the controller grip pose).
constexpr char STREAM_POSE_ACTION[] = "pamir-stream-pose";

// Jitter filter on the streamed controller pose: a low-pass whose cutoff rises with the
// controller's speed, so a resting hand is smoothed hard and a fast one barely lags.
// Cutoff = MIN_CUTOFF + BETA * speed, in Hz; speed in m/s for the position, rad/s for the rotation.
// Only the size of the runtime's velocities is used, so the frame they are reported in does not
// matter. The values were chosen by feel on the headset.
constexpr float DEFAULT_POSITION_MIN_CUTOFF = 3.0f;
constexpr float DEFAULT_POSITION_BETA = 60.0f;
constexpr float DEFAULT_ROTATION_MIN_CUTOFF = 3.0f;
constexpr float DEFAULT_ROTATION_BETA = 60.0f;
constexpr int64_t FILTER_RESET_NS = 100000000LL;
constexpr int64_t TUNING_REFRESH_NS = 1000000000LL;
// The controller HAL pose layer filters the pose it supplies itself.
constexpr char HAL_POSE_LIBRARY[] = "libgxr_controller_hal_pose.so";
constexpr char HAL_POSE_ACTIVE_SYMBOL[] = "gxr_controller_hal_pose_active";

PFN_xrCreateAction NEXT_CREATE_ACTION = nullptr;
PFN_xrDestroyAction NEXT_DESTROY_ACTION = nullptr;
PFN_xrCreateActionSpace NEXT_CREATE_ACTION_SPACE = nullptr;
PFN_xrDestroySpace NEXT_DESTROY_SPACE = nullptr;
PFN_xrDestroySession NEXT_DESTROY_SESSION = nullptr;
PFN_xrLocateSpace NEXT_LOCATE_SPACE = nullptr;

struct Filter {
    int64_t at = 0;
    double position[3]{};
    double rotation[4]{};
};

std::mutex MUTEX;
std::unordered_set<XrAction> STREAM_ACTIONS;
// One filter per stream pose space (one space per hand).
std::unordered_map<XrSpace, Filter> STREAM_SPACES;
bool FILTER_ON = true;
float POSITION_MIN_CUTOFF = DEFAULT_POSITION_MIN_CUTOFF;
float POSITION_BETA = DEFAULT_POSITION_BETA;
float ROTATION_MIN_CUTOFF = DEFAULT_ROTATION_MIN_CUTOFF;
float ROTATION_BETA = DEFAULT_ROTATION_BETA;
int64_t TUNING_READ_AT = 0;
int (*HAL_POSE_ACTIVE)() = nullptr;

int64_t monotonicNs() {
    timespec now{};
    clock_gettime(CLOCK_MONOTONIC, &now);
    return now.tv_sec * 1000000000LL + now.tv_nsec;
}

float readFloat(const char* name, float fallback, float low, float high) {
    char value[PROP_VALUE_MAX]{};
    if (__system_property_get(name, value) <= 0) return fallback;
    char* end = nullptr;
    const float parsed = std::strtof(value, &end);
    return end != value && parsed >= low && parsed <= high ? parsed : fallback;
}

// Read once a second while poses are located (MUTEX held):
//   debug.gxr.posefilter             0 = report the runtime's pose unfiltered
//   debug.gxr.posefilter.pos.cutoff  position cutoff at rest, Hz (3)
//   debug.gxr.posefilter.pos.beta    position cutoff added per m/s, Hz (60)
//   debug.gxr.posefilter.rot.cutoff  rotation cutoff at rest, Hz (3)
//   debug.gxr.posefilter.rot.beta    rotation cutoff added per rad/s, Hz (60)
void refreshTuning(int64_t now) {
    if (TUNING_READ_AT != 0 && now - TUNING_READ_AT < TUNING_REFRESH_NS) return;
    const bool first = TUNING_READ_AT == 0;
    TUNING_READ_AT = now;
    const bool on = readFloat("debug.gxr.posefilter", 1.0f, 0.0f, 1.0f) != 0.0f;
    const float positionCutoff =
        readFloat("debug.gxr.posefilter.pos.cutoff", DEFAULT_POSITION_MIN_CUTOFF, 0.05f, 1000.0f);
    const float positionBeta = readFloat("debug.gxr.posefilter.pos.beta", DEFAULT_POSITION_BETA, 0.0f, 10000.0f);
    const float rotationCutoff =
        readFloat("debug.gxr.posefilter.rot.cutoff", DEFAULT_ROTATION_MIN_CUTOFF, 0.05f, 1000.0f);
    const float rotationBeta = readFloat("debug.gxr.posefilter.rot.beta", DEFAULT_ROTATION_BETA, 0.0f, 10000.0f);
    if (first || on != FILTER_ON || positionCutoff != POSITION_MIN_CUTOFF || positionBeta != POSITION_BETA ||
        rotationCutoff != ROTATION_MIN_CUTOFF || rotationBeta != ROTATION_BETA) {
        GXR_LOG("pose filter %s: position %.2f Hz + %.1f per m/s, rotation %.2f Hz + %.1f per rad/s",
            on ? "on" : "off", positionCutoff, positionBeta, rotationCutoff, rotationBeta);
    }
    FILTER_ON = on;
    POSITION_MIN_CUTOFF = positionCutoff;
    POSITION_BETA = positionBeta;
    ROTATION_MIN_CUTOFF = rotationCutoff;
    ROTATION_BETA = rotationBeta;
    if (!HAL_POSE_ACTIVE) {
        // Only looks at a library that is already loaded.
        if (void* library = dlopen(HAL_POSE_LIBRARY, RTLD_NOW | RTLD_NOLOAD)) {
            HAL_POSE_ACTIVE = reinterpret_cast<int (*)()>(dlsym(library, HAL_POSE_ACTIVE_SYMBOL));
        }
    }
}

// Share of the way from the filtered value to the new one for this cutoff and time step.
double blendFor(double cutoffHz, double seconds) {
    return 1.0 - std::exp(-2.0 * 3.14159265358979323846 * cutoffHz * seconds);
}

void filterPose(Filter& filter, int64_t now, XrSpaceLocation* location) {
    constexpr XrSpaceLocationFlags valid =
        XR_SPACE_LOCATION_ORIENTATION_VALID_BIT | XR_SPACE_LOCATION_POSITION_VALID_BIT;
    if ((location->locationFlags & valid) != valid) return;
    const XrSpaceVelocity* velocity = nullptr;
    for (auto* next = static_cast<const XrBaseOutStructure*>(location->next); next; next = next->next) {
        if (next->type == XR_TYPE_SPACE_VELOCITY) velocity = reinterpret_cast<const XrSpaceVelocity*>(next);
    }
    if (!velocity) return;
    const XrVector3f& v = velocity->linearVelocity;
    const XrVector3f& w = velocity->angularVelocity;
    const float linear = (velocity->velocityFlags & XR_SPACE_VELOCITY_LINEAR_VALID_BIT)
        ? std::sqrt(v.x * v.x + v.y * v.y + v.z * v.z) : 0.0f;
    const float angular = (velocity->velocityFlags & XR_SPACE_VELOCITY_ANGULAR_VALID_BIT)
        ? std::sqrt(w.x * w.x + w.y * w.y + w.z * w.z) : 0.0f;

    XrPosef& pose = location->pose;
    double position[3]{pose.position.x, pose.position.y, pose.position.z};
    double rotation[4]{pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w};
    const int64_t step = now - filter.at;
    if (filter.at != 0 && step > 0 && step < FILTER_RESET_NS) {
        const double seconds = step / 1e9;
        const double p = blendFor(POSITION_MIN_CUTOFF + POSITION_BETA * linear, seconds);
        for (int i = 0; i < 3; ++i) position[i] = filter.position[i] + (position[i] - filter.position[i]) * p;
        const double r = blendFor(ROTATION_MIN_CUTOFF + ROTATION_BETA * angular, seconds);
        double dot = 0.0;
        for (int i = 0; i < 4; ++i) dot += rotation[i] * filter.rotation[i];
        // Blend along the shorter arc.
        const double sign = dot < 0.0 ? -1.0 : 1.0;
        double norm = 0.0;
        for (int i = 0; i < 4; ++i) {
            rotation[i] = filter.rotation[i] + (sign * rotation[i] - filter.rotation[i]) * r;
            norm += rotation[i] * rotation[i];
        }
        norm = std::sqrt(norm);
        if (norm > 0.0) {
            for (double& component : rotation) component /= norm;
        }
        pose.position = {static_cast<float>(position[0]), static_cast<float>(position[1]),
            static_cast<float>(position[2])};
        pose.orientation = {static_cast<float>(rotation[0]), static_cast<float>(rotation[1]),
            static_cast<float>(rotation[2]), static_cast<float>(rotation[3])};
    }
    filter.at = now;
    for (int i = 0; i < 3; ++i) filter.position[i] = position[i];
    for (int i = 0; i < 4; ++i) filter.rotation[i] = rotation[i];
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
        if (STREAM_ACTIONS.count(createInfo->action) != 0) STREAM_SPACES[*space] = Filter{};
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
    if (XR_FAILED(result) || !location) return result;
    std::lock_guard<std::mutex> lock(MUTEX);
    const auto found = STREAM_SPACES.find(space);
    if (found == STREAM_SPACES.end()) return result;
    const int64_t now = monotonicNs();
    refreshTuning(now);
    if (!FILTER_ON || (HAL_POSE_ACTIVE && HAL_POSE_ACTIVE())) {
        found->second.at = 0;
        return result;
    }
    filterPose(found->second, now, location);
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

// adb shell setprop debug.gxr.extrapolation 0 leaves the flag untouched; read when the app starts.
bool enabled() {
    char value[PROP_VALUE_MAX]{};
    if (__system_property_get("debug.gxr.extrapolation", value) <= 0) return true;
    return std::atoi(value) != 0;
}

std::string hookedGetFlag(const std::string& category, const std::string& flag, const std::string& fallback) {
    if (flag == FLAG_NAME && enabled()) {
        GXR_LOG("controller pose extrapolation enabled");
        return "true";
    }
    return ORIGINAL_GET_FLAG(category, flag, fallback);
}

// Redirects the runtime library's PLT import of server_configurable_flags::GetServerConfigurableFlag.
int patchRuntimeModule(dl_phdr_info* info, size_t, void*) {
    if (!info->dlpi_name || !std::strstr(info->dlpi_name, RUNTIME_LIBRARY)) return 0;
    const ElfW(Addr) base = info->dlpi_addr;
    const ElfW(Dyn)* dynamic = nullptr;
    for (int i = 0; i < info->dlpi_phnum; ++i) {
        if (info->dlpi_phdr[i].p_type == PT_DYNAMIC) {
            dynamic = reinterpret_cast<const ElfW(Dyn)*>(base + info->dlpi_phdr[i].p_vaddr);
        }
    }
    if (!dynamic) return 1;
    const ElfW(Sym)* symbols = nullptr;
    const char* strings = nullptr;
    const ElfW(Rela)* relocations = nullptr;
    size_t size = 0;
    for (; dynamic->d_tag != DT_NULL; ++dynamic) {
        switch (dynamic->d_tag) {
            case DT_SYMTAB: symbols = reinterpret_cast<const ElfW(Sym)*>(base + dynamic->d_un.d_ptr); break;
            case DT_STRTAB: strings = reinterpret_cast<const char*>(base + dynamic->d_un.d_ptr); break;
            case DT_JMPREL: relocations = reinterpret_cast<const ElfW(Rela)*>(base + dynamic->d_un.d_ptr); break;
            case DT_PLTRELSZ: size = dynamic->d_un.d_val; break;
            default: break;
        }
    }
    if (!symbols || !strings || !relocations) return 1;
    const size_t pageSize = static_cast<size_t>(sysconf(_SC_PAGESIZE));
    for (size_t i = 0; i < size / sizeof(ElfW(Rela)); ++i) {
        const ElfW(Rela)& relocation = relocations[i];
        const char* name = strings + symbols[ELF64_R_SYM(relocation.r_info)].st_name;
        if (!std::strstr(name, FLAG_READER_SYMBOL)) continue;
        void** slot = reinterpret_cast<void**>(base + relocation.r_offset);
        if (*slot == reinterpret_cast<void*>(hookedGetFlag)) continue;
        const uintptr_t page = reinterpret_cast<uintptr_t>(slot) & ~(pageSize - 1);
        if (mprotect(reinterpret_cast<void*>(page), pageSize, PROT_READ | PROT_WRITE) != 0) continue;
        ORIGINAL_GET_FLAG = reinterpret_cast<GetFlagFn>(*slot);
        *slot = reinterpret_cast<void*>(hookedGetFlag);
        HOOKED = true;
    }
    return 1;
}

void installFlagHook() {
    if (HOOKED) return;
    dl_iterate_phdr(patchRuntimeModule, nullptr);
    if (HOOKED) GXR_LOG("runtime flag hook installed");
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
    installFlagHook();
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
        TUNING_READ_AT = 0;
    }
    loadNext(*instance, "xrCreateAction", NEXT_CREATE_ACTION);
    loadNext(*instance, "xrDestroyAction", NEXT_DESTROY_ACTION);
    loadNext(*instance, "xrCreateActionSpace", NEXT_CREATE_ACTION_SPACE);
    loadNext(*instance, "xrDestroySpace", NEXT_DESTROY_SPACE);
    loadNext(*instance, "xrDestroySession", NEXT_DESTROY_SESSION);
    loadNext(*instance, "xrLocateSpace", NEXT_LOCATE_SPACE);
    if (!HOOKED) GXR_LOG("runtime library not found, extrapolation stays off");
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
    installFlagHook();
    request->layerInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion = XR_CURRENT_API_VERSION;
    request->getInstanceProcAddr = layerGetInstanceProcAddr;
    request->createApiLayerInstance = layerCreateApiLayerInstance;
    return XR_SUCCESS;
}

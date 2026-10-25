#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <android/log.h>
#include <link.h>
#include <sys/mman.h>
#include <sys/system_properties.h>
#include <time.h>
#include <unistd.h>

#include <atomic>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <mutex>

#include "pose_time.h"
#include "sha256.h"

#define GXR_LOG(...) __android_log_print(ANDROID_LOG_INFO, "GxrPoseTime", __VA_ARGS__)

namespace {

using namespace gxr::pose_time;

constexpr char LAYER_NAME[] = "XR_APILAYER_local_GalaxyXR_controller_pose_time";

// Steam Link sends each controller pose with a signed microsecond field at pose block +0x54: the
// pose's time relative to the packet header. Stock VRLink leaves it 0, so SteamVR treats every
// pose as taken at the header time. The Galaxy XR runtime labels a controller slot 28.82 ms ahead
// of the HAL target whose pose the slot carries (measured 2026-10-12), so the label is not the
// content's time either. This layer records, for each pose VRLink reads, the slot label the runtime
// consumed, and writes (label - compensation - header) into +0x54 when the packet is sent. Nothing
// else in the packet changes. Ported from the Steam Link Pose Time root module (galaxyxr-modules).
//
// Compensation is set by the Morphe patch in this config block, located by the 16-byte magic:
//   +16 version    uint32, 1
//   +20 leadUs     uint32, 0..30000 microseconds subtracted from the slot label
struct ConfigBlob {
    char magic[16];
    std::uint32_t version;
    std::uint32_t leadUs;
    std::uint32_t reserved[2];
};

__attribute__((used)) volatile ConfigBlob CONFIG = {
    {'G', 'X', 'R', 'P', 'T', 'M', 'C', 'F', 'G', '0', '0', '0', '0', '0', '0', '1'},
    1,
    5000,
    {0, 0},
};

// Galaxy XR runtime, firmware I610UEU2AZF3: the JUMP_SLOT through which the runtime calls
// android::XRInputBufferConsumer::Accessor::consumePose(unsigned, unsigned, unsigned long*,
// xrt_space_relation*), which yields the slot label of each controller pose.
constexpr char RUNTIME_PATH[] = "/system/lib64/libopenxr_android.so";
constexpr char RUNTIME_SHA256[] = "a7dabaa1030cc7979efe987f212488c61b61e8afb9aa3add59f7ae4fbeff4c92";
constexpr uintptr_t RUNTIME_CONSUME_GOT = 0x28b520;
constexpr uintptr_t RUNTIME_CONSUME = 0x1b359c;

// Steam Link scene libraries, matched by SHA-256 of three code regions (see profiles.py) so that
// other patches may change unrelated bytes. state: GetControllerState; send: SendPoses (identity
// only); clock: the vendor microsecond clock of the packet header; *Got: JUMP_SLOTs.
struct Region {
    uintptr_t offset;
    size_t length;
    const char* sha256;
};
struct SceneProfile {
    const char* name;
    Region state, send, clock;
    uintptr_t stateGot, submit, submitGot;
};
constexpr SceneProfile SCENES[] = {
    {"2.0.20/5001712",
        {0x1070cc, 0xa78, "eefcb6a7bffbb01e5372a3ac0bda144d567eb83a6dc1911d26f646d515e1bc8b"},
        {0xf4e74, 0x514, "b6031c5147641142e80ad6de19af0431b8feaf6445ccb2494144ef7b980b0ce0"},
        {0x155bf4, 0x40, "34ab8d6b71aba044a599a172257035e13029ea10d9819d3907c215356e872c21"},
        0x21ba70, 0x15a43c, 0x21b130},
    {"2.0.20/5001812",
        {0x10722c, 0xa78, "aea72e1523efc481775fcb702a99fb67599cae5a7f22946d9186ff925b4256b7"},
        {0xf4d34, 0x514, "6c1fbe7ec1a4f2ff27a87a5f9cb0e8df5facb4553e8c37ecad07043c75297fb6"},
        {0x155c38, 0x78, "f1b840b2be041e63aec5669bae395e823929e4d8c3d8f68b0046d0bb7deb98a3"},
        0x21b9a0, 0x15a4fc, 0x21b070},
    {"2.0.21/5001968",
        {0x10319c, 0xa78, "6d7292da1ff3d1fa9439c1a3a2ec63b56dd7c0ac9cb6c13833ebe26f32137163"},
        {0xf06cc, 0x534, "0758a927fb176829d637623beb6d36d67af3db3933f19065963f2a6bf1473f1a"},
        {0x151d2c, 0x78, "6e94ab11f89a2401ac1acf405546c894d98ae5a46608798a7eae502b029dc3af"},
        0x221ab0, 0x1565f0, 0x221190},
    {"2.0.22/5002244",
        {0x104800, 0xa78, "5c82f95c9d0f9c8069814d5ccba18e87d571b168bc0066d5ee10302e17e6632a"},
        {0xf1c64, 0x534, "027cf28b63162b26b2a9ccc1882a9f2b0b078f3a17f7cbc34997bf87e0c9be52"},
        {0x1555b8, 0x78, "76bc4a3d6ca7beb282b034bfc8d03e5e1cfcb737769d1f9a4e4b979fc2f579a7"},
        0x226038, 0x159c58, 0x225730},
    {"2.0.23/5002363",
        {0x107d30, 0xa9c, "38053102f7461f9ebc9aa3a5542fdcc4baaab3a5e43c95881cd566fcf34fac5f"},
        {0xf4da4, 0x550, "5f738a5b1ffbba4ea6454c03ce4b65d2ddb2b8b8eead79ec0c03f39e478694d8"},
        {0x15cb78, 0x40, "815c82ab54e2b55ff23941b8896b58f5d3af5130335627540180c8fc102b23df"},
        0x22fb90, 0x16128c, 0x22f238},
    {"2.0.24/5002395",
        {0x108f88, 0xa9c, "4cda1b9020578b65a04c36e48e1d6240124ce9458007b6a7f09d712509c00a7b"},
        {0xf5ff4, 0x550, "4f30c94895e96d10ce06abc3a96f05892871894d8e893dd0eb7d3765a3db0bb4"},
        {0x15e2b8, 0x40, "7279ef642ad5b65f5784bded4d9a42ef1f120796a2f2ac87fbe39f6fc62885d4"},
        0x232038, 0x1629cc, 0x2316b8},
};

// Other controller layers change where VRLink's poses come from or when they are predicted for.
constexpr const char* CONFLICTING_LIBRARIES[] = {
    "libgxr_controller_hal_pose.so", "libgxr_controller_extrapolation.so",
};

struct Loaded {
    uintptr_t runtime = 0;
    uintptr_t scene = 0;
    bool conflict = false;
};

int collect(dl_phdr_info* info, size_t, void* data) {
    auto* loaded = static_cast<Loaded*>(data);
    const char* name = info->dlpi_name ? info->dlpi_name : "";
    const size_t length = std::strlen(name);
    const auto endsWith = [&](const char* suffix) {
        const size_t n = std::strlen(suffix);
        return length >= n && std::strcmp(name + length - n, suffix) == 0 &&
            (length == n || name[length - n - 1] == '/');
    };
    if (std::strcmp(name, RUNTIME_PATH) == 0) loaded->runtime = info->dlpi_addr;
    if (endsWith("libvrlink_scene.so")) loaded->scene = info->dlpi_addr;
    for (const char* other : CONFLICTING_LIBRARIES) loaded->conflict |= endsWith(other);
    return 0;
}

bool fileSha256(const char* path, char out[65]) {
    FILE* file = std::fopen(path, "rbe");
    if (!file) return false;
    gxr::Sha256 sha;
    unsigned char buffer[65536];
    size_t n;
    while ((n = std::fread(buffer, 1, sizeof(buffer), file)) > 0) sha.update(buffer, n);
    const bool ok = !std::ferror(file);
    std::fclose(file);
    sha.hex(out);
    return ok;
}

bool regionMatches(uintptr_t base, const Region& region) {
    gxr::Sha256 sha;
    sha.update(reinterpret_cast<const unsigned char*>(base + region.offset), region.length);
    char hex[65];
    sha.hex(hex);
    return std::strcmp(hex, region.sha256) == 0;
}

uintptr_t readSlot(uintptr_t address) {
    return __atomic_load_n(reinterpret_cast<uintptr_t*>(address), __ATOMIC_ACQUIRE);
}

// The slots sit in RELRO: make the page writable for one aligned store, then read-only again.
bool writeSlot(uintptr_t address, uintptr_t value) {
    const uintptr_t page = static_cast<uintptr_t>(sysconf(_SC_PAGESIZE));
    void* start = reinterpret_cast<void*>(address & ~(page - 1));
    if (mprotect(start, page, PROT_READ | PROT_WRITE) != 0) return false;
    __atomic_store_n(reinterpret_cast<uintptr_t*>(address), value, __ATOMIC_RELEASE);
    return mprotect(start, page, PROT_READ) == 0;
}

bool readBool(const char* name, bool fallback) {
    char value[PROP_VALUE_MAX]{};
    if (__system_property_get(name, value) <= 0) return fallback;
    return std::atoi(value) != 0;
}

// Read when the instance is created:
//   debug.gxr.pose_time 0          leave every pose time unchanged (no hooks)
//   debug.gxr.pose_time.lead_us N  compensation override, 0..30000 microseconds
int64_t leadNs() {
    int64_t lead = static_cast<int64_t>(CONFIG.leadUs) * 1000;
    char value[PROP_VALUE_MAX]{};
    if (__system_property_get("debug.gxr.pose_time.lead_us", value) > 0) {
        char* end = nullptr;
        const long parsed = std::strtol(value, &end, 10);
        if (end != value && *end == '\0' && parsed >= 0 && parsed * 1000 <= MAX_LEAD_NS) lead = parsed * 1000;
    }
    return lead >= 0 && lead <= MAX_LEAD_NS ? lead : DEFAULT_LEAD_NS;
}

void install() {
    if (!readBool("debug.gxr.pose_time", true)) {
        GXR_LOG("pose time disabled by debug.gxr.pose_time");
        return;
    }
    Loaded loaded;
    dl_iterate_phdr(collect, &loaded);
    if (loaded.conflict) {
        GXR_LOG("controller HAL pose or extrapolation layer loaded; pose time left unchanged");
        return;
    }
    if (!loaded.runtime || !loaded.scene) {
        GXR_LOG("runtime %s, scene %s; pose time left unchanged", loaded.runtime ? "found" : "missing",
            loaded.scene ? "found" : "missing");
        return;
    }
    char runtimeHash[65];
    if (!fileSha256(RUNTIME_PATH, runtimeHash) || std::strcmp(runtimeHash, RUNTIME_SHA256) != 0) {
        GXR_LOG("unsupported Galaxy XR runtime; pose time left unchanged");
        return;
    }
    const SceneProfile* profile = nullptr;
    for (const auto& candidate : SCENES) {
        if (regionMatches(loaded.scene, candidate.state) && regionMatches(loaded.scene, candidate.send) &&
            regionMatches(loaded.scene, candidate.clock)) {
            profile = &candidate;
            break;
        }
    }
    if (!profile) {
        GXR_LOG("unsupported Steam Link scene library; pose time left unchanged");
        return;
    }
    const uintptr_t consumeSlot = loaded.runtime + RUNTIME_CONSUME_GOT;
    const uintptr_t stateSlot = loaded.scene + profile->stateGot;
    const uintptr_t submitSlot = loaded.scene + profile->submitGot;
    // Every slot must still point at the original function: anything else is a foreign hook.
    if (readSlot(consumeSlot) != loaded.runtime + RUNTIME_CONSUME ||
        readSlot(stateSlot) != loaded.scene + profile->state.offset ||
        readSlot(submitSlot) != loaded.scene + profile->submit) {
        GXR_LOG("hooked or unexpected function slots; pose time left unchanged");
        return;
    }
    ORIGINAL_CONSUME = reinterpret_cast<Consume>(loaded.runtime + RUNTIME_CONSUME);
    ORIGINAL_STATE = reinterpret_cast<State>(loaded.scene + profile->state.offset);
    ORIGINAL_SUBMIT = reinterpret_cast<Submit>(loaded.scene + profile->submit);
    VENDOR_CLOCK = reinterpret_cast<Clock>(loaded.scene + profile->clock.offset);
    LEAD_NS = leadNs();
    ENABLED.store(true, std::memory_order_release);
    // Consume first: until GetControllerState is hooked it only passes through.
    const bool consumed = writeSlot(consumeSlot, reinterpret_cast<uintptr_t>(&hookConsume));
    const bool stated = consumed && writeSlot(stateSlot, reinterpret_cast<uintptr_t>(&hookState));
    const bool submitted = stated && writeSlot(submitSlot, reinterpret_cast<uintptr_t>(&hookSubmit));
    if (!submitted) {
        // The hooks stay valid and pass through once disabled; put the originals back where possible.
        ENABLED.store(false, std::memory_order_release);
        if (stated) writeSlot(stateSlot, loaded.scene + profile->state.offset);
        if (consumed) writeSlot(consumeSlot, loaded.runtime + RUNTIME_CONSUME);
        GXR_LOG("could not write function slots; pose time left unchanged");
        return;
    }
    GXR_LOG("pose time on for Steam Link %s, compensation %lld us", profile->name,
        static_cast<long long>(LEAD_NS / 1000));
}

std::once_flag INSTALL_ONCE;
PFN_xrGetInstanceProcAddr NEXT_GET_INSTANCE_PROC_ADDR = nullptr;

XrResult XRAPI_PTR layerGetInstanceProcAddr(XrInstance instance, const char* name, PFN_xrVoidFunction* function) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
    if (std::strcmp(name, "xrGetInstanceProcAddr") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerGetInstanceProcAddr);
        return XR_SUCCESS;
    }
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
    const XrResult result = apiLayerInfo->nextInfo->nextCreateApiLayerInstance(instanceCreateInfo, &nextInfo, instance);
    if (XR_FAILED(result)) return result;
    NEXT_GET_INSTANCE_PROC_ADDR = apiLayerInfo->nextInfo->nextGetInstanceProcAddr;
    // The runtime is loaded once the next instance exists. Hooks persist for the process.
    std::call_once(INSTALL_ONCE, install);
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

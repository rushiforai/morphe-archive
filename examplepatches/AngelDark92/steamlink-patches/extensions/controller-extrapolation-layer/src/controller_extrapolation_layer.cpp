#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <android/log.h>
#include <elf.h>
#include <link.h>
#include <sys/mman.h>
#include <sys/system_properties.h>
#include <unistd.h>

#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <string>

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

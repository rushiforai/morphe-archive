#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>
#include <cstring>
#include <memory>
#include <mutex>
#include <unordered_map>
#include <vector>
#ifdef __ANDROID__
#include <android/log.h>
#define LOG(...) __android_log_print(ANDROID_LOG_INFO, "GxrPerformanceBoost", __VA_ARGS__)
#else
#define LOG(...) ((void)0)
#endif

namespace {
constexpr char NAME[] = "XR_APILAYER_local_GalaxyXR_performance_boost";
struct Dispatch {
    PFN_xrGetInstanceProcAddr gipa{};
    PFN_xrCreateSession createSession{};
    PFN_xrBeginSession beginSession{};
    PFN_xrDestroySession destroySession{};
    PFN_xrDestroyInstance destroyInstance{};
    PFN_xrPerfSettingsSetPerformanceLevelEXT perf{};
};
using D = std::shared_ptr<Dispatch>;
std::mutex mutex;
std::unordered_map<XrInstance, D> instances;
std::unordered_map<XrSession, D> sessions;
template<class M, class K> D lookup(M& map, K key) {
    std::lock_guard<std::mutex> lock(mutex);
    auto it = map.find(key);
    return it == map.end() ? nullptr : it->second;
}
template<class T> T proc(PFN_xrGetInstanceProcAddr gipa, XrInstance instance, const char* name) {
    PFN_xrVoidFunction fn = nullptr;
    return XR_SUCCEEDED(gipa(instance, name, &fn)) ? reinterpret_cast<T>(fn) : nullptr;
}
void boost(const D& d, XrSession session) {
    if (!d->perf) return;
    const auto cpu = d->perf(session, XR_PERF_SETTINGS_DOMAIN_CPU_EXT, XR_PERF_SETTINGS_LEVEL_BOOST_EXT);
    const auto gpu = d->perf(session, XR_PERF_SETTINGS_DOMAIN_GPU_EXT, XR_PERF_SETTINGS_LEVEL_BOOST_EXT);
    LOG("BOOST request CPU=%d GPU=%d (runtime results; not measured clocks)", cpu, gpu);
    (void)cpu; (void)gpu;
}
XrResult XRAPI_PTR createSession(XrInstance instance, const XrSessionCreateInfo* info, XrSession* session) {
    auto d = lookup(instances, instance); if (!d) return XR_ERROR_HANDLE_INVALID;
    auto result = d->createSession(instance, info, session);
    if (XR_SUCCEEDED(result)) {
        { std::lock_guard<std::mutex> lock(mutex); sessions[*session] = d; }
        boost(d, *session);
    }
    return result;
}
XrResult XRAPI_PTR beginSession(XrSession session, const XrSessionBeginInfo* info) {
    auto d = lookup(sessions, session); if (!d) return XR_ERROR_HANDLE_INVALID;
    auto result = d->beginSession(session, info);
    if (XR_SUCCEEDED(result)) boost(d, session);
    return result;
}
XrResult XRAPI_PTR destroySession(XrSession session) {
    auto d = lookup(sessions, session); if (!d) return XR_ERROR_HANDLE_INVALID;
    auto result = d->destroySession(session);
    if (XR_SUCCEEDED(result)) { std::lock_guard<std::mutex> lock(mutex); sessions.erase(session); }
    return result;
}
XrResult XRAPI_PTR destroyInstance(XrInstance instance) {
    auto d = lookup(instances, instance); if (!d) return XR_ERROR_HANDLE_INVALID;
    auto result = d->destroyInstance(instance);
    if (XR_SUCCEEDED(result)) {
        std::lock_guard<std::mutex> lock(mutex); instances.erase(instance);
        for (auto it = sessions.begin(); it != sessions.end();) {
            if (it->second == d) it = sessions.erase(it); else ++it;
        }
    }
    return result;
}
XrResult XRAPI_PTR gipa(XrInstance instance, const char* name, PFN_xrVoidFunction* fn) {
    if (!name || !fn) return XR_ERROR_VALIDATION_FAILURE;
    *fn = nullptr;
    if (!std::strcmp(name, "xrGetInstanceProcAddr")) {
        *fn = reinterpret_cast<PFN_xrVoidFunction>(gipa); return XR_SUCCESS;
    }
    auto d = lookup(instances, instance); if (!d) return XR_ERROR_HANDLE_INVALID;
    auto result = d->gipa(instance, name, fn); if (XR_FAILED(result) || !*fn) return result;
#define WRAP(api, wrapper) if (!std::strcmp(name, #api)) *fn = reinterpret_cast<PFN_xrVoidFunction>(wrapper)
    WRAP(xrCreateSession, createSession); WRAP(xrBeginSession, beginSession);
    WRAP(xrDestroySession, destroySession); WRAP(xrDestroyInstance, destroyInstance);
#undef WRAP
    return result;
}
XrResult XRAPI_PTR createInstance(const XrInstanceCreateInfo* info, const XrApiLayerCreateInfo* layer, XrInstance* instance) {
    if (!info || !instance || !layer || !layer->nextInfo || !layer->nextInfo->nextGetInstanceProcAddr ||
        !layer->nextInfo->nextCreateApiLayerInstance) return XR_ERROR_INITIALIZATION_FAILED;
    const auto nextGipa = layer->nextInfo->nextGetInstanceProcAddr;
    const auto nextCreate = layer->nextInfo->nextCreateApiLayerInstance;
    auto next = *layer; next.nextInfo = layer->nextInfo->next;
    std::vector<const char*> names;
    bool enabled = false;
    for (uint32_t i = 0; i < info->enabledExtensionCount; ++i) {
        names.push_back(info->enabledExtensionNames[i]);
        enabled |= !std::strcmp(names.back(), XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME);
    }
    bool added = false;
    // Global enumeration may be unavailable through another layer. In that case
    // try the optional extension and retry only on EXTENSION_NOT_PRESENT.
    bool supported = true;
    auto enumerate = proc<PFN_xrEnumerateInstanceExtensionProperties>(nextGipa, XR_NULL_HANDLE, "xrEnumerateInstanceExtensionProperties");
    uint32_t count = 0;
    if (!enabled && enumerate && XR_SUCCEEDED(enumerate(nullptr, 0, &count, nullptr)) && count <= 4096) {
        std::vector<XrExtensionProperties> available(count);
        for (auto& p : available) p.type = XR_TYPE_EXTENSION_PROPERTIES;
        const auto capacity = count;
        if (XR_SUCCEEDED(enumerate(nullptr, capacity, &count, available.data())) && count <= capacity) {
            supported = false;
            for (uint32_t i = 0; i < count; ++i)
                supported |= !std::strcmp(available[i].extensionName, XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME);
        }
    }
    if (!enabled && supported) { names.push_back(XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME); added = true; }
    auto copy = *info;
    copy.enabledExtensionCount = static_cast<uint32_t>(names.size()); copy.enabledExtensionNames = names.data();
    auto result = nextCreate(&copy, &next, instance);
    if (result == XR_ERROR_EXTENSION_NOT_PRESENT && added) {
        next = *layer; next.nextInfo = layer->nextInfo->next;
        result = nextCreate(info, &next, instance); added = false;
    }
    if (XR_FAILED(result)) return result;
    auto d = std::make_shared<Dispatch>(); d->gipa = nextGipa;
#define LOAD(api, member) d->member = proc<PFN_##api>(nextGipa, *instance, #api)
    LOAD(xrCreateSession, createSession); LOAD(xrBeginSession, beginSession);
    LOAD(xrDestroySession, destroySession); LOAD(xrDestroyInstance, destroyInstance);
    if (enabled || added) { LOAD(xrPerfSettingsSetPerformanceLevelEXT, perf); }
#undef LOAD
    if (!d->createSession || !d->beginSession || !d->destroySession || !d->destroyInstance) {
        if (d->destroyInstance) d->destroyInstance(*instance);
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    LOG("Performance extension enabled=%d function=%d", enabled || added, d->perf != nullptr);
    { std::lock_guard<std::mutex> lock(mutex); instances[*instance] = d; }
    return result;
}
}
#ifdef _WIN32
#define EXPORT __declspec(dllexport)
#else
#define EXPORT __attribute__((visibility("default")))
#endif
extern "C" EXPORT XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
    const XrNegotiateLoaderInfo* loader, const char* name, XrNegotiateApiLayerRequest* request) {
    if (!loader || !name || !request || std::strcmp(name, NAME) ||
        loader->structType != XR_LOADER_INTERFACE_STRUCT_LOADER_INFO ||
        loader->structVersion != XR_LOADER_INFO_STRUCT_VERSION || loader->structSize != sizeof(*loader) ||
        request->structType != XR_LOADER_INTERFACE_STRUCT_API_LAYER_REQUEST ||
        request->structVersion != XR_API_LAYER_INFO_STRUCT_VERSION || request->structSize != sizeof(*request) ||
        loader->minInterfaceVersion > XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loader->maxInterfaceVersion < XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loader->minApiVersion > XR_MAKE_VERSION(1,0,0) || loader->maxApiVersion < XR_MAKE_VERSION(1,0,0))
        return XR_ERROR_INITIALIZATION_FAILED;
    request->layerInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion = XR_MAKE_VERSION(1,0,0);
    request->getInstanceProcAddr = gipa; request->createApiLayerInstance = createInstance;
    return XR_SUCCESS;
}

// Host-side mock runtime: production dispatch, extension negotiation and lifecycle.
#ifdef NDEBUG
#undef NDEBUG
#endif
#include "../src/layer.cpp"
#include <cassert>
#include <iostream>
namespace {
bool advertised = true, rejectAdded = false, enumAvailable = true, failSession = false, failBegin = false;
bool sawEnabled = false;
int creates = 0, requests = 0;
uintptr_t nextInstance = 1, nextSession = 100;
XrResult XRAPI_PTR mockEnumerate(const char*, uint32_t capacity, uint32_t* count, XrExtensionProperties* values) {
    *count = advertised ? 1 : 0;
    if (capacity && advertised) std::strcpy(values[0].extensionName, XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME);
    return XR_SUCCESS;
}
XrResult XRAPI_PTR mockCreate(const XrInstanceCreateInfo* info, const XrApiLayerCreateInfo* layer, XrInstance* instance) {
    assert(layer->nextInfo == nullptr); ++creates; sawEnabled = false;
    int occurrences = 0;
    for (uint32_t i = 0; i < info->enabledExtensionCount; ++i)
        occurrences += !std::strcmp(info->enabledExtensionNames[i], XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME);
    assert(occurrences <= 1); sawEnabled = occurrences == 1;
    if (rejectAdded && sawEnabled) return XR_ERROR_EXTENSION_NOT_PRESENT;
    *instance = reinterpret_cast<XrInstance>(nextInstance++); return XR_SUCCESS;
}
XrResult XRAPI_PTR mockCreateSession(XrInstance, const XrSessionCreateInfo*, XrSession* session) {
    if (failSession) return XR_ERROR_RUNTIME_FAILURE;
    *session = reinterpret_cast<XrSession>(nextSession++); return XR_SUCCESS;
}
XrResult XRAPI_PTR mockBegin(XrSession, const XrSessionBeginInfo*) { return failBegin ? XR_ERROR_RUNTIME_FAILURE : XR_SUCCESS; }
XrResult XRAPI_PTR mockDestroySession(XrSession) { return XR_SUCCESS; }
XrResult XRAPI_PTR mockDestroyInstance(XrInstance) { return XR_SUCCESS; }
XrResult XRAPI_PTR mockPerf(XrSession, XrPerfSettingsDomainEXT domain, XrPerfSettingsLevelEXT level) {
    assert(level == XR_PERF_SETTINGS_LEVEL_BOOST_EXT);
    assert(domain == (requests % 2 ? XR_PERF_SETTINGS_DOMAIN_GPU_EXT : XR_PERF_SETTINGS_DOMAIN_CPU_EXT));
    ++requests;
    // CPU refusal must not suppress GPU or turn session creation into a failure.
    return domain == XR_PERF_SETTINGS_DOMAIN_CPU_EXT ? XR_ERROR_RUNTIME_FAILURE : XR_SUCCESS;
}
XrResult XRAPI_PTR mockGipa(XrInstance, const char* name, PFN_xrVoidFunction* fn) {
    *fn = nullptr;
#define MOCK(api, impl) if (!std::strcmp(name, #api)) *fn = reinterpret_cast<PFN_xrVoidFunction>(impl)
    if (enumAvailable) { MOCK(xrEnumerateInstanceExtensionProperties, mockEnumerate); }
    MOCK(xrCreateSession, mockCreateSession); MOCK(xrBeginSession, mockBegin);
    MOCK(xrDestroySession, mockDestroySession); MOCK(xrDestroyInstance, mockDestroyInstance);
    MOCK(xrPerfSettingsSetPerformanceLevelEXT, mockPerf);
#undef MOCK
    return *fn ? XR_SUCCESS : XR_ERROR_FUNCTION_UNSUPPORTED;
}
XrInstance make(bool alreadyEnabled = false) {
    const char* extension = XR_EXT_PERFORMANCE_SETTINGS_EXTENSION_NAME;
    XrInstanceCreateInfo info{XR_TYPE_INSTANCE_CREATE_INFO};
    if (alreadyEnabled) { info.enabledExtensionCount = 1; info.enabledExtensionNames = &extension; }
    XrApiLayerNextInfo next{}; next.nextGetInstanceProcAddr = mockGipa; next.nextCreateApiLayerInstance = mockCreate;
    XrApiLayerCreateInfo layer{}; layer.nextInfo = &next;
    XrInstance instance{};
    assert(createInstance(&info, &layer, &instance) == XR_SUCCESS);
    assert(info.enabledExtensionCount == (alreadyEnabled ? 1u : 0u));
    return instance;
}
}
int main() {
    auto first = make(); assert(sawEnabled && creates == 1);
    XrSession session{};
    failSession = true; assert(createSession(first, nullptr, &session) == XR_ERROR_RUNTIME_FAILURE && requests == 0);
    failSession = false; assert(createSession(first, nullptr, &session) == XR_SUCCESS && requests == 2);
    failBegin = true; assert(beginSession(session, nullptr) == XR_ERROR_RUNTIME_FAILURE && requests == 2);
    failBegin = false; assert(beginSession(session, nullptr) == XR_SUCCESS && requests == 4);
    assert(beginSession(session, nullptr) == XR_SUCCESS && requests == 6);
    auto second = make(true); assert(sawEnabled);
    advertised = false;
    auto unsupported = make(); assert(!sawEnabled);
    XrSession other{}; assert(createSession(unsupported, nullptr, &other) == XR_SUCCESS && requests == 6);
    assert(destroyInstance(first) == XR_SUCCESS);
    assert(beginSession(session, nullptr) == XR_ERROR_HANDLE_INVALID);
    assert(beginSession(other, nullptr) == XR_SUCCESS && requests == 6);
    assert(destroySession(other) == XR_SUCCESS && sessions.empty());
    assert(destroyInstance(second) == XR_SUCCESS); assert(destroyInstance(unsupported) == XR_SUCCESS);
    enumAvailable = false; rejectAdded = true; int before = creates;
    auto fallback = make(); assert(creates == before + 2 && !sawEnabled);
    assert(createSession(fallback, nullptr, &session) == XR_SUCCESS && requests == 6);
    assert(destroyInstance(fallback) == XR_SUCCESS && sessions.empty() && instances.empty());
    PFN_xrVoidFunction fn{};
    assert(gipa(first, "xrCreateSession", &fn) == XR_ERROR_HANDLE_INVALID && !fn);
    assert(xrNegotiateLoaderApiLayerInterface(nullptr, NAME, nullptr) == XR_ERROR_INITIALIZATION_FAILED);
    std::cout << "PASS: extension injection/deduplication/unsupported/fallback; CPU+GPU failure isolation; session restart/failure; multi-instance cleanup\n";
}

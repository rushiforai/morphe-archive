#include "pipeline_telemetry.h"
#ifdef GXR_PIPELINE_TEST
#include "../tests/pipeline_api_fake.h"
#else
#include <android/trace.h>
#include <media/NdkMediaCodec.h>
#include <media/NdkImageReader.h>
#endif
#include <atomic>
#include <cstdio>

namespace gxr::pipeline {
namespace {
std::atomic<bool> enabled{false};
thread_local int64_t currentFrame = -1;
bool tracing() { return enabled.load(std::memory_order_relaxed) && ATrace_isEnabled(); }
template<class F> F original(dbuf::HookId id) {
    return reinterpret_cast<F>(dbuf::originalFunction(id));
}
ssize_t dequeueInput(AMediaCodec* codec, int64_t timeout) {
    Scope span("dequeueInput", currentFrame);
    auto result = original<decltype(&AMediaCodec_dequeueInputBuffer)>(dbuf::HookId::DequeueInput)(codec, timeout);
    event("inputResult", currentFrame, result, timeout);
    return result;
}
media_status_t queueInput(AMediaCodec* codec, size_t index, size_t offset,
                         size_t bytes, uint64_t time, uint32_t flags) {
    Scope span("queueInput", static_cast<int64_t>(time));
    auto result = original<decltype(&AMediaCodec_queueInputBuffer)>(dbuf::HookId::QueueInput)(codec, index, offset, bytes, time, flags);
    event("queueResult", static_cast<int64_t>(time), result, bytes, index);
    return result;
}
ssize_t dequeueOutput(AMediaCodec* codec, AMediaCodecBufferInfo* info, int64_t timeout) {
    Scope span("dequeueOutput");
    auto result = original<decltype(&AMediaCodec_dequeueOutputBuffer)>(dbuf::HookId::DequeueOutput)(codec, info, timeout);
    // Output info is undefined for negative informational/error results.
    event("outputResult", result >= 0 && info ? info->presentationTimeUs : -1, result,
          result >= 0 && info ? info->size : 0, timeout);
    return result;
}
media_status_t releaseOutput(AMediaCodec* codec, size_t index, bool render) {
    Scope span("releaseOutput");
    auto result = original<decltype(&AMediaCodec_releaseOutputBuffer)>(dbuf::HookId::ReleaseOutput)(codec, index, render);
    event("releaseResult", -1, result, index, render);
    return result;
}
media_status_t acquireImage(AImageReader* reader, AImage** image) {
    Scope span("acquireImage");
    auto result = original<decltype(&AImageReader_acquireLatestImage)>(dbuf::HookId::AcquireLatestImage)(reader, image);
    event("imageResult", -1, result);
    return result;
}
media_status_t imageTimestamp(const AImage* image, int64_t* timestamp) {
    auto result = original<decltype(&AImage_getTimestamp)>(dbuf::HookId::ImageTimestamp)(image, timestamp);
    // Stock callback divides the image timestamp by 1000 to obtain frame ID.
    if (result == AMEDIA_OK && timestamp) event("imageTimestamp", *timestamp / 1000, *timestamp);
    else event("imageTimestampError", -1, result);
    return result;
}
__attribute__((noinline)) void nativeFault(void* fec) {
    const auto caller = reinterpret_cast<uintptr_t>(__builtin_return_address(0));
    const auto base = dbuf::sceneAddress(0);
    event("nativeFault", currentFrame, caller >= base ? caller - base : 0);
    original<void(*)(void*)>(dbuf::HookId::NativeFault)(fec);
}
}
void enable(bool value) { enabled.store(value, std::memory_order_relaxed); }
Scope::Scope(const char* stage, int64_t frame) : active(tracing()) {
    if (!active) return;
    char name[120];
    std::snprintf(name, sizeof(name), "GXR2 %s fid=%lld", stage, static_cast<long long>(frame));
    ATrace_beginSection(name);
}
Scope::~Scope() { if (active) ATrace_endSection(); }
Frame::Frame(uint32_t frame) : previous(currentFrame) { currentFrame = frame; }
Frame::~Frame() { currentFrame = previous; }
void event(const char* stage, int64_t frame, int64_t a, int64_t b, int64_t c) {
    if (!tracing()) return;
    char name[180];
    std::snprintf(name, sizeof(name), "GXR2 %s fid=%lld a=%lld b=%lld c=%lld", stage,
        static_cast<long long>(frame), static_cast<long long>(a), static_cast<long long>(b), static_cast<long long>(c));
    ATrace_beginSection(name);
    ATrace_endSection();
}
void bind(dbuf::HookBindings& bindings) {
    bindings.replacement[static_cast<size_t>(dbuf::HookId::DequeueInput)] = reinterpret_cast<void*>(&dequeueInput);
    bindings.replacement[static_cast<size_t>(dbuf::HookId::QueueInput)] = reinterpret_cast<void*>(&queueInput);
    bindings.replacement[static_cast<size_t>(dbuf::HookId::DequeueOutput)] = reinterpret_cast<void*>(&dequeueOutput);
    bindings.replacement[static_cast<size_t>(dbuf::HookId::ReleaseOutput)] = reinterpret_cast<void*>(&releaseOutput);
    bindings.replacement[static_cast<size_t>(dbuf::HookId::AcquireLatestImage)] = reinterpret_cast<void*>(&acquireImage);
    bindings.replacement[static_cast<size_t>(dbuf::HookId::ImageTimestamp)] = reinterpret_cast<void*>(&imageTimestamp);
    bindings.replacement[static_cast<size_t>(dbuf::HookId::NativeFault)] = reinterpret_cast<void*>(&nativeFault);
}
}

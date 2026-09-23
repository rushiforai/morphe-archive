// Compile the production wrappers, not substitute host no-op telemetry.
// This proves forwarding and event gating, not Android activation or timing.
#define GXR_PIPELINE_TEST 1
#include "../src/pipeline_telemetry.cpp"
#include <array>
#include <exception>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

namespace test {
[[noreturn]] void fail(const char* expression, int line) {
    throw std::runtime_error("line " + std::to_string(line) + ": " + expression);
}
#define CHECK(expression) do { if (!(expression)) test::fail(#expression, __LINE__); } while (false)
struct Trace {
    bool active = true;
    std::vector<std::string> names;
    unsigned begins = 0, ends = 0;
    int depth = 0;
};
thread_local Trace trace;
struct Api {
    std::array<unsigned, 7> calls{};
    AMediaCodec* codec = nullptr;
    int64_t inputTimeout = 0, outputTimeout = 0;
    size_t index = 0, offset = 0, bytes = 0, releaseIndex = 0;
    uint64_t time = 0;
    uint32_t flags = 0;
    bool render = false;
    AMediaCodecBufferInfo* info = nullptr;
    AImageReader* reader = nullptr;
    AImage** imageOut = nullptr;
    const AImage* image = nullptr;
    int64_t* timestampOut = nullptr;
    void* fec = nullptr;
    ssize_t inputResult = 17, outputResult = 9;
    media_status_t queueResult = -101, releaseResult = -102, imageResult = AMEDIA_OK;
    media_status_t timestampResult = AMEDIA_OK;
    AImage imageValue;
    int64_t timestampValue = 654321000;
};
thread_local Api api;
gxr::dbuf::HookBindings bindings;

ssize_t input(AMediaCodec* codec, int64_t timeout) {
    ++api.calls[0]; api.codec = codec; api.inputTimeout = timeout; return api.inputResult;
}
media_status_t queue(AMediaCodec* codec, size_t index, size_t offset,
                     size_t bytes, uint64_t time, uint32_t flags) {
    ++api.calls[1]; api.codec = codec; api.index = index; api.offset = offset;
    api.bytes = bytes; api.time = time; api.flags = flags; return api.queueResult;
}
ssize_t output(AMediaCodec* codec, AMediaCodecBufferInfo* info, int64_t timeout) {
    ++api.calls[2]; api.codec = codec; api.info = info; api.outputTimeout = timeout;
    if (api.outputResult >= 0 && info) *info = {3, 789, 654321, 4};
    return api.outputResult;
}
media_status_t release(AMediaCodec* codec, size_t index, bool render) {
    ++api.calls[3]; api.codec = codec; api.releaseIndex = index; api.render = render;
    return api.releaseResult;
}
media_status_t image(AImageReader* reader, AImage** value) {
    ++api.calls[4]; api.reader = reader; api.imageOut = value;
    if (api.imageResult == AMEDIA_OK && value) *value = &api.imageValue;
    return api.imageResult;
}
media_status_t timestamp(const AImage* image, int64_t* value) {
    ++api.calls[5]; api.image = image; api.timestampOut = value;
    if (api.timestampResult == AMEDIA_OK && value) *value = api.timestampValue;
    return api.timestampResult;
}
void fault(void* fec) { ++api.calls[6]; api.fec = fec; }

template<class F> F wrapper(gxr::dbuf::HookId id) {
    return reinterpret_cast<F>(bindings.replacement[static_cast<size_t>(id)]);
}
bool named(const std::string& part) {
    for (const auto& name : trace.names) if (name.find(part) != std::string::npos) return true;
    return false;
}
void reset(bool enabled = true, bool recording = true) {
    api = Api{}; trace = Trace{}; trace.active = recording; gxr::pipeline::enable(enabled);
}
void balanced() { CHECK(trace.depth == 0); CHECK(trace.begins == trace.ends); }

void forwarding(bool enabled, bool recording) {
    reset(enabled, recording);
    AMediaCodec codec;
    AImageReader reader;
    AImage* acquired = nullptr;
    AMediaCodecBufferInfo info{};
    int64_t imageTime = 0;
    int fec = 0;
    using Id = gxr::dbuf::HookId;
    CHECK(wrapper<decltype(&AMediaCodec_dequeueInputBuffer)>(Id::DequeueInput)(&codec, 20000) == 17);
    CHECK(api.codec == &codec && api.inputTimeout == 20000);
    constexpr size_t index = (size_t(1) << 33) + 7, offset = (size_t(1) << 34) + 3;
    constexpr size_t bytes = (size_t(1) << 35) + 9;
    constexpr uint64_t time = 0x123456789abcdeULL;
    CHECK(wrapper<decltype(&AMediaCodec_queueInputBuffer)>(Id::QueueInput)(&codec, index, offset, bytes, time, 0x80000005U) == -101);
    CHECK(api.codec == &codec && api.index == index && api.offset == offset && api.bytes == bytes);
    CHECK(api.time == time && api.flags == 0x80000005U);
    CHECK(wrapper<decltype(&AMediaCodec_dequeueOutputBuffer)>(Id::DequeueOutput)(&codec, &info, 1000) == 9);
    CHECK(api.codec == &codec && api.info == &info && api.outputTimeout == 1000);
    CHECK(info.offset == 3 && info.size == 789 && info.presentationTimeUs == 654321 && info.flags == 4);
    CHECK(wrapper<decltype(&AMediaCodec_releaseOutputBuffer)>(Id::ReleaseOutput)(&codec, index, true) == -102);
    CHECK(api.codec == &codec && api.releaseIndex == index && api.render);
    CHECK(wrapper<decltype(&AImageReader_acquireLatestImage)>(Id::AcquireLatestImage)(&reader, &acquired) == AMEDIA_OK);
    CHECK(api.reader == &reader && api.imageOut == &acquired && acquired == &api.imageValue);
    CHECK(wrapper<decltype(&AImage_getTimestamp)>(Id::ImageTimestamp)(acquired, &imageTime) == AMEDIA_OK);
    CHECK(api.image == acquired && api.timestampOut == &imageTime && imageTime == 654321000);
    wrapper<void(*)(void*)>(Id::NativeFault)(&fec);
    CHECK(api.fec == &fec);
    for (auto count : api.calls) CHECK(count == 1);
    balanced();
    if (!enabled || !recording) CHECK(trace.names.empty() && trace.begins == 0);
    else {
        CHECK(named("outputResult fid=654321 a=9 b=789 c=1000"));
        CHECK(named("imageTimestamp fid=654321 a=654321000"));
        CHECK(named("nativeFault fid=-1"));
    }
}

void invalidOutputInfo() {
    reset();
    AMediaCodec codec;
    using Id = gxr::dbuf::HookId;
    auto* poisoned = reinterpret_cast<AMediaCodecBufferInfo*>(uintptr_t(1));
    for (ssize_t result : {-1, -2, -3, -10000}) {
        api.outputResult = result;
        CHECK(wrapper<decltype(&AMediaCodec_dequeueOutputBuffer)>(Id::DequeueOutput)(&codec, poisoned, 1000) == result);
        CHECK(api.info == poisoned);
    }
    CHECK(api.calls[2] == 4);
    CHECK(named("outputResult fid=-1 a=-10000 b=0 c=1000"));
    api.timestampResult = -10001;
    auto* badTime = reinterpret_cast<int64_t*>(uintptr_t(1));
    CHECK(wrapper<decltype(&AImage_getTimestamp)>(Id::ImageTimestamp)(&api.imageValue, badTime) == -10001);
    CHECK(named("imageTimestampError fid=-1 a=-10001"));
    balanced();
}

void inputWithFrame(uint32_t frame) {
    AMediaCodec codec;
    gxr::pipeline::Frame context(frame);
    CHECK(wrapper<decltype(&AMediaCodec_dequeueInputBuffer)>(gxr::dbuf::HookId::DequeueInput)(&codec, 20000) == 17);
}
void nestedFrames() {
    reset();
    AMediaCodec codec;
    using Id = gxr::dbuf::HookId;
    {
        gxr::pipeline::Frame parent(111);
        inputWithFrame(222);
        CHECK(wrapper<decltype(&AMediaCodec_dequeueInputBuffer)>(Id::DequeueInput)(&codec, 20000) == 17);
    }
    CHECK(wrapper<decltype(&AMediaCodec_dequeueInputBuffer)>(Id::DequeueInput)(&codec, 20000) == 17);
    CHECK(named("inputResult fid=222 ") && named("inputResult fid=111 ") && named("inputResult fid=-1 "));
    balanced();
}
void isolatedFrames() {
    reset();
    std::atomic<unsigned> ready{0};
    std::atomic<bool> go{false};
    std::array<std::exception_ptr, 2> errors{};
    auto worker = [&](unsigned index) {
        try {
            api = Api{}; trace = Trace{};
            const uint32_t frame = index ? 444 : 333;
            gxr::pipeline::Frame context(frame);
            ready.fetch_add(1, std::memory_order_release);
            while (!go.load(std::memory_order_acquire)) std::this_thread::yield();
            AMediaCodec codec;
            for (unsigned i = 0; i < 100; ++i) {
                CHECK(wrapper<decltype(&AMediaCodec_dequeueInputBuffer)>(gxr::dbuf::HookId::DequeueInput)(&codec, 20000) == 17);
                std::this_thread::yield();
            }
            CHECK(api.calls[0] == 100);
            CHECK(named("inputResult fid=" + std::to_string(frame) + " "));
            CHECK(!named("fid=" + std::to_string(index ? 333 : 444) + " "));
            balanced();
        } catch (...) { errors[index] = std::current_exception(); }
    };
    std::thread first(worker, 0), second(worker, 1);
    while (ready.load(std::memory_order_acquire) != 2) std::this_thread::yield();
    go.store(true, std::memory_order_release);
    first.join(); second.join();
    for (auto error : errors) if (error) std::rethrow_exception(error);
    CHECK(trace.names.empty());
}
}

extern "C" bool ATrace_isEnabled() { return test::trace.active; }
extern "C" void ATrace_beginSection(const char* name) {
    test::trace.names.emplace_back(name); ++test::trace.begins; ++test::trace.depth;
}
extern "C" void ATrace_endSection() { ++test::trace.ends; --test::trace.depth; }
namespace gxr::dbuf {
void* originalFunction(HookId id) noexcept { return test::bindings.orig[static_cast<size_t>(id)]; }
std::uintptr_t sceneAddress(std::uintptr_t offset) noexcept { return 0x1000 + offset; }
}

int main() {
    using Id = gxr::dbuf::HookId;
    auto set = [](Id id, auto pointer) { test::bindings.orig[static_cast<size_t>(id)] = reinterpret_cast<void*>(pointer); };
    set(Id::DequeueInput, &test::input); set(Id::QueueInput, &test::queue);
    set(Id::DequeueOutput, &test::output); set(Id::ReleaseOutput, &test::release);
    set(Id::AcquireLatestImage, &test::image); set(Id::ImageTimestamp, &test::timestamp);
    set(Id::NativeFault, &test::fault);
    gxr::pipeline::bind(test::bindings);
    try {
        test::forwarding(true, true);
        test::forwarding(false, true);
        test::forwarding(true, false);
        test::invalidOutputInfo();
        test::nestedFrames();
        test::isolatedFrames();
        std::puts("pipeline: 6 scenarios passed; 7 production wrappers verified");
        return 0;
    } catch (const std::exception& error) {
        std::fprintf(stderr, "pipeline FAILED: %s\n", error.what());
        return 1;
    }
}

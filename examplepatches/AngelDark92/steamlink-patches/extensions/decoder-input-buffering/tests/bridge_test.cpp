// Exercise the real bridge, with native ownership and lifecycle calls simulated.
// This does not validate Android relocation installation or headset behavior.
#define GXR_DBUF_HOST_TEST 1
#ifndef GXR_BUILD_CODE
#define GXR_BUILD_CODE 5002363
#endif
#include "../src/decoder_buffering.cpp"
#include <array>
#include <cstdio>
#include <cstdlib>
#include <condition_variable>
#include <exception>
#include <functional>
#include <stdexcept>
#include <string>
#include <thread>
#include <vector>

static bool testHooksEnabled = true;
static unsigned testInstalls = 0;
namespace gxr::dbuf {
bool hooksActive() noexcept { return testHooksEnabled; }
bool installHooks(HookBindings&, bool) noexcept { ++testInstalls; return true; }
void* originalFunction(HookId id) noexcept { return hooks.orig[static_cast<size_t>(id)]; }
std::uintptr_t sceneAddress(std::uintptr_t offset) noexcept { return hooks.base + offset; }
}

namespace test {
constexpr size_t IndexOffset = GXR_BUILD_CODE == 5002363 ? 0xd0 : 0xc8;
[[noreturn]] void fail(const char* expression, int line) {
    throw std::runtime_error("line " + std::to_string(line) + ": " + expression);
}
#define CHECK(expression) do { if (!(expression)) test::fail(#expression, __LINE__); } while (false)

struct FecEvent { std::string name; int64_t frame, a, b, c; };
std::vector<FecEvent> fecEvents;
void observeFecEvent(const char* name, int64_t frame, int64_t a, int64_t b, int64_t c) {
    fecEvents.push_back({name, frame, a, b, c});
}
std::vector<FecEvent> eventsNamed(const char* name) {
    std::vector<FecEvent> result;
    for (const auto& event : fecEvents) if (event.name == name) result.push_back(event);
    return result;
}

struct Fixture;
Fixture* current = nullptr;
uint8_t* nativeAcquire(void*, uint32_t, size_t*);
bool nativeSubmit(void*, uint8_t**, int, uint32_t, bool);
bool nativeInit(void*);
void nativeFlush(void*);
void nativeStop(void*);
void nativeDestroy(void*);
void nativePeriodic(void*);
void nativeFault(void*);
void nativeAcceptPacket(void*, void*);

template <size_t N> struct Memory {
    alignas(16) std::array<uint8_t, N> bytes{};
    void* ptr() { return bytes.data(); }
    template <class T> void put(size_t offset, T value) {
        CHECK(offset + sizeof(T) <= N);
        std::memcpy(bytes.data() + offset, &value, sizeof(T));
    }
    template <class T> T get(size_t offset) const {
        CHECK(offset + sizeof(T) <= N);
        T value{};
        std::memcpy(&value, bytes.data() + offset, sizeof(T));
        return value;
    }
};

struct Fixture {
    enum class Acquisition { Ready, Unavailable, ReinitializeUnavailable };
    Memory<0x220> codec;
    Memory<0x30> renderer;
    Memory<0x150> client;
    Memory<0x20> link;
    Memory<0xc60> fec;
    std::array<Memory<0x40>, 16> rx;
    std::array<uint8_t, 4096> input{};
    std::vector<std::string> calls;
    std::vector<uint8_t> queued;
    size_t realCapacity = input.size();
    Acquisition acquisition = Acquisition::Ready;
    bool queueSuccess = true;
    bool resetOnPeriodic = true;
    bool destroyCalled = false;
    bool runPeriodicWhilePinned = false;
    bool concurrentPacket = false;
    std::mutex gate;
    std::condition_variable changed;
    bool acquisitionReturned = false, allowPublication = false;
    bool packetPublished = false, packetThreadDone = false;
    bool timeoutStarted = false, periodicEntered = false;
    std::exception_ptr packetError, timeoutError;
    uint8_t* pinnedSentinel = nullptr;
    unsigned realAcquires = 0, realSubmits = 0, realFaults = 0;
    unsigned realStops = 0, realInits = 0, realFlushes = 0, realPeriodics = 0;
    uint32_t acquiredFrame = 0, submittedFrame = 0;
    bool submittedMarker = false;
    int submittedBytes = -1;
    std::function<void(void*, void*)> diagnosticPacketAction;
    unsigned realPackets = 0;

    explicit Fixture(bool useBuffering = true) {
        CHECK(current == nullptr);
        CHECK(states().empty());
        CHECK(packetDiagnosticContext == nullptr);
        fecEvents.clear();
        testFecEventObserver = &observeFecEvent;
        testPeriodicReturnAddress = 0;
        current = this;
        testHooksEnabled = true;
        gxr_decoder_buffering_config.mode = useBuffering ? 1 : 0;
        codec.put<void*>(RendererOffset, renderer.ptr());
        codec.put<uint8_t>(ActiveOffset, 1);
        renderer.put<void*>(0x18, client.ptr());
        renderer.put<void*>(0x10, codec.ptr());
        client.put<void*>(0x140, link.ptr());
        client.put<void*>(0x138, renderer.ptr());
        link.put<void*>(0x10, fec.ptr());
        fec.put<void*>(0xc30, client.ptr());
        for (size_t i = 0; i < rx.size(); ++i) fec.put<void*>(0x98 + i * 8, rx[i].ptr());
        input.fill(0xcd);
        hooks = {};
        hooks.base = reinterpret_cast<uintptr_t>(&nativeFault) - FaultAddress;
        bind(HookIndex::Acquire, &nativeAcquire);
        bind(HookIndex::Submit, &nativeSubmit);
        bind(HookIndex::Init, &nativeInit);
        bind(HookIndex::Flush, &nativeFlush);
        bind(HookIndex::Stop, &nativeStop);
        bind(HookIndex::Destructor, &nativeDestroy);
        bind(HookIndex::Periodic, &nativePeriodic);
        bind(HookIndex::AcceptPacket, &nativeAcceptPacket);
    }
    ~Fixture() {
        if (!destroyCalled) destroy(codec.ptr());
        states().clear();
        current = nullptr;
        testHooksEnabled = true;
        testFecEventObserver = nullptr;
        testPeriodicReturnAddress = 0;
    }
    template <class F> static void bind(HookIndex id, F function) {
        hooks.orig[static_cast<size_t>(id)] = reinterpret_cast<void*>(function);
    }
    uint8_t* reserve(uint32_t frame, size_t* returnedCapacity = nullptr) {
        size_t capacity = 123;
        auto* result = acquire(codec.ptr(), frame, &capacity);
        if (returnedCapacity) *returnedCapacity = capacity;
        if (result && buffered()) {
            CHECK(capacity == 4 * 1024 * 1024);
            rx[frame & 15].put<uint8_t*>(0x30, result);
            rx[frame & 15].put<uint32_t>(8, frame);
        }
        return result;
    }
    void complete(uint32_t frame, uint8_t* pointer) {
        rx[frame & 15].put<uint8_t*>(0x30, nullptr);
        fec.put<uint8_t*>(0x320 + (frame & 127) * 8, pointer);
    }
    uint8_t** pending(uint32_t frame) {
        return reinterpret_cast<uint8_t**>(fec.bytes.data() + 0x320 + (frame & 127) * 8);
    }
    void clearReferences() {
        for (auto& frame : rx) frame.put<uint8_t*>(0x30, nullptr);
        for (size_t i = 0; i < 128; ++i) fec.put<uint8_t*>(0x320 + i * 8, nullptr);
    }
    bool referenced(uint8_t* pointer) {
        for (auto& frame : rx) if (frame.get<uint8_t*>(0x30) == pointer) return true;
        for (size_t i = 0; i < 128; ++i)
            if (fec.get<uint8_t*>(0x320 + i * 8) == pointer) return true;
        return false;
    }
};

uint8_t* nativeAcquire(void* codec, uint32_t frame, size_t* capacity) {
    auto& f = *current;
    CHECK(codec == f.codec.ptr());
    f.calls.emplace_back("acquire");
    ++f.realAcquires;
    f.acquiredFrame = frame;
    if (f.acquisition == Fixture::Acquisition::ReinitializeUnavailable) {
        CHECK(state(codec)->pinned == 1);
        CHECK(f.pinnedSentinel && f.referenced(f.pinnedSentinel));
        const auto byte = f.pinnedSentinel[0];
        stop(codec);
        CHECK(f.pinnedSentinel[0] == byte);
        CHECK(init(codec));
        CHECK(f.pinnedSentinel[0] == byte);
        CHECK(state(codec)->pool.find(f.pinnedSentinel)->leased);
        if (f.runPeriodicWhilePinned) {
            const auto leases = state(codec)->pool.leased;
            periodic(f.fec.ptr());
            CHECK(state(codec)->pool.leased == leases);
        }
        return nullptr;
    }
    if (f.acquisition == Fixture::Acquisition::Unavailable || !capacity) return nullptr;
    *capacity = f.realCapacity;
    f.codec.put<int64_t>(IndexOffset + (frame & 15) * 8, 9);
    return f.input.data();
}
bool nativeSubmit(void* codec, uint8_t** data, int bytes, uint32_t frame, bool marker) {
    auto& f = *current;
    CHECK(codec == f.codec.ptr());
    CHECK(data && *data == f.input.data());
    CHECK(bytes >= 0 && size_t(bytes) <= f.input.size());
    CHECK(f.codec.get<int64_t>(IndexOffset + (frame & 15) * 8) == 9);
    f.codec.put<int64_t>(IndexOffset + (frame & 15) * 8, -1);
    f.calls.emplace_back("submit");
    ++f.realSubmits;
    f.submittedFrame = frame;
    f.submittedMarker = marker;
    f.submittedBytes = bytes;
    f.queued.assign(*data, *data + bytes);
    if (!f.queueSuccess) {
        nativeFault(f.fec.ptr()); // The stock queue-failure branch signals FEC.
        return false;
    }
    *data = nullptr;
    return true;
}
bool nativeInit(void* codec) {
    auto& f = *current;
    CHECK(codec == f.codec.ptr());
    ++f.realInits;
    f.calls.emplace_back("init");
    f.codec.put<uint8_t>(ActiveOffset, 1);
    return true;
}
void nativeFlush(void* codec) {
    auto& f = *current;
    CHECK(codec == f.codec.ptr());
    ++f.realFlushes;
    f.calls.emplace_back("flush");
    if (f.pinnedSentinel) CHECK(f.referenced(f.pinnedSentinel));
    // Stock Flush does not clear FEC's RX/pending references.
}
void nativeStop(void* codec) {
    auto& f = *current;
    CHECK(codec == f.codec.ptr());
    ++f.realStops;
    f.calls.emplace_back("stop");
    f.codec.put<uint8_t>(ActiveOffset, 0);
}
void nativeDestroy(void* codec) {
    auto& f = *current;
    CHECK(codec == f.codec.ptr());
    CHECK(!f.destroyCalled);
    f.destroyCalled = true;
    f.calls.emplace_back("destroy");
    stop(codec); // Actual D2 invokes Stop before destroying its own members.
}
void nativePeriodic(void* fec) {
    auto& f = *current;
    CHECK(fec == f.fec.ptr());
    if (f.concurrentPacket) {
        std::lock_guard<std::mutex> lock(f.gate);
        if (f.timeoutStarted) {
            f.periodicEntered = true;
            f.changed.notify_all();
            CHECK(f.packetPublished);
        }
    }
    ++f.realPeriodics;
    f.calls.emplace_back("periodic");
    if (f.resetOnPeriodic && f.fec.get<uint8_t>(0xc50)) {
        f.fec.put<uint8_t>(0xc50, 0);
        flush(f.codec.ptr());
        f.clearReferences(); // This happens after codec Flush returns.
        for (auto& rx : f.rx) rx.put<uint8_t>(0xc, 0);
    }
}
void nativeFault(void* fec) {
    auto& f = *current;
    CHECK(fec == f.fec.ptr());
    ++f.realFaults;
    f.calls.emplace_back("fault");
    f.fec.put<uint8_t>(0xc50, 1);
}
void nativeAcceptPacket(void* fec, void* packet) {
    auto& f = *current;
    ++f.realPackets;
    if (f.diagnosticPacketAction) {
        f.diagnosticPacketAction(fec, packet);
        return;
    }
    CHECK(fec == f.fec.ptr() && packet == &f);
    periodic(fec); // Stock packet entry checks errors before Initialize/Acquire.
    size_t capacity = 0;
    auto* staging = acquire(f.codec.ptr(), 23, &capacity);
    CHECK(staging && capacity == 4 * 1024 * 1024);
    staging[0] = 0x72;
    {
        std::unique_lock<std::mutex> lock(f.gate);
        f.acquisitionReturned = true;
        f.pinnedSentinel = staging;
        f.changed.notify_all();
        f.changed.wait(lock, [&] { return f.allowPublication; });
        // This is the native Initialize publication that happens after Acquire returns.
        f.rx[23 & 15].put<uint8_t*>(0x30, staging);
        f.packetPublished = true;
    }
}

void duplicateSnapshotsFollowOriginalRecovery() {
    Fixture f(false);
    gxr_decoder_buffering_config.mode = 2;
    constexpr uint16_t fid = 23;
    Memory<8> packet;
    packet.put<uint16_t>(2, fid);
    f.fec.put<uint32_t>(0x920 + 4 * (fid & 127), fid);
    f.rx[fid & 15].put<uint8_t>(0xc, 1);
    nativeFault(f.fec.ptr());
    f.diagnosticPacketAction = [&](void* fec, void*) {
        CHECK(packetDiagnosticContext && packetDiagnosticContext->frame == fid);
        testPeriodicReturnAddress = hooks.base + AcceptPacketPeriodicReturn;
        periodic(fec);
        const auto candidate = eventsNamed("fecDuplicateCandidate");
        CHECK(candidate.size() == 1 && candidate[0].a == 4); // Flag already cleared by original.
        size_t capacity = 0;
        CHECK(acquire(f.codec.ptr(), fid, &capacity) == f.input.data());
        CHECK(capacity == f.input.size());
    };
    acceptPacket(f.fec.ptr(), packet.ptr());
    CHECK(packetDiagnosticContext == nullptr);
    CHECK(f.realPackets == 1 && f.realPeriodics == 1 && f.realFlushes == 1 && f.realAcquires == 1);
    const auto candidate = eventsNamed("fecDuplicateCandidate");
    CHECK(candidate.size() == 1 && candidate[0].frame == fid && candidate[0].b == 0 && candidate[0].c == fid);
    const auto acquired = eventsNamed("fecAcquireState");
    CHECK(acquired.size() == 1 && acquired[0].frame == fid && acquired[0].c == fid);
    const auto outcomes = eventsNamed("fecPacketOutcome");
    CHECK(outcomes.size() == 1 && outcomes[0].a == 4 && outcomes[0].b == 1 && outcomes[0].c == 1);
}

void nestedPacketContextRestoresAndClassifiesOnlyMatchingFec() {
    Fixture f(false);
    gxr_decoder_buffering_config.mode = 2;
    Memory<8> outer, inner;
    Memory<0xc60> otherFec;
    outer.put<uint16_t>(2, 41);
    inner.put<uint16_t>(2, 42);
    f.fec.put<uint32_t>(0x11c + 4 * 41, 41);
    f.fec.put<uint32_t>(0x11c + 4 * 42, 42);
    otherFec.put<uint32_t>(0x11c + 4 * 41, 77);
    otherFec.put<uint32_t>(0x920 + 4 * 41, 88);
    f.diagnosticPacketAction = [&](void* fec, void* packet) {
        const auto fid = read<uint16_t>(packet, 2);
        testPeriodicReturnAddress = hooks.base + AcceptPacketPeriodicReturn;
        periodic(fec);
        if (fid == 41) {
            auto* saved = packetDiagnosticContext;
            acceptPacket(fec, inner.ptr());
            CHECK(packetDiagnosticContext == saved && packetDiagnosticContext->frame == 41);
        }
        size_t capacity = 0;
        CHECK(acquire(f.codec.ptr(), fid, &capacity));
        if (fid == 41) {
            f.link.put<void*>(0x10, otherFec.ptr());
            CHECK(acquire(f.codec.ptr(), fid, &capacity));
            f.link.put<void*>(0x10, f.fec.ptr());
        }
    };
    acceptPacket(f.fec.ptr(), outer.ptr());
    CHECK(packetDiagnosticContext == nullptr);
    CHECK(f.realPackets == 2 && f.realPeriodics == 2 && f.realAcquires == 3);
    const auto acquired = eventsNamed("fecAcquireState");
    CHECK(acquired.size() == 3);
    CHECK(acquired[0].c == 42 && acquired[1].c == 41);
    CHECK(acquired[2].c == -1 && acquired[2].a == 77 && acquired[2].b == 88);
    const auto outcomes = eventsNamed("fecPacketOutcome");
    CHECK(outcomes.size() == 2 && outcomes[0].frame == 42 && outcomes[1].frame == 41);
    CHECK(outcomes[0].b == 1 && outcomes[1].b == 1 && outcomes[0].c == 1 && outcomes[1].c == 1);
}

void diagnosticSnapshotsExcludeOtherPeriodicCallsAndNonCandidates() {
    Fixture f(false);
    gxr_decoder_buffering_config.mode = 2;
    Memory<8> packet;
    packet.put<uint16_t>(2, 9);
    f.fec.put<uint32_t>(0x920 + 4 * 9, 9);
    testPeriodicReturnAddress = hooks.base + AcceptPacketPeriodicReturn;
    periodic(f.fec.ptr()); // Correct address, no packet context: no snapshot.
    CHECK(fecEvents.empty());
    f.diagnosticPacketAction = [&](void* fec, void*) {
        testPeriodicReturnAddress = hooks.base + AcceptPacketPeriodicReturn + 4;
        periodic(fec); // Packet context, wrong return address: no snapshot.
        CHECK(packetDiagnosticContext->snapshots == 0);
        testPeriodicReturnAddress = hooks.base + AcceptPacketPeriodicReturn;
        Memory<0xc60> other;
        snapshotAfterPacketPeriodic(other.ptr(), testPeriodicReturnAddress);
        CHECK(packetDiagnosticContext->snapshots == 0);
        f.fec.put<uint32_t>(0x920 + 4 * 9, 10);
        periodic(fec); // Exact callsite with no marker match: no candidate/outcome.
        CHECK(packetDiagnosticContext->snapshots == 1);
    };
    acceptPacket(f.fec.ptr(), packet.ptr());
    CHECK(fecEvents.empty() && f.realPackets == 1 && f.realPeriodics == 3);
    // Plain Observe must not attach any diagnostic packet context.
    gxr_decoder_buffering_config.mode = 0;
    f.diagnosticPacketAction = [&](void* fec, void*) {
        CHECK(packetDiagnosticContext == nullptr);
        periodic(fec);
    };
    acceptPacket(f.fec.ptr(), packet.ptr());
    CHECK(fecEvents.empty() && packetDiagnosticContext == nullptr);
}

void installBindings() {
    Fixture f;
    const auto installsBefore = testInstalls;
    install();
    CHECK(testInstalls == installsBefore + 1);
    CHECK(hooks.replacement[static_cast<size_t>(HookIndex::Acquire)] == reinterpret_cast<void*>(&acquire));
    CHECK(hooks.replacement[static_cast<size_t>(HookIndex::Periodic)] == reinterpret_cast<void*>(&periodic));
}
void deferredAcquisitionAndCopy() {
    Fixture f;
    const uint32_t frame = 65535;
    auto* staging = f.reserve(frame);
    CHECK(staging && staging != f.input.data());
    CHECK(f.realAcquires == 0 && f.realSubmits == 0);
    std::array<uint8_t, 257> expected{};
    for (size_t i = 0; i < expected.size(); ++i) staging[i] = expected[i] = uint8_t(i * 37 + 11);
    f.complete(frame, staging);
    CHECK(submit(f.codec.ptr(), f.pending(frame), int(expected.size()), frame, true));
    CHECK(f.realAcquires == 1 && f.realSubmits == 1 && f.realFaults == 0);
    CHECK(f.acquiredFrame == frame && f.submittedFrame == frame && f.submittedMarker);
    CHECK(f.submittedBytes == int(expected.size()));
    CHECK(std::equal(expected.begin(), expected.end(), f.queued.begin(), f.queued.end()));
    CHECK(f.input[expected.size()] == 0xcd);
    CHECK(*f.pending(frame) == nullptr && state(f.codec.ptr())->pool.leased == 0);
    CHECK(state(f.codec.ptr())->copyBytes == expected.size());
    CHECK(f.calls == std::vector<std::string>({"acquire", "submit"}));
}
void falseMarkerAndReusedRxFrame() {
    Fixture f;
    auto* staging = f.reserve(1);
    staging[0] = 0x7a;
    // Stock RX Initialize can reuse the same raw pointer for frameID +16.
    f.rx[1].put<uint32_t>(8, 17);
    f.complete(17, staging);
    CHECK(submit(f.codec.ptr(), f.pending(17), 1, 17, false));
    CHECK(f.realSubmits == 1 && !f.submittedMarker && f.submittedFrame == 17);
    CHECK(f.queued == std::vector<uint8_t>({0x7a}));
}
void inputUnavailableRequestsRecovery() {
    Fixture f;
    auto* staging = f.reserve(7);
    f.complete(7, staging);
    f.acquisition = Fixture::Acquisition::Unavailable;
    CHECK(!submit(f.codec.ptr(), f.pending(7), 8, 7, true));
    CHECK(f.realAcquires == 1 && f.realSubmits == 0 && f.realFaults == 1);
    CHECK(f.fec.get<uint8_t>(0xc50) == 1 && *f.pending(7) == staging);
    CHECK(state(f.codec.ptr())->pool.leased == 1);
    f.pinnedSentinel = staging;
    periodic(f.fec.ptr());
    CHECK(f.realFlushes == 1 && state(f.codec.ptr())->pool.leased == 0);
    f.pinnedSentinel = nullptr;
}
void actualCapacityRejectsCopy() {
    Fixture f;
    auto* staging = f.reserve(9);
    std::memset(staging, 0x17, 64);
    f.complete(9, staging);
    f.realCapacity = 63;
    CHECK(!submit(f.codec.ptr(), f.pending(9), 64, 9, true));
    CHECK(f.realAcquires == 1 && f.realSubmits == 0 && f.realFaults == 1);
    CHECK(std::all_of(f.input.begin(), f.input.end(), [](uint8_t b) { return b == 0xcd; }));
    CHECK(state(f.codec.ptr())->copyBytes == 0 && *f.pending(9) == staging);
    CHECK(f.codec.get<int64_t>(IndexOffset + 9 * 8) == 9); // Held until actual recovery.
}
void nativeQueueFailureRetainsOwnership() {
    Fixture f;
    auto* staging = f.reserve(3);
    staging[0] = 0x49;
    f.complete(3, staging);
    f.queueSuccess = false;
    CHECK(!submit(f.codec.ptr(), f.pending(3), 1, 3, true));
    CHECK(f.realSubmits == 1 && f.fec.get<uint8_t>(0xc50) == 1);
    CHECK(f.realFaults >= 1 && state(f.codec.ptr())->submitted == 0);
    CHECK(*f.pending(3) == staging && state(f.codec.ptr())->pool.find(staging)->leased);
    periodic(f.fec.ptr());
    CHECK(!state(f.codec.ptr())->pool.find(staging)->leased);
}
void nestedStopInitQuarantinesUntilReset() {
    Fixture f;
    auto* staging = f.reserve(13);
    staging[0] = 0x69;
    f.complete(13, staging);
    auto s = state(f.codec.ptr());
    const auto oldGeneration = s->pool.generation;
    f.pinnedSentinel = staging;
    f.acquisition = Fixture::Acquisition::ReinitializeUnavailable;
    f.runPeriodicWhilePinned = true;
    CHECK(!submit(f.codec.ptr(), f.pending(13), 1, 13, true));
    CHECK(f.realStops == 1 && f.realInits == 1 && f.realSubmits == 0);
    CHECK(s->pinned == 0 && s->pool.generation > oldGeneration);
    CHECK(s->pool.find(staging)->leased && staging[0] == 0x69);
    CHECK(!s->pool.valid(s->pool.find(staging), oldGeneration));
    // Model an ordinary check separately from the fault-driven reset below.
    f.fec.put<uint8_t>(0xc50, 0);
    periodic(f.fec.ptr());
    CHECK(s->pool.find(staging)->leased);
    f.acquisition = Fixture::Acquisition::Ready;
    auto* next = f.reserve(14);
    CHECK(next != staging && staging[0] == 0x69);
    const auto acquisitions = f.realAcquires;
    CHECK(!submit(f.codec.ptr(), f.pending(13), 1, 13, true));
    CHECK(f.realAcquires == acquisitions); // Old-generation bytes never reach codec.
    f.resetOnPeriodic = true;
    periodic(f.fec.ptr());
    CHECK(s->pool.leased == 0 && *f.pending(13) == nullptr);
    f.pinnedSentinel = nullptr;
    CHECK(f.reserve(15) == staging);
}
void referencesPreventEarlyReuseAndPoolIsBounded() {
    Fixture f;
    std::array<uint8_t*, 24> pointers{};
    for (uint32_t i = 0; i < pointers.size(); ++i) {
        pointers[i] = f.reserve(i);
        CHECK(pointers[i]);
        pointers[i][0] = uint8_t(i + 1);
        if (i >= 16) f.complete(i, pointers[i]);
    }
    // Frames 16..23 replaced RX slots 0..7, so preserve those originals in pending too.
    for (size_t i = 0; i < 8; ++i) f.fec.put<uint8_t*>(0x320 + (i + 64) * 8, pointers[i]);
    auto s = state(f.codec.ptr());
    CHECK(s->pool.leased == 24 && s->pool.allocated == 24 * size_t(4 * 1024 * 1024));
    CHECK(f.realAcquires == 0);
    size_t cap = 55;
    CHECK(acquire(f.codec.ptr(), 100, &cap) == nullptr && cap == 0);
    CHECK(f.realFaults == 1 && f.realAcquires == 0);
    f.fec.put<uint8_t>(0xc50, 0);
    flush(f.codec.ptr());
    periodic(f.fec.ptr());
    CHECK(s->pool.leased == 24);
    for (size_t i = 0; i < pointers.size(); ++i) CHECK(pointers[i][0] == i + 1);
    f.fec.put<uint8_t*>(0x320 + 64 * 8, nullptr);
    periodic(f.fec.ptr());
    // Ordinary per-packet checks never scan/reclaim, even for an absent lease.
    CHECK(s->pool.leased == 24);
    nativeFault(f.fec.ptr());
    periodic(f.fec.ptr());
    CHECK(s->pool.leased == 0);
    CHECK(f.reserve(100) == pointers[0]);
    CHECK(s->pool.allocated == 24 * size_t(4 * 1024 * 1024));
}
void observeModeAndInactiveHooksDelegate() {
    for (bool activeHooks : {true, false}) {
        Fixture f(false);
        testHooksEnabled = activeHooks;
        size_t capacity = 0;
        auto* input = acquire(f.codec.ptr(), 19, &capacity);
        CHECK(input == f.input.data() && capacity == f.realCapacity);
        CHECK(f.realAcquires == 1);
        input[0] = 0x42;
        CHECK(submit(f.codec.ptr(), &input, 1, 19, false));
        CHECK(input == nullptr && f.realSubmits == 1 && f.realFaults == 0);
        CHECK(!f.submittedMarker);
        if (activeHooks) {
            auto s = state(f.codec.ptr());
            CHECK(s->pool.allocated == 0 && s->pool.leased == 0);
            CHECK(s->observedHigh == 1 && !s->observed[19 & 15]);
        } else CHECK(states().empty());
        f.acquisition = Fixture::Acquisition::Unavailable;
        CHECK(acquire(f.codec.ptr(), 20, &capacity) == nullptr);
        CHECK(f.realFaults == 0); // Observation does not create extra failures.
    }
}
void invalidInputRejectsWithoutNativeAcquisition() {
    Fixture f;
    uint8_t alien = 0;
    uint8_t* pointer = &alien;
    CHECK(!submit(f.codec.ptr(), &pointer, 1, 1, true));
    CHECK(!submit(f.codec.ptr(), nullptr, 1, 1, true));
    auto* staging = f.reserve(2);
    f.complete(2, staging);
    CHECK(!submit(f.codec.ptr(), f.pending(2), -1, 2, true));
    CHECK(!submit(f.codec.ptr(), f.pending(2), 4 * 1024 * 1024 + 1, 2, true));
    CHECK(f.realAcquires == 0 && f.realSubmits == 0 && f.realFaults == 4);
}
void destructorErasesStateAfterOriginal() {
    Fixture f;
    auto* staging = f.reserve(1);
    CHECK(staging);
    std::weak_ptr<State> weak = state(f.codec.ptr());
    f.clearReferences(); // Matches parent's shutdown-before-codec-destruction contract.
    destroy(f.codec.ptr());
    CHECK(f.destroyCalled && f.realStops == 1);
    CHECK(states().empty() && weak.expired());
    CHECK(f.calls == std::vector<std::string>({"destroy", "stop"}));
}
void timeoutCannotRacePacketPublication() {
    Fixture f;
    f.concurrentPacket = true;
    std::thread receiver([&] {
        try { acceptPacket(f.fec.ptr(), &f); }
        catch (...) { f.packetError = std::current_exception(); }
        std::lock_guard<std::mutex> lock(f.gate);
        f.packetThreadDone = true;
        f.changed.notify_all();
    });
    bool reachedPublicationGap = false;
    {
        std::unique_lock<std::mutex> lock(f.gate);
        reachedPublicationGap = f.changed.wait_for(lock, std::chrono::seconds(3), [&] {
            return f.acquisitionReturned || f.packetThreadDone;
        }) && f.acquisitionReturned;
    }
    // This directly proves the real packet wrapper still owns its mutex after
    // the inner Acquire has returned; it does not depend on thread scheduling.
    const bool unexpectedlyUnlocked = mutex().try_lock();
    if (unexpectedlyUnlocked) mutex().unlock();
    std::thread timeout([&] {
        try {
            nativeFault(f.fec.ptr()); // Simulate a different transfer's fault.
            {
                std::lock_guard<std::mutex> lock(f.gate);
                f.timeoutStarted = true;
                f.changed.notify_all();
            }
            periodic(f.fec.ptr());
        } catch (...) { f.timeoutError = std::current_exception(); }
    });
    bool timeoutAttempted = false, enteredBeforePublication = false;
    {
        std::unique_lock<std::mutex> lock(f.gate);
        timeoutAttempted = f.changed.wait_for(lock, std::chrono::seconds(3), [&] {
            return f.timeoutStarted;
        });
        enteredBeforePublication = f.changed.wait_for(lock, std::chrono::milliseconds(50), [&] {
            return f.periodicEntered;
        });
        f.allowPublication = true;
        f.changed.notify_all();
    }
    // Always release and join before reporting a failed assertion.
    receiver.join();
    timeout.join();
    if (f.packetError) std::rethrow_exception(f.packetError);
    if (f.timeoutError) std::rethrow_exception(f.timeoutError);
    CHECK(reachedPublicationGap && timeoutAttempted);
    CHECK(!unexpectedlyUnlocked && !enteredBeforePublication);
    CHECK(f.packetPublished && f.periodicEntered && f.realFlushes == 1);
    CHECK(f.realAcquires == 0 && state(f.codec.ptr())->pool.leased == 0);
    CHECK(!f.referenced(f.pinnedSentinel));
    f.pinnedSentinel = nullptr;
}
}

int main() {
    struct Case { const char* name; void (*run)(); };
    const Case cases[] = {
        {"install bindings", test::installBindings},
        {"deferred acquisition and exact copy", test::deferredAcquisitionAndCopy},
        {"false marker and reused RX frame", test::falseMarkerAndReusedRxFrame},
        {"unavailable input signals recovery", test::inputUnavailableRequestsRecovery},
        {"real codec capacity rejects copy", test::actualCapacityRejectsCopy},
        {"queue failure retains ownership", test::nativeQueueFailureRetainsOwnership},
        {"nested Stop/Init quarantine and reset", test::nestedStopInitQuarantinesUntilReset},
        {"references prevent reuse and pool bound", test::referencesPreventEarlyReuseAndPoolIsBounded},
        {"observe and inactive hook pass-through", test::observeModeAndInactiveHooksDelegate},
        {"invalid ownership and size", test::invalidInputRejectsWithoutNativeAcquisition},
        {"destructor erases state", test::destructorErasesStateAfterOriginal},
        {"timeout serializes with packet publication", test::timeoutCannotRacePacketPublication},
        {"duplicate snapshot follows original recovery", test::duplicateSnapshotsFollowOriginalRecovery},
        {"nested packet context and matching FEC classification", test::nestedPacketContextRestoresAndClassifiesOnlyMatchingFec},
        {"exclude unrelated periodic calls and non-candidates", test::diagnosticSnapshotsExcludeOtherPeriodicCallsAndNonCandidates},
    };
    for (const auto& item : cases) {
        try {
            item.run();
            std::printf("PASS %s\n", item.name);
        } catch (const std::exception& e) {
            std::fprintf(stderr, "FAIL %s: %s\n", item.name, e.what());
            return 1;
        }
    }
    std::printf("bridge tests: %zu passed (build %d)\n", sizeof(cases) / sizeof(cases[0]), GXR_BUILD_CODE);
}

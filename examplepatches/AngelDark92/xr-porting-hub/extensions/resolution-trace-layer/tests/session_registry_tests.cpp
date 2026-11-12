#include "../src/session_registry.h"

#include <atomic>
#include <condition_variable>
#include <exception>
#include <iostream>
#include <stdexcept>
#include <string>
#include <thread>
#include <type_traits>

namespace {

// Unlike assert(), these checks still execute with NDEBUG/Release enabled.
#define CHECK(condition) do { \
    if (!(condition)) throw std::runtime_error( \
        std::string(__FILE__) + ":" + std::to_string(__LINE__) + ": " #condition); \
} while (false)

struct State {
    explicit State(int value, std::shared_ptr<std::atomic<int>> destroyed = {})
        : identity(value), destructions(std::move(destroyed)) {}
    ~State() {
        if (destructions) ++*destructions;
    }

    int identity;
    int frames{};
    std::shared_ptr<std::atomic<int>> destructions;
};

using Registry = gxr::SessionRegistry<uint64_t, State>;
using Cache = Registry::RenderCache;

static_assert(std::is_same_v<decltype(std::declval<Registry&>().findForFrame(
    uint64_t{}, std::declval<Cache&>())), State*>);

void cacheHitsDoNotRetainOwnership() {
    Registry registry;
    Cache cache;
    auto destroyed = std::make_shared<std::atomic<int>>(0);
    registry.insert(7, std::make_shared<State>(1, destroyed));
    auto owner = registry.find(7);
    CHECK(owner.use_count() == 2);
    for (int frame = 0; frame < 10000; ++frame) {
        CHECK(registry.findForFrame(7, cache) == owner.get());
        CHECK(owner.use_count() == 2);
    }
    std::weak_ptr<State> weak = owner;
    owner.reset();
    auto removed = registry.erase(7);
    CHECK(removed.use_count() == 1);
    removed.reset();
    CHECK(weak.expired());
    CHECK(destroyed->load() == 1);
    CHECK(registry.findForFrame(7, cache) == nullptr);
}

void negativeLookupIsInvalidatedByInsert() {
    Registry registry;
    Cache cache;
    CHECK(registry.findForFrame(11, cache) == nullptr);
    const auto missingGeneration = cache.generation;
    CHECK(registry.findForFrame(11, cache) == nullptr);
    registry.insert(11, std::make_shared<State>(2));
    CHECK(registry.findForFrame(11, cache)->identity == 2);
    CHECK(cache.generation != missingGeneration);
}

void erasedHandleMayBeReused() {
    Registry registry;
    Cache cache;
    auto destroyed = std::make_shared<std::atomic<int>>(0);
    registry.insert(9, std::make_shared<State>(3, destroyed));
    CHECK(registry.findForFrame(9, cache)->identity == 3);
    const auto oldGeneration = cache.generation;
    registry.erase(9).reset();
    CHECK(destroyed->load() == 1);
    registry.insert(9, std::make_shared<State>(4, destroyed));
    CHECK(registry.findForFrame(9, cache)->identity == 4);
    CHECK(cache.generation != oldGeneration);
    CHECK(destroyed->load() == 1);
}

void unrelatedMutationsRefreshWithoutChangingState() {
    Registry registry;
    Cache cache;
    registry.insert(1, std::make_shared<State>(5));
    auto* original = registry.findForFrame(1, cache);
    const auto beforeInsert = cache.generation;
    registry.insert(2, std::make_shared<State>(6));
    CHECK(registry.findForFrame(1, cache) == original);
    CHECK(cache.generation != beforeInsert);
    const auto beforeErase = cache.generation;
    registry.erase(2).reset();
    CHECK(registry.findForFrame(1, cache) == original);
    CHECK(cache.generation != beforeErase);
    CHECK(registry.erase(2) == nullptr);
    CHECK(registry.findForFrame(1, cache) == original);
}

void instanceClearDoesNotResetGeneration() {
    // The process-lifetime registry remains alive when an OpenXR instance is
    // destroyed/recreated; cached render threads can survive that transition.
    Registry registry;
    Cache cache;
    auto destroyed = std::make_shared<std::atomic<int>>(0);
    registry.insert(15, std::make_shared<State>(7, destroyed));
    registry.insert(16, std::make_shared<State>(8, destroyed));
    CHECK(registry.findForFrame(15, cache)->identity == 7);
    const auto oldGeneration = cache.generation;
    auto retired = registry.clear();
    CHECK(retired.size() == 2);
    CHECK(registry.find(15) == nullptr);
    CHECK(registry.find(16) == nullptr);
    CHECK(destroyed->load() == 0);
    retired.clear();
    CHECK(destroyed->load() == 2);
    registry.insert(15, std::make_shared<State>(9));
    CHECK(registry.findForFrame(15, cache)->identity == 9);
    CHECK(cache.generation > oldGeneration);
    registry.clear().clear();
    CHECK(registry.findForFrame(15, cache) == nullptr);
    const auto emptyGeneration = cache.generation;
    CHECK(registry.clear().empty());
    CHECK(registry.findForFrame(15, cache) == nullptr);
    CHECK(cache.generation > emptyGeneration);
}

void cacheDistinguishesRegistryIdentity() {
    Registry first;
    Registry second;
    Cache cache;
    first.insert(23, std::make_shared<State>(10));
    second.insert(23, std::make_shared<State>(11));
    CHECK(first.findForFrame(23, cache)->identity == 10);
    const auto generation = cache.generation;
    CHECK(second.findForFrame(23, cache)->identity == 11);
    CHECK(cache.generation == generation);
    CHECK(first.findForFrame(23, cache)->identity == 10);
}

void ownedEventReaderSurvivesErase() {
    Registry registry;
    Cache cache;
    auto destroyed = std::make_shared<std::atomic<int>>(0);
    registry.insert(31, std::make_shared<State>(12, destroyed));
    auto eventReader = registry.find(31);
    CHECK(registry.findForFrame(31, cache) == eventReader.get());
    registry.erase(31).reset();
    CHECK(eventReader->identity == 12);
    CHECK(eventReader.use_count() == 1);
    CHECK(destroyed->load() == 0);
    CHECK(registry.findForFrame(31, cache) == nullptr);
    registry.insert(31, std::make_shared<State>(13));
    CHECK(registry.findForFrame(31, cache)->identity == 13);
    CHECK(eventReader->identity == 12);
    eventReader.reset();
    CHECK(destroyed->load() == 1);
}

// A persistent render thread, with a cache that remains alive between jobs.
// run() waits for completion, deliberately providing the external synchronization
// required between frame use and lifecycle mutations (not a reclamation stress test).
class RenderWorker {
public:
    explicit RenderWorker(Registry& registry) : registry_(registry), thread_([this] { loop(); }) {}
    ~RenderWorker() {
        {
            std::lock_guard<std::mutex> lock(mutex_);
            stopping_ = true;
        }
        changed_.notify_all();
        thread_.join();
    }

    void run(uint64_t handle, int expectedIdentity) {
        std::unique_lock<std::mutex> lock(mutex_);
        handle_ = handle;
        expectedIdentity_ = expectedIdentity;
        error_ = nullptr;
        pending_ = true;
        changed_.notify_all();
        changed_.wait(lock, [this] { return !pending_; });
        if (error_) std::rethrow_exception(error_);
    }

private:
    void loop() {
        Cache cache;
        std::unique_lock<std::mutex> lock(mutex_);
        while (true) {
            changed_.wait(lock, [this] { return pending_ || stopping_; });
            if (stopping_) return;
            try {
                auto* state = registry_.findForFrame(handle_, cache);
                CHECK(registry_.findForFrame(handle_, cache) == state);
                if (expectedIdentity_ < 0) {
                    CHECK(state == nullptr);
                } else {
                    CHECK(state != nullptr);
                    CHECK(state->identity == expectedIdentity_);
                    ++state->frames;
                }
            } catch (...) {
                error_ = std::current_exception();
            }
            pending_ = false;
            changed_.notify_all();
        }
    }

    Registry& registry_;
    std::mutex mutex_;
    std::condition_variable changed_;
    bool stopping_{};
    bool pending_{};
    uint64_t handle_{};
    int expectedIdentity_{};
    std::exception_ptr error_;
    // Start only after every shared worker field has been initialized.
    std::thread thread_;
};

void serializedRenderHandoffAndLongLivedCaches() {
    Registry registry;
    RenderWorker first(registry);
    RenderWorker second(registry);
    auto destroyed = std::make_shared<std::atomic<int>>(0);
    first.run(41, -1);
    second.run(41, -1);
    registry.insert(41, std::make_shared<State>(20, destroyed));
    for (int frame = 0; frame < 100; ++frame) {
        first.run(41, 20);
        second.run(41, 20);
    }
    CHECK(registry.find(41)->frames == 200);
    registry.erase(41).reset();
    CHECK(destroyed->load() == 1);
    registry.insert(41, std::make_shared<State>(21, destroyed));
    first.run(41, 21);
    second.run(41, 21);
    CHECK(registry.find(41)->frames == 2);
    registry.clear().clear();
    CHECK(destroyed->load() == 2);
    first.run(41, -1);
    registry.insert(41, std::make_shared<State>(22, destroyed));
    // The 2nd thread skips the empty generation altogether, just as a render
    // thread may sleep throughout session destruction and instance recreation.
    second.run(41, 22);
    first.run(41, 22);
    CHECK(registry.find(41)->frames == 2);
    registry.clear().clear();
    CHECK(destroyed->load() == 3);
    first.run(41, -1);
    second.run(41, -1);
}

} // namespace

int main() {
    try {
        cacheHitsDoNotRetainOwnership();
        negativeLookupIsInvalidatedByInsert();
        erasedHandleMayBeReused();
        unrelatedMutationsRefreshWithoutChangingState();
        instanceClearDoesNotResetGeneration();
        cacheDistinguishesRegistryIdentity();
        ownedEventReaderSurvivesErase();
        serializedRenderHandoffAndLongLivedCaches();
        std::cout << "Session registry: 8 tests passed\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}

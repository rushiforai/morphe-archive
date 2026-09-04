#pragma once

#include <atomic>
#include <cstdint>
#include <map>
#include <memory>
#include <mutex>
#include <utility>
#include <vector>

namespace gxr {

// The registry owns live sessions; caches never own them. A generation check avoids
// both the map mutex and shared_ptr reference-count RMWs on steady xrEndFrame calls.
// This is NOT a general-purpose concurrent reclamation scheme: the caller must obey
// OpenXR's external synchronization of session/instance destruction with frame use.
// Concurrent event readers instead use find(), which returns shared ownership.
// Keep the registry alive for the lifetime of its caches (production uses 1 global
// registry). Reuse clear(), not destruction/placement-new at the same address.
template <typename Handle, typename State>
class SessionRegistry {
public:
    struct RenderCache {
        const SessionRegistry* registry{};
        Handle handle{};
        uint64_t generation{};
        State* state{};
    };

    void insert(Handle handle, std::shared_ptr<State> state) {
        std::lock_guard<std::mutex> lock(mutex_);
        sessions_[handle] = std::move(state);
        invalidate();
    }

    std::shared_ptr<State> find(Handle handle) {
        std::lock_guard<std::mutex> lock(mutex_);
        const auto iterator = sessions_.find(handle);
        return iterator == sessions_.end() ? nullptr : iterator->second;
    }

    State* findForFrame(Handle handle, RenderCache& cache) {
        const auto generation = generation_.load(std::memory_order_acquire);
        if (cache.registry == this && cache.handle == handle &&
            cache.generation == generation) {
            return cache.state;
        }
        std::lock_guard<std::mutex> lock(mutex_);
        const auto iterator = sessions_.find(handle);
        // Read again under the mutation lock: never stamp a new pointer with an
        // earlier generation sampled before locking. Missing handles are cacheable
        // too, since insert() invalidates these negative lookups.
        cache = {this, handle, generation_.load(std::memory_order_relaxed),
                 iterator == sessions_.end() ? nullptr : iterator->second.get()};
        return cache.state;
    }

    std::shared_ptr<State> erase(Handle handle) {
        std::lock_guard<std::mutex> lock(mutex_);
        const auto iterator = sessions_.find(handle);
        if (iterator == sessions_.end()) return nullptr;
        auto state = std::move(iterator->second);
        sessions_.erase(iterator);
        invalidate();
        return state;
    }

    std::vector<std::shared_ptr<State>> clear() {
        std::lock_guard<std::mutex> lock(mutex_);
        std::vector<std::shared_ptr<State>> states;
        states.reserve(sessions_.size());
        for (auto& entry : sessions_) states.push_back(std::move(entry.second));
        sessions_.clear();
        // Never reset the generation at xrDestroyInstance: render threads can
        // survive instance recreation and the runtime can reuse identical handles.
        invalidate();
        return states;
    }

private:
    void invalidate() {
        // Only lifecycle mutations write this counter, always under mutex_. No
        // frame increments it, and no cached state is touched on an epoch mismatch.
        generation_.fetch_add(1, std::memory_order_release);
    }

    std::mutex mutex_;
    std::map<Handle, std::shared_ptr<State>> sessions_;
    std::atomic<uint64_t> generation_{1};
};

} // namespace gxr

#pragma once
#include <array>
#include <cstddef>
#include <cstdint>
#include <cstdlib>

namespace gxr::decoder {
// 16 incomplete RX slots plus up to 6 ordered completed frames, with 2 spare.
// Allocate lazily. Backing addresses remain valid across codec Stop/Init/Flush;
// only the codec destructor frees them. FEC can still hold pointers during reset.
template <size_t Slots = 24, size_t Capacity = 4 * 1024 * 1024>
class StagingPool {
public:
    struct Slot {
        uint8_t* data = nullptr;
        uint64_t generation = 0;
        uint32_t acquiredFrame = 0;
        bool leased = false;
    };
    std::array<Slot, Slots> slots{};
    uint64_t generation = 1;
    size_t allocated = 0, leased = 0, highWater = 0;
    ~StagingPool() { for (auto& slot : slots) std::free(slot.data); }
    StagingPool() = default;
    StagingPool(const StagingPool&) = delete;
    StagingPool& operator=(const StagingPool&) = delete;
    uint8_t* acquire(uint32_t frame, size_t* capacity) {
        if (!capacity) return nullptr;
        *capacity = 0;
        for (auto& slot : slots) {
            if (slot.leased) continue;
            if (!slot.data) {
                slot.data = static_cast<uint8_t*>(std::malloc(Capacity));
                if (!slot.data) return nullptr;
                allocated += Capacity;
            }
            slot.leased = true;
            slot.generation = generation;
            slot.acquiredFrame = frame;
            ++leased;
            if (leased > highWater) highWater = leased;
            *capacity = Capacity;
            return slot.data;
        }
        return nullptr;
    }
    Slot* find(const uint8_t* data) {
        if (!data) return nullptr;
        for (auto& slot : slots) if (slot.data == data) return &slot;
        return nullptr;
    }
    bool valid(const Slot* slot, uint64_t expectedGeneration) const {
        return slot && slot->leased && slot->generation == expectedGeneration &&
            generation == expectedGeneration;
    }
    bool release(Slot* slot, uint64_t expectedGeneration) {
        if (!valid(slot, expectedGeneration)) return false;
        slot->leased = false;
        --leased;
        return true;
    }
    void invalidate() {
        ++generation;
        // Do not recycle pointers still held by FEC during codec reset.
    }
    template <typename Referenced>
    void reclaimUnreferenced(Referenced referenced) {
        for (auto& slot : slots) {
            if (slot.leased && !referenced(slot.data)) {
                slot.leased = false;
                --leased;
            }
        }
    }
};
}

#pragma once

// Pose time hooks, free of Android and OpenXR dependencies so the host test can drive them.
// Defines the hook state: include from exactly one translation unit.
#include <unistd.h>
#include <time.h>

#include <atomic>
#include <cstdint>
#include <cstring>

namespace gxr::pose_time {

constexpr int64_t MAX_LEAD_NS = 30000000;
constexpr int64_t DEFAULT_LEAD_NS = 5000000;

using Consume = bool (*)(void*, std::uint32_t, std::uint32_t, std::uint64_t*, void*);
using State = bool (*)(void*, void*, int);
using Submit = uintptr_t (*)(void*, void*, bool, bool);
using Clock = std::uint32_t (*)();

struct Scope {
    std::uint32_t tid, active;
    int64_t stamp[2];
    std::uint32_t seen[2], bad;
};
struct Sample {
    int64_t stamp, receipt;
    unsigned char pose[84];
};
struct Hand {
    Sample samples[16];
    std::uint32_t next;
    std::uint64_t matched, unmatched, ambiguous, applied;
};

Consume ORIGINAL_CONSUME = nullptr;
State ORIGINAL_STATE = nullptr;
Submit ORIGINAL_SUBMIT = nullptr;
Clock VENDOR_CLOCK = nullptr;
std::atomic<bool> ENABLED{false};
std::atomic_flag LOCK = ATOMIC_FLAG_INIT;
int64_t LEAD_NS = 0;
Scope SCOPES[16];
Hand HANDS[2];
std::uint64_t INVALID = 0;

int64_t now() {
    timespec ts{};
    return clock_gettime(CLOCK_MONOTONIC, &ts) == 0 ? ts.tv_sec * 1000000000LL + ts.tv_nsec : 0;
}
bool tryLock() { return !LOCK.test_and_set(std::memory_order_acquire); }
void lock() { while (!tryLock()) {} }
void unlock() { LOCK.clear(std::memory_order_release); }

bool hookConsume(void* accessor, std::uint32_t device, std::uint32_t input, std::uint64_t* stamp, void* relation) {
    const bool ok = ORIGINAL_CONSUME(accessor, device, input, stamp, relation);
    // Devices 2 and 3 are the right and left controller, input 5 their grip pose.
    if (!ENABLED.load(std::memory_order_relaxed) || !ok || !stamp || !relation ||
        (device != 2 && device != 3) || (input & 0xffff) != 5) return ok;
    const int64_t label = static_cast<int64_t>(*stamp);
    const std::uint32_t id = static_cast<std::uint32_t>(gettid());
    const std::uint32_t hand = device == 3 ? 0 : 1;
    lock();
    for (auto& scope : SCOPES) {
        if (scope.tid != id || !scope.active) continue;
        // Orientation and position must be valid and tracked.
        if (label <= 0 || (*static_cast<std::uint32_t*>(relation) & 0x33) != 0x33) scope.bad = 1;
        if (scope.seen[hand] && scope.stamp[hand] != label) scope.bad = 1;
        scope.stamp[hand] = label;
        ++scope.seen[hand];
        break;
    }
    unlock();
    return ok;
}

// GetControllerState runs the runtime calls that consume the pose. The label is bound to the
// exact pose bytes this call wrote, never to a later independent read.
bool hookState(void* self, void* output, int handArg) {
    int slot = -1;
    const std::uint32_t id = static_cast<std::uint32_t>(gettid());
    if (ENABLED.load(std::memory_order_relaxed)) {
        lock();
        bool nested = false;
        for (auto& scope : SCOPES) nested |= scope.tid == id && scope.active;
        if (!nested) {
            for (int i = 0; i < 16; ++i) {
                if (SCOPES[i].active) continue;
                SCOPES[i] = {};
                SCOPES[i].tid = id;
                SCOPES[i].active = 1;
                slot = i;
                break;
            }
        }
        unlock();
    }
    const bool ok = ORIGINAL_STATE(self, output, handArg);
    if (slot < 0) return ok;
    lock();
    Scope& scope = SCOPES[slot];
    const int64_t receipt = now();
    if (ok && output && !scope.bad && (!!scope.seen[0] + !!scope.seen[1]) == 1) {
        const std::uint32_t h = scope.seen[0] ? 0 : 1;
        const int64_t label = scope.stamp[h];
        const auto* pose = static_cast<const unsigned char*>(output) + 0x20;
        if (receipt > 0 && label - receipt < 100000000 && receipt - label < 100000000 && pose[0x36] == 2) {
            Hand& dest = HANDS[h];
            Sample& sample = dest.samples[dest.next++ % 16];
            sample.stamp = label;
            sample.receipt = receipt;
            std::memcpy(sample.pose, pose, sizeof(sample.pose));
        } else {
            ++INVALID;
        }
    } else {
        ++INVALID;
    }
    scope.active = 0;
    unlock();
    return ok;
}

uintptr_t hookSubmit(void* self, void* packet, bool a, bool b) {
    auto* bytes = static_cast<unsigned char*>(packet);
    std::uint32_t kind = 0;
    std::uint16_t length = 0;
    if (bytes) {
        std::memcpy(&kind, bytes, 4);
        std::memcpy(&length, bytes + 4, 2);
    }
    // Controller pose packets only.
    if (!ENABLED.load(std::memory_order_relaxed) || !bytes || kind != 0x103 || length < 0x168 || bytes[8] != 10) {
        return ORIGINAL_SUBMIT(self, packet, a, b);
    }
    lock();
    // Bracket the vendor microsecond clock with the monotonic clock; 32-bit wrap-safe difference.
    const int64_t t0 = now();
    const std::uint32_t vendorNow = VENDOR_CLOCK();
    const int64_t t1 = now();
    std::uint32_t headerTime = 0;
    std::memcpy(&headerTime, bytes + 0x14, 4);
    const int32_t elapsed = static_cast<int32_t>(vendorNow - headerTime);
    const int64_t header = (t0 + t1) / 2 - static_cast<int64_t>(elapsed) * 1000;
    if (t0 <= 0 || t1 < t0 || t1 - t0 > 100000 || elapsed < 0 || elapsed > 20000) {
        ++INVALID;
        unlock();
        return ORIGINAL_SUBMIT(self, packet, a, b);
    }
    for (std::uint32_t h = 0; h < 2; ++h) {
        unsigned char* pose = bytes + (h ? 0x118 : 0xc0);
        Hand& dest = HANDS[h];
        int32_t field = 0;
        std::memcpy(&field, pose + 0x54, 4);
        if (field != 0 || pose[0x36] != 2) {
            ++dest.unmatched;
            continue;
        }
        // The runtime can republish identical pose bytes under a newer label. The packet is built
        // from the newest GetControllerState for this hand, so the matching sample with the latest
        // receipt produced it.
        int64_t label = 0, receipt = -1;
        bool relabelled = false;
        for (const auto& sample : dest.samples) {
            if (!sample.stamp || t1 - sample.receipt < 0 || t1 - sample.receipt >= 100000000 ||
                std::memcmp(sample.pose, pose, sizeof(sample.pose)) != 0) continue;
            if (label && label != sample.stamp) relabelled = true;
            if (sample.receipt > receipt) {
                receipt = sample.receipt;
                label = sample.stamp;
            }
        }
        if (!label) {
            ++dest.unmatched;
            continue;
        }
        if (relabelled) ++dest.ambiguous;
        ++dest.matched;
        const int64_t age = header - label;
        if (age < -100000000 || age > 100000000) {
            ++INVALID;
            continue;
        }
        const int32_t offset = static_cast<int32_t>(-(age + LEAD_NS) / 1000);
        std::memcpy(pose + 0x54, &offset, 4);
        ++dest.applied;
    }
    unlock();
    return ORIGINAL_SUBMIT(self, packet, a, b);
}

}  // namespace gxr::pose_time

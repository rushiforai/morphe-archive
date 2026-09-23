#pragma once

#include <cstddef>
#include <cstdint>

namespace gxr::dbuf {

// Exact shared shape of AcceptVideoPacket in 5002322 and 5002363. The caller
// still pins the build, mapping, and entire function against its stock FNV.
// Only the separately selected duplicate guard may change this instruction.
inline std::uint64_t normalizedFecPacketHash(const unsigned char* bytes,
                                           std::size_t length) noexcept {
    constexpr std::size_t kFunctionSize = 0x294;
    constexpr std::size_t kGuardOffset = 0x44;
    constexpr unsigned char kStock[] = {0x28, 0x01, 0x00, 0x34};
    constexpr unsigned char kGuarded[] = {0x1f, 0x20, 0x03, 0xd5};
    if (!bytes || length != kFunctionSize) return 0;

    bool stock = true, guarded = true;
    for (std::size_t i = 0; i < sizeof(kStock); ++i) {
        stock = stock && bytes[kGuardOffset + i] == kStock[i];
        guarded = guarded && bytes[kGuardOffset + i] == kGuarded[i];
    }
    if (!stock && !guarded) return 0;

    std::uint64_t value = 14695981039346656037ULL;
    for (std::size_t i = 0; i < length; ++i) {
        const auto byte = i >= kGuardOffset && i < kGuardOffset + sizeof(kStock)
            ? kStock[i - kGuardOffset] : bytes[i];
        value = (value ^ byte) * 1099511628211ULL;
    }
    return value;
}

}  // namespace gxr::dbuf

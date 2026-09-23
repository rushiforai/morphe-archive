#pragma once

#include <cstddef>
#include <cstdint>

namespace gxr::dbuf {

enum class HookId : std::size_t {
    Acquire, Submit, Init, Flush, Stop, Destructor, Periodic, AcceptPacket,
    DequeueInput, QueueInput, DequeueOutput, ReleaseOutput, AcquireLatestImage,
    ImageTimestamp, NativeFault, Count
};
inline constexpr std::size_t kHookCount = static_cast<std::size_t>(HookId::Count);

struct HookBindings {
    void* orig[kHookCount]{};
    void* replacement[kHookCount]{};
    std::uintptr_t base = 0;
};

// Call once from this helper's constructor, before scene constructors execute.
// All originals are published before any pointer changes. Wrappers must delegate
// to originalFunction() while hooksActive() is false. This also keeps the stock
// behavior available if an OS protection failure prevents complete rollback.
// Diagnostic API wrappers must not take the input helper mutex: output callbacks
// hold the stock codec shared lock, while Stop/Flush wait for its exclusive lock.
bool installHooks(HookBindings& bindings, bool diagnostic = false) noexcept;
bool hooksActive() noexcept;
void* originalFunction(HookId id) noexcept;
std::uintptr_t sceneAddress(std::uintptr_t offset) noexcept;

}  // namespace gxr::dbuf

#include "../src/staging_pool.h"
#include <cassert>
#include <cstring>
#include <cstdio>

int main() {
    using Pool = gxr::decoder::StagingPool<24, 4096>;
    Pool pool;
    size_t cap = 99;
    assert(pool.acquire(0, nullptr) == nullptr);
    std::array<uint8_t*, 24> buffers{};
    for (size_t i = 0; i < buffers.size(); ++i) {
        buffers[i] = pool.acquire(static_cast<uint16_t>(65530 + i), &cap);
        assert(buffers[i] && cap == 4096);
        std::memset(buffers[i], static_cast<int>(i), cap);
        for (size_t j = 0; j < i; ++j) assert(buffers[i] != buffers[j]);
    }
    assert(pool.acquire(25, &cap) == nullptr && cap == 0);
    assert(pool.allocated == 24 * 4096 && pool.highWater == 24);
    auto* slot = pool.find(buffers[4]);
    const auto generation = pool.generation;
    assert(pool.release(slot, generation));
    assert(!pool.release(slot, generation));
    assert(pool.acquire(65536, &cap) == buffers[4]);
    for (size_t i = 0; i < buffers.size(); ++i) assert(buffers[i][4095] == i);
    pool.invalidate();
    assert(pool.leased == 24 && !pool.valid(slot, generation));
    assert(!pool.release(slot, generation));
    assert(!pool.acquire(1, &cap));
    // Reinitialization changes ownership, never frees still-referenced backing.
    for (size_t i = 0; i < buffers.size(); ++i) assert(buffers[i][4095] == i);
    pool.reclaimUnreferenced([&](const uint8_t* p) { return p != buffers[0]; });
    assert(pool.leased == 23);
    assert(pool.acquire(1, &cap) == buffers[0]);
    assert(pool.valid(pool.find(buffers[0]), pool.generation));
    uint8_t unrelated = 0;
    assert(!pool.find(&unrelated));
    for (int cycle = 0; cycle < 10000; ++cycle) {
        pool.invalidate();
        pool.reclaimUnreferenced([](const uint8_t*) { return false; });
        assert(pool.acquire(cycle, &cap) == buffers[0]);
        assert(pool.allocated == 24 * 4096);
    }
    std::puts("staging pool: bounds, ownership, wrap, reset, reuse, stale release passed");
}

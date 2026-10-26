#include "../src/surface_video_policy.h"
#include <cstdlib>
#include <iostream>
void check(bool value) { if (!value) std::abort(); }
int main() {
    using namespace gxr::video;
    ImageQueue q;
    check(!q.readable());
    q.acquired(7); q.acquired(2);
    check(!q.readable()); // acquire (or a wait timeout) is not permission to sample.
    q.waited(); check(q.readable() && q.readable()->index == 7);
    // Waiting the second acquired image must not change which image is readable.
    q.waited(); check(q.readable() && q.readable()->index == 7);
    q.released(); check(q.readable() && q.readable()->index == 2);
    q.released(); check(!q.readable());
    q.acquired(4); q.waited(); q.acquired(5); q.waited();
    check(q.readable()->index == 4); q.released(); check(q.readable()->index == 5);
    check(rectValid(1536, 0, 1536, 6144, 3072, 6144));
    check(!rectValid(-1, 0, 2, 2, 10, 10));
    check(!rectValid(0, 0, 0, 2, 10, 10));
    check(!rectValid(2147483647, 0, 2147483647, 2, 8192, 8192));
    check(!rectValid(1536, 0, 1537, 6144, 3072, 6144));
    check(dimensionsValid(3072, 6144, 1, 1, 1, 1));
    check(dimensionsValid(8192, 8192, 2, 1, 1, 1));
    check(!dimensionsValid(8193, 6144, 1, 1, 1, 1));
    check(!dimensionsValid(3072, 6144, 1, 4, 1, 1));
    check(!dimensionsValid(3072, 6144, 3, 1, 1, 1));
    std::cout << "PASS image ownership, timeout/release ordering, stereo rect bounds and supported dimensions\n";
}

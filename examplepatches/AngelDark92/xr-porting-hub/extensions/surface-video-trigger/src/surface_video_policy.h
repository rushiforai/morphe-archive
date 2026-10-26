#pragma once
#include <cstdint>
#include <deque>

namespace gxr::video {
// OpenXR permits multiple acquired images. A timeout must not grant read access.
struct ImageQueue {
    struct Image { uint32_t index; bool waited; };
    std::deque<Image> images;
    void acquired(uint32_t index) { images.push_back({index, false}); }
    void waited() {
        for (auto& image : images) if (!image.waited) { image.waited = true; return; }
    }
    const Image* readable() const {
        return !images.empty() && images.front().waited ? &images.front() : nullptr;
    }
    void released() { if (!images.empty()) images.pop_front(); }
};
inline bool rectValid(int32_t x, int32_t y, int32_t w, int32_t h,
                      uint32_t width, uint32_t height) {
    return x >= 0 && y >= 0 && w > 0 && h > 0 &&
        uint64_t(x) + uint64_t(w) <= width && uint64_t(y) + uint64_t(h) <= height;
}
inline bool dimensionsValid(uint32_t w, uint32_t h, uint32_t arrays,
                            uint32_t samples, uint32_t faces, uint32_t mips) {
    return w && h && w <= 8192 && h <= 8192 && arrays >= 1 && arrays <= 2 &&
        samples == 1 && faces == 1 && mips == 1;
}
} // namespace gxr::video

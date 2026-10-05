#pragma once
#include <algorithm>
#include <cmath>
#include <cstdint>

namespace gxr_canvas {
struct Fov { double left, right, down, up; };
struct Rect { int32_t x, y, width, height; };

// Place the narrow projection in the full projection's tangent plane. This is
// valid only for matching poses/spaces (checked by the caller), not arbitrary
// head rotations/translations. Reject clipping and any loss of source density.
inline bool placement(Fov full, Fov fovea, int32_t sourceWidth, int32_t sourceHeight,
                      int32_t canvasWidth, int32_t canvasHeight, Rect& output) {
    const double values[] = {full.left, full.right, full.down, full.up,
                             fovea.left, fovea.right, fovea.down, fovea.up};
    for (double v : values) if (!std::isfinite(v) || std::abs(v) >= 1.5707963267948966) return false;
    if (sourceWidth <= 0 || sourceHeight <= 0 || canvasWidth <= 0 || canvasHeight <= 0) return false;
    const double l = std::tan(full.left), r = std::tan(full.right);
    const double b = std::tan(full.down), t = std::tan(full.up);
    const double fl = std::tan(fovea.left), fr = std::tan(fovea.right);
    const double fb = std::tan(fovea.down), ft = std::tan(fovea.up);
    if (!(l < r && b < t && fl < fr && fb < ft && fl >= l && fr <= r && fb >= b && ft <= t)) return false;
    const double x0 = (fl-l)/(r-l)*canvasWidth, x1 = (fr-l)/(r-l)*canvasWidth;
    const double y0 = (fb-b)/(t-b)*canvasHeight, y1 = (ft-b)/(t-b)*canvasHeight;
    // Round the 2 endpoints to the nearest canvas pixels. A subpixel positioning
    // error is permitted; shrinking source pixel count is not.
    const auto ix0 = static_cast<int32_t>(std::llround(x0));
    const auto ix1 = static_cast<int32_t>(std::llround(x1));
    const auto iy0 = static_cast<int32_t>(std::llround(y0));
    const auto iy1 = static_cast<int32_t>(std::llround(y1));
    if (ix0 < 0 || iy0 < 0 || ix1 > canvasWidth || iy1 > canvasHeight ||
        x1-x0 + 1e-6 < sourceWidth || y1-y0 + 1e-6 < sourceHeight ||
        ix1-ix0 < sourceWidth || iy1-iy0 < sourceHeight) return false;
    output = {ix0, iy0, ix1-ix0, iy1-iy0};
    return true;
}
} // namespace gxr_canvas

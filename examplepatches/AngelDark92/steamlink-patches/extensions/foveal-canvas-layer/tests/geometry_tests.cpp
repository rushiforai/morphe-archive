#include "../src/canvas_geometry.h"
#include <cassert>
#include <cstdio>
#include <limits>

using namespace gxr_canvas;

static Fov angles(double left, double right, double down, double up) {
    return {std::atan(left), std::atan(right), std::atan(down), std::atan(up)};
}

static void expectRect(Rect actual, Rect expected) {
    assert(actual.x == expected.x && actual.y == expected.y);
    assert(actual.width == expected.width && actual.height == expected.height);
}

static void rejected(Fov full, Fov fovea, int sw = 1280, int sh = 1536,
                     int cw = 5120, int ch = 6144) {
    Rect output{17, 23, 31, 47};
    assert(!placement(full, fovea, sw, sh, cw, ch, output));
    expectRect(output, {17, 23, 31, 47});
}

int main() {
    const Fov full = angles(-1, 1, -1, 1);
    const Fov centered = angles(-0.25, 0.25, -0.25, 0.25);
    Rect output{};

    // A 1280x1536 fovea keeps every source pixel on a 5120x6144 canvas.
    // Remaining canvas pixels must stay transparent in the renderer; geometry
    // neither manufactures source detail nor replaces the original alpha mask.
    assert(placement(full, centered, 1280, 1536, 5120, 6144, output));
    expectRect(output, {1920, 2304, 1280, 1536});
    assert(output.width >= 1280 && output.height >= 1536);
    assert(output.x > 0 && output.y > 0);
    assert(output.x + output.width < 5120 && output.y + output.height < 6144);

    // Deliberately asymmetric real angles: tangent-space mapping, not linear
    // interpolation of angles, keeps the gaze tile in its correct location.
    assert(placement(angles(-1.2, 0.8, -0.9, 1.1),
                     angles(-0.2, 0.4, -0.4, 0.2),
                     1500, 1800, 5000, 6000, output));
    expectRect(output, {2500, 1500, 1500, 1800});
    assert(placement(full, full, 5120, 6144, 5120, 6144, output));
    expectRect(output, {0, 0, 5120, 6144});

    // Upsampling is allowed; angular coverage and mask remain source-owned.
    assert(placement(full, centered, 640, 768, 5120, 6144, output));
    expectRect(output, {1920, 2304, 1280, 1536});
    rejected(full, centered, 1281, 1536);
    rejected(full, centered, 1280, 1537);
    // Rounding to 1280 pixels cannot conceal a geometric span below 1280.
    rejected(full, angles(-0.25, 0.24999, -0.25, 0.25));
    rejected(full, centered, 1280, 1536, 4096, 6144);
    rejected(full, centered, 1280, 1536, 5120, 4096);

    rejected(full, angles(-1.01, 0.25, -0.25, 0.25));
    rejected(full, angles(-0.25, 1.01, -0.25, 0.25));
    rejected(full, angles(-0.25, 0.25, -1.01, 0.25));
    rejected(full, angles(-0.25, 0.25, -0.25, 1.01));
    rejected(angles(1, -1, -1, 1), centered);
    rejected(angles(-1, 1, 1, -1), centered);
    rejected(full, angles(0.25, -0.25, -0.25, 0.25));
    rejected(full, angles(-0.25, 0.25, 0.25, -0.25));
    rejected(full, angles(0, 0, -0.25, 0.25));
    rejected(full, angles(-0.25, 0.25, 0, 0));

    const double invalid[] = {std::numeric_limits<double>::quiet_NaN(),
                              std::numeric_limits<double>::infinity(),
                              -std::numeric_limits<double>::infinity(),
                              1.5707963267948966, -1.5707963267948966, 2.0};
    for (double value : invalid) {
        for (int field = 0; field < 4; ++field) {
            Fov f = full;
            switch (field) {
                case 0: f.left = value; break;
                case 1: f.right = value; break;
                case 2: f.down = value; break;
                case 3: f.up = value; break;
            }
            rejected(f, centered);
            rejected(full, f);
        }
    }
    for (int value : {0, -1}) {
        rejected(full, centered, value, 1536);
        rejected(full, centered, 1280, value);
        rejected(full, centered, 1280, 1536, value, 6144);
        rejected(full, centered, 1280, 1536, 5120, value);
    }
    std::puts("PASS angular placement, density preservation, transparent-border geometry, invalid-input fallback");
}

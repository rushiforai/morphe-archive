#pragma once
#include <cmath>
#include <cstdint>

namespace gxr {
template <class Pitch>
Pitch withThrowAngle(Pitch base, std::uint32_t degrees) {
    if (degrees == 0 || degrees > 50) return base;
    const double radians = degrees * 3.14159265358979323846 / 180.0;
    const double s = std::sin(radians), c = std::cos(radians);
    return {base.sine * c + base.cosine * s, base.cosine * c - base.sine * s};
}
}

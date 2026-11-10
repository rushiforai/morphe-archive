#include "../src/throw_angle.h"
#include <cassert>
#include <cstring>
#include <initializer_list>
struct Pitch { double sine, cosine; };
int main() {
    constexpr double pi = 3.14159265358979323846;
    const double baseline = -62.85 * pi / 180;
    const Pitch base{std::sin(baseline), std::cos(baseline)};
    const auto zero = gxr::withThrowAngle(base, 0);
    assert(std::memcmp(&zero, &base, sizeof(base)) == 0);
    for (unsigned degrees : {13u, 50u}) {
        auto p = gxr::withThrowAngle(base, degrees);
        const double expected = (-62.85 + degrees) * pi / 180;
        assert(std::abs(p.sine - std::sin(expected)) < 1e-12);
        assert(std::abs(p.cosine - std::cos(expected)) < 1e-12);
        assert(std::abs(p.sine*p.sine + p.cosine*p.cosine - 1) < 1e-12);
    }
    auto invalid = gxr::withThrowAngle(base, 51);
    assert(std::memcmp(&invalid, &base, sizeof(base)) == 0);
    // +13 degrees lifts a local forward (-Z) velocity; this is not a world-up bias.
    auto residual = gxr::withThrowAngle(Pitch{0,1}, 13);
    assert(residual.sine > 0 && residual.cosine > 0);
}

#include "velocity_math.h"

#include <cmath>
#include <cstdlib>
#include <iostream>
#include <limits>

namespace {

constexpr float PI = 3.14159265358979323846F;

void require(bool condition, const char* message) {
    if (!condition) {
        std::cerr << "FAIL: " << message << '\n';
        std::exit(1);
    }
}

bool near(float actual, float expected, float tolerance = 1.0e-3F) {
    return std::fabs(actual - expected) <= tolerance;
}

gxr::PoseSample sample(std::int64_t timeNs, gxr::Vec3 position, gxr::Quaternion orientation) {
    return {timeNs, position, orientation};
}

}  // namespace

int main() {
    const gxr::EstimatorConfig config{};
    gxr::Velocity velocity{};
    const gxr::Quaternion identity{0.0F, 0.0F, 0.0F, 1.0F};

    require(gxr::deriveVelocity(
        sample(0, {0.0F, 0.0F, 0.0F}, identity),
        sample(10'000'000, {0.02F, -0.01F, 0.03F}, identity),
        config,
        velocity
    ), "constant translation accepted");
    require(near(velocity.linear.x, 2.0F), "linear x");
    require(near(velocity.linear.y, -1.0F), "linear y");
    require(near(velocity.linear.z, 3.0F), "linear z");

    const float halfAngle = PI / 4.0F;
    require(gxr::deriveVelocity(
        sample(0, {}, identity),
        sample(10'000'000, {}, {0.0F, 0.0F, std::sin(halfAngle), std::cos(halfAngle)}),
        {1'000'000, 50'000'000, 20.0F, 200.0F},
        velocity
    ), "constant rotation accepted");
    require(near(velocity.angular.z, (PI / 2.0F) / 0.01F, 0.02F), "angular z");

    require(gxr::deriveVelocity(
        sample(0, {}, identity),
        sample(10'000'000, {}, {0.0F, 0.0F, 0.0F, -1.0F}),
        config,
        velocity
    ), "quaternion sign flip accepted");
    require(near(velocity.angular.x, 0.0F) && near(velocity.angular.y, 0.0F) &&
        near(velocity.angular.z, 0.0F), "quaternion sign flip has zero angular velocity");

    require(!gxr::deriveVelocity(
        sample(10'000'000, {}, identity), sample(10'000'000, {}, identity), config, velocity
    ), "duplicate timestamp rejected");
    require(!gxr::deriveVelocity(
        sample(10'000'000, {}, identity), sample(70'000'000, {}, identity), config, velocity
    ), "large gap rejected");
    require(!gxr::deriveVelocity(
        sample(0, {}, identity), sample(10'000'000, {1.0F, 0.0F, 0.0F}, identity), config, velocity
    ), "linear spike rejected");
    require(!gxr::deriveVelocity(
        sample(0, {}, identity),
        sample(10'000'000, {std::numeric_limits<float>::quiet_NaN(), 0.0F, 0.0F}, identity),
        config,
        velocity
    ), "NaN rejected");

    std::cout << "velocity_math_tests: PASS\n";
    return 0;
}
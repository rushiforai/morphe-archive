#pragma once

#include <cstdint>

namespace gxr {

struct Vec3 {
    float x;
    float y;
    float z;
};

struct Quaternion {
    float x;
    float y;
    float z;
    float w;
};

struct PoseSample {
    std::int64_t timeNs;
    Vec3 position;
    Quaternion orientation;
};

struct Velocity {
    Vec3 linear;
    Vec3 angular;
};

struct EstimatorConfig {
    std::int64_t minDeltaNs = 1'000'000;
    std::int64_t maxDeltaNs = 50'000'000;
    float maxLinearSpeed = 20.0F;
    float maxAngularSpeed = 50.0F;
};

bool deriveVelocity(
    const PoseSample& previous,
    const PoseSample& current,
    const EstimatorConfig& config,
    Velocity& output
);

}  // namespace gxr
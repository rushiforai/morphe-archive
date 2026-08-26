#include "velocity_math.h"

#include <algorithm>
#include <cmath>

namespace gxr {
namespace {

float magnitude(const Vec3& value) {
    return std::sqrt(value.x * value.x + value.y * value.y + value.z * value.z);
}

bool finite(const Vec3& value) {
    return std::isfinite(value.x) && std::isfinite(value.y) && std::isfinite(value.z);
}

bool normalize(Quaternion& value) {
    const float length = std::sqrt(
        value.x * value.x + value.y * value.y + value.z * value.z + value.w * value.w
    );
    if (!std::isfinite(length) || length < 1.0e-6F) return false;
    value.x /= length;
    value.y /= length;
    value.z /= length;
    value.w /= length;
    return true;
}

Quaternion conjugate(const Quaternion& value) {
    return {-value.x, -value.y, -value.z, value.w};
}

Quaternion multiply(const Quaternion& left, const Quaternion& right) {
    return {
        left.w * right.x + left.x * right.w + left.y * right.z - left.z * right.y,
        left.w * right.y - left.x * right.z + left.y * right.w + left.z * right.x,
        left.w * right.z + left.x * right.y - left.y * right.x + left.z * right.w,
        left.w * right.w - left.x * right.x - left.y * right.y - left.z * right.z,
    };
}

}  // namespace

bool deriveVelocity(
    const PoseSample& previous,
    const PoseSample& current,
    const EstimatorConfig& config,
    Velocity& output
) {
    const std::int64_t deltaNs = current.timeNs - previous.timeNs;
    if (deltaNs < config.minDeltaNs || deltaNs > config.maxDeltaNs) return false;
    if (!finite(previous.position) || !finite(current.position)) return false;

    const float inverseSeconds = 1.0e9F / static_cast<float>(deltaNs);
    Velocity candidate{};
    candidate.linear = {
        (current.position.x - previous.position.x) * inverseSeconds,
        (current.position.y - previous.position.y) * inverseSeconds,
        (current.position.z - previous.position.z) * inverseSeconds,
    };

    Quaternion from = previous.orientation;
    Quaternion to = current.orientation;
    if (!normalize(from) || !normalize(to)) return false;

    Quaternion delta = multiply(to, conjugate(from));
    if (!normalize(delta)) return false;
    if (delta.w < 0.0F) {
        delta.x = -delta.x;
        delta.y = -delta.y;
        delta.z = -delta.z;
        delta.w = -delta.w;
    }

    const float vectorLength = std::sqrt(delta.x * delta.x + delta.y * delta.y + delta.z * delta.z);
    if (vectorLength > 1.0e-6F) {
        const float angle = 2.0F * std::atan2(vectorLength, std::clamp(delta.w, -1.0F, 1.0F));
        const float scale = angle * inverseSeconds / vectorLength;
        candidate.angular = {delta.x * scale, delta.y * scale, delta.z * scale};
    }

    if (!finite(candidate.linear) || !finite(candidate.angular)) return false;
    if (magnitude(candidate.linear) > config.maxLinearSpeed) return false;
    if (magnitude(candidate.angular) > config.maxAngularSpeed) return false;

    output = candidate;
    return true;
}

}  // namespace gxr
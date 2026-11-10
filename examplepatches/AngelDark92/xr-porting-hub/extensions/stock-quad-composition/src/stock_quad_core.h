#pragma once

// Pure, platform-independent core of the stock-equivalent 5002527 quad composition.
// No global state, no allocation, no logging: shape planning, validation and geometry only.
// The production layer and the host tests compile this very header.

#include <openxr/openxr.h>

#include <cmath>
#include <cstdint>

namespace gxr::sq {

// float 0x3fff7cee, the distance constant of stock 5002527 QSVLRendererXR quad population.
constexpr double kQuadDistance = 1.996000051498413;
constexpr uint32_t kQuadCount = 4;           // [baseL, baseR, foveaL, foveaR]
constexpr uint32_t kMaxOutputLayers = 16;    // fixed stack/array cap; also bounded by maxLayerCount
constexpr XrCompositionLayerFlags kBaseFlags = 0;
constexpr XrCompositionLayerFlags kFoveaFlags =
    XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT |
    XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT;  // == 6
constexpr float kMinIpdMeters = 0.02f;
constexpr float kMaxIpdMeters = 0.20f;

enum class Layout : uint8_t {
    None,
    TwoProjection,    // 5001712 / 5001812 / 5001968: [base, fovea]
    ThreeProjection,  // 5002244 / 5002363 / 5002395: [underside, base, fovea]
};

enum class Reject : uint8_t {
    None = 0,
    NotApplicable,        // no leading projection layer (e.g. stock 5002527 quads): pass through
    BadFrameInfo,
    NonOpaque,
    NullLayer,
    UnsupportedProjectionCount,
    ProjectionInTail,
    LayerCap,
    BadLayerNext,
    BadViewCount,
    BadViewNext,
    BadViewType,
    BadFlags,
    BadSpace,
    BadFov,
    BadPose,
    BadSubImage,
    PoseMismatch,
    SwapchainMismatch,
    EyesUnavailable,      // eye offsets could not be located this frame (retried next frame)
    Count_
};

inline const char* rejectName(Reject reason) {
    switch (reason) {
        case Reject::None: return "none";
        case Reject::NotApplicable: return "not_applicable";
        case Reject::BadFrameInfo: return "bad_frame_info";
        case Reject::NonOpaque: return "non_opaque_blend";
        case Reject::NullLayer: return "null_layer";
        case Reject::UnsupportedProjectionCount: return "unsupported_projection_count";
        case Reject::ProjectionInTail: return "projection_in_tail";
        case Reject::LayerCap: return "layer_cap";
        case Reject::BadLayerNext: return "bad_layer_next";
        case Reject::BadViewCount: return "bad_view_count";
        case Reject::BadViewNext: return "bad_view_next";
        case Reject::BadViewType: return "bad_view_type";
        case Reject::BadFlags: return "bad_layer_flags";
        case Reject::BadSpace: return "bad_space";
        case Reject::BadFov: return "bad_fov";
        case Reject::BadPose: return "bad_pose";
        case Reject::BadSubImage: return "bad_sub_image";
        case Reject::PoseMismatch: return "pose_mismatch";
        case Reject::SwapchainMismatch: return "swapchain_mismatch";
        case Reject::EyesUnavailable: return "eyes_unavailable";
        default: return "unknown";
    }
}

struct Plan {
    Layout layout{Layout::None};
    uint32_t sourceProjectionCount{};  // 2 or 3
    uint32_t tailStart{};              // == sourceProjectionCount
    uint32_t tailCount{};
    uint32_t outputCount{};            // kQuadCount + tailCount
    const XrCompositionLayerProjection* base{};
    const XrCompositionLayerProjection* fovea{};
};

// ---- numeric validation -------------------------------------------------------------

inline bool finite3(const XrVector3f& v) {
    return std::isfinite(v.x) && std::isfinite(v.y) && std::isfinite(v.z);
}

inline bool validQuaternion(const XrQuaternionf& q) {
    if (!std::isfinite(q.x) || !std::isfinite(q.y) || !std::isfinite(q.z) || !std::isfinite(q.w)) {
        return false;
    }
    const double norm2 = static_cast<double>(q.x) * q.x + static_cast<double>(q.y) * q.y +
        static_cast<double>(q.z) * q.z + static_cast<double>(q.w) * q.w;
    return std::fabs(norm2 - 1.0) < 1e-2;
}

inline bool validPose(const XrPosef& pose) {
    return validQuaternion(pose.orientation) && finite3(pose.position);
}

inline bool validFov(const XrFovf& fov) {
    constexpr float kLimit = 1.5f;  // < pi/2, keeps tan() finite and well conditioned
    const float angles[4] = {fov.angleLeft, fov.angleRight, fov.angleUp, fov.angleDown};
    for (float angle : angles) {
        if (!std::isfinite(angle) || std::fabs(angle) >= kLimit) return false;
    }
    return fov.angleLeft < fov.angleRight && fov.angleDown < fov.angleUp;
}

inline bool samePose(const XrPosef& a, const XrPosef& b) {
    return a.orientation.x == b.orientation.x && a.orientation.y == b.orientation.y &&
        a.orientation.z == b.orientation.z && a.orientation.w == b.orientation.w &&
        a.position.x == b.position.x && a.position.y == b.position.y &&
        a.position.z == b.position.z;
}

// ---- geometry -----------------------------------------------------------------------

struct Quatd { double x, y, z, w; };
struct Vec3d { double x, y, z; };

inline Quatd normalized(const XrQuaternionf& q) {
    const double n = std::sqrt(static_cast<double>(q.x) * q.x + static_cast<double>(q.y) * q.y +
        static_cast<double>(q.z) * q.z + static_cast<double>(q.w) * q.w);
    return {q.x / n, q.y / n, q.z / n, q.w / n};
}

inline Quatd multiply(const Quatd& a, const Quatd& b) {
    return {
        a.w * b.x + a.x * b.w + a.y * b.z - a.z * b.y,
        a.w * b.y - a.x * b.z + a.y * b.w + a.z * b.x,
        a.w * b.z + a.x * b.y - a.y * b.x + a.z * b.w,
        a.w * b.w - a.x * b.x - a.y * b.y - a.z * b.z,
    };
}

inline Vec3d rotate(const Quatd& q, const Vec3d& v) {
    const Vec3d t{2.0 * (q.y * v.z - q.z * v.y), 2.0 * (q.z * v.x - q.x * v.z),
                  2.0 * (q.x * v.y - q.y * v.x)};
    return {v.x + q.w * t.x + (q.y * t.z - q.z * t.y), v.y + q.w * t.y + (q.z * t.x - q.x * t.z),
            v.z + q.w * t.z + (q.x * t.y - q.y * t.x)};
}

// Stock 5002527 quadfn:
//   orientation = headQ * eyeQ
//   position    = headPos + Rhead * (eyePos + Reye * (d*(tanL+tanR)/2, d*(tanU+tanD)/2, -d))
//   size        = (d*(tanR-tanL), d*(tanU-tanD))
// Inputs must already satisfy validPose/validFov. Returns false on a non-finite/degenerate result.
inline bool composeQuad(const XrPosef& head, const XrPosef& eye, const XrFovf& fov,
                        XrPosef* pose, XrExtent2Df* size) {
    const double tl = std::tan(static_cast<double>(fov.angleLeft));
    const double tr = std::tan(static_cast<double>(fov.angleRight));
    const double tu = std::tan(static_cast<double>(fov.angleUp));
    const double td = std::tan(static_cast<double>(fov.angleDown));
    const double d = kQuadDistance;
    const Quatd hq = normalized(head.orientation);
    const Quatd eq = normalized(eye.orientation);
    const Vec3d local{d * (tl + tr) * 0.5, d * (tu + td) * 0.5, -d};
    const Vec3d inEye = rotate(eq, local);
    const Vec3d inHead{eye.position.x + inEye.x, eye.position.y + inEye.y, eye.position.z + inEye.z};
    const Vec3d world = rotate(hq, inHead);
    const Quatd out = multiply(hq, eq);
    const double outNorm = std::sqrt(out.x * out.x + out.y * out.y + out.z * out.z + out.w * out.w);
    const float w = static_cast<float>(d * (tr - tl));
    const float h = static_cast<float>(d * (tu - td));
    pose->orientation = {static_cast<float>(out.x / outNorm), static_cast<float>(out.y / outNorm),
                         static_cast<float>(out.z / outNorm), static_cast<float>(out.w / outNorm)};
    pose->position = {static_cast<float>(head.position.x + world.x),
                      static_cast<float>(head.position.y + world.y),
                      static_cast<float>(head.position.z + world.z)};
    size->width = w;
    size->height = h;
    return validPose(*pose) && std::isfinite(w) && std::isfinite(h) && w > 0.0f && h > 0.0f;
}

// ---- eye offsets (VIEW-space xrLocateViews) --------------------------------------------

// Accepts exactly two valid, individually valid eye poses with a plausible IPD.
inline bool validateLocatedEyes(XrViewStateFlags flags, uint32_t count, const XrView* views,
                                XrPosef out[2]) {
    constexpr XrViewStateFlags kNeeded =
        XR_VIEW_STATE_ORIENTATION_VALID_BIT | XR_VIEW_STATE_POSITION_VALID_BIT;
    if (count != 2 || !views || (flags & kNeeded) != kNeeded) return false;
    if (!validPose(views[0].pose) || !validPose(views[1].pose)) return false;
    const double dx = static_cast<double>(views[1].pose.position.x) - views[0].pose.position.x;
    const double dy = static_cast<double>(views[1].pose.position.y) - views[0].pose.position.y;
    const double dz = static_cast<double>(views[1].pose.position.z) - views[0].pose.position.z;
    const double ipd = std::sqrt(dx * dx + dy * dy + dz * dz);
    if (!(ipd >= kMinIpdMeters && ipd <= kMaxIpdMeters)) return false;
    out[0] = views[0].pose;
    out[1] = views[1].pose;
    return true;
}

// ---- shape planning -----------------------------------------------------------------

inline bool validSubImage(const XrSwapchainSubImage& sub) {
    return sub.swapchain != XR_NULL_HANDLE && sub.imageRect.offset.x >= 0 &&
        sub.imageRect.offset.y >= 0 && sub.imageRect.extent.width > 0 &&
        sub.imageRect.extent.height > 0;
}

// The only chain element a source projection may carry is one XrCompositionLayerSettingsFB.
inline bool validSourceNext(const void* next) {
    if (!next) return true;
    const auto* settings = static_cast<const XrBaseInStructure*>(next);
    return settings->type == XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB && settings->next == nullptr;
}

inline Reject checkProjection(const XrCompositionLayerProjection* p, XrCompositionLayerFlags flags,
                              bool requireGeometry) {
    if (!validSourceNext(p->next)) return Reject::BadLayerNext;
    if (p->viewCount != 2 || !p->views) return Reject::BadViewCount;
    if (p->layerFlags != flags) return Reject::BadFlags;
    if (p->space == XR_NULL_HANDLE) return Reject::BadSpace;
    for (uint32_t v = 0; v < 2; ++v) {
        const XrCompositionLayerProjectionView& view = p->views[v];
        if (view.type != XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW) return Reject::BadViewType;
        if (view.next != nullptr) return Reject::BadViewNext;
        if (!requireGeometry) continue;
        if (!validFov(view.fov)) return Reject::BadFov;
        if (!validPose(view.pose)) return Reject::BadPose;
        if (!validSubImage(view.subImage)) return Reject::BadSubImage;
    }
    return Reject::None;
}

// Pure classification of one xrEndFrame submission. Never touches anything but the argument.
inline Reject planFrame(const XrFrameEndInfo* info, uint32_t maxLayerCount, Plan* plan) {
    *plan = {};
    if (!info || info->type != XR_TYPE_FRAME_END_INFO) return Reject::BadFrameInfo;
    if (info->layerCount == 0) return Reject::NotApplicable;
    if (!info->layers) return Reject::BadFrameInfo;
    if (info->layerCount > kMaxOutputLayers) return Reject::LayerCap;
    uint32_t lead = 0;
    for (; lead < info->layerCount; ++lead) {
        const XrCompositionLayerBaseHeader* layer = info->layers[lead];
        if (!layer) return Reject::NullLayer;
        if (layer->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION) break;
    }
    if (lead == 0) return Reject::NotApplicable;  // stock quads or anything unrelated
    if (info->environmentBlendMode != XR_ENVIRONMENT_BLEND_MODE_OPAQUE) return Reject::NonOpaque;
    if (lead != 2 && lead != 3) return Reject::UnsupportedProjectionCount;
    for (uint32_t i = lead; i < info->layerCount; ++i) {
        const XrCompositionLayerBaseHeader* layer = info->layers[i];
        if (!layer) return Reject::NullLayer;
        if (layer->type == XR_TYPE_COMPOSITION_LAYER_PROJECTION) return Reject::ProjectionInTail;
    }
    const uint32_t tail = info->layerCount - lead;
    const uint32_t output = kQuadCount + tail;
    if (output > kMaxOutputLayers || maxLayerCount == 0 || output > maxLayerCount) {
        return Reject::LayerCap;
    }

    const auto at = [&](uint32_t i) {
        return reinterpret_cast<const XrCompositionLayerProjection*>(info->layers[i]);
    };
    const uint32_t baseIndex = lead == 3 ? 1 : 0;
    const uint32_t foveaIndex = baseIndex + 1;
    if (lead == 3) {
        // The never-drawn underside layer is dropped; only its basic shape is required.
        const Reject r = checkProjection(at(0), kBaseFlags, false);
        if (r != Reject::None) return r;
    }
    Reject r = checkProjection(at(baseIndex), kBaseFlags, true);
    if (r != Reject::None) return r;
    r = checkProjection(at(foveaIndex), kFoveaFlags, true);
    if (r != Reject::None) return r;

    const XrCompositionLayerProjection* base = at(baseIndex);
    const XrCompositionLayerProjection* fovea = at(foveaIndex);
    // One head pose per base: both eyes of both families carry the identical pose.
    const XrPosef& head = base->views[0].pose;
    if (!samePose(head, base->views[1].pose) || !samePose(head, fovea->views[0].pose) ||
        !samePose(head, fovea->views[1].pose)) {
        return Reject::PoseMismatch;
    }
    const XrSwapchain chains[4] = {
        base->views[0].subImage.swapchain, base->views[1].subImage.swapchain,
        fovea->views[0].subImage.swapchain, fovea->views[1].subImage.swapchain};
    for (int a = 0; a < 4; ++a) {
        for (int b = a + 1; b < 4; ++b) {
            if (chains[a] == chains[b]) return Reject::SwapchainMismatch;
        }
    }
    plan->layout = lead == 3 ? Layout::ThreeProjection : Layout::TwoProjection;
    plan->sourceProjectionCount = lead;
    plan->tailStart = lead;
    plan->tailCount = tail;
    plan->outputCount = output;
    plan->base = base;
    plan->fovea = fovea;
    return Reject::None;
}

// Fills [baseL, baseR, foveaL, foveaR]. The settings pointer, flags, space and subImage are the
// original per-family values; the head pose is taken from each original view.
inline bool buildQuads(const Plan& plan, const XrPosef eyes[2], XrCompositionLayerQuad out[4]) {
    const XrCompositionLayerProjection* families[2] = {plan.base, plan.fovea};
    for (uint32_t family = 0; family < 2; ++family) {
        const XrCompositionLayerProjection* source = families[family];
        for (uint32_t eye = 0; eye < 2; ++eye) {
            XrCompositionLayerQuad& quad = out[family * 2 + eye];
            const XrCompositionLayerProjectionView& view = source->views[eye];
            quad = {};
            quad.type = XR_TYPE_COMPOSITION_LAYER_QUAD;
            quad.next = source->next;
            quad.layerFlags = source->layerFlags;
            quad.space = source->space;
            quad.eyeVisibility = eye == 0 ? XR_EYE_VISIBILITY_LEFT : XR_EYE_VISIBILITY_RIGHT;
            quad.subImage = view.subImage;
            if (!composeQuad(view.pose, eyes[eye], view.fov, &quad.pose, &quad.size)) return false;
        }
    }
    return true;
}

// ---- projection stripping -----------------------------------------------------------
// A tracked session never forwards a projection layer. These helpers touch only the frame
// argument and are safe on any frame whose layer array is readable.

// The frame can be iterated: right structure type and a readable array. Anything else is left to
// the downstream runtime, which reports its own error for it.
inline bool frameIterable(const XrFrameEndInfo* info) {
    return info && info->type == XR_TYPE_FRAME_END_INFO &&
        (info->layerCount == 0 || info->layers);
}

// Number of projection layers anywhere in the frame (null entries are skipped).
inline uint32_t countProjectionLayers(const XrFrameEndInfo* info) {
    uint32_t count = 0;
    for (uint32_t i = 0; i < info->layerCount; ++i) {
        const XrCompositionLayerBaseHeader* layer = info->layers[i];
        if (layer && layer->type == XR_TYPE_COMPOSITION_LAYER_PROJECTION) ++count;
    }
    return count;
}

// Copies every non-null, non-projection layer in order. Returns the count, or UINT32_MAX when
// `capacity` is too small (nothing is then guaranteed about `out`).
inline uint32_t stripProjectionLayers(const XrFrameEndInfo* info,
                                      const XrCompositionLayerBaseHeader** out,
                                      uint32_t capacity) {
    uint32_t count = 0;
    for (uint32_t i = 0; i < info->layerCount; ++i) {
        const XrCompositionLayerBaseHeader* layer = info->layers[i];
        if (!layer || layer->type == XR_TYPE_COMPOSITION_LAYER_PROJECTION) continue;
        if (count == capacity) return UINT32_MAX;
        out[count++] = layer;
    }
    return count;
}

// Exact process guard: the cmdline of the app's main process is its package name.
inline bool isTargetProcess(const char* cmdline, uint32_t length, const char* package) {
    uint32_t i = 0;
    for (; i < length && package[i]; ++i) {
        if (cmdline[i] != package[i]) return false;
    }
    return package[i] == '\0' && (i == length || cmdline[i] == '\0');
}

}  // namespace gxr::sq

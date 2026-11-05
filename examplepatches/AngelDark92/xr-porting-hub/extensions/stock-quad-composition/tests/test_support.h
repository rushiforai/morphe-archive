#pragma once

#include <openxr/openxr.h>

#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <vector>

#define CHECK(expression) do { if (!(expression)) { \
    std::cerr << "CHECK failed " << __FILE__ << ':' << __LINE__ << ": " #expression "\n"; \
    std::abort(); } } while (false)

#define CHECK_NEAR(a, b, tolerance) do { \
    const double va_ = (a), vb_ = (b); \
    if (!(std::fabs(va_ - vb_) <= (tolerance))) { \
        std::cerr << "CHECK_NEAR failed " << __FILE__ << ':' << __LINE__ << ": " #a "=" << va_ \
                  << " " #b "=" << vb_ << "\n"; \
        std::abort(); } } while (false)

namespace testsupport {

// Golden vectors computed offline in double precision with an independent rotation-matrix
// implementation (scratch/golden.py): d = 1.996000051498413.
struct Golden {
    XrPosef head;
    XrPosef eye;
    XrFovf fov;
    XrQuaternionf outQ;
    XrVector3f outP;
    XrExtent2Df outSize;
};

inline const Golden kGolden[3] = {
    {{{0, 0, 0, 1}, {0, 0, 0}},
     {{0, 0, 0, 1}, {0, 0, 0}},
     {-0.5f, 0.5f, 0.5f, -0.5f},
     {0, 0, 0, 1}, {0, 0, -1.99600005f}, {2.1808396f, 2.1808396f}},
    {{{0.0967713369588971f, 0.3225711231963237f, 0.06451422463926475f, 0.9393727128473789f},
      {0.12f, 1.6f, -0.4f}},
     {{0.0f, 0.024997395914712332f, 0.0f, 0.9996875162757026f}, {-0.032f, 0.0f, 0.0f}},
     {-0.9f, 0.7f, 0.8f, -0.85f},
     {0.0951284099f, 0.345952197f, 0.0669130964f, 0.931015736f},
     {-1.5233561f, 1.67031829f, -1.62401074f}, {4.19648352f, 4.32727077f}},
    {{{-0.4417513354230048f, -0.08835026708460098f, 0.26505080125380287f, 0.8525245220595057f},
      {-1.5f, 0.8f, 2.2f}},
     {{-0.0029275904313225097f, 0.014637952156612547f, -0.0014637952156612549f,
       0.9998875021093592f}, {0.0315f, 0.001f, -0.002f}},
     {-0.45f, 0.5f, 0.35f, -0.4f},
     {-0.447947956f, -0.0772837084f, 0.257048074f, 0.852816595f},
     {-0.674949078f, -0.624810269f, 1.06436893f}, {2.05459773f, 1.57249218f}},
};

// A complete synthetic Valve submission: 2 or 3 projection layers plus optional tail.
struct Source {
    XrSwapchain chains[3][2]{};
    XrCompositionLayerProjectionView views[3][2]{};
    XrCompositionLayerSettingsFB settings[3]{};
    XrCompositionLayerProjection projections[3]{};
    XrCompositionLayerQuad tail[2]{};
    std::vector<const XrCompositionLayerBaseHeader*> layers;
    XrFrameEndInfo info{};
    int count{};  // projection count

    Source(int projectionCount, int tailCount, XrPosef head, XrFovf baseFov, XrFovf foveaFov)
        : count(projectionCount) {
        info.type = XR_TYPE_FRAME_END_INFO;
        info.displayTime = 123456789;
        info.environmentBlendMode = XR_ENVIRONMENT_BLEND_MODE_OPAQUE;
        const int baseIndex = projectionCount == 3 ? 1 : 0;
        for (int p = 0; p < projectionCount; ++p) {
            auto& layer = projections[p];
            layer.type = XR_TYPE_COMPOSITION_LAYER_PROJECTION;
            const bool fovea = p == baseIndex + 1;
            layer.layerFlags = fovea ? 6 : 0;
            layer.space = reinterpret_cast<XrSpace>(static_cast<uintptr_t>(500 + p));
            layer.viewCount = 2;
            layer.views = views[p];
            settings[p].type = XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB;
            settings[p].layerFlags = fovea ? 4 : 8;
            layer.next = &settings[p];
            for (int v = 0; v < 2; ++v) {
                auto& view = views[p][v];
                view.type = XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW;
                view.pose = head;
                view.fov = (p == baseIndex + 1) ? foveaFov : baseFov;
                chains[p][v] = reinterpret_cast<XrSwapchain>(
                    static_cast<uintptr_t>(1000 + p * 10 + v));
                view.subImage.swapchain = chains[p][v];
                view.subImage.imageRect = {{0, 0}, {1920 + p, 1080 + p}};
            }
            layers.push_back(reinterpret_cast<const XrCompositionLayerBaseHeader*>(&layer));
        }
        for (int t = 0; t < tailCount; ++t) {
            tail[t].type = XR_TYPE_COMPOSITION_LAYER_QUAD;
            tail[t].space = reinterpret_cast<XrSpace>(static_cast<uintptr_t>(900 + t));
            tail[t].subImage.swapchain =
                reinterpret_cast<XrSwapchain>(static_cast<uintptr_t>(2000 + t));
            tail[t].subImage.imageRect = {{0, 0}, {64, 64}};
            tail[t].size = {1.0f, 1.0f};
            tail[t].pose.orientation.w = 1.0f;
            layers.push_back(reinterpret_cast<const XrCompositionLayerBaseHeader*>(&tail[t]));
        }
        refresh();
    }
    Source(const Source&) = delete;
    Source& operator=(const Source&) = delete;

    void refresh() {
        info.layerCount = static_cast<uint32_t>(layers.size());
        info.layers = layers.data();
    }
    XrCompositionLayerProjection& base() { return projections[count == 3 ? 1 : 0]; }
    XrCompositionLayerProjection& fovea() { return projections[count == 3 ? 2 : 1]; }
    // The layer structs expose const view pointers; tests mutate the backing arrays.
    XrCompositionLayerProjectionView& baseView(int v) { return views[count == 3 ? 1 : 0][v]; }
    XrCompositionLayerProjectionView& foveaView(int v) { return views[count == 3 ? 2 : 1][v]; }
};

inline XrFovf fovBase() { return {-0.9f, 0.7f, 0.8f, -0.85f}; }
inline XrFovf fovFovea() { return {-0.2f, 0.25f, 0.22f, -0.2f}; }
inline XrPosef identityPose() { return {{0, 0, 0, 1}, {0, 0, 0}}; }

}  // namespace testsupport

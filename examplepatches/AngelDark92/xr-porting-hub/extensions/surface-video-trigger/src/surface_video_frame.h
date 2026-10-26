#pragma once
#include <openxr/openxr.h>
#include <array>
#include <vector>
#include "surface_video_policy.h"

namespace gxr::video {
// Pure frame preparation shared with host tests. The caller submits only on true.
// Lookup returns a tracked source or nullptr; no runtime/GPU calls happen here.
template <size_t N, typename Lookup>
bool prepareFrame(XrSession session, const XrFrameEndInfo& info, Lookup lookup,
    std::array<XrCompositionLayerProjection,N>& layers,
    std::array<std::array<XrCompositionLayerProjectionView,2>,N>& views,
    std::array<const XrCompositionLayerBaseHeader*,N>& pointers) {
    if (info.next || info.layerCount!=N || !info.layers) return false;
    std::vector<decltype(lookup(XrSwapchain{}))> sources;
    bool ready=true;
    for (size_t i=0;i<N;++i) {
        const auto* base=info.layers[i];
        if (!base || base->type!=XR_TYPE_COMPOSITION_LAYER_PROJECTION || base->next) return false;
        const auto* layer=reinterpret_cast<const XrCompositionLayerProjection*>(base);
        if (layer->viewCount!=2 || !layer->views) return false;
        layers[i]=*layer;
        for (uint32_t eye=0;eye<2;++eye) {
            const auto& view=layer->views[eye]; const auto& sub=view.subImage;
            auto* source=lookup(sub.swapchain);
            if (view.type!=XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW || view.next || !source ||
                !source->supported || source->session!=session) return false;
            if (sub.imageArrayIndex>=source->info.arraySize || !rectValid(
                sub.imageRect.offset.x,sub.imageRect.offset.y,sub.imageRect.extent.width,
                sub.imageRect.extent.height,source->info.width,source->info.height)) return false;
            sources.push_back(source);
            ready &= source->ready;
            views[i][eye]=view;
            if (source->ready) {
                if (source->surfaces.size()<=sub.imageArrayIndex || !source->surfaces[sub.imageArrayIndex].xr)
                    return false;
                views[i][eye].subImage.swapchain=source->surfaces[sub.imageArrayIndex].xr;
                views[i][eye].subImage.imageArrayIndex=0;
            }
        }
        layers[i].views=views[i].data();
        pointers[i]=reinterpret_cast<const XrCompositionLayerBaseHeader*>(&layers[i]);
    }
    // Only a completely valid frame can arm producers. Partial readiness never submits.
    for (auto* source:sources) source->interested=true;
    return ready;
}
}

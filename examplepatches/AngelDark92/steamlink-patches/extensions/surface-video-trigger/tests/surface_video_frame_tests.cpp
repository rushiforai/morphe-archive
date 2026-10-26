#include "../src/surface_video_frame.h"
#include <cstdlib>
#include <iostream>
#include <map>
#include <cstring>
void check(bool value) { if (!value) std::abort(); }
struct Source {
    XrSession session{};
    XrSwapchainCreateInfo info{XR_TYPE_SWAPCHAIN_CREATE_INFO};
    bool supported{true},ready{},interested{};
    struct Surface { XrSwapchain xr; };
    std::vector<Surface> surfaces;
};
template<size_t N> void run() {
    XrSession session=reinterpret_cast<XrSession>(1);
    std::map<XrSwapchain,Source> sources;
    std::array<XrCompositionLayerProjection,N> inLayers{},outLayers{};
    std::array<std::array<XrCompositionLayerProjectionView,2>,N> inViews{},outViews{};
    std::array<const XrCompositionLayerBaseHeader*,N> input{},output{};
    for(size_t i=0;i<N;++i) {
        auto& layer=inLayers[i]; layer.type=XR_TYPE_COMPOSITION_LAYER_PROJECTION;
        layer.layerFlags=XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT;
        layer.space=reinterpret_cast<XrSpace>(42); layer.viewCount=2; layer.views=inViews[i].data();
        input[i]=reinterpret_cast<const XrCompositionLayerBaseHeader*>(&layer);
        for(size_t e=0;e<2;++e) {
            auto xr=reinterpret_cast<XrSwapchain>(10+i*2+e);
            auto& s=sources[xr]; s.session=session;s.info.width=3072;s.info.height=6144;s.info.arraySize=1;
            s.surfaces.push_back({reinterpret_cast<XrSwapchain>(100+i*2+e)});
            auto& v=inViews[i][e];v.type=XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW;
            v.pose.orientation.w=1;v.pose.position.x=float(e);v.fov={-.7f,.8f,.6f,-.5f};
            v.subImage={xr,{{int32_t(e*1536),0},{1536,6144}},0};
        }
    }
    XrFrameEndInfo info{XR_TYPE_FRAME_END_INFO};info.displayTime=1234;info.layerCount=N;info.layers=input.data();
    auto lookup=[&](XrSwapchain xr)->Source* { auto it=sources.find(xr);return it==sources.end()?nullptr:&it->second; };
    auto prepare=[&] { return gxr::video::prepareFrame(session,info,lookup,outLayers,outViews,output); };
    check(!prepare()); for(auto& s:sources) check(s.second.interested);
    for(auto& s:sources) s.second.ready=true;
    sources.begin()->second.ready=false;check(!prepare()); // No partial-eye submission.
    sources.begin()->second.ready=true;check(prepare());
    for(size_t i=0;i<N;++i) for(size_t e=0;e<2;++e) {
        const auto& a=inViews[i][e]; const auto& b=outViews[i][e];
        check(a.subImage.swapchain!=b.subImage.swapchain);
        check(b.subImage.swapchain==sources[a.subImage.swapchain].surfaces[0].xr);
        check(!std::memcmp(&a.pose,&b.pose,sizeof(a.pose)) && !std::memcmp(&a.fov,&b.fov,sizeof(a.fov)));
        check(!std::memcmp(&a.subImage.imageRect,&b.subImage.imageRect,sizeof(XrRect2Di)));
        check(outLayers[i].layerFlags==inLayers[i].layerFlags && outLayers[i].space==inLayers[i].space);
    }
    check(info.layers==input.data() && info.displayTime==1234); // Input remains caller-owned.
    auto& v=inViews[N-1][1];v.subImage.imageRect.extent.width=9999;
    for(auto& s:sources) s.second.interested=false;
    check(!prepare());for(auto& s:sources) check(!s.second.interested);
    v.subImage.imageRect.extent.width=1536;
    v.next=&info;check(!prepare());v.next=nullptr;
    v.subImage.imageArrayIndex=1;check(!prepare());v.subImage.imageArrayIndex=0;
    sources.begin()->second.session=nullptr;check(!prepare());sources.begin()->second.session=session;
    info.layerCount=N-1;check(!prepare());info.layerCount=N;
    sources.begin()->second.ready=false;check(!prepare()); // Paused/restarted sessions need new buffers.
}
int main() {run<2>();run<3>();std::cout<<"PASS both projection counts: all-or-original readiness, pose/FOV/alpha/rect preservation, invalid-frame nonmutation\n";}

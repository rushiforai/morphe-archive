#include <EGL/egl.h>
#include <GLES3/gl3.h>
#include <jni.h>
#include <android/log.h>
#include <openxr/openxr.h>
#include <openxr/openxr_platform.h>
#include <openxr/openxr_loader_negotiation.h>
#include <array>
#include <cstring>
#include <deque>
#include <map>
#include <memory>
#include <mutex>
#include <vector>
#include "canvas_geometry.h"

#define EXPORT extern "C" __attribute__((visibility("default")))
namespace {
constexpr const char* kName = "XR_APILAYER_local_GalaxyXR_foveal_canvas";
constexpr int kWidth = 5000, kHeight = 6000;
constexpr const char* kBuild = "foveal-canvas-5001812-v1-20261001";
#define LOG(...) __android_log_print(ANDROID_LOG_INFO, "GXRFovealCanvas", __VA_ARGS__)
struct Dispatch {
    PFN_xrGetInstanceProcAddr get{};
    PFN_xrDestroyInstance destroyInstance{};
    PFN_xrCreateSession createSession{};
    PFN_xrDestroySession destroySession{};
    PFN_xrGetSystemProperties properties{};
    PFN_xrCreateSwapchain createSwapchain{};
    PFN_xrDestroySwapchain destroySwapchain{};
    PFN_xrEnumerateSwapchainImages images{};
    PFN_xrAcquireSwapchainImage acquire{};
    PFN_xrWaitSwapchainImage wait{};
    PFN_xrReleaseSwapchainImage release{};
    PFN_xrEndFrame endFrame{};
} g;
struct Acquired { uint32_t index; bool waited; };
struct Source {
    XrSession session{};
    XrSwapchainCreateInfo info{};
    std::deque<Acquired> acquired;
    std::vector<XrSwapchainImageOpenGLESKHR> images;
    GLuint snapshot{};
    bool selected{}, ready{};
};
struct Canvas {
    XrSwapchain handle{XR_NULL_HANDLE};
    std::vector<XrSwapchainImageOpenGLESKHR> images;
};
struct Session {
    EGLDisplay display{EGL_NO_DISPLAY};
    EGLConfig config{};
    EGLContext app{EGL_NO_CONTEXT}, helper{EGL_NO_CONTEXT};
    EGLSurface surface{EGL_NO_SURFACE};
    GLuint readFbo{}, drawFbo{};
    uint32_t maxWidth{}, maxHeight{};
    std::array<Canvas, 2> canvas;
    int64_t canvasFormat{};
    std::array<XrSwapchain, 2> sources{};
    bool disabled{}, reasonLogged{};
    uint64_t frames{}, captures{};
};
std::mutex mutex;
std::map<XrSession, std::unique_ptr<Session>> sessions;
std::map<XrSwapchain, Source> sources;

void reason(Session& s, const char* why) {
    if (!s.reasonLogged) { LOG("fallback reason=%s original_frame_preserved=true", why); s.reasonLogged = true; }
}
bool samePose(const XrPosef& a, const XrPosef& b) {
    const float av[] = {a.position.x,a.position.y,a.position.z,a.orientation.x,a.orientation.y,a.orientation.z,a.orientation.w};
    const float bv[] = {b.position.x,b.position.y,b.position.z,b.orientation.x,b.orientation.y,b.orientation.z,b.orientation.w};
    for (unsigned i=0; i<7; ++i) if (!std::isfinite(av[i]) || !std::isfinite(bv[i]) || std::abs(av[i]-bv[i]) > 1e-5f) return false;
    return true;
}
gxr_canvas::Fov fov(const XrFovf& f) { return {f.angleLeft, f.angleRight, f.angleDown, f.angleUp}; }
bool knownLayerChain(const void* next) {
    // Exact 5001812 attaches FB composition-layer settings to both projections.
    // Preserve those pointers/settings verbatim. Unknown image-dependent layer
    // extensions are not inferred to remain valid after image/FOV replacement.
    const auto* item = reinterpret_cast<const XrBaseInStructure*>(next);
    return !item || (item->type == XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB && item->next == nullptr);
}

// All FBO/texture state lives in a private shared GLES context. Valve's context
// and its state are restored exactly. The experiment uses glFinish at ownership
// boundaries to establish correctness; this is intentionally not a speed claim.
class Graphics {
    Session& s;
    EGLDisplay oldDisplay;
    EGLContext oldContext;
    EGLSurface oldDraw, oldRead;
public:
    bool active{};
    explicit Graphics(Session& state) : s(state), oldDisplay(eglGetCurrentDisplay()),
        oldContext(eglGetCurrentContext()), oldDraw(eglGetCurrentSurface(EGL_DRAW)),
        oldRead(eglGetCurrentSurface(EGL_READ)) {
        if (s.helper == EGL_NO_CONTEXT) {
            const EGLint contextAttributes[] = {EGL_CONTEXT_CLIENT_VERSION, 3, EGL_NONE};
            const EGLint surfaceAttributes[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};
            s.helper = eglCreateContext(s.display, s.config, s.app, contextAttributes);
            if (s.helper == EGL_NO_CONTEXT) return;
            s.surface = eglCreatePbufferSurface(s.display, s.config, surfaceAttributes);
            if (s.surface == EGL_NO_SURFACE) { eglDestroyContext(s.display, s.helper); s.helper = EGL_NO_CONTEXT; return; }
        }
        active = eglMakeCurrent(s.display, s.surface, s.surface, s.helper) == EGL_TRUE;
        if (active && !s.readFbo) { glGenFramebuffers(1, &s.readFbo); glGenFramebuffers(1, &s.drawFbo); }
    }
    ~Graphics() {
        if (!active) return;
        if (oldDisplay == EGL_NO_DISPLAY) eglMakeCurrent(s.display, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
        else if (!eglMakeCurrent(oldDisplay, oldDraw, oldRead, oldContext)) {
            LOG("fatal_context_restore_failed"); s.disabled = true;
        }
    }
};
bool glOk() { return glGetError() == GL_NO_ERROR; }
bool enumerateImages(XrSwapchain sc, std::vector<XrSwapchainImageOpenGLESKHR>& images) {
    uint32_t count{};
    if (XR_FAILED(g.images(sc, 0, &count, nullptr)) || !count || count > 16) return false;
    images.resize(count);
    for (auto& image : images) image.type = XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR;
    uint32_t returned{};
    if (XR_FAILED(g.images(sc, count, &returned, reinterpret_cast<XrSwapchainImageBaseHeader*>(images.data()))) || returned != count) return false;
    for (auto& image : images) if (!image.image) return false;
    return true;
}
bool supported(const XrSwapchainCreateInfo& i) {
    return i.width && i.height && i.width <= 16384 && i.height <= 16384 &&
        i.arraySize == 1 && i.faceCount == 1 && i.mipCount == 1 && i.sampleCount == 1 &&
        i.createFlags == 0 && (i.format == GL_SRGB8_ALPHA8 || i.format == GL_RGBA8 || i.format == GL_RGB10_A2);
}
void deleteSource(Source& source) {
    if (source.snapshot) glDeleteTextures(1, &source.snapshot);
    source.snapshot = 0; source.ready = false;
}
void cleanup(XrSession session, Session& s) {
    {
        Graphics graphics(s);
        if (graphics.active) {
            for (auto& entry : sources) if (entry.second.session == session) deleteSource(entry.second);
            if (s.readFbo) glDeleteFramebuffers(1, &s.readFbo);
            if (s.drawFbo) glDeleteFramebuffers(1, &s.drawFbo);
            s.readFbo = s.drawFbo = 0;
            glFinish();
        }
    }
    for (auto& canvas : s.canvas) {
        if (canvas.handle != XR_NULL_HANDLE) g.destroySwapchain(canvas.handle);
        canvas = {};
    }
    if (s.surface != EGL_NO_SURFACE) eglDestroySurface(s.display, s.surface);
    if (s.helper != EGL_NO_CONTEXT) eglDestroyContext(s.display, s.helper);
    s.surface = EGL_NO_SURFACE; s.helper = EGL_NO_CONTEXT;
}
bool capture(Session& s, Source& source, XrSwapchain handle, uint32_t index) {
    source.ready = false;
    if (s.disabled || !supported(source.info) || eglGetCurrentContext() != s.app ||
        eglGetCurrentDisplay() != s.display) return false;
    if (source.images.empty() && !enumerateImages(handle, source.images)) return false;
    if (index >= source.images.size()) return false;
    // Complete Valve's rendering before a shared-context read. Never touch a
    // source image after the downstream xrReleaseSwapchainImage call.
    glFinish();
    Graphics graphics(s);
    if (!graphics.active) return false;
    if (!source.snapshot) {
        glGenTextures(1, &source.snapshot);
        glBindTexture(GL_TEXTURE_2D, source.snapshot);
        glTexStorage2D(GL_TEXTURE_2D, 1, static_cast<GLenum>(source.info.format), source.info.width, source.info.height);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    }
    glBindFramebuffer(GL_READ_FRAMEBUFFER, s.readFbo);
    glFramebufferTexture2D(GL_READ_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, source.images[index].image, 0);
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, s.drawFbo);
    glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, source.snapshot, 0);
    if (glCheckFramebufferStatus(GL_READ_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE ||
        glCheckFramebufferStatus(GL_DRAW_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) return false;
    glDisable(GL_SCISSOR_TEST);
    glBlitFramebuffer(0,0,source.info.width,source.info.height,0,0,source.info.width,source.info.height,GL_COLOR_BUFFER_BIT,GL_NEAREST);
    glFinish();
    source.ready = glOk();
    if (source.ready) ++s.captures;
    return source.ready;
}
bool createCanvases(XrSession session, Session& s, int64_t format) {
    if (s.canvas[0].handle != XR_NULL_HANDLE && s.canvas[1].handle != XR_NULL_HANDLE && s.canvasFormat == format) return true;
    for (auto& previous : s.canvas) {
        if (previous.handle != XR_NULL_HANDLE && XR_FAILED(g.destroySwapchain(previous.handle))) {
            s.disabled = true; return false;
        }
        previous = {};
    }
    if (s.maxWidth < kWidth || s.maxHeight < kHeight) {
        LOG("canvas_limit requested=%dx%d max=%ux%u no_clamp=true",kWidth,kHeight,s.maxWidth,s.maxHeight);
        s.disabled = true; return false;
    }
    XrSwapchainCreateInfo info{XR_TYPE_SWAPCHAIN_CREATE_INFO};
    info.usageFlags = XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT | XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
    info.format = format; info.sampleCount = 1; info.width = kWidth; info.height = kHeight;
    info.faceCount = info.arraySize = info.mipCount = 1;
    for (auto& canvas : s.canvas) {
        const auto result = g.createSwapchain(session, &info, &canvas.handle);
        if (XR_FAILED(result) || !enumerateImages(canvas.handle, canvas.images)) {
            LOG("canvas_create_failed requested=%dx%d format=%lld result=%d no_clamp=true",kWidth,kHeight,static_cast<long long>(format),result);
            for (auto& partial : s.canvas) { if (partial.handle != XR_NULL_HANDLE) g.destroySwapchain(partial.handle); partial = {}; }
            s.disabled = true; return false;
        }
    }
    s.canvasFormat = format;
    LOG("canvas_created per_eye=%dx%d format=%lld image_counts=%zu,%zu buffer_bytes=%llu",
        kWidth,kHeight,static_cast<long long>(format),s.canvas[0].images.size(),s.canvas[1].images.size(),
        static_cast<unsigned long long>(kWidth)*kHeight*4*(s.canvas[0].images.size()+s.canvas[1].images.size()));
    return true;
}
bool validRect(const XrSwapchainSubImage& image, const Source& s) {
    const auto& r = image.imageRect;
    return image.imageArrayIndex == 0 && r.offset.x >= 0 && r.offset.y >= 0 &&
        r.extent.width > 0 && r.extent.height > 0 &&
        int64_t(r.offset.x)+r.extent.width <= s.info.width &&
        int64_t(r.offset.y)+r.extent.height <= s.info.height;
}
bool drawCanvases(Session& s, const XrCompositionLayerProjection& base,
                  const XrCompositionLayerProjection& fovea,
                  std::array<XrCompositionLayerProjectionView,2>& output) {
    Graphics graphics(s);
    if (!graphics.active) return false;
    // Validate both views before modifying/acquiring any canvas.
    std::array<gxr_canvas::Rect,2> destinations;
    for (unsigned eye=0; eye<2; ++eye) {
        const auto& v = fovea.views[eye];
        const auto found = sources.find(v.subImage.swapchain);
        if (found == sources.end() || !found->second.ready || !validRect(v.subImage, found->second) ||
            !samePose(base.views[eye].pose, v.pose) ||
            !gxr_canvas::placement(fov(base.views[eye].fov),fov(v.fov),v.subImage.imageRect.extent.width,
                v.subImage.imageRect.extent.height,kWidth,kHeight,destinations[eye])) return false;
    }
    for (unsigned eye=0; eye<2; ++eye) {
        auto& canvas = s.canvas[eye];
        uint32_t index{};
        XrSwapchainImageAcquireInfo ai{XR_TYPE_SWAPCHAIN_IMAGE_ACQUIRE_INFO};
        if (XR_FAILED(g.acquire(canvas.handle,&ai,&index))) return false;
        XrSwapchainImageWaitInfo wi{XR_TYPE_SWAPCHAIN_IMAGE_WAIT_INFO}; wi.timeout = XR_INFINITE_DURATION;
        const XrResult waited = g.wait(canvas.handle,&wi);
        if (waited != XR_SUCCESS) {
            // Never release an image that did not complete its required wait.
            // Session teardown destroys this disabled private swapchain.
            LOG("canvas_wait_failed result=%d", waited); s.disabled = true; return false;
        }
        bool ok = index < canvas.images.size();
        if (ok) {
            const auto& view = fovea.views[eye];
            auto& src = sources.at(view.subImage.swapchain);
            glBindFramebuffer(GL_READ_FRAMEBUFFER,s.readFbo);
            glFramebufferTexture2D(GL_READ_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,src.snapshot,0);
            glBindFramebuffer(GL_DRAW_FRAMEBUFFER,s.drawFbo);
            glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,canvas.images[index].image,0);
            ok = glCheckFramebufferStatus(GL_READ_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE &&
                 glCheckFramebufferStatus(GL_DRAW_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE;
            if (ok) {
                glDisable(GL_SCISSOR_TEST); glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
                glClearColor(0,0,0,0); glClear(GL_COLOR_BUFFER_BIT);
                const auto& r = view.subImage.imageRect;
                const auto& d = destinations[eye];
                glBlitFramebuffer(r.offset.x,r.offset.y,r.offset.x+r.extent.width,r.offset.y+r.extent.height,
                    d.x,d.y,d.x+d.width,d.y+d.height,GL_COLOR_BUFFER_BIT,GL_LINEAR);
                glFinish(); ok = glOk();
            }
        }
        XrSwapchainImageReleaseInfo ri{XR_TYPE_SWAPCHAIN_IMAGE_RELEASE_INFO};
        const XrResult released = g.release(canvas.handle,&ri);
        if (!ok || XR_FAILED(released)) return false;
        output[eye] = fovea.views[eye];
        output[eye].fov = base.views[eye].fov;
        output[eye].subImage.swapchain = canvas.handle;
        output[eye].subImage.imageArrayIndex = 0;
        output[eye].subImage.imageRect = {{0,0},{kWidth,kHeight}};
        if (s.frames < 3) {
            LOG("canvas_eye eye=%u src_crop=%d,%d,%d,%d dst_rect=%d,%d,%d,%d full=%dx%d mask_preserved=true",
                eye,fovea.views[eye].subImage.imageRect.offset.x,fovea.views[eye].subImage.imageRect.offset.y,
                fovea.views[eye].subImage.imageRect.extent.width,fovea.views[eye].subImage.imageRect.extent.height,
                destinations[eye].x,destinations[eye].y,destinations[eye].width,destinations[eye].height,kWidth,kHeight);
        }
    }
    return true;
}

XrResult XRAPI_PTR createSession(XrInstance instance, const XrSessionCreateInfo* info, XrSession* session) {
    const auto result = g.createSession(instance,info,session);
    if (XR_FAILED(result) || !info || !session) return result;
    auto state = std::make_unique<Session>();
    for (auto* chain = reinterpret_cast<const XrBaseInStructure*>(info->next); chain; chain=chain->next) {
        if (chain->type == XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR) {
            const auto* binding = reinterpret_cast<const XrGraphicsBindingOpenGLESAndroidKHR*>(chain);
            state->display=binding->display; state->config=binding->config; state->app=binding->context;
        }
    }
    XrSystemProperties properties{XR_TYPE_SYSTEM_PROPERTIES};
    if (XR_SUCCEEDED(g.properties(instance,info->systemId,&properties))) {
        state->maxWidth=properties.graphicsProperties.maxSwapchainImageWidth;
        state->maxHeight=properties.graphicsProperties.maxSwapchainImageHeight;
    }
    state->disabled = state->display == EGL_NO_DISPLAY || state->app == EGL_NO_CONTEXT;
    LOG("session build=%s requested_per_eye=%dx%d runtime_max=%ux%u graphics_supported=%s",kBuild,kWidth,kHeight,
        state->maxWidth,state->maxHeight,state->disabled ? "false":"true");
    std::lock_guard<std::mutex> lock(mutex); sessions[*session]=std::move(state);
    return result;
}
XrResult XRAPI_PTR destroySession(XrSession session) {
    std::lock_guard<std::mutex> lock(mutex);
    const auto it = sessions.find(session);
    if (it != sessions.end()) {
        LOG("summary transformed_frames=%llu source_captures=%llu",static_cast<unsigned long long>(it->second->frames),static_cast<unsigned long long>(it->second->captures));
        cleanup(session,*it->second); sessions.erase(it);
    }
    for (auto it2=sources.begin(); it2!=sources.end();) {
        if (it2->second.session == session) it2=sources.erase(it2); else ++it2;
    }
    return g.destroySession(session);
}
XrResult XRAPI_PTR createSwapchain(XrSession session, const XrSwapchainCreateInfo* info, XrSwapchain* swapchain) {
    const auto result=g.createSwapchain(session,info,swapchain);
    if (XR_SUCCEEDED(result) && info && swapchain) {
        std::lock_guard<std::mutex> lock(mutex);
        Source source; source.session=session; source.info=*info; source.info.next=nullptr;
        sources[*swapchain]=std::move(source);
    }
    return result;
}
XrResult XRAPI_PTR destroySwapchain(XrSwapchain swapchain) {
    std::lock_guard<std::mutex> lock(mutex);
    const auto found=sources.find(swapchain);
    if (found != sources.end()) {
        const auto session=sessions.find(found->second.session);
        if (session != sessions.end() && found->second.snapshot) {
            Graphics graphics(*session->second);
            if (graphics.active) deleteSource(found->second);
        }
    }
    const auto result=g.destroySwapchain(swapchain);
    if (XR_SUCCEEDED(result)) {
        for (auto& session : sessions) {
            if (session.second->sources[0] == swapchain || session.second->sources[1] == swapchain) {
                session.second->sources = {};
            }
        }
        sources.erase(swapchain);
    }
    return result;
}
XrResult XRAPI_PTR acquire(XrSwapchain swapchain, const XrSwapchainImageAcquireInfo* info, uint32_t* index) {
    const auto result=g.acquire(swapchain,info,index);
    if (XR_SUCCEEDED(result) && index) {
        std::lock_guard<std::mutex> lock(mutex);
        const auto found=sources.find(swapchain);
        if (found != sources.end()) found->second.acquired.push_back({*index,false});
    }
    return result;
}
XrResult XRAPI_PTR waitImage(XrSwapchain swapchain, const XrSwapchainImageWaitInfo* info) {
    const auto result=g.wait(swapchain,info);
    if (result == XR_SUCCESS) {
        std::lock_guard<std::mutex> lock(mutex);
        const auto found=sources.find(swapchain);
        if (found != sources.end()) for (auto& image:found->second.acquired) if (!image.waited) { image.waited=true; break; }
    }
    return result;
}
XrResult XRAPI_PTR release(XrSwapchain swapchain, const XrSwapchainImageReleaseInfo* info) {
    std::lock_guard<std::mutex> lock(mutex);
    const auto found=sources.find(swapchain);
    if (found != sources.end()) {
        auto& source=found->second;
        const auto session=sessions.find(source.session);
        if (session != sessions.end() && source.selected && !session->second->disabled) {
            if (source.acquired.empty() || !source.acquired.front().waited ||
                !capture(*session->second,source,swapchain,source.acquired.front().index)) {
                source.ready=false; session->second->disabled=true;
                reason(*session->second,"capture_failed_or_unsupported_source");
            }
        }
    }
    // The capture has completed before ownership is handed to the runtime.
    const auto result=g.release(swapchain,info);
    if (found != sources.end() && XR_SUCCEEDED(result)) {
        if (!found->second.acquired.empty()) found->second.acquired.pop_front();
    } else if (found != sources.end()) found->second.ready=false;
    return result;
}
XrResult XRAPI_PTR endFrame(XrSession session, const XrFrameEndInfo* info) {
    std::lock_guard<std::mutex> lock(mutex);
    const auto found=sessions.find(session);
    if (found == sessions.end() || found->second->disabled || !info || !info->layers ||
        (info->layerCount != 2 && info->layerCount != 3)) return g.endFrame(session,info);
    auto& s=*found->second;
    // Accept the 2 verified projections, optionally followed by the working
    // trigger quad. Other topology/extension chains pass through unchanged.
    if (!info->layers[0] || !info->layers[1] ||
        info->layers[0]->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION ||
        info->layers[1]->type != XR_TYPE_COMPOSITION_LAYER_PROJECTION ||
        (info->layerCount == 3 && (!info->layers[2] || info->layers[2]->type != XR_TYPE_COMPOSITION_LAYER_QUAD))) return g.endFrame(session,info);
    const auto& base=*reinterpret_cast<const XrCompositionLayerProjection*>(info->layers[0]);
    const auto& fovea=*reinterpret_cast<const XrCompositionLayerProjection*>(info->layers[1]);
    if (base.viewCount != 2 || fovea.viewCount != 2 || !base.views || !fovea.views ||
        base.space != fovea.space || !knownLayerChain(base.next) || !knownLayerChain(fovea.next) ||
        fovea.layerFlags != (XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT | XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT)) return g.endFrame(session,info);
    std::array<XrSwapchain,2> current;
    bool ready=true;
    int64_t format{};
    for (unsigned eye=0; eye<2; ++eye) {
        current[eye]=fovea.views[eye].subImage.swapchain;
        const auto src=sources.find(current[eye]);
        if (src == sources.end() || src->second.session != session || !supported(src->second.info) ||
            fovea.views[eye].next || base.views[eye].next || !validRect(fovea.views[eye].subImage,src->second)) {
            if (src != sources.end() && !s.reasonLogged) {
                LOG("source_contract eye=%u format=%lld size=%ux%u samples=%u array=%u faces=%u mips=%u",
                    eye,static_cast<long long>(src->second.info.format),src->second.info.width,src->second.info.height,
                    src->second.info.sampleCount,src->second.info.arraySize,src->second.info.faceCount,src->second.info.mipCount);
            }
            reason(s,"unsupported_source_contract"); return g.endFrame(session,info);
        }
        if (eye == 0) format=src->second.info.format;
        else if (format != src->second.info.format || current[0] == current[1]) return g.endFrame(session,info);
        ready &= src->second.ready;
    }
    if (s.sources != current) {
        for (auto old:s.sources) { const auto oldSource=sources.find(old); if (oldSource != sources.end()) oldSource->second.selected=false; }
        s.sources=current;
        for (auto sc:current) { sources.at(sc).selected=true; sources.at(sc).ready=false; }
        LOG("source_discovered wait_for_owned_capture=true source_format=%lld",static_cast<long long>(format));
        return g.endFrame(session,info);
    }
    if (!ready) return g.endFrame(session,info);
    // A stream format change recreates differently formatted output images.
    if (!createCanvases(session,s,format)) { reason(s,"canvas_unavailable"); return g.endFrame(session,info); }
    std::array<XrCompositionLayerProjectionView,2> views;
    if (!drawCanvases(s,base,fovea,views)) { s.disabled=true; reason(s,"canvas_draw_geometry_or_ownership_failed"); return g.endFrame(session,info); }
    XrCompositionLayerProjection replacement=fovea; replacement.views=views.data();
    std::array<const XrCompositionLayerBaseHeader*,3> layers{info->layers[0],reinterpret_cast<const XrCompositionLayerBaseHeader*>(&replacement),nullptr};
    if (info->layerCount == 3) layers[2]=info->layers[2];
    XrFrameEndInfo output=*info; output.layers=layers.data();
    const auto result=g.endFrame(session,&output);
    if (XR_SUCCEEDED(result)) {
        ++s.frames;
        if (s.frames <= 3) LOG("frame layers=%u base_pointer_preserved=true second_projection_canvas=true terminal_quad_preserved=%s result=%d",info->layerCount,info->layerCount==3?"true":"absent",result);
    } else { s.disabled=true; reason(s,"runtime_rejected_canvas_future_frames_original"); }
    return result;
}
XrResult XRAPI_PTR destroyInstance(XrInstance instance) {
    std::lock_guard<std::mutex> lock(mutex);
    for (auto& session:sessions) cleanup(session.first,*session.second);
    sessions.clear(); sources.clear();
    const auto result=g.destroyInstance(instance); g={}; return result;
}
XrResult XRAPI_PTR get(XrInstance instance,const char* name,PFN_xrVoidFunction* function) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
#define ROUTE(n,f) if (std::strcmp(name,n)==0) *function=reinterpret_cast<PFN_xrVoidFunction>(f)
    ROUTE("xrGetInstanceProcAddr",get);
    else ROUTE("xrCreateSession",createSession);
    else ROUTE("xrDestroySession",destroySession);
    else ROUTE("xrCreateSwapchain",createSwapchain);
    else ROUTE("xrDestroySwapchain",destroySwapchain);
    else ROUTE("xrAcquireSwapchainImage",acquire);
    else ROUTE("xrWaitSwapchainImage",waitImage);
    else ROUTE("xrReleaseSwapchainImage",release);
    else ROUTE("xrEndFrame",endFrame);
    else ROUTE("xrDestroyInstance",destroyInstance);
    else return g.get(instance,name,function);
#undef ROUTE
    return XR_SUCCESS;
}
XrResult XRAPI_PTR create(const XrInstanceCreateInfo* info,const XrApiLayerCreateInfo* layer,XrInstance* instance) {
    if (!info || !layer || !layer->nextInfo || !instance) return XR_ERROR_INITIALIZATION_FAILED;
    XrApiLayerCreateInfo next=*layer; next.nextInfo=layer->nextInfo->next;
    const auto result=layer->nextInfo->nextCreateApiLayerInstance(info,&next,instance);
    if (XR_FAILED(result)) return result;
    g.get=layer->nextInfo->nextGetInstanceProcAddr;
#define LOAD(name,member) if (XR_FAILED(g.get(*instance,name,reinterpret_cast<PFN_xrVoidFunction*>(&g.member))) || !g.member) { \
    if (g.destroyInstance) g.destroyInstance(*instance); g={}; *instance=XR_NULL_HANDLE; return XR_ERROR_INITIALIZATION_FAILED; }
    LOAD("xrDestroyInstance",destroyInstance); LOAD("xrCreateSession",createSession); LOAD("xrDestroySession",destroySession);
    LOAD("xrGetSystemProperties",properties); LOAD("xrCreateSwapchain",createSwapchain); LOAD("xrDestroySwapchain",destroySwapchain);
    LOAD("xrEnumerateSwapchainImages",images); LOAD("xrAcquireSwapchainImage",acquire); LOAD("xrWaitSwapchainImage",wait);
    LOAD("xrReleaseSwapchainImage",release); LOAD("xrEndFrame",endFrame);
#undef LOAD
    LOG("initialized build=%s regular_gl=true android_surface=false canvas_per_eye=%dx%d",kBuild,kWidth,kHeight);
    return result;
}
} // namespace
EXPORT XrResult XRAPI_PTR xrNegotiateLoaderApiLayerInterface(const XrNegotiateLoaderInfo* loader,
    const char* name,XrNegotiateApiLayerRequest* request) {
    if (!loader || !name || !request || std::strcmp(name,kName)!=0 ||
        loader->minInterfaceVersion > XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loader->maxInterfaceVersion < XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loader->maxApiVersion < XR_MAKE_VERSION(1,0,0) || loader->minApiVersion > XR_MAKE_VERSION(1,1,0)) return XR_ERROR_INITIALIZATION_FAILED;
    request->layerInterfaceVersion=XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion=std::min<XrVersion>(loader->maxApiVersion,XR_MAKE_VERSION(1,1,0));
    request->getInstanceProcAddr=get; request->createApiLayerInstance=create;
    return XR_SUCCESS;
}

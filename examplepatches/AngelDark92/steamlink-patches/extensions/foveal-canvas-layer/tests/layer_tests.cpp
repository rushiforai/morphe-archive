// Stateful ownership/context doubles exercise the real shipping interceptor.
// They are not Android driver compilation, GPU pixel or runtime acceptance proof.
#include <cassert>
#include <cstdint>
#include <cstdio>
#include <string>
#include <set>
#include <algorithm>
#include "../src/foveal_canvas_layer.cpp"

namespace test {
template<class T> T handle(uintptr_t value) { return reinterpret_cast<T>(value); }
struct RuntimeImage { GLuint texture; bool owned{}, waited{}; int64_t format; };
struct GlState { GLuint readFbo{}, drawFbo{}, texture{}; };
struct Blit { GLuint read{}, draw{}; std::array<int,8> rect; GLenum filter; };
std::map<XrSwapchain,RuntimeImage> runtime;
std::map<EGLContext,GlState> glStates;
std::map<GLuint,GLuint> attachments;
std::set<GLuint> textures, framebuffers;
std::vector<std::string> events;
std::vector<Blit> blits;
EGLDisplay currentDisplay=handle<EGLDisplay>(1);
EGLContext currentContext=handle<EGLContext>(2);
EGLSurface currentDraw=handle<EGLSurface>(3), currentRead=handle<EGLSurface>(4);
GLuint nextGl=10000, nextRuntimeTexture=100;
uintptr_t nextSwapchain=100;
int clearCount{}, destroyedContexts{}, destroyedSurfaces{};
bool failFramebuffer{}, failCanvasCreate{}, failCanvasWait{};
XrResult frameResult=XR_SUCCESS;
uint32_t runtimeMaxWidth=8192, runtimeMaxHeight=8192;
const XrFrameEndInfo* lastInfo{};
const XrCompositionLayerBaseHeader* lastBase{}, *lastSecond{}, *lastQuad{};
XrCompositionLayerProjection lastProjection{};
std::array<XrCompositionLayerProjectionView,2> lastViews;
uint32_t lastLayerCount{};
int64_t lastDisplayTime{};
XrResult XRAPI_PTR runtimeCreateSession(XrInstance,const XrSessionCreateInfo*,XrSession* output) {
    *output=handle<XrSession>(10); return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeDestroySession(XrSession) { events.push_back("destroy-session"); return XR_SUCCESS; }
XrResult XRAPI_PTR runtimeProperties(XrInstance,XrSystemId,XrSystemProperties* p) {
    p->graphicsProperties.maxSwapchainImageWidth=runtimeMaxWidth;
    p->graphicsProperties.maxSwapchainImageHeight=runtimeMaxHeight; return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeCreateSwapchain(XrSession,const XrSwapchainCreateInfo* info,XrSwapchain* out) {
    if (info->width==5000 && failCanvasCreate) return XR_ERROR_RUNTIME_FAILURE;
    *out=handle<XrSwapchain>(nextSwapchain++);
    runtime[*out]={nextRuntimeTexture++,false,false,info->format};
    events.push_back(info->width==5000?"create-canvas":"create-source"); return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeDestroySwapchain(XrSwapchain sc) { runtime.erase(sc); events.push_back("destroy-swapchain"); return XR_SUCCESS; }
XrResult XRAPI_PTR runtimeImages(XrSwapchain sc,uint32_t capacity,uint32_t* count,XrSwapchainImageBaseHeader* out) {
    assert(runtime.count(sc)); *count=1;
    if (capacity) { assert(out); reinterpret_cast<XrSwapchainImageOpenGLESKHR*>(out)->image=runtime.at(sc).texture; }
    return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeAcquire(XrSwapchain sc,const XrSwapchainImageAcquireInfo*,uint32_t* index) {
    auto& r=runtime.at(sc); assert(!r.owned); r.owned=true; r.waited=false; *index=0; return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeWait(XrSwapchain sc,const XrSwapchainImageWaitInfo*) {
    auto& r=runtime.at(sc); assert(r.owned);
    if (failCanvasWait && sources.count(sc)==0) return XR_TIMEOUT_EXPIRED;
    r.waited=true; return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeRelease(XrSwapchain sc,const XrSwapchainImageReleaseInfo*) {
    auto& r=runtime.at(sc); assert(r.owned && r.waited); r.owned=false;
    events.push_back("release-"+std::to_string(r.texture)); return XR_SUCCESS;
}
XrResult XRAPI_PTR runtimeEndFrame(XrSession,const XrFrameEndInfo* info) {
    lastInfo=info; lastLayerCount=info->layerCount; lastDisplayTime=info->displayTime;
    lastBase=info->layers[0]; lastSecond=info->layers[1]; lastQuad=info->layerCount==3?info->layers[2]:nullptr;
    lastProjection=*reinterpret_cast<const XrCompositionLayerProjection*>(lastSecond);
    for (unsigned eye=0;eye<2;++eye) lastViews[eye]=lastProjection.views[eye];
    return frameResult;
}
void reset() {
    assert(sessions.empty() && sources.empty() && textures.empty() && framebuffers.empty());
    runtime.clear(); glStates.clear(); attachments.clear(); events.clear(); blits.clear();
    currentDisplay=handle<EGLDisplay>(1); currentContext=handle<EGLContext>(2);
    currentDraw=handle<EGLSurface>(3); currentRead=handle<EGLSurface>(4);
    glStates[currentContext]={71,72,73}; clearCount=destroyedContexts=destroyedSurfaces=0;
    failFramebuffer=failCanvasCreate=failCanvasWait=false; frameResult=XR_SUCCESS;
    runtimeMaxWidth=runtimeMaxHeight=8192;
    g={}; g.createSession=runtimeCreateSession; g.destroySession=runtimeDestroySession;
    g.properties=runtimeProperties; g.createSwapchain=runtimeCreateSwapchain; g.destroySwapchain=runtimeDestroySwapchain;
    g.images=runtimeImages; g.acquire=runtimeAcquire; g.wait=runtimeWait; g.release=runtimeRelease; g.endFrame=runtimeEndFrame;
}
void appStateRestored() {
    assert(currentDisplay==handle<EGLDisplay>(1) && currentContext==handle<EGLContext>(2));
    assert(currentDraw==handle<EGLSurface>(3) && currentRead==handle<EGLSurface>(4));
    const auto& state=glStates.at(currentContext); assert(state.readFbo==71 && state.drawFbo==72 && state.texture==73);
}
struct Fixture {
    XrSession session{};
    std::array<XrSwapchain,2> source{};
    std::array<XrCompositionLayerProjectionView,2> baseViews{}, foveaViews{};
    XrCompositionLayerProjection base{XR_TYPE_COMPOSITION_LAYER_PROJECTION}, fovea{XR_TYPE_COMPOSITION_LAYER_PROJECTION};
    XrCompositionLayerSettingsFB baseSettings{XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB}, foveaSettings{XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB};
    XrCompositionLayerQuad quad{XR_TYPE_COMPOSITION_LAYER_QUAD};
    std::array<const XrCompositionLayerBaseHeader*,3> layers;
    XrFrameEndInfo frame{XR_TYPE_FRAME_END_INFO};
    explicit Fixture(bool withQuad=false,int64_t format=GL_SRGB8_ALPHA8,uint32_t samples=1) {
        reset();
        XrGraphicsBindingOpenGLESAndroidKHR binding{XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR};
        binding.display=currentDisplay; binding.context=currentContext; binding.config=handle<EGLConfig>(5);
        XrSessionCreateInfo info{XR_TYPE_SESSION_CREATE_INFO}; info.next=&binding; info.systemId=1;
        assert(createSession(handle<XrInstance>(9),&info,&session)==XR_SUCCESS);
        replaceSources(format,samples);
        for (unsigned eye=0;eye<2;++eye) {
            baseViews[eye].type=foveaViews[eye].type=XR_TYPE_COMPOSITION_LAYER_PROJECTION_VIEW;
            baseViews[eye].pose.orientation.w=foveaViews[eye].pose.orientation.w=1;
            baseViews[eye].fov={float(std::atan(-1.)),float(std::atan(1.)),float(std::atan(1.)),float(std::atan(-1.))};
            foveaViews[eye].fov={float(std::atan(-.25)),float(std::atan(.25)),float(std::atan(.25)),float(std::atan(-.25))};
            foveaViews[eye].subImage.imageRect={{0,0},{1000,1000}};
        }
        base.space=fovea.space=handle<XrSpace>(11); base.viewCount=fovea.viewCount=2;
        base.next=&baseSettings; fovea.next=&foveaSettings;
        baseSettings.layerFlags=XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SUPER_SAMPLING_BIT_FB;
        foveaSettings.layerFlags=XR_COMPOSITION_LAYER_SETTINGS_NORMAL_SHARPENING_BIT_FB;
        base.views=baseViews.data(); fovea.views=foveaViews.data();
        fovea.layerFlags=XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT|XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT;
        layers={reinterpret_cast<const XrCompositionLayerBaseHeader*>(&base),reinterpret_cast<const XrCompositionLayerBaseHeader*>(&fovea),reinterpret_cast<const XrCompositionLayerBaseHeader*>(&quad)};
        frame.layerCount=withQuad?3:2; frame.layers=layers.data(); frame.displayTime=123456789;
    }
    void replaceSources(int64_t format,uint32_t samples=1) {
        for (unsigned eye=0;eye<2;++eye) {
            if (source[eye]!=XR_NULL_HANDLE) assert(destroySwapchain(source[eye])==XR_SUCCESS);
            XrSwapchainCreateInfo info{XR_TYPE_SWAPCHAIN_CREATE_INFO};
            info.width=info.height=1000; info.format=format; info.sampleCount=samples;
            info.arraySize=info.faceCount=info.mipCount=1; info.usageFlags=0x21;
            assert(createSwapchain(session,&info,&source[eye])==XR_SUCCESS);
            foveaViews[eye].subImage.swapchain=source[eye];
        }
    }
    void produce() {
        for (auto sc:source) {
            uint32_t index; XrSwapchainImageAcquireInfo ai{XR_TYPE_SWAPCHAIN_IMAGE_ACQUIRE_INFO};
            XrSwapchainImageWaitInfo wi{XR_TYPE_SWAPCHAIN_IMAGE_WAIT_INFO}; wi.timeout=XR_INFINITE_DURATION;
            XrSwapchainImageReleaseInfo ri{XR_TYPE_SWAPCHAIN_IMAGE_RELEASE_INFO};
            assert(acquire(sc,&ai,&index)==XR_SUCCESS); assert(waitImage(sc,&wi)==XR_SUCCESS);
            assert(release(sc,&ri)==XR_SUCCESS); appStateRestored();
        }
    }
    void submit() { assert(endFrame(session,&frame)==frameResult); appStateRestored(); }
    void discover() { produce(); submit(); assert(lastInfo==&frame); assert(blits.empty()); }
    void finish() {
        assert(destroySession(session)==XR_SUCCESS); appStateRestored();
        assert(sessions.empty() && sources.empty() && textures.empty() && framebuffers.empty());
        assert(destroyedContexts==destroyedSurfaces);
    }
};
} // namespace test

extern "C" {
int __android_log_print(int,const char*,const char*,...) { return 0; }
EGLDisplay eglGetCurrentDisplay() { return test::currentDisplay; }
EGLContext eglGetCurrentContext() { return test::currentContext; }
EGLSurface eglGetCurrentSurface(EGLint type) { return type==EGL_DRAW?test::currentDraw:test::currentRead; }
EGLContext eglCreateContext(EGLDisplay,EGLConfig,EGLContext shared,const EGLint*) {
    assert(shared==test::handle<EGLContext>(2)); return test::handle<EGLContext>(6);
}
EGLSurface eglCreatePbufferSurface(EGLDisplay,EGLConfig,const EGLint*) { return test::handle<EGLSurface>(7); }
EGLBoolean eglMakeCurrent(EGLDisplay d,EGLSurface draw,EGLSurface read,EGLContext c) {
    test::currentDisplay=d; test::currentDraw=draw; test::currentRead=read; test::currentContext=c; return EGL_TRUE;
}
EGLBoolean eglDestroyContext(EGLDisplay,EGLContext) { ++test::destroyedContexts; return EGL_TRUE; }
EGLBoolean eglDestroySurface(EGLDisplay,EGLSurface) { ++test::destroyedSurfaces; return EGL_TRUE; }
GLenum glGetError() { return GL_NO_ERROR; }
void glGenFramebuffers(GLsizei count,GLuint* ids) { for(int i=0;i<count;++i) { ids[i]=test::nextGl++; test::framebuffers.insert(ids[i]); } }
void glDeleteFramebuffers(GLsizei count,const GLuint* ids) { for(int i=0;i<count;++i) assert(test::framebuffers.erase(ids[i])==1); }
void glGenTextures(GLsizei count,GLuint* ids) { for(int i=0;i<count;++i) { ids[i]=test::nextGl++; test::textures.insert(ids[i]); } }
void glDeleteTextures(GLsizei count,const GLuint* ids) { for(int i=0;i<count;++i) assert(test::textures.erase(ids[i])==1); }
void glBindTexture(GLenum,GLuint id) { test::glStates[test::currentContext].texture=id; }
void glTexStorage2D(GLenum,GLsizei,GLenum,GLsizei,GLsizei) {}
void glTexParameteri(GLenum,GLenum,GLint) {}
void glBindFramebuffer(GLenum target,GLuint id) {
    auto& state=test::glStates[test::currentContext]; (target==GL_READ_FRAMEBUFFER?state.readFbo:state.drawFbo)=id;
}
void glFramebufferTexture2D(GLenum target,GLenum,GLenum,GLuint texture,GLint) {
    const auto& state=test::glStates[test::currentContext]; test::attachments[target==GL_READ_FRAMEBUFFER?state.readFbo:state.drawFbo]=texture;
}
GLenum glCheckFramebufferStatus(GLenum) { return test::failFramebuffer?0:GL_FRAMEBUFFER_COMPLETE; }
void glDisable(GLenum) {}
void glBlitFramebuffer(GLint sx0,GLint sy0,GLint sx1,GLint sy1,GLint dx0,GLint dy0,GLint dx1,GLint dy1,GLbitfield,GLenum filter) {
    assert(test::currentContext==test::handle<EGLContext>(6));
    const auto& state=test::glStates[test::currentContext];
    const GLuint read=test::attachments.at(state.readFbo), draw=test::attachments.at(state.drawFbo);
    for (const auto& entry:test::runtime) if (entry.second.texture==read) {
        assert(entry.second.owned && entry.second.waited); // catches post-release reads
        test::events.push_back("capture-"+std::to_string(read));
    }
    test::blits.push_back({read,draw,{sx0,sy0,sx1,sy1,dx0,dy0,dx1,dy1},filter});
}
void glFinish() {}
void glColorMask(GLboolean r,GLboolean g,GLboolean b,GLboolean a) { assert(r&&g&&b&&a); }
void glClearColor(GLfloat r,GLfloat g,GLfloat b,GLfloat a) { assert(r==0&&g==0&&b==0&&a==0); }
void glClear(GLbitfield mask) { assert(mask==GL_COLOR_BUFFER_BIT); ++test::clearCount; }
}

int main() {
    using namespace test;
    for (bool quad:{false,true}) {
        Fixture f(quad); f.discover(); f.produce();
        assert(blits.size()==2);
        for (auto sc:f.source) {
            const auto id=runtime.at(sc).texture;
            auto copied=std::find(events.begin(),events.end(),"capture-"+std::to_string(id));
            auto released=std::find(copied,events.end(),"release-"+std::to_string(id));
            assert(copied!=events.end() && released!=events.end() && copied<released);
        }
        f.submit(); assert(lastInfo!=&f.frame && lastBase==f.layers[0]);
        assert(lastLayerCount==f.frame.layerCount && lastQuad==(quad?f.layers[2]:nullptr));
        assert(lastDisplayTime==f.frame.displayTime && lastProjection.layerFlags==f.fovea.layerFlags);
        assert(lastProjection.next==&f.foveaSettings && f.base.next==&f.baseSettings);
        assert(f.baseSettings.layerFlags==XR_COMPOSITION_LAYER_SETTINGS_QUALITY_SUPER_SAMPLING_BIT_FB);
        assert(f.foveaSettings.layerFlags==XR_COMPOSITION_LAYER_SETTINGS_NORMAL_SHARPENING_BIT_FB);
        assert(blits.size()==4 && clearCount==2);
        for(unsigned eye=0;eye<2;++eye) {
            assert(lastViews[eye].subImage.swapchain!=f.source[eye]);
            assert(lastViews[eye].subImage.imageRect.extent.width==5000 && lastViews[eye].subImage.imageRect.extent.height==6000);
            assert(std::memcmp(&lastViews[eye].fov,&f.baseViews[eye].fov,sizeof(XrFovf))==0);
            assert(samePose(lastViews[eye].pose,f.foveaViews[eye].pose));
            const auto& blit=blits[2+eye]; assert(blit.read==sources.at(f.source[eye]).snapshot);
            assert(blit.rect[4]==1875 && blit.rect[5]==2250 && blit.rect[6]==3125 && blit.rect[7]==3750);
        }
        // Repeated frames read retained snapshots, not returned runtime images.
        f.submit(); assert(blits.size()==6); f.finish();
    }
    { Fixture f; f.discover(); failFramebuffer=true; f.produce(); f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    { Fixture f; f.discover(); f.produce(); failCanvasCreate=true; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    { Fixture f; f.discover(); f.produce(); failCanvasWait=true; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    { Fixture f; f.discover(); f.produce(); f.foveaViews[1].pose.position.x=.1f; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    { Fixture f(false,GL_SRGB8_ALPHA8,2); f.produce(); f.submit(); assert(lastInfo==&f.frame && blits.empty()); f.finish(); }
    { Fixture f; f.discover(); f.produce(); sessions.at(f.session)->maxWidth=4096; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    { Fixture f; f.discover(); f.produce(); frameResult=XR_ERROR_RUNTIME_FAILURE; f.submit(); frameResult=XR_SUCCESS; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    // Unrecognized image-dependent layer settings cannot be carried onto the
    // replacement image. Both an unknown head and a tail behind known FB
    // settings must forward the untouched original frame.
    { Fixture f; f.discover(); f.produce(); XrBaseInStructure unknown{XR_TYPE_COMPOSITION_LAYER_DEPTH_INFO_KHR,nullptr};
      f.fovea.next=&unknown; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    { Fixture f; f.discover(); f.produce(); XrBaseInStructure unknown{XR_TYPE_COMPOSITION_LAYER_DEPTH_INFO_KHR,nullptr};
      f.foveaSettings.next=&unknown; f.submit(); assert(lastInfo==&f.frame); f.finish(); }
    // A changed source format must never reuse differently formatted canvases.
    { Fixture f; f.discover(); f.produce(); f.submit(); f.replaceSources(GL_RGB10_A2); f.produce(); f.submit();
      f.produce(); f.submit(); assert(lastInfo==&f.frame || runtime.at(lastViews[0].subImage.swapchain).format==GL_RGB10_A2); f.finish(); }
    // Some runtimes reuse destroyed opaque handles. A matching numeric handle
    // must still rediscover/capture the new texture, never reuse old snapshots.
    { Fixture f; f.discover(); f.produce(); f.submit();
      const auto previousSources=f.source;
      const auto oldSnapshot=sources.at(f.source[0]).snapshot;
      nextSwapchain=reinterpret_cast<uintptr_t>(f.source[0]);
      f.replaceSources(GL_SRGB8_ALPHA8); assert(f.source==previousSources);
      assert(textures.count(oldSnapshot)==0);
      f.produce(); f.submit(); assert(lastInfo==&f.frame);
      f.produce(); f.submit(); assert(lastInfo!=&f.frame && sources.at(f.source[0]).snapshot!=oldSnapshot);
      f.finish(); }
    std::puts("PASS production layer ownership, snapshot reuse, projection/quad preservation, fallbacks, format transition, context restore and cleanup");
}

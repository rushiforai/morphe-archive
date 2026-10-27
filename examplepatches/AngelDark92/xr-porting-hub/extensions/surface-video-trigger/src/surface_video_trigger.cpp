// Experimental Surface presentation bridge with the terminal trigger. This is
// not a direct decoder bypass. Runtime textures are read ONLY after wait and
// BEFORE release. All projection views (including their alpha) are transferred,
// with no atlas reconstruction, and the proven 2x2 terminal quad is appended.
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>
#include <android/data_space.h>
#include <android/hardware_buffer.h>
#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <jni.h>
#include <openxr/openxr.h>
#include <openxr/openxr_platform.h>
#include <openxr/openxr_loader_negotiation.h>
#include <array>
#include <cstring>
#include <map>
#include <memory>
#include <mutex>
#include <string>
#include <vector>
#include "surface_video_policy.h"
#include "surface_video_frame.h"

#if GXR_VIDEO_PROJECTIONS != 2
#error Exact two-projection build required
#endif
#ifndef GXR_VIDEO_FP16
#error Explicit output format required
#endif
#define EXPORT extern "C" __attribute__((visibility("default")))
namespace {
constexpr char layerName[] = "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1";
constexpr char tag[] = "GXRSurfaceVideoTrigger";
constexpr char buildId[] = "surface-video-trigger-2proj-v1.0-20261025";
constexpr uint32_t projections = GXR_VIDEO_PROJECTIONS;
constexpr bool fp16 = GXR_VIDEO_FP16;
constexpr int64_t srgb8 = 0x8c43;
constexpr uint32_t triggerWidth = 2;
constexpr uint32_t triggerHeight = 2;
std::recursive_mutex mutex;
JavaVM* vm{};
bool enabled{};
struct Dispatch {
    XrInstance instance{};
    PFN_xrGetInstanceProcAddr get{};
    PFN_xrDestroyInstance destroyInstance{};
    PFN_xrCreateSession createSession{};
    PFN_xrDestroySession destroySession{};
    PFN_xrEndSession endSession{};
    PFN_xrCreateReferenceSpace createReferenceSpace{};
    PFN_xrDestroySpace destroySpace{};
    PFN_xrCreateSwapchain create{};
    PFN_xrCreateSwapchainAndroidSurfaceKHR createSurface{};
    PFN_xrDestroySwapchain destroy{};
    PFN_xrEnumerateSwapchainImages enumerate{};
    PFN_xrAcquireSwapchainImage acquire{};
    PFN_xrWaitSwapchainImage wait{};
    PFN_xrReleaseSwapchainImage release{};
    PFN_xrEndFrame endFrame{};
    PFN_xrPollEvent poll{};
} g;
struct Surface {
    XrSwapchain xr{};
    ANativeWindow* window{};
    EGLSurface egl{EGL_NO_SURFACE};
};
struct Session {
    XrSession xr{};
    EGLDisplay display{EGL_NO_DISPLAY};
    EGLContext appContext{EGL_NO_CONTEXT}, context{EGL_NO_CONTEXT};
    EGLSurface pbuffer{EGL_NO_SURFACE};
    EGLConfig config{};
    GLuint program2d{}, programArray{}, vao{}, sampler{};
    XrSpace viewSpace{};
    XrSwapchain triggerSwapchain{};
    ANativeWindow* triggerWindow{};
    XrCompositionLayerQuad triggerQuad{};
    bool triggerReady{};
    bool visible{}, failed{};
    uint64_t frames{}, copies{};
};
struct Swapchain {
    XrSession session{};
    XrSwapchainCreateInfo info{};
    std::vector<XrSwapchainImageOpenGLESKHR> images;
    gxr::video::ImageQueue queue;
    std::vector<Surface> surfaces;
    bool interested{}, ready{}, supported{};
};
std::map<XrSession, Session> sessions;
std::map<XrSwapchain, Swapchain> chains;
void log(const char* event, int value = 0) {
    __android_log_print(ANDROID_LOG_INFO, tag,
        "event=%s value=%d projections=%u fp16=%d build=%s",
        event, value, projections, fp16, buildId);
}
void fail(Session& s, const char* reason) {
    if (!s.failed) log(reason, eglGetError());
    s.failed = true;
}
bool extension(const char* list, const char* name) {
    if (!list) return false;
    const std::string haystack = std::string(" ") + list + " ";
    return haystack.find(std::string(" ") + name + " ") != std::string::npos;
}
// Separate shared GL context: never change Valve's FBO, program, sampler or VAO.
// Restore the exact context plus separate read/draw surfaces on every exit.
struct Current {
    EGLDisplay display = eglGetCurrentDisplay();
    EGLContext context = eglGetCurrentContext();
    EGLSurface draw = eglGetCurrentSurface(EGL_DRAW), read = eglGetCurrentSurface(EGL_READ);
    EGLenum api = eglQueryAPI();
    EGLDisplay temporary{EGL_NO_DISPLAY};
    bool enter(Session& s, EGLSurface target) {
        temporary = s.display;
        return eglBindAPI(EGL_OPENGL_ES_API) &&
            eglMakeCurrent(s.display, target, target, s.context);
    }
    ~Current() {
        if (context != EGL_NO_CONTEXT) {
            if (!eglMakeCurrent(display, draw, read, context)) log("restore_context_failed");
        } else if (temporary != EGL_NO_DISPLAY) {
            eglMakeCurrent(temporary, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
        }
        eglBindAPI(api);
    }
};
GLuint shader(GLenum type, const char* text) {
    GLuint result = glCreateShader(type);
    glShaderSource(result, 1, &text, nullptr); glCompileShader(result);
    GLint ok{}; glGetShaderiv(result, GL_COMPILE_STATUS, &ok);
    if (!ok) { glDeleteShader(result); return 0; }
    return result;
}
GLuint program(bool array) {
    constexpr char vertex[] = "#version 300 es\n"
        "out highp vec2 uv; void main(){vec2 p=vec2((gl_VertexID<<1)&2,gl_VertexID&2);"
        "uv=p;gl_Position=vec4(p*2.-1.,0.,1.);}";
    constexpr char fragment2d[] = "#version 300 es\nprecision highp float;"
        "uniform highp sampler2D video;in highp vec2 uv;out vec4 c;"
        "void main(){c=texture(video,uv);}";
    constexpr char fragmentArray[] = "#version 300 es\nprecision highp float;"
        "uniform highp sampler2DArray video;uniform int slice;"
        "in highp vec2 uv;out vec4 c;void main(){c=texture(video,vec3(uv,float(slice)));}";
    GLuint v = shader(GL_VERTEX_SHADER, vertex), f = shader(GL_FRAGMENT_SHADER,
        array ? fragmentArray : fragment2d);
    if (!v || !f) { if (v) glDeleteShader(v); if (f) glDeleteShader(f); return 0; }
    GLuint result = glCreateProgram(); glAttachShader(result,v); glAttachShader(result,f);
    glLinkProgram(result); glDeleteShader(v); glDeleteShader(f);
    GLint ok{}; glGetProgramiv(result, GL_LINK_STATUS, &ok);
    if (!ok) { glDeleteProgram(result); return 0; }
    return result;
}
bool initializeGl(Session& s) {
    if (s.context != EGL_NO_CONTEXT) return true;
    const char* exts = eglQueryString(s.display, EGL_EXTENSIONS);
    if (!extension(exts, "EGL_KHR_gl_colorspace") ||
        (fp16 && (!extension(exts, "EGL_EXT_pixel_format_float") ||
                  !extension(exts, "EGL_EXT_gl_colorspace_scrgb_linear")))) return false;
    std::vector<EGLint> attributes = {
        EGL_SURFACE_TYPE, EGL_WINDOW_BIT | EGL_PBUFFER_BIT,
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT_KHR,
        EGL_RED_SIZE, fp16 ? 16 : 8, EGL_GREEN_SIZE, fp16 ? 16 : 8,
        EGL_BLUE_SIZE, fp16 ? 16 : 8, EGL_ALPHA_SIZE, fp16 ? 16 : 8,
        EGL_DEPTH_SIZE, 0, EGL_STENCIL_SIZE, 0, EGL_SAMPLES, 0,
    };
    if (fp16) { attributes.push_back(EGL_COLOR_COMPONENT_TYPE_EXT);
                attributes.push_back(EGL_COLOR_COMPONENT_TYPE_FLOAT_EXT); }
    attributes.push_back(EGL_NONE);
    EGLint count{};
    if (!eglChooseConfig(s.display, attributes.data(), &s.config, 1, &count) || count != 1) return false;
    for (EGLint field : {EGL_RED_SIZE, EGL_GREEN_SIZE, EGL_BLUE_SIZE, EGL_ALPHA_SIZE}) {
        EGLint size{}; if (!eglGetConfigAttrib(s.display, s.config, field, &size) ||
                          size != (fp16 ? 16 : 8)) return false;
    }
    Current old;
    if (!eglBindAPI(EGL_OPENGL_ES_API)) return false;
    const EGLint contextAttrs[] = {EGL_CONTEXT_CLIENT_VERSION, 3, EGL_NONE};
    s.context = eglCreateContext(s.display, s.config, s.appContext, contextAttrs);
    if (s.context == EGL_NO_CONTEXT) return false;
    const EGLint pbAttrs[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};
    s.pbuffer = eglCreatePbufferSurface(s.display, s.config, pbAttrs);
    if (s.pbuffer == EGL_NO_SURFACE || !old.enter(s, s.pbuffer)) return false;
    s.program2d = program(false); s.programArray = program(true);
    glGenVertexArrays(1,&s.vao); glGenSamplers(1,&s.sampler);
    glSamplerParameteri(s.sampler,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
    glSamplerParameteri(s.sampler,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glSamplerParameteri(s.sampler,GL_TEXTURE_WRAP_S,GL_CLAMP_TO_EDGE);
    glSamplerParameteri(s.sampler,GL_TEXTURE_WRAP_T,GL_CLAMP_TO_EDGE);
    return s.program2d && s.programArray && glGetError() == GL_NO_ERROR;
}
struct Jni {
    JNIEnv* env{}; bool attached{};
    Jni() {
        if (!vm) return;
        jint result = vm->GetEnv(reinterpret_cast<void**>(&env), JNI_VERSION_1_6);
        if (result == JNI_EDETACHED) {
            attached = vm->AttachCurrentThread(&env,nullptr) == JNI_OK;
            if (!attached) env = nullptr;
        } else if (result != JNI_OK) env = nullptr;
    }
    ~Jni() { if (attached) vm->DetachCurrentThread(); }
};
void cleanupTrigger(Session& s);

bool queueTriggerBuffer(Session& s) {
    if (s.triggerReady) return true;
    if (!s.triggerWindow) {
        Jni jni; if (!jni.env) return false;
        XrSwapchainCreateInfo info{XR_TYPE_SWAPCHAIN_CREATE_INFO};
        info.usageFlags = XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
        info.width = triggerWidth;
        info.height = triggerHeight;
        jobject surface{};
        XrResult result = g.createSurface(s.xr, &info, &s.triggerSwapchain, &surface);
        if (XR_FAILED(result) || !surface) {
            log("trigger_surface_failed", result);
            cleanupTrigger(s);
            return false;
        }
        s.triggerWindow = ANativeWindow_fromSurface(jni.env, surface);
        jni.env->DeleteLocalRef(surface);
        if (!s.triggerWindow) {
            cleanupTrigger(s);
            return false;
        }
        if (ANativeWindow_setBuffersGeometry(s.triggerWindow, triggerWidth,
                triggerHeight, WINDOW_FORMAT_RGBA_8888) != 0) {
            cleanupTrigger(s);
            return false;
        }
        ANativeWindow_Buffer buffer{};
        if (ANativeWindow_lock(s.triggerWindow, &buffer, nullptr) != 0 ||
            !buffer.bits || buffer.stride < static_cast<int32_t>(triggerWidth)) {
            cleanupTrigger(s);
            return false;
        }
        for (uint32_t y = 0; y < triggerHeight; ++y) {
            auto* row = static_cast<uint8_t*>(buffer.bits) +
                static_cast<size_t>(y) * static_cast<size_t>(buffer.stride) * 4;
            for (uint32_t x = 0; x < triggerWidth; ++x) {
                row[x * 4 + 0] = 0;
                row[x * 4 + 1] = 0;
                row[x * 4 + 2] = 0;
                row[x * 4 + 3] = 0;
            }
        }
        if (ANativeWindow_unlockAndPost(s.triggerWindow) != 0) {
            cleanupTrigger(s);
            return false;
        }
    }
    if (!s.viewSpace) {
        XrReferenceSpaceCreateInfo info{XR_TYPE_REFERENCE_SPACE_CREATE_INFO};
        info.referenceSpaceType = XR_REFERENCE_SPACE_TYPE_VIEW;
        info.poseInReferenceSpace.orientation.w = 1.0f;
        if (XR_FAILED(g.createReferenceSpace(s.xr, &info, &s.viewSpace))) {
            cleanupTrigger(s);
            return false;
        }
    }
    s.triggerQuad.type = XR_TYPE_COMPOSITION_LAYER_QUAD;
    s.triggerQuad.layerFlags = XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT;
    s.triggerQuad.space = s.viewSpace;
    s.triggerQuad.eyeVisibility = XR_EYE_VISIBILITY_BOTH;
    s.triggerQuad.subImage.swapchain = s.triggerSwapchain;
    s.triggerQuad.subImage.imageRect = {
        {0, 0},
        {static_cast<int32_t>(triggerWidth), static_cast<int32_t>(triggerHeight)},
    };
    s.triggerQuad.subImage.imageArrayIndex = 0;
    s.triggerQuad.pose.orientation.w = 1.0f;
    s.triggerQuad.pose.position.z = -1.0f;
    s.triggerQuad.size = {0.001f, 0.001f};
    s.triggerReady = true;
    log("trigger_ready", 1);
    return true;
}

void cleanupTrigger(Session& s) {
    if (s.triggerWindow) ANativeWindow_release(s.triggerWindow);
    s.triggerWindow = nullptr;
    if (s.triggerSwapchain) g.destroy(s.triggerSwapchain);
    s.triggerSwapchain = XR_NULL_HANDLE;
    if (s.viewSpace && g.destroySpace) g.destroySpace(s.viewSpace);
    s.viewSpace = XR_NULL_HANDLE;
    s.triggerReady = false;
}

bool createSurfaces(Session& s, Swapchain& source) {
    if (!source.surfaces.empty()) return true;
    Jni jni; if (!jni.env) return false;
    source.surfaces.resize(source.info.arraySize);
    for (auto& target : source.surfaces) {
        XrSwapchainCreateInfo info{XR_TYPE_SWAPCHAIN_CREATE_INFO};
        info.usageFlags = XR_SWAPCHAIN_USAGE_SAMPLED_BIT;
        info.width = source.info.width; info.height = source.info.height;
        // Android Surface contract: format/sampleCount/faceCount/arraySize/mipCount = 0.
        jobject surface{};
        XrResult result = g.createSurface(s.xr, &info, &target.xr, &surface);
        if (XR_FAILED(result) || !surface) { log("create_surface_failed",result); return false; }
        target.window = ANativeWindow_fromSurface(jni.env, surface);
        jni.env->DeleteLocalRef(surface);
        if (!target.window) return false;
        int format = fp16 ? AHARDWAREBUFFER_FORMAT_R16G16B16A16_FLOAT : AHARDWAREBUFFER_FORMAT_R8G8B8A8_UNORM;
        if (ANativeWindow_setBuffersGeometry(target.window,info.width,info.height,format) != 0 ||
            ANativeWindow_setBuffersDataSpace(target.window,
                fp16 ? ADATASPACE_SCRGB_LINEAR : ADATASPACE_SRGB) != 0) return false;
        const EGLint attrs[] = { EGL_GL_COLORSPACE_KHR,
            fp16 ? EGL_GL_COLORSPACE_SCRGB_LINEAR_EXT : EGL_GL_COLORSPACE_SRGB_KHR, EGL_NONE };
        target.egl = eglCreateWindowSurface(s.display,s.config,target.window,attrs);
        if (target.egl == EGL_NO_SURFACE) return false;
        if (ANativeWindow_getFormat(target.window) != format ||
            ANativeWindow_getBuffersDataSpace(target.window) !=
                (fp16 ? ADATASPACE_SCRGB_LINEAR : ADATASPACE_SRGB)) return false;
        log("surface_created",ANativeWindow_getFormat(target.window));
    }
    return true;
}
bool transfer(Session& s, Swapchain& source, uint32_t imageIndex) {
    if (eglGetCurrentDisplay() != s.display || eglGetCurrentContext() != s.appContext ||
        imageIndex >= source.images.size()) return false;
    // Source completion is explicitly synchronized across GL contexts. The helper
    // finishes its read before forwarding xrReleaseSwapchainImage to the runtime.
    GLsync rendered = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE,0);
    if (!rendered) return false;
    glFlush();
    bool ok = false;
    {
        Current restore;
        if (initializeGl(s) && restore.enter(s,s.pbuffer)) {
            glWaitSync(rendered,0,GL_TIMEOUT_IGNORED);
            if (createSurfaces(s,source)) {
                ok = true;
                for (uint32_t slice=0; slice<source.surfaces.size(); ++slice) {
                    auto& target = source.surfaces[slice];
                    if (!eglMakeCurrent(s.display,target.egl,target.egl,s.context)) { ok=false; break; }
                    eglSwapInterval(s.display,0);
                    glBindFramebuffer(GL_FRAMEBUFFER,0);
                    glViewport(0,0,source.info.width,source.info.height);
                    glDisable(GL_BLEND); glDisable(GL_DEPTH_TEST); glDisable(GL_STENCIL_TEST);
                    glDisable(GL_SCISSOR_TEST); glDisable(GL_CULL_FACE);
                    glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
                    glBindVertexArray(s.vao); glActiveTexture(GL_TEXTURE0);
                    const bool array = source.info.arraySize > 1;
                    GLuint p = array ? s.programArray : s.program2d;
                    glUseProgram(p); glUniform1i(glGetUniformLocation(p,"video"),0);
                    if (array) glUniform1i(glGetUniformLocation(p,"slice"),slice);
                    glBindTexture(array ? GL_TEXTURE_2D_ARRAY : GL_TEXTURE_2D, source.images[imageIndex].image);
                    glBindSampler(0,s.sampler);
                    // Sampling sRGB textures decodes to linear; FP16 surfaces store
                    // linear scRGB. sRGB EGL surfaces encode on write. Alpha untouched.
                    glDrawArrays(GL_TRIANGLES,0,3);
                    glFinish();
                    if (glGetError() != GL_NO_ERROR || !eglSwapBuffers(s.display,target.egl)) { ok=false; break; }
                }
            }
        }
        // Even failed transfers must finish source reads before release.
        if (eglGetCurrentContext() == s.context && s.context != EGL_NO_CONTEXT) glFinish();
    }
    glDeleteSync(rendered);
    if (ok && ++s.copies <= 3) log("video_buffer_queued",int(s.copies));
    return ok;
}
void cleanupSwap(Session& s, Swapchain& source) {
    source.ready = false;
    for (auto& target : source.surfaces) {
        if (target.egl != EGL_NO_SURFACE) eglDestroySurface(s.display,target.egl);
        if (target.window) ANativeWindow_release(target.window);
        if (target.xr) g.destroy(target.xr);
    }
    source.surfaces.clear();
}
void cleanupSession(Session& s) {
    for (auto& entry : chains) if (entry.second.session == s.xr) cleanupSwap(s,entry.second);
    cleanupTrigger(s);
    if (s.context != EGL_NO_CONTEXT) {
        {
            Current old;
            if (s.pbuffer != EGL_NO_SURFACE && old.enter(s,s.pbuffer)) {
                glDeleteProgram(s.program2d); glDeleteProgram(s.programArray);
                glDeleteSamplers(1,&s.sampler); glDeleteVertexArrays(1,&s.vao);
                glFinish();
            }
        }
        if (s.pbuffer != EGL_NO_SURFACE) eglDestroySurface(s.display,s.pbuffer);
        eglDestroyContext(s.display,s.context);
    }
    s.context = EGL_NO_CONTEXT; s.pbuffer = EGL_NO_SURFACE;
}
XrResult XRAPI_PTR createSession(XrInstance instance,const XrSessionCreateInfo* info,XrSession* output) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    XrResult result = g.createSession(instance,info,output);
    if (XR_FAILED(result) || !output || !info) return result;
    Session s; s.xr=*output;
    for (auto* next=static_cast<const XrBaseInStructure*>(info->next); next; next=next->next) {
        if (next->type == XR_TYPE_GRAPHICS_BINDING_OPENGL_ES_ANDROID_KHR) {
            auto* binding=reinterpret_cast<const XrGraphicsBindingOpenGLESAndroidKHR*>(next);
            s.display=binding->display; s.appContext=binding->context; break;
        }
    }
    s.failed = !enabled || s.display == EGL_NO_DISPLAY || s.appContext == EGL_NO_CONTEXT;
    auto* stored = &sessions.emplace(*output,s).first->second;
    log(stored->failed?"session_passthrough":"session_ready");
    if (!stored->failed) queueTriggerBuffer(*stored);
    return result;
}
XrResult XRAPI_PTR createSwap(XrSession session,const XrSwapchainCreateInfo* info,XrSwapchain* output) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    XrResult result=g.create(session,info,output);
    if (XR_FAILED(result) || !info || !output) return result;
    Swapchain source; source.session=session; source.info=*info; source.info.next=nullptr;
    source.supported = !info->next && !info->createFlags &&
        (info->usageFlags & XR_SWAPCHAIN_USAGE_SAMPLED_BIT) &&
        (info->usageFlags & XR_SWAPCHAIN_USAGE_COLOR_ATTACHMENT_BIT) &&
        info->format==srgb8 &&
        gxr::video::dimensionsValid(info->width,info->height,info->arraySize,
                                   info->sampleCount,info->faceCount,info->mipCount);
    if (source.supported) {
        uint32_t count{};
        if (XR_SUCCEEDED(g.enumerate(*output,0,&count,nullptr)) && count && count<=32) {
            source.images.resize(count,{XR_TYPE_SWAPCHAIN_IMAGE_OPENGL_ES_KHR});
            source.supported = XR_SUCCEEDED(g.enumerate(*output,count,&count,
                reinterpret_cast<XrSwapchainImageBaseHeader*>(source.images.data())));
        } else source.supported=false;
    }
    if (!source.supported) log("swapchain_unsupported", static_cast<int>(info->format));
    chains.emplace(*output,std::move(source)); return result;
}
XrResult XRAPI_PTR acquire(XrSwapchain chain,const XrSwapchainImageAcquireInfo* info,uint32_t* index) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    XrResult result=g.acquire(chain,info,index);
    auto it=chains.find(chain);
    if (result==XR_SUCCESS && index && it!=chains.end()) it->second.queue.acquired(*index);
    return result;
}
XrResult XRAPI_PTR waitImage(XrSwapchain chain,const XrSwapchainImageWaitInfo* info) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    XrResult result=g.wait(chain,info); auto it=chains.find(chain);
    if (result==XR_SUCCESS && it!=chains.end()) it->second.queue.waited();
    return result;
}
XrResult XRAPI_PTR release(XrSwapchain chain,const XrSwapchainImageReleaseInfo* info) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    auto it=chains.find(chain); bool copied=false;
    if (it!=chains.end()) {
        auto& source=it->second; auto session=sessions.find(source.session);
        const auto* readable=source.queue.readable();
        if (session!=sessions.end() && source.interested && source.supported && readable &&
            session->second.visible && !session->second.failed) {
            copied=transfer(session->second,source,readable->index);
            if (!copied) fail(session->second,"transfer_failed_passthrough");
        }
    }
    // This is the ownership boundary: transfer() has completed before this call.
    XrResult result=g.release(chain,info);
    if (it!=chains.end()) {
        it->second.ready = result==XR_SUCCESS && copied;
        if (result==XR_SUCCESS) it->second.queue.released();
    }
    return result;
}
XrResult XRAPI_PTR endFrame(XrSession session,const XrFrameEndInfo* info) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    auto si=sessions.find(session);
    if (si==sessions.end() || si->second.failed || !si->second.visible || !info ||
        info->layerCount!=projections || !info->layers) return g.endFrame(session,info);
    if (!queueTriggerBuffer(si->second)) return g.endFrame(session,info);
    std::array<XrCompositionLayerProjection,projections> layers{};
    std::array<std::array<XrCompositionLayerProjectionView,2>,projections> views{};
    std::array<const XrCompositionLayerBaseHeader*,projections> projectionPointers{};
    auto lookup=[](XrSwapchain xr)->Swapchain* {
        auto it=chains.find(xr); return it==chains.end() ? nullptr : &it->second;
    };
    if (!gxr::video::prepareFrame(session,*info,lookup,layers,views,projectionPointers))
        return g.endFrame(session,info);
    std::array<const XrCompositionLayerBaseHeader*,projections+1> pointers{};
    for (uint32_t i=0;i<projections;++i) pointers[i]=projectionPointers[i];
    pointers[projections]=reinterpret_cast<const XrCompositionLayerBaseHeader*>(
        &si->second.triggerQuad);
    XrFrameEndInfo replacement=*info;
    replacement.layerCount=projections+1;
    replacement.layers=pointers.data();
    XrResult result=g.endFrame(session,&replacement);
    if (XR_FAILED(result)) {
        log("surface_frame_rejected",result); si->second.failed=true;
        // Never call xrEndFrame twice for one begun frame. Next frames pass through.
    } else if (++si->second.frames<=3) log("surface_video_frame",int(si->second.frames));
    return result;
}
XrResult XRAPI_PTR poll(XrInstance instance,XrEventDataBuffer* event) {
    XrResult result=g.poll(instance,event);
    if (result!=XR_SUCCESS || !event || event->type!=XR_TYPE_EVENT_DATA_SESSION_STATE_CHANGED) return result;
    std::lock_guard<std::recursive_mutex> lock(mutex);
    auto* state=reinterpret_cast<const XrEventDataSessionStateChanged*>(event);
    auto si=sessions.find(state->session);
    if (si!=sessions.end()) {
        si->second.visible=state->state==XR_SESSION_STATE_VISIBLE || state->state==XR_SESSION_STATE_FOCUSED;
        if (!si->second.visible) for (auto& item:chains)
            if (item.second.session==state->session) item.second.ready=false;
    }
    return result;
}
XrResult XRAPI_PTR endSession(XrSession session) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    auto it=sessions.find(session); if(it!=sessions.end()) it->second.visible=false;
    for (auto& item:chains) if (item.second.session==session) item.second.ready=false;
    return g.endSession(session);
}
XrResult XRAPI_PTR destroySwap(XrSwapchain chain) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    auto it=chains.find(chain);
    if(it!=chains.end()) {
        auto si=sessions.find(it->second.session); if(si!=sessions.end()) cleanupSwap(si->second,it->second);
        chains.erase(it);
    }
    return g.destroy(chain);
}
XrResult XRAPI_PTR destroySession(XrSession session) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    auto it=sessions.find(session); if(it!=sessions.end()) {cleanupSession(it->second);sessions.erase(it);}
    for(auto itc=chains.begin();itc!=chains.end();) {
        if(itc->second.session==session) itc=chains.erase(itc); else ++itc;
    }
    return g.destroySession(session);
}
XrResult XRAPI_PTR destroyInstance(XrInstance instance) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    for(auto& s:sessions) cleanupSession(s.second);
    sessions.clear();chains.clear();
    XrResult result=g.destroyInstance(instance);g={};vm=nullptr;enabled=false;return result;
}
XrResult XRAPI_PTR get(XrInstance instance,const char* name,PFN_xrVoidFunction* out) {
    if(!name || !out) return XR_ERROR_VALIDATION_FAILURE;
#define ROUTE(n,f) if(!std::strcmp(name,n)) { *out=reinterpret_cast<PFN_xrVoidFunction>(f);return XR_SUCCESS; }
    ROUTE("xrGetInstanceProcAddr",get)
    ROUTE("xrCreateSession",createSession) ROUTE("xrDestroySession",destroySession)
    ROUTE("xrEndSession",endSession) ROUTE("xrDestroyInstance",destroyInstance)
    ROUTE("xrCreateSwapchain",createSwap) ROUTE("xrDestroySwapchain",destroySwap)
    ROUTE("xrAcquireSwapchainImage",acquire) ROUTE("xrWaitSwapchainImage",waitImage)
    ROUTE("xrReleaseSwapchainImage",release) ROUTE("xrEndFrame",endFrame) ROUTE("xrPollEvent",poll)
#undef ROUTE
    return g.get?g.get(instance,name,out):XR_ERROR_FUNCTION_UNSUPPORTED;
}
template<class T> bool load(const char* name,T& fn) {
    PFN_xrVoidFunction address{};
    XrResult result=g.get(g.instance,name,&address);fn=reinterpret_cast<T>(address);
    return XR_SUCCEEDED(result) && fn;
}
XrResult XRAPI_PTR createInstance(const XrInstanceCreateInfo* info,const XrApiLayerCreateInfo* layer,XrInstance* out) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    if(!info || !layer || !layer->nextInfo || !out || g.instance) return XR_ERROR_INITIALIZATION_FAILED;
    for(auto* next=static_cast<const XrBaseInStructure*>(info->next);next;next=next->next)
        if(next->type==XR_TYPE_INSTANCE_CREATE_INFO_ANDROID_KHR)
            vm=static_cast<JavaVM*>(reinterpret_cast<const XrInstanceCreateInfoAndroidKHR*>(next)->applicationVM);
    std::vector<const char*> extensions;
    bool present=false;
    for(uint32_t i=0;i<info->enabledExtensionCount;++i) {
        extensions.push_back(info->enabledExtensionNames[i]);
        present |= !std::strcmp(extensions.back(),XR_KHR_ANDROID_SURFACE_SWAPCHAIN_EXTENSION_NAME);
    }
    if(!present) extensions.push_back(XR_KHR_ANDROID_SURFACE_SWAPCHAIN_EXTENSION_NAME);
    auto changed=*info;changed.enabledExtensionCount=extensions.size();changed.enabledExtensionNames=extensions.data();
    auto next=*layer;next.nextInfo=layer->nextInfo->next;
    XrResult result=layer->nextInfo->nextCreateApiLayerInstance(&changed,&next,out);
    enabled=XR_SUCCEEDED(result);
    if(XR_FAILED(result) && !present) {
        result=layer->nextInfo->nextCreateApiLayerInstance(info,&next,out);enabled=false;
    }
    if(XR_FAILED(result)) {vm=nullptr;return result;}
    g.instance=*out;g.get=layer->nextInfo->nextGetInstanceProcAddr;
    bool ok=true;
#define LOAD(name,field) ok=load(name,g.field) && ok
    LOAD("xrDestroyInstance",destroyInstance);LOAD("xrCreateSession",createSession);
    LOAD("xrDestroySession",destroySession);LOAD("xrEndSession",endSession);
    LOAD("xrCreateReferenceSpace",createReferenceSpace);LOAD("xrDestroySpace",destroySpace);
    LOAD("xrCreateSwapchain",create);LOAD("xrDestroySwapchain",destroy);
    LOAD("xrEnumerateSwapchainImages",enumerate);LOAD("xrAcquireSwapchainImage",acquire);
    LOAD("xrWaitSwapchainImage",wait);LOAD("xrReleaseSwapchainImage",release);
    LOAD("xrEndFrame",endFrame);LOAD("xrPollEvent",poll);
#undef LOAD
    if(enabled) enabled=load("xrCreateSwapchainAndroidSurfaceKHR",g.createSurface);
    if(!ok) {if(g.destroyInstance)g.destroyInstance(*out);g={};vm=nullptr;enabled=false;
        *out=XR_NULL_HANDLE;return XR_ERROR_INITIALIZATION_FAILED;}
    log("layer_initialized",enabled);return XR_SUCCESS;
}
} // namespace
EXPORT XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(const XrNegotiateLoaderInfo* loader,
    const char* name,XrNegotiateApiLayerRequest* request) {
    if(!loader || !name || !request || std::strcmp(name,layerName) ||
        loader->maxInterfaceVersion<XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loader->maxApiVersion<XR_MAKE_VERSION(1,0,0)) return XR_ERROR_INITIALIZATION_FAILED;
    request->layerInterfaceVersion=XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion=XR_MAKE_VERSION(1,0,0);
    request->getInstanceProcAddr=get;request->createApiLayerInstance=createInstance;return XR_SUCCESS;
}

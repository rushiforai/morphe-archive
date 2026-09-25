#include <GLES3/gl3.h>
#include <GLES2/gl2ext.h>
#include <EGL/egl.h>
#include <android/log.h>
#include <sys/system_properties.h>
#include <dlfcn.h>
#include <algorithm>
#include <cstring>
#include <cstdlib>
#include <map>
#include <memory>
#include <mutex>
#include <set>
#include <vector>
#include "shader_rewrite.h"
#include "blue_noise_tile.h"

#define EXPORT extern "C" __attribute__((visibility("default")))
#define GL_API_LIST(X) \
 X(glShaderSource) X(glCompileShader) X(glGetShaderiv) X(glLinkProgram) X(glGetProgramiv) \
 X(glGetAttachedShaders) X(glDeleteShader) X(glDeleteProgram) X(glDrawArrays) X(glGetIntegerv) \
 X(glGetUniformLocation) X(glGetActiveUniform) X(glGetUniformiv) X(glUniform1i) X(glUseProgram) \
 X(glGenTextures) X(glDeleteTextures) X(glBindTexture) X(glActiveTexture) X(glTexImage2D) \
 X(glTexParameteri) X(glTexStorage2D) X(glTexSubImage2D) X(glPixelStorei) X(glBindBuffer) X(glBindSampler) X(glIsTexture) \
 X(glGetTexParameteriv) X(glGetFramebufferAttachmentParameteriv) X(glIsEnabled) \
 X(glEnable) X(glDisable) X(glGetStringi) X(glIsShader)
#define EGL_API_LIST(X) X(eglCreateContext) X(eglDestroyContext) X(eglMakeCurrent) X(eglTerminate) X(eglGetCurrentContext) X(eglGetCurrentDisplay)

namespace {
// Explicit system handles are essential: scene exports its own GLES dispatch stubs.
// Calling an interposed glCompileShader would recurse through the renamed lookup.
struct Api {
#define FIELD(name) decltype(&name) name{};
    GL_API_LIST(FIELD) EGL_API_LIST(FIELD)
#undef FIELD
    Api() {
        void* gl = dlopen("libGLESv3.so", RTLD_NOW | RTLD_LOCAL);
        void* egl = dlopen("libEGL.so", RTLD_NOW | RTLD_LOCAL);
#define LOAD_GL(name) name = reinterpret_cast<decltype(name)>(dlsym(gl, #name));
#define LOAD_EGL(name) name = reinterpret_cast<decltype(name)>(dlsym(egl, #name));
        GL_API_LIST(LOAD_GL) EGL_API_LIST(LOAD_EGL)
#undef LOAD_GL
#undef LOAD_EGL
    }
};
Api& api() { static Api value; return value; }
void note(const char* text) { __android_log_write(ANDROID_LOG_INFO, "SLBlueNoise", text); }
struct Shader {
    std::string original;
    bool modified = false;
    sl_blue_noise::Layer layer = sl_blue_noise::Layer::None;
};
struct Program {
    sl_blue_noise::Layer layer = sl_blue_noise::Layer::None;
    bool warned = false;
};
struct Group {
    std::map<GLuint, Shader> shaders;
    std::map<GLuint, Program> programs;
    std::set<std::string> unknown;
    GLuint texture = 0;
};
struct Context {
    std::shared_ptr<Group> group;
    bool pendingDestroy = false;
    unsigned current = 0;
};
using ContextKey = std::pair<EGLDisplay,EGLContext>;
std::mutex mutex;
std::map<ContextKey,Context> contexts;
thread_local ContextKey current{EGL_NO_DISPLAY,EGL_NO_CONTEXT};
Group* group() {
    auto& a = api();
    ContextKey key{a.eglGetCurrentDisplay(), a.eglGetCurrentContext()};
    auto found = contexts.find(key);
    // Only scene-created contexts are eligible; unrelated/unknown contexts pass through.
    return found == contexts.end() ? nullptr : found->second.group.get();
}
bool disabled() {
    char value[PROP_VALUE_MAX]{};
    __system_property_get("debug.steamlink.blue_noise", value);
    return std::strcmp(value,"0") == 0;
}
void original(GLuint id, Shader& shader) {
    auto& a = api();
    const char* text = shader.original.c_str();
    GLint length = static_cast<GLint>(shader.original.size());
    a.glShaderSource(id, 1, &text, &length);
    a.glCompileShader(id);
    shader.modified = false;
    shader.layer = sl_blue_noise::Layer::None;
}
void reap(Group& g) {
    for (auto it = g.shaders.begin(); it != g.shaders.end();)
        if (!api().glIsShader(it->first)) it = g.shaders.erase(it); else ++it;
}
bool extension(const char* name) {
    GLint count = 0; api().glGetIntegerv(GL_NUM_EXTENSIONS, &count);
    for (GLint i = 0; i < count; ++i) {
        const auto* value = api().glGetStringi(GL_EXTENSIONS, static_cast<GLuint>(i));
        if (value && std::strcmp(reinterpret_cast<const char*>(value),name) == 0) return true;
    }
    return false;
}
struct TextureState {
    GLint active{}, texture{}, sampler{};
    explicit TextureState(GLint unit) {
        auto& a = api(); a.glGetIntegerv(GL_ACTIVE_TEXTURE,&active);
        a.glActiveTexture(GL_TEXTURE0+unit);
        a.glGetIntegerv(GL_TEXTURE_BINDING_2D,&texture);
        a.glGetIntegerv(GL_SAMPLER_BINDING,&sampler);
        a.glBindSampler(unit,0);
    }
    ~TextureState() {
        auto& a = api(); GLint unit{}; a.glGetIntegerv(GL_ACTIVE_TEXTURE,&unit);
        a.glBindTexture(GL_TEXTURE_2D,texture); a.glBindSampler(unit-GL_TEXTURE0,sampler);
        a.glActiveTexture(active);
    }
};
bool texture(Group& g) {
    auto& a = api();
    if (g.texture && a.glIsTexture(g.texture)) return true;
    TextureState state(1);
    GLint unpack[5]{}, buffer{};
    const GLenum fields[]{GL_UNPACK_ALIGNMENT,GL_UNPACK_ROW_LENGTH,GL_UNPACK_SKIP_ROWS,GL_UNPACK_SKIP_PIXELS,GL_UNPACK_IMAGE_HEIGHT};
    for (int i=0; i<5; ++i) { a.glGetIntegerv(fields[i],&unpack[i]); a.glPixelStorei(fields[i],i==0?1:0); }
    a.glGetIntegerv(GL_PIXEL_UNPACK_BUFFER_BINDING,&buffer); a.glBindBuffer(GL_PIXEL_UNPACK_BUFFER,0);
    a.glGenTextures(1,&g.texture); a.glBindTexture(GL_TEXTURE_2D,g.texture);
    a.glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
    a.glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    a.glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_REPEAT);
    a.glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_REPEAT);
    a.glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_BASE_LEVEL,0);
    a.glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAX_LEVEL,0);
    a.glTexStorage2D(GL_TEXTURE_2D,1,GL_R8,128,128);
    GLint immutable = 0; a.glGetTexParameteriv(GL_TEXTURE_2D,GL_TEXTURE_IMMUTABLE_FORMAT,&immutable);
    if (immutable) a.glTexSubImage2D(GL_TEXTURE_2D,0,0,0,128,128,GL_RED,GL_UNSIGNED_BYTE,sl_blue_noise::kTile);
    a.glBindBuffer(GL_PIXEL_UNPACK_BUFFER,buffer);
    for (int i=0; i<5; ++i) a.glPixelStorei(fields[i],unpack[i]);
    if (immutable && g.texture != 0) return true;
    a.glDeleteTextures(1,&g.texture); g.texture=0; return false;
}
bool uniformContract(GLuint program) {
    auto& a = api();
    if (a.glGetUniformLocation(program,"SL_blueNoise") != 14 || a.glGetUniformLocation(program,"SL_enabled") != 15) return false;
    GLint count{}; a.glGetProgramiv(program,GL_ACTIVE_UNIFORMS,&count);
    unsigned samplers = 0;
    for (GLint i=0; i<count; ++i) {
        char name[128]{}; GLsizei length{}; GLint size{}; GLenum type{};
        a.glGetActiveUniform(program,i,sizeof(name),&length,&size,&type,name);
        if (type == GL_SAMPLER_2D || type == GL_SAMPLER_EXTERNAL_OES) {
            if (size != 1 || (std::strcmp(name,"tex0") != 0 && std::strcmp(name,"SL_blueNoise") != 0)) return false;
            ++samplers;
        } else if (type != GL_FLOAT && type != GL_FLOAT_VEC2 && type != GL_FLOAT_VEC3 &&
                   type != GL_FLOAT_VEC4 && type != GL_FLOAT_MAT3 && type != GL_FLOAT_MAT4 &&
                   type != GL_INT && type != GL_BOOL) {
            // In particular reject every additional sampler type, including vertex samplers.
            return false;
        }
        if (std::strcmp(name,"SL_blueNoise") != 0 && std::strcmp(name,"SL_enabled") != 0) {
            const GLint location=a.glGetUniformLocation(program,name);
            if (location < 0 || size < 1 || location+size-1 > 13) return false;
        }
    }
    return samplers == 2;
}
bool layerCaller(void* caller, sl_blue_noise::Layer layer) {
    const char* configuredReturn = nullptr;
    if (layer == sl_blue_noise::Layer::Fovea) configuredReturn = sl_blue_noise::fovea_draw_return;
    else if (layer == sl_blue_noise::Layer::Background) configuredReturn = sl_blue_noise::background_draw_return;
    else return false;
    Dl_info info{};
    if (!dladdr(caller,&info) || !info.dli_fname || !info.dli_fbase) return false;
    const char* name=std::strrchr(info.dli_fname,'/'); name=name?name+1:info.dli_fname;
    char* end=nullptr;
    const auto expected=std::strtoull(configuredReturn,&end,16);
    return end==configuredReturn+16 && expected!=0 &&
        std::strcmp(name,"libvrlink_scene.so")==0 &&
        reinterpret_cast<uintptr_t>(caller)-reinterpret_cast<uintptr_t>(info.dli_fbase)==expected;
}
bool targetFramebuffer() {
    auto& a=api(); GLint fbo{}; a.glGetIntegerv(GL_DRAW_FRAMEBUFFER_BINDING,&fbo);
    if (!fbo || a.glIsEnabled(GL_FRAMEBUFFER_SRGB_EXT)) return false;
    GLint encoding{}, red{}, green{}, blue{}, alpha{};
    auto get=[&](GLenum field,GLint& value) { a.glGetFramebufferAttachmentParameteriv(GL_DRAW_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,field,&value); };
    get(GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING,encoding);
    get(GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE,red); get(GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE,green);
    get(GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE,blue); get(GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE,alpha);
    if (a.glIsEnabled(GL_BLEND)) {
        GLint src{},dst{},equation{};
        a.glGetIntegerv(GL_BLEND_SRC_RGB,&src); a.glGetIntegerv(GL_BLEND_DST_RGB,&dst); a.glGetIntegerv(GL_BLEND_EQUATION_RGB,&equation);
        if (src != GL_ONE || dst != GL_ZERO || equation != GL_FUNC_ADD) return false;
    }
    return encoding == GL_SRGB && red==8 && green==8 && blue==8 && alpha==8;
}
}

EXPORT void gxShaderSource(GLuint shader, GLsizei count, const GLchar* const* strings, const GLint* lengths) {
    auto& a=api(); std::lock_guard<std::mutex> lock(mutex); Group* g=group();
    if (!g || count<1 || !strings) { a.glShaderSource(shader,count,strings,lengths); return; }
    reap(*g); g->shaders.erase(shader);
    GLint type=0; a.glGetShaderiv(shader,GL_SHADER_TYPE,&type);
    if (type != GL_FRAGMENT_SHADER || disabled()) { a.glShaderSource(shader,count,strings,lengths); return; }
    std::string source;
    for (GLsizei i=0; i<count; ++i) {
        if (!strings[i]) { a.glShaderSource(shader,count,strings,lengths); return; }
        size_t n=lengths && lengths[i]>=0 ? size_t(lengths[i]) : std::strlen(strings[i]);
        if (n>1024*1024 || source.size()+n>1024*1024) { a.glShaderSource(shader,count,strings,lengths); return; }
        source.append(strings[i],n);
    }
    std::string rewritten;
    const auto layer=sl_blue_noise::rewrite(source,rewritten);
    if (layer == sl_blue_noise::Layer::None || !extension("GL_EXT_sRGB_write_control")) {
        if (source.find("samplerExternalOES") != std::string::npos && g->unknown.size()<32 && g->unknown.insert(sl_blue_noise::sha256(source)).second)
            note("Video source left unchanged (unselected/unknown source or missing sRGB write control).");
        a.glShaderSource(shader,count,strings,lengths); return;
    }
    const char* data=rewritten.c_str(); GLint size=static_cast<GLint>(rewritten.size());
    a.glShaderSource(shader,1,&data,&size);
    g->shaders.emplace(shader,Shader{std::move(source),true,layer});
    note(layer == sl_blue_noise::Layer::Fovea
        ? "Recognized foveal shader: static blue-noise sRGB8 quantization prepared."
        : "Recognized background shader: static blue-noise sRGB8 quantization prepared.");
}
EXPORT void gxCompileShader(GLuint shader) {
    auto& a=api(); std::lock_guard<std::mutex> lock(mutex); a.glCompileShader(shader);
    Group* g=group(); if (!g) return;
    auto it=g->shaders.find(shader); if (it==g->shaders.end() || !it->second.modified) return;
    GLint ok{}; a.glGetShaderiv(shader,GL_COMPILE_STATUS,&ok);
    if (!ok) { original(shader,it->second); note("Dither compile failed: restored original shader."); }
}
EXPORT void gxLinkProgram(GLuint program) {
    auto& a=api(); std::lock_guard<std::mutex> lock(mutex); Group* g=group();
    if (!g) { a.glLinkProgram(program); return; }
    g->programs.erase(program);
    GLint count{}; a.glGetProgramiv(program,GL_ATTACHED_SHADERS,&count);
    std::vector<GLuint> shaders(std::max(0,count)); GLsizei actual{};
    if (count) a.glGetAttachedShaders(program,count,&actual,shaders.data());
    bool modified=false, mixedLayers=false;
    auto layer=sl_blue_noise::Layer::None;
    for (GLsizei i=0; i<actual; ++i) {
        auto it=g->shaders.find(shaders[i]);
        if (it!=g->shaders.end() && it->second.modified) {
            modified=true;
            if (layer != sl_blue_noise::Layer::None && layer != it->second.layer) mixedLayers=true;
            layer=it->second.layer;
        }
    }
    a.glLinkProgram(program); if (!modified) return;
    GLint ok{}; a.glGetProgramiv(program,GL_LINK_STATUS,&ok);
    if (ok && !mixedLayers && layer != sl_blue_noise::Layer::None && uniformContract(program) && texture(*g)) {
        GLint previous{}; a.glGetIntegerv(GL_CURRENT_PROGRAM,&previous);
        a.glUseProgram(program); a.glUniform1i(14,1); a.glUniform1i(15,0); a.glUseProgram(previous);
        g->programs.emplace(program,Program{layer,false});
        note(layer == sl_blue_noise::Layer::Fovea
            ? "Foveal blue-noise program linked; guarded per-draw enable active."
            : "Background blue-noise program linked; guarded per-draw enable active."); return;
    }
    for (GLsizei i=0; i<actual; ++i) {
        auto it=g->shaders.find(shaders[i]); if (it!=g->shaders.end() && it->second.modified) original(shaders[i],it->second);
    }
    a.glLinkProgram(program); note("Dither link/resource contract failed: restored original program.");
}
EXPORT void gxDeleteShader(GLuint shader) {
    std::lock_guard<std::mutex> lock(mutex); api().glDeleteShader(shader);
    if (Group* g=group()) reap(*g); // A deleted-but-attached shader remains valid through linking.
}
EXPORT void gxDeleteProgram(GLuint program) {
    std::lock_guard<std::mutex> lock(mutex); api().glDeleteProgram(program);
    if (Group* g=group()) { g->programs.erase(program); reap(*g); }
}
EXPORT void gxDrawArrays(GLenum mode, GLint first, GLsizei count) {
    void* caller=__builtin_return_address(0);
    auto& a=api(); std::lock_guard<std::mutex> lock(mutex); Group* g=group();
    GLint id{}; a.glGetIntegerv(GL_CURRENT_PROGRAM,&id);
    auto it=g ? g->programs.find(id) : std::map<GLuint,Program>::iterator{};
    if (!g || it==g->programs.end()) { a.glDrawArrays(mode,first,count); return; }
    GLint units{}, videoUnit{}; a.glGetIntegerv(GL_MAX_TEXTURE_IMAGE_UNITS,&units);
    a.glGetUniformiv(id,a.glGetUniformLocation(id,"tex0"),&videoUnit);
    GLint unit=units-1; if (unit==videoUnit) --unit;
    if (unit>=0) a.glUniform1i(14,unit);
    if (unit<0 || !layerCaller(caller,it->second.layer) || !targetFramebuffer() || !g->texture || !a.glIsTexture(g->texture)) {
        a.glUniform1i(15,0); a.glDrawArrays(mode,first,count);
        if (!it->second.warned) { note("Video draw left undithered: layer/framebuffer/resource precondition failed."); it->second.warned=true; }
        return;
    }
    TextureState state(unit); a.glBindTexture(GL_TEXTURE_2D,g->texture);
    a.glUniform1i(14,unit); a.glUniform1i(15,1);
    const GLboolean fixedDither=a.glIsEnabled(GL_DITHER); a.glDisable(GL_DITHER);
    a.glDrawArrays(mode,first,count);
    if (fixedDither) a.glEnable(GL_DITHER);
    a.glUniform1i(15,0);
}
EXPORT EGLContext gxdCreateContext(EGLDisplay display,EGLConfig config,EGLContext share,const EGLint* attributes) {
    auto& a=api(); EGLContext ctx=a.eglCreateContext(display,config,share,attributes);
    if (ctx!=EGL_NO_CONTEXT) {
        std::lock_guard<std::mutex> lock(mutex);
        auto it=contexts.find({display,share});
        auto shared=it==contexts.end() ? std::make_shared<Group>() : it->second.group;
        contexts[{display,ctx}]=Context{std::move(shared),false,0};
    }
    return ctx;
}
EXPORT EGLBoolean gxdMakeCurrent(EGLDisplay display,EGLSurface draw,EGLSurface read,EGLContext ctx) {
    auto& a=api(); EGLBoolean ok=a.eglMakeCurrent(display,draw,read,ctx);
    if (ok) {
        std::lock_guard<std::mutex> lock(mutex);
        auto it=contexts.find(current);
        if (it!=contexts.end()) { if (it->second.current) --it->second.current; if (it->second.pendingDestroy && !it->second.current) contexts.erase(it); }
        current={display,ctx}; it=contexts.find(current); if (it!=contexts.end()) ++it->second.current;
    }
    return ok;
}
EXPORT EGLBoolean gxdDestroyContext(EGLDisplay display,EGLContext ctx) {
    auto& a=api(); EGLBoolean ok=a.eglDestroyContext(display,ctx);
    if (ok) { std::lock_guard<std::mutex> lock(mutex); auto it=contexts.find({display,ctx});
        if (it!=contexts.end()) { if (it->second.current) it->second.pendingDestroy=true; else contexts.erase(it); } }
    return ok;
}
EXPORT EGLBoolean gxdTerminate(EGLDisplay display) {
    auto& a=api(); EGLBoolean ok=a.eglTerminate(display);
    if (ok) { std::lock_guard<std::mutex> lock(mutex);
        for (auto it=contexts.begin(); it!=contexts.end();) {
            if (it->first.first==display) { if (it->second.current) { it->second.pendingDestroy=true; ++it; } else it=contexts.erase(it); } else ++it;
        }
    }
    return ok;
}

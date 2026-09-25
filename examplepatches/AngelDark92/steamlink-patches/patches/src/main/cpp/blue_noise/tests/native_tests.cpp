// Executes the production shim against a stateful GL/EGL test double. It tests
// interception/lifecycle contracts, not real GLSL compilation or GPU rendering.
#include <iostream>
#include <stdexcept>
#include <functional>
#include <sstream>
#include <array>
#include <utility>
#include <GLES3/gl3.h>
#include "../blue_noise.cpp"

#define CHECK(expression) do { if (!(expression)) { \
    std::ostringstream message; message << __FILE__ << ':' << __LINE__ << ": " #expression; \
    throw std::runtime_error(message.str()); } } while (false)

namespace fake {
struct ShaderState {
    GLenum type = GL_FRAGMENT_SHADER;
    std::string source;
    bool compiled = false;
    bool deleted = false;
    int compilations = 0;
};
struct ProgramState {
    std::vector<GLuint> shaders;
    std::map<GLint, GLint> uniforms{{2, 0}, {14, 0}, {15, 0}};
    bool linked = false;
    int links = 0;
};
struct Draw {
    GLuint program;
    GLint enabled;
    GLint noiseUnit;
    GLuint texture;
    GLuint sampler;
    bool dither;
};
struct State {
    std::map<GLuint, ShaderState> shaders;
    std::map<GLuint, ProgramState> programs;
    std::map<GLuint, GLint> textures;
    std::map<GLuint, std::map<GLenum, GLint>> textureParameters;
    std::vector<Draw> draws;
    std::vector<std::string> logs;
    std::array<GLuint, 16> textureBindings{};
    std::array<GLuint, 16> samplers{};
    std::set<GLenum> enabled{GL_DITHER};
    std::map<GLenum, GLint> unpack{{GL_UNPACK_ALIGNMENT, 8}, {GL_UNPACK_ROW_LENGTH, 256},
        {GL_UNPACK_SKIP_ROWS, 3}, {GL_UNPACK_SKIP_PIXELS, 5}, {GL_UNPACK_IMAGE_HEIGHT, 260}};
    GLuint unpackBuffer = 42;
    GLint activeUnit = 3;
    GLuint program = 0;
    GLuint nextTexture = 500;
    uintptr_t nextContext = 1;
    EGLDisplay display = EGL_NO_DISPLAY;
    EGLContext context = EGL_NO_CONTEXT;
    bool srgbExtension = true;
    bool disabledProperty = false;
    bool failModifiedCompile = false;
    bool failModifiedLink = false;
    bool failTexture = false;
    bool failMakeCurrent = false;
    bool failDestroy = false;
    bool failTerminate = false;
    bool badUniformLocation = false;
    bool extraSampler = false;
    GLenum extraSamplerType = GL_SAMPLER_2D;
    bool callerMapped = true;
    const char* callerLibrary = "/apk/lib/arm64/libvrlink_scene.so";
    uintptr_t callerOffset = 0x1234;
    GLint fbo = 7;
    GLint attachmentEncoding = GL_SRGB;
    GLint attachmentBits = 8;
    GLint units = 8;
    GLint blendSource = GL_ONE;
    GLint blendDestination = GL_ZERO;
    GLint blendEquation = GL_FUNC_ADD;
    int lastSourceCount = 0;
    int textureUploads = 0;
    bool uploadSawCleanUnpack = false;
    bool uploadMatchedTile = false;
};
State state;

bool modified(GLuint program) {
    for (GLuint shader : state.programs[program].shaders)
        if (state.shaders[shader].source.find("SL_originalMain") != std::string::npos) return true;
    return false;
}
void glShaderSource(GLuint shader, GLsizei count, const GLchar* const* strings, const GLint* lengths) {
    state.lastSourceCount = count;
    auto& source = state.shaders[shader].source;
    source.clear();
    for (GLsizei i = 0; i < count; ++i) {
        if (!strings || !strings[i]) continue;
        source.append(strings[i], lengths && lengths[i] >= 0 ? lengths[i] : std::strlen(strings[i]));
    }
}
void glCompileShader(GLuint shader) {
    auto& s = state.shaders[shader];
    ++s.compilations;
    s.compiled = !(state.failModifiedCompile && s.source.find("SL_originalMain") != std::string::npos);
}
void glGetShaderiv(GLuint shader, GLenum parameter, GLint* value) {
    *value = parameter == GL_SHADER_TYPE ? state.shaders[shader].type : state.shaders[shader].compiled;
}
void glLinkProgram(GLuint program) {
    auto& p = state.programs[program];
    ++p.links;
    p.linked = !(state.failModifiedLink && modified(program));
    for (GLuint shader : p.shaders) p.linked &= state.shaders[shader].compiled;
    p.uniforms = {{2, 0}, {14, 0}, {15, 0}};
}
void glGetProgramiv(GLuint program, GLenum parameter, GLint* value) {
    const auto& p = state.programs[program];
    if (parameter == GL_ATTACHED_SHADERS) *value = static_cast<GLint>(p.shaders.size());
    else if (parameter == GL_LINK_STATUS) *value = p.linked;
    else if (parameter == GL_ACTIVE_UNIFORMS) *value = state.extraSampler ? 4 : 3;
    else *value = 0;
}
void glGetAttachedShaders(GLuint program, GLsizei maximum, GLsizei* count, GLuint* shaders) {
    const auto& attached = state.programs[program].shaders;
    *count = std::min(maximum, static_cast<GLsizei>(attached.size()));
    std::copy_n(attached.begin(), *count, shaders);
}
void glDeleteShader(GLuint shader) { state.shaders[shader].deleted = true; }
GLboolean glIsShader(GLuint shader) {
    auto it = state.shaders.find(shader);
    if (it == state.shaders.end()) return GL_FALSE;
    if (!it->second.deleted) return GL_TRUE;
    for (const auto& item : state.programs)
        if (std::find(item.second.shaders.begin(), item.second.shaders.end(), shader) != item.second.shaders.end())
            return GL_TRUE;
    return GL_FALSE;
}
void glDeleteProgram(GLuint program) { state.programs.erase(program); }
void glDrawArrays(GLenum, GLint, GLsizei) {
    auto& p = state.programs[state.program];
    const auto unit = p.uniforms[14];
    state.draws.push_back({state.program, p.uniforms[15], unit,
        unit >= 0 && unit < 16 ? state.textureBindings[unit] : 0,
        unit >= 0 && unit < 16 ? state.samplers[unit] : 0, state.enabled.count(GL_DITHER) != 0});
}
void glGetIntegerv(GLenum parameter, GLint* value) {
    if (state.unpack.count(parameter)) { *value = state.unpack[parameter]; return; }
    switch (parameter) {
    case GL_ACTIVE_TEXTURE: *value = GL_TEXTURE0 + state.activeUnit; break;
    case GL_TEXTURE_BINDING_2D: *value = state.textureBindings[state.activeUnit]; break;
    case GL_SAMPLER_BINDING: *value = state.samplers[state.activeUnit]; break;
    case GL_PIXEL_UNPACK_BUFFER_BINDING: *value = state.unpackBuffer; break;
    case GL_NUM_EXTENSIONS: *value = state.srgbExtension ? 1 : 0; break;
    case GL_CURRENT_PROGRAM: *value = state.program; break;
    case GL_MAX_TEXTURE_IMAGE_UNITS: *value = state.units; break;
    case GL_DRAW_FRAMEBUFFER_BINDING: *value = state.fbo; break;
    case GL_BLEND_SRC_RGB: *value = state.blendSource; break;
    case GL_BLEND_DST_RGB: *value = state.blendDestination; break;
    case GL_BLEND_EQUATION_RGB: *value = state.blendEquation; break;
    default: *value = 0;
    }
}
GLint glGetUniformLocation(GLuint, const GLchar* name) {
    if (std::strcmp(name, "tex0") == 0) return 2;
    if (std::strcmp(name, "SL_blueNoise") == 0) return state.badUniformLocation ? 8 : 14;
    if (std::strcmp(name, "SL_enabled") == 0) return 15;
    return -1;
}
void glGetActiveUniform(GLuint, GLuint index, GLsizei capacity, GLsizei* length,
                        GLint* size, GLenum* type, GLchar* name) {
    const char* names[] = {"tex0", "SL_blueNoise", "SL_enabled", "unexpected"};
    const GLenum types[] = {GL_SAMPLER_EXTERNAL_OES, GL_SAMPLER_2D, GL_BOOL, state.extraSamplerType};
    *length = std::min(capacity - 1, static_cast<GLsizei>(std::strlen(names[index])));
    std::memcpy(name, names[index], *length); name[*length] = '\0';
    *size = 1; *type = types[index];
}
void glGetUniformiv(GLuint program, GLint location, GLint* value) { *value = state.programs[program].uniforms[location]; }
void glUniform1i(GLint location, GLint value) { state.programs[state.program].uniforms[location] = value; }
void glUseProgram(GLuint program) { state.program = program; }
void glGenTextures(GLsizei count, GLuint* textures) {
    for (int i = 0; i < count; ++i) { textures[i] = state.nextTexture++; state.textures[textures[i]] = 0; }
}
void glDeleteTextures(GLsizei count, const GLuint* textures) {
    for (int i = 0; i < count; ++i) state.textures.erase(textures[i]);
}
void glBindTexture(GLenum, GLuint texture) { state.textureBindings[state.activeUnit] = texture; }
void glActiveTexture(GLenum unit) { state.activeUnit = unit - GL_TEXTURE0; }
void glTexImage2D(GLenum target, GLint level, GLint format, GLsizei width, GLsizei height,
                  GLint border, GLenum input, GLenum type, const void* bytes) {
    ++state.textureUploads;
    state.uploadSawCleanUnpack = state.unpackBuffer == 0 && state.unpack[GL_UNPACK_ALIGNMENT] == 1
        && state.unpack[GL_UNPACK_ROW_LENGTH] == 0 && state.unpack[GL_UNPACK_SKIP_ROWS] == 0
        && state.unpack[GL_UNPACK_SKIP_PIXELS] == 0 && state.unpack[GL_UNPACK_IMAGE_HEIGHT] == 0;
    state.uploadMatchedTile = target == GL_TEXTURE_2D && level == 0 && format == GL_R8
        && width == 128 && height == 128 && border == 0 && input == GL_RED && type == GL_UNSIGNED_BYTE
        && bytes && std::memcmp(bytes, sl_blue_noise::kTile, sl_blue_noise::kTileSize) == 0;
    state.textures[state.textureBindings[state.activeUnit]] = state.failTexture ? 0 : width;
}
void glTexParameteri(GLenum, GLenum parameter, GLint value) {
    state.textureParameters[state.textureBindings[state.activeUnit]][parameter] = value;
}
void glTexStorage2D(GLenum target, GLsizei levels, GLenum format, GLsizei width, GLsizei height) {
    CHECK(target == GL_TEXTURE_2D && levels == 1 && format == GL_R8 && width == 128 && height == 128);
    state.textures[state.textureBindings[state.activeUnit]] = state.failTexture ? 0 : width;
}
void glTexSubImage2D(GLenum target, GLint level, GLint x, GLint y, GLsizei width, GLsizei height,
                     GLenum format, GLenum type, const void* bytes) {
    CHECK(x == 0 && y == 0);
    glTexImage2D(target, level, GL_R8, width, height, 0, format, type, bytes);
}
void glPixelStorei(GLenum parameter, GLint value) { state.unpack[parameter] = value; }
void glBindBuffer(GLenum, GLuint buffer) { state.unpackBuffer = buffer; }
void glBindSampler(GLuint unit, GLuint sampler) { state.samplers[unit] = sampler; }
GLboolean glIsTexture(GLuint texture) { return state.textures.count(texture) != 0; }
void glGetTexParameteriv(GLenum, GLenum parameter, GLint* value) {
    CHECK(parameter == GL_TEXTURE_IMMUTABLE_FORMAT);
    *value = state.textures[state.textureBindings[state.activeUnit]] != 0;
}
void glGetFramebufferAttachmentParameteriv(GLenum, GLenum, GLenum parameter, GLint* value) {
    *value = parameter == GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING ? state.attachmentEncoding : state.attachmentBits;
}
GLboolean glIsEnabled(GLenum cap) { return state.enabled.count(cap) != 0; }
void glEnable(GLenum cap) { state.enabled.insert(cap); }
void glDisable(GLenum cap) { state.enabled.erase(cap); }
const GLubyte* glGetStringi(GLenum, GLuint) {
    return reinterpret_cast<const GLubyte*>("GL_EXT_sRGB_write_control");
}
EGLContext eglCreateContext(EGLDisplay, EGLConfig, EGLContext, const EGLint*) {
    return reinterpret_cast<EGLContext>(state.nextContext++);
}
EGLBoolean eglDestroyContext(EGLDisplay, EGLContext) { return !state.failDestroy; }
EGLBoolean eglMakeCurrent(EGLDisplay display, EGLSurface, EGLSurface, EGLContext context) {
    if (state.failMakeCurrent) return EGL_FALSE;
    state.display = context == EGL_NO_CONTEXT ? EGL_NO_DISPLAY : display;
    state.context = context;
    return EGL_TRUE;
}
EGLBoolean eglTerminate(EGLDisplay) { return !state.failTerminate; }
EGLContext eglGetCurrentContext() { return state.context; }
EGLDisplay eglGetCurrentDisplay() { return state.display; }
}

extern "C" void* dlopen(const char* name, int) {
    CHECK(std::strcmp(name, "libGLESv3.so") == 0 || std::strcmp(name, "libEGL.so") == 0);
    return reinterpret_cast<void*>(1);
}
extern "C" void* dlsym(void* handle, const char* symbol) {
    CHECK(handle != nullptr);
#define RESOLVE(name) if (std::strcmp(symbol, #name) == 0) return reinterpret_cast<void*>(&fake::name);
    GL_API_LIST(RESOLVE) EGL_API_LIST(RESOLVE)
#undef RESOLVE
    throw std::runtime_error(std::string("Unmapped API: ") + symbol);
}
extern "C" int __android_log_write(int, const char*, const char* text) { fake::state.logs.emplace_back(text); return 0; }
extern "C" int dladdr(const void* address, Dl_info* info) {
    info->dli_fname = fake::state.callerLibrary;
    info->dli_fbase = reinterpret_cast<void*>(reinterpret_cast<uintptr_t>(address) - fake::state.callerOffset);
    return fake::state.callerMapped;
}
extern "C" int __system_property_get(const char*, char* value) {
    std::strcpy(value, fake::state.disabledProperty ? "0" : "");
    return fake::state.disabledProperty ? 1 : 0;
}

namespace {
const std::string foveal = R"GLSL(#version 310 es
#extension GL_OES_EGL_image_external_essl3 : require
precision mediump float;
layout(location = 2) uniform samplerExternalOES tex0;
layout(location = 0) out vec4 color;
void main() {
    color = texture(tex0, vec2(0.5));
    color.rgb *= 0.97;
    color.a = 0.625;
}
)GLSL";
const std::string stock = foveal + "// distinct stock full-source hash\n";
const EGLDisplay display = reinterpret_cast<EGLDisplay>(0x100);
void reset() {
    contexts.clear(); current = {EGL_NO_DISPLAY, EGL_NO_CONTEXT};
    fake::state = fake::State{};
    for (size_t i = 0; i < fake::state.textureBindings.size(); ++i) {
        fake::state.textureBindings[i] = static_cast<GLuint>(100 + i);
        fake::state.samplers[i] = static_cast<GLuint>(200 + i);
    }
    std::strcpy(sl_blue_noise::configured_shader_hash, sl_blue_noise::sha256(foveal).c_str());
    std::strcpy(sl_blue_noise::stock_shader_hash, sl_blue_noise::sha256(stock).c_str());
    std::strcpy(sl_blue_noise::fovea_draw_return, "0000000000001234");
    sl_blue_noise::background_shader_hash[0] = 0;
    sl_blue_noise::background_stock_hash[0] = 0;
    sl_blue_noise::background_draw_return[0] = 0;
}
EGLContext makeContext(EGLContext share = EGL_NO_CONTEXT) {
    auto context = gxdCreateContext(display, nullptr, share, nullptr);
    CHECK(gxdMakeCurrent(display, nullptr, nullptr, context));
    return context;
}
void submit(GLuint shader, const std::string& source = foveal) {
    const char* text = source.c_str();
    gxShaderSource(shader, 1, &text, nullptr);
}
void prepare(GLuint program = 20, GLuint shader = 10, const std::string& source = foveal) {
    submit(shader, source); gxCompileShader(shader);
    fake::state.programs[program].shaders = {shader};
    gxLinkProgram(program);
    fake::glUseProgram(program);
}
void draw() { gxDrawArrays(GL_TRIANGLE_STRIP, 0, 4); }

std::string backgroundSource() {
    std::string source = foveal;
    source.replace(source.find("color.a = 0.625;"), std::strlen("color.a = 0.625;"), "color.a = 1.0;");
    return source;
}
void enableBackground() {
    std::strcpy(sl_blue_noise::background_shader_hash, sl_blue_noise::sha256(backgroundSource()).c_str());
    std::strcpy(sl_blue_noise::background_stock_hash, sl_blue_noise::sha256(backgroundSource() + "// stock\n").c_str());
    std::strcpy(sl_blue_noise::background_draw_return, "0000000000005678");
}
void layerIsolationAndBoth() {
    for (unsigned selection = 1; selection <= 3; ++selection) {
        reset();
        if (!(selection & 1)) {
            sl_blue_noise::configured_shader_hash[0] = 0;
            sl_blue_noise::stock_shader_hash[0] = 0;
        }
        if (selection & 2) enableBackground();
        makeContext(); prepare(); prepare(21, 11, backgroundSource());
        for (unsigned programLayer = 0; programLayer < 2; ++programLayer) {
            fake::glUseProgram(20 + programLayer);
            for (unsigned callerLayer = 0; callerLayer < 2; ++callerLayer) {
                fake::state.callerOffset = callerLayer ? 0x5678 : 0x1234;
                const bool expected = (selection & (1u << programLayer)) && programLayer == callerLayer;
                const auto textures = fake::state.textureBindings;
                const auto samplers = fake::state.samplers;
                draw();
                CHECK(fake::state.draws.back().enabled == int(expected));
                CHECK(fake::state.draws.back().dither == !expected);
                CHECK(fake::state.enabled.count(GL_DITHER) == 1);
                CHECK(fake::state.textureBindings == textures && fake::state.samplers == samplers);
            }
        }
        const auto& base = fake::state.shaders.at(11).source;
        CHECK(base.find("color.a = 1.0;") != std::string::npos);
        CHECK((base == backgroundSource()) == !(selection & 2));
        CHECK((fake::state.shaders.at(10).source == foveal) == !(selection & 1));
    }
}
void ambiguousLayerFallback() {
    enableBackground();
    std::string result;
    CHECK(sl_blue_noise::rewrite(backgroundSource(), result) == sl_blue_noise::Layer::Background);
    CHECK(sl_blue_noise::rewrite(backgroundSource() + "// stock\n", result) == sl_blue_noise::Layer::Background);
    std::strcpy(sl_blue_noise::background_shader_hash, sl_blue_noise::sha256(foveal).c_str());
    CHECK(sl_blue_noise::rewrite(foveal, result) == sl_blue_noise::Layer::None);
    enableBackground(); makeContext();
    submit(10); submit(11, backgroundSource()); gxCompileShader(10); gxCompileShader(11);
    fake::state.programs[20].shaders = {10, 11};
    gxLinkProgram(20);
    CHECK(group()->programs.count(20) == 0);
    CHECK(fake::state.shaders.at(10).source == foveal);
    CHECK(fake::state.shaders.at(11).source == backgroundSource());
}
void backgroundFallback() {
    for (unsigned failure = 0; failure < 4; ++failure) {
        reset(); enableBackground(); makeContext();
        fake::state.failModifiedCompile = failure == 0;
        fake::state.failModifiedLink = failure == 1;
        fake::state.failTexture = failure == 2;
        prepare(21, 11, backgroundSource());
        fake::state.callerOffset = 0x5678;
        if (failure == 3) fake::glEnable(GL_FRAMEBUFFER_SRGB_EXT);
        draw();
        CHECK(fake::state.draws.back().enabled == 0);
        CHECK(fake::state.enabled.count(GL_DITHER) == 1);
        if (failure != 3) CHECK(fake::state.shaders.at(11).source == backgroundSource());
    }
}

void hashes() {
    CHECK(sl_blue_noise::sha256("") == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
    CHECK(sl_blue_noise::sha256("abc") == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad");
    CHECK(sl_blue_noise::sha256("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")
          == "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1");
    CHECK(sl_blue_noise::sha256(std::string(1000000, 'a'))
          == "cdc76e5c9914fb9281a1c7e284d73e67f1809a48a497200e046d39ccc7112cd0");
}
void rewriteHashesAndMask() {
    std::string rewritten;
    CHECK(sl_blue_noise::rewrite(foveal, rewritten));
    CHECK(rewritten.find("void SL_originalMain()") != std::string::npos);
    CHECK(rewritten.find("color.a = 0.625;") != std::string::npos);
    CHECK(rewritten.find("uniform highp samplerExternalOES tex0;") != std::string::npos);
    CHECK(rewritten.find("precision highp float;") != std::string::npos);
    CHECK(rewritten.find("color.rgb = floor(clamp(color.rgb,0.0,1.0)*255.0+vec3(t))/255.0;") != std::string::npos);
    CHECK(!sl_blue_noise::rewrite(rewritten, rewritten));
    CHECK(sl_blue_noise::rewrite(stock, rewritten));
    std::string opaque = foveal;
    opaque.replace(opaque.find("color.a = 0.625;"), 16, "color.a = 1.0;");
    CHECK(!sl_blue_noise::rewrite(opaque, rewritten));
    CHECK(!sl_blue_noise::rewrite(foveal + " ", rewritten));
    CHECK(!sl_blue_noise::rewrite(foveal.substr(0, foveal.size() - 1), rewritten));
}
void splitSourceLengths() {
    makeContext();
    std::string part1 = foveal.substr(0, 80) + "ignored";
    std::string part2 = foveal.substr(80, 90);
    std::string part3 = foveal.substr(170);
    const char* parts[] = {part1.c_str(), part2.c_str(), part3.c_str()};
    const GLint lengths[] = {80, -1, static_cast<GLint>(part3.size())};
    gxShaderSource(10, 3, parts, lengths);
    CHECK(fake::state.lastSourceCount == 1);
    CHECK(group()->shaders.at(10).original == foveal);
    CHECK(fake::state.shaders.at(10).source.find("SL_originalMain") != std::string::npos);
    CHECK(fake::state.shaders.at(10).source.find("ignored") == std::string::npos);
    std::string unknown = foveal + std::string("\0hidden", 7);
    const char* bytes = unknown.data(); const GLint bytesCount = static_cast<GLint>(unknown.size());
    gxShaderSource(11, 1, &bytes, &bytesCount);
    CHECK(fake::state.shaders.at(11).source == unknown);
    CHECK(group()->shaders.count(11) == 0);
}
void passThroughGuards() {
    submit(10); CHECK(fake::state.shaders.at(10).source == foveal);
    makeContext(); fake::state.shaders[11].type = GL_VERTEX_SHADER;
    submit(11); CHECK(fake::state.shaders.at(11).source == foveal);
    fake::state.srgbExtension = false; submit(12); CHECK(fake::state.shaders.at(12).source == foveal);
    fake::state.srgbExtension = true; fake::state.disabledProperty = true;
    submit(13); CHECK(fake::state.shaders.at(13).source == foveal);
    fake::state.disabledProperty = false;
    for (int i = 0; i < 50; ++i) submit(14, foveal + "// unknown " + std::to_string(i));
    CHECK(group()->unknown.size() == 32);
    CHECK(group()->shaders.empty());
}
void compileFallback() {
    makeContext(); fake::state.failModifiedCompile = true;
    submit(10); gxCompileShader(10);
    CHECK(fake::state.shaders.at(10).compiled);
    CHECK(fake::state.shaders.at(10).source == foveal);
    CHECK(fake::state.shaders.at(10).compilations == 2);
    CHECK(!group()->shaders.at(10).modified);
}
void linkAndResourceFallback() {
    for (int failure = 0; failure < 5; ++failure) {
        reset(); makeContext();
        fake::state.failModifiedLink = failure == 0;
        fake::state.badUniformLocation = failure == 1;
        fake::state.extraSampler = failure == 2 || failure == 4;
        fake::state.extraSamplerType = failure == 4 ? GL_SAMPLER_CUBE : GL_SAMPLER_2D;
        fake::state.failTexture = failure == 3;
        const auto unpackBefore = fake::state.unpack;
        prepare();
        CHECK(fake::state.programs.at(20).linked);
        CHECK(fake::state.programs.at(20).links == 2);
        CHECK(fake::state.shaders.at(10).source == foveal);
        CHECK(group()->programs.empty());
        CHECK(fake::state.unpack == unpackBefore);
        CHECK(fake::state.unpackBuffer == 42);
        CHECK(fake::state.textureBindings[1] == 101);
        CHECK(fake::state.samplers[1] == 201);
        CHECK(fake::state.activeUnit == 3);
    }
}
void uploadAndDrawRestore() {
    makeContext();
    const auto unpackBefore = fake::state.unpack;
    const auto texturesBefore = fake::state.textureBindings;
    const auto samplersBefore = fake::state.samplers;
    submit(10); gxCompileShader(10);
    fake::state.programs[20].shaders = {10};
    fake::glUseProgram(77);
    gxLinkProgram(20);
    CHECK(fake::state.program == 77);
    fake::glUseProgram(20);
    CHECK(group()->programs.count(20) == 1);
    CHECK(fake::state.textureUploads == 1);
    CHECK(fake::state.uploadSawCleanUnpack && fake::state.uploadMatchedTile);
    CHECK(fake::state.unpack == unpackBefore);
    CHECK(fake::state.unpackBuffer == 42);
    CHECK(fake::state.textureBindings == texturesBefore);
    CHECK(fake::state.samplers == samplersBefore);
    CHECK(fake::state.activeUnit == 3);
    const auto& parameters = fake::state.textureParameters.at(group()->texture);
    CHECK(parameters.at(GL_TEXTURE_MIN_FILTER) == GL_NEAREST);
    CHECK(parameters.at(GL_TEXTURE_MAG_FILTER) == GL_NEAREST);
    CHECK(parameters.at(GL_TEXTURE_WRAP_S) == GL_REPEAT && parameters.at(GL_TEXTURE_WRAP_T) == GL_REPEAT);
    CHECK(parameters.at(GL_TEXTURE_BASE_LEVEL) == 0 && parameters.at(GL_TEXTURE_MAX_LEVEL) == 0);
    CHECK(fake::state.programs[20].uniforms[14] != fake::state.programs[20].uniforms[2]);
    draw();
    const auto& record = fake::state.draws.back();
    CHECK(record.enabled == 1 && record.noiseUnit == 7 && record.texture == group()->texture);
    CHECK(!record.dither && record.sampler == 0);
    CHECK(fake::state.enabled.count(GL_DITHER) == 1);
    CHECK(fake::state.textureBindings == texturesBefore);
    CHECK(fake::state.samplers == samplersBefore);
    CHECK(fake::state.activeUnit == 3);
    CHECK(fake::state.program == 20);
    CHECK(fake::state.programs[20].uniforms[15] == 0);
    fake::glDisable(GL_DITHER); draw(); CHECK(fake::state.enabled.count(GL_DITHER) == 0);
    fake::state.programs[20].uniforms[2] = 7; draw();
    CHECK(fake::state.draws.back().noiseUnit == 6);
    CHECK(fake::state.programs[20].uniforms[2] == 7);
}
void framebufferGuards() {
    for (int failure = 0; failure < 10; ++failure) {
        reset(); makeContext(); prepare();
        switch (failure) {
        case 0: fake::state.fbo = 0; break;
        case 1: fake::state.attachmentEncoding = GL_LINEAR; break;
        case 2: fake::state.attachmentBits = 10; break;
        case 3: fake::glEnable(GL_FRAMEBUFFER_SRGB_EXT); break;
        case 4: fake::glEnable(GL_BLEND); fake::state.blendDestination = GL_ONE_MINUS_SRC_ALPHA; break;
        case 5: fake::state.textures.erase(group()->texture); break;
        case 6: fake::state.units = 1; break;
        case 7: fake::state.callerOffset = 0x5678; break;
        case 8: fake::state.callerLibrary = "libother.so"; break;
        case 9: fake::state.callerMapped = false; break;
        }
        const auto texturesBefore = fake::state.textureBindings;
        draw(); draw();
        CHECK(fake::state.draws.back().enabled == 0);
        CHECK(fake::state.draws.back().dither);
        CHECK(fake::state.textureBindings == texturesBefore);
        CHECK(group()->programs.at(20).warned);
    }
}
void deletedAttachedShaderFallback() {
    makeContext(); submit(10); gxCompileShader(10);
    fake::state.programs[20].shaders = {10};
    gxDeleteShader(10);
    CHECK(group()->shaders.count(10) == 1);
    fake::state.failModifiedLink = true; gxLinkProgram(20);
    CHECK(fake::state.programs.at(20).linked);
    CHECK(fake::state.shaders.at(10).source == foveal);
    gxDeleteProgram(20);
    CHECK(group()->shaders.count(10) == 0 && group()->programs.count(20) == 0);
}
void reloadAndIdReuse() {
    makeContext(); prepare();
    CHECK(group()->programs.count(20) == 1);
    submit(10, "unknown reload"); gxCompileShader(10); gxLinkProgram(20);
    CHECK(group()->programs.count(20) == 0);
    CHECK(group()->shaders.count(10) == 0);
    draw(); CHECK(fake::state.draws.back().enabled == 0);
    prepare(); CHECK(group()->programs.count(20) == 1);
    gxDeleteProgram(20); CHECK(group()->programs.empty());
}
void contextShareAndReuse() {
    const auto first = makeContext(); prepare();
    auto sharedGroup = contexts.at({display, first}).group;
    const auto second = makeContext(first);
    CHECK(contexts.at({display, second}).group == sharedGroup);
    CHECK(group()->programs.count(20) == 1);
    CHECK(gxdDestroyContext(display, first));
    CHECK(contexts.count({display, first}) == 0);
    CHECK(group()->programs.count(20) == 1);
    const auto independent = makeContext();
    CHECK(contexts.at({display, independent}).group != sharedGroup);
    CHECK(group()->programs.empty());
    CHECK(gxdDestroyContext(display, independent));
    CHECK(contexts.at({display, independent}).pendingDestroy);
    CHECK(gxdMakeCurrent(display, nullptr, nullptr, second));
    CHECK(contexts.count({display, independent}) == 0);
    fake::state.nextContext = reinterpret_cast<uintptr_t>(independent);
    const auto reused = makeContext();
    CHECK(reused == independent);
    CHECK(group()->programs.empty() && group()->texture == 0);
}
void contextFailureAndTerminate() {
    const auto first = makeContext(); prepare();
    const auto second = gxdCreateContext(display, nullptr, EGL_NO_CONTEXT, nullptr);
    fake::state.failMakeCurrent = true;
    CHECK(!gxdMakeCurrent(display, nullptr, nullptr, second));
    CHECK(current.second == first && contexts.at({display, first}).current == 1);
    fake::state.failDestroy = true;
    CHECK(!gxdDestroyContext(display, first)); CHECK(!contexts.at({display, first}).pendingDestroy);
    fake::state.failTerminate = true;
    CHECK(!gxdTerminate(display)); CHECK(contexts.size() == 2);
    fake::state.failTerminate = false;
    CHECK(gxdTerminate(display));
    CHECK(contexts.count({display, second}) == 0);
    CHECK(contexts.at({display, first}).pendingDestroy);
    fake::state.failMakeCurrent = false;
    CHECK(gxdMakeCurrent(display, nullptr, nullptr, EGL_NO_CONTEXT));
    CHECK(contexts.empty());
}
void propertyDisableOnShaderReload() {
    makeContext(); prepare(); draw(); CHECK(fake::state.draws.back().enabled == 1);
    fake::state.disabledProperty = true;
    // The documented switch is checked on compilation/reload, avoiding a
    // property lookup in the frame loop. Relink removes the modified program.
    submit(10); gxCompileShader(10); gxLinkProgram(20);
    CHECK(fake::state.shaders.at(10).source == foveal);
    draw(); CHECK(fake::state.draws.back().enabled == 0);
}
}

int main() {
    const std::pair<const char*, std::function<void()>> tests[] = {
        {"SHA-256 known vectors", hashes}, {"exact source/mask allowlist", rewriteHashesAndMask},
        {"split sources and explicit lengths", splitSourceLengths}, {"unknown/context/type/extension guards", passThroughGuards},
        {"compile fallback", compileFallback}, {"link/uniform/resource fallback", linkAndResourceFallback},
        {"upload and draw state restoration", uploadAndDrawRestore}, {"framebuffer/resource guards", framebufferGuards},
        {"deleted attached shader fallback", deletedAttachedShaderFallback}, {"reload and shader/program reuse", reloadAndIdReuse},
        {"context sharing/deferred destroy/reuse", contextShareAndReuse}, {"EGL failure/terminate lifecycle", contextFailureAndTerminate},
        {"disable switch on shader reload", propertyDisableOnShaderReload},
        {"fovea/background/both exact draw isolation", layerIsolationAndBoth},
        {"ambiguous hashes and mixed-layer link fallback", ambiguousLayerFallback},
        {"background compile/link/resource/framebuffer fallback", backgroundFallback},
    };
    int failures = 0;
    for (const auto& test : tests) {
        reset();
        try { test.second(); std::cout << "PASS " << test.first << '\n'; }
        catch (const std::exception& error) { ++failures; std::cout << "FAIL " << test.first << ": " << error.what() << '\n'; }
    }
    std::cout << std::size(tests) - failures << '/' << std::size(tests) << " native contract tests passed\n";
    return failures ? 1 : 0;
}

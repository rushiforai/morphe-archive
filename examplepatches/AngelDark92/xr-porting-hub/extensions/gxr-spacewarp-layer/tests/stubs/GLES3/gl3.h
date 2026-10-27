#pragma once
#include <cstddef>
// Host-only GLES3 substitute: covers the layer's direct calls AND the sibling
// estimator's GL function-pointer typedefs (SwpGlTable is defined in terms of
// PFNGL*PROC types). Function bodies live in the test TU so tests can assert.
typedef unsigned int GLenum;
typedef unsigned int GLuint;
typedef int GLint;
typedef int GLsizei;
typedef int GLboolean;
typedef float GLfloat;
typedef unsigned char GLubyte;
typedef char GLchar;
typedef long long GLint64;
typedef unsigned long long GLuint64;
typedef ptrdiff_t GLsizeiptr;
typedef ptrdiff_t GLintptr;
#ifndef GL_APIENTRYP
#define GL_APIENTRYP *
#endif
constexpr GLenum GL_TEXTURE_2D = 0x0DE1;
constexpr GLenum GL_RGBA16F = 0x881A;
constexpr GLenum GL_RGBA8 = 0x8058;
constexpr GLenum GL_SRGB8_ALPHA8 = 0x8C43;
constexpr GLenum GL_RGB10_A2 = 0x8059;
constexpr GLenum GL_RGB565 = 0x8D62;
constexpr GLenum GL_RGBA4 = 0x8056;
constexpr GLenum GL_RGBA = 0x1908;
constexpr GLenum GL_HALF_FLOAT = 0x140B;
using GLbitfield = unsigned int;
constexpr GLboolean GL_FALSE = 0;
constexpr GLboolean GL_TRUE = 1;
constexpr GLenum GL_NEAREST = 0x2600;
constexpr GLenum GL_LINEAR = 0x2601;
constexpr GLenum GL_READ_FRAMEBUFFER = 0x8CA8;
constexpr GLenum GL_DRAW_FRAMEBUFFER = 0x8CA9;
constexpr GLenum GL_SCISSOR_TEST = 0x0C11;
constexpr GLenum GL_COLOR_BUFFER_BIT = 0x00004000;
constexpr GLenum GL_READ_FRAMEBUFFER_BINDING = 0x8CAA;
constexpr GLenum GL_DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
constexpr GLenum GL_COLOR_WRITEMASK = 0x0C23;
constexpr GLenum GL_TEXTURE_INTERNAL_FORMAT = 0x1003;
constexpr GLenum GL_DEPTH_TEST = 0x0B71;
constexpr GLenum GL_CULL_FACE = 0x0B44;
constexpr GLenum GL_BLEND = 0x0BE2;
constexpr GLenum GL_ACTIVE_TEXTURE = 0x84E0;
constexpr GLenum GL_CURRENT_PROGRAM = 0x8B8D;
constexpr GLenum GL_FRAMEBUFFER_BINDING = 0x8CA6;
constexpr GLenum GL_TEXTURE_BINDING_2D = 0x8069;
constexpr GLenum GL_TEXTURE0 = 0x84C0;
constexpr GLenum GL_CLAMP_TO_EDGE = 0x812F;
constexpr GLenum GL_TEXTURE_MIN_FILTER = 0x2801;
constexpr GLenum GL_TEXTURE_MAG_FILTER = 0x2800;
constexpr GLenum GL_TEXTURE_WRAP_S = 0x2802;
constexpr GLenum GL_TEXTURE_WRAP_T = 0x2803;
constexpr GLenum GL_FRAMEBUFFER = 0x8D40;
constexpr GLenum GL_COLOR_ATTACHMENT0 = 0x8CE0;
constexpr GLenum GL_FRAMEBUFFER_COMPLETE = 0x8CD5;
constexpr GLenum GL_NO_ERROR = 0;
constexpr GLenum GL_INVALID_OPERATION = 0x0502;
constexpr GLenum GL_FLOAT = 0x1406;
constexpr GLenum GL_VENDOR = 0x1F00;
constexpr GLenum GL_VERSION = 0x1F02;
constexpr GLenum GL_EXTENSIONS = 0x1F03;
constexpr GLenum GL_VIEWPORT = 0x0BA2;
constexpr GLenum GL_QUERY_COUNTER_BITS = 0x8864;
constexpr GLenum GL_VERTEX_SHADER = 0x8B31;
constexpr GLenum GL_FRAGMENT_SHADER = 0x8B30;
constexpr GLenum GL_COMPILE_STATUS = 0x8B81;
constexpr GLenum GL_LINK_STATUS = 0x8B82;
constexpr GLenum GL_TRIANGLES = 0x0004;

// GL function-pointer typedefs as the real GLES3 header defines them.
typedef GLuint (GL_APIENTRYP PFNGLCREATESHADERPROC)(GLenum type);
typedef void (GL_APIENTRYP PFNGLSHADERSOURCEPROC)(GLuint shader, GLsizei count,
                                                  const GLchar* const* string,
                                                  const GLint* length);
typedef void (GL_APIENTRYP PFNGLCOMPILESHADERPROC)(GLuint shader);
typedef void (GL_APIENTRYP PFNGLGETSHADERIVPROC)(GLuint shader, GLenum pname, GLint* params);
typedef void (GL_APIENTRYP PFNGLGETSHADERINFOLOGPROC)(GLuint shader, GLsizei bufSize,
                                                      GLsizei* length, GLchar* infoLog);
typedef void (GL_APIENTRYP PFNGLDELETESHADERPROC)(GLuint shader);
typedef GLuint (GL_APIENTRYP PFNGLCREATEPROGRAMPROC)();
typedef void (GL_APIENTRYP PFNGLATTACHSHADERPROC)(GLuint program, GLuint shader);
typedef void (GL_APIENTRYP PFNGLLINKPROGRAMPROC)(GLuint program);
typedef void (GL_APIENTRYP PFNGLGETPROGRAMIVPROC)(GLuint program, GLenum pname, GLint* params);
typedef void (GL_APIENTRYP PFNGLGETPROGRAMINFOLOGPROC)(GLuint program, GLsizei bufSize,
                                                       GLsizei* length, GLchar* infoLog);
typedef void (GL_APIENTRYP PFNGLDELETEPROGRAMPROC)(GLuint program);
typedef GLint (GL_APIENTRYP PFNGLGETUNIFORMLOCATIONPROC)(GLuint program, const GLchar* name);
typedef void (GL_APIENTRYP PFNGLUNIFORM1IPROC)(GLint location, GLint x);
typedef void (GL_APIENTRYP PFNGLUNIFORM2IPROC)(GLint location, GLint x, GLint y);
typedef void (GL_APIENTRYP PFNGLUNIFORM1FPROC)(GLint location, GLfloat x);
typedef void (GL_APIENTRYP PFNGLUNIFORM2FPROC)(GLint location, GLfloat x, GLfloat y);
typedef void (GL_APIENTRYP PFNGLUNIFORM4FPROC)(GLint location, GLfloat x, GLfloat y, GLfloat z,
                                               GLfloat w);
typedef void (GL_APIENTRYP PFNGLUNIFORMMATRIX3FVPROC)(GLint location, GLsizei count,
                                                      GLboolean transpose, const GLfloat* value);
typedef void (GL_APIENTRYP PFNGLUSEPROGRAMPROC)(GLuint program);
typedef void (GL_APIENTRYP PFNGLDRAWARRAYSPROC)(GLenum mode, GLint first, GLsizei count);
typedef void (GL_APIENTRYP PFNGLVIEWPORTPROC)(GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (GL_APIENTRYP PFNGLFLUSHPROC)();
typedef GLenum (GL_APIENTRYP PFNGLGETERRORPROC)();
typedef void (GL_APIENTRYP PFNGLGENFRAMEBUFFERSPROC)(GLsizei n, GLuint* framebuffers);
typedef void (GL_APIENTRYP PFNGLDELETEFRAMEBUFFERSPROC)(GLsizei n, const GLuint* framebuffers);
typedef void (GL_APIENTRYP PFNGLBINDFRAMEBUFFERPROC)(GLenum target, GLuint framebuffer);
typedef void (GL_APIENTRYP PFNGLFRAMEBUFFERTEXTURE2DPROC)(GLenum target, GLenum attachment,
                                                          GLenum textarget, GLuint texture,
                                                          GLint level);
typedef GLenum (GL_APIENTRYP PFNGLCHECKFRAMEBUFFERSTATUSPROC)(GLenum target);
typedef void (GL_APIENTRYP PFNGLBLITFRAMEBUFFERPROC)(GLint srcX0, GLint srcY0, GLint srcX1,
                                                     GLint srcY1, GLint dstX0, GLint dstY0,
                                                     GLint dstX1, GLint dstY1, GLbitfield mask,
                                                     GLenum filter);
typedef void (GL_APIENTRYP PFNGLGENTEXTURESPROC)(GLsizei n, GLuint* textures);
typedef void (GL_APIENTRYP PFNGLDELETETEXTURESPROC)(GLsizei n, const GLuint* textures);
typedef void (GL_APIENTRYP PFNGLBINDTEXTUREPROC)(GLenum target, GLuint texture);
typedef void (GL_APIENTRYP PFNGLACTIVETEXTUREPROC)(GLenum texture);
typedef void (GL_APIENTRYP PFNGLTEXSTORAGE2DPROC)(GLenum target, GLsizei levels,
                                                  GLenum internalformat, GLsizei width,
                                                  GLsizei height);
typedef void (GL_APIENTRYP PFNGLTEXPARAMETERIPROC)(GLenum target, GLenum pname, GLint param);
typedef void (GL_APIENTRYP PFNGLTEXSUBIMAGE2DPROC)(GLenum target, GLint level, GLint xoffset,
                                                   GLint yoffset, GLsizei width, GLsizei height,
                                                   GLenum format, GLenum type, const void* pixels);
typedef void (GL_APIENTRYP PFNGLREADPIXELSPROC)(GLint x, GLint y, GLsizei width, GLsizei height,
                                                GLenum format, GLenum type, void* pixels);
typedef const GLubyte* (GL_APIENTRYP PFNGLGETSTRINGPROC)(GLenum name);
typedef void (GL_APIENTRYP PFNGLGETINTEGERVPROC)(GLenum pname, GLint* params);

extern "C" {
GLuint glCreateShader(GLenum type);
void glShaderSource(GLuint shader, GLsizei count, const GLchar* const* string,
                    const GLint* length);
void glCompileShader(GLuint shader);
void glGetShaderiv(GLuint shader, GLenum pname, GLint* params);
void glGetShaderInfoLog(GLuint shader, GLsizei bufSize, GLsizei* length, GLchar* infoLog);
void glDeleteShader(GLuint shader);
GLuint glCreateProgram();
void glAttachShader(GLuint program, GLuint shader);
void glLinkProgram(GLuint program);
void glGetProgramiv(GLuint program, GLenum pname, GLint* params);
void glGetProgramInfoLog(GLuint program, GLsizei bufSize, GLsizei* length, GLchar* infoLog);
void glDeleteProgram(GLuint program);
GLint glGetUniformLocation(GLuint program, const GLchar* name);
void glUniform1i(GLint location, GLint x);
void glUniform2i(GLint location, GLint x, GLint y);
void glUniform1f(GLint location, GLfloat x);
void glUniform2f(GLint location, GLfloat x, GLfloat y);
void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glUniformMatrix3fv(GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
void glUseProgram(GLuint program);
void glDrawArrays(GLenum mode, GLint first, GLsizei count);
void glViewport(GLint x, GLint y, GLsizei width, GLsizei height);
void glFlush();
GLenum glGetError();
void glBlitFramebuffer(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0,
                       GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
GLboolean glIsEnabled(GLenum cap);
void glEnable(GLenum cap);
void glDisable(GLenum cap);
void glColorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
void glGetBooleanv(GLenum pname, GLboolean* data);
void glGenFramebuffers(GLsizei n, GLuint* framebuffers);
void glDeleteFramebuffers(GLsizei n, const GLuint* framebuffers);
void glBindFramebuffer(GLenum target, GLuint framebuffer);
void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture,
                            GLint level);
void glFramebufferTextureLayer(GLenum target, GLenum attachment, GLuint texture, GLint level,
                               GLint layer);
GLenum glCheckFramebufferStatus(GLenum target);
void glGenTextures(GLsizei n, GLuint* textures);
void glDeleteTextures(GLsizei n, const GLuint* textures);
void glBindTexture(GLenum target, GLuint texture);
void glActiveTexture(GLenum texture);
void glTexStorage2D(GLenum target, GLsizei levels, GLenum internalformat, GLsizei width,
                    GLsizei height);
void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width,
                     GLsizei height, GLenum format, GLenum type, const void* pixels);
void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type,
                  void* pixels);
void glGetTexLevelParameteriv(GLenum target, GLint level, GLenum pname, GLint* params);
void glTexParameteri(GLenum target, GLenum pname, GLint param);
const GLubyte* glGetString(GLenum name);
void glGetIntegerv(GLenum pname, GLint* params);

// Sampler objects
void glGenSamplers(GLsizei count, GLuint* samplers);
void glDeleteSamplers(GLsizei count, const GLuint* samplers);
void glBindSampler(GLuint unit, GLuint sampler);
void glSamplerParameteri(GLuint sampler, GLenum pname, GLint param);

// Queries
void glGenQueries(GLsizei n, GLuint* ids);
void glDeleteQueries(GLsizei n, const GLuint* ids);
void glBeginQuery(GLenum target, GLuint id);
void glEndQuery(GLenum target);
void glGetQueryObjectuiv(GLuint id, GLenum pname, GLuint* params);
void glGetQueryiv(GLenum target, GLenum pname, GLint* params);
}  // extern "C"

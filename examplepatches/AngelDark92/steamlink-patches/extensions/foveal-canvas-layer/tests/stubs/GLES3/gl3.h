#pragma once
using GLenum = unsigned int;
using GLuint = unsigned int;
using GLint = int;
using GLsizei = int;
using GLbitfield = unsigned int;
using GLboolean = unsigned char;
using GLfloat = float;
#define GL_TRUE 1
#define GL_NO_ERROR 0
#define GL_INVALID_OPERATION 0x0502
#define GL_TEXTURE_2D 0x0DE1
#define GL_TEXTURE_MIN_FILTER 0x2801
#define GL_TEXTURE_MAG_FILTER 0x2800
#define GL_TEXTURE_WRAP_S 0x2802
#define GL_TEXTURE_WRAP_T 0x2803
#define GL_LINEAR 0x2601
#define GL_NEAREST 0x2600
#define GL_CLAMP_TO_EDGE 0x812F
#define GL_READ_FRAMEBUFFER 0x8CA8
#define GL_DRAW_FRAMEBUFFER 0x8CA9
#define GL_COLOR_ATTACHMENT0 0x8CE0
#define GL_FRAMEBUFFER_COMPLETE 0x8CD5
#define GL_SCISSOR_TEST 0x0C11
#define GL_COLOR_BUFFER_BIT 0x00004000
#define GL_SRGB8_ALPHA8 0x8C43
#define GL_RGBA8 0x8058
#define GL_RGB10_A2 0x8059
extern "C" {
GLenum glGetError();
void glGenFramebuffers(GLsizei, GLuint*);
void glDeleteFramebuffers(GLsizei, const GLuint*);
void glGenTextures(GLsizei, GLuint*);
void glDeleteTextures(GLsizei, const GLuint*);
void glBindTexture(GLenum, GLuint);
void glTexStorage2D(GLenum, GLsizei, GLenum, GLsizei, GLsizei);
void glTexParameteri(GLenum, GLenum, GLint);
void glBindFramebuffer(GLenum, GLuint);
void glFramebufferTexture2D(GLenum, GLenum, GLenum, GLuint, GLint);
GLenum glCheckFramebufferStatus(GLenum);
void glDisable(GLenum);
void glBlitFramebuffer(GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum);
void glFinish();
void glColorMask(GLboolean, GLboolean, GLboolean, GLboolean);
void glClearColor(GLfloat, GLfloat, GLfloat, GLfloat);
void glClear(GLbitfield);
}

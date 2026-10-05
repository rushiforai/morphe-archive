#pragma once
// Host test ABI declarations only; shipping target uses Android NDK headers.
using EGLDisplay = void*;
using EGLConfig = void*;
using EGLContext = void*;
using EGLSurface = void*;
using EGLint = int;
using EGLBoolean = unsigned int;
using EGLenum = unsigned int;
#define EGL_NO_DISPLAY nullptr
#define EGL_NO_CONTEXT nullptr
#define EGL_NO_SURFACE nullptr
#define EGL_TRUE 1
#define EGL_FALSE 0
#define EGL_DRAW 0x3059
#define EGL_READ 0x305A
#define EGL_CONTEXT_CLIENT_VERSION 0x3098
#define EGL_NONE 0x3038
#define EGL_WIDTH 0x3057
#define EGL_HEIGHT 0x3056
extern "C" {
EGLDisplay eglGetCurrentDisplay();
EGLContext eglGetCurrentContext();
EGLSurface eglGetCurrentSurface(EGLint);
EGLContext eglCreateContext(EGLDisplay, EGLConfig, EGLContext, const EGLint*);
EGLSurface eglCreatePbufferSurface(EGLDisplay, EGLConfig, const EGLint*);
EGLBoolean eglMakeCurrent(EGLDisplay, EGLSurface, EGLSurface, EGLContext);
EGLBoolean eglDestroyContext(EGLDisplay, EGLContext);
EGLBoolean eglDestroySurface(EGLDisplay, EGLSurface);
}

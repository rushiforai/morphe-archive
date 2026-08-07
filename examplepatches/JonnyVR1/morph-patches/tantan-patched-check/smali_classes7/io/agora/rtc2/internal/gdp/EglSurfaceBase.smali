.class public Lio/agora/rtc2/internal/gdp/EglSurfaceBase;
.super Ljava/lang/Object;


# static fields
.field protected static final TAG:Ljava/lang/String; = "EglSurfaceBase"


# instance fields
.field private mEGLSurface:Landroid/opengl/EGLSurface;

.field protected mEglCore:Lio/agora/rtc2/internal/gdp/EglCore;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/gdp/EglCore;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    iput-object p1, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEglCore:Lio/agora/rtc2/internal/gdp/EglCore;

    return-void
.end method


# virtual methods
.method public createOffscreenSurface(II)V
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEglCore:Lio/agora/rtc2/internal/gdp/EglCore;

    invoke-virtual {v0, p1, p2}, Lio/agora/rtc2/internal/gdp/EglCore;->createOffscreenSurface(II)Landroid/opengl/EGLSurface;

    move-result-object p1

    iput-object p1, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    return-void

    :cond_0
    const-string p0, "surface already created"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public makeCurrent()V
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEglCore:Lio/agora/rtc2/internal/gdp/EglCore;

    iget-object p0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, p0}, Lio/agora/rtc2/internal/gdp/EglCore;->makeCurrent(Landroid/opengl/EGLSurface;)V

    return-void
.end method

.method public releaseEglSurface()V
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEglCore:Lio/agora/rtc2/internal/gdp/EglCore;

    iget-object v1, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Lio/agora/rtc2/internal/gdp/EglCore;->releaseSurface(Landroid/opengl/EGLSurface;)V

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lio/agora/rtc2/internal/gdp/EglSurfaceBase;->mEGLSurface:Landroid/opengl/EGLSurface;

    return-void
.end method

.class public Lio/agora/base/internal/video/EglBase14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/EglBase;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/video/EglBase14$Context;
    }
.end annotation


# static fields
.field private static final CURRENT_SDK_VERSION:I

.field private static final EGLExt_SDK_VERSION:I = 0x12

.field private static final TAG:Ljava/lang/String; = "EglBase14"


# instance fields
.field private eglConfig:Landroid/opengl/EGLConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private eglContext:Landroid/opengl/EGLContext;

.field private eglDisplay:Landroid/opengl/EGLDisplay;

.field private eglSurface:Landroid/opengl/EGLSurface;

.field private mIsDisplay:Z

.field private transferID:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    sput v0, Lio/agora/base/internal/video/EglBase14;->CURRENT_SDK_VERSION:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase14$Context;IZLio/agora/base/internal/video/EglBase$EglConfigType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 5
    .line 6
    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 9
    .line 10
    invoke-virtual {v0}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 11
    .line 12
    .line 13
    iput p2, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 14
    .line 15
    iput-boolean p3, p0, Lio/agora/base/internal/video/EglBase14;->mIsDisplay:Z

    .line 16
    .line 17
    invoke-virtual {p4}, Lio/agora/base/internal/video/EglBase$EglConfigType;->getEglConfigAttributes()[I

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    iget v0, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 22
    .line 23
    invoke-static {v0}, Lio/agora/base/internal/video/HdrUtil;->isDirectHdrVision(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    if-eqz p3, :cond_2

    .line 30
    .line 31
    iget p3, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 32
    .line 33
    invoke-static {p3}, Lio/agora/base/internal/video/HdrUtil;->isDisplayHdrVision(I)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_2

    .line 38
    .line 39
    :cond_0
    invoke-static {}, Lio/agora/base/internal/video/HdrUtil;->isSupportedEGL3()Z

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    sget-object p4, Lio/agora/base/internal/video/EglBase;->EGL_CONFIG_ATTRIBUTES_RGBA_1010102_EGL30:[I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    sget-object p4, Lio/agora/base/internal/video/EglBase;->EGL_CONFIG_ATTRIBUTES_RGBA_1010102:[I

    .line 49
    .line 50
    :cond_2
    :goto_0
    invoke-static {}, Lio/agora/base/internal/video/EglBase14;->getEglDisplay()Landroid/opengl/EGLDisplay;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iput-object p3, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 55
    .line 56
    invoke-static {p3, p4}, Lio/agora/base/internal/video/EglBase14;->getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iput-object p3, p0, Lio/agora/base/internal/video/EglBase14;->eglConfig:Landroid/opengl/EGLConfig;

    .line 61
    .line 62
    iget-object p4, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 63
    .line 64
    invoke-static {p1, p4, p3, p2}, Lio/agora/base/internal/video/EglBase14;->createEglContext(Lio/agora/base/internal/video/EglBase14$Context;Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;I)Landroid/opengl/EGLContext;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 69
    .line 70
    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/video/EglBase14$Context;[I)V
    .locals 2

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 73
    sget-object v0, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->Unspecified:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    move-result v0

    iput v0, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 74
    invoke-static {}, Lio/agora/base/internal/video/EglBase14;->getEglDisplay()Landroid/opengl/EGLDisplay;

    move-result-object v0

    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 75
    invoke-static {v0, p2}, Lio/agora/base/internal/video/EglBase14;->getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;

    move-result-object p2

    iput-object p2, p0, Lio/agora/base/internal/video/EglBase14;->eglConfig:Landroid/opengl/EGLConfig;

    .line 76
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    const/4 v1, 0x0

    invoke-static {p1, v0, p2, v1}, Lio/agora/base/internal/video/EglBase14;->createEglContext(Lio/agora/base/internal/video/EglBase14$Context;Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;I)Landroid/opengl/EGLContext;

    move-result-object p1

    iput-object p1, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    return-void
.end method

.method public static synthetic access$000()I
    .locals 1

    .line 1
    sget v0, Lio/agora/base/internal/video/EglBase14;->CURRENT_SDK_VERSION:I

    .line 2
    .line 3
    return v0
.end method

.method private checkIsNotReleased()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 2
    .line 3
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 8
    .line 9
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 10
    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglConfig:Landroid/opengl/EGLConfig;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "This object has been released"

    .line 19
    .line 20
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private static createEglContext(Lio/agora/base/internal/video/EglBase14$Context;Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;I)Landroid/opengl/EGLContext;
    .locals 3
    .param p0    # Lio/agora/base/internal/video/EglBase14$Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    invoke-static {p0}, Lio/agora/base/internal/video/EglBase14$Context;->access$100(Lio/agora/base/internal/video/EglBase14$Context;)Landroid/opengl/EGLContext;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 9
    .line 10
    if-eq v1, v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p0, "Invalid sharedContext"

    .line 14
    .line 15
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    :goto_0
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglBase14$Context;->getGlesVersion()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    goto :goto_1

    .line 26
    :cond_2
    const/4 v1, 0x2

    .line 27
    :goto_1
    invoke-static {p3}, Lio/agora/base/internal/video/HdrUtil;->is10BitLumaDepth(I)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_3

    .line 32
    .line 33
    invoke-static {p3}, Lio/agora/base/internal/video/HdrUtil;->isNeedTransToHdrVision(I)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_4

    .line 38
    .line 39
    :cond_3
    invoke-static {}, Lio/agora/base/internal/video/HdrUtil;->isSupportedEGL3()Z

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_4

    .line 44
    .line 45
    const/4 v1, 0x3

    .line 46
    :cond_4
    const/16 p3, 0x3098

    .line 47
    .line 48
    const/16 v2, 0x3038

    .line 49
    .line 50
    filled-new-array {p3, v1, v2}, [I

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    if-nez p0, :cond_5

    .line 55
    .line 56
    sget-object p0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_5
    invoke-static {p0}, Lio/agora/base/internal/video/EglBase14$Context;->access$100(Lio/agora/base/internal/video/EglBase14$Context;)Landroid/opengl/EGLContext;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    :goto_2
    sget-object v1, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 64
    .line 65
    monitor-enter v1

    .line 66
    const/4 v2, 0x0

    .line 67
    :try_start_0
    invoke-static {p1, p2, p0, p3, v2}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    sget-object p1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 73
    .line 74
    if-eq p0, p1, :cond_6

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_6
    const-string p0, "Failed to create EGL context: 0x"

    .line 78
    .line 79
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p0, p1}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-object v0

    .line 91
    :catchall_0
    move-exception p0

    .line 92
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    throw p0
.end method

.method private createSurfaceInternal(Ljava/lang/Object;)V
    .locals 4

    .line 1
    instance-of v0, p1, Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p1, Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "Input must be either a Surface or SurfaceTexture"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    invoke-direct {p0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglBase14;->hasSurface()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_7

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    new-array v0, v0, [I

    .line 27
    .line 28
    const/16 v1, 0x3038

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    aput v1, v0, v2

    .line 32
    .line 33
    iget v1, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 34
    .line 35
    invoke-static {v1}, Lio/agora/base/internal/video/HdrUtil;->isDirectHdrVision(I)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-boolean v1, p0, Lio/agora/base/internal/video/EglBase14;->mIsDisplay:Z

    .line 42
    .line 43
    if-eqz v1, :cond_5

    .line 44
    .line 45
    iget v1, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 46
    .line 47
    invoke-static {v1}, Lio/agora/base/internal/video/HdrUtil;->isDisplayHdrVision(I)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_5

    .line 52
    .line 53
    :cond_2
    iget v1, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 54
    .line 55
    sget-object v3, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTEST2084:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 56
    .line 57
    invoke-virtual {v3}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-ne v1, v3, :cond_3

    .line 62
    .line 63
    sget-object v0, Lio/agora/base/internal/video/EglBase;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_PQ:[I

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    iget v1, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 67
    .line 68
    sget-object v3, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->ARIB_STD_B67:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 69
    .line 70
    invoke-virtual {v3}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-ne v1, v3, :cond_4

    .line 75
    .line 76
    sget-object v0, Lio/agora/base/internal/video/EglBase;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_PQ:[I

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    iget v1, p0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 80
    .line 81
    invoke-static {v1}, Lio/agora/base/internal/video/HdrUtil;->isNeedTransToHdrVision(I)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    sget-object v0, Lio/agora/base/internal/video/EglBase;->EGL_WINDOW_SURFACE_ATTRIBUTES_BT2020_PQ:[I

    .line 88
    .line 89
    :cond_5
    :goto_1
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 90
    .line 91
    iget-object v3, p0, Lio/agora/base/internal/video/EglBase14;->eglConfig:Landroid/opengl/EGLConfig;

    .line 92
    .line 93
    invoke-static {v1, v3, p1, v0, v2}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 98
    .line 99
    sget-object p0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 100
    .line 101
    if-eq p1, p0, :cond_6

    .line 102
    .line 103
    return-void

    .line 104
    :cond_6
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string p1, "Failed to create window surface: 0x"

    .line 113
    .line 114
    invoke-static {p1, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_7
    const-string p0, "Already has an EGLSurface"

    .line 119
    .line 120
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private static getEglConfig(Landroid/opengl/EGLDisplay;[I)Landroid/opengl/EGLConfig;
    .locals 8

    .line 1
    const/4 v5, 0x1

    .line 2
    new-array v3, v5, [Landroid/opengl/EGLConfig;

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    new-array v6, v0, [I

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v7, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    move-object v0, p0

    .line 11
    move-object v1, p1

    .line 12
    invoke-static/range {v0 .. v7}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 p1, 0x0

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    aget v0, v6, p0

    .line 21
    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    aget-object p0, v3, p0

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const-string p0, "eglChooseConfig returned null"

    .line 30
    .line 31
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :cond_1
    const-string p0, "Unable to find any matching EGL config"

    .line 36
    .line 37
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object p1

    .line 41
    :cond_2
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "eglChooseConfig failed: 0x"

    .line 50
    .line 51
    invoke-static {v0, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-object p1
.end method

.method private static getEglDisplay()Landroid/opengl/EGLDisplay;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    if-eq v1, v2, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    new-array v2, v2, [I

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-static {v1, v2, v0, v2, v3}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "Unable to initialize EGL14: 0x"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    const/4 v0, 0x0

    .line 35
    return-object v0

    .line 36
    :cond_1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "Unable to get EGL14 display: 0x"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0
.end method

.method public static isEGL14Supported()Z
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SDK version: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v1, Lio/agora/base/internal/video/EglBase14;->CURRENT_SDK_VERSION:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ". isEGL14Supported: "

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-lt v1, v2, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "EglBase14"

    .line 33
    .line 34
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lio/agora/base/internal/video/EglBase14;->isEGL14SupportedImpl()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    return v0
.end method

.method public static isEGL14SupportedImpl()Z
    .locals 2

    .line 1
    sget v0, Lio/agora/base/internal/video/EglBase14;->CURRENT_SDK_VERSION:I

    .line 2
    .line 3
    const/16 v1, 0x12

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method


# virtual methods
.method public createDummyPbufferSurface()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, v0}, Lio/agora/base/internal/video/EglBase14;->createPbufferSurface(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public createPbufferSurface(II)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lio/agora/base/internal/video/EglBase14;->hasSurface()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_5

    .line 11
    .line 12
    const/4 v1, 0x5

    .line 13
    new-array v2, v1, [I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/16 v4, 0x3057

    .line 17
    .line 18
    aput v4, v2, v3

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    aput p1, v2, v5

    .line 22
    .line 23
    const/4 v6, 0x2

    .line 24
    const/16 v7, 0x3056

    .line 25
    .line 26
    aput v7, v2, v6

    .line 27
    .line 28
    const/4 v8, 0x3

    .line 29
    aput p2, v2, v8

    .line 30
    .line 31
    const/4 v9, 0x4

    .line 32
    const/16 v10, 0x3038

    .line 33
    .line 34
    aput v10, v2, v9

    .line 35
    .line 36
    iget v11, v0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 37
    .line 38
    invoke-static {v11}, Lio/agora/base/internal/video/HdrUtil;->isDirectHdrVision(I)Z

    .line 39
    .line 40
    .line 41
    move-result v11

    .line 42
    if-nez v11, :cond_0

    .line 43
    .line 44
    iget-boolean v11, v0, Lio/agora/base/internal/video/EglBase14;->mIsDisplay:Z

    .line 45
    .line 46
    if-eqz v11, :cond_3

    .line 47
    .line 48
    iget v11, v0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 49
    .line 50
    invoke-static {v11}, Lio/agora/base/internal/video/HdrUtil;->isDisplayHdrVision(I)Z

    .line 51
    .line 52
    .line 53
    move-result v11

    .line 54
    if-eqz v11, :cond_3

    .line 55
    .line 56
    :cond_0
    iget v11, v0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 57
    .line 58
    sget-object v12, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->SMPTEST2084:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 59
    .line 60
    invoke-virtual {v12}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 61
    .line 62
    .line 63
    move-result v12

    .line 64
    const/4 v13, 0x6

    .line 65
    const/16 v14, 0x3340

    .line 66
    .line 67
    const/16 v15, 0x309d

    .line 68
    .line 69
    move/from16 v16, v1

    .line 70
    .line 71
    const/4 v1, 0x7

    .line 72
    if-ne v11, v12, :cond_1

    .line 73
    .line 74
    new-array v2, v1, [I

    .line 75
    .line 76
    aput v4, v2, v3

    .line 77
    .line 78
    aput p1, v2, v5

    .line 79
    .line 80
    aput v7, v2, v6

    .line 81
    .line 82
    aput p2, v2, v8

    .line 83
    .line 84
    aput v15, v2, v9

    .line 85
    .line 86
    aput v14, v2, v16

    .line 87
    .line 88
    aput v10, v2, v13

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    iget v11, v0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 92
    .line 93
    sget-object v12, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->ARIB_STD_B67:Lio/agora/base/VideoFrame$ColorSpace$Transfer;

    .line 94
    .line 95
    invoke-virtual {v12}, Lio/agora/base/VideoFrame$ColorSpace$Transfer;->getTransfer()I

    .line 96
    .line 97
    .line 98
    move-result v12

    .line 99
    if-ne v11, v12, :cond_2

    .line 100
    .line 101
    new-array v2, v1, [I

    .line 102
    .line 103
    aput v4, v2, v3

    .line 104
    .line 105
    aput p1, v2, v5

    .line 106
    .line 107
    aput v7, v2, v6

    .line 108
    .line 109
    aput p2, v2, v8

    .line 110
    .line 111
    aput v15, v2, v9

    .line 112
    .line 113
    aput v14, v2, v16

    .line 114
    .line 115
    aput v10, v2, v13

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    iget v11, v0, Lio/agora/base/internal/video/EglBase14;->transferID:I

    .line 119
    .line 120
    invoke-static {v11}, Lio/agora/base/internal/video/HdrUtil;->isNeedTransToHdrVision(I)Z

    .line 121
    .line 122
    .line 123
    move-result v11

    .line 124
    if-eqz v11, :cond_3

    .line 125
    .line 126
    new-array v2, v1, [I

    .line 127
    .line 128
    aput v4, v2, v3

    .line 129
    .line 130
    aput p1, v2, v5

    .line 131
    .line 132
    aput v7, v2, v6

    .line 133
    .line 134
    aput p2, v2, v8

    .line 135
    .line 136
    aput v15, v2, v9

    .line 137
    .line 138
    aput v14, v2, v16

    .line 139
    .line 140
    aput v10, v2, v13

    .line 141
    .line 142
    :cond_3
    :goto_0
    iget-object v1, v0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 143
    .line 144
    iget-object v4, v0, Lio/agora/base/internal/video/EglBase14;->eglConfig:Landroid/opengl/EGLConfig;

    .line 145
    .line 146
    invoke-static {v1, v4, v2, v3}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iput-object v1, v0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 151
    .line 152
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 153
    .line 154
    if-eq v1, v0, :cond_4

    .line 155
    .line 156
    return-void

    .line 157
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    const-string v1, "Failed to create pixel buffer surface with size "

    .line 166
    .line 167
    const-string v3, "x"

    .line 168
    .line 169
    const-string v5, ": 0x"

    .line 170
    .line 171
    move/from16 v2, p1

    .line 172
    .line 173
    move/from16 v4, p2

    .line 174
    .line 175
    invoke-static/range {v1 .. v6}, Ll/fse;->a(Ljava/lang/String;ILjava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_5
    const-string v0, "Already has an EGLSurface"

    .line 180
    .line 181
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public createSurface(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lio/agora/base/internal/video/EglBase14;->createSurfaceInternal(Ljava/lang/Object;)V

    return-void
.end method

.method public createSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lio/agora/base/internal/video/EglBase14;->createSurfaceInternal(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public detachCurrent()V
    .locals 4

    .line 1
    const-string v0, "eglDetachCurrent failed: 0x"

    .line 2
    .line 3
    sget-object v1, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 7
    .line 8
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 9
    .line 10
    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 11
    .line 12
    invoke-static {p0, v2, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    monitor-exit v1

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public bridge synthetic getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;
    .locals 0

    .line 9
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglBase14;->getEglBaseContext()Lio/agora/base/internal/video/EglBase14$Context;

    move-result-object p0

    return-object p0
.end method

.method public getEglBaseContext()Lio/agora/base/internal/video/EglBase14$Context;
    .locals 1

    .line 1
    new-instance v0, Lio/agora/base/internal/video/EglBase14$Context;

    .line 2
    .line 3
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lio/agora/base/internal/video/EglBase14$Context;-><init>(Landroid/opengl/EGLContext;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public hasSurface()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public makeCurrent()V
    .locals 5

    .line 1
    const-string v0, "eglMakeCurrent failed: 0x"

    .line 2
    .line 3
    invoke-direct {p0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 9
    .line 10
    if-eq v1, v2, :cond_1

    .line 11
    .line 12
    sget-object v1, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 16
    .line 17
    iget-object v3, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 18
    .line 19
    iget-object v4, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 20
    .line 21
    invoke-static {v2, v3, v3, v4}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    monitor-exit v1

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    new-instance v3, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, ", eglDisplay: "

    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v0, ", eglSurface:"

    .line 60
    .line 61
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 65
    .line 66
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v0, ", eglContext:"

    .line 70
    .line 71
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 75
    .line 76
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-direct {v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw v2

    .line 87
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    throw p0

    .line 89
    :cond_1
    const-string p0, "No EGLSurface - can\'t make current"

    .line 90
    .line 91
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public release()V
    .locals 4

    .line 1
    const-string v0, "EglBase14"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "release()"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglBase14;->releaseSurface()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lio/agora/base/internal/video/EglBase14;->detachCurrent()V

    .line 27
    .line 28
    .line 29
    sget-object v0, Lio/agora/base/internal/video/EglBase;->rwlock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 36
    .line 37
    .line 38
    :try_start_0
    sget-object v1, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 41
    :try_start_1
    iget-object v2, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 42
    .line 43
    iget-object v3, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 44
    .line 45
    invoke-static {v2, v3}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 46
    .line 47
    .line 48
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 62
    .line 63
    .line 64
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 65
    .line 66
    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglContext:Landroid/opengl/EGLContext;

    .line 67
    .line 68
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    .line 69
    .line 70
    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 71
    .line 72
    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglConfig:Landroid/opengl/EGLConfig;

    .line 74
    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 79
    :catchall_1
    move-exception p0

    .line 80
    sget-object v0, Lio/agora/base/internal/video/EglBase;->rwlock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 87
    .line 88
    .line 89
    throw p0
.end method

.method public releaseSurface()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 2
    .line 3
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 10
    .line 11
    .line 12
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 13
    .line 14
    iput-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setPresentationTime(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 5
    .line 6
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 11
    .line 12
    invoke-static {p0, v0, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "No EGLSurface can\'t swap buffers"

    .line 17
    .line 18
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public surfaceHeight()I
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    const/16 v2, 0x3056

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static {v1, p0, v2, v0, v3}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 12
    .line 13
    .line 14
    aget p0, v0, v3

    .line 15
    .line 16
    return p0
.end method

.method public surfaceWidth()I
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 5
    .line 6
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    const/16 v2, 0x3057

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static {v1, p0, v2, v0, v3}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 12
    .line 13
    .line 14
    aget p0, v0, v3

    .line 15
    .line 16
    return p0
.end method

.method public swapBuffers()V
    .locals 2

    .line 38
    invoke-direct {p0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 39
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 40
    sget-object v0, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 41
    :try_start_0
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    invoke-static {v1, p0}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 42
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 43
    :cond_0
    const-string p0, "No EGLSurface - can\'t swap buffers"

    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public swapBuffers(J)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/EglBase14;->checkIsNotReleased()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 5
    .line 6
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    sget-object v0, Lio/agora/base/internal/video/EglBase;->lock:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 14
    .line 15
    iget-object v2, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 16
    .line 17
    invoke-static {v1, v2, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lio/agora/base/internal/video/EglBase14;->eglDisplay:Landroid/opengl/EGLDisplay;

    .line 21
    .line 22
    iget-object p0, p0, Lio/agora/base/internal/video/EglBase14;->eglSurface:Landroid/opengl/EGLSurface;

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 25
    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0

    .line 32
    :cond_0
    const-string p0, "No EGLSurface - can\'t swap buffers"

    .line 33
    .line 34
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

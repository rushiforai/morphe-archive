.class final Lcom/momo/xeengine/game/XEngineRenderThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# static fields
.field private static final CONFIG_ATTRIBS:[I

.field private static final CONTEXT_ATTRIBS:[I

.field private static final EGL_CONTEXT_CLIENT_VERSION:I = 0x3098


# instance fields
.field private final configs:[Ljavax/microedition/khronos/egl/EGLConfig;

.field private mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field private mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private final mEventQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mHeight:I

.field private mRender:Lcom/momo/xeengine/game/IXRender;

.field private mWidth:I

.field private nativeWindow:Ljava/lang/Object;

.field private running:Z

.field private final syncSurfaceCreate:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    const/16 v1, 0x3038

    .line 3
    .line 4
    const/16 v2, 0x3098

    .line 5
    .line 6
    filled-new-array {v2, v0, v1}, [I

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/momo/xeengine/game/XEngineRenderThread;->CONTEXT_ATTRIBS:[I

    .line 11
    .line 12
    const/16 v0, 0x11

    .line 13
    .line 14
    new-array v0, v0, [I

    .line 15
    .line 16
    fill-array-data v0, :array_0

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/momo/xeengine/game/XEngineRenderThread;->CONFIG_ATTRIBS:[I

    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :array_0
    .array-data 4
        0x3020
        0x20
        0x3021
        0x8
        0x3022
        0x8
        0x3023
        0x8
        0x3024
        0x8
        0x3025
        0x10
        0x3040
        0x4
        0x3033
        0x4
        0x3038
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/Object;Lcom/momo/xeengine/game/IXRender;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->syncSurfaceCreate:Z

    .line 6
    .line 7
    new-instance v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    new-array v1, v1, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->configs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mWidth:I

    .line 23
    .line 24
    iput v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mHeight:I

    .line 25
    .line 26
    const-class v0, Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->nativeWindow:Ljava/lang/Object;

    .line 36
    .line 37
    iput-object p2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 38
    .line 39
    return-void
.end method

.method private ThrowException(ZLjava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "Reset gl "

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "Init gl "

    .line 7
    .line 8
    :goto_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p1, " error:"

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 27
    .line 28
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-static {p0}, Landroid/opengl/GLUtils;->getEGLErrorString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method public static synthetic a(Lcom/momo/xeengine/game/XEngineRenderThread;II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mWidth:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mHeight:I

    .line 6
    .line 7
    if-eq v0, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mWidth:I

    .line 12
    .line 13
    iput p2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mHeight:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 16
    .line 17
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/game/IXRender;->onGLRenderSizeChanged(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/game/XEngineRenderThread;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->nativeWindow:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-direct {p0, p1}, Lcom/momo/xeengine/game/XEngineRenderThread;->initGLEnv(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Lcom/momo/xeengine/game/XEngineRenderThread;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->nativeWindow:Ljava/lang/Object;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 5
    .line 6
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 7
    .line 8
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 9
    .line 10
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 11
    .line 12
    invoke-interface {v1, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 13
    .line 14
    .line 15
    :try_start_0
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 20
    .line 21
    invoke-interface {v1, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :catch_0
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private initGLEnv(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 14
    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 18
    .line 19
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 26
    .line 27
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 28
    .line 29
    if-ne v0, v1, :cond_1

    .line 30
    .line 31
    const-string v0, "eglGetDisplay"

    .line 32
    .line 33
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    const/4 v0, 0x2

    .line 37
    new-array v0, v0, [I

    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 42
    .line 43
    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    const-string v0, "eglInitialize"

    .line 50
    .line 51
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 57
    .line 58
    sget-object v3, Lcom/momo/xeengine/game/XEngineRenderThread;->CONFIG_ATTRIBS:[I

    .line 59
    .line 60
    iget-object v4, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->configs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    new-array v6, v0, [I

    .line 64
    .line 65
    const/4 v5, 0x1

    .line 66
    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    const-string v0, "eglChooseConfig"

    .line 73
    .line 74
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    if-nez v0, :cond_5

    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 83
    .line 84
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 85
    .line 86
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->configs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 87
    .line 88
    aget-object v3, v3, v1

    .line 89
    .line 90
    sget-object v4, Lcom/momo/xeengine/game/XEngineRenderThread;->CONTEXT_ATTRIBS:[I

    .line 91
    .line 92
    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 93
    .line 94
    invoke-interface {v0, v2, v3, v5, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 99
    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    if-ne v0, v5, :cond_5

    .line 103
    .line 104
    :cond_4
    const-string v0, "eglCreateContext"

    .line 105
    .line 106
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_5
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 110
    .line 111
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 112
    .line 113
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->configs:[Ljavax/microedition/khronos/egl/EGLConfig;

    .line 114
    .line 115
    aget-object v1, v3, v1

    .line 116
    .line 117
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->nativeWindow:Ljava/lang/Object;

    .line 118
    .line 119
    const/4 v4, 0x0

    .line 120
    invoke-interface {v0, v2, v1, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 125
    .line 126
    if-nez v0, :cond_6

    .line 127
    .line 128
    const-string v0, "eglCreateWindowSurface1"

    .line 129
    .line 130
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_6
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 134
    .line 135
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 136
    .line 137
    if-ne v0, v1, :cond_7

    .line 138
    .line 139
    const-string v0, "eglCreateWindowSurface2"

    .line 140
    .line 141
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_7
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 147
    .line 148
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 149
    .line 150
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 151
    .line 152
    invoke-interface {v0, v1, v2, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-nez v0, :cond_8

    .line 157
    .line 158
    const-string v0, "eglMakeCurrent"

    .line 159
    .line 160
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->ThrowException(ZLjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_8
    return-void
.end method

.method private swapBuffers()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 6
    .line 7
    invoke-interface {v0, v1, p0}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    :catchall_0
    return-void
.end method


# virtual methods
.method public destroyNativeWindow()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 8
    .line 9
    new-instance v2, Lcom/momo/xeengine/game/f;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/momo/xeengine/game/f;-><init>(Lcom/momo/xeengine/game/XEngineRenderThread;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onSizeChanged(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/xeengine/game/e;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/momo/xeengine/game/e;-><init>(Lcom/momo/xeengine/game/XEngineRenderThread;II)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public requestStop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->running:Z

    .line 3
    .line 4
    return-void
.end method

.method public resetNativeWindow(Ljava/lang/Object;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 8
    .line 9
    new-instance v2, Lcom/momo/xeengine/game/d;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1, v0}, Lcom/momo/xeengine/game/d;-><init>(Lcom/momo/xeengine/game/XEngineRenderThread;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-direct {p0, v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->initGLEnv(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->running:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/momo/xeengine/game/IXRender;->onGLEnvCreated()V

    .line 11
    .line 12
    .line 13
    :goto_0
    iget-boolean v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->running:Z

    .line 14
    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    :cond_0
    :goto_1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEventQueue:Ljava/util/Queue;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Runnable;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    monitor-enter p0

    .line 40
    :try_start_1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mWidth:I

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mHeight:I

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 55
    .line 56
    invoke-interface {v0, v1}, Lcom/momo/xeengine/game/IXRender;->onGLDrawFrame(Ljavax/microedition/khronos/egl/EGL10;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/momo/xeengine/game/XEngineRenderThread;->swapBuffers()V

    .line 63
    .line 64
    .line 65
    goto :goto_2

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    goto :goto_3

    .line 68
    :cond_2
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 69
    .line 70
    invoke-interface {v0}, Lcom/momo/xeengine/game/IXRender;->onBackgroundFrame()V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_2
    monitor-exit p0

    .line 74
    goto :goto_0

    .line 75
    :goto_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    throw v0

    .line 77
    :cond_4
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 78
    .line 79
    invoke-interface {v0}, Lcom/momo/xeengine/game/IXRender;->onGLEnvRelease()V

    .line 80
    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    :try_start_2
    invoke-static {v0, v0, v0, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 84
    .line 85
    .line 86
    const/16 v0, 0x4100

    .line 87
    .line 88
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 94
    .line 95
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 96
    .line 97
    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 98
    .line 99
    .line 100
    :catchall_1
    const/4 v0, 0x0

    .line 101
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 102
    .line 103
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 104
    .line 105
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 106
    .line 107
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 108
    .line 109
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    .line 110
    .line 111
    invoke-interface {v1, v2, v3, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 112
    .line 113
    .line 114
    :try_start_3
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 115
    .line 116
    if-eqz v1, :cond_5

    .line 117
    .line 118
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 119
    .line 120
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 121
    .line 122
    invoke-interface {v2, v3, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 126
    .line 127
    :catch_0
    :cond_5
    iget-object v1, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 128
    .line 129
    iget-object v2, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 130
    .line 131
    iget-object v3, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 132
    .line 133
    invoke-interface {v1, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 137
    .line 138
    return-void

    .line 139
    :catchall_2
    move-exception v0

    .line 140
    iget-object p0, p0, Lcom/momo/xeengine/game/XEngineRenderThread;->mRender:Lcom/momo/xeengine/game/IXRender;

    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-interface {p0, v0}, Lcom/momo/xeengine/game/IXRender;->onGLEnvCreatedFailed(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

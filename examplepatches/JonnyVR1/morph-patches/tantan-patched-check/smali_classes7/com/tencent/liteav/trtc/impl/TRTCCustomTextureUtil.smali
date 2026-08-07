.class public Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "TRTCCustomTextureUtil"


# instance fields
.field private mCaptureAndEnc:Lcom/tencent/liteav/d;

.field private mEGLContext:Ljava/lang/Object;

.field private mEGLThread:Landroid/os/HandlerThread;

.field private mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

.field private mI4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

.field private mLastGLThreadId:J

.field private mRotateFilter:Lcom/tencent/liteav/basic/c/h;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLThread:Landroid/os/HandlerThread;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLContext:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mI4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->checkRotate(ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$100(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;)Lcom/tencent/liteav/beauty/b/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mI4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Lcom/tencent/liteav/beauty/b/k;)Lcom/tencent/liteav/beauty/b/k;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mI4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private apiLog(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "trtc_api "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "TRTCCustomTextureUtil"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private checkEGLContext(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mLastGLThreadId:J

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext10:Ljavax/microedition/khronos/egl/EGLContext;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLContext:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    xor-int/lit8 v1, v0, 0x1

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    const-string v0, "CustomCapture egl10Context change!"

    .line 38
    .line 39
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext14:Landroid/opengl/EGLContext;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLContext:Ljava/lang/Object;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    xor-int/lit8 v1, v0, 0x1

    .line 55
    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    const-string v0, "CustomCapture egl14Context change!"

    .line 59
    .line 60
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    const-string v0, "CustomCapture eglContext\'s thread change!"

    .line 65
    .line 66
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const/4 v1, 0x1

    .line 70
    :cond_3
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 75
    .line 76
    .line 77
    move-result-wide v2

    .line 78
    iput-wide v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mLastGLThreadId:J

    .line 79
    .line 80
    iget-object v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 81
    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    iget-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext10:Ljavax/microedition/khronos/egl/EGLContext;

    .line 85
    .line 86
    if-eqz v2, :cond_4

    .line 87
    .line 88
    iput-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLContext:Ljava/lang/Object;

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    iget-object v0, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext14:Landroid/opengl/EGLContext;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLContext:Ljava/lang/Object;

    .line 94
    .line 95
    :cond_5
    :goto_1
    if-eqz v1, :cond_6

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->stopThread()V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->startThread(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V

    .line 101
    .line 102
    .line 103
    :cond_6
    :goto_2
    return-void
.end method

.method private checkRotate(ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)I
    .locals 13

    .line 1
    if-eqz p2, :cond_6

    .line 2
    .line 3
    iget v0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->rotation:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_4

    .line 8
    :cond_0
    const/16 v1, 0x5a

    .line 9
    .line 10
    mul-int/2addr v0, v1

    .line 11
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mRotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 12
    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    new-instance v2, Lcom/tencent/liteav/basic/c/h;

    .line 16
    .line 17
    invoke-direct {v2}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 21
    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-virtual {v2, v3}, Lcom/tencent/liteav/basic/c/h;->a(Z)V

    .line 25
    .line 26
    .line 27
    iget v3, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 28
    .line 29
    iget v4, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 30
    .line 31
    invoke-virtual {v2, v3, v4}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mRotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 35
    .line 36
    :cond_1
    iget-object v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mRotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 37
    .line 38
    if-eqz v5, :cond_6

    .line 39
    .line 40
    iget p0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 41
    .line 42
    iget v2, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-static {v3, v3, p0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 46
    .line 47
    .line 48
    rsub-int p0, v0, 0x2d0

    .line 49
    .line 50
    rem-int/lit16 v8, p0, 0x168

    .line 51
    .line 52
    iget p0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 53
    .line 54
    iget v0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 55
    .line 56
    invoke-virtual {v5, p0, v0}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 57
    .line 58
    .line 59
    iget v6, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 60
    .line 61
    iget v7, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 62
    .line 63
    int-to-float p0, v6

    .line 64
    int-to-float v0, v7

    .line 65
    div-float v10, p0, v0

    .line 66
    .line 67
    const/4 v11, 0x0

    .line 68
    const/4 v12, 0x0

    .line 69
    const/4 v9, 0x0

    .line 70
    invoke-virtual/range {v5 .. v12}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v5, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5}, Lcom/tencent/liteav/basic/c/h;->l()I

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    const/16 p1, 0x10e

    .line 81
    .line 82
    if-eq v8, v1, :cond_3

    .line 83
    .line 84
    if-ne v8, p1, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    iget v0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    :goto_0
    iget v0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 91
    .line 92
    :goto_1
    if-eq v8, v1, :cond_5

    .line 93
    .line 94
    if-ne v8, p1, :cond_4

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_4
    iget p1, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_5
    :goto_2
    iget p1, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 101
    .line 102
    :goto_3
    iput v0, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 103
    .line 104
    iput p1, p2, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 105
    .line 106
    return p0

    .line 107
    :cond_6
    :goto_4
    return p1
.end method

.method private sendCustomTextureInternal(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 10
    .line 11
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$1;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Lcom/tencent/liteav/basic/c/g;Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p1
.end method

.method private startThread(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 8
    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLThread:Landroid/os/HandlerThread;

    .line 12
    .line 13
    if-nez v2, :cond_4

    .line 14
    .line 15
    new-instance v2, Landroid/os/HandlerThread;

    .line 16
    .line 17
    const-string v3, "customCaptureGLThread"

    .line 18
    .line 19
    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLThread:Landroid/os/HandlerThread;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Lcom/tencent/liteav/basic/c/g;

    .line 28
    .line 29
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLThread:Landroid/os/HandlerThread;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-direct {v2, v3}, Lcom/tencent/liteav/basic/c/g;-><init>(Landroid/os/Looper;)V

    .line 36
    .line 37
    .line 38
    iput-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 39
    .line 40
    iget-object v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    const/16 v4, 0x64

    .line 44
    .line 45
    const/16 v5, 0x2d0

    .line 46
    .line 47
    const/16 v6, 0x500

    .line 48
    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    const-string p1, "CustomCapture buffer start egl10 thread"

    .line 52
    .line 53
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 57
    .line 58
    iput-boolean v3, p1, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    iput-object v1, p1, Lcom/tencent/liteav/basic/c/g;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 62
    .line 63
    iput v6, p1, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 64
    .line 65
    iput v5, p1, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 66
    .line 67
    invoke-virtual {p1, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catchall_0
    move-exception p1

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    iget-object v7, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext10:Ljavax/microedition/khronos/egl/EGLContext;

    .line 74
    .line 75
    if-eqz v7, :cond_2

    .line 76
    .line 77
    const-string v1, "CustomCapture texture start egl10 thread"

    .line 78
    .line 79
    invoke-direct {p0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 83
    .line 84
    iput-boolean v3, v1, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 85
    .line 86
    iget-object p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext10:Ljavax/microedition/khronos/egl/EGLContext;

    .line 89
    .line 90
    iput-object p1, v1, Lcom/tencent/liteav/basic/c/g;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 91
    .line 92
    iput v6, v1, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 93
    .line 94
    iput v5, v1, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 95
    .line 96
    invoke-virtual {v1, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    iget-object v2, v2, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext14:Landroid/opengl/EGLContext;

    .line 101
    .line 102
    if-eqz v2, :cond_3

    .line 103
    .line 104
    const-string v2, "CustomCapture texture start egl14 thread"

    .line 105
    .line 106
    invoke-direct {p0, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 110
    .line 111
    iput-boolean v1, v2, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 112
    .line 113
    iget-object p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->texture:Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCTexture;->eglContext14:Landroid/opengl/EGLContext;

    .line 116
    .line 117
    iput-object p1, v2, Lcom/tencent/liteav/basic/c/g;->f:Landroid/opengl/EGLContext;

    .line 118
    .line 119
    iput v6, v2, Lcom/tencent/liteav/basic/c/g;->a:I

    .line 120
    .line 121
    iput v5, v2, Lcom/tencent/liteav/basic/c/g;->b:I

    .line 122
    .line 123
    invoke-virtual {v2, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 124
    .line 125
    .line 126
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 127
    .line 128
    new-instance v1, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$2;

    .line 129
    .line 130
    invoke-direct {v1, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$2;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Ljava/util/concurrent/CountDownLatch;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 134
    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_4
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 138
    .line 139
    .line 140
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :try_start_1
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 154
    throw p1
.end method

.method private declared-synchronized stopThread()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mRotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mRotateFilter:Lcom/tencent/liteav/basic/c/h;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mI4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mI4202RGBAFilter:Lcom/tencent/liteav/beauty/b/k;

    .line 14
    .line 15
    new-instance v4, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;

    .line 16
    .line 17
    invoke-direct {v4, p0, v2, v3}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil$3;-><init>(Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;Lcom/tencent/liteav/basic/c/h;Lcom/tencent/liteav/beauty/b/k;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLThread:Landroid/os/HandlerThread;

    .line 26
    .line 27
    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/c/g;->a(Landroid/os/Handler;Landroid/os/HandlerThread;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "CustomCapture destroy egl thread"

    .line 31
    .line 32
    invoke-direct {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->apiLog(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mGLThreadHandler:Lcom/tencent/liteav/basic/c/g;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->mEGLThread:Landroid/os/HandlerThread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw v0
.end method


# virtual methods
.method public release()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->stopThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public sendCustomTexture(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->checkEGLContext(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCustomTextureUtil;->sendCustomTextureInternal(Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

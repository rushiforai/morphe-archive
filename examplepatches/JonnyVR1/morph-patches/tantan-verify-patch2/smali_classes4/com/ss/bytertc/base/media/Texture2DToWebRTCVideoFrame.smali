.class public Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field isFrameInUse:Z

.field isReleased:Z

.field mHandler:Landroid/os/Handler;

.field mMat:Landroid/graphics/Matrix;

.field needPendingRelease:Z

.field yuvConverter:Lcom/bytedance/realx/video/YuvConverter;


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/bytedance/realx/video/YuvConverter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/bytedance/realx/video/YuvConverter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->needPendingRelease:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isReleased:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isFrameInUse:Z

    .line 20
    .line 21
    new-instance v1, Landroid/os/HandlerThread;

    .line 22
    .line 23
    const-string v2, "Texture2DToVideoFrame"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 29
    .line 30
    .line 31
    new-instance v2, Landroid/os/Handler;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v2, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 41
    .line 42
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->needPendingRelease:Z

    .line 43
    .line 44
    new-instance v0, Landroid/graphics/Matrix;

    .line 45
    .line 46
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mMat:Landroid/graphics/Matrix;

    .line 50
    .line 51
    const/16 p0, 0x9

    .line 52
    .line 53
    new-array p0, p0, [F

    .line 54
    .line 55
    fill-array-data p0, :array_0

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p0}, Landroid/graphics/Matrix;->setValues([F)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/video/YuvConverter;->release()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic b(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->releaseFrame()V

    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bytedance/realx/video/YuvConverter;->release()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/os/Looper;->quit()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private releaseFrame()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isFrameInUse:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->needPendingRelease:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isReleased:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isReleased:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 16
    .line 17
    new-instance v1, Ll/ysi0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/ysi0;-><init>(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public convertTexture2DToWebRTCVideoFrame(III)Lcom/bytedance/realx/video/VideoFrame;
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->needPendingRelease:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isReleased:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isFrameInUse:Z

    .line 12
    .line 13
    new-instance v1, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 14
    .line 15
    sget-object v4, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 16
    .line 17
    iget-object v6, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mMat:Landroid/graphics/Matrix;

    .line 18
    .line 19
    iget-object v7, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 20
    .line 21
    iget-object v8, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 22
    .line 23
    new-instance v9, Ll/xsi0;

    .line 24
    .line 25
    invoke-direct {v9, p0}, Ll/xsi0;-><init>(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V

    .line 26
    .line 27
    .line 28
    move v5, p1

    .line 29
    move v2, p2

    .line 30
    move v3, p3

    .line 31
    invoke-direct/range {v1 .. v9}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Lcom/bytedance/realx/video/VideoFrame;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    const-wide/16 p2, 0x0

    .line 38
    .line 39
    invoke-direct {p0, v1, p1, p2, p3}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJ)V

    .line 40
    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public isFameInUse()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isFrameInUse:Z

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isFrameInUse:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->needPendingRelease:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->isReleased:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;->mHandler:Landroid/os/Handler;

    .line 12
    .line 13
    new-instance v1, Ll/wsi0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wsi0;-><init>(Lcom/ss/bytertc/base/media/Texture2DToWebRTCVideoFrame;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

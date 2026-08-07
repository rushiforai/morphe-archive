.class public abstract Lio/agora/rtc2/video/VideoCapture;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/video/IVideoCapture;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/VideoCapture$FramerateRange;,
        Lio/agora/rtc2/video/VideoCapture$AndroidVideoCaptureFrameDropReason;,
        Lio/agora/rtc2/video/VideoCapture$AndroidVideoCaptureError;,
        Lio/agora/rtc2/video/VideoCapture$AndroidImageFormat;,
        Lio/agora/rtc2/video/VideoCapture$VideoCaptureTransportType;,
        Lio/agora/rtc2/video/VideoCapture$VideoCaptureApi;,
        Lio/agora/rtc2/video/VideoCapture$CAMERA_DIRECTION;,
        Lio/agora/rtc2/video/VideoCapture$AndroidFillLightMode;,
        Lio/agora/rtc2/video/VideoCapture$AndroidMeteringMode;,
        Lio/agora/rtc2/video/VideoCapture$VideoFacingMode;
    }
.end annotation


# static fields
.field public static final DEBUG_MODE:Z = false

.field public static final ERR_FAILED:I = 0x1

.field public static final ERR_INVALID_ARGUMENT:I = 0x2

.field public static final ERR_NOT_READY:I = 0x3

.field public static final ERR_NOT_SUPPORTED:I = 0x4

.field public static final ERR_OK:I = 0x0

.field private static final VIDEO_CAPTURER_THREAD_NAME:Ljava/lang/String; = "VideoCapturerThread"


# instance fields
.field protected mCameraNativeOrientation:I

.field protected mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

.field private mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field private mInjector:Ljava/util/Observable;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field protected mInvertDeviceOrientationReadings:Z

.field protected final mNativeVideoCaptureAndroid:J

.field protected mPQFirst:Z

.field protected mProxyThreadHandler:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field protected mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLio/agora/base/internal/video/EglBase$Context;I)V
    .locals 2

    .line 33
    const-string v0, "VideoCapturerThread"

    const/4 v1, 0x0

    invoke-static {v0, p3, p4, v1}, Lio/agora/base/internal/video/SurfaceTextureHelper;->create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;II)Lio/agora/base/internal/video/SurfaceTextureHelper;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lio/agora/rtc2/video/VideoCapture;-><init>(JLio/agora/base/internal/video/ISurfaceTextureHelper;)V

    return-void
.end method

.method public constructor <init>(JLio/agora/base/internal/video/ISurfaceTextureHelper;)V
    .locals 1
    .param p3    # Lio/agora/base/internal/video/ISurfaceTextureHelper;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lio/agora/rtc2/video/VideoCapture;->mPQFirst:Z

    .line 6
    .line 7
    iput-wide p1, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 8
    .line 9
    iput-object p3, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 10
    .line 11
    new-instance p1, Landroid/os/HandlerThread;

    .line 12
    .line 13
    const-string p2, "VideoCaptureCamera_ProxyThread"

    .line 14
    .line 15
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 19
    .line 20
    .line 21
    new-instance p2, Landroid/os/Handler;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p2, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lio/agora/rtc2/video/VideoCapture;->mProxyThreadHandler:Landroid/os/Handler;

    .line 31
    .line 32
    return-void
.end method

.method public static FindBestMatchedCapability(Ljava/util/List;Lio/agora/rtc2/video/VideoCaptureFormat;)Lio/agora/rtc2/video/VideoCaptureFormat;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCaptureFormat;",
            ">;",
            "Lio/agora/rtc2/video/VideoCaptureFormat;",
            ")",
            "Lio/agora/rtc2/video/VideoCaptureFormat;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p0, p1}, Lio/agora/rtc2/video/VideoCapture;->nativeFindBestMatchedCapability(Ljava/util/List;Lio/agora/rtc2/video/VideoCaptureFormat;)Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public static createTextureBufferWithModifiedTransformMatrix(Lio/agora/base/TextureBuffer;ZI)Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x3f000000    # 0.5f

    .line 7
    .line 8
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/high16 p1, -0x40800000    # -1.0f

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, p1, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    int-to-float p1, p2

    .line 21
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 22
    .line 23
    .line 24
    const/high16 p1, -0x41000000    # -0.5f

    .line 25
    .line 26
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0}, Lio/agora/base/TextureBuffer;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p0, v0, p1, p2}, Lio/agora/base/TextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lio/agora/base/TextureBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static native nativeFindBestMatchedCapability(Ljava/util/List;Lio/agora/rtc2/video/VideoCaptureFormat;)Lio/agora/rtc2/video/VideoCaptureFormat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCaptureFormat;",
            ">;",
            "Lio/agora/rtc2/video/VideoCaptureFormat;",
            ")",
            "Lio/agora/rtc2/video/VideoCaptureFormat;"
        }
    .end annotation
.end method

.method private native nativeGetDisplayRotation(J)I
.end method

.method private native nativeOnAvailable(JI)V
.end method

.method private native nativeOnError(JILjava/lang/String;)V
.end method

.method private native nativeOnFrameCaptured(JIIIJLio/agora/base/VideoFrame$Buffer;Lio/agora/base/VideoFrameMetaInfo;)V
.end method

.method private native nativeOnFrameDropped(JI)V
.end method

.method private native nativeOnI420FrameAvailable(JLjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIJLio/agora/base/VideoFrameMetaInfo;)V
.end method

.method private native nativeOnStarted(J)V
.end method


# virtual methods
.method public allocate(III)Z
    .locals 2

    .line 1
    new-instance v0, Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p2, p3, v1}, Lio/agora/rtc2/video/VideoCaptureFormat;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    invoke-interface {p0, v0}, Lio/agora/rtc2/video/IVideoCapture;->allocate(Lio/agora/rtc2/video/VideoCaptureFormat;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public dispose()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mProxyThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mProxyThreadHandler:Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/os/Looper;->quitSafely()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lio/agora/rtc2/video/VideoCapture;->mProxyThreadHandler:Landroid/os/Handler;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final getCameraRotation()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lio/agora/rtc2/video/VideoCapture;->mInvertDeviceOrientationReadings:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCapture;->getDeviceRotation()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    rsub-int v0, v0, 0x168

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCapture;->getDeviceRotation()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    iget p0, p0, Lio/agora/rtc2/video/VideoCapture;->mCameraNativeOrientation:I

    .line 17
    .line 18
    add-int/2addr p0, v0

    .line 19
    rem-int/lit16 p0, p0, 0x168

    .line 20
    .line 21
    return p0
.end method

.method public getCaptureFormat()Lio/agora/rtc2/video/VideoCaptureFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDeviceRotation()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCapture;->getDisplayRotation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    const/16 p0, 0x10e

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    const/16 p0, 0xb4

    .line 20
    .line 21
    return p0

    .line 22
    :cond_2
    const/16 p0, 0x5a

    .line 23
    .line 24
    return p0
.end method

.method public getDisplayRotation()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lio/agora/rtc2/video/VideoCapture;->nativeGetDisplayRotation(J)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public notifyInjector(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCapture;->mInjector:Ljava/util/Observable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/Observable;->notifyObservers(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAvailable(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lio/agora/rtc2/video/IVideoCapture$Events;->onAvailable(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-wide v0, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-direct {p0, v0, v1, p1}, Lio/agora/rtc2/video/VideoCapture;->nativeOnAvailable(JI)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public onError(ILjava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Lio/agora/rtc2/video/IVideoCapture$Events;->onError(ILjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-wide v0, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-direct {p0, v0, v1, p1, p2}, Lio/agora/rtc2/video/VideoCapture;->nativeOnError(JILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public onFrameCaptured(Lio/agora/base/VideoFrame;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lio/agora/rtc2/video/IVideoCapture$Events;->onFrameCaptured(Lio/agora/base/VideoFrame;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-wide v2, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 10
    .line 11
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lio/agora/base/VideoFrame$Buffer;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lio/agora/base/VideoFrame$Buffer;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getRotation()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    .line 32
    .line 33
    .line 34
    move-result-wide v7

    .line 35
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getMetaInfo()Lio/agora/base/VideoFrameMetaInfo;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    move-object v1, p0

    .line 44
    invoke-direct/range {v1 .. v10}, Lio/agora/rtc2/video/VideoCapture;->nativeOnFrameCaptured(JIIIJLio/agora/base/VideoFrame$Buffer;Lio/agora/base/VideoFrameMetaInfo;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onFrameDropped(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lio/agora/rtc2/video/IVideoCapture$Events;->onFrameDropped(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-wide v0, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 10
    .line 11
    invoke-direct {p0, v0, v1, p1}, Lio/agora/rtc2/video/VideoCapture;->nativeOnFrameDropped(JI)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onI420FrameAvailable(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIJLio/agora/base/VideoFrameMetaInfo;)V
    .locals 15

    .line 1
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    move-object/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    move-object/from16 v4, p3

    .line 10
    .line 11
    move-object/from16 v5, p4

    .line 12
    .line 13
    move/from16 v6, p5

    .line 14
    .line 15
    move/from16 v7, p6

    .line 16
    .line 17
    move/from16 v8, p7

    .line 18
    .line 19
    move/from16 v9, p8

    .line 20
    .line 21
    move/from16 v10, p9

    .line 22
    .line 23
    move-wide/from16 v11, p10

    .line 24
    .line 25
    move-object/from16 v13, p12

    .line 26
    .line 27
    invoke-interface/range {v1 .. v13}, Lio/agora/rtc2/video/IVideoCapture$Events;->onI420FrameAvailable(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIJLio/agora/base/VideoFrameMetaInfo;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-wide v1, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 32
    .line 33
    move-object v0, p0

    .line 34
    move-object/from16 v3, p1

    .line 35
    .line 36
    move/from16 v4, p2

    .line 37
    .line 38
    move-object/from16 v5, p3

    .line 39
    .line 40
    move-object/from16 v6, p4

    .line 41
    .line 42
    move/from16 v7, p5

    .line 43
    .line 44
    move/from16 v8, p6

    .line 45
    .line 46
    move/from16 v9, p7

    .line 47
    .line 48
    move/from16 v10, p8

    .line 49
    .line 50
    move/from16 v11, p9

    .line 51
    .line 52
    move-wide/from16 v12, p10

    .line 53
    .line 54
    move-object/from16 v14, p12

    .line 55
    .line 56
    invoke-direct/range {v0 .. v14}, Lio/agora/rtc2/video/VideoCapture;->nativeOnI420FrameAvailable(JLjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIJLio/agora/base/VideoFrameMetaInfo;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onStarted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture$Events;->onStarted()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-wide v0, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Lio/agora/rtc2/video/VideoCapture;->nativeOnStarted(J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setEventsCallback(Lio/agora/rtc2/video/IVideoCapture$Events;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCapture;->mEventsCallback:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    return-void
.end method

.method public setInjector(Ljava/util/Observable;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCapture;->mInjector:Ljava/util/Observable;

    .line 2
    .line 3
    return-void
.end method

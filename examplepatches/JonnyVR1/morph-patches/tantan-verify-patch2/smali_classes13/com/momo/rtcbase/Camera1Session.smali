.class Lcom/momo/rtcbase/Camera1Session;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/CameraSession;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/Camera1Session$SessionState;
    }
.end annotation


# static fields
.field private static final NUMBER_OF_CAPTURE_BUFFERS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "Camera1Session"

.field private static final camera1ResolutionHistogram:Lcom/momo/rtcbase/Histogram;

.field private static final camera1StartTimeMsHistogram:Lcom/momo/rtcbase/Histogram;

.field private static final camera1StopTimeMsHistogram:Lcom/momo/rtcbase/Histogram;


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private final camera:Landroid/hardware/Camera;

.field private final cameraId:I

.field private final cameraThreadHandler:Landroid/os/Handler;

.field private final captureFormat:Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

.field private final captureToTexture:Z

.field private final constructionTimeNs:J

.field private final events:Lcom/momo/rtcbase/CameraSession$Events;

.field private firstFrameReported:Z

.field private final info:Landroid/hardware/Camera$CameraInfo;

.field private state:Lcom/momo/rtcbase/Camera1Session$SessionState;

.field private final surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "WebRTC.Android.Camera1.StartTimeMs"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/16 v2, 0x2710

    .line 5
    .line 6
    const/16 v3, 0x32

    .line 7
    .line 8
    invoke-static {v0, v1, v2, v3}, Lcom/momo/rtcbase/Histogram;->createCounts(Ljava/lang/String;III)Lcom/momo/rtcbase/Histogram;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/momo/rtcbase/Camera1Session;->camera1StartTimeMsHistogram:Lcom/momo/rtcbase/Histogram;

    .line 13
    .line 14
    const-string v0, "WebRTC.Android.Camera1.StopTimeMs"

    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3}, Lcom/momo/rtcbase/Histogram;->createCounts(Ljava/lang/String;III)Lcom/momo/rtcbase/Histogram;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/momo/rtcbase/Camera1Session;->camera1StopTimeMsHistogram:Lcom/momo/rtcbase/Histogram;

    .line 21
    .line 22
    sget-object v0, Lcom/momo/rtcbase/CameraEnumerationAndroid;->COMMON_RESOLUTIONS:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v1, "WebRTC.Android.Camera1.Resolution"

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Histogram;->createEnumeration(Ljava/lang/String;I)Lcom/momo/rtcbase/Histogram;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Lcom/momo/rtcbase/Camera1Session;->camera1ResolutionHistogram:Lcom/momo/rtcbase/Histogram;

    .line 35
    .line 36
    return-void
.end method

.method private constructor <init>(Lcom/momo/rtcbase/CameraSession$Events;ZLandroid/content/Context;Lcom/momo/rtcbase/SurfaceTextureHelper;ILandroid/hardware/Camera;Landroid/hardware/Camera$CameraInfo;Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "Create new camera1 session on camera "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Camera1Session"

    .line 19
    .line 20
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Landroid/os/Handler;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/momo/rtcbase/Camera1Session;->events:Lcom/momo/rtcbase/CameraSession$Events;

    .line 31
    .line 32
    iput-boolean p2, p0, Lcom/momo/rtcbase/Camera1Session;->captureToTexture:Z

    .line 33
    .line 34
    iput-object p3, p0, Lcom/momo/rtcbase/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 35
    .line 36
    iput-object p4, p0, Lcom/momo/rtcbase/Camera1Session;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 37
    .line 38
    iput p5, p0, Lcom/momo/rtcbase/Camera1Session;->cameraId:I

    .line 39
    .line 40
    iput-object p6, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 41
    .line 42
    iput-object p7, p0, Lcom/momo/rtcbase/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 43
    .line 44
    iput-object p8, p0, Lcom/momo/rtcbase/Camera1Session;->captureFormat:Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 45
    .line 46
    iput-wide p9, p0, Lcom/momo/rtcbase/Camera1Session;->constructionTimeNs:J

    .line 47
    .line 48
    iget p1, p8, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 49
    .line 50
    iget p2, p8, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 51
    .line 52
    invoke-virtual {p4, p1, p2}, Lcom/momo/rtcbase/SurfaceTextureHelper;->setTextureSize(II)V

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->startCapturing()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static synthetic a(Lcom/momo/rtcbase/Camera1Session;Lcom/momo/rtcbase/VideoFrame;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->state:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 5
    .line 6
    sget-object v1, Lcom/momo/rtcbase/Camera1Session$SessionState;->RUNNING:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const-string p0, "Camera1Session"

    .line 11
    .line 12
    const-string p1, "Texture frame captured but camera is no longer running."

    .line 13
    .line 14
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/momo/rtcbase/Camera1Session;->firstFrameReported:Z

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    iget-wide v4, p0, Lcom/momo/rtcbase/Camera1Session;->constructionTimeNs:J

    .line 28
    .line 29
    sub-long/2addr v2, v4

    .line 30
    const-wide/32 v4, 0xf4240

    .line 31
    .line 32
    .line 33
    div-long/2addr v2, v4

    .line 34
    long-to-int v0, v2

    .line 35
    sget-object v2, Lcom/momo/rtcbase/Camera1Session;->camera1StartTimeMsHistogram:Lcom/momo/rtcbase/Histogram;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Lcom/momo/rtcbase/Histogram;->addSample(I)V

    .line 38
    .line 39
    .line 40
    iput-boolean v1, p0, Lcom/momo/rtcbase/Camera1Session;->firstFrameReported:Z

    .line 41
    .line 42
    :cond_1
    new-instance v0, Lcom/momo/rtcbase/VideoFrame;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/momo/rtcbase/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 51
    .line 52
    iget v3, v3, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    if-ne v3, v1, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v1, v4

    .line 59
    :goto_0
    invoke-static {v2, v1, v4}, Lcom/momo/rtcbase/CameraSession;->createTextureBufferWithModifiedTransformMatrix(Lcom/momo/rtcbase/TextureBufferImpl;ZI)Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->getFrameOrientation()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 68
    .line 69
    .line 70
    move-result-wide v3

    .line 71
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/momo/rtcbase/Camera1Session;->events:Lcom/momo/rtcbase/CameraSession$Events;

    .line 75
    .line 76
    invoke-interface {p1, p0, v0}, Lcom/momo/rtcbase/CameraSession$Events;->onFrameCaptured(Lcom/momo/rtcbase/CameraSession;Lcom/momo/rtcbase/VideoFrame;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/Camera1Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->stopInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraSession$Events;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->events:Lcom/momo/rtcbase/CameraSession$Events;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/momo/rtcbase/Camera1Session;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/Camera1Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/Camera1Session;)Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/Camera1Session$SessionState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->state:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/momo/rtcbase/Camera1Session;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/Camera1Session;->firstFrameReported:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$502(Lcom/momo/rtcbase/Camera1Session;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/Camera1Session;->firstFrameReported:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$600(Lcom/momo/rtcbase/Camera1Session;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/Camera1Session;->constructionTimeNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$700()Lcom/momo/rtcbase/Histogram;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/Camera1Session;->camera1StartTimeMsHistogram:Lcom/momo/rtcbase/Histogram;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$800(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->captureFormat:Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/momo/rtcbase/Camera1Session;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->getFrameOrientation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private checkIsOnCameraThread()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-ne v0, p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "Wrong thread"

    .line 19
    .line 20
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static create(Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;Lcom/momo/rtcbase/CameraSession$Events;ZLandroid/content/Context;Lcom/momo/rtcbase/SurfaceTextureHelper;IIII)V
    .locals 11

    .line 1
    move/from16 v5, p5

    .line 2
    .line 3
    move/from16 v0, p6

    .line 4
    .line 5
    move/from16 v1, p7

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v9

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "Open camera "

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "Camera1Session"

    .line 26
    .line 27
    invoke-static {v3, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Lcom/momo/rtcbase/CameraSession$Events;->onCameraOpening()V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-static {v5}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 34
    .line 35
    .line 36
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3

    .line 37
    if-nez v6, :cond_0

    .line 38
    .line 39
    sget-object p1, Lcom/momo/rtcbase/CameraSession$FailureType;->ERROR:Lcom/momo/rtcbase/CameraSession$FailureType;

    .line 40
    .line 41
    new-instance p2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string p3, "android.hardware.Camera.open returned null for camera id = "

    .line 44
    .line 45
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-interface {p0, p1, p2}, Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;->onFailure(Lcom/momo/rtcbase/CameraSession$FailureType;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    :try_start_1
    invoke-virtual {p4}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v6, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 64
    .line 65
    .line 66
    new-instance v7, Landroid/hardware/Camera$CameraInfo;

    .line 67
    .line 68
    invoke-direct {v7}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {v5, v7}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 72
    .line 73
    .line 74
    :try_start_2
    invoke-virtual {v6}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    move/from16 v3, p8

    .line 79
    .line 80
    invoke-static {v2, v0, v1, v3}, Lcom/momo/rtcbase/Camera1Session;->findClosestCaptureFormat(Landroid/hardware/Camera$Parameters;III)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    invoke-static {v2, v0, v1}, Lcom/momo/rtcbase/Camera1Session;->findClosestPictureSize(Landroid/hardware/Camera$Parameters;II)Lcom/momo/rtcbase/Size;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v6, v2, v8, v0, p2}, Lcom/momo/rtcbase/Camera1Session;->updateCameraParameters(Landroid/hardware/Camera;Landroid/hardware/Camera$Parameters;Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;Lcom/momo/rtcbase/Size;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 89
    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    if-nez p2, :cond_1

    .line 93
    .line 94
    invoke-virtual {v8}, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->frameSize()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    move v2, v0

    .line 99
    :goto_0
    const/4 v3, 0x3

    .line 100
    if-ge v2, v3, :cond_1

    .line 101
    .line 102
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v6, v3}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 111
    .line 112
    .line 113
    add-int/lit8 v2, v2, 0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    invoke-virtual {v6, v0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Lcom/momo/rtcbase/Camera1Session;

    .line 120
    .line 121
    move-object v1, p1

    .line 122
    move v2, p2

    .line 123
    move-object v3, p3

    .line 124
    move-object v4, p4

    .line 125
    invoke-direct/range {v0 .. v10}, Lcom/momo/rtcbase/Camera1Session;-><init>(Lcom/momo/rtcbase/CameraSession$Events;ZLandroid/content/Context;Lcom/momo/rtcbase/SurfaceTextureHelper;ILandroid/hardware/Camera;Landroid/hardware/Camera$CameraInfo;Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;J)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p0, v0}, Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;->onDone(Lcom/momo/rtcbase/CameraSession;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :catch_0
    move-exception v0

    .line 133
    move-object p1, v0

    .line 134
    invoke-virtual {v6}, Landroid/hardware/Camera;->release()V

    .line 135
    .line 136
    .line 137
    sget-object p2, Lcom/momo/rtcbase/CameraSession$FailureType;->ERROR:Lcom/momo/rtcbase/CameraSession$FailureType;

    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-interface {p0, p2, p1}, Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;->onFailure(Lcom/momo/rtcbase/CameraSession$FailureType;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :catch_1
    move-exception v0

    .line 148
    :goto_1
    move-object p1, v0

    .line 149
    goto :goto_2

    .line 150
    :catch_2
    move-exception v0

    .line 151
    goto :goto_1

    .line 152
    :goto_2
    invoke-virtual {v6}, Landroid/hardware/Camera;->release()V

    .line 153
    .line 154
    .line 155
    sget-object p2, Lcom/momo/rtcbase/CameraSession$FailureType;->ERROR:Lcom/momo/rtcbase/CameraSession$FailureType;

    .line 156
    .line 157
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-interface {p0, p2, p1}, Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;->onFailure(Lcom/momo/rtcbase/CameraSession$FailureType;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :catch_3
    move-exception v0

    .line 166
    move-object p1, v0

    .line 167
    sget-object p2, Lcom/momo/rtcbase/CameraSession$FailureType;->ERROR:Lcom/momo/rtcbase/CameraSession$FailureType;

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-interface {p0, p2, p1}, Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;->onFailure(Lcom/momo/rtcbase/CameraSession$FailureType;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method private static findClosestCaptureFormat(Landroid/hardware/Camera$Parameters;III)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Enumerator;->convertFramerates(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "Available fps ranges: "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "Camera1Session"

    .line 24
    .line 25
    invoke-static {v2, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p3}, Lcom/momo/rtcbase/CameraEnumerationAndroid;->getClosestSupportedFramerateRange(Ljava/util/List;I)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lcom/momo/rtcbase/Camera1Enumerator;->convertSizes(Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p0, p1, p2}, Lcom/momo/rtcbase/CameraEnumerationAndroid;->getClosestSupportedSize(Ljava/util/List;II)Lcom/momo/rtcbase/Size;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget-object p1, Lcom/momo/rtcbase/Camera1Session;->camera1ResolutionHistogram:Lcom/momo/rtcbase/Histogram;

    .line 45
    .line 46
    invoke-static {p1, p0}, Lcom/momo/rtcbase/CameraEnumerationAndroid;->reportCameraResolution(Lcom/momo/rtcbase/Histogram;Lcom/momo/rtcbase/Size;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 50
    .line 51
    iget p2, p0, Lcom/momo/rtcbase/Size;->width:I

    .line 52
    .line 53
    iget p0, p0, Lcom/momo/rtcbase/Size;->height:I

    .line 54
    .line 55
    invoke-direct {p1, p2, p0, p3}, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;-><init>(IILcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V

    .line 56
    .line 57
    .line 58
    return-object p1
.end method

.method private static findClosestPictureSize(Landroid/hardware/Camera$Parameters;II)Lcom/momo/rtcbase/Size;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/momo/rtcbase/Camera1Enumerator;->convertSizes(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0, p1, p2}, Lcom/momo/rtcbase/CameraEnumerationAndroid;->getClosestSupportedSize(Ljava/util/List;II)Lcom/momo/rtcbase/Size;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private getFrameOrientation()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/CameraSession;->getDeviceOrientation(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 8
    .line 9
    iget v1, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    rsub-int v0, v0, 0x168

    .line 14
    .line 15
    :cond_0
    iget p0, p0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 16
    .line 17
    add-int/2addr p0, v0

    .line 18
    rem-int/lit16 p0, p0, 0x168

    .line 19
    .line 20
    return p0
.end method

.method private listenForBytebufferFrames()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/rtcbase/Camera1Session$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/rtcbase/Camera1Session$2;-><init>(Lcom/momo/rtcbase/Camera1Session;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private listenForTextureFrames()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/rtcbase/a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/rtcbase/a;-><init>(Lcom/momo/rtcbase/Camera1Session;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->startListening(Lcom/momo/rtcbase/VideoSink;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private startCapturing()V
    .locals 2

    .line 1
    const-string v0, "Camera1Session"

    .line 2
    .line 3
    const-string v1, "Start capturing"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->checkIsOnCameraThread()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/momo/rtcbase/Camera1Session$SessionState;->RUNNING:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->state:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 16
    .line 17
    new-instance v1, Lcom/momo/rtcbase/Camera1Session$1;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/momo/rtcbase/Camera1Session$1;-><init>(Lcom/momo/rtcbase/Camera1Session;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/momo/rtcbase/Camera1Session;->captureToTexture:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->listenForTextureFrames()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->listenForBytebufferFrames()V

    .line 34
    .line 35
    .line 36
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 43
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->stopInternal()V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/momo/rtcbase/Camera1Session;->events:Lcom/momo/rtcbase/CameraSession$Events;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v1, p0, v0}, Lcom/momo/rtcbase/CameraSession$Events;->onCameraError(Lcom/momo/rtcbase/CameraSession;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private stopInternal()V
    .locals 3

    .line 1
    const-string v0, "Stop internal"

    .line 2
    .line 3
    const-string v1, "Camera1Session"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->checkIsOnCameraThread()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->state:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 12
    .line 13
    sget-object v2, Lcom/momo/rtcbase/Camera1Session$SessionState;->STOPPED:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 14
    .line 15
    if-ne v0, v2, :cond_0

    .line 16
    .line 17
    const-string p0, "Camera is already stopped"

    .line 18
    .line 19
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iput-object v2, p0, Lcom/momo/rtcbase/Camera1Session;->state:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->stopListening()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->events:Lcom/momo/rtcbase/CameraSession$Events;

    .line 41
    .line 42
    invoke-interface {v0, p0}, Lcom/momo/rtcbase/CameraSession$Events;->onCameraClosed(Lcom/momo/rtcbase/CameraSession;)V

    .line 43
    .line 44
    .line 45
    const-string p0, "Stop done"

    .line 46
    .line 47
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private static updateCameraParameters(Landroid/hardware/Camera;Landroid/hardware/Camera$Parameters;Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;Lcom/momo/rtcbase/Size;Z)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p2, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 6
    .line 7
    iget v2, v1, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    .line 8
    .line 9
    iget v1, v1, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->max:I

    .line 10
    .line 11
    invoke-virtual {p1, v2, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 12
    .line 13
    .line 14
    iget v1, p2, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 15
    .line 16
    iget p2, p2, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 17
    .line 18
    invoke-virtual {p1, v1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 19
    .line 20
    .line 21
    iget p2, p3, Lcom/momo/rtcbase/Size;->width:I

    .line 22
    .line 23
    iget p3, p3, Lcom/momo/rtcbase/Size;->height:I

    .line 24
    .line 25
    invoke-virtual {p1, p2, p3}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 26
    .line 27
    .line 28
    if-nez p4, :cond_0

    .line 29
    .line 30
    const/16 p2, 0x11

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    const/4 p2, 0x1

    .line 42
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    const-string p2, "continuous-video"

    .line 46
    .line 47
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_2

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public stop()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Stop camera1 session on camera "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/momo/rtcbase/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session;->state:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 26
    .line 27
    sget-object v1, Lcom/momo/rtcbase/Camera1Session$SessionState;->STOPPED:Lcom/momo/rtcbase/Camera1Session$SessionState;

    .line 28
    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-direct {p0}, Lcom/momo/rtcbase/Camera1Session;->stopInternal()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    sub-long/2addr v2, v0

    .line 43
    const-wide/32 v0, 0xf4240

    .line 44
    .line 45
    .line 46
    div-long/2addr v2, v0

    .line 47
    long-to-int p0, v2

    .line 48
    sget-object v0, Lcom/momo/rtcbase/Camera1Session;->camera1StopTimeMsHistogram:Lcom/momo/rtcbase/Histogram;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Lcom/momo/rtcbase/Histogram;->addSample(I)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

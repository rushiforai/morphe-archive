.class Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/Camera2Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CaptureSessionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/Camera2Session;


# direct methods
.method private constructor <init>(Lcom/momo/rtcbase/Camera2Session;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/Camera2Session;Lcom/momo/rtcbase/Camera2Session$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;-><init>(Lcom/momo/rtcbase/Camera2Session;)V

    return-void
.end method

.method public static synthetic a(Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;Lcom/momo/rtcbase/VideoFrame;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/Camera2Session;->access$000(Lcom/momo/rtcbase/Camera2Session;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/rtcbase/Camera2Session;->access$200(Lcom/momo/rtcbase/Camera2Session;)Lcom/momo/rtcbase/Camera2Session$SessionState;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/momo/rtcbase/Camera2Session$SessionState;->RUNNING:Lcom/momo/rtcbase/Camera2Session$SessionState;

    .line 13
    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    const-string p0, "Camera2Session"

    .line 17
    .line 18
    const-string p1, "Texture frame captured but camera is no longer running."

    .line 19
    .line 20
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/momo/rtcbase/Camera2Session;->access$1600(Lcom/momo/rtcbase/Camera2Session;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Camera2Session;->access$1602(Lcom/momo/rtcbase/Camera2Session;Z)Z

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    iget-object v2, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/momo/rtcbase/Camera2Session;->access$1700(Lcom/momo/rtcbase/Camera2Session;)J

    .line 45
    .line 46
    .line 47
    move-result-wide v2

    .line 48
    sub-long/2addr v0, v2

    .line 49
    const-wide/32 v2, 0xf4240

    .line 50
    .line 51
    .line 52
    div-long/2addr v0, v2

    .line 53
    long-to-int v0, v0

    .line 54
    invoke-static {}, Lcom/momo/rtcbase/Camera2Session;->access$1800()Lcom/momo/rtcbase/Histogram;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, v0}, Lcom/momo/rtcbase/Histogram;->addSample(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    new-instance v0, Lcom/momo/rtcbase/VideoFrame;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 70
    .line 71
    invoke-static {v2}, Lcom/momo/rtcbase/Camera2Session;->access$1900(Lcom/momo/rtcbase/Camera2Session;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget-object v3, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 76
    .line 77
    invoke-static {v3}, Lcom/momo/rtcbase/Camera2Session;->access$2000(Lcom/momo/rtcbase/Camera2Session;)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    neg-int v3, v3

    .line 82
    invoke-static {v1, v2, v3}, Lcom/momo/rtcbase/CameraSession;->createTextureBufferWithModifiedTransformMatrix(Lcom/momo/rtcbase/TextureBufferImpl;ZI)Lcom/momo/rtcbase/VideoFrame$TextureBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v2, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 87
    .line 88
    invoke-static {v2}, Lcom/momo/rtcbase/Camera2Session;->access$2100(Lcom/momo/rtcbase/Camera2Session;)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 100
    .line 101
    invoke-static {p1}, Lcom/momo/rtcbase/Camera2Session;->access$500(Lcom/momo/rtcbase/Camera2Session;)Lcom/momo/rtcbase/CameraSession$Events;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 106
    .line 107
    invoke-interface {p1, p0, v0}, Lcom/momo/rtcbase/CameraSession$Events;->onFrameCaptured(Lcom/momo/rtcbase/CameraSession;Lcom/momo/rtcbase/VideoFrame;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/momo/rtcbase/VideoFrame;->release()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method private chooseFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/rtcbase/Camera2Session;->access$1500(Lcom/momo/rtcbase/Camera2Session;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AF_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, [I

    .line 14
    .line 15
    array-length v0, p0

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    const-string v2, "Camera2Session"

    .line 18
    .line 19
    if-ge v1, v0, :cond_1

    .line 20
    .line 21
    aget v3, p0, v1

    .line 22
    .line 23
    const/4 v4, 0x3

    .line 24
    if-ne v3, v4, :cond_0

    .line 25
    .line 26
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 27
    .line 28
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, p0, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const-string p0, "Using continuous video auto-focus."

    .line 36
    .line 37
    invoke-static {v2, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p0, "Auto-focus is not available."

    .line 45
    .line 46
    invoke-static {v2, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private chooseStabilizationMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v4, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 12
    .line 13
    invoke-static {v4}, Lcom/momo/rtcbase/Camera2Session;->access$1500(Lcom/momo/rtcbase/Camera2Session;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_OPTICAL_STABILIZATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 18
    .line 19
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    check-cast v4, [I

    .line 24
    .line 25
    const-string v5, "Camera2Session"

    .line 26
    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    array-length v6, v4

    .line 30
    move v7, v0

    .line 31
    :goto_0
    if-ge v7, v6, :cond_1

    .line 32
    .line 33
    aget v8, v4, v7

    .line 34
    .line 35
    if-ne v8, v2, :cond_0

    .line 36
    .line 37
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->LENS_OPTICAL_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 38
    .line 39
    invoke-virtual {p1, p0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 43
    .line 44
    invoke-virtual {p1, p0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    const-string p0, "Using optical stabilization."

    .line 48
    .line 49
    invoke-static {v5, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    add-int/lit8 v7, v7, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/momo/rtcbase/Camera2Session;->access$1500(Lcom/momo/rtcbase/Camera2Session;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 63
    .line 64
    invoke-virtual {p0, v4}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, [I

    .line 69
    .line 70
    array-length v4, p0

    .line 71
    :goto_1
    if-ge v0, v4, :cond_3

    .line 72
    .line 73
    aget v6, p0, v0

    .line 74
    .line 75
    if-ne v6, v2, :cond_2

    .line 76
    .line 77
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 78
    .line 79
    invoke-virtual {p1, p0, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->LENS_OPTICAL_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 83
    .line 84
    invoke-virtual {p1, p0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    const-string p0, "Using video stabilization."

    .line 88
    .line 89
    invoke-static {v5, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    const-string p0, "Stabilization not available."

    .line 97
    .line 98
    invoke-static {v5, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/Camera2Session;->access$000(Lcom/momo/rtcbase/Camera2Session;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 10
    .line 11
    const-string p1, "Failed to configure capture session."

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Camera2Session;->access$600(Lcom/momo/rtcbase/Camera2Session;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/Camera2Session;->access$000(Lcom/momo/rtcbase/Camera2Session;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "Camera capture session configured."

    .line 7
    .line 8
    const-string v1, "Camera2Session"

    .line 9
    .line 10
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 14
    .line 15
    invoke-static {v0, p1}, Lcom/momo/rtcbase/Camera2Session;->access$102(Lcom/momo/rtcbase/Camera2Session;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 16
    .line 17
    .line 18
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/rtcbase/Camera2Session;->access$700(Lcom/momo/rtcbase/Camera2Session;)Landroid/hardware/camera2/CameraDevice;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v2, 0x3

    .line 25
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 30
    .line 31
    new-instance v3, Landroid/util/Range;

    .line 32
    .line 33
    iget-object v4, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 34
    .line 35
    invoke-static {v4}, Lcom/momo/rtcbase/Camera2Session;->access$800(Lcom/momo/rtcbase/Camera2Session;)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-object v4, v4, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 40
    .line 41
    iget v4, v4, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    .line 42
    .line 43
    iget-object v5, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 44
    .line 45
    invoke-static {v5}, Lcom/momo/rtcbase/Camera2Session;->access$1300(Lcom/momo/rtcbase/Camera2Session;)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    div-int/2addr v4, v5

    .line 50
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    iget-object v5, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 55
    .line 56
    invoke-static {v5}, Lcom/momo/rtcbase/Camera2Session;->access$800(Lcom/momo/rtcbase/Camera2Session;)Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    iget-object v5, v5, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 61
    .line 62
    iget v5, v5, Lcom/momo/rtcbase/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->max:I

    .line 63
    .line 64
    iget-object v6, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 65
    .line 66
    invoke-static {v6}, Lcom/momo/rtcbase/Camera2Session;->access$1300(Lcom/momo/rtcbase/Camera2Session;)I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    div-int/2addr v5, v6

    .line 71
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-direct {v3, v4, v5}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 92
    .line 93
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 94
    .line 95
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->chooseStabilizationMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 99
    .line 100
    .line 101
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->chooseFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 105
    .line 106
    invoke-static {v2}, Lcom/momo/rtcbase/Camera2Session;->access$1000(Lcom/momo/rtcbase/Camera2Session;)Landroid/view/Surface;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v2, Lcom/momo/rtcbase/Camera2Session$CameraCaptureCallback;

    .line 118
    .line 119
    const/4 v3, 0x0

    .line 120
    invoke-direct {v2, v3}, Lcom/momo/rtcbase/Camera2Session$CameraCaptureCallback;-><init>(Lcom/momo/rtcbase/Camera2Session$1;)V

    .line 121
    .line 122
    .line 123
    iget-object v3, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 124
    .line 125
    invoke-static {v3}, Lcom/momo/rtcbase/Camera2Session;->access$1200(Lcom/momo/rtcbase/Camera2Session;)Landroid/os/Handler;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {p1, v0, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/momo/rtcbase/Camera2Session;->access$900(Lcom/momo/rtcbase/Camera2Session;)Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance v0, Lcom/momo/rtcbase/d;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/d;-><init>(Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->startListening(Lcom/momo/rtcbase/VideoSink;)V

    .line 144
    .line 145
    .line 146
    const-string p1, "Camera device successfully started."

    .line 147
    .line 148
    invoke-static {v1, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 152
    .line 153
    invoke-static {p1}, Lcom/momo/rtcbase/Camera2Session;->access$400(Lcom/momo/rtcbase/Camera2Session;)Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 158
    .line 159
    invoke-interface {p1, p0}, Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;->onDone(Lcom/momo/rtcbase/CameraSession;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :catch_0
    move-exception p1

    .line 164
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->this$0:Lcom/momo/rtcbase/Camera2Session;

    .line 165
    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string v1, "Failed to start capture request. "

    .line 169
    .line 170
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Camera2Session;->access$600(Lcom/momo/rtcbase/Camera2Session;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

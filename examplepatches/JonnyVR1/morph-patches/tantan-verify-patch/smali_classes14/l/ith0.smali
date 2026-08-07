.class public Ll/ith0;
.super Ll/ush0;
.source "SourceFile"

# interfaces
.implements Ll/y6m;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0x17
.end annotation


# instance fields
.field public n:Z

.field public o:Landroid/view/Surface;

.field public p:Landroid/media/MediaRecorder;

.field public q:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ush0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ith0;->n:Z

    .line 6
    .line 7
    invoke-static {}, Landroid/media/MediaCodec;->createPersistentInputSurface()Landroid/view/Surface;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/ith0;->o:Landroid/view/Surface;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e(Ll/ith0;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ith0;->o(Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Ll/ith0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ith0;->n(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V

    return-void
.end method

.method public static synthetic i(Ll/ith0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ith0;->p()V

    return-void
.end method

.method public static synthetic j(Ll/ith0;Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ith0;->q(Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    return-void
.end method

.method public static synthetic k(Ll/ith0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ith0;->m(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/ith0;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->getDevice()Landroid/hardware/camera2/CameraDevice;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x3

    .line 19
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Ll/ith0;->o:Landroid/view/Surface;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 37
    .line 38
    .line 39
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 40
    .line 41
    new-instance v2, Landroid/util/Range;

    .line 42
    .line 43
    iget-object v3, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 44
    .line 45
    invoke-virtual {v3}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->e()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object v4, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 54
    .line 55
    invoke-virtual {v4}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->e()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-direct {v2, v3, v4}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 70
    .line 71
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, p1, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Ll/ush0;->e:Landroid/os/Handler;

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    invoke-virtual {p1, v0, v2, v1}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 88
    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    iput-boolean p1, p0, Ll/ith0;->n:Z

    .line 92
    .line 93
    iget-object p1, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/media/MediaRecorder;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :catch_0
    move-exception p1

    .line 100
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    const/4 p1, 0x0

    .line 104
    iput-boolean p1, p0, Ll/ith0;->n:Z

    .line 105
    .line 106
    :cond_1
    :goto_0
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/camera/TTCameraConfig;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ush0;->b(Lcom/p1/mobile/putong/camera/TTCameraConfig;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ith0;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 7
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ush0;->k:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ush0;->l:Landroid/hardware/camera2/CameraCharacteristics;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    move-object v6, p3

    .line 10
    goto :goto_1

    .line 11
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/ush0;->a:I

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/ush0;->l:Landroid/hardware/camera2/CameraCharacteristics;

    .line 30
    .line 31
    const-class v2, Landroid/view/SurfaceHolder;

    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Ll/wth0;->k(Landroid/view/Display;Landroid/hardware/camera2/CameraCharacteristics;Ljava/lang/Class;)Ll/wth0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, v0, Ll/wth0$a;->a:Landroid/util/Size;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {p1, v2, v1}, Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;->a(II)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/ush0;->l:Landroid/hardware/camera2/CameraCharacteristics;

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/wth0;->l(Landroid/hardware/camera2/CameraCharacteristics;Ll/wth0$a;)Ll/wth0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Ll/wth0$a;->a:Landroid/util/Size;

    .line 57
    .line 58
    :try_start_0
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p0, v1, v0}, Ll/ith0;->l(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iget-object v3, p0, Ll/ush0;->k:Ljava/lang/String;

    .line 75
    .line 76
    new-instance v1, Ll/dth0;

    .line 77
    .line 78
    move-object v2, p0

    .line 79
    move-object v4, p1

    .line 80
    move-object v5, p2

    .line 81
    move-object v6, p3

    .line 82
    invoke-direct/range {v1 .. v6}, Ll/dth0;-><init>(Ll/ith0;Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :goto_1
    if-eqz v6, :cond_2

    .line 90
    .line 91
    new-instance p0, Ljava/lang/RuntimeException;

    .line 92
    .line 93
    const-string p1, "cameraDevice not found"

    .line 94
    .line 95
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v6, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ith0;->o:Landroid/view/Surface;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ith0;->f()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ush0;->d:Landroid/os/HandlerThread;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->reset()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 33
    .line 34
    :cond_2
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Ll/ith0;->n:Z

    .line 36
    .line 37
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ith0;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final l(II)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/media/MediaRecorder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaRecorder;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setOutputFormat(I)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-static {v0, v1}, Ll/xth0;->e(Ljava/lang/String;I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/ith0;->q:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v2, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setVideoEncoder(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 41
    .line 42
    const/4 v1, 0x3

    .line 43
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioEncoder(I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 47
    .line 48
    iget-object v1, p0, Ll/ith0;->o:Landroid/view/Surface;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setInputSurface(Landroid/view/Surface;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 54
    .line 55
    iget-object v1, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->e()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setVideoFrameRate(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 65
    .line 66
    invoke-virtual {v0, p1, p2}, Landroid/media/MediaRecorder;->setVideoSize(II)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 70
    .line 71
    iget-object v1, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->e()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    mul-int/2addr v1, p1

    .line 78
    mul-int/2addr v1, p2

    .line 79
    div-int/lit8 v1, v1, 0x4

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setVideoEncodingBitRate(I)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 85
    .line 86
    iget-object p2, p0, Ll/ush0;->c:Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    invoke-virtual {p2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    iget-object v0, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->c()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-static {p2, v0}, Ll/wth0;->m(Landroid/view/WindowManager;I)I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p1, p2}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/ith0;->p:Landroid/media/MediaRecorder;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/media/MediaRecorder;->prepare()V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;
    .locals 1

    .line 1
    iput-object p2, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/ith0;->o:Landroid/view/Surface;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/ush0;->e:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-static {p2, v0, p0}, Ll/brd0;->a(Landroid/hardware/camera2/CameraDevice;Ljava/util/List;Landroid/os/Handler;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 2

    .line 1
    iput-object p4, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Ll/ush0;->e:Landroid/os/Handler;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p4, p1, v0, p0}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 29
    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    invoke-interface {p2}, Ll/x20;->call()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception p0

    .line 38
    if-eqz p3, :cond_0

    .line 39
    .line 40
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final synthetic o(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ith0;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic p()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ith0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q(Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ush0;->f:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ush0;->e:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-static {v0, p1, v1}, Ll/brd0;->b(Landroid/hardware/camera2/CameraManager;Ljava/lang/String;Landroid/os/Handler;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/eth0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/eth0;-><init>(Ll/ith0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/fth0;

    .line 19
    .line 20
    invoke-direct {v0, p0, p2, p3, p4}, Ll/fth0;-><init>(Ll/ith0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/gth0;

    .line 24
    .line 25
    invoke-direct {p2, p0, p4}, Ll/gth0;-><init>(Ll/ith0;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    new-instance p3, Ll/hth0;

    .line 29
    .line 30
    invoke-direct {p3, p0}, Ll/hth0;-><init>(Ll/ith0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p2, p3}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

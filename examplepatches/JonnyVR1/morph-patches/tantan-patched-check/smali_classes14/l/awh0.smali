.class public Ll/awh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y6m;


# instance fields
.field public a:Landroid/hardware/Camera;

.field public b:Lcom/p1/mobile/putong/camera/TTCameraConfig;

.field public final c:Lcom/p1/mobile/android/app/Act;

.field public d:Landroid/media/MediaRecorder;

.field public e:Z

.field public f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Ll/awh0;->e:Z

    .line 9
    .line 10
    iput-object v0, p0, Ll/awh0;->f:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p1, p0, Ll/awh0;->c:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/awh0;->e:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, Ll/awh0;->e:Z

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/hardware/Camera;->unlock()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/awh0;->e(Landroid/view/SurfaceView;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/media/MediaRecorder;->start()V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/camera/TTCameraConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/awh0;->b:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 2
    .line 3
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/awh0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 4
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
    :try_start_0
    iget-object v0, p0, Ll/awh0;->b:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->c()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {v0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-le v0, v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    :goto_0
    iget-object v2, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {v3, v0, v1}, Ll/wth0;->j(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    .line 57
    .line 58
    iget v3, v0, Landroid/hardware/Camera$Size;->height:I

    .line 59
    .line 60
    invoke-virtual {p1, v1, v3}, Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;->a(II)V

    .line 61
    .line 62
    .line 63
    iget v1, v0, Landroid/hardware/Camera$Size;->width:I

    .line 64
    .line 65
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 66
    .line 67
    invoke-virtual {v2, v1, v0}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 68
    .line 69
    .line 70
    const-string v0, "continuous-video"

    .line 71
    .line 72
    invoke-virtual {v2, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-virtual {v2, v0}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/awh0;->c:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Ll/awh0;->b:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->c()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iget-object v2, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 103
    .line 104
    invoke-static {v0, v1, v2}, Ll/wth0;->n(Landroid/view/WindowManager;ILandroid/hardware/Camera;)I

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/hardware/Camera;->startPreview()V

    .line 119
    .line 120
    .line 121
    if-eqz p2, :cond_2

    .line 122
    .line 123
    invoke-interface {p2}, Ll/x20;->call()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :goto_1
    if-eqz p3, :cond_2

    .line 128
    .line 129
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/awh0;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 11
    .line 12
    return-void
.end method

.method public final e(Landroid/view/SurfaceView;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/media/MediaRecorder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaRecorder;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 7
    .line 8
    iget-object v1, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setCamera(Landroid/hardware/Camera;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 14
    .line 15
    const/4 v1, 0x5

    .line 16
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setAudioSource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v0, v2}, Landroid/media/MediaRecorder;->setVideoSource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 26
    .line 27
    iget-object v2, p0, Ll/awh0;->b:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->c()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {v2, v1}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/media/MediaRecorder;->setProfile(Landroid/media/CamcorderProfile;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    const/4 v1, 0x2

    .line 42
    invoke-static {v0, v1}, Ll/xth0;->e(Ljava/lang/String;I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/awh0;->f:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v1, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/media/MediaRecorder;->setOutputFile(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v0, p1}, Landroid/media/MediaRecorder;->setPreviewDisplay(Landroid/view/Surface;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 67
    .line 68
    iget-object v0, p0, Ll/awh0;->c:Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Ll/awh0;->b:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->c()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-static {v0, v1}, Ll/wth0;->m(Landroid/view/WindowManager;I)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-virtual {p1, v0}, Landroid/media/MediaRecorder;->setOrientationHint(I)V

    .line 85
    .line 86
    .line 87
    :try_start_0
    iget-object p0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/media/MediaRecorder;->prepare()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :catch_0
    move-exception p0

    .line 94
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->reset()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaRecorder;->release()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/awh0;->d:Landroid/media/MediaRecorder;

    .line 15
    .line 16
    iget-object v0, p0, Ll/awh0;->a:Landroid/hardware/Camera;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/hardware/Camera;->lock()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/awh0;->e:Z

    .line 23
    .line 24
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/awh0;->e:Z

    .line 2
    .line 3
    return p0
.end method

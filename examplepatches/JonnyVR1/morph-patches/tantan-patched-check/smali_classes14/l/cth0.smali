.class public Ll/cth0;
.super Ll/ush0;
.source "SourceFile"

# interfaces
.implements Ll/mxh0$b;


# instance fields
.field public n:Ll/mxh0;

.field public o:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/d3i0;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/ma5;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qcj<",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ush0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/cth0;->o:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/cth0;->q:Ljava/util/List;

    .line 16
    .line 17
    new-instance v0, Ll/vsh0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/vsh0;-><init>(Ll/cth0;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/cth0;->q:Ljava/util/List;

    .line 26
    .line 27
    new-instance v0, Ll/wsh0;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/wsh0;-><init>(Ll/cth0;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic e(Ll/cth0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cth0;->s(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V

    return-void
.end method

.method public static synthetic g(Ll/cth0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cth0;->r(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Ll/cth0;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cth0;->q(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Ll/cth0;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cth0;->p(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/cth0;Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cth0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    return-void
.end method

.method public static synthetic l(Ll/cth0;Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cth0;->t(Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m(Ll/cth0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cth0;->u()V

    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
    .locals 6
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
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ush0;->l:Landroid/hardware/camera2/CameraCharacteristics;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v2, p0, Ll/ush0;->l:Landroid/hardware/camera2/CameraCharacteristics;

    .line 15
    .line 16
    const-class v3, Landroid/view/SurfaceHolder;

    .line 17
    .line 18
    invoke-static {v0, v2, v3}, Ll/wth0;->k(Landroid/view/Display;Landroid/hardware/camera2/CameraCharacteristics;Ljava/lang/Class;)Ll/wth0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Ll/wth0$a;->a:Landroid/util/Size;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;->a(II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    new-instance v0, Ll/mxh0;

    .line 44
    .line 45
    iget-object v4, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 46
    .line 47
    invoke-virtual {v4}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->f()I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    add-int/lit8 v5, v4, 0x1

    .line 52
    .line 53
    const/16 v4, 0x100

    .line 54
    .line 55
    move-object v1, p0

    .line 56
    invoke-direct/range {v0 .. v5}, Ll/mxh0;-><init>(Ll/cth0;IIII)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ll/cth0;->n:Ll/mxh0;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ll/mxh0;->f(Ll/mxh0$b;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ll/ush0;->k:Ljava/lang/String;

    .line 65
    .line 66
    new-instance v0, Ll/xsh0;

    .line 67
    .line 68
    move-object v3, p1

    .line 69
    move-object v4, p2

    .line 70
    move-object v5, p3

    .line 71
    invoke-direct/range {v0 .. v5}, Ll/xsh0;-><init>(Ll/cth0;Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    .line 79
    .line 80
    new-instance v0, Ljava/lang/RuntimeException;

    .line 81
    .line 82
    const-string v1, "cameraDevice not found"

    .line 83
    .line 84
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {p3, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cth0;->w()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ush0;->d:Landroid/os/HandlerThread;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/qcj<",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cth0;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/d3i0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cth0;->o:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cth0;->o:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1}, Ll/d3i0;->b(Ljava/lang/Throwable;)Ll/d3i0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cth0;->o:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1}, Ll/d3i0;->a(Ljava/lang/String;)Ll/d3i0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget v0, p0, Ll/ush0;->a:I

    .line 2
    .line 3
    iget p0, p0, Ll/ush0;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    int-to-float p0, v0

    .line 7
    invoke-static {p1, p0}, Ll/mth0;->b(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic q(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cth0;->p:Ll/ma5;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/mth0;->a(Landroid/graphics/Bitmap;Ll/ma5;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Landroid/hardware/camera2/CameraDevice;)Lrx/c;
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
    iget-object p1, p0, Ll/cth0;->n:Ll/mxh0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/mxh0;->e()Landroid/view/Surface;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ush0;->e:Landroid/os/Handler;

    .line 29
    .line 30
    invoke-static {p2, v0, p0}, Ll/brd0;->a(Landroid/hardware/camera2/CameraDevice;Ljava/util/List;Landroid/os/Handler;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 4

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
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 11
    .line 12
    const/4 v3, 0x4

    .line 13
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v0, v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/ush0;->j:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/camera/TTCameraConfig;->h()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v2, "hand_idCard"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, p1, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception p0

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    :goto_0
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p0, p0, Ll/ush0;->e:Landroid/os/Handler;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-virtual {p4, p1, v0, p0}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 65
    .line 66
    .line 67
    if-eqz p2, :cond_1

    .line 68
    .line 69
    invoke-interface {p2}, Ll/x20;->call()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :goto_1
    if-eqz p3, :cond_1

    .line 74
    .line 75
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public final synthetic t(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cth0;->w()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final synthetic u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cth0;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v(Ljava/lang/String;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V
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
    new-instance v0, Ll/ysh0;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/ysh0;-><init>(Ll/cth0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/zsh0;

    .line 19
    .line 20
    invoke-direct {v0, p0, p2, p3, p4}, Ll/zsh0;-><init>(Ll/cth0;Lcom/p1/mobile/putong/camera/widget/TTFullScreenAutoFitSurfaceView;Ll/x20;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/ath0;

    .line 24
    .line 25
    invoke-direct {p2, p0, p4}, Ll/ath0;-><init>(Ll/cth0;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    new-instance p3, Ll/bth0;

    .line 29
    .line 30
    invoke-direct {p3, p0}, Ll/bth0;-><init>(Ll/cth0;)V

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

.method public w()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Ll/cth0;->n:Ll/mxh0;

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/mxh0;->d()V

    .line 25
    .line 26
    .line 27
    :cond_2
    return-void
.end method

.method public x(Ll/ma5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cth0;->p:Ll/ma5;

    .line 2
    .line 3
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cth0;->n:Ll/mxh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ush0;->h:Landroid/hardware/camera2/CameraDevice;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ush0;->i:Landroid/hardware/camera2/CameraCaptureSession;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/mxh0;->g(Landroid/hardware/camera2/CameraDevice;Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/cth0;->o:Lrx/subjects/b;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/RuntimeException;

    .line 16
    .line 17
    const-string v1, "TTImageReader is not ready"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/d3i0;->b(Ljava/lang/Throwable;)Ll/d3i0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

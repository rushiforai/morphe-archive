.class public Lcom/tencent/could/aicamare/CameraHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final EVENT_AUTO_FOCUS_CAMERA:I = 0x3

.field public static final EVENT_CHANGE_CAMERA_PARAMETER:I = 0x8

.field public static final EVENT_CHANGE_ZOOM:I = 0x4

.field public static final EVENT_CLOSE_CAMERA:I = 0x2

.field public static final EVENT_LIFE_CYCLE_START_PREVIEW:I = 0x6

.field public static final EVENT_LIFE_CYCLE_STOP_PREVIEW:I = 0x7

.field public static final EVENT_OPEN_CAMERA:I = 0x1

.field public static final EVENT_START_PREVIEW:I = 0x5

.field public static final PARAMETER_EXPOSURE_COMPENSATION:Ljava/lang/String; = "camera_param_exposure"

.field public static final PARAMETER_WHITE_BALANCE:Ljava/lang/String; = "camera_param_white_balance"

.field public static final PARAMETER_ZOOM_VALUE:Ljava/lang/String; = "camera_param_zoom"

.field public static final TAG:Ljava/lang/String; = "CameraHolder"


# instance fields
.field public cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

.field public cameraHolderImp:Lcom/tencent/could/aicamare/d;

.field public eventListener:Lcom/tencent/could/aicamare/callback/CameraEventListener;

.field public volatile handler:Landroid/os/Handler;

.field public handlerThread:Landroid/os/HandlerThread;

.field public volatile isUseSurfaceHolder:Z

.field public loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

.field public oldDist:F

.field public surfaceHolder:Landroid/view/SurfaceHolder;

.field public surfaceTexture:Landroid/graphics/SurfaceTexture;

.field public transformMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->isUseSurfaceHolder:Z

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->oldDist:F

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 17
    .line 18
    new-instance v0, Lcom/tencent/could/aicamare/d;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/tencent/could/aicamare/d;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic access$000(Lcom/tencent/could/aicamare/CameraHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doOpenCamera()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/tencent/could/aicamare/CameraHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doCloseCamera()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/tencent/could/aicamare/CameraHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doStartPreview()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/tencent/could/aicamare/CameraHolder;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->doAutoFocus(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/tencent/could/aicamare/CameraHolder;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->doChangeZoom(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/tencent/could/aicamare/CameraHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doLifeResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/tencent/could/aicamare/CameraHolder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doLifeOnPause()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/tencent/could/aicamare/CameraHolder;)Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 2
    .line 3
    return-object p0
.end method

.method private cleanAllListener()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->eventListener:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iput-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->eventListener:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 13
    .line 14
    :cond_1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 15
    .line 16
    if-eqz p0, :cond_3

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iput-object v1, p0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 23
    .line 24
    :cond_2
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    iput-object v1, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 29
    .line 30
    :cond_3
    return-void
.end method

.method private computePreviewMatrix(Landroid/view/TextureView;Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Matrix;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroid/graphics/Point;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/could/aicamare/CameraHolder;->getDisplayRotate()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    rem-int/lit16 p0, p0, 0xb4

    .line 24
    .line 25
    const/high16 p1, 0x40000000    # 2.0f

    .line 26
    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    iget p0, p3, Landroid/graphics/Point;->x:I

    .line 32
    .line 33
    int-to-float p0, p0

    .line 34
    mul-float/2addr p0, v1

    .line 35
    iget v2, p2, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    div-float/2addr p0, v2

    .line 39
    iget v2, p3, Landroid/graphics/Point;->y:I

    .line 40
    .line 41
    int-to-float v2, v2

    .line 42
    mul-float/2addr v2, v1

    .line 43
    iget v3, p2, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    int-to-float v3, v3

    .line 46
    div-float/2addr v2, v3

    .line 47
    invoke-static {p0, v2}, Ljava/lang/Math;->max(FF)F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    iget v4, p2, Landroid/graphics/Point;->y:I

    .line 52
    .line 53
    int-to-float v4, v4

    .line 54
    mul-float/2addr v4, v3

    .line 55
    iget p2, p2, Landroid/graphics/Point;->x:I

    .line 56
    .line 57
    int-to-float p2, p2

    .line 58
    mul-float/2addr p2, v3

    .line 59
    iget v5, p3, Landroid/graphics/Point;->x:I

    .line 60
    .line 61
    int-to-float v5, v5

    .line 62
    sub-float/2addr v5, v4

    .line 63
    div-float/2addr v5, p1

    .line 64
    float-to-int v4, v5

    .line 65
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 66
    .line 67
    :goto_0
    int-to-float p3, p3

    .line 68
    sub-float/2addr p3, p2

    .line 69
    div-float/2addr p3, p1

    .line 70
    float-to-int p1, p3

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    iget p0, p3, Landroid/graphics/Point;->x:I

    .line 73
    .line 74
    int-to-float p0, p0

    .line 75
    mul-float/2addr p0, v1

    .line 76
    iget v2, p2, Landroid/graphics/Point;->x:I

    .line 77
    .line 78
    int-to-float v2, v2

    .line 79
    div-float/2addr p0, v2

    .line 80
    iget v2, p3, Landroid/graphics/Point;->y:I

    .line 81
    .line 82
    int-to-float v2, v2

    .line 83
    mul-float/2addr v2, v1

    .line 84
    iget v3, p2, Landroid/graphics/Point;->y:I

    .line 85
    .line 86
    int-to-float v3, v3

    .line 87
    div-float/2addr v2, v3

    .line 88
    invoke-static {p0, v2}, Ljava/lang/Math;->max(FF)F

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    iget v4, p2, Landroid/graphics/Point;->x:I

    .line 93
    .line 94
    int-to-float v4, v4

    .line 95
    mul-float/2addr v4, v3

    .line 96
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 97
    .line 98
    int-to-float p2, p2

    .line 99
    mul-float/2addr p2, v3

    .line 100
    iget v5, p3, Landroid/graphics/Point;->x:I

    .line 101
    .line 102
    int-to-float v5, v5

    .line 103
    sub-float/2addr v5, v4

    .line 104
    div-float/2addr v5, p1

    .line 105
    float-to-int v4, v5

    .line 106
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :goto_1
    div-float p0, v1, p0

    .line 110
    .line 111
    div-float/2addr v1, v2

    .line 112
    invoke-virtual {v0, p0, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v3, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 116
    .line 117
    .line 118
    int-to-float p0, v4

    .line 119
    int-to-float p1, p1

    .line 120
    invoke-virtual {v0, p0, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 121
    .line 122
    .line 123
    return-object v0
.end method

.method private createHandlerThread()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "camera-preview"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handlerThread:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/tencent/could/aicamare/CameraHolder$a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handlerThread:Landroid/os/HandlerThread;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p0, v1}, Lcom/tencent/could/aicamare/CameraHolder$a;-><init>(Lcom/tencent/could/aicamare/CameraHolder;Landroid/os/Looper;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 25
    .line 26
    return-void
.end method

.method private createTransformMatrix(Landroid/view/TextureView;)Landroid/graphics/Matrix;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "CameraHolder"

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 7
    .line 8
    const-string p1, "createTransformMatrix textureView == null"

    .line 9
    .line 10
    invoke-static {v1, p1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 11
    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    iget-object v2, p0, Lcom/tencent/could/aicamare/CameraHolder;->transformMatrix:Landroid/graphics/Matrix;

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/could/aicamare/CameraHolder;->getCameraSize()Landroid/hardware/Camera$Size;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-nez v2, :cond_3

    .line 24
    .line 25
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 26
    .line 27
    const-string v2, "createTransformMatrix size == null"

    .line 28
    .line 29
    invoke-static {v1, v2, p1}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->eventListener:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 33
    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    const/4 p1, 0x3

    .line 37
    const-string v1, "createTransformMatrix size is null"

    .line 38
    .line 39
    invoke-interface {p0, p1, v1}, Lcom/tencent/could/aicamare/callback/CameraEventListener;->onEventError(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-object v0

    .line 43
    :cond_3
    new-instance v0, Landroid/graphics/Point;

    .line 44
    .line 45
    iget v1, v2, Landroid/hardware/Camera$Size;->width:I

    .line 46
    .line 47
    iget v2, v2, Landroid/hardware/Camera$Size;->height:I

    .line 48
    .line 49
    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Landroid/graphics/Point;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-direct {v1, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0, p1, v0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->computePreviewMatrix(Landroid/view/TextureView;Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Matrix;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->transformMatrix:Landroid/graphics/Matrix;

    .line 70
    .line 71
    return-object p1
.end method

.method private doAutoFocus(Z)V
    .locals 8

    .line 1
    const-string v0, "continuous-video"

    .line 2
    .line 3
    const-string v1, "auto"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 6
    .line 7
    if-eqz p0, :cond_7

    .line 8
    .line 9
    iget-boolean v2, p0, Lcom/tencent/could/aicamare/d;->e:Z

    .line 10
    .line 11
    const/4 v3, 0x4

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const-string p1, "isFocusing!"

    .line 15
    .line 16
    invoke-virtual {p0, v3, p1}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v2, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    const-string p1, "current camera is null!"

    .line 27
    .line 28
    invoke-virtual {p0, v3, p1}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :try_start_0
    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-nez v4, :cond_2

    .line 37
    .line 38
    const-string p1, "current camera  parameters is null!"

    .line 39
    .line 40
    invoke-virtual {p0, v3, p1}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p1

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v5, 0x1

    .line 47
    iput-boolean v5, p0, Lcom/tencent/could/aicamare/d;->e:Z

    .line 48
    .line 49
    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    const-string v6, "there is no need change auto mode"

    .line 58
    .line 59
    const/4 v7, 0x0

    .line 60
    if-eqz v5, :cond_3

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    :try_start_1
    iput-boolean v7, p0, Lcom/tencent/could/aicamare/d;->e:Z

    .line 65
    .line 66
    invoke-virtual {p0, v3, v6}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_4

    .line 79
    .line 80
    invoke-virtual {v4, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 84
    .line 85
    .line 86
    :cond_4
    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_5

    .line 95
    .line 96
    iput-boolean v7, p0, Lcom/tencent/could/aicamare/d;->e:Z

    .line 97
    .line 98
    invoke-virtual {p0, v3, v6}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_6

    .line 107
    .line 108
    invoke-virtual {v4, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    new-instance p1, Lcom/tencent/could/aicamare/a;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Lcom/tencent/could/aicamare/a;-><init>(Lcom/tencent/could/aicamare/d;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, p1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string v1, "there is some error with set auto mode + e: "

    .line 126
    .line 127
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Lcom/tencent/could/aicamare/d;->b(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    :cond_7
    return-void
.end method

.method private doChangeZoom(Z)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    const-string v0, "current camera is null"

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getZoom()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    if-ge v3, v2, :cond_1

    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    if-lez v3, :cond_2

    .line 44
    .line 45
    add-int/lit8 v3, v3, -0x1

    .line 46
    .line 47
    :cond_2
    :goto_0
    invoke-virtual {v1, v3}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catch_0
    move-exception p1

    .line 55
    goto :goto_1

    .line 56
    :cond_3
    const-string p1, "this camera do not support"

    .line 57
    .line 58
    :try_start_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 59
    .line 60
    const-string v1, "CameraHolderImp"

    .line 61
    .line 62
    invoke-static {v1, p1, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v1, "doChangeZoom error: "

    .line 69
    .line 70
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Lcom/tencent/could/aicamare/d;->b(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_4
    return-void
.end method

.method private doCloseCamera()V
    .locals 6

    .line 1
    const-string v0, "some error happen in close e: "

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 4
    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 8
    .line 9
    const-string v2, "CameraHolderImp"

    .line 10
    .line 11
    const-string v3, "do close camera"

    .line 12
    .line 13
    invoke-static {v2, v3, v1}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 23
    .line 24
    const-string v0, "CameraHolderImp"

    .line 25
    .line 26
    const-string v1, "do close camera is null!"

    .line 27
    .line 28
    invoke-static {v0, v1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-class v2, Lcom/tencent/could/aicamare/d;

    .line 33
    .line 34
    monitor-enter v2

    .line 35
    :try_start_0
    iget-object v3, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    iput-object v4, v3, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 39
    .line 40
    iput-object v4, v3, Lcom/tencent/could/aicamare/entity/a;->d:Landroid/hardware/Camera$Size;

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    iput v5, v3, Lcom/tencent/could/aicamare/entity/a;->b:I

    .line 44
    .line 45
    iput v5, v3, Lcom/tencent/could/aicamare/entity/a;->c:I

    .line 46
    .line 47
    iput v5, v3, Lcom/tencent/could/aicamare/entity/a;->e:I

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/hardware/Camera;->stopPreview()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v4}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v4}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    const-string v1, "close camera success\uff01"

    .line 65
    .line 66
    :try_start_1
    iget-object v3, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 67
    .line 68
    const-string v4, "CameraHolderImp"

    .line 69
    .line 70
    invoke-static {v4, v1, v3}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    invoke-interface {v1}, Lcom/tencent/could/aicamare/callback/CameraEventListener;->onCameraClosed()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :catch_0
    move-exception v1

    .line 84
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Lcom/tencent/could/aicamare/d;->b(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const/4 v1, 0x2

    .line 104
    invoke-virtual {p0, v1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_1
    :goto_0
    monitor-exit v2

    .line 108
    goto :goto_2

    .line 109
    :goto_1
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 110
    throw p0

    .line 111
    :cond_2
    :goto_2
    return-void
.end method

.method private doLifeOnPause()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v0, v0, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    :goto_0
    return-void

    .line 16
    :cond_2
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception v0

    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "doLifeResume error: e "

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 40
    .line 41
    const-string v1, "CameraHolder"

    .line 42
    .line 43
    invoke-static {v1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private doLifeResume()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    iget-object v0, v0, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    :goto_0
    return-void

    .line 16
    :cond_2
    :try_start_0
    iget-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Lcom/tencent/could/aicamare/d;->a(Landroid/hardware/Camera;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "doLifeResume error: e "

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 45
    .line 46
    const-string v1, "CameraHolder"

    .line 47
    .line 48
    invoke-static {v1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private doOpenCamera()V
    .locals 30

    .line 1
    const-string v1, "Exception e: "

    .line 2
    .line 3
    const-string v2, "continuous-video"

    .line 4
    .line 5
    move-object/from16 v0, p0

    .line 6
    .line 7
    iget-object v3, v0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 8
    .line 9
    if-eqz v3, :cond_33

    .line 10
    .line 11
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v4, "CameraHolderImp"

    .line 16
    .line 17
    const/4 v5, 0x1

    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const-string v0, "There are not camera devices found!"

    .line 21
    .line 22
    invoke-virtual {v3, v5, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto/16 :goto_1c

    .line 26
    .line 27
    :cond_0
    :try_start_0
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isBackCamera()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    xor-int/2addr v0, v5

    .line 34
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    new-instance v7, Landroid/hardware/Camera$CameraInfo;

    .line 39
    .line 40
    invoke-direct {v7}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 41
    .line 42
    .line 43
    const/4 v9, 0x0

    .line 44
    :goto_0
    const/16 v10, -0x328

    .line 45
    .line 46
    if-ge v9, v6, :cond_2

    .line 47
    .line 48
    invoke-static {v9, v7}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 49
    .line 50
    .line 51
    iget v11, v7, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 52
    .line 53
    if-ne v11, v0, :cond_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    add-int/lit8 v9, v9, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catch_0
    move-exception v0

    .line 60
    goto/16 :goto_1b

    .line 61
    .line 62
    :cond_2
    move v9, v10

    .line 63
    :goto_1
    if-ne v9, v10, :cond_3

    .line 64
    .line 65
    const-string v0, "can not find a suit camera devices!"

    .line 66
    .line 67
    invoke-virtual {v3, v5, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto/16 :goto_1c

    .line 71
    .line 72
    :cond_3
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 73
    .line 74
    iput v9, v0, Lcom/tencent/could/aicamare/entity/a;->b:I

    .line 75
    .line 76
    invoke-static {v9}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    iput-object v6, v0, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->f:Ljava/lang/ref/WeakReference;

    .line 83
    .line 84
    if-nez v0, :cond_4

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    goto :goto_2

    .line 88
    :cond_4
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Landroid/content/Context;

    .line 93
    .line 94
    :goto_2
    if-nez v0, :cond_5

    .line 95
    .line 96
    const-string v0, "open camera context is null!"

    .line 97
    .line 98
    invoke-virtual {v3, v5, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto/16 :goto_1c

    .line 102
    .line 103
    :cond_5
    iget-object v7, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 104
    .line 105
    invoke-virtual {v7}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isBackCamera()Z

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    xor-int/2addr v7, v5

    .line 110
    iget-object v9, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 111
    .line 112
    iget v9, v9, Lcom/tencent/could/aicamare/entity/a;->b:I

    .line 113
    .line 114
    new-instance v10, Landroid/hardware/Camera$CameraInfo;

    .line 115
    .line 116
    invoke-direct {v10}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {v9, v10}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 120
    .line 121
    .line 122
    const-string v9, "window"

    .line 123
    .line 124
    invoke-virtual {v0, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Landroid/view/WindowManager;

    .line 129
    .line 130
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    new-instance v9, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v11, "row DefaultDisplay rotation:"

    .line 141
    .line 142
    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    mul-int/lit8 v11, v0, 0x5a

    .line 146
    .line 147
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v9

    .line 154
    invoke-virtual {v3, v9}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const/16 v9, 0x10e

    .line 158
    .line 159
    const/4 v11, 0x2

    .line 160
    const/16 v12, 0xb4

    .line 161
    .line 162
    const/4 v13, 0x3

    .line 163
    const/16 v14, 0x5a

    .line 164
    .line 165
    if-eq v0, v5, :cond_8

    .line 166
    .line 167
    if-eq v0, v11, :cond_7

    .line 168
    .line 169
    if-eq v0, v13, :cond_6

    .line 170
    .line 171
    const/4 v0, 0x0

    .line 172
    goto :goto_3

    .line 173
    :cond_6
    move v0, v9

    .line 174
    goto :goto_3

    .line 175
    :cond_7
    move v0, v12

    .line 176
    goto :goto_3

    .line 177
    :cond_8
    move v0, v14

    .line 178
    :goto_3
    iget v15, v10, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 179
    .line 180
    iget v6, v10, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 181
    .line 182
    if-ne v15, v5, :cond_9

    .line 183
    .line 184
    add-int/2addr v6, v0

    .line 185
    rem-int/lit16 v6, v6, 0x168

    .line 186
    .line 187
    rsub-int v6, v6, 0x168

    .line 188
    .line 189
    rem-int/lit16 v6, v6, 0x168

    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_9
    sub-int/2addr v6, v0

    .line 193
    add-int/lit16 v6, v6, 0x168

    .line 194
    .line 195
    rem-int/lit16 v6, v6, 0x168

    .line 196
    .line 197
    :goto_4
    new-instance v15, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const/16 v16, 0x0

    .line 200
    .line 201
    const-string v8, "CameraInfo.orientation: "

    .line 202
    .line 203
    invoke-direct {v15, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget v8, v10, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 207
    .line 208
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v8, " | isLand: "

    .line 212
    .line 213
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-object v8, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 217
    .line 218
    invoke-virtual {v8}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isLand()Z

    .line 219
    .line 220
    .line 221
    move-result v8

    .line 222
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    const-string v8, " | DeviceRotation: "

    .line 226
    .line 227
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v8, " | FinalOrientation: "

    .line 234
    .line 235
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v8, " | CameraFacing: "

    .line 242
    .line 243
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    iget v8, v10, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 247
    .line 248
    if-ne v8, v5, :cond_a

    .line 249
    .line 250
    const-string v8, "Front"

    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_a
    const-string v8, "Back"

    .line 254
    .line 255
    :goto_5
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v8

    .line 262
    invoke-virtual {v3, v8}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    iget-object v8, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 266
    .line 267
    invoke-virtual {v8}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isLand()Z

    .line 268
    .line 269
    .line 270
    move-result v8

    .line 271
    if-nez v8, :cond_b

    .line 272
    .line 273
    iget-object v8, v3, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 274
    .line 275
    const-string v10, "not land, and camera facing front"

    .line 276
    .line 277
    invoke-static {v4, v10, v8}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 278
    .line 279
    .line 280
    if-ne v6, v12, :cond_b

    .line 281
    .line 282
    if-ne v0, v9, :cond_b

    .line 283
    .line 284
    move v6, v14

    .line 285
    :cond_b
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 286
    .line 287
    iput v6, v0, Lcom/tencent/could/aicamare/entity/a;->e:I

    .line 288
    .line 289
    const/4 v0, 0x5

    .line 290
    const/4 v8, 0x7

    .line 291
    if-ne v6, v14, :cond_c

    .line 292
    .line 293
    move v6, v8

    .line 294
    goto :goto_6

    .line 295
    :cond_c
    if-ne v6, v12, :cond_d

    .line 296
    .line 297
    move v6, v13

    .line 298
    goto :goto_6

    .line 299
    :cond_d
    if-ne v6, v9, :cond_e

    .line 300
    .line 301
    move v6, v0

    .line 302
    goto :goto_6

    .line 303
    :cond_e
    new-instance v9, Ljava/lang/StringBuilder;

    .line 304
    .line 305
    const-string v10, "camera rotate not 90 degree or 180 degree, input cameraRotate: "

    .line 306
    .line 307
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v6

    .line 317
    invoke-virtual {v3, v6}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    move v6, v5

    .line 321
    :goto_6
    if-ne v7, v5, :cond_f

    .line 322
    .line 323
    move v11, v6

    .line 324
    goto :goto_7

    .line 325
    :cond_f
    if-ne v6, v5, :cond_10

    .line 326
    .line 327
    goto :goto_7

    .line 328
    :cond_10
    if-ne v6, v11, :cond_11

    .line 329
    .line 330
    move v11, v5

    .line 331
    goto :goto_7

    .line 332
    :cond_11
    const/4 v11, 0x4

    .line 333
    if-ne v6, v13, :cond_12

    .line 334
    .line 335
    goto :goto_7

    .line 336
    :cond_12
    if-ne v6, v11, :cond_13

    .line 337
    .line 338
    move v11, v13

    .line 339
    goto :goto_7

    .line 340
    :cond_13
    if-ne v6, v0, :cond_14

    .line 341
    .line 342
    const/16 v11, 0x8

    .line 343
    .line 344
    goto :goto_7

    .line 345
    :cond_14
    const/4 v11, 0x6

    .line 346
    if-ne v6, v11, :cond_15

    .line 347
    .line 348
    move v11, v8

    .line 349
    goto :goto_7

    .line 350
    :cond_15
    if-ne v6, v8, :cond_16

    .line 351
    .line 352
    goto :goto_7

    .line 353
    :cond_16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 354
    .line 355
    const-string v9, "[CameraSetting.transBackFacingCameraRatateTag] unsurported rotateTag: "

    .line 356
    .line 357
    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-virtual {v3, v0}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    move/from16 v11, v16

    .line 371
    .line 372
    :goto_7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    const-string v6, "cameraFacing: "

    .line 375
    .line 376
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    const-string v6, " rotateTag: "

    .line 383
    .line 384
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    invoke-virtual {v3, v0}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 398
    .line 399
    iput v11, v0, Lcom/tencent/could/aicamare/entity/a;->c:I

    .line 400
    .line 401
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 402
    .line 403
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->getPreWidth()I

    .line 404
    .line 405
    .line 406
    move-result v6

    .line 407
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 408
    .line 409
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->getPreHeight()I

    .line 410
    .line 411
    .line 412
    move-result v7

    .line 413
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 414
    .line 415
    iget-object v9, v0, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 416
    .line 417
    if-nez v9, :cond_17

    .line 418
    .line 419
    const-string v0, "init camera fail, current camera is null!"

    .line 420
    .line 421
    invoke-virtual {v3, v5, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 422
    .line 423
    .line 424
    goto/16 :goto_1a

    .line 425
    .line 426
    :cond_17
    :try_start_1
    invoke-virtual {v9}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 427
    .line 428
    .line 429
    move-result-object v10
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_5

    .line 430
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 431
    .line 432
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isBackCamera()Z

    .line 433
    .line 434
    .line 435
    move-result v0

    .line 436
    if-eqz v0, :cond_1f

    .line 437
    .line 438
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 439
    .line 440
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->getZoom()Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    sget-object v11, Lcom/tencent/could/aicamare/enums/CameraZoom;->ZOOM_1X:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 445
    .line 446
    if-ne v0, v11, :cond_18

    .line 447
    .line 448
    goto :goto_b

    .line 449
    :cond_18
    sget-object v11, Lcom/tencent/could/aicamare/enums/CameraZoom;->ZOOM_1_5X:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 450
    .line 451
    if-ne v0, v11, :cond_19

    .line 452
    .line 453
    const/16 v0, 0x96

    .line 454
    .line 455
    goto :goto_8

    .line 456
    :cond_19
    sget-object v11, Lcom/tencent/could/aicamare/enums/CameraZoom;->ZOOM_2X:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 457
    .line 458
    if-ne v0, v11, :cond_1a

    .line 459
    .line 460
    const/16 v0, 0xc8

    .line 461
    .line 462
    goto :goto_8

    .line 463
    :cond_1a
    move/from16 v0, v16

    .line 464
    .line 465
    :goto_8
    :try_start_2
    iget-object v11, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 466
    .line 467
    iget-object v11, v11, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 468
    .line 469
    if-eqz v11, :cond_1e

    .line 470
    .line 471
    invoke-virtual {v11}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 472
    .line 473
    .line 474
    move-result-object v11

    .line 475
    invoke-virtual {v11}, Landroid/hardware/Camera$Parameters;->getZoomRatios()Ljava/util/List;

    .line 476
    .line 477
    .line 478
    move-result-object v11

    .line 479
    move/from16 v13, v16

    .line 480
    .line 481
    :goto_9
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 482
    .line 483
    .line 484
    move-result v14

    .line 485
    if-ge v13, v14, :cond_1e

    .line 486
    .line 487
    invoke-interface {v11, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    move-result-object v14

    .line 491
    check-cast v14, Ljava/lang/Integer;

    .line 492
    .line 493
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    .line 494
    .line 495
    .line 496
    move-result v14

    .line 497
    if-ne v14, v0, :cond_1b

    .line 498
    .line 499
    goto :goto_c

    .line 500
    :cond_1b
    if-le v14, v0, :cond_1d

    .line 501
    .line 502
    sub-int/2addr v14, v0

    .line 503
    add-int/lit8 v15, v13, -0x1

    .line 504
    .line 505
    invoke-interface {v11, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 506
    .line 507
    .line 508
    move-result-object v11

    .line 509
    check-cast v11, Ljava/lang/Integer;

    .line 510
    .line 511
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 512
    .line 513
    .line 514
    move-result v11
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 515
    sub-int/2addr v0, v11

    .line 516
    if-ge v14, v0, :cond_1c

    .line 517
    .line 518
    goto :goto_c

    .line 519
    :cond_1c
    move v13, v15

    .line 520
    goto :goto_c

    .line 521
    :catch_1
    move-exception v0

    .line 522
    goto :goto_a

    .line 523
    :cond_1d
    add-int/lit8 v13, v13, 0x1

    .line 524
    .line 525
    goto :goto_9

    .line 526
    :goto_a
    new-instance v11, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    const-string v13, "getZoomIndex error: "

    .line 529
    .line 530
    invoke-direct {v11, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 531
    .line 532
    .line 533
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    .line 539
    .line 540
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object v0

    .line 544
    invoke-virtual {v3, v0}, Lcom/tencent/could/aicamare/d;->b(Ljava/lang/String;)V

    .line 545
    .line 546
    .line 547
    :cond_1e
    :goto_b
    move/from16 v13, v16

    .line 548
    .line 549
    :goto_c
    invoke-virtual {v10, v13}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 550
    .line 551
    .line 552
    :cond_1f
    invoke-virtual {v10}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    .line 557
    .line 558
    .line 559
    move-result v11

    .line 560
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 561
    .line 562
    .line 563
    move-result v13

    .line 564
    int-to-double v14, v11

    .line 565
    move/from16 v17, v5

    .line 566
    .line 567
    move/from16 v18, v6

    .line 568
    .line 569
    int-to-double v5, v13

    .line 570
    div-double v19, v14, v5

    .line 571
    .line 572
    new-instance v8, Ljava/util/ArrayList;

    .line 573
    .line 574
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 575
    .line 576
    .line 577
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 578
    .line 579
    .line 580
    move-result-object v21

    .line 581
    :goto_d
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    .line 582
    .line 583
    .line 584
    move-result v22

    .line 585
    if-eqz v22, :cond_22

    .line 586
    .line 587
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v22

    .line 591
    move-object/from16 v12, v22

    .line 592
    .line 593
    check-cast v12, Landroid/hardware/Camera$Size;

    .line 594
    .line 595
    move-object/from16 v22, v0

    .line 596
    .line 597
    iget v0, v12, Landroid/hardware/Camera$Size;->height:I

    .line 598
    .line 599
    move-wide/from16 v23, v5

    .line 600
    .line 601
    int-to-double v5, v0

    .line 602
    iget v0, v12, Landroid/hardware/Camera$Size;->width:I

    .line 603
    .line 604
    move-wide/from16 v25, v5

    .line 605
    .line 606
    int-to-double v5, v0

    .line 607
    div-double v5, v25, v5

    .line 608
    .line 609
    const-wide/high16 v25, 0x3fe8000000000000L    # 0.75

    .line 610
    .line 611
    cmpl-double v0, v5, v25

    .line 612
    .line 613
    if-nez v0, :cond_20

    .line 614
    .line 615
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    :cond_20
    const-wide/high16 v25, 0x3fe2000000000000L    # 0.5625

    .line 619
    .line 620
    cmpl-double v0, v5, v25

    .line 621
    .line 622
    if-nez v0, :cond_21

    .line 623
    .line 624
    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 625
    .line 626
    .line 627
    :cond_21
    move-object/from16 v0, v22

    .line 628
    .line 629
    move-wide/from16 v5, v23

    .line 630
    .line 631
    const/16 v12, 0xb4

    .line 632
    .line 633
    goto :goto_d

    .line 634
    :cond_22
    move-object/from16 v22, v0

    .line 635
    .line 636
    move-wide/from16 v23, v5

    .line 637
    .line 638
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 639
    .line 640
    .line 641
    move-result v0

    .line 642
    if-nez v0, :cond_23

    .line 643
    .line 644
    move-object/from16 v0, v22

    .line 645
    .line 646
    goto :goto_e

    .line 647
    :cond_23
    move-object v0, v8

    .line 648
    :goto_e
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 649
    .line 650
    .line 651
    move-result-object v5

    .line 652
    const-wide v21, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    move-wide/from16 v25, v21

    .line 658
    .line 659
    const/4 v6, 0x0

    .line 660
    :goto_f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 661
    .line 662
    .line 663
    move-result v8

    .line 664
    if-eqz v8, :cond_26

    .line 665
    .line 666
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    move-result-object v8

    .line 670
    check-cast v8, Landroid/hardware/Camera$Size;

    .line 671
    .line 672
    iget v12, v8, Landroid/hardware/Camera$Size;->width:I

    .line 673
    .line 674
    move-object/from16 p0, v5

    .line 675
    .line 676
    move-object/from16 v27, v6

    .line 677
    .line 678
    int-to-double v5, v12

    .line 679
    iget v12, v8, Landroid/hardware/Camera$Size;->height:I

    .line 680
    .line 681
    move-wide/from16 v28, v5

    .line 682
    .line 683
    int-to-double v5, v12

    .line 684
    div-double v5, v28, v5

    .line 685
    .line 686
    sub-double v5, v5, v19

    .line 687
    .line 688
    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    .line 689
    .line 690
    .line 691
    move-result-wide v5

    .line 692
    const-wide v28, 0x3fa999999999999aL    # 0.05

    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    cmpl-double v5, v5, v28

    .line 698
    .line 699
    if-lez v5, :cond_24

    .line 700
    .line 701
    move-object/from16 v5, p0

    .line 702
    .line 703
    move-object/from16 v6, v27

    .line 704
    .line 705
    goto :goto_f

    .line 706
    :cond_24
    iget v5, v8, Landroid/hardware/Camera$Size;->height:I

    .line 707
    .line 708
    sub-int/2addr v5, v13

    .line 709
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 710
    .line 711
    .line 712
    move-result v5

    .line 713
    int-to-double v5, v5

    .line 714
    cmpg-double v12, v5, v25

    .line 715
    .line 716
    if-gez v12, :cond_25

    .line 717
    .line 718
    move-wide/from16 v25, v5

    .line 719
    .line 720
    move-object v6, v8

    .line 721
    goto :goto_10

    .line 722
    :cond_25
    move-object/from16 v6, v27

    .line 723
    .line 724
    :goto_10
    move-object/from16 v5, p0

    .line 725
    .line 726
    goto :goto_f

    .line 727
    :cond_26
    move-object/from16 v27, v6

    .line 728
    .line 729
    if-nez v27, :cond_29

    .line 730
    .line 731
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 732
    .line 733
    .line 734
    move-result-object v0

    .line 735
    move-object/from16 v6, v27

    .line 736
    .line 737
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 738
    .line 739
    .line 740
    move-result v5

    .line 741
    if-eqz v5, :cond_28

    .line 742
    .line 743
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 744
    .line 745
    .line 746
    move-result-object v5

    .line 747
    check-cast v5, Landroid/hardware/Camera$Size;

    .line 748
    .line 749
    iget v8, v5, Landroid/hardware/Camera$Size;->height:I

    .line 750
    .line 751
    sub-int/2addr v8, v13

    .line 752
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 753
    .line 754
    .line 755
    move-result v8

    .line 756
    move-wide/from16 v19, v14

    .line 757
    .line 758
    int-to-double v14, v8

    .line 759
    div-double v14, v14, v23

    .line 760
    .line 761
    iget v8, v5, Landroid/hardware/Camera$Size;->width:I

    .line 762
    .line 763
    sub-int/2addr v8, v11

    .line 764
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 765
    .line 766
    .line 767
    move-result v8

    .line 768
    move-object v12, v5

    .line 769
    move-object/from16 p0, v6

    .line 770
    .line 771
    int-to-double v5, v8

    .line 772
    div-double v5, v5, v19

    .line 773
    .line 774
    add-double/2addr v14, v5

    .line 775
    cmpg-double v5, v14, v21

    .line 776
    .line 777
    if-gez v5, :cond_27

    .line 778
    .line 779
    move-object v6, v12

    .line 780
    move-wide/from16 v21, v14

    .line 781
    .line 782
    goto :goto_12

    .line 783
    :cond_27
    move-object/from16 v6, p0

    .line 784
    .line 785
    :goto_12
    move-wide/from16 v14, v19

    .line 786
    .line 787
    goto :goto_11

    .line 788
    :cond_28
    move-object/from16 p0, v6

    .line 789
    .line 790
    goto :goto_13

    .line 791
    :cond_29
    move-object/from16 v6, v27

    .line 792
    .line 793
    :goto_13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 794
    .line 795
    const-string v5, "optimalSize: "

    .line 796
    .line 797
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 798
    .line 799
    .line 800
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 801
    .line 802
    .line 803
    const-string v5, " w: "

    .line 804
    .line 805
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 806
    .line 807
    .line 808
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 809
    .line 810
    .line 811
    const-string v5, " h: "

    .line 812
    .line 813
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    .line 815
    .line 816
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 817
    .line 818
    .line 819
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 820
    .line 821
    .line 822
    move-result-object v0

    .line 823
    const-string v5, "CameraUtil"

    .line 824
    .line 825
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    .line 827
    .line 828
    :try_start_3
    iget v0, v6, Landroid/hardware/Camera$Size;->width:I

    .line 829
    .line 830
    iget v5, v6, Landroid/hardware/Camera$Size;->height:I

    .line 831
    .line 832
    invoke-virtual {v10, v0, v5}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 833
    .line 834
    .line 835
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 836
    .line 837
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->getMinFps()I

    .line 838
    .line 839
    .line 840
    move-result v0

    .line 841
    mul-int/lit16 v0, v0, 0x3e8

    .line 842
    .line 843
    iget-object v5, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 844
    .line 845
    invoke-virtual {v5}, Lcom/tencent/could/aicamare/entity/CameraConfig;->getMaxFps()I

    .line 846
    .line 847
    .line 848
    move-result v5

    .line 849
    mul-int/lit16 v5, v5, 0x3e8

    .line 850
    .line 851
    invoke-virtual {v10}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 852
    .line 853
    .line 854
    move-result-object v6

    .line 855
    iget-object v8, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 856
    .line 857
    invoke-virtual {v8}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMustDiffMinAndMaxFps()Z

    .line 858
    .line 859
    .line 860
    move-result v8

    .line 861
    if-eqz v8, :cond_2a

    .line 862
    .line 863
    if-eq v0, v5, :cond_2c

    .line 864
    .line 865
    :cond_2a
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 866
    .line 867
    .line 868
    move-result-object v8

    .line 869
    :cond_2b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 870
    .line 871
    .line 872
    move-result v11

    .line 873
    if-eqz v11, :cond_2c

    .line 874
    .line 875
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 876
    .line 877
    .line 878
    move-result-object v11

    .line 879
    check-cast v11, [I

    .line 880
    .line 881
    aget v12, v11, v16

    .line 882
    .line 883
    if-ne v12, v0, :cond_2b

    .line 884
    .line 885
    aget v11, v11, v17

    .line 886
    .line 887
    if-ne v11, v5, :cond_2b

    .line 888
    .line 889
    move/from16 v8, v17

    .line 890
    .line 891
    goto :goto_14

    .line 892
    :catch_2
    move-exception v0

    .line 893
    goto/16 :goto_19

    .line 894
    .line 895
    :cond_2c
    move/from16 v8, v16

    .line 896
    .line 897
    :goto_14
    if-nez v8, :cond_2f

    .line 898
    .line 899
    const v11, 0x7fffffff

    .line 900
    .line 901
    .line 902
    move/from16 v12, v16

    .line 903
    .line 904
    :goto_15
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 905
    .line 906
    .line 907
    move-result v13

    .line 908
    if-ge v12, v13, :cond_2f

    .line 909
    .line 910
    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 911
    .line 912
    .line 913
    move-result-object v13

    .line 914
    check-cast v13, [I

    .line 915
    .line 916
    aget v14, v13, v17

    .line 917
    .line 918
    aget v15, v13, v16

    .line 919
    .line 920
    sub-int/2addr v14, v15

    .line 921
    if-gt v14, v11, :cond_2e

    .line 922
    .line 923
    iget-object v14, v3, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 924
    .line 925
    invoke-virtual {v14}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMustDiffMinAndMaxFps()Z

    .line 926
    .line 927
    .line 928
    move-result v14

    .line 929
    if-eqz v14, :cond_2d

    .line 930
    .line 931
    aget v14, v13, v17

    .line 932
    .line 933
    aget v15, v13, v16

    .line 934
    .line 935
    if-eq v14, v15, :cond_2e

    .line 936
    .line 937
    :cond_2d
    aget v0, v13, v17

    .line 938
    .line 939
    aget v5, v13, v16
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 940
    .line 941
    sub-int v8, v0, v5

    .line 942
    .line 943
    move v11, v5

    .line 944
    move v5, v0

    .line 945
    move v0, v11

    .line 946
    move v11, v8

    .line 947
    move/from16 v8, v17

    .line 948
    .line 949
    :cond_2e
    add-int/lit8 v12, v12, 0x1

    .line 950
    .line 951
    goto :goto_15

    .line 952
    :cond_2f
    const-string v6, " max: "

    .line 953
    .line 954
    if-nez v8, :cond_30

    .line 955
    .line 956
    :try_start_4
    new-instance v8, Ljava/lang/StringBuilder;

    .line 957
    .line 958
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 959
    .line 960
    .line 961
    const-string v11, "not found, using defaut, min : "

    .line 962
    .line 963
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 964
    .line 965
    .line 966
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 967
    .line 968
    .line 969
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 970
    .line 971
    .line 972
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 973
    .line 974
    .line 975
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 976
    .line 977
    .line 978
    move-result-object v0

    .line 979
    invoke-virtual {v3, v0}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 980
    .line 981
    .line 982
    const/16 v0, 0x7530

    .line 983
    .line 984
    move v5, v0

    .line 985
    :cond_30
    new-instance v8, Ljava/lang/StringBuilder;

    .line 986
    .line 987
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 988
    .line 989
    .line 990
    const-string v11, "using range min: "

    .line 991
    .line 992
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 993
    .line 994
    .line 995
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 996
    .line 997
    .line 998
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 999
    .line 1000
    .line 1001
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1002
    .line 1003
    .line 1004
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1005
    .line 1006
    .line 1007
    move-result-object v6

    .line 1008
    invoke-virtual {v3, v6}, Lcom/tencent/could/aicamare/d;->a(Ljava/lang/String;)V

    .line 1009
    .line 1010
    .line 1011
    invoke-virtual {v10, v0, v5}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 1012
    .line 1013
    .line 1014
    invoke-virtual {v9, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1015
    .line 1016
    .line 1017
    :try_start_5
    invoke-virtual {v10}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 1018
    .line 1019
    .line 1020
    move-result-object v0

    .line 1021
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 1022
    .line 1023
    .line 1024
    move-result v0

    .line 1025
    if-eqz v0, :cond_31

    .line 1026
    .line 1027
    invoke-virtual {v10, v2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 1028
    .line 1029
    .line 1030
    invoke-virtual {v9, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1031
    .line 1032
    .line 1033
    goto :goto_16

    .line 1034
    :catch_3
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 1035
    .line 1036
    const-string v2, "This phone not support AutoFocus"

    .line 1037
    .line 1038
    invoke-static {v4, v2, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 1039
    .line 1040
    .line 1041
    :cond_31
    :goto_16
    :try_start_6
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 1042
    .line 1043
    iget v0, v0, Lcom/tencent/could/aicamare/entity/a;->e:I

    .line 1044
    .line 1045
    invoke-virtual {v9, v0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 1046
    .line 1047
    .line 1048
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 1049
    .line 1050
    invoke-virtual {v10}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    .line 1051
    .line 1052
    .line 1053
    move-result-object v1

    .line 1054
    iput-object v1, v0, Lcom/tencent/could/aicamare/entity/a;->d:Landroid/hardware/Camera$Size;

    .line 1055
    .line 1056
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 1057
    .line 1058
    new-instance v1, Landroid/graphics/Point;

    .line 1059
    .line 1060
    move/from16 v2, v18

    .line 1061
    .line 1062
    invoke-direct {v1, v2, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 1063
    .line 1064
    .line 1065
    iget-object v2, v3, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 1066
    .line 1067
    iget-object v5, v2, Lcom/tencent/could/aicamare/entity/a;->d:Landroid/hardware/Camera$Size;

    .line 1068
    .line 1069
    iget v2, v2, Lcom/tencent/could/aicamare/entity/a;->e:I

    .line 1070
    .line 1071
    const/16 v6, 0xb4

    .line 1072
    .line 1073
    rem-int/2addr v2, v6

    .line 1074
    iget v6, v1, Landroid/graphics/Point;->x:I

    .line 1075
    .line 1076
    const/high16 v7, 0x3f800000    # 1.0f

    .line 1077
    .line 1078
    if-eqz v2, :cond_32

    .line 1079
    .line 1080
    int-to-float v2, v6

    .line 1081
    mul-float/2addr v2, v7

    .line 1082
    iget v6, v5, Landroid/hardware/Camera$Size;->height:I

    .line 1083
    .line 1084
    int-to-float v6, v6

    .line 1085
    div-float/2addr v2, v6

    .line 1086
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 1087
    .line 1088
    int-to-float v1, v1

    .line 1089
    mul-float/2addr v1, v7

    .line 1090
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    .line 1091
    .line 1092
    :goto_17
    int-to-float v6, v6

    .line 1093
    div-float/2addr v1, v6

    .line 1094
    goto :goto_18

    .line 1095
    :cond_32
    int-to-float v2, v6

    .line 1096
    mul-float/2addr v2, v7

    .line 1097
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    .line 1098
    .line 1099
    int-to-float v6, v6

    .line 1100
    div-float/2addr v2, v6

    .line 1101
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 1102
    .line 1103
    int-to-float v1, v1

    .line 1104
    mul-float/2addr v1, v7

    .line 1105
    iget v6, v5, Landroid/hardware/Camera$Size;->height:I

    .line 1106
    .line 1107
    goto :goto_17

    .line 1108
    :goto_18
    new-instance v6, Ljava/lang/StringBuilder;

    .line 1109
    .line 1110
    const-string v7, "scaleX: "

    .line 1111
    .line 1112
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1113
    .line 1114
    .line 1115
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1116
    .line 1117
    .line 1118
    const-string v7, " scaleY: "

    .line 1119
    .line 1120
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1121
    .line 1122
    .line 1123
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1124
    .line 1125
    .line 1126
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1127
    .line 1128
    .line 1129
    move-result-object v6

    .line 1130
    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1131
    .line 1132
    .line 1133
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    .line 1134
    .line 1135
    .line 1136
    move-result v1

    .line 1137
    new-instance v2, Landroid/graphics/Point;

    .line 1138
    .line 1139
    iget v6, v5, Landroid/hardware/Camera$Size;->width:I

    .line 1140
    .line 1141
    int-to-float v6, v6

    .line 1142
    mul-float/2addr v6, v1

    .line 1143
    float-to-int v6, v6

    .line 1144
    iget v5, v5, Landroid/hardware/Camera$Size;->height:I

    .line 1145
    .line 1146
    int-to-float v5, v5

    .line 1147
    mul-float/2addr v5, v1

    .line 1148
    float-to-int v1, v5

    .line 1149
    invoke-direct {v2, v6, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 1150
    .line 1151
    .line 1152
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1153
    .line 1154
    .line 1155
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 1156
    .line 1157
    const-string v1, "initCamera success!"

    .line 1158
    .line 1159
    invoke-static {v4, v1, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 1160
    .line 1161
    .line 1162
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 1163
    .line 1164
    if-eqz v0, :cond_33

    .line 1165
    .line 1166
    invoke-interface {v0}, Lcom/tencent/could/aicamare/callback/CameraEventListener;->onCameraSucceed()V

    .line 1167
    .line 1168
    .line 1169
    goto/16 :goto_1d

    .line 1170
    .line 1171
    :catch_4
    move-exception v0

    .line 1172
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1173
    .line 1174
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1175
    .line 1176
    .line 1177
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 1178
    .line 1179
    .line 1180
    move-result-object v0

    .line 1181
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1182
    .line 1183
    .line 1184
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1185
    .line 1186
    .line 1187
    move-result-object v0

    .line 1188
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1189
    .line 1190
    .line 1191
    const-string v0, "set display orientation error."

    .line 1192
    .line 1193
    const/4 v1, 0x7

    .line 1194
    invoke-virtual {v3, v1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 1195
    .line 1196
    .line 1197
    goto :goto_1a

    .line 1198
    :goto_19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1199
    .line 1200
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1201
    .line 1202
    .line 1203
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 1204
    .line 1205
    .line 1206
    move-result-object v0

    .line 1207
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1208
    .line 1209
    .line 1210
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1211
    .line 1212
    .line 1213
    move-result-object v0

    .line 1214
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1215
    .line 1216
    .line 1217
    const-string v0, "set preview parameter size error"

    .line 1218
    .line 1219
    move/from16 v1, v17

    .line 1220
    .line 1221
    invoke-virtual {v3, v1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 1222
    .line 1223
    .line 1224
    goto :goto_1a

    .line 1225
    :catch_5
    move-exception v0

    .line 1226
    move v1, v5

    .line 1227
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1228
    .line 1229
    const-string v5, "RuntimeException e: "

    .line 1230
    .line 1231
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1232
    .line 1233
    .line 1234
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v0

    .line 1238
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1239
    .line 1240
    .line 1241
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v0

    .line 1245
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1246
    .line 1247
    .line 1248
    const-string v0, "currentCamera, getParameters error!"

    .line 1249
    .line 1250
    invoke-virtual {v3, v1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 1251
    .line 1252
    .line 1253
    :goto_1a
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 1254
    .line 1255
    const-string v1, "initCamera fail!"

    .line 1256
    .line 1257
    invoke-static {v4, v1, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 1258
    .line 1259
    .line 1260
    goto :goto_1d

    .line 1261
    :goto_1b
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1262
    .line 1263
    const-string v2, "open camera happen runtime error: "

    .line 1264
    .line 1265
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1266
    .line 1267
    .line 1268
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 1269
    .line 1270
    .line 1271
    move-result-object v0

    .line 1272
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1273
    .line 1274
    .line 1275
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1276
    .line 1277
    .line 1278
    move-result-object v0

    .line 1279
    const/4 v1, 0x1

    .line 1280
    invoke-virtual {v3, v1, v0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 1281
    .line 1282
    .line 1283
    :goto_1c
    iget-object v0, v3, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 1284
    .line 1285
    const-string v1, "localOpenCamera fail!"

    .line 1286
    .line 1287
    invoke-static {v4, v1, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 1288
    .line 1289
    .line 1290
    :cond_33
    :goto_1d
    return-void
.end method

.method private doStartPreview()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->isUseSurfaceHolder:Z

    .line 6
    .line 7
    iget-object v2, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    iget-object v3, v0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 12
    .line 13
    const-string v4, "start camera preview"

    .line 14
    .line 15
    const-string v5, "CameraHolderImp"

    .line 16
    .line 17
    invoke-static {v5, v4, v3}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 18
    .line 19
    .line 20
    iget-object v3, v0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 23
    .line 24
    const/4 v4, 0x6

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    iget-object p0, v0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 28
    .line 29
    const-string v1, "start preview with currentCamera is null!"

    .line 30
    .line 31
    invoke-static {v5, v1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "current camera is null!"

    .line 35
    .line 36
    invoke-virtual {v0, v4, p0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {v0, v3}, Lcom/tencent/could/aicamare/d;->a(Landroid/hardware/Camera;)Z

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-nez v6, :cond_1

    .line 45
    .line 46
    const-string p0, "add camera preview fail!"

    .line 47
    .line 48
    invoke-virtual {v0, v4, p0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    if-eqz v1, :cond_2

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    :try_start_0
    invoke-virtual {v3, v2}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catch_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :catch_1
    move-exception p0

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    :goto_0
    if-nez v1, :cond_3

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    invoke-virtual {v3, p0}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-virtual {v3}, Landroid/hardware/Camera;->startPreview()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    iget-object p0, v0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 75
    .line 76
    const-string v1, "start camera preview success"

    .line 77
    .line 78
    invoke-static {v5, v1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, v0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 82
    .line 83
    if-eqz p0, :cond_4

    .line 84
    .line 85
    invoke-interface {p0}, Lcom/tencent/could/aicamare/callback/CameraEventListener;->onPreviewSucceed()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget-object p0, v0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 90
    .line 91
    const-string v0, "start preview fail eventListener is null"

    .line 92
    .line 93
    invoke-static {v5, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v2, "set preview display error : "

    .line 100
    .line 101
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, v4, p0}, Lcom/tencent/could/aicamare/d;->a(ILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_5
    return-void
.end method

.method private stopCurrentThread()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 7
    .line 8
    const-string v1, "CameraHolder"

    .line 9
    .line 10
    const-string v2, "clean handler and thread"

    .line 11
    .line 12
    invoke-static {v1, v2, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->a(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 34
    .line 35
    const/4 v1, 0x4

    .line 36
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 40
    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 46
    .line 47
    const/4 v1, 0x7

    .line 48
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 52
    .line 53
    const/4 v1, 0x6

    .line 54
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 55
    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    iput-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 59
    .line 60
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handlerThread:Landroid/os/HandlerThread;

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handlerThread:Landroid/os/HandlerThread;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public closeCamera()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doCloseCamera()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 18
    .line 19
    const-string v1, "CameraHolder"

    .line 20
    .line 21
    const-string v2, "close camera handler == null"

    .line 22
    .line 23
    invoke-static {v1, v2, v0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doCloseCamera()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x2

    .line 37
    iput v1, v0, Landroid/os/Message;->what:I

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public doEventChangeCameraParameter(Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "camera_param_white_balance"

    .line 2
    .line 3
    const-string v1, "camera_param_zoom"

    .line 4
    .line 5
    const-string v2, "camera_param_exposure"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 8
    .line 9
    if-eqz p0, :cond_5

    .line 10
    .line 11
    iget-object v3, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 12
    .line 13
    iget-object v3, v3, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 14
    .line 15
    if-eqz v3, :cond_4

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    :try_start_0
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    if-eqz v5, :cond_1

    .line 29
    .line 30
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v4, v2}, Landroid/hardware/Camera$Parameters;->setExposureCompensation(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {v4, v1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v4, p1}, Landroid/hardware/Camera$Parameters;->setWhiteBalance(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    invoke-virtual {v3, v4}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v1, "changeCameraExposureInfo:"

    .line 87
    .line 88
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lcom/tencent/could/aicamare/d;->b(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    :goto_2
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 107
    .line 108
    const-string p1, "CameraHolderImp"

    .line 109
    .line 110
    const-string v0, "setEventChangeCameraParameter, currentCamera is null or parameter is null"

    .line 111
    .line 112
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 113
    .line 114
    .line 115
    :cond_5
    return-void
.end method

.method public doFocus(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->doAutoFocus(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 18
    .line 19
    const-string p1, "CameraHolder"

    .line 20
    .line 21
    const-string v0, "do focus handler == null"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x3

    .line 34
    iput v1, v0, Landroid/os/Message;->what:I

    .line 35
    .line 36
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public getCameraId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    iget p0, p0, Lcom/tencent/could/aicamare/entity/a;->b:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getCameraSize()Landroid/hardware/Camera$Size;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/could/aicamare/entity/a;->d:Landroid/hardware/Camera$Size;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getCurrentCamera()Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/could/aicamare/entity/a;->a:Landroid/hardware/Camera;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getCurrentCameraInfo()Lcom/tencent/could/aicamare/entity/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public getCurrentRotate()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    iget p0, p0, Lcom/tencent/could/aicamare/entity/a;->c:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getDisplayRotate()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/d;->a:Lcom/tencent/could/aicamare/entity/a;

    .line 6
    .line 7
    iget p0, p0, Lcom/tencent/could/aicamare/entity/a;->e:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public initCameraHolder(Landroid/content/Context;Lcom/tencent/could/aicamare/entity/CameraConfig;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tencent/could/aicamare/d;->a(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 11
    .line 12
    iput-object p2, p1, Lcom/tencent/could/aicamare/d;->d:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->createHandlerThread()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->doFocus(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    and-int/lit16 v0, v0, 0xff

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq v0, v2, :cond_2

    .line 20
    .line 21
    const/4 v1, 0x5

    .line 22
    if-eq v0, v1, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-static {p1}, Lcom/tencent/could/aicamare/util/a;->a(Landroid/view/MotionEvent;)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->oldDist:F

    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-static {p1}, Lcom/tencent/could/aicamare/util/a;->a(Landroid/view/MotionEvent;)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->oldDist:F

    .line 37
    .line 38
    cmpl-float v2, p1, v0

    .line 39
    .line 40
    if-lez v2, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Lcom/tencent/could/aicamare/CameraHolder;->zoomCamera(Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    cmpg-float v0, p1, v0

    .line 47
    .line 48
    if-gez v0, :cond_4

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0, v0}, Lcom/tencent/could/aicamare/CameraHolder;->zoomCamera(Z)V

    .line 52
    .line 53
    .line 54
    :cond_4
    :goto_0
    iput p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->oldDist:F

    .line 55
    .line 56
    return-void
.end method

.method public openCamera(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tencent/could/aicamare/d;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doOpenCamera()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 23
    .line 24
    const-string p1, "CameraHolder"

    .line 25
    .line 26
    const-string v0, "open camera handler == null"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x1

    .line 39
    iput v0, p1, Landroid/os/Message;->what:I

    .line 40
    .line 41
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doCloseCamera()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->stopCurrentThread()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->cleanAllListener()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iput-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iput-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->transformMatrix:Landroid/graphics/Matrix;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->transformMatrix:Landroid/graphics/Matrix;

    .line 28
    .line 29
    :cond_2
    return-void
.end method

.method public setEventChangeCameraParameter(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->doEventChangeCameraParameter(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 18
    .line 19
    const-string p1, "CameraHolder"

    .line 20
    .line 21
    const-string v0, "set camera parameter handler == null"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/16 v1, 0x8

    .line 34
    .line 35
    iput v1, v0, Landroid/os/Message;->what:I

    .line 36
    .line 37
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setEventListener(Lcom/tencent/could/aicamare/callback/CameraEventListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->eventListener:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/could/aicamare/d;->b:Lcom/tencent/could/aicamare/callback/CameraEventListener;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setLoggerCallBack(Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V
    .locals 1

    .line 12
    sget-object v0, Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;->LEVEL_VERBOSE:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    invoke-virtual {p0, p1, v0}, Lcom/tencent/could/aicamare/CameraHolder;->setLoggerCallBack(Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;)V

    return-void
.end method

.method public setLoggerCallBack(Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;)V
    .locals 0

    .line 1
    sput-object p2, Lcom/tencent/could/aicamare/util/CameraLogger;->a:Lcom/tencent/could/aicamare/util/CameraLogger$LOG_LEVEL;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraHolderImp:Lcom/tencent/could/aicamare/d;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Lcom/tencent/could/aicamare/d;->c:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public startPreview(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceHolder:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->isUseSurfaceHolder:Z

    .line 5
    .line 6
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doStartPreview()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 23
    .line 24
    const-string p1, "CameraHolder"

    .line 25
    .line 26
    const-string v0, "start camera preview handler == null"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x5

    .line 39
    iput v0, p1, Landroid/os/Message;->what:I

    .line 40
    .line 41
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public startPreviewByResume()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doLifeResume()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 18
    .line 19
    const-string v0, "CameraHolder"

    .line 20
    .line 21
    const-string v1, "do focus handler == null"

    .line 22
    .line 23
    invoke-static {v0, v1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x6

    .line 34
    iput v1, v0, Landroid/os/Message;->what:I

    .line 35
    .line 36
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public startPreviewWithTexture(Landroid/view/TextureView;Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    const-string v0, "CameraHolder"

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->createTransformMatrix(Landroid/view/TextureView;)Landroid/graphics/Matrix;

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/could/aicamare/CameraHolder;->transformMatrix:Landroid/graphics/Matrix;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1, v1}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 17
    .line 18
    const-string v1, "transformMatrix do not create is null"

    .line 19
    .line 20
    invoke-static {v0, v1, p1}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->isUseSurfaceHolder:Z

    .line 25
    .line 26
    iput-object p2, p0, Lcom/tencent/could/aicamare/CameraHolder;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doStartPreview()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 41
    .line 42
    if-nez p1, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 45
    .line 46
    const-string p1, "start camera preview handler == null"

    .line 47
    .line 48
    invoke-static {v0, p1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    iget-object p1, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const/4 p2, 0x5

    .line 59
    iput p2, p1, Landroid/os/Message;->what:I

    .line 60
    .line 61
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public stopPreviewByOnPause()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tencent/could/aicamare/CameraHolder;->doLifeOnPause()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 18
    .line 19
    const-string v0, "CameraHolder"

    .line 20
    .line 21
    const-string v1, "do focus handler == null"

    .line 22
    .line 23
    invoke-static {v0, v1, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x7

    .line 34
    iput v1, v0, Landroid/os/Message;->what:I

    .line 35
    .line 36
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public zoomCamera(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->cameraConfig:Lcom/tencent/could/aicamare/entity/CameraConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/tencent/could/aicamare/CameraHolder;->doChangeZoom(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->loggerCallBack:Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;

    .line 18
    .line 19
    const-string p1, "CameraHolder"

    .line 20
    .line 21
    const-string v0, "zoom camera handler == null"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Lcom/tencent/could/aicamare/util/CameraLogger;->b(Ljava/lang/String;Ljava/lang/String;Lcom/tencent/could/aicamare/callback/CameraLoggerCallBack;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x4

    .line 34
    iput v1, v0, Landroid/os/Message;->what:I

    .line 35
    .line 36
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/could/aicamare/CameraHolder;->handler:Landroid/os/Handler;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

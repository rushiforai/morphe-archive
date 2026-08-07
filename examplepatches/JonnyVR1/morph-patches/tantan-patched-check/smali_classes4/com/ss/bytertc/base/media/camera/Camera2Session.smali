.class Lcom/ss/bytertc/base/media/camera/Camera2Session;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/camera/CameraSession;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/Camera2Session$CameraCaptureCallback;,
        Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;,
        Lcom/ss/bytertc/base/media/camera/Camera2Session$CameraStateCallback;,
        Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2Session"

.field private static final camera2ResolutionHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

.field private static final camera2StartTimeMsHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

.field private static final camera2StopTimeMsHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private final callback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

.field private cameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

.field private cameraDevice:Landroid/hardware/camera2/CameraDevice;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final cameraId:Ljava/lang/String;

.field private final cameraManager:Landroid/hardware/camera2/CameraManager;

.field private cameraOrientation:I

.field private final cameraThreadHandler:Landroid/os/Handler;

.field private captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

.field private captureSession:Landroid/hardware/camera2/CameraCaptureSession;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final constructionTimeNs:J

.field private final events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

.field private firstFrameReported:Z

.field private fpsUnitFactor:I

.field private final framerate:I

.field private final height:I

.field private isCameraFrontFacing:Z

.field private state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

.field private surface:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "WebRTC.Android.Camera2.StartTimeMs"

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
    invoke-static {v0, v1, v2, v3}, Lcom/ss/bytertc/base/media/camera/Histogram;->createCounts(Ljava/lang/String;III)Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->camera2StartTimeMsHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 13
    .line 14
    const-string v0, "WebRTC.Android.Camera2.StopTimeMs"

    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3}, Lcom/ss/bytertc/base/media/camera/Histogram;->createCounts(Ljava/lang/String;III)Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->camera2StopTimeMsHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 21
    .line 22
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->COMMON_RESOLUTIONS:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v1, "WebRTC.Android.Camera2.Resolution"

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/ss/bytertc/base/media/camera/Histogram;->createEnumeration(Ljava/lang/String;I)Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->camera2ResolutionHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 35
    .line 36
    return-void
.end method

.method private constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;->RUNNING:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "Create new camera2 session on camera "

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "Camera2Session"

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->constructionTimeNs:J

    .line 32
    .line 33
    new-instance v0, Landroid/os/Handler;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->callback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

    .line 41
    .line 42
    iput-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 43
    .line 44
    iput-object p3, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->applicationContext:Landroid/content/Context;

    .line 45
    .line 46
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraManager:Landroid/hardware/camera2/CameraManager;

    .line 47
    .line 48
    iput-object p5, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 49
    .line 50
    iput-object p6, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraId:Ljava/lang/String;

    .line 51
    .line 52
    iput p7, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->width:I

    .line 53
    .line 54
    iput p8, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->height:I

    .line 55
    .line 56
    iput p9, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->framerate:I

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->start()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/base/media/camera/Camera2Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1002(Lcom/ss/bytertc/base/media/camera/Camera2Session;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surface:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$102(Lcom/ss/bytertc/base/media/camera/Camera2Session;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1200(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/ss/bytertc/base/media/camera/Camera2Session;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->fpsUnitFactor:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1500(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Landroid/hardware/camera2/CameraCharacteristics;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1600(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->firstFrameReported:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1602(Lcom/ss/bytertc/base/media/camera/Camera2Session;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->firstFrameReported:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1700(Lcom/ss/bytertc/base/media/camera/Camera2Session;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->constructionTimeNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1800()Lcom/ss/bytertc/base/media/camera/Histogram;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->camera2StartTimeMsHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$1900(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->isCameraFrontFacing:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/ss/bytertc/base/media/camera/Camera2Session;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$202(Lcom/ss/bytertc/base/media/camera/Camera2Session;Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;)Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$2100(Lcom/ss/bytertc/base/media/camera/Camera2Session;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->getFrameOrientation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/base/media/camera/Camera2Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->stopInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->callback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Lcom/ss/bytertc/base/media/camera/CameraSession$Events;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/base/media/camera/Camera2Session;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->reportError(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/ss/bytertc/base/media/camera/Camera2Session;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/ss/bytertc/base/media/camera/Camera2Session;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 2
    .line 3
    return-object p0
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
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraThreadHandler:Landroid/os/Handler;

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

.method public static create(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/Camera2Session;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move/from16 v7, p6

    .line 10
    .line 11
    move/from16 v8, p7

    .line 12
    .line 13
    move/from16 v9, p8

    .line 14
    .line 15
    invoke-direct/range {v0 .. v9}, Lcom/ss/bytertc/base/media/camera/Camera2Session;-><init>(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private findCaptureFormat()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 5
    .line 6
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, [Landroid/util/Range;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/Camera2Enumerator;->getFpsUnitFactor([Landroid/util/Range;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    iput v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->fpsUnitFactor:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/camera/Camera2Enumerator;->convertFramerates([Landroid/util/Range;I)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/Camera2Enumerator;->getSupportedSizes(Landroid/hardware/camera2/CameraCharacteristics;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v3, "Available preview sizes: "

    .line 33
    .line 34
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "Camera2Session"

    .line 45
    .line 46
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v4, "Available fps ranges: "

    .line 52
    .line 53
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v3, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_0

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget v2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->framerate:I

    .line 80
    .line 81
    invoke-static {v0, v2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getClosestSupportedFramerateRange(Ljava/util/List;I)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget v2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->width:I

    .line 86
    .line 87
    iget v4, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->height:I

    .line 88
    .line 89
    invoke-static {v1, v2, v4}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    sget-object v2, Lcom/ss/bytertc/base/media/camera/Camera2Session;->camera2ResolutionHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 94
    .line 95
    invoke-static {v2, v1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->reportCameraResolution(Lcom/ss/bytertc/base/media/camera/Histogram;Lcom/ss/bytertc/base/media/Size;)V

    .line 96
    .line 97
    .line 98
    new-instance v2, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 99
    .line 100
    iget v4, v1, Lcom/ss/bytertc/base/media/Size;->width:I

    .line 101
    .line 102
    iget v1, v1, Lcom/ss/bytertc/base/media/Size;->height:I

    .line 103
    .line 104
    invoke-direct {v2, v4, v1, v0}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;-><init>(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V

    .line 105
    .line 106
    .line 107
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 108
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v1, "Using capture format: "

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 117
    .line 118
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {v3, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_1
    :goto_0
    const-string v0, "No supported capture formats."

    .line 130
    .line 131
    invoke-direct {p0, v0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->reportError(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method private getFrameOrientation()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->isCameraFrontFacing:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    rsub-int v0, v0, 0x168

    .line 12
    .line 13
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraOrientation:I

    .line 14
    .line 15
    add-int/2addr p0, v0

    .line 16
    rem-int/lit16 p0, p0, 0x168

    .line 17
    .line 18
    return p0
.end method

.method private openCamera()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "Opening camera "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "Camera2Session"

    .line 21
    .line 22
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraOpening()V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraManager:Landroid/hardware/camera2/CameraManager;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraId:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v2, Lcom/ss/bytertc/base/media/camera/Camera2Session$CameraStateCallback;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-direct {v2, p0, v3}, Lcom/ss/bytertc/base/media/camera/Camera2Session$CameraStateCallback;-><init>(Lcom/ss/bytertc/base/media/camera/Camera2Session;Lcom/ss/bytertc/base/media/camera/Camera2Session$1;)V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "Failed to open camera: "

    .line 50
    .line 51
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-direct {p0, v0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->reportError(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private reportError(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "Error: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Camera2Session"

    .line 19
    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 28
    .line 29
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 30
    .line 31
    if-eq v0, v1, :cond_0

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 39
    .line 40
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->stopInternal()V

    .line 41
    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->callback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

    .line 46
    .line 47
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;->ERROR:Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;

    .line 48
    .line 49
    invoke-interface {p0, v0, p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;->onFailure(Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 54
    .line 55
    invoke-interface {v0, p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraError(Lcom/ss/bytertc/base/media/camera/CameraSession;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private start()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Camera2Session"

    .line 5
    .line 6
    const-string v1, "start"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraManager:Landroid/hardware/camera2/CameraManager;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraOrientation:I

    .line 34
    .line 35
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 36
    .line 37
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    const/4 v0, 0x0

    .line 54
    :goto_0
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->isCameraFrontFacing:Z

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->findCaptureFormat()V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->openCamera()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v2, "getCameraCharacteristics(): "

    .line 67
    .line 68
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-direct {p0, v0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->reportError(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method private stopInternal()V
    .locals 3

    .line 1
    const-string v0, "Stop internal"

    .line 2
    .line 3
    const-string v1, "Camera2Session"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->stopListening()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->captureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surface:Landroid/view/Surface;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->surface:Landroid/view/Surface;

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 43
    .line 44
    :cond_2
    const-string p0, "Stop done"

    .line 45
    .line 46
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public enableFollowGravity(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method

.method public getDeviceOrientation()I
    .locals 0

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setCameraZoomRatio(F)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V
    .locals 0

    return-void
.end method

.method public stop()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Stop camera2 session on camera "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->cameraId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera2Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 26
    .line 27
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 28
    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->state:Lcom/ss/bytertc/base/media/camera/Camera2Session$SessionState;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->stopInternal()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    sub-long/2addr v0, v2

    .line 45
    const-wide/32 v2, 0xf4240

    .line 46
    .line 47
    .line 48
    div-long/2addr v0, v2

    .line 49
    long-to-int p0, v0

    .line 50
    sget-object v0, Lcom/ss/bytertc/base/media/camera/Camera2Session;->camera2StopTimeMsHistogram:Lcom/ss/bytertc/base/media/camera/Histogram;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/base/media/camera/Histogram;->addSample(I)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public turnOffFlashLight()V
    .locals 0

    return-void
.end method

.method public turnOnFlashLight()V
    .locals 0

    return-void
.end method

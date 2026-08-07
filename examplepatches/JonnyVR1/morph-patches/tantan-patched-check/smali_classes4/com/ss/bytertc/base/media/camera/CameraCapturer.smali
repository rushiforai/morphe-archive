.class abstract Lcom/ss/bytertc/base/media/camera/CameraCapturer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;
    }
.end annotation


# static fields
.field private static final MAX_OPEN_CAMERA_ATTEMPTS:I = 0x3

.field private static final OPEN_CAMERA_DELAY_MS:I = 0x1f4

.field private static final OPEN_CAMERA_TIMEOUT:I = 0x2710

.field private static final TAG:Ljava/lang/String; = "CameraCapturer"


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private final cameraEnumerator:Lcom/ss/bytertc/base/media/camera/CameraEnumerator;

.field private cameraName:Ljava/lang/String;

.field private final cameraSessionEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private cameraThreadHandler:Landroid/os/Handler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

.field private final createSessionCallback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final eventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private firstFrameObserved:Z

.field private framerate:I

.field private height:I

.field protected mEnableFollowGravity:Z

.field private mOrientationMode:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

.field private nativeLibraryName:Ljava/lang/String;

.field private openAttemptsRemaining:I

.field private final openCameraTimeoutRunnable:Ljava/lang/Runnable;

.field private sessionOpening:Z

.field private final stateLock:Ljava/lang/Object;

.field private surfaceHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

.field private final uiThreadHandler:Landroid/os/Handler;

.field private width:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;Lcom/ss/bytertc/base/media/camera/CameraEnumerator;)V
    .locals 1
    .param p2    # Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;->ORIENTATION_MODE_ADAPTIVE:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->mOrientationMode:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 7
    .line 8
    new-instance v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$1;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createSessionCallback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

    .line 14
    .line 15
    new-instance v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraSessionEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 21
    .line 22
    new-instance v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$3;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$3;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openCameraTimeoutRunnable:Ljava/lang/Runnable;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/Object;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 35
    .line 36
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IDLE:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 39
    .line 40
    const-string v0, "bytertc"

    .line 41
    .line 42
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->nativeLibraryName:Ljava/lang/String;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->mEnableFollowGravity:Z

    .line 46
    .line 47
    if-nez p2, :cond_0

    .line 48
    .line 49
    new-instance p2, Lcom/ss/bytertc/base/media/camera/CameraCapturer$4;

    .line 50
    .line 51
    invoke-direct {p2, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$4;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iput-object p2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->eventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 55
    .line 56
    iput-object p3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraEnumerator:Lcom/ss/bytertc/base/media/camera/CameraEnumerator;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 59
    .line 60
    new-instance p1, Landroid/os/Handler;

    .line 61
    .line 62
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->uiThreadHandler:Landroid/os/Handler;

    .line 70
    .line 71
    invoke-interface {p3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->getDeviceNames()[Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    array-length p2, p1

    .line 76
    const/4 p3, 0x0

    .line 77
    if-eqz p2, :cond_2

    .line 78
    .line 79
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 84
    .line 85
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 93
    .line 94
    const-string p1, " does not match any known camera device."

    .line 95
    .line 96
    const-string p2, "Camera name "

    .line 97
    .line 98
    invoke-static {p2, p0, p1}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    throw p3

    .line 102
    :cond_2
    const-string p0, "No cameras attached."

    .line 103
    .line 104
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    throw p3
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->isCameraTorchSupported()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openCameraTimeoutRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->surfaceHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->eventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->firstFrameObserved:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1202(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->firstFrameObserved:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1302(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraEnumerator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraEnumerator:Lcom/ss/bytertc/base/media/camera/CameraEnumerator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchCameraInternal(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openAttemptsRemaining:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1710(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openAttemptsRemaining:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openAttemptsRemaining:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$1800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createSessionInternal(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createSessionCallback:Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->uiThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession$Events;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraSessionEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->framerate:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$402(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;)Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->mOrientationMode:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->sessionOpening:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$802(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraSession;)Lcom/ss/bytertc/base/media/camera/CameraSession;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$900(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$902(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic b(Lcom/ss/bytertc/base/media/camera/CameraCapturer;ZLjava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraSession;->enableFollowGravity(Z)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p2, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/ss/bytertc/base/media/camera/CameraCapturer;FLjava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraSession;->setCameraZoomRatio(F)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p2, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private checkIsOnCameraThread()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-ne v0, p0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "CameraCapturer"

    .line 23
    .line 24
    const-string v0, "Check is on camera thread failed."

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string p0, "Not on camera thread."

    .line 30
    .line 31
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private createSessionInternal(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->uiThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openCameraTimeoutRunnable:Ljava/lang/Runnable;

    .line 4
    .line 5
    add-int/lit16 v2, p1, 0x2710

    .line 6
    .line 7
    int-to-long v2, v2

    .line 8
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v1, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$5;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 19
    .line 20
    .line 21
    int-to-long p0, p1

    .line 22
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic d(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceOrientation()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->turnOffFlashLight()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->isCameraZoomSupported()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getCameraZoomMaxRatio()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic h(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->turnOnFlashLight()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private reportCameraSwitchError(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0
    .param p2    # Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string p0, "CameraCapturer"

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-interface {p2, p1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchError(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private switchCameraInternal(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 5
    .param p1    # Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "switchCamera internal"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraEnumerator:Lcom/ss/bytertc/base/media/camera/CameraEnumerator;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->getDeviceNames()[Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    array-length v1, v0

    .line 15
    const/4 v2, 0x2

    .line 16
    if-ge v1, v2, :cond_1

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string p0, "No camera to switch to."

    .line 21
    .line 22
    invoke-interface {p1, p0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchError(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 30
    .line 31
    sget-object v3, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IDLE:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 32
    .line 33
    if-eq v2, v3, :cond_2

    .line 34
    .line 35
    const-string v0, "Camera switch already in progress."

    .line 36
    .line 37
    invoke-direct {p0, v0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->reportCameraSwitchError(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 38
    .line 39
    .line 40
    monitor-exit v1

    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-boolean v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->sessionOpening:Z

    .line 45
    .line 46
    if-nez v2, :cond_3

    .line 47
    .line 48
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 49
    .line 50
    if-nez v3, :cond_3

    .line 51
    .line 52
    const-string v0, "switchCamera: camera is not running."

    .line 53
    .line 54
    invoke-direct {p0, v0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->reportCameraSwitchError(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 55
    .line 56
    .line 57
    monitor-exit v1

    .line 58
    return-void

    .line 59
    :cond_3
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 60
    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->PENDING:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 66
    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :cond_4
    sget-object p1, Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;->IN_PROGRESS:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchState:Lcom/ss/bytertc/base/media/camera/CameraCapturer$SwitchState;

    .line 72
    .line 73
    const-string p1, "CameraCapturer"

    .line 74
    .line 75
    const-string v2, "switchCamera: Stopping session"

    .line 76
    .line 77
    invoke-static {p1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    if-eqz p1, :cond_5

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->release()V

    .line 86
    .line 87
    .line 88
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 91
    .line 92
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 93
    .line 94
    if-eqz v3, :cond_6

    .line 95
    .line 96
    new-instance v4, Lcom/ss/bytertc/base/media/camera/CameraCapturer$8;

    .line 97
    .line 98
    invoke-direct {v4, p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$8;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraSession;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 102
    .line 103
    .line 104
    :cond_6
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 105
    .line 106
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 111
    .line 112
    invoke-interface {p1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    const/4 v2, 0x1

    .line 117
    add-int/2addr p1, v2

    .line 118
    array-length v3, v0

    .line 119
    rem-int/2addr p1, v3

    .line 120
    aget-object p1, v0, p1

    .line 121
    .line 122
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 123
    .line 124
    iput-boolean v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->sessionOpening:Z

    .line 125
    .line 126
    iput v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openAttemptsRemaining:I

    .line 127
    .line 128
    const/4 p1, 0x0

    .line 129
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createSessionInternal(I)V

    .line 130
    .line 131
    .line 132
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    const-string p0, "CameraCapturer"

    .line 134
    .line 135
    const-string p1, "switchCamera done"

    .line 136
    .line 137
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    throw p0
.end method


# virtual methods
.method public changeCaptureFormat(III)V
    .locals 3

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "changeCaptureFormat: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "x"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "@"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 37
    .line 38
    monitor-enter v0

    .line 39
    :try_start_0
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stopCapture()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->startCapture(III)V

    .line 43
    .line 44
    .line 45
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p0

    .line 48
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method

.method public abstract createCameraSession(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V
.end method

.method public disableDoOrientation()V
    .locals 0

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "dispose"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stopCapture()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public enableFollowGravity(Z)I
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v2, Lcom/ss/bytertc/base/media/camera/i;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1, v0}, Lcom/ss/bytertc/base/media/camera/i;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;ZLjava/util/concurrent/atomic/AtomicInteger;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->mEnableFollowGravity:Z

    .line 24
    .line 25
    :cond_0
    return v0
.end method

.method public getCameraName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-object p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 13
    .line 14
    new-instance v2, Lcom/ss/bytertc/base/media/camera/f;

    .line 15
    .line 16
    invoke-direct {v2, p0, v0}, Lcom/ss/bytertc/base/media/camera/f;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/Float;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public getDeviceOrientation()I
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v2, Lcom/ss/bytertc/base/media/camera/e;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/ss/bytertc/base/media/camera/e;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    .locals 0
    .param p1    # Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter p2

    .line 6
    :try_start_0
    iput-object p3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 7
    .line 8
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->surfaceHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p0
.end method

.method public isCameraTorchSupported()Z
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v2, Lcom/ss/bytertc/base/media/camera/k;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/ss/bytertc/base/media/camera/k;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v2, Lcom/ss/bytertc/base/media/camera/h;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/ss/bytertc/base/media/camera/h;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public isScreencast()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public printStackTrace()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length v0, p0

    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    const-string v0, "CameraCapturer stack trace:"

    .line 25
    .line 26
    const-string v1, "CameraCapturer"

    .line 27
    .line 28
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    array-length v0, p0

    .line 32
    const/4 v2, 0x0

    .line 33
    :goto_1
    if-ge v2, v0, :cond_1

    .line 34
    .line 35
    aget-object v3, p0, v2

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {v1, v3}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    return-void
.end method

.method public setCameraZoomRatio(F)I
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 8
    .line 9
    new-instance v2, Lcom/ss/bytertc/base/media/camera/j;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1, v0}, Lcom/ss/bytertc/base/media/camera/j;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;FLjava/util/concurrent/atomic/AtomicInteger;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->mOrientationMode:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 2
    .line 3
    return-void
.end method

.method public startCapture(III)V
    .locals 3

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "startCapture: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "x"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "@"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->applicationContext:Landroid/content/Context;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter v0

    .line 43
    :try_start_0
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->sessionOpening:Z

    .line 44
    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->width:I

    .line 53
    .line 54
    iput p2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->height:I

    .line 55
    .line 56
    iput p3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->framerate:I

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->sessionOpening:Z

    .line 60
    .line 61
    const/4 p1, 0x3

    .line 62
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->openAttemptsRemaining:I

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->createSessionInternal(I)V

    .line 66
    .line 67
    .line 68
    monitor-exit v0

    .line 69
    return-void

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    :goto_0
    const-string p0, "CameraCapturer"

    .line 73
    .line 74
    const-string p1, "Session already open"

    .line 75
    .line 76
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    monitor-exit v0

    .line 80
    return-void

    .line 81
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw p0

    .line 83
    :cond_2
    const-string p0, "CameraCapturer must be initialized before calling startCapture."

    .line 84
    .line 85
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public startCapture(IIII)V
    .locals 0

    .line 89
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->startCapture(III)V

    return-void
.end method

.method public stopCapture()V
    .locals 5

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "Stop capture"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->sessionOpening:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "CameraCapturer"

    .line 16
    .line 17
    const-string v2, "Stop capture: Waiting for session to open"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    :try_start_1
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_2

    .line 30
    :catch_0
    :try_start_2
    const-string p0, "CameraCapturer"

    .line 31
    .line 32
    const-string v1, "Stop capture interrupted while waiting for the session to open."

    .line 33
    .line 34
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 42
    .line 43
    .line 44
    monitor-exit v0

    .line 45
    return-void

    .line 46
    :cond_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    const-string v1, "CameraCapturer"

    .line 51
    .line 52
    const-string v2, "Stop capture: Nulling session"

    .line 53
    .line 54
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->release()V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraStatistics:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 66
    .line 67
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 68
    .line 69
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 70
    .line 71
    new-instance v4, Lcom/ss/bytertc/base/media/camera/CameraCapturer$6;

    .line 72
    .line 73
    invoke-direct {v4, p0, v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$6;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraSession;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 77
    .line 78
    .line 79
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->currentSession:Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 82
    .line 83
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerStopped()V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    const-string p0, "CameraCapturer"

    .line 88
    .line 89
    const-string v1, "Stop capture: No session open"

    .line 90
    .line 91
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    const-string p0, "CameraCapturer"

    .line 96
    .line 97
    const-string v0, "Stop capture done"

    .line 98
    .line 99
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 104
    throw p0
.end method

.method public switchCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 2

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "switchCamera"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public turnOffFlashLight()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/base/media/camera/l;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/l;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public turnOnFlashLight()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/base/media/camera/g;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/g;-><init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

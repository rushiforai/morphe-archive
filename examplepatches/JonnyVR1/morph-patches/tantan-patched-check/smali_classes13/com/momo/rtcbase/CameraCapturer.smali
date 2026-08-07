.class abstract Lcom/momo/rtcbase/CameraCapturer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/CameraVideoCapturer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/CameraCapturer$SwitchState;
    }
.end annotation


# static fields
.field private static final MAX_OPEN_CAMERA_ATTEMPTS:I = 0x3

.field private static final OPEN_CAMERA_DELAY_MS:I = 0x1f4

.field private static final OPEN_CAMERA_TIMEOUT:I = 0x2710

.field private static final TAG:Ljava/lang/String; = "CameraCapturer"


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private final cameraEnumerator:Lcom/momo/rtcbase/CameraEnumerator;

.field private cameraName:Ljava/lang/String;

.field private final cameraSessionEventsHandler:Lcom/momo/rtcbase/CameraSession$Events;

.field private cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

.field private cameraThreadHandler:Landroid/os/Handler;

.field private capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

.field private final createSessionCallback:Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;

.field private currentSession:Lcom/momo/rtcbase/CameraSession;

.field private final eventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;

.field private firstFrameObserved:Z

.field private framerate:I

.field private height:I

.field private openAttemptsRemaining:I

.field private final openCameraTimeoutRunnable:Ljava/lang/Runnable;

.field private sessionOpening:Z

.field private final stateLock:Ljava/lang/Object;

.field private surfaceHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

.field private switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

.field private switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

.field private final uiThreadHandler:Landroid/os/Handler;

.field private width:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;Lcom/momo/rtcbase/CameraEnumerator;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/CameraCapturer$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/CameraCapturer$1;-><init>(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->createSessionCallback:Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/rtcbase/CameraCapturer$2;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/CameraCapturer$2;-><init>(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraSessionEventsHandler:Lcom/momo/rtcbase/CameraSession$Events;

    .line 17
    .line 18
    new-instance v0, Lcom/momo/rtcbase/CameraCapturer$3;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/CameraCapturer$3;-><init>(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->openCameraTimeoutRunnable:Ljava/lang/Runnable;

    .line 24
    .line 25
    new-instance v0, Ljava/lang/Object;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 31
    .line 32
    sget-object v0, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IDLE:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 35
    .line 36
    if-nez p2, :cond_0

    .line 37
    .line 38
    new-instance p2, Lcom/momo/rtcbase/CameraCapturer$4;

    .line 39
    .line 40
    invoke-direct {p2, p0}, Lcom/momo/rtcbase/CameraCapturer$4;-><init>(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iput-object p2, p0, Lcom/momo/rtcbase/CameraCapturer;->eventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;

    .line 44
    .line 45
    iput-object p3, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraEnumerator:Lcom/momo/rtcbase/CameraEnumerator;

    .line 46
    .line 47
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 48
    .line 49
    new-instance p1, Landroid/os/Handler;

    .line 50
    .line 51
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->uiThreadHandler:Landroid/os/Handler;

    .line 59
    .line 60
    invoke-interface {p3}, Lcom/momo/rtcbase/CameraEnumerator;->getDeviceNames()[Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    array-length p2, p1

    .line 65
    const/4 p3, 0x0

    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p2, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 73
    .line 74
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 82
    .line 83
    const-string p1, " does not match any known camera device."

    .line 84
    .line 85
    const-string p2, "Camera name "

    .line 86
    .line 87
    invoke-static {p2, p0, p1}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    throw p3

    .line 91
    :cond_2
    const-string p0, "No cameras attached."

    .line 92
    .line 93
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw p3
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/CameraCapturer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/CameraCapturer;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->eventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraCapturer$SwitchState;)Lcom/momo/rtcbase/CameraCapturer$SwitchState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1100(Lcom/momo/rtcbase/CameraCapturer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/CameraCapturer;->firstFrameObserved:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1102(Lcom/momo/rtcbase/CameraCapturer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/CameraCapturer;->firstFrameObserved:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1200(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1202(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1300(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1400(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraEnumerator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraEnumerator:Lcom/momo/rtcbase/CameraEnumerator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->switchCameraInternal(Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lcom/momo/rtcbase/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/CameraCapturer;->openAttemptsRemaining:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1610(Lcom/momo/rtcbase/CameraCapturer;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/rtcbase/CameraCapturer;->openAttemptsRemaining:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/momo/rtcbase/CameraCapturer;->openAttemptsRemaining:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$1700(Lcom/momo/rtcbase/CameraCapturer;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->createSessionInternal(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->createSessionCallback:Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1900(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraSession$Events;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraSessionEventsHandler:Lcom/momo/rtcbase/CameraSession$Events;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->openCameraTimeoutRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/momo/rtcbase/CameraCapturer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2100(Lcom/momo/rtcbase/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/CameraCapturer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2200(Lcom/momo/rtcbase/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/CameraCapturer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$2300(Lcom/momo/rtcbase/CameraCapturer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/CameraCapturer;->framerate:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/CameraCapturer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->uiThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/CameraCapturer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CapturerObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/momo/rtcbase/CameraCapturer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/CameraCapturer;->sessionOpening:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$700(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraSession;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$702(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraSession;)Lcom/momo/rtcbase/CameraSession;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$800(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$802(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;)Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$900(Lcom/momo/rtcbase/CameraCapturer;)Lcom/momo/rtcbase/SurfaceTextureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->surfaceHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

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
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

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
    const-string p0, "CameraCapturer"

    .line 19
    .line 20
    const-string v0, "Check is on camera thread failed."

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "Not on camera thread."

    .line 26
    .line 27
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private createSessionInternal(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->uiThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->openCameraTimeoutRunnable:Ljava/lang/Runnable;

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
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 12
    .line 13
    new-instance v1, Lcom/momo/rtcbase/CameraCapturer$5;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/momo/rtcbase/CameraCapturer$5;-><init>(Lcom/momo/rtcbase/CameraCapturer;)V

    .line 16
    .line 17
    .line 18
    int-to-long p0, p1

    .line 19
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private reportCameraSwitchError(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    const-string p0, "CameraCapturer"

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-interface {p2, p1}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchError(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private switchCameraInternal(Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 5

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "switchCamera internal"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraEnumerator:Lcom/momo/rtcbase/CameraEnumerator;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/momo/rtcbase/CameraEnumerator;->getDeviceNames()[Ljava/lang/String;

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
    invoke-interface {p1, p0}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;->onCameraSwitchError(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v1

    .line 29
    :try_start_0
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer;->switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 30
    .line 31
    sget-object v3, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IDLE:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 32
    .line 33
    if-eq v2, v3, :cond_2

    .line 34
    .line 35
    const-string v0, "Camera switch already in progress."

    .line 36
    .line 37
    invoke-direct {p0, v0, p1}, Lcom/momo/rtcbase/CameraCapturer;->reportCameraSwitchError(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

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
    iget-boolean v2, p0, Lcom/momo/rtcbase/CameraCapturer;->sessionOpening:Z

    .line 45
    .line 46
    if-nez v2, :cond_3

    .line 47
    .line 48
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 49
    .line 50
    if-nez v3, :cond_3

    .line 51
    .line 52
    const-string v0, "switchCamera: camera is not running."

    .line 53
    .line 54
    invoke-direct {p0, v0, p1}, Lcom/momo/rtcbase/CameraCapturer;->reportCameraSwitchError(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 55
    .line 56
    .line 57
    monitor-exit v1

    .line 58
    return-void

    .line 59
    :cond_3
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 60
    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    sget-object p1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->PENDING:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 66
    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :cond_4
    sget-object p1, Lcom/momo/rtcbase/CameraCapturer$SwitchState;->IN_PROGRESS:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->switchState:Lcom/momo/rtcbase/CameraCapturer$SwitchState;

    .line 72
    .line 73
    const-string p1, "CameraCapturer"

    .line 74
    .line 75
    const-string v2, "switchCamera: Stopping session"

    .line 76
    .line 77
    invoke-static {p1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;->release()V

    .line 83
    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 87
    .line 88
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 91
    .line 92
    new-instance v4, Lcom/momo/rtcbase/CameraCapturer$8;

    .line 93
    .line 94
    invoke-direct {v4, p0, v2}, Lcom/momo/rtcbase/CameraCapturer$8;-><init>(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraSession;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 101
    .line 102
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 107
    .line 108
    invoke-interface {p1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    const/4 v2, 0x1

    .line 113
    add-int/2addr p1, v2

    .line 114
    array-length v3, v0

    .line 115
    rem-int/2addr p1, v3

    .line 116
    aget-object p1, v0, p1

    .line 117
    .line 118
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

    .line 119
    .line 120
    iput-boolean v2, p0, Lcom/momo/rtcbase/CameraCapturer;->sessionOpening:Z

    .line 121
    .line 122
    iput v2, p0, Lcom/momo/rtcbase/CameraCapturer;->openAttemptsRemaining:I

    .line 123
    .line 124
    const/4 p1, 0x0

    .line 125
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->createSessionInternal(I)V

    .line 126
    .line 127
    .line 128
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    const-string p0, "CameraCapturer"

    .line 130
    .line 131
    const-string p1, "switchCamera done"

    .line 132
    .line 133
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 37
    .line 38
    monitor-enter v0

    .line 39
    :try_start_0
    invoke-virtual {p0}, Lcom/momo/rtcbase/CameraCapturer;->stopCapture()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/rtcbase/CameraCapturer;->startCapture(III)V

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

.method public abstract createCameraSession(Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;Lcom/momo/rtcbase/CameraSession$Events;Landroid/content/Context;Lcom/momo/rtcbase/SurfaceTextureHelper;Ljava/lang/String;III)V
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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/rtcbase/CameraCapturer;->stopCapture()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getCameraName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraName:Ljava/lang/String;

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

.method public initialize(Lcom/momo/rtcbase/SurfaceTextureHelper;Landroid/content/Context;Lcom/momo/rtcbase/CapturerObserver;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/momo/rtcbase/CameraCapturer;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/momo/rtcbase/CameraCapturer;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->surfaceHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 16
    .line 17
    return-void
.end method

.method public isScreencast()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public printStackTrace()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

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
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    invoke-static {v1, v3}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->applicationContext:Landroid/content/Context;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter v0

    .line 43
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/rtcbase/CameraCapturer;->sessionOpening:Z

    .line 44
    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iput p1, p0, Lcom/momo/rtcbase/CameraCapturer;->width:I

    .line 53
    .line 54
    iput p2, p0, Lcom/momo/rtcbase/CameraCapturer;->height:I

    .line 55
    .line 56
    iput p3, p0, Lcom/momo/rtcbase/CameraCapturer;->framerate:I

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    iput-boolean p1, p0, Lcom/momo/rtcbase/CameraCapturer;->sessionOpening:Z

    .line 60
    .line 61
    const/4 p1, 0x3

    .line 62
    iput p1, p0, Lcom/momo/rtcbase/CameraCapturer;->openAttemptsRemaining:I

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->createSessionInternal(I)V

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
    invoke-static {p0, p1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

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

.method public stopCapture()V
    .locals 5

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "Stop capture"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/rtcbase/CameraCapturer;->sessionOpening:Z

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
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    :try_start_1
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->stateLock:Ljava/lang/Object;

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
    invoke-static {p0, v1}, Lcom/momo/rtcbase/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

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
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    const-string v1, "CameraCapturer"

    .line 51
    .line 52
    const-string v2, "Stop capture: Nulling session"

    .line 53
    .line 54
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;->release()V

    .line 60
    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    iput-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraStatistics:Lcom/momo/rtcbase/CameraVideoCapturer$CameraStatistics;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 66
    .line 67
    iget-object v3, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 68
    .line 69
    new-instance v4, Lcom/momo/rtcbase/CameraCapturer$6;

    .line 70
    .line 71
    invoke-direct {v4, p0, v2}, Lcom/momo/rtcbase/CameraCapturer$6;-><init>(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraSession;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Lcom/momo/rtcbase/CameraCapturer;->currentSession:Lcom/momo/rtcbase/CameraSession;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 80
    .line 81
    invoke-interface {p0}, Lcom/momo/rtcbase/CapturerObserver;->onCapturerStopped()V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    const-string p0, "CameraCapturer"

    .line 86
    .line 87
    const-string v1, "Stop capture: No session open"

    .line 88
    .line 89
    invoke-static {p0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    const-string p0, "CameraCapturer"

    .line 94
    .line 95
    const-string v0, "Stop capture done"

    .line 96
    .line 97
    invoke-static {p0, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 102
    throw p0
.end method

.method public switchCamera(Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 2

    .line 1
    const-string v0, "CameraCapturer"

    .line 2
    .line 3
    const-string v1, "switchCamera"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer;->cameraThreadHandler:Landroid/os/Handler;

    .line 9
    .line 10
    new-instance v1, Lcom/momo/rtcbase/CameraCapturer$7;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/momo/rtcbase/CameraCapturer$7;-><init>(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

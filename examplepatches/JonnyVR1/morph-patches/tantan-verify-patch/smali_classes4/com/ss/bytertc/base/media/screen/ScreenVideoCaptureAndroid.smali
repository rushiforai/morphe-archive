.class public Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ScreenCaptureModelMediaProjection:I = 0x0

.field private static final ScreenCaptureModelMediaProjectionWithForegroundService:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ScreenVideoCaptureAndroid"


# instance fields
.field private cameraEglBase:Lcom/bytedance/realx/video/EglBase;

.field private localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

.field private mCaptureScreenIntent:Landroid/content/Intent;

.field private mIsVideoCaptureInited:Z

.field private mIsVideoCaptureWorking:Z

.field private mNativeCaptureObserver:J

.field private mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

.field private sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;


# direct methods
.method public constructor <init>(JLcom/bytedance/realx/video/EglBase$Context;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 17
    .line 18
    new-instance v0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 24
    .line 25
    iput-wide p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mNativeCaptureObserver:J

    .line 26
    .line 27
    iput-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mNativeCaptureObserver:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Lcom/ss/bytertc/base/media/VideoCapturer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Lcom/ss/bytertc/base/media/CapturerObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method private createVideoCapturer(Landroid/content/Intent;)Lcom/ss/bytertc/base/media/VideoCapturer;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;-><init>(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p1, v1}, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;-><init>(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-object v0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "Create VideoCapture fail : "

    .line 16
    .line 17
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "ScreenVideoCaptureAndroid"

    .line 32
    .line 33
    invoke-static {p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method private startVideoCapture(III)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-interface {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/VideoCapturer;->startCapture(III)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string p2, "VideoCapture startCapture fail : "

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "ScreenVideoCaptureAndroid"

    .line 32
    .line 33
    invoke-static {p1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method


# virtual methods
.method public changeCaptureFormat(III)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/VideoCapturer;->changeCaptureFormat(III)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->stopCapture()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->dispose()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 24
    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 29
    .line 30
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 31
    .line 32
    iput-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 33
    .line 34
    return-void
.end method

.method public startCapture(IIILandroid/content/Intent;)V
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    const-string p0, "ScreenVideoCaptureAndroid"

    .line 4
    .line 5
    const-string p1, "startCapture failed, intent is null"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 12
    .line 13
    iget-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p4, :cond_1

    .line 17
    .line 18
    invoke-interface {p4}, Lcom/ss/bytertc/base/media/VideoCapturer;->dispose()V

    .line 19
    .line 20
    .line 21
    const/4 p4, 0x0

    .line 22
    iput-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 27
    .line 28
    :cond_1
    sget p4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 29
    .line 30
    const/16 v1, 0x1c

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    if-le p4, v1, :cond_2

    .line 34
    .line 35
    move p4, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move p4, v0

    .line 38
    :goto_0
    iget-wide v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mNativeCaptureObserver:J

    .line 39
    .line 40
    invoke-static {v3, v4, p4}, Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;->nativeOnCapturerSetType(JI)V

    .line 41
    .line 42
    .line 43
    iget-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 44
    .line 45
    invoke-direct {p0, p4}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->createVideoCapturer(Landroid/content/Intent;)Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 46
    .line 47
    .line 48
    move-result-object p4

    .line 49
    iput-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 50
    .line 51
    iget-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 52
    .line 53
    if-nez p4, :cond_3

    .line 54
    .line 55
    iget-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 56
    .line 57
    invoke-static {p4}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;)Lcom/bytedance/realx/video/EglBase;

    .line 58
    .line 59
    .line 60
    move-result-object p4

    .line 61
    iput-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 62
    .line 63
    :cond_3
    iget-object p4, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 64
    .line 65
    if-eqz p4, :cond_4

    .line 66
    .line 67
    check-cast p4, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 70
    .line 71
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v3, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 80
    .line 81
    invoke-virtual {p4, v0, v1, v3}, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->initialize(Lcom/bytedance/realx/video/EglBase$Context;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V

    .line 82
    .line 83
    .line 84
    iput-boolean v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 85
    .line 86
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->startVideoCapture(III)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 91
    .line 92
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 93
    .line 94
    return-void
.end method

.method public stopCapture()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->stopCapture()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->mIsVideoCaptureWorking:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

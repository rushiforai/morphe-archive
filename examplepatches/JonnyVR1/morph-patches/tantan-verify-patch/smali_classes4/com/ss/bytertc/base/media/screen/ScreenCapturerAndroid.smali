.class public Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/VideoCapturer;
.implements Lcom/ss/bytertc/base/media/VideoSink;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ScreenCaptureAndroid"


# instance fields
.field private capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

.field private mContext:Landroid/content/Context;

.field private mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field private needStartService:Z


# direct methods
.method public constructor <init>(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;)V
    .locals 1

    const/4 v0, 0x1

    .line 42
    invoke-direct {p0, p1, p2, v0}, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;-><init>(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 16
    .line 17
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->addLock(ILjava/util/concurrent/CountDownLatch;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1, p2}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->setData(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;)V

    .line 37
    .line 38
    .line 39
    iput-boolean p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public declared-synchronized changeCaptureFormat(III)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x1c

    .line 9
    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "w"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p1, "h"

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p1, "if"

    .line 29
    .line 30
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    :try_start_1
    sget-object p1, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 42
    .line 43
    const/4 p2, 0x3

    .line 44
    invoke-static {p1, p2, v0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p1, p2}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_1
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_2

    .line 54
    :catch_0
    :try_start_2
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 55
    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    const-string p2, "Start foreground service failed."

    .line 59
    .line 60
    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_0
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->changeCaptureFormat(III)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    monitor-exit p0

    .line 72
    return-void

    .line 73
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 74
    throw p1
.end method

.method public disableDoOrientation()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->disableDoOrientation()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized dispose()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 3
    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x1c

    .line 9
    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const-string v2, "hc"

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :try_start_1
    sget-object v1, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 38
    .line 39
    const/4 v2, 0x5

    .line 40
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v1, v0}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_1
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    goto :goto_3

    .line 50
    :catch_0
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const-string v1, "Start foreground service failed."

    .line 55
    .line 56
    invoke-interface {v0, v1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    :try_start_3
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 60
    .line 61
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 62
    .line 63
    const-wide/16 v2, 0x5dc

    .line 64
    .line 65
    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :catch_1
    move-exception v0

    .line 70
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_2
    :goto_1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->dispose()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 79
    .line 80
    .line 81
    :goto_2
    monitor-exit p0

    .line 82
    return-void

    .line 83
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 84
    throw v0
.end method

.method public enableFollowGravity(Z)I
    .locals 0

    const/4 p0, -0x1

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

.method public getMediaProjection()Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->getMediaProjection()Landroid/media/projection/MediaProjection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public declared-synchronized initialize(Lcom/bytedance/realx/video/EglBase$Context;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 3
    .line 4
    iput-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 5
    .line 6
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->initialize(Lcom/bytedance/realx/video/EglBase$Context;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public declared-synchronized initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    .locals 1

    monitor-enter p0

    .line 18
    :try_start_0
    iput-object p2, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 19
    iput-object p3, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 20
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
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

.method public isScreencast()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v1, 0x1c

    .line 8
    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->addFrame(Lcom/bytedance/realx/video/VideoFrame;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "i"

    .line 26
    .line 27
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    :try_start_0
    sget-object p1, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {p1, v1, v0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {p1, v0}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    const-string p1, "Start foreground service failed."

    .line 54
    .line 55
    invoke-interface {p0, p1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void

    .line 59
    :cond_2
    :goto_0
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->onFrame(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setCameraZoomRatio(F)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public declared-synchronized startCapture(III)V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x4

    .line 150
    :try_start_0
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->startCapture(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized startCapture(IIII)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 3
    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 7
    .line 8
    const/16 v1, 0x1c

    .line 9
    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 15
    .line 16
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "w"

    .line 20
    .line 21
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string p1, "h"

    .line 25
    .line 26
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string p1, "if"

    .line 30
    .line 31
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const-string p1, "minfr"

    .line 35
    .line 36
    if-lez p4, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p4, 0x4

    .line 40
    :goto_0
    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x3

    .line 44
    move p2, p1

    .line 45
    :goto_1
    :try_start_1
    sget-object p3, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 46
    .line 47
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 48
    .line 49
    .line 50
    move-result p3
    :try_end_1
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    if-nez p3, :cond_3

    .line 52
    .line 53
    add-int/lit8 p3, p2, -0x1

    .line 54
    .line 55
    if-lez p2, :cond_2

    .line 56
    .line 57
    const-wide/16 v1, 0x32

    .line 58
    .line 59
    :try_start_2
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :catchall_0
    move-exception p1

    .line 64
    goto :goto_5

    .line 65
    :catch_0
    move-exception p2

    .line 66
    :try_start_3
    const-string p4, "ScreenCaptureAndroid"

    .line 67
    .line 68
    const-string v1, "[ScreenCapture] sleep exception"

    .line 69
    .line 70
    invoke-static {p4, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 74
    .line 75
    .line 76
    :goto_2
    move p2, p3

    .line 77
    goto :goto_1

    .line 78
    :cond_2
    move p2, p3

    .line 79
    :cond_3
    const/4 p3, 0x0

    .line 80
    if-lez p2, :cond_4

    .line 81
    .line 82
    const-string p4, "ScreenCaptureAndroid"

    .line 83
    .line 84
    const-string v1, "[ScreenCapture]  call RXScreenCaptureService.COMMAND_START success, wait times:%d ms"

    .line 85
    .line 86
    const/4 v2, 0x1

    .line 87
    new-array v3, v2, [Ljava/lang/Object;

    .line 88
    .line 89
    sub-int/2addr p1, p2

    .line 90
    mul-int/lit8 p1, p1, 0x32

    .line 91
    .line 92
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    aput-object p1, v3, p3

    .line 97
    .line 98
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p4, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 106
    .line 107
    invoke-static {p1, v2, v0}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-static {p1, p2}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 112
    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_4
    const-string p1, "ScreenCaptureAndroid"

    .line 116
    .line 117
    const-string p2, "[ScreenCapture] wait start service timeout"

    .line 118
    .line 119
    new-array p3, p3, [Ljava/lang/Object;

    .line 120
    .line 121
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 126
    .line 127
    .line 128
    goto :goto_4

    .line 129
    :catch_1
    :try_start_4
    iget-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 130
    .line 131
    if-eqz p1, :cond_6

    .line 132
    .line 133
    const-string p2, "Start foreground service failed."

    .line 134
    .line 135
    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_5
    :goto_3
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->startCapture(IIII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 144
    .line 145
    .line 146
    :cond_6
    :goto_4
    monitor-exit p0

    .line 147
    return-void

    .line 148
    :goto_5
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 149
    throw p1
.end method

.method public declared-synchronized stopCapture()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->needStartService:Z

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const/16 v1, 0x1c

    .line 9
    .line 10
    if-gt v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    :try_start_1
    sget-object v0, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->serviceStarted:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->mContext:Landroid/content/Context;

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v0, v1, v2}, Lcom/ss/bytertc/base/media/screen/RXScreenCaptureService;->getServiceIntent(Landroid/content/Context;ILandroid/content/Intent;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Ll/tlk0;->a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_1
    .catch Landroid/app/ForegroundServiceStartNotAllowedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_2

    .line 35
    :catch_0
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;->capturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    const-string v1, "Start foreground service failed."

    .line 40
    .line 41
    invoke-interface {v0, v1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    invoke-static {}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->INSTANCE()Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->stopCapture()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_1
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 55
    throw v0
.end method

.method public turnOffFlashLight()V
    .locals 0

    return-void
.end method

.method public turnOnFlashLight()V
    .locals 0

    return-void
.end method

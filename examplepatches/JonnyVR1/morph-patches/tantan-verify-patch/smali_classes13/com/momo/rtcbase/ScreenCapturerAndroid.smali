.class public Lcom/momo/rtcbase/ScreenCapturerAndroid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoCapturer;
.implements Lcom/momo/rtcbase/VideoSink;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final DISPLAY_FLAGS:I = 0x3

.field private static final VIRTUAL_DISPLAY_DPI:I = 0x190


# instance fields
.field private capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

.field private height:I

.field private isDisposed:Z

.field private mediaProjection:Landroid/media/projection/MediaProjection;

.field private final mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

.field private mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

.field private final mediaProjectionPermissionResultData:Landroid/content/Intent;

.field private numCapturedFrames:J

.field private surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

.field private virtualDisplay:Landroid/hardware/display/VirtualDisplay;

.field private width:I


# direct methods
.method public constructor <init>(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionPermissionResultData:Landroid/content/Intent;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/rtcbase/ScreenCapturerAndroid;)Lcom/momo/rtcbase/SurfaceTextureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/rtcbase/ScreenCapturerAndroid;)Lcom/momo/rtcbase/CapturerObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/rtcbase/ScreenCapturerAndroid;)Landroid/hardware/display/VirtualDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/momo/rtcbase/ScreenCapturerAndroid;Landroid/hardware/display/VirtualDisplay;)Landroid/hardware/display/VirtualDisplay;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$300(Lcom/momo/rtcbase/ScreenCapturerAndroid;)Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/rtcbase/ScreenCapturerAndroid;Landroid/media/projection/MediaProjection;)Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$400(Lcom/momo/rtcbase/ScreenCapturerAndroid;)Landroid/media/projection/MediaProjection$Callback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/momo/rtcbase/ScreenCapturerAndroid;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->createVirtualDisplay()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private checkNotDisposed()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->isDisposed:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "capturer is disposed."

    .line 7
    .line 8
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private createVirtualDisplay()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->width:I

    .line 4
    .line 5
    iget v2, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->height:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/momo/rtcbase/SurfaceTextureHelper;->setTextureSize(II)V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 11
    .line 12
    iget v5, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->width:I

    .line 13
    .line 14
    iget v6, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->height:I

    .line 15
    .line 16
    new-instance v9, Landroid/view/Surface;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {v9, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 25
    .line 26
    .line 27
    const/4 v10, 0x0

    .line 28
    const/4 v11, 0x0

    .line 29
    const-string v4, "WebRTC_ScreenCapture"

    .line 30
    .line 31
    const/16 v7, 0x190

    .line 32
    .line 33
    const/4 v8, 0x3

    .line 34
    invoke-virtual/range {v3 .. v11}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public declared-synchronized changeCaptureFormat(III)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    iput p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->width:I

    .line 6
    .line 7
    iput p2, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->height:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_1
    iget-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Lcom/momo/rtcbase/ScreenCapturerAndroid$2;

    .line 22
    .line 23
    invoke-direct {p2, p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid$2;-><init>(Lcom/momo/rtcbase/ScreenCapturerAndroid;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, p2}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    throw p1
.end method

.method public declared-synchronized dispose()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->isDisposed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public getNumCapturedFrames()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->numCapturedFrames:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public declared-synchronized initialize(Lcom/momo/rtcbase/SurfaceTextureHelper;Landroid/content/Context;Lcom/momo/rtcbase/CapturerObserver;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    iput-object p3, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 12
    .line 13
    const-string p1, "media_projection"

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/media/projection/MediaProjectionManager;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 28
    .line 29
    const-string p2, "surfaceTextureHelper not set."

    .line 30
    .line 31
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p1

    .line 35
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 36
    .line 37
    const-string p2, "capturerObserver not set."

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p1

    .line 43
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public isScreencast()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onFrame(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->numCapturedFrames:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->numCapturedFrames:J

    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/CapturerObserver;->onFrameCaptured(Lcom/momo/rtcbase/VideoFrame;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public declared-synchronized startCapture(III)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    iput p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->width:I

    .line 6
    .line 7
    iput p2, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->height:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 10
    .line 11
    iget-object p2, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionPermissionResultData:Landroid/content/Intent;

    .line 12
    .line 13
    const/4 p3, -0x1

    .line 14
    invoke-virtual {p1, p3, p2}, Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjection:Landroid/media/projection/MediaProjection;

    .line 19
    .line 20
    iget-object p2, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->mediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 21
    .line 22
    iget-object p3, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 23
    .line 24
    invoke-virtual {p3}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {p1, p2, p3}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->createVirtualDisplay()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->capturerObserver:Lcom/momo/rtcbase/CapturerObserver;

    .line 35
    .line 36
    const/4 p2, 0x1

    .line 37
    invoke-interface {p1, p2}, Lcom/momo/rtcbase/CapturerObserver;->onCapturerStarted(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->startListening(Lcom/momo/rtcbase/VideoSink;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :catchall_0
    move-exception p1

    .line 48
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    throw p1
.end method

.method public declared-synchronized stopCapture()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->checkNotDisposed()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid;->surfaceTextureHelper:Lcom/momo/rtcbase/SurfaceTextureHelper;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/rtcbase/SurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/momo/rtcbase/ScreenCapturerAndroid$1;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid$1;-><init>(Lcom/momo/rtcbase/ScreenCapturerAndroid;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v0
.end method

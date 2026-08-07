.class public Lio/agora/rtc2/video/VideoCaptureScreen;
.super Lio/agora/rtc2/video/VideoCapture;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/SurfaceTextureHelper$IVideoCapture;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field private static final DISPLAY_FLAGS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "VideoCaptureScreen"

.field private static final VIRTUAL_DISPLAY_DPI:I = 0x190


# instance fields
.field private lastRotation:I

.field private mFramerate:I

.field private mHeight:I

.field private mMediaProjection:Landroid/media/projection/MediaProjection;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mMediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

.field private mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

.field private final mMediaProjectionPermissionResultData:Landroid/content/Intent;

.field private mVirtualDisplay:Landroid/hardware/display/VirtualDisplay;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mWaitForDeviceClosedConditionVariable:Landroid/os/ConditionVariable;

.field private mWidth:I


# direct methods
.method public constructor <init>(JLio/agora/base/internal/video/EglBase$Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    const-string v0, "ScreenCapturerThread"

    .line 2
    .line 3
    invoke-static {v0, p3}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->create(Ljava/lang/String;Lio/agora/base/internal/video/EglBase$Context;)Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lio/agora/rtc2/video/VideoCapture;-><init>(JLio/agora/base/internal/video/ISurfaceTextureHelper;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Lio/agora/rtc2/video/VideoCaptureScreen$1;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Lio/agora/rtc2/video/VideoCaptureScreen$1;-><init>(Lio/agora/rtc2/video/VideoCaptureScreen;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 16
    .line 17
    new-instance p1, Landroid/os/ConditionVariable;

    .line 18
    .line 19
    invoke-direct {p1}, Landroid/os/ConditionVariable;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWaitForDeviceClosedConditionVariable:Landroid/os/ConditionVariable;

    .line 23
    .line 24
    const/4 p1, -0x1

    .line 25
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->lastRotation:I

    .line 26
    .line 27
    iput-object p4, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionPermissionResultData:Landroid/content/Intent;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic access$000(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/hardware/display/VirtualDisplay;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mVirtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$002(Lio/agora/rtc2/video/VideoCaptureScreen;Landroid/hardware/display/VirtualDisplay;)Landroid/hardware/display/VirtualDisplay;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mVirtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$100(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lio/agora/rtc2/video/VideoCaptureScreen;Landroid/media/projection/MediaProjection;)Landroid/media/projection/MediaProjection;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/media/projection/MediaProjection$Callback;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lio/agora/rtc2/video/VideoCaptureScreen;)Landroid/os/ConditionVariable;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWaitForDeviceClosedConditionVariable:Landroid/os/ConditionVariable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lio/agora/rtc2/video/VideoCaptureScreen;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/rtc2/video/VideoCaptureScreen;->createVirtualDisplay()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private createVirtualDisplay()V
    .locals 12

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 11
    .line 12
    iget v2, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 13
    .line 14
    invoke-interface {v0, v1, v2}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->setTextureSize(II)V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 18
    .line 19
    iget v5, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 20
    .line 21
    iget v6, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 22
    .line 23
    new-instance v9, Landroid/view/Surface;

    .line 24
    .line 25
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 26
    .line 27
    invoke-interface {v0}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {v9, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 32
    .line 33
    .line 34
    const/4 v10, 0x0

    .line 35
    const/4 v11, 0x0

    .line 36
    const-string v4, "WebRTC_ScreenCapture"

    .line 37
    .line 38
    const/16 v7, 0x190

    .line 39
    .line 40
    const/4 v8, 0x3

    .line 41
    invoke-virtual/range {v3 .. v11}, Landroid/media/projection/MediaProjection;->createVirtualDisplay(Ljava/lang/String;IIIILandroid/view/Surface;Landroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mVirtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public allocate(Lio/agora/rtc2/video/VideoCaptureFormat;)Z
    .locals 4
    .param p1    # Lio/agora/rtc2/video/VideoCaptureFormat;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    iget v1, p1, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p1, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget v3, p1, Lio/agora/rtc2/video/VideoCaptureFormat;->mFramerate:I

    .line 16
    .line 17
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "allocate: requested (%d x %d) %d"

    .line 26
    .line 27
    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "VideoCaptureScreen"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget v0, p1, Lio/agora/rtc2/video/VideoCaptureFormat;->mFramerate:I

    .line 37
    .line 38
    if-lez v0, :cond_2

    .line 39
    .line 40
    iput v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mFramerate:I

    .line 41
    .line 42
    iget v0, p1, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget v1, p1, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 47
    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iput v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 52
    .line 53
    iput v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    new-instance v0, Landroid/util/DisplayMetrics;

    .line 57
    .line 58
    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "window"

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Landroid/view/WindowManager;

    .line 72
    .line 73
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 78
    .line 79
    .line 80
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 81
    .line 82
    iput v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 83
    .line 84
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 85
    .line 86
    iput v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 87
    .line 88
    :goto_1
    new-instance v0, Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 89
    .line 90
    iget v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 91
    .line 92
    iget v2, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 93
    .line 94
    invoke-virtual {p1}, Lio/agora/rtc2/video/VideoCaptureFormat;->getFramerate()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {p1}, Lio/agora/rtc2/video/VideoCaptureFormat;->getPixelFormat()I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-direct {v0, v1, v2, v3, p1}, Lio/agora/rtc2/video/VideoCaptureFormat;-><init>(IIII)V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 106
    .line 107
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    const-string v0, "media_projection"

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Landroid/media/projection/MediaProjectionManager;

    .line 118
    .line 119
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 120
    .line 121
    const/4 p0, 0x1

    .line 122
    return p0

    .line 123
    :cond_2
    const-string p0, "invalid frame rate"

    .line 124
    .line 125
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    const/4 p0, 0x0

    .line 129
    return p0
.end method

.method public declared-synchronized changeCaptureFormat(III)V
    .locals 2

    .line 1
    const-string p3, "changeCaptureFormat, "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v0, "VideoCaptureScreen"

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p3, " x "

    .line 15
    .line 16
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-static {v0, p3}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 30
    .line 31
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 32
    .line 33
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mVirtualDisplay:Landroid/hardware/display/VirtualDisplay;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :cond_0
    :try_start_1
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-void

    .line 45
    :cond_1
    :try_start_2
    invoke-interface {p1}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance p2, Lio/agora/rtc2/video/VideoCaptureScreen$3;

    .line 50
    .line 51
    invoke-direct {p2, p0}, Lio/agora/rtc2/video/VideoCaptureScreen$3;-><init>(Lio/agora/rtc2/video/VideoCaptureScreen;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, p2}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception p1

    .line 60
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 61
    throw p1
.end method

.method public deallocate()V
    .locals 1

    .line 1
    const-string p0, "VideoCaptureScreen"

    .line 2
    .line 3
    const-string v0, "deallocate()"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onFrame(Lio/agora/base/VideoFrame;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCapture;->getDeviceRotation()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->lastRotation:I

    .line 6
    .line 7
    if-eq v1, v0, :cond_0

    .line 8
    .line 9
    iput v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->lastRotation:I

    .line 10
    .line 11
    iget v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mHeight:I

    .line 12
    .line 13
    iget v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWidth:I

    .line 14
    .line 15
    const/16 v2, 0xf

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lio/agora/rtc2/video/VideoCaptureScreen;->changeCaptureFormat(III)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Lio/agora/rtc2/video/VideoCapture;->onFrameCaptured(Lio/agora/base/VideoFrame;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFrameDropped(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lio/agora/rtc2/video/VideoCapture;->onFrameDropped(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public startCaptureMaybeAsync()Z
    .locals 5

    .line 1
    const-string v0, "startCaptureMaybeAsync()"

    .line 2
    .line 3
    const-string v1, "VideoCaptureScreen"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :try_start_0
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionManager:Landroid/media/projection/MediaProjectionManager;

    .line 10
    .line 11
    iget-object v3, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionPermissionResultData:Landroid/content/Intent;

    .line 12
    .line 13
    const/4 v4, -0x1

    .line 14
    invoke-virtual {v2, v4, v3}, Landroid/media/projection/MediaProjectionManager;->getMediaProjection(ILandroid/content/Intent;)Landroid/media/projection/MediaProjection;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjection:Landroid/media/projection/MediaProjection;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    const-string p0, "getMediaProjection error. invalid mediaProjectionPermissionResultData"

    .line 23
    .line 24
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 29
    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    const-string p0, "SurfaceTextureHelper null"

    .line 33
    .line 34
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    invoke-virtual {p0}, Lio/agora/rtc2/video/VideoCapture;->getDeviceRotation()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->lastRotation:I

    .line 43
    .line 44
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjection:Landroid/media/projection/MediaProjection;

    .line 45
    .line 46
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mMediaProjectionCallback:Landroid/media/projection/MediaProjection$Callback;

    .line 47
    .line 48
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 49
    .line 50
    invoke-interface {v2}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/media/projection/MediaProjection;->registerCallback(Landroid/media/projection/MediaProjection$Callback;Landroid/os/Handler;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0}, Lio/agora/rtc2/video/VideoCaptureScreen;->createVirtualDisplay()V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 61
    .line 62
    check-cast v0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 63
    .line 64
    iget v1, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mFramerate:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->setFrameRate(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 70
    .line 71
    invoke-interface {v0, p0}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->startListening(Lio/agora/base/internal/video/VideoSink;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0

    .line 76
    :catch_0
    move-exception p0

    .line 77
    goto :goto_0

    .line 78
    :catch_1
    move-exception p0

    .line 79
    goto :goto_1

    .line 80
    :goto_0
    const-string v2, "Failed to getMediaProjection, IllegalStateException!"

    .line 81
    .line 82
    invoke-static {v1, v2, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    return v0

    .line 86
    :goto_1
    const-string v2, "Failed to getMediaProjection, you should start a foreground service before capture screen!"

    .line 87
    .line 88
    invoke-static {v1, v2, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    return v0
.end method

.method public stopCaptureAndBlockUntilStopped()V
    .locals 2

    .line 1
    const-string v0, "VideoCaptureScreen"

    .line 2
    .line 3
    const-string v1, "stopCaptureAndBlockUntilStopped()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-interface {v0}, Lio/agora/base/internal/video/ISurfaceTextureHelper;->getHandler()Landroid/os/Handler;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lio/agora/rtc2/video/VideoCaptureScreen$2;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lio/agora/rtc2/video/VideoCaptureScreen$2;-><init>(Lio/agora/rtc2/video/VideoCaptureScreen;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Lio/agora/base/internal/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureScreen;->mWaitForDeviceClosedConditionVariable:Landroid/os/ConditionVariable;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/os/ConditionVariable;->block()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

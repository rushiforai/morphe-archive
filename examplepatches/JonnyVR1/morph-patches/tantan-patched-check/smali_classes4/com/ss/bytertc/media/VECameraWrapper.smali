.class public Lcom/ss/bytertc/media/VECameraWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;,
        Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;,
        Lcom/ss/bytertc/media/VECameraWrapper$CamParam;,
        Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;,
        Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;,
        Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;
    }
.end annotation


# instance fields
.field private final CAMERA_BLOCK_THRESHOLD_MS:I

.field private final STA_STARTED:I

.field private final STA_STARTING:I

.field private final STA_STOPPED:I

.field private final TAG2SVR:Ljava/lang/String;

.field private mActHeight:I

.field private mActWidth:I

.field private mCamInfo:Landroid/hardware/Camera$CameraInfo;

.field private mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

.field mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mCamera:Lcom/ss/android/ttvecamera/d;

.field private mCameraLock:Ljava/lang/Object;

.field private mContext:Landroid/content/Context;

.field private mEventObserver:Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;

.field private mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

.field private mGravityOrientation:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mIsExposurePointSupported:Z

.field private mIsFocusPointSupported:Z

.field private mLastDeviceOrientation:I

.field private mLastDeviceOrientationTS:J

.field private mLastUIOrientation:I

.field private volatile mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

.field private mNativeObj:J

.field mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

.field private final mSensorListener:Landroid/hardware/SensorEventListener;

.field private mSharedCtx:Lcom/bytedance/realx/video/EglBase$Context;

.field private mUseGravitySensor:Z

.field private mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;


# direct methods
.method public constructor <init>(JLcom/bytedance/realx/video/EglBase$Context;)V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 10
    .line 11
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 12
    .line 13
    new-instance v3, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCameraLock:Ljava/lang/Object;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mSharedCtx:Lcom/bytedance/realx/video/EglBase$Context;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    iput v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientation:I

    .line 26
    .line 27
    iput v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastUIOrientation:I

    .line 28
    .line 29
    iput-wide v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientationTS:J

    .line 30
    .line 31
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mEventObserver:Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 34
    .line 35
    iput v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mActWidth:I

    .line 36
    .line 37
    iput v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mActHeight:I

    .line 38
    .line 39
    iput v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->STA_STOPPED:I

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    iput v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->STA_STARTING:I

    .line 43
    .line 44
    const/4 v2, 0x2

    .line 45
    iput v2, p0, Lcom/ss/bytertc/media/VECameraWrapper;->STA_STARTED:I

    .line 46
    .line 47
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    .line 49
    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 53
    .line 54
    new-instance v2, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 57
    .line 58
    .line 59
    iput-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 60
    .line 61
    const-string v2, "toSvr"

    .line 62
    .line 63
    iput-object v2, p0, Lcom/ss/bytertc/media/VECameraWrapper;->TAG2SVR:Ljava/lang/String;

    .line 64
    .line 65
    const/16 v2, 0x7d0

    .line 66
    .line 67
    iput v2, p0, Lcom/ss/bytertc/media/VECameraWrapper;->CAMERA_BLOCK_THRESHOLD_MS:I

    .line 68
    .line 69
    iput-boolean v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsExposurePointSupported:Z

    .line 70
    .line 71
    iput-boolean v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsFocusPointSupported:Z

    .line 72
    .line 73
    iput-boolean v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 74
    .line 75
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 76
    .line 77
    sget-object v2, Lcom/ss/bytertc/engine/UIDeviceOrientation;->Portrait:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 84
    .line 85
    .line 86
    iput-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mGravityOrientation:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfo:Landroid/hardware/Camera$CameraInfo;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 91
    .line 92
    new-instance v0, Lcom/ss/bytertc/media/VECameraWrapper$2;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Lcom/ss/bytertc/media/VECameraWrapper$2;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mSensorListener:Landroid/hardware/SensorEventListener;

    .line 98
    .line 99
    iput-wide p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 100
    .line 101
    iput-object p3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mSharedCtx:Lcom/bytedance/realx/video/EglBase$Context;

    .line 102
    .line 103
    return-void
.end method

.method private static DeviceSupportCamera2()Z
    .locals 3

    .line 1
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const-string v2, "CVTE"

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    xor-int/2addr v0, v1

    .line 14
    return v0
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/media/VECameraWrapper;ILjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnCaptureLog(ILjava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/media/VECameraWrapper;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->getFrameOrientation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1000(Lcom/ss/bytertc/media/VECameraWrapper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1002(Lcom/ss/bytertc/media/VECameraWrapper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientation:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$1100(Lcom/ss/bytertc/media/VECameraWrapper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1200(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnCaptureStarted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/bytedance/realx/video/EglBase$Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mSharedCtx:Lcom/bytedance/realx/video/EglBase$Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCameraLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2100(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2500(Lcom/ss/bytertc/media/VECameraWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnCaptureStopped()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2600(Lcom/ss/bytertc/media/VECameraWrapper;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnCaptureError(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2700(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/android/ttvecamera/TECameraSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2800(Lcom/ss/bytertc/media/VECameraWrapper;IIIII)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnCaptureFormatSelected(IIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2900(Lcom/ss/bytertc/media/VECameraWrapper;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mGravityOrientation:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/media/VECameraWrapper;Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnFrameCaptured(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/media/VECameraWrapper;)Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/ss/bytertc/media/VECameraWrapper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mActWidth:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$702(Lcom/ss/bytertc/media/VECameraWrapper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mActHeight:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/media/VECameraWrapper;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientationTS:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$802(Lcom/ss/bytertc/media/VECameraWrapper;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientationTS:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic access$900(Lcom/ss/bytertc/media/VECameraWrapper;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastUIOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$902(Lcom/ss/bytertc/media/VECameraWrapper;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastUIOrientation:I

    .line 2
    .line 3
    return p1
.end method

.method private focusAtPointImpl(FFZZ)I
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, -0x1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    iget v4, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mActWidth:I

    .line 13
    .line 14
    if-eqz v4, :cond_2

    .line 15
    .line 16
    iget v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mActHeight:I

    .line 17
    .line 18
    if-nez v5, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    new-instance v3, Lcom/ss/android/ttvecamera/TEFocusSettings;

    .line 22
    .line 23
    int-to-float v0, v4

    .line 24
    mul-float/2addr v0, p1

    .line 25
    float-to-int v6, v0

    .line 26
    int-to-float p1, v5

    .line 27
    mul-float/2addr p1, p2

    .line 28
    float-to-int v7, p1

    .line 29
    const/high16 v8, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-direct/range {v3 .. v8}, Lcom/ss/android/ttvecamera/TEFocusSettings;-><init>(IIIIF)V

    .line 32
    .line 33
    .line 34
    sget-object p1, Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;->ORIGINAL_FRAME:Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;

    .line 35
    .line 36
    invoke-virtual {v3, p1}, Lcom/ss/android/ttvecamera/TEFocusSettings;->r(Lcom/ss/android/ttvecamera/TEFocusSettings$CoordinatesMode;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3, p3}, Lcom/ss/android/ttvecamera/TEFocusSettings;->s(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, p4}, Lcom/ss/android/ttvecamera/TEFocusSettings;->t(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 46
    .line 47
    invoke-virtual {p0, v3}, Lcom/ss/android/ttvecamera/d;->f(Lcom/ss/android/ttvecamera/TEFocusSettings;)I

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_2
    :goto_0
    return v2
.end method

.method private formatParams()Ljava/lang/String;
    .locals 12
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 2
    .line 3
    iget v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 4
    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 10
    .line 11
    iget v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 18
    .line 19
    iget v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 26
    .line 27
    iget v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->pos:I

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 34
    .line 35
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 42
    .line 43
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camera2:Z

    .line 44
    .line 45
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 50
    .line 51
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->faceAE:Z

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 58
    .line 59
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->wideAngle:Z

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 66
    .line 67
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->antiShake:Z

    .line 68
    .line 69
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 74
    .line 75
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->enable_dynamic_fps:Z

    .line 76
    .line 77
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 78
    .line 79
    .line 80
    move-result-object v10

    .line 81
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 82
    .line 83
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->min_dynamic_fps:I

    .line 84
    .line 85
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v11

    .line 89
    filled-new-array/range {v1 .. v11}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string v0, "[w:%d h:%d fr:%d pos:%d tex:%b cam2:%b faceae:%b wideangle:%b antishake:%b vp_dyfps:%b minfps:%d]"

    .line 94
    .line 95
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method

.method public static getCameraList()[Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "CameInfo"

    .line 2
    .line 3
    invoke-static {}, Lcom/ss/bytertc/media/VECameraWrapper;->DeviceSupportCamera2()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/ss/bytertc/media/VECameraWrapper;->getCameraListByCamera2()[Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0

    .line 14
    :cond_0
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    new-array v2, v1, [Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    move v4, v3

    .line 22
    :goto_0
    if-ge v4, v1, :cond_2

    .line 23
    .line 24
    new-instance v5, Landroid/hardware/Camera$CameraInfo;

    .line 25
    .line 26
    invoke-direct {v5}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-static {v4, v5}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 30
    .line 31
    .line 32
    const-string v6, "back"

    .line 33
    .line 34
    iget v7, v5, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 35
    .line 36
    const/4 v8, 0x1

    .line 37
    if-ne v7, v8, :cond_1

    .line 38
    .line 39
    const-string v6, "front"

    .line 40
    .line 41
    move v8, v3

    .line 42
    goto :goto_1

    .line 43
    :catch_0
    move-exception v1

    .line 44
    goto :goto_2

    .line 45
    :cond_1
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v9, "Camera "

    .line 51
    .line 52
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v9, ", Facing "

    .line 59
    .line 60
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v6, ", Orientation "

    .line 67
    .line 68
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v5, v5, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 72
    .line 73
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    new-instance v6, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;

    .line 81
    .line 82
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    invoke-direct {v6, v7, v5, v8}, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    aput-object v6, v2, v4

    .line 90
    .line 91
    new-instance v6, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v7, " camera name: "

    .line 97
    .line 98
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v5, ", camera id: "

    .line 105
    .line 106
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-static {v0, v5}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    add-int/lit8 v4, v4, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v3, "exception: "

    .line 125
    .line 126
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const/4 v0, 0x0

    .line 144
    return-object v0

    .line 145
    :cond_2
    return-object v2
.end method

.method private static getCameraListByCamera2()[Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;
    .locals 11

    .line 1
    const-string v0, "CameInfo"

    .line 2
    .line 3
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "camera"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/hardware/camera2/CameraManager;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    :try_start_0
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    array-length v4, v3

    .line 21
    new-array v2, v4, [Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    move v5, v4

    .line 25
    :goto_0
    array-length v6, v3

    .line 26
    if-ge v5, v6, :cond_2

    .line 27
    .line 28
    aget-object v6, v3, v5

    .line 29
    .line 30
    invoke-virtual {v1, v6}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 35
    .line 36
    invoke-virtual {v6, v7}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    check-cast v7, Ljava/lang/Integer;

    .line 41
    .line 42
    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 43
    .line 44
    invoke-virtual {v6, v8}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    check-cast v6, Ljava/lang/Integer;

    .line 49
    .line 50
    if-nez v7, :cond_0

    .line 51
    .line 52
    const-string v6, "facing is null"

    .line 53
    .line 54
    invoke-static {v0, v6}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :catch_0
    move-exception v1

    .line 59
    goto :goto_3

    .line 60
    :cond_0
    if-eqz v6, :cond_1

    .line 61
    .line 62
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    const-string v6, "orientation is null"

    .line 68
    .line 69
    invoke-static {v0, v6}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    move v6, v4

    .line 73
    :goto_1
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v8

    .line 77
    new-instance v9, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v10, "Camera "

    .line 83
    .line 84
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v10, ", Facing "

    .line 91
    .line 92
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v10, ", Orientation "

    .line 99
    .line 100
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    new-instance v9, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;

    .line 111
    .line 112
    aget-object v10, v3, v5

    .line 113
    .line 114
    invoke-direct {v9, v10, v6, v8}, Lcom/ss/bytertc/media/VECameraWrapper$CamDevInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    aput-object v9, v2, v5

    .line 118
    .line 119
    new-instance v8, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v9, " camera name: "

    .line 125
    .line 126
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v6, ", camera id: "

    .line 133
    .line 134
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    aget-object v6, v3, v5

    .line 138
    .line 139
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v6, ",Facing: "

    .line 143
    .line 144
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    invoke-static {v0, v6}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .line 156
    .line 157
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_2
    return-object v2

    .line 162
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string v4, "exception: "

    .line 165
    .line 166
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    return-object v2
.end method

.method private getFrameOrientation()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientation:I

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mGravityOrientation:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfo:Landroid/hardware/Camera$CameraInfo;

    .line 14
    .line 15
    iget v1, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    if-ne v1, v2, :cond_1

    .line 19
    .line 20
    rsub-int v0, v0, 0x168

    .line 21
    .line 22
    :cond_1
    iget p0, p0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 23
    .line 24
    add-int/2addr p0, v0

    .line 25
    rem-int/lit16 p0, p0, 0x168

    .line 26
    .line 27
    return p0
.end method

.method public static isMTKandAndroid12()Z
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "mt[0-9]*"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 16
    .line 17
    const/16 v1, 0x1f

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return v0
.end method

.method public static native nativeOnCaptureError(JILjava/lang/String;)V
.end method

.method public static native nativeOnCaptureFormatSelected(JIIIII)V
.end method

.method public static native nativeOnCaptureLog(JILjava/lang/String;Z)V
.end method

.method public static native nativeOnCaptureStarted(J)V
.end method

.method public static native nativeOnCaptureStopped(J)V
.end method

.method public static native nativeOnFrameCaptured(JLcom/bytedance/realx/video/VideoFrame;)V
.end method

.method private queryZoomAbility()Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0}, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;Ljava/util/concurrent/CountDownLatch;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {p0, v1, v2}, Lcom/ss/android/ttvecamera/d;->m(Lcom/ss/android/ttvecamera/TECameraSettings$p;Z)I

    .line 16
    .line 17
    .line 18
    :try_start_0
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 19
    .line 20
    const-wide/16 v2, 0x7d0

    .line 21
    .line 22
    invoke-virtual {v0, v2, v3, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method private safeNativeOnCaptureError(ILjava/lang/String;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/media/VECameraWrapper;->nativeOnCaptureError(JILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method private safeNativeOnCaptureFormatSelected(IIIII)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    move v2, p1

    .line 11
    move v3, p2

    .line 12
    move v4, p3

    .line 13
    move v5, p4

    .line 14
    move v6, p5

    .line 15
    invoke-static/range {v0 .. v6}, Lcom/ss/bytertc/media/VECameraWrapper;->nativeOnCaptureFormatSelected(JIIIII)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    move-object p1, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p1
.end method

.method private safeNativeOnCaptureLog(ILjava/lang/String;Z)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/media/VECameraWrapper;->nativeOnCaptureLog(JILjava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method private safeNativeOnCaptureStarted()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->nativeOnCaptureStarted(J)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v0
.end method

.method private safeNativeOnCaptureStopped()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->nativeOnCaptureStopped(J)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw v0
.end method

.method private safeNativeOnFrameCaptured(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/media/VECameraWrapper;->nativeOnFrameCaptured(JLcom/bytedance/realx/video/VideoFrame;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method private updateCameraCharacteristics()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 2
    .line 3
    iget v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->pos:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/media/VECameraWrapper;->camera1FaceingToCamera2(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 10
    .line 11
    const-string v2, "camera"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/hardware/camera2/CameraManager;

    .line 18
    .line 19
    :try_start_0
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/4 v3, 0x0

    .line 24
    move v4, v3

    .line 25
    :goto_0
    array-length v5, v2

    .line 26
    if-ge v4, v5, :cond_3

    .line 27
    .line 28
    aget-object v5, v2, v4

    .line 29
    .line 30
    invoke-virtual {v1, v5}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    sget-object v6, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 35
    .line 36
    invoke-virtual {v5, v6}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    check-cast v6, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    if-ne v6, v0, :cond_2

    .line 47
    .line 48
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 49
    .line 50
    invoke-virtual {v5, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AF:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 61
    .line 62
    invoke-virtual {v5, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    const/4 v2, 0x1

    .line 73
    if-lez v0, :cond_0

    .line 74
    .line 75
    move v0, v2

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    move v0, v3

    .line 78
    :goto_1
    iput-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsExposurePointSupported:Z

    .line 79
    .line 80
    if-lez v1, :cond_1

    .line 81
    .line 82
    move v3, v2

    .line 83
    :cond_1
    iput-boolean v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsFocusPointSupported:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    return-void

    .line 90
    :catch_0
    move-exception p0

    .line 91
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 92
    .line 93
    .line 94
    return-void
.end method


# virtual methods
.method public camera1FaceingToCamera2(I)I
    .locals 0

    if-nez p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public enableCameraTorch(Z)I
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/ss/android/ttvecamera/d;->v(Z)I

    .line 15
    .line 16
    .line 17
    return v2
.end method

.method public enableGravitySensor(Z)I
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "sensor"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/hardware/SensorManager;

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    const/16 v2, 0x9

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mSensorListener:Landroid/hardware/SensorEventListener;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    const/4 p1, 0x2

    .line 30
    invoke-virtual {v0, v1, v2, p1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    iput-boolean p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 38
    .line 39
    .line 40
    iput-boolean v3, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 41
    .line 42
    :goto_0
    return v3
.end method

.method public getCameraSensorOrientation()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const/4 p0, 0x0

    return p0
.end method

.method public getCameraSensorOrientations(Z)I
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/16 v0, 0x10e

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v0, 0x5a

    .line 7
    .line 8
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_1
    array-length v1, p0

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_1
    if-ge v2, v1, :cond_5

    .line 16
    .line 17
    aget-object v3, p0, v2

    .line 18
    .line 19
    iget v4, v3, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 20
    .line 21
    const/4 v5, 0x1

    .line 22
    if-ne v4, v5, :cond_2

    .line 23
    .line 24
    if-nez p1, :cond_3

    .line 25
    .line 26
    :cond_2
    if-nez v4, :cond_4

    .line 27
    .line 28
    if-nez p1, :cond_4

    .line 29
    .line 30
    :cond_3
    iget p0, v3, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 31
    .line 32
    return p0

    .line 33
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_5
    :goto_2
    return v0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/high16 p0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->queryZoomAbility()Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mMaxZoom:F

    .line 18
    .line 19
    return p0
.end method

.method public getDeviceOrientation()I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mGravityOrientation:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->getUIOrientation()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public getUIOrientation()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastUIOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public isCameraExposurePointSupported()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsExposurePointSupported:Z

    .line 13
    .line 14
    return p0
.end method

.method public isCameraFocusPointSupported()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-boolean p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsFocusPointSupported:Z

    .line 13
    .line 14
    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/d;->j()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->queryZoomAbility()Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-boolean p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mSupportZoom:Z

    .line 17
    .line 18
    return p0
.end method

.method public setCameraZoomRatio(F)I
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    return p0

    .line 12
    :cond_0
    new-instance v0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, p0, v1}, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;Ljava/util/concurrent/CountDownLatch;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/ss/android/ttvecamera/d;->s(FLcom/ss/android/ttvecamera/TECameraSettings$p;)I

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public setExposureCompensation(F)I
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const/high16 v0, -0x40800000    # -1.0f

    .line 2
    .line 3
    cmpg-float v0, p1, v0

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-ltz v0, :cond_5

    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    cmpl-float v0, p1, v0

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x2

    .line 22
    if-eq v0, v2, :cond_1

    .line 23
    .line 24
    return v1

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/d;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/d;->g()Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x0

    .line 41
    cmpg-float v2, p1, v1

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    if-gez v2, :cond_3

    .line 45
    .line 46
    iget v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->c:I

    .line 47
    .line 48
    int-to-float v2, v2

    .line 49
    mul-float/2addr v2, p1

    .line 50
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    neg-float v2, v2

    .line 55
    float-to-double v4, v2

    .line 56
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    double-to-int v2, v4

    .line 61
    goto :goto_0

    .line 62
    :cond_3
    move v2, v3

    .line 63
    :goto_0
    cmpl-float v1, p1, v1

    .line 64
    .line 65
    if-lez v1, :cond_4

    .line 66
    .line 67
    iget v0, v0, Lcom/ss/android/ttvecamera/TECameraSettings$d;->a:I

    .line 68
    .line 69
    int-to-float v0, v0

    .line 70
    mul-float/2addr p1, v0

    .line 71
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    float-to-double v0, p1

    .line 76
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    double-to-int v2, v0

    .line 81
    :cond_4
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 82
    .line 83
    invoke-virtual {p0, v2}, Lcom/ss/android/ttvecamera/d;->q(I)V

    .line 84
    .line 85
    .line 86
    return v3

    .line 87
    :cond_5
    :goto_1
    return v1
.end method

.method public setExposurePoint(FF)I
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsExposurePointSupported:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ss/bytertc/media/VECameraWrapper;->focusAtPointImpl(FFZZ)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 23
    return p0
.end method

.method public setFocusPoint(FF)I
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mIsFocusPointSupported:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x1

    .line 16
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/ss/bytertc/media/VECameraWrapper;->focusAtPointImpl(FFZZ)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 22
    return p0
.end method

.method public startCapture(Lcom/ss/bytertc/media/VECameraWrapper$CamParam;)V
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/media/VECameraWrapper;->isMTKandAndroid12()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iput-boolean v1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 26
    .line 27
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    const-string v0, "android.permission.CAMERA"

    .line 34
    .line 35
    invoke-static {p1, v0}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    const/16 p1, -0x198

    .line 42
    .line 43
    const-string v0, "camera disabled"

    .line 44
    .line 45
    invoke-direct {p0, p1, v0}, Lcom/ss/bytertc/media/VECameraWrapper;->safeNativeOnCaptureError(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v3, "startCapture - input params "

    .line 54
    .line 55
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->formatParams()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const/16 v3, 0x8

    .line 70
    .line 71
    const-string v4, "toSvr"

    .line 72
    .line 73
    invoke-virtual {p1, v3, v4, v0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide v5

    .line 80
    iput-wide v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientationTS:J

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->updateUIOrientation()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastUIOrientation:I

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->getDeviceOrientation()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientation:I

    .line 93
    .line 94
    new-instance p1, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v0, " startCapture mLastUIOrientation: "

    .line 97
    .line 98
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iget v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastUIOrientation:I

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v0, ", mLastDeviceOrientation: "

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLastDeviceOrientation:I

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    const-string v0, "CameInfo"

    .line 121
    .line 122
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v5, "mParam width: "

    .line 128
    .line 129
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 133
    .line 134
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 135
    .line 136
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v5, ", height: "

    .line 140
    .line 141
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 145
    .line 146
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 147
    .line 148
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v5, ", fps: "

    .line 152
    .line 153
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 157
    .line 158
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 159
    .line 160
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v5, ", camid: "

    .line 164
    .line 165
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 169
    .line 170
    iget-object v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camid:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v5, ", useTexture: "

    .line 176
    .line 177
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 181
    .line 182
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 183
    .line 184
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v5, ", pos: "

    .line 188
    .line 189
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 193
    .line 194
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->pos:I

    .line 195
    .line 196
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v5, ", camera2: "

    .line 200
    .line 201
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 205
    .line 206
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camera2:Z

    .line 207
    .line 208
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v5, ", faceAE: "

    .line 212
    .line 213
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 217
    .line 218
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->faceAE:Z

    .line 219
    .line 220
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v5, ", wideAngle: "

    .line 224
    .line 225
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 229
    .line 230
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->wideAngle:Z

    .line 231
    .line 232
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v5, ", antiShake: "

    .line 236
    .line 237
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 241
    .line 242
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->antiShake:Z

    .line 243
    .line 244
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string v5, ", enable_dynamic_fps: "

    .line 248
    .line 249
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 253
    .line 254
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->enable_dynamic_fps:Z

    .line 255
    .line 256
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string v5, ", min_dynamic_fps: "

    .line 260
    .line 261
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 265
    .line 266
    iget v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->min_dynamic_fps:I

    .line 267
    .line 268
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    new-instance p1, Landroid/hardware/Camera$CameraInfo;

    .line 279
    .line 280
    invoke-direct {p1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 281
    .line 282
    .line 283
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfo:Landroid/hardware/Camera$CameraInfo;

    .line 284
    .line 285
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    new-array v5, p1, [Landroid/hardware/Camera$CameraInfo;

    .line 290
    .line 291
    iput-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 292
    .line 293
    move v5, v1

    .line 294
    :goto_0
    const-string v6, ", orientation: "

    .line 295
    .line 296
    if-ge v5, p1, :cond_4

    .line 297
    .line 298
    :try_start_0
    iget-object v7, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 299
    .line 300
    new-instance v8, Landroid/hardware/Camera$CameraInfo;

    .line 301
    .line 302
    invoke-direct {v8}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 303
    .line 304
    .line 305
    aput-object v8, v7, v5

    .line 306
    .line 307
    iget-object v7, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 308
    .line 309
    aget-object v7, v7, v5

    .line 310
    .line 311
    invoke-static {v5, v7}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 312
    .line 313
    .line 314
    new-instance v7, Ljava/lang/StringBuilder;

    .line 315
    .line 316
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 317
    .line 318
    .line 319
    const-string v8, "CamInfoList "

    .line 320
    .line 321
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    const-string v8, " = facing: "

    .line 328
    .line 329
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    iget-object v8, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 333
    .line 334
    aget-object v8, v8, v5

    .line 335
    .line 336
    iget v8, v8, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 337
    .line 338
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    iget-object v8, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 345
    .line 346
    aget-object v8, v8, v5

    .line 347
    .line 348
    iget v8, v8, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 349
    .line 350
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v7

    .line 357
    invoke-static {v0, v7}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    iget-object v7, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfoList:[Landroid/hardware/Camera$CameraInfo;

    .line 361
    .line 362
    aget-object v7, v7, v5

    .line 363
    .line 364
    iget v8, v7, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 365
    .line 366
    iget-object v9, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 367
    .line 368
    iget v9, v9, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->pos:I

    .line 369
    .line 370
    if-ne v8, v9, :cond_3

    .line 371
    .line 372
    iput-object v7, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfo:Landroid/hardware/Camera$CameraInfo;

    .line 373
    .line 374
    new-instance v7, Ljava/lang/StringBuilder;

    .line 375
    .line 376
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 377
    .line 378
    .line 379
    const-string v8, "update mCamInfo is "

    .line 380
    .line 381
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v7

    .line 391
    invoke-static {v0, v7}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    .line 393
    .line 394
    goto :goto_1

    .line 395
    :catch_0
    move-exception v6

    .line 396
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 400
    .line 401
    goto :goto_0

    .line 402
    :cond_4
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 403
    .line 404
    const-string v5, "current select mCamInfo facing: "

    .line 405
    .line 406
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfo:Landroid/hardware/Camera$CameraInfo;

    .line 410
    .line 411
    iget v5, v5, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 412
    .line 413
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamInfo:Landroid/hardware/Camera$CameraInfo;

    .line 420
    .line 421
    iget v5, v5, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 422
    .line 423
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->updateCameraCharacteristics()V

    .line 434
    .line 435
    .line 436
    new-instance p1, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 437
    .line 438
    invoke-direct {p1, p0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 439
    .line 440
    .line 441
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 442
    .line 443
    new-instance p1, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;

    .line 444
    .line 445
    invoke-direct {p1, p0}, Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 446
    .line 447
    .line 448
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mEventObserver:Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;

    .line 449
    .line 450
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 451
    .line 452
    invoke-virtual {p1}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->startup()V

    .line 453
    .line 454
    .line 455
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 456
    .line 457
    iget-boolean v5, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->useTexture:Z

    .line 458
    .line 459
    if-nez v5, :cond_5

    .line 460
    .line 461
    iput-boolean v1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camera2:Z

    .line 462
    .line 463
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 464
    .line 465
    const-string v5, "current select mParam.camera2: "

    .line 466
    .line 467
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 471
    .line 472
    iget-boolean v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camera2:Z

    .line 473
    .line 474
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object p1

    .line 481
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 485
    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    .line 487
    .line 488
    const-string v5, "startCapture - actual params "

    .line 489
    .line 490
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 491
    .line 492
    .line 493
    invoke-direct {p0}, Lcom/ss/bytertc/media/VECameraWrapper;->formatParams()Ljava/lang/String;

    .line 494
    .line 495
    .line 496
    move-result-object v5

    .line 497
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    .line 499
    .line 500
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v0

    .line 504
    invoke-virtual {p1, v3, v4, v0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 508
    .line 509
    iget-boolean p1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camera2:Z

    .line 510
    .line 511
    if-eqz p1, :cond_6

    .line 512
    .line 513
    const/4 p1, 0x2

    .line 514
    goto :goto_2

    .line 515
    :cond_6
    move p1, v2

    .line 516
    :goto_2
    new-instance v0, Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 517
    .line 518
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 519
    .line 520
    iget-object v6, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 521
    .line 522
    iget v7, v6, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->width:I

    .line 523
    .line 524
    iget v6, v6, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->height:I

    .line 525
    .line 526
    invoke-direct {v0, v5, p1, v7, v6}, Lcom/ss/android/ttvecamera/TECameraSettings;-><init>(Landroid/content/Context;III)V

    .line 527
    .line 528
    .line 529
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 530
    .line 531
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 532
    .line 533
    iget v5, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->pos:I

    .line 534
    .line 535
    iput v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 536
    .line 537
    const/16 v5, 0x1e

    .line 538
    .line 539
    iput v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 540
    .line 541
    iput-boolean v2, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->l0:Z

    .line 542
    .line 543
    iget v0, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->min_dynamic_fps:I

    .line 544
    .line 545
    if-gtz v0, :cond_7

    .line 546
    .line 547
    const/4 v0, 0x7

    .line 548
    :cond_7
    iget-boolean v5, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->enable_dynamic_fps:Z

    .line 549
    .line 550
    if-eqz v5, :cond_8

    .line 551
    .line 552
    iget p1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 553
    .line 554
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 555
    .line 556
    .line 557
    move-result p1

    .line 558
    goto :goto_3

    .line 559
    :cond_8
    iget p1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 560
    .line 561
    :goto_3
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 562
    .line 563
    iget-object v5, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 564
    .line 565
    iget-object v5, v5, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->camid:Ljava/lang/String;

    .line 566
    .line 567
    iput-object v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 568
    .line 569
    new-instance v5, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 570
    .line 571
    iget-object v6, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 572
    .line 573
    iget v6, v6, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 574
    .line 575
    invoke-direct {v5, p1, v6}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 576
    .line 577
    .line 578
    iput-object v5, v0, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 579
    .line 580
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 581
    .line 582
    new-instance v5, Ljava/lang/StringBuilder;

    .line 583
    .line 584
    const-string v6, "enable_dynamic_fps:"

    .line 585
    .line 586
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 587
    .line 588
    .line 589
    iget-object v6, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 590
    .line 591
    iget-boolean v6, v6, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->enable_dynamic_fps:Z

    .line 592
    .line 593
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 594
    .line 595
    .line 596
    const-string v6, " fpsRange min:"

    .line 597
    .line 598
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    .line 600
    .line 601
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    const-string p1, " max:"

    .line 605
    .line 606
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 610
    .line 611
    iget p1, p1, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->fps:I

    .line 612
    .line 613
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 614
    .line 615
    .line 616
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object p1

    .line 620
    invoke-virtual {v0, v3, v4, p1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 621
    .line 622
    .line 623
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 624
    .line 625
    iput-boolean v1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->j:Z

    .line 626
    .line 627
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mParam:Lcom/ss/bytertc/media/VECameraWrapper$CamParam;

    .line 628
    .line 629
    iget-boolean v0, v0, Lcom/ss/bytertc/media/VECameraWrapper$CamParam;->faceAE:Z

    .line 630
    .line 631
    if-eqz v0, :cond_9

    .line 632
    .line 633
    iget-object p1, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 634
    .line 635
    const-string v0, "useCameraFaceDetect"

    .line 636
    .line 637
    const/4 v1, 0x3

    .line 638
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 639
    .line 640
    .line 641
    :cond_9
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 642
    .line 643
    iput-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 644
    .line 645
    iput-boolean v2, p1, Lcom/ss/android/ttvecamera/TECameraSettings;->Q:Z

    .line 646
    .line 647
    new-instance p1, Lcom/ss/android/ttvecamera/d;

    .line 648
    .line 649
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mEventObserver:Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;

    .line 650
    .line 651
    const/4 v1, 0x0

    .line 652
    invoke-direct {p1, v0, v1}, Lcom/ss/android/ttvecamera/d;-><init>(Lcom/ss/android/ttvecamera/d$b;Lcom/ss/android/ttvecamera/d$d;)V

    .line 653
    .line 654
    .line 655
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 656
    .line 657
    const/16 p1, 0x1f

    .line 658
    .line 659
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 660
    .line 661
    invoke-static {p1, v0}, Lcom/ss/android/ttvecamera/d;->n(BLcom/ss/android/ttvecamera/g$b;)V

    .line 662
    .line 663
    .line 664
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 665
    .line 666
    new-instance v0, Lcom/ss/bytertc/media/VECameraWrapper$1;

    .line 667
    .line 668
    invoke-direct {v0, p0}, Lcom/ss/bytertc/media/VECameraWrapper$1;-><init>(Lcom/ss/bytertc/media/VECameraWrapper;)V

    .line 669
    .line 670
    .line 671
    invoke-virtual {p1, v0}, Lcom/ss/android/ttvecamera/d;->o(Lcom/ss/android/ttvecamera/d$e;)V

    .line 672
    .line 673
    .line 674
    iget-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 675
    .line 676
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 677
    .line 678
    invoke-virtual {p1, p0}, Lcom/ss/android/ttvecamera/d;->b(Lcom/ss/android/ttvecamera/TECameraSettings;)I

    .line 679
    .line 680
    .line 681
    return-void
.end method

.method public stopCapture()V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 2
    .line 3
    const-string v1, "stopCapture..."

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    const-string v3, "toSvr"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v3, v1}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 21
    .line 22
    const-string v0, "stopCapture have stopped."

    .line 23
    .line 24
    invoke-virtual {p0, v2, v3, v0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-boolean v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mUseGravitySensor:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    const-string v1, "sensor"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/hardware/SensorManager;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mSensorListener:Landroid/hardware/SensorEventListener;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/d;->p()I

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/d;->t()I

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/ss/android/ttvecamera/d;->d()I

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;->shutdown()V

    .line 71
    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    iput-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mFrameListener:Lcom/ss/bytertc/media/VECameraWrapper$FrameListener;

    .line 75
    .line 76
    :cond_3
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamState:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 83
    .line 84
    const-string v0, "stopCapture done."

    .line 85
    .line 86
    invoke-virtual {p0, v2, v3, v0}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public uninitVideoCapture()I
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mVESettings:Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 7
    .line 8
    const/16 v0, 0x1f

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/ss/android/ttvecamera/d;->n(BLcom/ss/android/ttvecamera/g$b;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCameraLock:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iput-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mCamera:Lcom/ss/android/ttvecamera/d;

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0

    .line 23
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mEventObserver:Lcom/ss/bytertc/media/VECameraWrapper$EventObserver;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mLogger:Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;

    .line 26
    .line 27
    const-string v1, "toSvr"

    .line 28
    .line 29
    const-string v2, "uninitVideoCapture done."

    .line 30
    .line 31
    const/16 v3, 0x8

    .line 32
    .line 33
    invoke-virtual {v0, v3, v1, v2}, Lcom/ss/bytertc/media/VECameraWrapper$LogCallback;->Log(BLjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    monitor-enter p0

    .line 37
    const-wide/16 v0, 0x0

    .line 38
    .line 39
    :try_start_1
    iput-wide v0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mNativeObj:J

    .line 40
    .line 41
    monitor-exit p0

    .line 42
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :catchall_1
    move-exception v0

    .line 45
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 46
    throw v0
.end method

.method public updateUIOrientation()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "window"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/WindowManager;

    .line 10
    .line 11
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/4 v0, 0x1

    .line 20
    if-eq p0, v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    if-eq p0, v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    if-eq p0, v0, :cond_0

    .line 27
    .line 28
    sget-object p0, Lcom/ss/bytertc/engine/UIDeviceOrientation;->Portrait:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/UIDeviceOrientation;->LandscapeLeft:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/UIDeviceOrientation;->PortraitUpsidedown:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/UIDeviceOrientation;->LandscapeRight:Lcom/ss/bytertc/engine/UIDeviceOrientation;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/UIDeviceOrientation;->value()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

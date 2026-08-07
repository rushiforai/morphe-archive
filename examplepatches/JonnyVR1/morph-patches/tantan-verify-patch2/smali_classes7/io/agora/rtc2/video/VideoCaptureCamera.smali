.class public abstract Lio/agora/rtc2/video/VideoCaptureCamera;
.super Lio/agora/rtc2/video/VideoCapture;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/video/IVideoCaptureCamera;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;,
        Lio/agora/rtc2/video/VideoCaptureCamera$CameraAvailabilityCallback;
    }
.end annotation


# static fields
.field static final ANDROID_CAMERA_SKIP_CONTROL_AE:I = 0x1

.field static final ANDROID_CAMERA_SKIP_CONTROL_AF:I = 0x2

.field static final ANDROID_CAMERA_SKIP_CONTROL_DEFAULT:I = 0x0

.field protected static final CAMERA_TEMPLATE_PREVIEW:I = 0x0

.field protected static final CAMERA_TEMPLATE_RECORD:I = 0x1

.field protected static final CAMERA_TORCH_DEFAULT:I = 0x0

.field protected static final CAMERA_TORCH_DISENABLE:I = -0x1

.field protected static final CAMERA_TORCH_ENABLE:I = 0x1

.field protected static final CONTROL_VIDEO_FOCUS_MODE_AUTO:I = 0x1

.field protected static final CONTROL_VIDEO_FOCUS_MODE_NONE:I = 0x0

.field protected static final CONTROL_VIDEO_FOCUS_MODE_PICTURE:I = 0x3

.field protected static final CONTROL_VIDEO_FOCUS_MODE_VIDEO:I = 0x2

.field protected static final CONTROL_VIDEO_STABILIZATION_MODE_OFF:I = 0x0

.field protected static final CONTROL_VIDEO_STABILIZATION_MODE_ON:I = 0x1

.field protected static final FOCAL_LENGTH_STEP:I = 0x6

.field protected static final FOCAL_LENGTH_TYPE_SUPPORTED_OF_LOGICAL:I = 0x1

.field protected static final FOCAL_LENGTH_TYPE_SUPPORTED_OF_PHYSICAL:I = 0x2

.field protected static final FOCAL_LENGTH_TYPE_SUPPORTED_OF_ZOOM:I = 0x3

.field protected static final FOCAL_LENGTH_ULTRA_WIDE_ANGLE_UPPER_LIMIT:F = 3.5f

.field protected static final FOCAL_LENGTH_WIDE_ANGLE_UPPER_LIMIT:F = 2.4f

.field protected static final MAX_CAMERA_TIME_MS:I = 0x7d0

.field static final REFOCUS_BUGGY_DEVICE_LIST:[Ljava/lang/String;

.field private static final SIZE_HEIGHT_1440_BUGGY_DEVICE_LIST:[Ljava/lang/String;

.field private static final SIZE_HEIGHT_GT_720_BUGGY_DEVICE_LIST:[Ljava/lang/String;

.field protected static final SIZE_HEIGHT_OF_2K:I = 0x5a0

.field protected static final SIZE_WIDTH_OF_2K:I = 0xa00

.field private static final TAG:Ljava/lang/String; = "VideoCaptureCamera"

.field private static cameraSkipCapturHeight:I = 0x0

.field private static cameraSkipCaptureWidth:I = 0x0

.field protected static mEnableRefocus:Z = true


# instance fields
.field isMirror:Z

.field protected lastFocusAreaRect:Landroid/graphics/Rect;

.field protected mAutoFaceDetectFocusStarted:Z

.field protected mCamerEdgeEnhanceMode:I

.field protected mCameraAntiBandingMode:I

.field protected final mCameraAutoFaceFocus:Z

.field protected final mCameraAutoWhiteBalance:Z

.field protected mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field protected mCameraExposureCompensation:I

.field protected mCameraExposurePositions:[F

.field protected mCameraExtraSurface:Z

.field protected final mCameraFocusMode:I

.field protected mCameraFocusPositions:[F

.field protected final mCameraFpsRangeEnable:Z

.field protected mCameraNoiseReduction:I

.field protected mCameraNoiseReductionMode:I

.field protected final mCameraTemplateType:I

.field protected mCameraVideoStabilityMode:I

.field protected mCameraZoomFactor:F

.field protected final mCaptureToTexture:Z

.field protected mEnableAutoFaceFocus:Z

.field protected mEnableFaceDetection:Z

.field protected final mEnableTextureCopy:Z

.field protected final mFocalLengthType:I

.field protected mId:I

.field protected mIsAntiBandingStarted:Z

.field protected mIsCameraTorchStarted:Z

.field protected mIsEdgeEnhanceStarted:Z

.field protected mIsExposureCompensationStarted:Z

.field protected mIsFaceDetectionStarted:Z

.field protected mIsNoiseReducationStarted:Z

.field protected mIsStabilityStarted:Z

.field protected mIsmCameraExposureStarted:Z

.field protected mIsmCameraFocusStarted:Z

.field protected mIsmCameraZoomStarted:Z

.field protected mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/util/List<",
            "Lio/agora/base/FaceDetectionInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field mRenderMode:I

.field mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

.field protected final mSkipControl:I

.field protected mTorchMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "Lenovo K520"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->SIZE_HEIGHT_GT_720_BUGGY_DEVICE_LIST:[Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "PDBM00"

    .line 10
    .line 11
    filled-new-array {v0}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->SIZE_HEIGHT_1440_BUGGY_DEVICE_LIST:[Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "noh-al00"

    .line 18
    .line 19
    filled-new-array {v0}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->REFOCUS_BUGGY_DEVICE_LIST:[Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(IJZZIZILio/agora/base/internal/video/EglBase$Context;IIIZZZZIIZ)V
    .locals 1

    .line 1
    invoke-direct {p0, p2, p3, p9, p6}, Lio/agora/rtc2/video/VideoCapture;-><init>(JLio/agora/base/internal/video/EglBase$Context;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableAutoFaceFocus:Z

    .line 6
    .line 7
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableFaceDetection:Z

    .line 8
    .line 9
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsFaceDetectionStarted:Z

    .line 10
    .line 11
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mTorchMode:I

    .line 12
    .line 13
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraExposureStarted:Z

    .line 14
    .line 15
    const/4 p3, 0x2

    .line 16
    new-array v0, p3, [F

    .line 17
    .line 18
    fill-array-data v0, :array_0

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraExposurePositions:[F

    .line 22
    .line 23
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraFocusStarted:Z

    .line 24
    .line 25
    new-array p3, p3, [F

    .line 26
    .line 27
    fill-array-data p3, :array_1

    .line 28
    .line 29
    .line 30
    iput-object p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraFocusPositions:[F

    .line 31
    .line 32
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraZoomStarted:Z

    .line 33
    .line 34
    const/high16 p3, -0x40800000    # -1.0f

    .line 35
    .line 36
    iput p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraZoomFactor:F

    .line 37
    .line 38
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraExposureCompensation:I

    .line 39
    .line 40
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraNoiseReductionMode:I

    .line 41
    .line 42
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAntiBandingMode:I

    .line 43
    .line 44
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraVideoStabilityMode:I

    .line 45
    .line 46
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCamerEdgeEnhanceMode:I

    .line 47
    .line 48
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsExposureCompensationStarted:Z

    .line 49
    .line 50
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsAntiBandingStarted:Z

    .line 51
    .line 52
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsEdgeEnhanceStarted:Z

    .line 53
    .line 54
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsStabilityStarted:Z

    .line 55
    .line 56
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsNoiseReducationStarted:Z

    .line 57
    .line 58
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mAutoFaceDetectFocusStarted:Z

    .line 59
    .line 60
    new-instance p3, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 61
    .line 62
    invoke-direct {p3}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 66
    .line 67
    new-instance p3, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    invoke-direct {p3, p0, v0}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;-><init>(Lio/agora/rtc2/video/VideoCaptureCamera;Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iput-object p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 74
    .line 75
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->isMirror:Z

    .line 76
    .line 77
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 78
    .line 79
    iput-boolean p7, p0, Lio/agora/rtc2/video/VideoCapture;->mPQFirst:Z

    .line 80
    .line 81
    move/from16 p1, p17

    .line 82
    .line 83
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mFocalLengthType:I

    .line 84
    .line 85
    iput p8, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mSkipControl:I

    .line 86
    .line 87
    iput p10, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraTemplateType:I

    .line 88
    .line 89
    move p1, p14

    .line 90
    iput-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraExtraSurface:Z

    .line 91
    .line 92
    iput p11, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraNoiseReduction:I

    .line 93
    .line 94
    iput p12, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraFocusMode:I

    .line 95
    .line 96
    iput-boolean p13, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAutoFaceFocus:Z

    .line 97
    .line 98
    move/from16 p1, p15

    .line 99
    .line 100
    iput-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAutoWhiteBalance:Z

    .line 101
    .line 102
    move/from16 p1, p16

    .line 103
    .line 104
    iput-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraFpsRangeEnable:Z

    .line 105
    .line 106
    const/4 p1, 0x1

    .line 107
    if-eqz p4, :cond_0

    .line 108
    .line 109
    iget-object p3, p0, Lio/agora/rtc2/video/VideoCapture;->mSurfaceTextureHelper:Lio/agora/base/internal/video/ISurfaceTextureHelper;

    .line 110
    .line 111
    if-eqz p3, :cond_0

    .line 112
    .line 113
    move p3, p1

    .line 114
    goto :goto_0

    .line 115
    :cond_0
    move p3, p2

    .line 116
    :goto_0
    iput-boolean p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCaptureToTexture:Z

    .line 117
    .line 118
    if-eqz p3, :cond_1

    .line 119
    .line 120
    if-eqz p5, :cond_1

    .line 121
    .line 122
    move p2, p1

    .line 123
    :cond_1
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableTextureCopy:Z

    .line 124
    .line 125
    sput-boolean p19, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableRefocus:Z

    .line 126
    .line 127
    sget-object p1, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 128
    .line 129
    new-instance p4, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string p5, "VideoCaptureCamera info ,mId:"

    .line 132
    .line 133
    invoke-direct {p4, p5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget p5, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mId:I

    .line 137
    .line 138
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string p5, ",mPQFirst:"

    .line 142
    .line 143
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-boolean p0, p0, Lio/agora/rtc2/video/VideoCapture;->mPQFirst:Z

    .line 147
    .line 148
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string p0, ",mCaptureToTexture:"

    .line 152
    .line 153
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string p0, ",mCaptureTextureBufferCount:"

    .line 160
    .line 161
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string p0, ",mEnableTextureCopy:"

    .line 168
    .line 169
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string p0, " ,autoFaceDetect:"

    .line 176
    .line 177
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p4, p13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data

    :array_1
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static findBestFrameRateRange(Ljava/util/List;IZ)Lio/agora/rtc2/video/VideoCapture$FramerateRange;
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;",
            ">;IZ)",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "findBestFrameRateRange "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    invoke-static {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera;->findBestFrameRateRangePreferPQ(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-static {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera;->findBestFrameRateRangePreferFPS(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_0
    if-nez v1, :cond_3

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "Failed to find match fps in "

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    if-eqz p2, :cond_2

    .line 53
    .line 54
    const-string p2, "PQ"

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    const-string p2, " FPS"

    .line 58
    .line 59
    :goto_1
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p2, " first mode, try closest."

    .line 63
    .line 64
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {v0, p2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera;->getClosestFramerateRange(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_3
    return-object v1
.end method

.method private static findBestFrameRateRangePreferFPS(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;",
            ">;I)",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;"
        }
    .end annotation

    .line 1
    new-instance v0, Lio/agora/rtc2/video/VideoCaptureCamera$2;

    .line 2
    .line 3
    invoke-direct {v0}, Lio/agora/rtc2/video/VideoCaptureCamera$2;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "sorted fps Ranges List order by min first:"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    .line 47
    .line 48
    iget v1, v0, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->min:I

    .line 49
    .line 50
    if-lt v1, p1, :cond_0

    .line 51
    .line 52
    sget-object p0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "set fps : "

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v2, " to camera in fps first mode, request:"

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-object v0

    .line 84
    :cond_1
    const/4 p0, 0x0

    .line 85
    return-object p0
.end method

.method private static findBestFrameRateRangePreferPQ(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;",
            ">;I)",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;"
        }
    .end annotation

    .line 1
    new-instance v0, Lio/agora/rtc2/video/VideoCaptureCamera$3;

    .line 2
    .line 3
    invoke-direct {v0}, Lio/agora/rtc2/video/VideoCaptureCamera$3;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "sorted fps Ranges List order by max first:"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    .line 47
    .line 48
    iget v1, v0, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->max:I

    .line 49
    .line 50
    if-lt v1, p1, :cond_0

    .line 51
    .line 52
    sget-object p0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "set fps : "

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Lio/agora/rtc2/video/VideoCapture$FramerateRange;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v2, " to camera in PQ first mode, request:"

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p0, p1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-object v0

    .line 84
    :cond_1
    const/4 p0, 0x0

    .line 85
    return-object p0
.end method

.method public static getClosestFramerateRange(Ljava/util/List;I)Lio/agora/rtc2/video/VideoCapture$FramerateRange;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;",
            ">;I)",
            "Lio/agora/rtc2/video/VideoCapture$FramerateRange;"
        }
    .end annotation

    .line 1
    new-instance v0, Lio/agora/rtc2/video/VideoCaptureCamera$1;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera$1;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lio/agora/rtc2/video/VideoCapture$FramerateRange;

    .line 11
    .line 12
    return-object p0
.end method

.method public static setCameraSkipCapturHeight(I)V
    .locals 0

    .line 1
    sput p0, Lio/agora/rtc2/video/VideoCaptureCamera;->cameraSkipCapturHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public static setCameraSkipCaptureWidth(I)V
    .locals 0

    .line 1
    sput p0, Lio/agora/rtc2/video/VideoCaptureCamera;->cameraSkipCaptureWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public static shouldExcludeSize(II)Z
    .locals 7

    .line 1
    sget v0, Lio/agora/rtc2/video/VideoCaptureCamera;->cameraSkipCaptureWidth:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    sget-object p1, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "camera capture skip width: "

    .line 11
    .line 12
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    sget v0, Lio/agora/rtc2/video/VideoCaptureCamera;->cameraSkipCapturHeight:I

    .line 27
    .line 28
    if-ne p1, v0, :cond_1

    .line 29
    .line 30
    sget-object p1, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "camera capture skip height: "

    .line 35
    .line 36
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return v1

    .line 50
    :cond_1
    const/16 v0, 0x2d0

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    if-le p1, v0, :cond_3

    .line 54
    .line 55
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->SIZE_HEIGHT_GT_720_BUGGY_DEVICE_LIST:[Ljava/lang/String;

    .line 56
    .line 57
    array-length v3, v0

    .line 58
    move v4, v2

    .line 59
    :goto_0
    if-ge v4, v3, :cond_3

    .line 60
    .line 61
    aget-object v5, v0, v4

    .line 62
    .line 63
    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_2

    .line 70
    .line 71
    return v1

    .line 72
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    const/16 v0, 0xa00

    .line 76
    .line 77
    if-gt p0, v0, :cond_4

    .line 78
    .line 79
    const/16 v0, 0x5a0

    .line 80
    .line 81
    if-gt p1, v0, :cond_4

    .line 82
    .line 83
    mul-int/2addr p0, p1

    .line 84
    const p1, 0x384000

    .line 85
    .line 86
    .line 87
    if-le p0, p1, :cond_6

    .line 88
    .line 89
    :cond_4
    sget-object p0, Lio/agora/rtc2/video/VideoCaptureCamera;->SIZE_HEIGHT_1440_BUGGY_DEVICE_LIST:[Ljava/lang/String;

    .line 90
    .line 91
    array-length p1, p0

    .line 92
    move v0, v2

    .line 93
    :goto_1
    if-ge v0, p1, :cond_6

    .line 94
    .line 95
    aget-object v3, p0, v0

    .line 96
    .line 97
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_5

    .line 104
    .line 105
    return v1

    .line 106
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_6
    return v2
.end method

.method public static shouldSkipRefocus()Z
    .locals 6

    .line 1
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->REFOCUS_BUGGY_DEVICE_LIST:[Ljava/lang/String;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    const/4 v3, 0x1

    .line 6
    if-ge v2, v1, :cond_1

    .line 7
    .line 8
    aget-object v4, v0, v2

    .line 9
    .line 10
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    invoke-virtual {v5, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    return v3

    .line 23
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget-boolean v0, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableRefocus:Z

    .line 27
    .line 28
    xor-int/2addr v0, v3

    .line 29
    return v0
.end method


# virtual methods
.method public attachPerFrameMetaInfos(Lio/agora/base/VideoFrame;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/util/ArrayList;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lio/agora/base/FaceDetectionInfo;

    .line 35
    .line 36
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getMetaInfo()Lio/agora/base/VideoFrameMetaInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-class v2, Lio/agora/base/FaceDetectionInfo;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Lio/agora/base/VideoFrameMetaInfo;->getCustomMetaInfo(Ljava/lang/String;)Landroid/util/SparseArray;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0}, Lio/agora/base/FaceDetectionInfo;->getId()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    :goto_1
    return-void
.end method

.method public getPerFrameMetaInfos()Lio/agora/base/VideoFrameMetaInfo;
    .locals 4

    .line 1
    new-instance v0, Lio/agora/base/VideoFrameMetaInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lio/agora/base/VideoFrameMetaInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/util/ArrayList;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lio/agora/base/FaceDetectionInfo;

    .line 40
    .line 41
    const-class v2, Lio/agora/base/FaceDetectionInfo;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2}, Lio/agora/base/VideoFrameMetaInfo;->getCustomMetaInfo(Ljava/lang/String;)Landroid/util/SparseArray;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v1}, Lio/agora/base/FaceDetectionInfo;->getId()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    :goto_1
    return-object v0
.end method

.method public isEnableAutoFaceFocus()Z
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableAutoFaceFocus:Z

    .line 2
    .line 3
    return p0
.end method

.method public isEnableFaceDetection()Z
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mEnableFaceDetection:Z

    .line 2
    .line 3
    return p0
.end method

.method public isFaceDetectionStarted()Z
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsFaceDetectionStarted:Z

    .line 2
    .line 3
    return p0
.end method

.method public native nativeNotifyCameraExposureAreaChanged(JIIII)V
.end method

.method public native nativeNotifyCameraFocusAreaChanged(JIIII)V
.end method

.method public notifyCameraExposureAreaChanged(Landroid/graphics/Rect;)V
    .locals 7

    .line 1
    iget-wide v1, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCapture;->mCaptureFormat:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 10
    .line 11
    iget v3, v0, Lio/agora/rtc2/video/VideoCaptureFormat;->mWidth:I

    .line 12
    .line 13
    iget v4, v0, Lio/agora/rtc2/video/VideoCaptureFormat;->mHeight:I

    .line 14
    .line 15
    iget v5, p1, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    iget v6, p1, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    move-object v0, p0

    .line 20
    invoke-virtual/range {v0 .. v6}, Lio/agora/rtc2/video/VideoCaptureCamera;->nativeNotifyCameraExposureAreaChanged(JIIII)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public notifyCameraFocusAreaChanged(Landroid/graphics/Rect;)V
    .locals 7

    .line 1
    iget-wide v1, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    iget v5, p1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    iget v6, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    invoke-virtual/range {v0 .. v6}, Lio/agora/rtc2/video/VideoCaptureCamera;->nativeNotifyCameraFocusAreaChanged(JIIII)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public notifyFaceDetection(IILjava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/ArrayList<",
            "Landroid/graphics/RectF;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-wide v0, p0, Lio/agora/rtc2/video/VideoCapture;->mNativeVideoCaptureAndroid:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p2, v0, v2

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    if-lez p1, :cond_1

    .line 14
    .line 15
    new-instance p2, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    :goto_0
    add-int/lit8 v1, p1, -0x1

    .line 22
    .line 23
    if-gt v0, v1, :cond_0

    .line 24
    .line 25
    new-instance v1, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Lio/agora/base/FaceDetectionInfo;

    .line 40
    .line 41
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ljava/lang/Double;

    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    invoke-direct {v2, v0, v1, v3, v4}, Lio/agora/base/FaceDetectionInfo;-><init>(ILandroid/graphics/Rect;D)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mPerFrameFaceDetectionInfoQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 61
    .line 62
    invoke-virtual {p0, p2}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public abstract onCameraAvailable(Ljava/lang/String;)V
.end method

.method public abstract onCameraUnavailable(Ljava/lang/String;)V
.end method

.method public registerCameraAvailableCallback(Landroid/hardware/camera2/CameraManager;)V
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-nez p1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "camera"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Landroid/hardware/camera2/CameraManager;

    .line 21
    .line 22
    :cond_1
    if-nez p1, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_3
    :try_start_0
    new-instance v0, Lio/agora/rtc2/video/VideoCaptureCamera$CameraAvailabilityCallback;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Lio/agora/rtc2/video/VideoCaptureCamera$CameraAvailabilityCallback;-><init>(Lio/agora/rtc2/video/VideoCaptureCamera;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 36
    .line 37
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 38
    .line 39
    const-string v1, "register CameraAvailablyCallback"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 45
    .line 46
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCapture;->mProxyThreadHandler:Landroid/os/Handler;

    .line 47
    .line 48
    invoke-virtual {p1, v0, p0}, Landroid/hardware/camera2/CameraManager;->registerAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catch_0
    move-exception p0

    .line 53
    sget-object p1, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "registerAvailabilityCallback error "

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p1, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public setCameraProxyHandler()V
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "VideoCaptureCamera_ProxyThread"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lio/agora/rtc2/video/VideoCapture;->mProxyThreadHandler:Landroid/os/Handler;

    .line 21
    .line 22
    return-void
.end method

.method public setPreviewInfo(Ljava/lang/Object;ZI)V
    .locals 3

    .line 1
    iput-boolean p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->isMirror:Z

    .line 2
    .line 3
    iput p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderMode:I

    .line 4
    .line 5
    instance-of p2, p1, Landroid/view/View;

    .line 6
    .line 7
    const-string p3, "setPreviewInfo "

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    new-instance p2, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 12
    .line 13
    check-cast p1, Landroid/view/View;

    .line 14
    .line 15
    invoke-direct {p2, p0, p1}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;-><init>(Lio/agora/rtc2/video/VideoCaptureCamera;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 19
    .line 20
    sget-object p1, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 21
    .line 22
    new-instance p2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 28
    .line 29
    invoke-virtual {p3}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p3, " x "

    .line 37
    .line 38
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p3, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mRenderView:Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;

    .line 42
    .line 43
    invoke-virtual {p3}, Lio/agora/rtc2/video/VideoCaptureCamera$CaptureViewWeakRef;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-static {p1, p2}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    sget-object p1, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p1, p3}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraFocusStarted:Z

    .line 64
    .line 65
    const/4 p2, 0x1

    .line 66
    const/4 p3, 0x0

    .line 67
    const/4 v0, 0x0

    .line 68
    if-nez p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraFocusPositions:[F

    .line 71
    .line 72
    aget v1, p1, p3

    .line 73
    .line 74
    cmpl-float v2, v1, v0

    .line 75
    .line 76
    if-lez v2, :cond_1

    .line 77
    .line 78
    aget p1, p1, p2

    .line 79
    .line 80
    cmpl-float v2, p1, v0

    .line 81
    .line 82
    if-lez v2, :cond_1

    .line 83
    .line 84
    invoke-interface {p0, v1, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setFocus(FF)I

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mIsmCameraExposureStarted:Z

    .line 88
    .line 89
    if-nez p1, :cond_2

    .line 90
    .line 91
    iget-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraExposurePositions:[F

    .line 92
    .line 93
    aget p3, p1, p3

    .line 94
    .line 95
    cmpl-float v1, p3, v0

    .line 96
    .line 97
    if-lez v1, :cond_2

    .line 98
    .line 99
    aget p1, p1, p2

    .line 100
    .line 101
    cmpl-float p2, p1, v0

    .line 102
    .line 103
    if-lez p2, :cond_2

    .line 104
    .line 105
    invoke-interface {p0, p3, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setExposure(FF)I

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void
.end method

.method public unRegisterAvailabilityCallback()V
    .locals 3

    .line 1
    const-string v0, "camera"

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    :try_start_0
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/hardware/camera2/CameraManager;

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    move-object v1, v0

    .line 36
    check-cast v1, Landroid/hardware/camera2/CameraManager;

    .line 37
    .line 38
    :cond_2
    if-nez v1, :cond_3

    .line 39
    .line 40
    :goto_0
    return-void

    .line 41
    :cond_3
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CameraManager;->unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCamera;->mCameraAvailableListener:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 48
    .line 49
    sget-object p0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 50
    .line 51
    const-string v0, "unregister Camera AvailabilityCallback done."

    .line 52
    .line 53
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception p0

    .line 58
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCamera;->TAG:Ljava/lang/String;

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "unregisterAvailabilityCallback error "

    .line 63
    .line 64
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.class public Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$BufferType;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RXVideoCaptureAndroid"


# instance fields
.field private final UIDeviceOrientationLandscapeLeft:I

.field private final UIDeviceOrientationLandscapeRight:I

.field private final UIDeviceOrientationPortrait:I

.field private final UIDeviceOrientationPortraitUpsidedown:I

.field private cameraEglBase:Lcom/bytedance/realx/video/EglBase;

.field private localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

.field private mCameraEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

.field private mCaptureBufferType:I

.field private mCaptureScreenIntent:Landroid/content/Intent;

.field private mHeight:I

.field private mIsCaptureScreen:Z

.field private mIsFrontCamera:Z

.field private mIsVideoCaptureInited:Z

.field private mIsVideoCaptureWorking:Z

.field private mNativeCaptureObserver:J

.field private mSurfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

.field private mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

.field private mWidth:I

.field private sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;


# direct methods
.method public constructor <init>(ZJLcom/bytedance/realx/video/EglBase$Context;)V
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
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCameraEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsFrontCamera:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 14
    .line 15
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsCaptureScreen:Z

    .line 18
    .line 19
    iput v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mWidth:I

    .line 20
    .line 21
    iput v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mHeight:I

    .line 22
    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 28
    .line 29
    iput v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->UIDeviceOrientationPortrait:I

    .line 30
    .line 31
    const/16 v0, 0x5a

    .line 32
    .line 33
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->UIDeviceOrientationLandscapeLeft:I

    .line 34
    .line 35
    const/16 v0, 0xb4

    .line 36
    .line 37
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->UIDeviceOrientationPortraitUpsidedown:I

    .line 38
    .line 39
    const/16 v0, 0x10e

    .line 40
    .line 41
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->UIDeviceOrientationLandscapeRight:I

    .line 42
    .line 43
    new-instance v0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;-><init>(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "RXVideoCaptureAndroid Created, CaptureScreen="

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "RXVideoCaptureAndroid"

    .line 65
    .line 66
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsCaptureScreen:Z

    .line 70
    .line 71
    iput-wide p2, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mNativeCaptureObserver:J

    .line 72
    .line 73
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 74
    .line 75
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mNativeCaptureObserver:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$102(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsFrontCamera:Z

    .line 2
    .line 3
    return p1
.end method

.method private createVideoCapturer(ZLandroid/content/Intent;I)Lcom/ss/bytertc/base/media/VideoCapturer;
    .locals 8

    .line 1
    const-string v0, "VideoCapturer first camera create null, name:"

    .line 2
    .line 3
    const-string v1, "enumerator camera but cannot find a match one, use default. deviceUniqueId: "

    .line 4
    .line 5
    const-string v2, "createVideoCapturer, deviceUniqueId: "

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const-string v4, "RXVideoCaptureAndroid"

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    :try_start_0
    new-instance p1, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;

    .line 13
    .line 14
    new-instance p3, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$3;

    .line 15
    .line 16
    invoke-direct {p3, p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$3;-><init>(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p1, p2, p3}, Lcom/ss/bytertc/base/media/screen/ScreenCapturerAndroid;-><init>(Landroid/content/Intent;Landroid/media/projection/MediaProjection$Callback;)V

    .line 20
    .line 21
    .line 22
    return-object p1

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    new-instance p1, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;

    .line 27
    .line 28
    iget p2, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCaptureBufferType:I

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    const/4 v6, 0x0

    .line 32
    if-eq p2, v5, :cond_1

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->isCaptureToTextureSupported()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move v5, v6

    .line 42
    :goto_0
    invoke-direct {p1, v5, v6}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;-><init>(ZZ)V

    .line 43
    .line 44
    .line 45
    invoke-interface {p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->getDeviceNames()[Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    array-length v5, p2

    .line 50
    if-le v5, p3, :cond_2

    .line 51
    .line 52
    if-ltz p3, :cond_2

    .line 53
    .line 54
    aget-object v5, p2, p3

    .line 55
    .line 56
    iget-object v7, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCameraEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 57
    .line 58
    invoke-interface {p1, v5, v7}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->createCapturer(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    if-eqz v5, :cond_2

    .line 63
    .line 64
    new-instance p0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v4, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-object v5

    .line 80
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p3, ", deviceNames: "

    .line 89
    .line 90
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    array-length p3, p2

    .line 94
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    invoke-static {v4, p3}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    array-length p3, p2

    .line 105
    if-lez p3, :cond_4

    .line 106
    .line 107
    aget-object p2, p2, v6

    .line 108
    .line 109
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCameraEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 110
    .line 111
    invoke-interface {p1, p2, p0}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->createCapturer(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    if-eqz p0, :cond_3

    .line 116
    .line 117
    return-object p0

    .line 118
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {v4, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_4
    const-string p0, "num of camera in device is zero"

    .line 135
    .line 136
    invoke-static {v4, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    .line 138
    .line 139
    :goto_1
    const-string p0, "cannot init VideoCapture: "

    .line 140
    .line 141
    invoke-static {v4, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-object v3

    .line 145
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string p2, "Create VideoCapture fail : "

    .line 148
    .line 149
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {v4, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-object v3
.end method

.method public static getCameraSensorOrientations()[I
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const-string v2, "RXVideoCaptureAndroid"

    .line 7
    .line 8
    if-gtz v0, :cond_0

    .line 9
    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v4, "getNumberOfCameras failed on count "

    .line 13
    .line 14
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_0
    new-array v3, v0, [I

    .line 29
    .line 30
    new-instance v4, Landroid/hardware/Camera$CameraInfo;

    .line 31
    .line 32
    invoke-direct {v4}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    :goto_0
    if-ge v5, v0, :cond_1

    .line 37
    .line 38
    :try_start_0
    invoke-static {v5, v4}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 39
    .line 40
    .line 41
    iget v6, v4, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 42
    .line 43
    aput v6, v3, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    add-int/lit8 v5, v5, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    new-instance v3, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v4, "getCameraInfo failed on index "

    .line 52
    .line 53
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const/16 v4, 0x2c

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-object v1

    .line 79
    :cond_1
    return-object v3
.end method

.method private isCaptureToTextureSupported()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public static isFrontCamera(I)Z
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    invoke-static {p0, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 8
    .line 9
    .line 10
    iget p0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    return v1

    .line 17
    :catch_0
    move-exception v0

    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "getCameraInfo failed on index "

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const/16 p0, 0x2c

    .line 29
    .line 30
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v0, "RXVideoCaptureAndroid"

    .line 45
    .line 46
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return v1
.end method

.method private startVideoCapture(III)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "startVideoCapture: width: %d, height: &d, fps: &d"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RXVideoCaptureAndroid"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    :try_start_0
    invoke-interface {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/VideoCapturer;->startCapture(III)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string p2, "VideoCapture startCapture fail : "

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method


# virtual methods
.method public enableFollowGravity(Z)I
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0, p1}, Lcom/ss/bytertc/base/media/VideoCapturer;->enableFollowGravity(Z)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public getCameraFace()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsFrontCamera:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->getCameraZoomMaxRatio()F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 19
    .line 20
    return p0
.end method

.method public getDeviceOrientation()I
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->getDeviceOrientation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->getUIOrientation()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public getUIOrientation()I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "window"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/view/WindowManager;

    .line 12
    .line 13
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v0, 0x1

    .line 22
    if-eq p0, v0, :cond_2

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    if-eq p0, v0, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    if-eq p0, v0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_0
    const/16 p0, 0x5a

    .line 33
    .line 34
    return p0

    .line 35
    :cond_1
    const/16 p0, 0xb4

    .line 36
    .line 37
    return p0

    .line 38
    :cond_2
    const/16 p0, 0x10e

    .line 39
    .line 40
    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->isCameraTorchSupported()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->isCameraZoomSupported()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public release()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->stopCapture()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->dispose()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Lcom/bytedance/realx/video/EglBase;->release()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mSurfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->dispose()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mSurfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 33
    .line 34
    :cond_2
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 38
    .line 39
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 40
    .line 41
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 42
    .line 43
    return-void
.end method

.method public setCameraZoomRatio(F)I
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0, p1}, Lcom/ss/bytertc/base/media/VideoCapturer;->setCameraZoomRatio(F)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method public startCapture(IIIILandroid/content/Intent;ZI)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "startCapture..."

    .line 2
    .line 3
    const-string v1, "RXVideoCaptureAndroid"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mWidth:I

    .line 9
    .line 10
    iput p2, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mHeight:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 13
    .line 14
    iput p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCaptureBufferType:I

    .line 15
    .line 16
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    const-string p5, "android.permission.CAMERA"

    .line 21
    .line 22
    invoke-static {p4, p5}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    if-eqz p4, :cond_0

    .line 27
    .line 28
    iget-wide p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mNativeCaptureObserver:J

    .line 29
    .line 30
    const/16 p2, -0x64

    .line 31
    .line 32
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerError(JI)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 37
    .line 38
    const/4 p5, 0x0

    .line 39
    if-eqz p4, :cond_1

    .line 40
    .line 41
    invoke-interface {p4}, Lcom/ss/bytertc/base/media/VideoCapturer;->dispose()V

    .line 42
    .line 43
    .line 44
    const/4 p4, 0x0

    .line 45
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 46
    .line 47
    iput-boolean p5, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 48
    .line 49
    iput-boolean p5, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 50
    .line 51
    :cond_1
    iget-boolean p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsCaptureScreen:Z

    .line 52
    .line 53
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mCaptureScreenIntent:Landroid/content/Intent;

    .line 54
    .line 55
    invoke-direct {p0, p4, v0, p7}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->createVideoCapturer(ZLandroid/content/Intent;I)Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 60
    .line 61
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 62
    .line 63
    if-nez p4, :cond_2

    .line 64
    .line 65
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->sharedEglGroup:Lcom/bytedance/realx/video/EglBase$Context;

    .line 66
    .line 67
    invoke-static {p4}, Lcom/bytedance/realx/video/EglBase;->create(Lcom/bytedance/realx/video/EglBase$Context;)Lcom/bytedance/realx/video/EglBase;

    .line 68
    .line 69
    .line 70
    move-result-object p4

    .line 71
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 72
    .line 73
    :cond_2
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 74
    .line 75
    if-nez p4, :cond_3

    .line 76
    .line 77
    const-string p4, "mVideoCapturer is null..."

    .line 78
    .line 79
    invoke-static {v1, p4}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->cameraEglBase:Lcom/bytedance/realx/video/EglBase;

    .line 83
    .line 84
    invoke-interface {p4}, Lcom/bytedance/realx/video/EglBase;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    const-string p7, "RXLocalCapturer"

    .line 89
    .line 90
    invoke-static {p7, p4}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->create(Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;)Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mSurfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 95
    .line 96
    iget-object p7, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 97
    .line 98
    if-eqz p7, :cond_5

    .line 99
    .line 100
    if-eqz p4, :cond_5

    .line 101
    .line 102
    const/4 p5, 0x1

    .line 103
    invoke-virtual {p4, p5}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setUsedByCamera(Z)V

    .line 104
    .line 105
    .line 106
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 107
    .line 108
    iget-object p7, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mSurfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 109
    .line 110
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->localCapturerObserver:Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 115
    .line 116
    invoke-interface {p4, p7, v0, v1}, Lcom/ss/bytertc/base/media/VideoCapturer;->initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V

    .line 117
    .line 118
    .line 119
    iput-boolean p5, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 120
    .line 121
    iget-object p4, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 122
    .line 123
    instance-of p5, p4, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;

    .line 124
    .line 125
    if-eqz p5, :cond_4

    .line 126
    .line 127
    check-cast p4, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;

    .line 128
    .line 129
    invoke-virtual {p4, p6}, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->enableFaceAE(Z)V

    .line 130
    .line 131
    .line 132
    :cond_4
    invoke-direct {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->startVideoCapture(III)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_5
    iput-boolean p5, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 137
    .line 138
    iput-boolean p5, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 139
    .line 140
    return-void
.end method

.method public stopCapture()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "RXVideoCaptureAndroid"

    .line 2
    .line 3
    const-string v1, "stopCapture..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    :try_start_0
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->stopCapture()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public switchCamera()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    instance-of v1, v0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsFrontCamera:Z

    .line 15
    .line 16
    xor-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsFrontCamera:Z

    .line 19
    .line 20
    check-cast v0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;

    .line 21
    .line 22
    new-instance v1, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$2;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$2;-><init>(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;->switchCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public turnOffFlashLight()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->turnOffFlashLight()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public turnOnFlashLight()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mVideoCapturer:Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureInited:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->mIsVideoCaptureWorking:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/VideoCapturer;->turnOnFlashLight()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

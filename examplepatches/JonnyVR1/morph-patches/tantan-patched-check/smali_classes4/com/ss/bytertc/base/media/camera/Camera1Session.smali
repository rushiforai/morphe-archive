.class Lcom/ss/bytertc/base/media/camera/Camera1Session;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/camera/CameraSession;
.implements Landroid/hardware/Camera$FaceDetectionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;
    }
.end annotation


# static fields
.field private static final NUMBER_OF_CAPTURE_BUFFERS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "Camera1Session"

.field private static sMinFramerate:I


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private final camera:Landroid/hardware/Camera;

.field private final cameraId:I

.field private final cameraThreadHandler:Landroid/os/Handler;

.field private final captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

.field private final captureToTexture:Z

.field private final constructionTimeNs:J

.field private final events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

.field private firstFrameReported:Z

.field private final gravityEventListener:Landroid/hardware/SensorEventListener;

.field private gravityOrientation:I

.field private final gravitySensor:Landroid/hardware/Sensor;

.field private final info:Landroid/hardware/Camera$CameraInfo;

.field private isDesktopMode:Z

.field private mDisplayRotationCheckCounter:I

.field private mEnableFaceAE:Z

.field private mEnableFollowGravity:Z

.field private mFaceDetectStarted:Z

.field private mLastDisplayRotation:I

.field private mLastValidDisplayRotation:I

.field private mOrientation:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

.field private final scaleHeight:I

.field private final scaleWidth:I

.field private final sensorManager:Landroid/hardware/SensorManager;

.field private state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

.field private final surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;


# direct methods
.method private constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraSession$Events;ZZLandroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;ILandroid/hardware/Camera;Landroid/hardware/Camera$CameraInfo;Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;JIIZZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityOrientation:I

    .line 6
    .line 7
    new-instance v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session$1;-><init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityEventListener:Landroid/hardware/SensorEventListener;

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 15
    .line 16
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;->ORIENTATION_MODE_ADAPTIVE:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mOrientation:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "Create new camera1 session on camera "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "Camera1Session"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Landroid/os/Handler;

    .line 40
    .line 41
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 45
    .line 46
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 47
    .line 48
    iput-boolean p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureToTexture:Z

    .line 49
    .line 50
    iput-boolean p3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->isDesktopMode:Z

    .line 51
    .line 52
    iput-object p4, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 53
    .line 54
    iput-object p5, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 55
    .line 56
    iput p6, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 57
    .line 58
    iput-object p7, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 59
    .line 60
    iput-object p8, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 61
    .line 62
    iput-object p9, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 63
    .line 64
    iput-wide p10, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->constructionTimeNs:J

    .line 65
    .line 66
    iput p12, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleWidth:I

    .line 67
    .line 68
    iput p13, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleHeight:I

    .line 69
    .line 70
    move/from16 p1, p14

    .line 71
    .line 72
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFaceAE:Z

    .line 73
    .line 74
    const-string p1, "sensor"

    .line 75
    .line 76
    invoke-virtual {p4, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Landroid/hardware/SensorManager;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->sensorManager:Landroid/hardware/SensorManager;

    .line 83
    .line 84
    const/16 p2, 0x9

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravitySensor:Landroid/hardware/Sensor;

    .line 91
    .line 92
    move/from16 p1, p15

    .line 93
    .line 94
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 95
    .line 96
    iget p1, p9, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 97
    .line 98
    iget p2, p9, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 99
    .line 100
    invoke-virtual {p5, p1, p2}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->setTextureSize(II)V

    .line 101
    .line 102
    .line 103
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->startCapturing()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/camera/Camera1Session;Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 5
    .line 6
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->RUNNING:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 7
    .line 8
    const-string v2, "Camera1Session"

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    const-string p0, "Texture frame captured but camera is no longer running."

    .line 13
    .line 14
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->firstFrameReported:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->firstFrameReported:Z

    .line 27
    .line 28
    :cond_1
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleWidth:I

    .line 29
    .line 30
    if-eqz v0, :cond_4

    .line 31
    .line 32
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleHeight:I

    .line 33
    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 37
    .line 38
    iget v4, v3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 39
    .line 40
    if-ne v4, v0, :cond_2

    .line 41
    .line 42
    iget v5, v3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 43
    .line 44
    if-eq v5, v1, :cond_4

    .line 45
    .line 46
    :cond_2
    int-to-float v4, v4

    .line 47
    iget v3, v3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 48
    .line 49
    int-to-float v3, v3

    .line 50
    div-float/2addr v4, v3

    .line 51
    int-to-float v0, v0

    .line 52
    int-to-float v1, v1

    .line 53
    div-float/2addr v0, v1

    .line 54
    cmpl-float v0, v4, v0

    .line 55
    .line 56
    if-lez v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 63
    .line 64
    iget v1, v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 65
    .line 66
    int-to-float v1, v1

    .line 67
    iget v8, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleWidth:I

    .line 68
    .line 69
    int-to-float v4, v8

    .line 70
    iget v9, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleHeight:I

    .line 71
    .line 72
    int-to-float v5, v9

    .line 73
    div-float/2addr v4, v5

    .line 74
    iget v7, v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 75
    .line 76
    int-to-float v0, v7

    .line 77
    mul-float/2addr v4, v0

    .line 78
    sub-float/2addr v1, v4

    .line 79
    float-to-int v0, v1

    .line 80
    div-int/lit8 v0, v0, 0x2

    .line 81
    .line 82
    const/4 v5, 0x0

    .line 83
    float-to-int v6, v4

    .line 84
    move v4, v0

    .line 85
    invoke-interface/range {v3 .. v9}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    goto :goto_0

    .line 90
    :cond_3
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 95
    .line 96
    iget v1, v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 97
    .line 98
    int-to-float v1, v1

    .line 99
    iget v9, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleHeight:I

    .line 100
    .line 101
    int-to-float v4, v9

    .line 102
    iget v8, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleWidth:I

    .line 103
    .line 104
    int-to-float v5, v8

    .line 105
    div-float/2addr v4, v5

    .line 106
    iget v6, v0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 107
    .line 108
    int-to-float v0, v6

    .line 109
    mul-float/2addr v4, v0

    .line 110
    sub-float/2addr v1, v4

    .line 111
    float-to-int v0, v1

    .line 112
    div-int/lit8 v5, v0, 0x2

    .line 113
    .line 114
    float-to-int v7, v4

    .line 115
    const/4 v4, 0x0

    .line 116
    invoke-interface/range {v3 .. v9}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    goto :goto_0

    .line 121
    :cond_4
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleHeight:I

    .line 122
    .line 123
    if-eqz v0, :cond_7

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    iget v8, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleWidth:I

    .line 130
    .line 131
    int-to-float v0, v8

    .line 132
    iget v9, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->scaleHeight:I

    .line 133
    .line 134
    int-to-float v1, v9

    .line 135
    div-float/2addr v0, v1

    .line 136
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 137
    .line 138
    iget v7, v1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 139
    .line 140
    int-to-float v1, v7

    .line 141
    mul-float/2addr v0, v1

    .line 142
    float-to-int v6, v0

    .line 143
    const/4 v4, 0x0

    .line 144
    const/4 v5, 0x0

    .line 145
    invoke-interface/range {v3 .. v9}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    :goto_0
    if-nez v0, :cond_5

    .line 150
    .line 151
    const-string p0, "cropandscale return null buffer"

    .line 152
    .line 153
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_5
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 158
    .line 159
    if-eqz v1, :cond_6

    .line 160
    .line 161
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->getGravityOrientation()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    :goto_1
    move v5, v1

    .line 166
    goto :goto_2

    .line 167
    :cond_6
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->getFrameOrientation()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 172
    .line 173
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    iput v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityOrientation:I

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :goto_2
    new-instance v3, Lcom/bytedance/realx/video/VideoFrame;

    .line 181
    .line 182
    move-object v1, v0

    .line 183
    check-cast v1, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 184
    .line 185
    const/4 v2, 0x0

    .line 186
    invoke-static {v1, v2, v2}, Lcom/ss/bytertc/base/media/camera/CameraSession;->createTextureBufferWithModifiedTransformMatrix(Lcom/bytedance/realx/video/TextureBufferImpl;ZI)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getTimestampNs()J

    .line 191
    .line 192
    .line 193
    move-result-wide v6

    .line 194
    const/4 v8, 0x0

    .line 195
    invoke-direct/range {v3 .. v8}, Lcom/bytedance/realx/video/VideoFrame;-><init>(Lcom/bytedance/realx/video/VideoFrame$Buffer;IJZ)V

    .line 196
    .line 197
    .line 198
    invoke-interface {v0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->release()V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 202
    .line 203
    invoke-interface {p1, p0, v3}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onFrameCaptured(Lcom/ss/bytertc/base/media/camera/CameraSession;Lcom/bytedance/realx/video/VideoFrame;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v3}, Lcom/bytedance/realx/video/VideoFrame;->release()V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :cond_7
    const-string p0, "scaleHeight is 0"

    .line 211
    .line 212
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public static synthetic access$002(Lcom/ss/bytertc/base/media/camera/Camera1Session;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityOrientation:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->stopInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/ss/bytertc/base/media/camera/Camera1Session;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->getGravityOrientation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1100(Lcom/ss/bytertc/base/media/camera/Camera1Session;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->getFrameOrientation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1200(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1300(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/hardware/Camera$CameraInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1400(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/CameraSession$Events;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->firstFrameReported:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$602(Lcom/ss/bytertc/base/media/camera/Camera1Session;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->firstFrameReported:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$700(Lcom/ss/bytertc/base/media/camera/Camera1Session;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->constructionTimeNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureFormat:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 2
    .line 3
    return p0
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
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraThreadHandler:Landroid/os/Handler;

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

.method public static create(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;ZZLandroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;IIIIZZ)V
    .locals 18

    move-object/from16 v1, p0

    move/from16 v4, p2

    move/from16 v8, p6

    move/from16 v14, p7

    move/from16 v15, p8

    move/from16 v0, p9

    .line 1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 2
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Open camera "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " brand:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", modle:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", width:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", height:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", framerate:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", faceae:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v3, p10

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, ", followGravity:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v5, p11

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, ", captureToTexture:"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v6, "Camera1Session"

    invoke-static {v6, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-interface/range {p1 .. p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraOpening()V

    .line 4
    :try_start_0
    invoke-static {v8}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v9
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_4

    if-nez v9, :cond_0

    .line 5
    sget-object v0, Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;->ERROR:Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "android.hardware.Camera.open returned null for camera id = "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;->onFailure(Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;Ljava/lang/String;)V

    return-void

    .line 6
    :cond_0
    :try_start_1
    invoke-virtual/range {p5 .. p5}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 7
    new-instance v10, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v10}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 8
    invoke-static {v8, v10}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 9
    :try_start_2
    invoke-virtual {v9}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    .line 10
    invoke-static {v2, v14, v15, v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->findClosestCaptureFormat(Landroid/hardware/Camera$Parameters;III)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    move-result-object v11

    .line 11
    invoke-static {v2, v14, v15}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->findClosestPictureSize(Landroid/hardware/Camera$Parameters;II)Lcom/ss/bytertc/base/media/Size;

    move-result-object v0

    .line 12
    iget v6, v0, Lcom/ss/bytertc/base/media/Size;->width:I

    iget v7, v0, Lcom/ss/bytertc/base/media/Size;->height:I

    iget-object v3, v11, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    move-object/from16 v5, p1

    invoke-interface {v5, v6, v7, v3}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraConfig(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V

    .line 13
    iget-object v3, v11, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    iget v3, v3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    div-int/lit16 v3, v3, 0x3e8

    sput v3, Lcom/ss/bytertc/base/media/camera/Camera1Session;->sMinFramerate:I

    .line 14
    invoke-static {v9, v2, v11, v0, v4}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->updateCameraParameters(Landroid/hardware/Camera;Landroid/hardware/Camera$Parameters;Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;Lcom/ss/bytertc/base/media/Size;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v0, 0x0

    if-nez v4, :cond_1

    .line 15
    invoke-virtual {v11}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->frameSize()I

    move-result v2

    move v3, v0

    :goto_0
    const/4 v6, 0x3

    if-ge v3, v6, :cond_1

    .line 16
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 17
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {v9, v6}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 18
    :cond_1
    :try_start_3
    invoke-virtual {v9, v0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 19
    :catch_0
    new-instance v2, Lcom/ss/bytertc/base/media/camera/Camera1Session;

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v16, p10

    move/from16 v17, p11

    move-object v3, v5

    move/from16 v5, p3

    invoke-direct/range {v2 .. v17}, Lcom/ss/bytertc/base/media/camera/Camera1Session;-><init>(Lcom/ss/bytertc/base/media/camera/CameraSession$Events;ZZLandroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;ILandroid/hardware/Camera;Landroid/hardware/Camera$CameraInfo;Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;JIIZZ)V

    invoke-interface {v1, v2}, Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;->onDone(Lcom/ss/bytertc/base/media/camera/CameraSession;)V

    return-void

    :catch_1
    move-exception v0

    .line 20
    invoke-virtual {v9}, Landroid/hardware/Camera;->release()V

    .line 21
    sget-object v2, Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;->ERROR:Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;->onFailure(Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;Ljava/lang/String;)V

    return-void

    :catch_2
    move-exception v0

    goto :goto_1

    :catch_3
    move-exception v0

    .line 22
    :goto_1
    invoke-virtual {v9}, Landroid/hardware/Camera;->release()V

    .line 23
    sget-object v2, Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;->ERROR:Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;->onFailure(Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;Ljava/lang/String;)V

    return-void

    :catch_4
    move-exception v0

    .line 24
    sget-object v2, Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;->ERROR:Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;->onFailure(Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;Ljava/lang/String;)V

    return-void
.end method

.method private static findClosestCaptureFormat(Landroid/hardware/Camera$Parameters;III)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Camera1Session"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "camera parameters is null!"

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;->convertFramerates(Ljava/util/List;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v3, "Available fps ranges: "

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 42
    .line 43
    const-string v3, "PEGM00"

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    const/16 v2, 0xf

    .line 52
    .line 53
    if-ne p3, v2, :cond_1

    .line 54
    .line 55
    new-instance p3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 56
    .line 57
    const/16 v0, 0x3a98

    .line 58
    .line 59
    const/16 v2, 0x4e20

    .line 60
    .line 61
    invoke-direct {p3, v0, v2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;-><init>(II)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v2, "unsupported framerate for special device found, hardcode framerange to:"

    .line 67
    .line 68
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-static {v0, p3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getClosestSupportedFramerateRange(Ljava/util/List;I)Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v2, "selected fps range :"

    .line 93
    .line 94
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;->convertSizes(Ljava/util/List;)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v2, "Available supportedPreviewSizes : "

    .line 122
    .line 123
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getUpClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    new-instance p1, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    const-string p2, "selected preview size"

    .line 147
    .line 148
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/Size;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    new-instance p1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;

    .line 166
    .line 167
    iget p2, p0, Lcom/ss/bytertc/base/media/Size;->width:I

    .line 168
    .line 169
    iget p0, p0, Lcom/ss/bytertc/base/media/Size;->height:I

    .line 170
    .line 171
    invoke-direct {p1, p2, p0, p3}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;-><init>(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V

    .line 172
    .line 173
    .line 174
    return-object p1
.end method

.method private static findClosestPictureSize(Landroid/hardware/Camera$Parameters;II)Lcom/ss/bytertc/base/media/Size;
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;->convertSizes(Ljava/util/List;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getUpClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    :goto_0
    const-string p0, "Camera1Session"

    .line 24
    .line 25
    const-string p1, "camera parameters is null!"

    .line 26
    .line 27
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method private getFrameOrientation()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mLastValidDisplayRotation:I

    .line 8
    .line 9
    iget v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mDisplayRotationCheckCounter:I

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    add-int/lit8 v2, v2, -0x1

    .line 14
    .line 15
    iput v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mDisplayRotationCheckCounter:I

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    if-nez v2, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->isInForeground(Landroid/content/Context;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mLastValidDisplayRotation:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v1, v0

    .line 32
    :goto_0
    const/4 v2, -0x1

    .line 33
    iput v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mDisplayRotationCheckCounter:I

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    iget v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mLastDisplayRotation:I

    .line 37
    .line 38
    if-eq v0, v2, :cond_4

    .line 39
    .line 40
    sget v2, Lcom/ss/bytertc/base/media/camera/Camera1Session;->sMinFramerate:I

    .line 41
    .line 42
    if-lez v2, :cond_3

    .line 43
    .line 44
    iput v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mDisplayRotationCheckCounter:I

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    const/4 v2, 0x5

    .line 48
    iput v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mDisplayRotationCheckCounter:I

    .line 49
    .line 50
    :cond_4
    :goto_1
    iput v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mLastDisplayRotation:I

    .line 51
    .line 52
    iput v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mLastValidDisplayRotation:I

    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 55
    .line 56
    iget v0, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 57
    .line 58
    if-nez v0, :cond_5

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_5
    rsub-int v1, v1, 0x168

    .line 62
    .line 63
    :goto_2
    iget p0, p0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 64
    .line 65
    add-int/2addr p0, v1

    .line 66
    rem-int/lit16 p0, p0, 0x168

    .line 67
    .line 68
    return p0
.end method

.method private getGravityOrientation()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityOrientation:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 4
    .line 5
    iget v1, p0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    rsub-int v0, v0, 0x168

    .line 11
    .line 12
    :cond_0
    iget p0, p0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 13
    .line 14
    add-int/2addr p0, v0

    .line 15
    rem-int/lit16 p0, p0, 0x168

    .line 16
    .line 17
    return p0
.end method

.method private static isInForeground(Landroid/content/Context;)Z
    .locals 5

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/app/ActivityManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return v1

    .line 21
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_4

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 36
    .line 37
    iget-object v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    iget v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 46
    .line 47
    const/16 v4, 0x64

    .line 48
    .line 49
    if-eq v3, v4, :cond_3

    .line 50
    .line 51
    :cond_2
    iget v2, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    .line 52
    .line 53
    const/16 v3, 0x7d

    .line 54
    .line 55
    if-ne v2, v3, :cond_1

    .line 56
    .line 57
    :cond_3
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_4
    return v1
.end method

.method private listenForBytebufferFrames()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session$3;-><init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private listenForTextureFrames()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/base/media/camera/a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/ss/bytertc/base/media/camera/a;-><init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->startListening(Lcom/ss/bytertc/base/media/VideoSink;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private startCapturing()V
    .locals 4

    .line 1
    const-string v0, "supportedFaces is "

    .line 2
    .line 3
    const-string v1, "Start capturing"

    .line 4
    .line 5
    const-string v2, "Camera1Session"

    .line 6
    .line 7
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->RUNNING:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 18
    .line 19
    new-instance v3, Lcom/ss/bytertc/base/media/camera/Camera1Session$2;

    .line 20
    .line 21
    invoke-direct {v3, p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session$2;-><init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v3}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 25
    .line 26
    .line 27
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureToTexture:Z

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->listenForTextureFrames()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->listenForBytebufferFrames()V

    .line 36
    .line 37
    .line 38
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxNumDetectedFaces()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    if-lez v1, :cond_1

    .line 70
    .line 71
    move v1, v0

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    const/4 v1, 0x0

    .line 74
    :goto_1
    iget-boolean v3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFaceAE:Z

    .line 75
    .line 76
    if-eqz v3, :cond_2

    .line 77
    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 81
    .line 82
    invoke-virtual {v3, p0}, Landroid/hardware/Camera;->setFaceDetectionListener(Landroid/hardware/Camera$FaceDetectionListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 86
    .line 87
    invoke-virtual {v3}, Landroid/hardware/Camera;->startFaceDetection()V

    .line 88
    .line 89
    .line 90
    iput-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mFaceDetectStarted:Z

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :catch_0
    move-exception v0

    .line 94
    goto :goto_3

    .line 95
    :cond_2
    :goto_2
    iget-boolean v3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFaceAE:Z

    .line 96
    .line 97
    if-eqz v3, :cond_3

    .line 98
    .line 99
    if-nez v1, :cond_3

    .line 100
    .line 101
    const-string v1, "mEnableFaceAE is ture but camera not support faceae"

    .line 102
    .line 103
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-boolean v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 107
    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->enableFollowGravity(Z)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void

    .line 114
    :goto_3
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->stopInternal()V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v1, p0, v0}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraError(Lcom/ss/bytertc/base/media/camera/CameraSession;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method private stopInternal()V
    .locals 3

    .line 1
    const-string v0, "Stop internal"

    .line 2
    .line 3
    const-string v1, "Camera1Session"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 12
    .line 13
    sget-object v2, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 14
    .line 15
    if-ne v0, v2, :cond_0

    .line 16
    .line 17
    const-string p0, "Camera is already stopped"

    .line 18
    .line 19
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->surfaceTextureHelper:Lcom/ss/bytertc/base/media/SurfaceTextureHelper;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/ss/bytertc/base/media/SurfaceTextureHelper;->stopListening()V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mFaceDetectStarted:Z

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopFaceDetection()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_1

    .line 42
    :catch_1
    move-exception p0

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 47
    .line 48
    .line 49
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->enableFollowGravity(Z)I

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->captureToTexture:Z

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->events:Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 73
    .line 74
    invoke-interface {v0, p0}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraClosed(Lcom/ss/bytertc/base/media/camera/CameraSession;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    goto :goto_3

    .line 78
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 83
    .line 84
    .line 85
    :goto_3
    const-string p0, "Stop done"

    .line 86
    .line 87
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private static updateCameraParameters(Landroid/hardware/Camera;Landroid/hardware/Camera$Parameters;Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;Lcom/ss/bytertc/base/media/Size;Z)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p2, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->framerate:Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;

    .line 6
    .line 7
    iget v2, v1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    .line 8
    .line 9
    iget v1, v1, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->max:I

    .line 10
    .line 11
    invoke-virtual {p1, v2, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 12
    .line 13
    .line 14
    iget v1, p2, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->width:I

    .line 15
    .line 16
    iget p2, p2, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat;->height:I

    .line 17
    .line 18
    invoke-virtual {p1, v1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 19
    .line 20
    .line 21
    sget-object p2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "PEGM00"

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    const-string v1, "PEGT00"

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-nez p2, :cond_0

    .line 38
    .line 39
    iget p2, p3, Lcom/ss/bytertc/base/media/Size;->width:I

    .line 40
    .line 41
    iget p3, p3, Lcom/ss/bytertc/base/media/Size;->height:I

    .line 42
    .line 43
    invoke-virtual {p1, p2, p3}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 44
    .line 45
    .line 46
    :cond_0
    if-nez p4, :cond_1

    .line 47
    .line 48
    const/16 p2, 0x11

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_2

    .line 58
    .line 59
    const/4 p2, 0x1

    .line 60
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 61
    .line 62
    .line 63
    :cond_2
    const-string p2, "support FOCUS_MODE list: "

    .line 64
    .line 65
    const-string p3, "Camera1Session"

    .line 66
    .line 67
    invoke-static {p3, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/4 p2, 0x0

    .line 71
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p4

    .line 75
    if-ge p2, p4, :cond_3

    .line 76
    .line 77
    new-instance p4, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, " : "

    .line 86
    .line 87
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    check-cast v1, Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    invoke-static {p3, p4}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    add-int/lit8 p2, p2, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_3
    const-string p2, "start set FOCUS_MODE_CONTINUOUS_VIDEO"

    .line 110
    .line 111
    invoke-static {p3, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    const-string p2, "continuous-video"

    .line 115
    .line 116
    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p4

    .line 120
    if-eqz p4, :cond_4

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string p2, "FOCUS_MODE_CONTINUOUS_VIDEO support and set success"

    .line 126
    .line 127
    invoke-static {p3, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_4
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method


# virtual methods
.method public enableFollowGravity(Z)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravitySensor:Landroid/hardware/Sensor;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->sensorManager:Landroid/hardware/SensorManager;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    const/4 v2, 0x0

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    :try_start_0
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityEventListener:Landroid/hardware/SensorEventListener;

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    invoke-virtual {v1, p1, v0, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityEventListener:Landroid/hardware/SensorEventListener;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 28
    .line 29
    .line 30
    iput-boolean v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    :goto_1
    return v2

    .line 37
    :cond_2
    :goto_2
    const/4 p0, -0x1

    .line 38
    return p0
.end method

.method public getCameraZoomMaxRatio()F
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "turn on flash light camera1, cameraId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 26
    .line 27
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 28
    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->isCameraZoomSupported()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    int-to-float p0, p0

    .line 48
    return p0

    .line 49
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 50
    .line 51
    return p0
.end method

.method public getDeviceOrientation()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mEnableFollowGravity:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession;->getDeviceUIOrientation(Landroid/content/Context;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->gravityOrientation:I

    .line 15
    .line 16
    return p0
.end method

.method public isCameraTorchSupported()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->applicationContext:Landroid/content/Context;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "android.hardware.camera.flash"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public isCameraZoomSupported()Z
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "turn on flash light camera1, cameraId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 26
    .line 27
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-eq v0, v1, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    return v2

    .line 52
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_2
    return v2
.end method

.method public onFaceDetection([Landroid/hardware/Camera$Face;Landroid/hardware/Camera;)V
    .locals 0

    .line 1
    array-length p0, p1

    .line 2
    return-void
.end method

.method public setCameraZoomRatio(F)I
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "turn on flash light camera1, cameraId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 26
    .line 27
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 28
    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->isCameraZoomSupported()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-float v1, v1

    .line 48
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    float-to-int p1, p1

    .line 53
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isSmoothZoomSupported()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const/4 v2, 0x0

    .line 58
    if-eqz v1, :cond_0

    .line 59
    .line 60
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 61
    .line 62
    invoke-virtual {p0, p1}, Landroid/hardware/Camera;->startSmoothZoom(I)V

    .line 63
    .line 64
    .line 65
    return v2

    .line 66
    :cond_0
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 72
    .line 73
    .line 74
    return v2

    .line 75
    :cond_1
    const/4 p0, -0x1

    .line 76
    return p0
.end method

.method public setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->mOrientation:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;

    .line 2
    .line 3
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Stop camera1 session on camera "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 26
    .line 27
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 28
    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->stopInternal()V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public turnOffFlashLight()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "turn on flash light camera1, cameraId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 26
    .line 27
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-ne v0, v2, :cond_0

    .line 31
    .line 32
    const-string p0, "front camera not support flash light"

    .line 33
    .line 34
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 39
    .line 40
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 41
    .line 42
    if-eq v0, v1, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "off"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public turnOnFlashLight()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "turn on flash light camera1, cameraId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->cameraId:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Camera1Session"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->checkIsOnCameraThread()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->info:Landroid/hardware/Camera$CameraInfo;

    .line 26
    .line 27
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    if-ne v0, v2, :cond_0

    .line 31
    .line 32
    const-string p0, "front camera not support flash light"

    .line 33
    .line 34
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->state:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 39
    .line 40
    sget-object v1, Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;->STOPPED:Lcom/ss/bytertc/base/media/camera/Camera1Session$SessionState;

    .line 41
    .line 42
    if-eq v0, v1, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "torch"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session;->camera:Landroid/hardware/Camera;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

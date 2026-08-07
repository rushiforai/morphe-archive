.class Lio/agora/rtc2/video/VideoCaptureFactory$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/video/VideoCaptureFactory;->createFallbackWrapper(Lio/agora/rtc2/video/IVideoCaptureCamera;IJZZIZILio/agora/base/internal/video/EglBase$Context;IIIZZZZIIZ)Lio/agora/rtc2/video/IVideoCaptureCamera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$autoFaceDetect:Z

.field final synthetic val$autoWhiteBalance:Z

.field final synthetic val$captureTextureBufferCount:I

.field final synthetic val$captureToTexture:Z

.field final synthetic val$enableRefocus:Z

.field final synthetic val$enableTextureCopy:Z

.field final synthetic val$extraSurface:Z

.field final synthetic val$focalLengthType:I

.field final synthetic val$focusMode:I

.field final synthetic val$fpsRangeEnable:Z

.field final synthetic val$index:I

.field final synthetic val$nativeVideoCaptureDeviceAndroid:J

.field final synthetic val$noiseReduction:I

.field final synthetic val$physicalId:I

.field final synthetic val$pqFirst:Z

.field final synthetic val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

.field final synthetic val$skipControl:I

.field final synthetic val$templateType:I


# direct methods
.method public constructor <init>(IJZZIZILio/agora/base/internal/video/EglBase$Context;IIIZZZZIIZ)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$index:I

    .line 2
    .line 3
    iput-wide p2, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$nativeVideoCaptureDeviceAndroid:J

    .line 4
    .line 5
    iput-boolean p4, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$captureToTexture:Z

    .line 6
    .line 7
    iput-boolean p5, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$enableTextureCopy:Z

    .line 8
    .line 9
    iput p6, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$captureTextureBufferCount:I

    .line 10
    .line 11
    iput-boolean p7, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$pqFirst:Z

    .line 12
    .line 13
    iput p8, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$skipControl:I

    .line 14
    .line 15
    iput-object p9, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 16
    .line 17
    iput p10, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$templateType:I

    .line 18
    .line 19
    iput p11, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$noiseReduction:I

    .line 20
    .line 21
    iput p12, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$focusMode:I

    .line 22
    .line 23
    iput-boolean p13, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$autoFaceDetect:Z

    .line 24
    .line 25
    iput-boolean p14, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$extraSurface:Z

    .line 26
    .line 27
    iput-boolean p15, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$autoWhiteBalance:Z

    .line 28
    .line 29
    move/from16 p1, p16

    .line 30
    .line 31
    iput-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$fpsRangeEnable:Z

    .line 32
    .line 33
    move/from16 p1, p17

    .line 34
    .line 35
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$focalLengthType:I

    .line 36
    .line 37
    move/from16 p1, p18

    .line 38
    .line 39
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$physicalId:I

    .line 40
    .line 41
    move/from16 p1, p19

    .line 42
    .line 43
    iput-boolean p1, p0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$enableRefocus:Z

    .line 44
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public createFallbackCamera()Lio/agora/rtc2/video/IVideoCaptureCamera;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lio/agora/rtc2/video/VideoCaptureCamera1;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget v1, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$index:I

    .line 7
    .line 8
    move-object v4, v2

    .line 9
    iget-wide v2, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$nativeVideoCaptureDeviceAndroid:J

    .line 10
    .line 11
    move-object v5, v4

    .line 12
    iget-boolean v4, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$captureToTexture:Z

    .line 13
    .line 14
    move-object v6, v5

    .line 15
    iget-boolean v5, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$enableTextureCopy:Z

    .line 16
    .line 17
    move-object v7, v6

    .line 18
    iget v6, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$captureTextureBufferCount:I

    .line 19
    .line 20
    move-object v8, v7

    .line 21
    iget-boolean v7, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$pqFirst:Z

    .line 22
    .line 23
    move-object v9, v8

    .line 24
    iget v8, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$skipControl:I

    .line 25
    .line 26
    move-object v10, v9

    .line 27
    iget-object v9, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$sharedContext:Lio/agora/base/internal/video/EglBase$Context;

    .line 28
    .line 29
    move-object v11, v10

    .line 30
    iget v10, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$templateType:I

    .line 31
    .line 32
    move-object v12, v11

    .line 33
    iget v11, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$noiseReduction:I

    .line 34
    .line 35
    move-object v13, v12

    .line 36
    iget v12, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$focusMode:I

    .line 37
    .line 38
    move-object v14, v13

    .line 39
    iget-boolean v13, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$autoFaceDetect:Z

    .line 40
    .line 41
    move-object v15, v14

    .line 42
    iget-boolean v14, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$extraSurface:Z

    .line 43
    .line 44
    move-object/from16 v16, v15

    .line 45
    .line 46
    iget-boolean v15, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$autoWhiteBalance:Z

    .line 47
    .line 48
    move/from16 v17, v1

    .line 49
    .line 50
    iget-boolean v1, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$fpsRangeEnable:Z

    .line 51
    .line 52
    move/from16 v18, v1

    .line 53
    .line 54
    iget v1, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$focalLengthType:I

    .line 55
    .line 56
    move/from16 v19, v1

    .line 57
    .line 58
    iget v1, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$physicalId:I

    .line 59
    .line 60
    iget-boolean v0, v0, Lio/agora/rtc2/video/VideoCaptureFactory$1;->val$enableRefocus:Z

    .line 61
    .line 62
    move/from16 v20, v19

    .line 63
    .line 64
    move/from16 v19, v0

    .line 65
    .line 66
    move-object/from16 v0, v16

    .line 67
    .line 68
    move/from16 v16, v18

    .line 69
    .line 70
    move/from16 v18, v1

    .line 71
    .line 72
    move/from16 v1, v17

    .line 73
    .line 74
    move/from16 v17, v20

    .line 75
    .line 76
    invoke-direct/range {v0 .. v19}, Lio/agora/rtc2/video/VideoCaptureCamera1;-><init>(IJZZIZILio/agora/base/internal/video/EglBase$Context;IIIZZZZIIZ)V

    .line 77
    .line 78
    .line 79
    return-object v0
.end method

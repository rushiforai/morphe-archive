.class Lio/agora/rtc2/video/VideoCaptureParameter;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final autoWhiteBalance:Z

.field final camera1FocusMode:I

.field final camera1FpsRange:Z

.field final camera2FocusMode:I

.field final enableRefocus:Z

.field final extraSurface:Z

.field final faceFocusing:Z

.field final focalLengthType:I

.field final hardwareLevelSelected:I

.field final lowCameraSelected:I

.field final noiseReduce:I

.field final physicalId:I

.field final templateType:I


# direct methods
.method public constructor <init>(IIIIZZIIZZIIZ)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->lowCameraSelected:I

    .line 5
    .line 6
    iput p2, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->hardwareLevelSelected:I

    .line 7
    .line 8
    iput p3, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->templateType:I

    .line 9
    .line 10
    iput p4, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->noiseReduce:I

    .line 11
    .line 12
    iput-boolean p5, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->faceFocusing:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->extraSurface:Z

    .line 15
    .line 16
    iput p7, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->camera1FocusMode:I

    .line 17
    .line 18
    iput p8, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->camera2FocusMode:I

    .line 19
    .line 20
    iput-boolean p9, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->autoWhiteBalance:Z

    .line 21
    .line 22
    iput-boolean p10, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->camera1FpsRange:Z

    .line 23
    .line 24
    iput p11, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->focalLengthType:I

    .line 25
    .line 26
    iput p12, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->physicalId:I

    .line 27
    .line 28
    iput-boolean p13, p0, Lio/agora/rtc2/video/VideoCaptureParameter;->enableRefocus:Z

    .line 29
    .line 30
    return-void
.end method

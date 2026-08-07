.class public Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/video/IVideoCaptureCamera;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoCaptureCameraFallbackWrapper"


# instance fields
.field private captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private events:Lio/agora/rtc2/video/IVideoCapture$Events;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field private fallbackListener:Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private format:Lio/agora/rtc2/video/VideoCaptureFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/video/IVideoCaptureCamera;Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;)V
    .locals 0
    .param p1    # Lio/agora/rtc2/video/IVideoCaptureCamera;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 5
    .line 6
    iput-object p2, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->fallbackListener:Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;

    .line 7
    .line 8
    return-void
.end method

.method private createFallbackCamera()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->needFallback()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    sget-object v0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->TAG:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "capture fallback to low level camera. "

    .line 14
    .line 15
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->fallbackListener:Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;

    .line 19
    .line 20
    invoke-interface {v0}, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper$OnCameraFallbackListener;->createFallbackCamera()Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 25
    .line 26
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->events:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 27
    .line 28
    invoke-interface {v0, p0}, Lio/agora/rtc2/video/IVideoCapture;->setEventsCallback(Lio/agora/rtc2/video/IVideoCapture$Events;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method


# virtual methods
.method public allocate(Lio/agora/rtc2/video/VideoCaptureFormat;)Z
    .locals 1
    .param p1    # Lio/agora/rtc2/video/VideoCaptureFormat;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->format:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 2
    .line 3
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lio/agora/rtc2/video/IVideoCapture;->allocate(Lio/agora/rtc2/video/VideoCaptureFormat;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 12
    .line 13
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->stopCaptureAndBlockUntilStopped()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 17
    .line 18
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->deallocate()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 22
    .line 23
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->dispose()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->createFallbackCamera()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 33
    .line 34
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCapture;->allocate(Lio/agora/rtc2/video/VideoCaptureFormat;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x1

    .line 40
    return p0
.end method

.method public deallocate()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCapture;->deallocate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public dispose()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCapture;->dispose()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCaptureFormat()Lio/agora/rtc2/video/VideoCaptureFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCapture;->getCaptureFormat()Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMaxZoom()F
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->getMaxZoom()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isAutoFaceFocusSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isAutoFaceFocusSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isCameraExposureSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isExposureSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isExposureSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isExposureSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isFaceDetectSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isFaceDetectSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isFocusSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isFocusSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isTorchSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isTorchSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isZoomSupported()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCaptureCamera;->isZoomSupported()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public needFallback()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setAntiBandingMode(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setAntiBandingMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setAutoFaceFocus(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setAutoFaceFocus(Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setEdgeEnhanceMode(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setEdgeEnhanceMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setEventsCallback(Lio/agora/rtc2/video/IVideoCapture$Events;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->events:Lio/agora/rtc2/video/IVideoCapture$Events;

    .line 2
    .line 3
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCapture;->setEventsCallback(Lio/agora/rtc2/video/IVideoCapture$Events;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setExposure(FF)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setExposure(FF)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setExposureCompensation(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setExposureCompensation(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setFaceDetection(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setFaceDetection(Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setFocus(FF)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setFocus(FF)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setNoiseReductionMode(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setNoiseReductionMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setPreviewInfo(Ljava/lang/Object;ZI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setPreviewInfo(Ljava/lang/Object;ZI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTorchMode(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setTorchMode(Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setVideoEdgeMode(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setVideoEdgeMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setVideoStabilityMode(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setVideoStabilityMode(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setZoom(F)I
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lio/agora/rtc2/video/IVideoCaptureCamera;->setZoom(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public startCaptureMaybeAsync()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->startCaptureMaybeAsync()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 11
    .line 12
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->stopCaptureAndBlockUntilStopped()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 16
    .line 17
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->deallocate()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 21
    .line 22
    invoke-interface {v0}, Lio/agora/rtc2/video/IVideoCapture;->dispose()V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->createFallbackCamera()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 32
    .line 33
    iget-object v2, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->format:Lio/agora/rtc2/video/VideoCaptureFormat;

    .line 34
    .line 35
    invoke-interface {v0, v2}, Lio/agora/rtc2/video/IVideoCapture;->allocate(Lio/agora/rtc2/video/VideoCaptureFormat;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 42
    .line 43
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCapture;->startCaptureMaybeAsync()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    return v1

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0

    .line 52
    :cond_1
    return v1
.end method

.method public stopCaptureAndBlockUntilStopped()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/video/VideoCaptureCameraFallbackWrapper;->captuer:Lio/agora/rtc2/video/IVideoCaptureCamera;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/rtc2/video/IVideoCapture;->stopCaptureAndBlockUntilStopped()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

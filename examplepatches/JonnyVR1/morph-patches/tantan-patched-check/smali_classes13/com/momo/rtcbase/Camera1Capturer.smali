.class public Lcom/momo/rtcbase/Camera1Capturer;
.super Lcom/momo/rtcbase/CameraCapturer;
.source "SourceFile"


# instance fields
.field private final captureToTexture:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/Camera1Enumerator;

    .line 2
    .line 3
    invoke-direct {v0, p3}, Lcom/momo/rtcbase/Camera1Enumerator;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/momo/rtcbase/CameraCapturer;-><init>(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;Lcom/momo/rtcbase/CameraEnumerator;)V

    .line 7
    .line 8
    .line 9
    iput-boolean p3, p0, Lcom/momo/rtcbase/Camera1Capturer;->captureToTexture:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public bridge synthetic changeCaptureFormat(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/momo/rtcbase/CameraCapturer;->changeCaptureFormat(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public createCameraSession(Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;Lcom/momo/rtcbase/CameraSession$Events;Landroid/content/Context;Lcom/momo/rtcbase/SurfaceTextureHelper;Ljava/lang/String;III)V
    .locals 1

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/Camera1Capturer;->captureToTexture:Z

    .line 2
    .line 3
    invoke-static {p5}, Lcom/momo/rtcbase/Camera1Enumerator;->getCameraIndex(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p5

    .line 7
    move-object v0, p2

    .line 8
    move p2, p0

    .line 9
    move-object p0, p1

    .line 10
    move-object p1, v0

    .line 11
    invoke-static/range {p0 .. p8}, Lcom/momo/rtcbase/Camera1Session;->create(Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;Lcom/momo/rtcbase/CameraSession$Events;ZLandroid/content/Context;Lcom/momo/rtcbase/SurfaceTextureHelper;IIII)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic dispose()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/CameraCapturer;->dispose()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic initialize(Lcom/momo/rtcbase/SurfaceTextureHelper;Landroid/content/Context;Lcom/momo/rtcbase/CapturerObserver;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/momo/rtcbase/CameraCapturer;->initialize(Lcom/momo/rtcbase/SurfaceTextureHelper;Landroid/content/Context;Lcom/momo/rtcbase/CapturerObserver;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic isScreencast()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/CameraCapturer;->isScreencast()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic printStackTrace()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/CameraCapturer;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic startCapture(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/momo/rtcbase/CameraCapturer;->startCapture(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic stopCapture()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/CameraCapturer;->stopCapture()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic switchCamera(Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/rtcbase/CameraCapturer;->switchCamera(Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

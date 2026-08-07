.class public Lcom/momo/rtcbase/Camera2Capturer;
.super Lcom/momo/rtcbase/CameraCapturer;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# instance fields
.field private final cameraManager:Landroid/hardware/camera2/CameraManager;

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/Camera2Enumerator;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/momo/rtcbase/Camera2Enumerator;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2, p3, v0}, Lcom/momo/rtcbase/CameraCapturer;-><init>(Ljava/lang/String;Lcom/momo/rtcbase/CameraVideoCapturer$CameraEventsHandler;Lcom/momo/rtcbase/CameraEnumerator;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/rtcbase/Camera2Capturer;->context:Landroid/content/Context;

    .line 10
    .line 11
    const-string p2, "camera"

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/hardware/camera2/CameraManager;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/momo/rtcbase/Camera2Capturer;->cameraManager:Landroid/hardware/camera2/CameraManager;

    .line 20
    .line 21
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
    iget-object p0, p0, Lcom/momo/rtcbase/Camera2Capturer;->cameraManager:Landroid/hardware/camera2/CameraManager;

    .line 2
    .line 3
    move-object v0, p3

    .line 4
    move-object p3, p0

    .line 5
    move-object p0, p1

    .line 6
    move-object p1, p2

    .line 7
    move-object p2, v0

    .line 8
    invoke-static/range {p0 .. p8}, Lcom/momo/rtcbase/Camera2Session;->create(Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;Lcom/momo/rtcbase/CameraSession$Events;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Lcom/momo/rtcbase/SurfaceTextureHelper;Ljava/lang/String;III)V

    .line 9
    .line 10
    .line 11
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

.class public Lcom/ss/bytertc/base/media/camera/Camera2Capturer;
.super Lcom/ss/bytertc/base/media/camera/CameraCapturer;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# instance fields
.field private final cameraManager:Landroid/hardware/camera2/CameraManager;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/Camera2Enumerator;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/ss/bytertc/base/media/camera/Camera2Enumerator;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2, p3, v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;-><init>(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;Lcom/ss/bytertc/base/media/camera/CameraEnumerator;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Capturer;->context:Landroid/content/Context;

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
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera2Capturer;->cameraManager:Landroid/hardware/camera2/CameraManager;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public bridge synthetic changeCaptureFormat(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->changeCaptureFormat(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public createCameraSession(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera2Capturer;->cameraManager:Landroid/hardware/camera2/CameraManager;

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
    invoke-static/range {p0 .. p8}, Lcom/ss/bytertc/base/media/camera/Camera2Session;->create(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;Landroid/content/Context;Landroid/hardware/camera2/CameraManager;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Ljava/lang/String;III)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic disableDoOrientation()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->disableDoOrientation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic dispose()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->dispose()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic enableFollowGravity(Z)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->enableFollowGravity(Z)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getCameraZoomMaxRatio()F
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->getCameraZoomMaxRatio()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic getDeviceOrientation()I
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->getDeviceOrientation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
    .locals 0
    .param p1    # Lcom/ss/bytertc/base/media/SurfaceTextureHelper;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic isCameraTorchSupported()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->isCameraTorchSupported()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isCameraZoomSupported()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->isCameraZoomSupported()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic isScreencast()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->isScreencast()Z

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
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setCameraZoomRatio(F)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->setCameraZoomRatio(F)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public bridge synthetic setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic startCapture(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->startCapture(III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic startCapture(IIII)V
    .locals 0

    .line 5
    invoke-super {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->startCapture(IIII)V

    return-void
.end method

.method public bridge synthetic stopCapture()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stopCapture()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic switchCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic turnOffFlashLight()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->turnOffFlashLight()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic turnOnFlashLight()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->turnOnFlashLight()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

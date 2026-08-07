.class public Lcom/ss/bytertc/base/media/camera/Camera1Capturer;
.super Lcom/ss/bytertc/base/media/camera/CameraCapturer;
.source "SourceFile"


# instance fields
.field private final captureToTexture:Z

.field private final isDesktopMode:Z

.field protected mEnableFaceAE:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;ZZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;

    .line 2
    .line 3
    invoke-direct {v0, p3, p4}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;-><init>(ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;-><init>(Ljava/lang/String;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;Lcom/ss/bytertc/base/media/camera/CameraEnumerator;)V

    .line 7
    .line 8
    .line 9
    iput-boolean p3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->captureToTexture:Z

    .line 10
    .line 11
    iput-boolean p4, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->isDesktopMode:Z

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->mEnableFaceAE:Z

    .line 15
    .line 16
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
    .locals 12

    .line 1
    iget-boolean v2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->captureToTexture:Z

    .line 2
    .line 3
    iget-boolean v3, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->isDesktopMode:Z

    .line 4
    .line 5
    invoke-static/range {p5 .. p5}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;->getCameraIndex(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v6

    .line 9
    iget-boolean v10, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->mEnableFaceAE:Z

    .line 10
    .line 11
    iget-boolean v11, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->mEnableFollowGravity:Z

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    move-object v1, p2

    .line 15
    move-object v4, p3

    .line 16
    move-object/from16 v5, p4

    .line 17
    .line 18
    move/from16 v7, p6

    .line 19
    .line 20
    move/from16 v8, p7

    .line 21
    .line 22
    move/from16 v9, p8

    .line 23
    .line 24
    invoke-static/range {v0 .. v11}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->create(Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;Lcom/ss/bytertc/base/media/camera/CameraSession$Events;ZZLandroid/content/Context;Lcom/ss/bytertc/base/media/SurfaceTextureHelper;IIIIZZ)V

    .line 25
    .line 26
    .line 27
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

.method public enableFaceAE(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Capturer;->mEnableFaceAE:Z

    .line 2
    .line 3
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

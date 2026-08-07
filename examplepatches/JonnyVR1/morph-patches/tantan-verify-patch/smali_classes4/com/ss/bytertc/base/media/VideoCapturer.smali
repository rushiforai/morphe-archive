.class public interface abstract Lcom/ss/bytertc/base/media/VideoCapturer;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract changeCaptureFormat(III)V
.end method

.method public abstract disableDoOrientation()V
.end method

.method public abstract dispose()V
.end method

.method public abstract enableFollowGravity(Z)I
.end method

.method public abstract getCameraZoomMaxRatio()F
.end method

.method public abstract getDeviceOrientation()I
.end method

.method public abstract initialize(Lcom/ss/bytertc/base/media/SurfaceTextureHelper;Landroid/content/Context;Lcom/ss/bytertc/base/media/CapturerObserver;)V
.end method

.method public abstract isCameraTorchSupported()Z
.end method

.method public abstract isCameraZoomSupported()Z
.end method

.method public abstract isScreencast()Z
.end method

.method public abstract setCameraZoomRatio(F)I
.end method

.method public abstract startCapture(III)V
.end method

.method public abstract startCapture(IIII)V
.end method

.method public abstract stopCapture()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract turnOffFlashLight()V
.end method

.method public abstract turnOnFlashLight()V
.end method

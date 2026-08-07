.class public interface abstract Lcom/ss/bytertc/base/media/camera/CameraSession;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/CameraSession$Events;,
        Lcom/ss/bytertc/base/media/camera/CameraSession$CreateSessionCallback;,
        Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;,
        Lcom/ss/bytertc/base/media/camera/CameraSession$FailureType;
    }
.end annotation


# direct methods
.method public static createTextureBufferWithModifiedTransformMatrix(Lcom/bytedance/realx/video/TextureBufferImpl;ZI)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x3f000000    # 0.5f

    .line 7
    .line 8
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/high16 p1, -0x40800000    # -1.0f

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, p1, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    int-to-float p1, p2

    .line 21
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 22
    .line 23
    .line 24
    const/high16 p1, -0x41000000    # -0.5f

    .line 25
    .line 26
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    invoke-virtual {p0, v0, p1, p2}, Lcom/bytedance/realx/video/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static getDeviceUIOrientation(Landroid/content/Context;)I
    .locals 1

    .line 1
    const-string v0, "window"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowManager;

    .line 8
    .line 9
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x1

    .line 18
    if-eq p0, v0, :cond_2

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    if-eq p0, v0, :cond_0

    .line 25
    .line 26
    sget-object p0, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->Portrait:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    sget-object p0, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->LandscapeLeft:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_1
    sget-object p0, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->PortraitUpsideDown:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_2
    sget-object p0, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->LandscapeRight:Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraSession$UIDeviceOrientation;->value()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method


# virtual methods
.method public abstract enableFollowGravity(Z)I
.end method

.method public abstract getCameraZoomMaxRatio()F
.end method

.method public abstract getDeviceOrientation()I
.end method

.method public abstract isCameraTorchSupported()Z
.end method

.method public abstract isCameraZoomSupported()Z
.end method

.method public abstract setCameraZoomRatio(F)I
.end method

.method public abstract setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V
.end method

.method public abstract stop()V
.end method

.method public abstract turnOffFlashLight()V
.end method

.method public abstract turnOnFlashLight()V
.end method

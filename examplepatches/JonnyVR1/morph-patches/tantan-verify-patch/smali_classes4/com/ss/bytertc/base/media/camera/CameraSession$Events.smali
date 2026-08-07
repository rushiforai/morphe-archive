.class public interface abstract Lcom/ss/bytertc/base/media/camera/CameraSession$Events;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/CameraSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Events"
.end annotation


# virtual methods
.method public abstract onCameraClosed(Lcom/ss/bytertc/base/media/camera/CameraSession;)V
.end method

.method public abstract onCameraConfig(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V
.end method

.method public abstract onCameraDisconnected(Lcom/ss/bytertc/base/media/camera/CameraSession;)V
.end method

.method public abstract onCameraError(Lcom/ss/bytertc/base/media/camera/CameraSession;Ljava/lang/String;)V
.end method

.method public abstract onCameraOpening()V
.end method

.method public abstract onFrameCaptured(Lcom/ss/bytertc/base/media/camera/CameraSession;Lcom/bytedance/realx/video/VideoFrame;)V
.end method

.class public interface abstract Lcom/momo/rtcbase/CameraSession$Events;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/CameraSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Events"
.end annotation


# virtual methods
.method public abstract onCameraClosed(Lcom/momo/rtcbase/CameraSession;)V
.end method

.method public abstract onCameraDisconnected(Lcom/momo/rtcbase/CameraSession;)V
.end method

.method public abstract onCameraError(Lcom/momo/rtcbase/CameraSession;Ljava/lang/String;)V
.end method

.method public abstract onCameraOpening()V
.end method

.method public abstract onFrameCaptured(Lcom/momo/rtcbase/CameraSession;Lcom/momo/rtcbase/VideoFrame;)V
.end method

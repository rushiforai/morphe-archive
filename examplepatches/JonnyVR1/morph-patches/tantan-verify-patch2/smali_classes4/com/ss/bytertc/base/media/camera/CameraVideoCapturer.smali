.class public interface abstract Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/VideoCapturer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;,
        Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;,
        Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$MediaRecorderHandler;,
        Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;,
        Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;
    }
.end annotation


# virtual methods
.method public addMediaRecorderToCamera(Landroid/media/MediaRecorder;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$MediaRecorderHandler;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "Deprecated and not implemented."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public removeMediaRecorderFromCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$MediaRecorderHandler;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string p1, "Deprecated and not implemented."

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public abstract setOrientationMode(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$ORIENTATION_MODE;)V
.end method

.method public abstract switchCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
.end method

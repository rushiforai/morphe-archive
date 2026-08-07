.class Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/camera/CameraSession$Events;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/CameraCapturer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCameraClosed(Lcom/ss/bytertc/base/media/camera/CameraSession;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eq p1, v1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p0, "CameraCapturer"

    .line 30
    .line 31
    const-string p1, "onCameraClosed from another session."

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraClosed()V

    .line 47
    .line 48
    .line 49
    monitor-exit v0

    .line 50
    return-void

    .line 51
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public onCameraConfig(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    monitor-enter v1

    .line 13
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraConfig(IILcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget p0, p3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->min:I

    .line 29
    .line 30
    div-int/lit16 v5, p0, 0x3e8

    .line 31
    .line 32
    iget p0, p3, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$CaptureFormat$FramerateRange;->max:I

    .line 33
    .line 34
    div-int/lit16 v6, p0, 0x3e8

    .line 35
    .line 36
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kUnknown:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXPixelFormat;->value()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    move v3, p1

    .line 43
    move v4, p2

    .line 44
    invoke-interface/range {v2 .. v7}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerFormatSelected(IIIII)V

    .line 45
    .line 46
    .line 47
    monitor-exit v1

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public onCameraDisconnected(Lcom/ss/bytertc/base/media/camera/CameraSession;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eq p1, v1, :cond_0

    .line 20
    .line 21
    const-string p0, "CameraCapturer"

    .line 22
    .line 23
    const-string p1, "onCameraDisconnected from another session."

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraDisconnected()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string v1, "CameraDisconnected"

    .line 48
    .line 49
    invoke-interface {p1, v1}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stopCapture()V

    .line 55
    .line 56
    .line 57
    monitor-exit v0

    .line 58
    return-void

    .line 59
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw p0
.end method

.method public onCameraError(Lcom/ss/bytertc/base/media/camera/CameraSession;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "onCameraError from another session: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eq p1, v2, :cond_0

    .line 22
    .line 23
    const-string p0, "CameraCapturer"

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    monitor-exit v1

    .line 41
    return-void

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraError(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p1, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->stopCapture()V

    .line 65
    .line 66
    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 69
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0
.end method

.method public onCameraOpening()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string p0, "CameraCapturer"

    .line 22
    .line 23
    const-string v1, "onCameraOpening while session was open."

    .line 24
    .line 25
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1400(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v1, p0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraOpening(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method

.method public onFrameCaptured(Lcom/ss/bytertc/base/media/camera/CameraSession;Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$000(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$300(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$800(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraSession;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eq p1, v1, :cond_0

    .line 20
    .line 21
    const-string p0, "CameraCapturer"

    .line 22
    .line 23
    const-string p1, "onFrameCaptured from another session."

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1200(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-interface {p1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onFirstFrameAvailable()V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    invoke-static {p1, v1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1202(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Z)Z

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$900(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$900(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraStatistics;->addFrame()V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$2;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 73
    .line 74
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0, p2}, Lcom/ss/bytertc/base/media/CapturerObserver;->onFrameCaptured(Lcom/bytedance/realx/video/VideoFrame;)V

    .line 79
    .line 80
    .line 81
    monitor-exit v0

    .line 82
    return-void

    .line 83
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    throw p0
.end method

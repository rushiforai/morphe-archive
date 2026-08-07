.class Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/CapturerObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCapturerError(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onCapturerError: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RXVideoCaptureAndroid"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "CAMERA_ERROR_SERVER_DIED"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/16 v1, -0x3ed

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    invoke-static {p0, p1, v1}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerError(JI)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const-string v0, "CAMERA_ERROR_EVICTED"

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    const-string v0, "CAMERA_ERROR_UNKNOWN"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 60
    .line 61
    .line 62
    move-result-wide p0

    .line 63
    invoke-static {p0, p1, v1}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerError(JI)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    const/16 v0, -0x3ec

    .line 74
    .line 75
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerError(JI)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public onCapturerFormatSelected(IIIII)V
    .locals 7

    .line 1
    const-string v0, "RXVideoCaptureAndroid"

    .line 2
    .line 3
    const-string v1, "onCapturerFormatSelected..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    move v2, p1

    .line 15
    move v3, p2

    .line 16
    move v4, p3

    .line 17
    move v5, p4

    .line 18
    move v6, p5

    .line 19
    invoke-static/range {v0 .. v6}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerFormatSelected(JIIIII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onCapturerStarted(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "RXVideoCaptureAndroid"

    .line 4
    .line 5
    const-string v1, "onCapturerStarted..."

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerStarted(JZ)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerError(JI)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onCapturerStopped()V
    .locals 2

    .line 1
    const-string v0, "RXVideoCaptureAndroid"

    .line 2
    .line 3
    const-string v1, "onCapturerStopped..."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnCapturerStopped(J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFrameCaptured(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/base/media/RXNativeFunctions;->nativeOnFrameCaptured(JLcom/bytedance/realx/video/VideoFrame;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

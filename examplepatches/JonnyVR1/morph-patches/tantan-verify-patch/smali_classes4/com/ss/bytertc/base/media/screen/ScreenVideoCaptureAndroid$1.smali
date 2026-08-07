.class Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/CapturerObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

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
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {v0, v1, p0, p1}, Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;->nativeOnCapturerError(JILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCapturerFormatSelected(IIIII)V
    .locals 0

    return-void
.end method

.method public onCapturerStarted(Z)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;->nativeOnCapturerStarted(J)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    const/4 v0, 0x0

    .line 18
    const-string v1, "start error"

    .line 19
    .line 20
    invoke-static {p0, p1, v0, v1}, Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;->nativeOnCapturerError(JILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onCapturerStopped()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;->nativeOnCapturerStopped(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFrameCaptured(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$1;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$000(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;->nativeOnFrameCaptured(JLcom/bytedance/realx/video/VideoFrame;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.class Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;
.super Landroid/media/projection/MediaProjection$Callback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->createVideoCapturer(Landroid/content/Intent;)Lcom/ss/bytertc/base/media/VideoCapturer;
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
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/projection/MediaProjection$Callback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStop()V
    .locals 2

    .line 1
    const-string v0, "ScreenVideoCaptureAndroid"

    .line 2
    .line 3
    const-string v1, "User revoked permission to capture the screen."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$100(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Lcom/ss/bytertc/base/media/VideoCapturer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$200(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$300(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$400(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;->access$400(Lcom/ss/bytertc/base/media/screen/ScreenVideoCaptureAndroid;)Lcom/ss/bytertc/base/media/CapturerObserver;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v0, "media projection unexpected exit when capture screen video"

    .line 47
    .line 48
    invoke-interface {p0, v0}, Lcom/ss/bytertc/base/media/CapturerObserver;->onCapturerError(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

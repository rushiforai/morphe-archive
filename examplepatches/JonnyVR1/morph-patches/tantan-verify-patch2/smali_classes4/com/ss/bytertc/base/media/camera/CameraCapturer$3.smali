.class Lcom/ss/bytertc/base/media/camera/CameraCapturer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


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
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$3;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$3;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1100(Lcom/ss/bytertc/base/media/camera/CameraCapturer;)Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "Camera failed to start within timeout."

    .line 8
    .line 9
    invoke-interface {p0, v0}, Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraEventsHandler;->onCameraError(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

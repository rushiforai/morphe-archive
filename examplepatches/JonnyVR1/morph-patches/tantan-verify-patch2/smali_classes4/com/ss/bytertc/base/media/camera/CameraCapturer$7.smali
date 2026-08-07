.class Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/CameraCapturer;->switchCamera(Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

.field final synthetic val$switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;->val$switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;->this$0:Lcom/ss/bytertc/base/media/camera/CameraCapturer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/CameraCapturer$7;->val$switchEventsHandler:Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/ss/bytertc/base/media/camera/CameraCapturer;->access$1600(Lcom/ss/bytertc/base/media/camera/CameraCapturer;Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

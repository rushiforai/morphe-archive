.class Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/camera/CameraVideoCapturer$CameraSwitchHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->switchCamera()V
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
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCameraSwitchDone(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$2;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->access$102(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;Z)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCameraSwitchError(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

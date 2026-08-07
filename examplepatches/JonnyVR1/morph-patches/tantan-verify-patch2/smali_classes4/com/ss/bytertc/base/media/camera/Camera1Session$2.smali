.class Lcom/ss/bytertc/base/media/camera/Camera1Session$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/Camera1Session;->startCapturing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$2;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 1

    .line 1
    const/16 p2, 0x64

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    const-string p1, "CAMERA_ERROR_SERVER_DIED"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p2, 0x2

    .line 9
    if-ne p1, p2, :cond_1

    .line 10
    .line 11
    const-string p1, "CAMERA_ERROR_EVICTED"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p2, 0x1

    .line 15
    if-ne p1, p2, :cond_2

    .line 16
    .line 17
    const-string p1, "CAMERA_ERROR_UNKNOWN"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v0, "Camera error: "

    .line 23
    .line 24
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    const-string p2, "Camera1Session"

    .line 35
    .line 36
    invoke-static {p2, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$2;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 40
    .line 41
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$100(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$2;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 45
    .line 46
    invoke-static {p2}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->access$200(Lcom/ss/bytertc/base/media/camera/Camera1Session;)Lcom/ss/bytertc/base/media/camera/CameraSession$Events;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/Camera1Session$2;->this$0:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    .line 51
    .line 52
    invoke-interface {p2, p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraSession$Events;->onCameraError(Lcom/ss/bytertc/base/media/camera/CameraSession;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

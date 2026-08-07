.class Lcom/momo/rtcbase/Camera1Session$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/Camera1Session;->startCapturing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/Camera1Session;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/Camera1Session;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/Camera1Session$1;->this$0:Lcom/momo/rtcbase/Camera1Session;

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
    .locals 2

    .line 1
    const/16 p2, 0x64

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    const-string p2, "Camera server died!"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v0, "Camera error: "

    .line 11
    .line 12
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    :goto_0
    const-string v0, "Camera1Session"

    .line 23
    .line 24
    invoke-static {v0, p2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session$1;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$000(Lcom/momo/rtcbase/Camera1Session;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/rtcbase/Camera1Session$1;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    if-ne p1, v1, :cond_1

    .line 36
    .line 37
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$100(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraSession$Events;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session$1;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 42
    .line 43
    invoke-interface {p1, p0}, Lcom/momo/rtcbase/CameraSession$Events;->onCameraDisconnected(Lcom/momo/rtcbase/CameraSession;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {v0}, Lcom/momo/rtcbase/Camera1Session;->access$100(Lcom/momo/rtcbase/Camera1Session;)Lcom/momo/rtcbase/CameraSession$Events;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p0, p0, Lcom/momo/rtcbase/Camera1Session$1;->this$0:Lcom/momo/rtcbase/Camera1Session;

    .line 52
    .line 53
    invoke-interface {p1, p0, p2}, Lcom/momo/rtcbase/CameraSession$Events;->onCameraError(Lcom/momo/rtcbase/CameraSession;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

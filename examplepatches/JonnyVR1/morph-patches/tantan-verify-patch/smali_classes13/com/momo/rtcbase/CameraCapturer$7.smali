.class Lcom/momo/rtcbase/CameraCapturer$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/CameraCapturer;->switchCamera(Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/CameraCapturer;

.field final synthetic val$switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$7;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/CameraCapturer$7;->val$switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

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
    iget-object v0, p0, Lcom/momo/rtcbase/CameraCapturer$7;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer$7;->val$switchEventsHandler:Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/momo/rtcbase/CameraCapturer;->access$1500(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraVideoCapturer$CameraSwitchHandler;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

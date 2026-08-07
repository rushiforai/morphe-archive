.class Lcom/momo/rtcbase/CameraCapturer$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/CameraCapturer;->stopCapture()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/CameraCapturer;

.field final synthetic val$oldSession:Lcom/momo/rtcbase/CameraSession;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/CameraCapturer;Lcom/momo/rtcbase/CameraSession;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/CameraCapturer$6;->this$0:Lcom/momo/rtcbase/CameraCapturer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/CameraCapturer$6;->val$oldSession:Lcom/momo/rtcbase/CameraSession;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/CameraCapturer$6;->val$oldSession:Lcom/momo/rtcbase/CameraSession;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/momo/rtcbase/CameraSession;->stop()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

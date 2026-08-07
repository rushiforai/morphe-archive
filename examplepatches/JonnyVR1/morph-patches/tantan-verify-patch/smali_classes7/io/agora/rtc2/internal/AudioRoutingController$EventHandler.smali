.class Lio/agora/rtc2/internal/AudioRoutingController$EventHandler;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioRoutingController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "EventHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/AudioRoutingController;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/AudioRoutingController;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioRoutingController$EventHandler;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$EventHandler;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$200(Lio/agora/rtc2/internal/AudioRoutingController;)Lio/agora/rtc2/internal/AudioRoutingController$ControllerState;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$EventHandler;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {p0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$200(Lio/agora/rtc2/internal/AudioRoutingController;)Lio/agora/rtc2/internal/AudioRoutingController$ControllerState;

    move-result-object p0

    iget v0, p1, Landroid/os/Message;->what:I

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-interface {p0, v0, p1}, Lio/agora/rtc2/internal/AudioRoutingController$ControllerState;->onEvent(II)V

    :cond_0
    return-void
.end method

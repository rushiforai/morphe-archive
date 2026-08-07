.class Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;
.super Lio/agora/rtc2/internal/AudioRoutingController$ControllerBaseState;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioRoutingController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ControllerStopState"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/AudioRoutingController;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/AudioRoutingController;)V
    .locals 1

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lio/agora/rtc2/internal/AudioRoutingController$ControllerBaseState;-><init>(Lio/agora/rtc2/internal/AudioRoutingController;Lio/agora/rtc2/internal/AudioRoutingController$1;)V

    const-string p0, "AudioRoute"

    const-string v0, "ControllerStopState ctor"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-static {p1, p0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1602(Lio/agora/rtc2/internal/AudioRoutingController;Z)Z

    const/4 p0, -0x1

    invoke-static {p1, p0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$902(Lio/agora/rtc2/internal/AudioRoutingController;I)I

    return-void
.end method

.method private resetImpl()V
    .locals 2

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1700(Lio/agora/rtc2/internal/AudioRoutingController;)V

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1800(Lio/agora/rtc2/internal/AudioRoutingController;)V

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1900(Lio/agora/rtc2/internal/AudioRoutingController;)Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v1}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1600(Lio/agora/rtc2/internal/AudioRoutingController;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1602(Lio/agora/rtc2/internal/AudioRoutingController;Z)Z

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$2000(Lio/agora/rtc2/internal/AudioRoutingController;)V

    :cond_1
    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    const/4 v0, -0x1

    invoke-static {p0, v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$902(Lio/agora/rtc2/internal/AudioRoutingController;I)I

    return-void
.end method


# virtual methods
.method public getState()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public onEvent(II)V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "StopState: onEvent: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v1, p1}, Lio/agora/rtc2/internal/AudioRoutingController;->access$2100(Lio/agora/rtc2/internal/AudioRoutingController;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", info: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioRoute"

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1900(Lio/agora/rtc2/internal/AudioRoutingController;)Landroid/media/AudioManager;

    move-result-object v0

    const/16 v2, 0xb

    if-eq p1, v2, :cond_0

    invoke-super {p0, p1, p2}, Lio/agora/rtc2/internal/AudioRoutingController$ControllerBaseState;->onEvent(II)V

    return-void

    :catch_0
    move-exception p0

    goto :goto_2

    :cond_0
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    move v2, p1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    if-ne p2, p1, :cond_2

    const/4 p1, 0x3

    goto :goto_1

    :cond_2
    const/4 p1, -0x1

    :goto_1
    invoke-static {v0, p1}, Lio/agora/rtc2/internal/AudioRoutingController;->access$902(Lio/agora/rtc2/internal/AudioRoutingController;I)I

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/AudioRoutingController;->queryCurrentAudioRouting()I

    move-result p1

    invoke-static {p0, p1}, Lio/agora/rtc2/internal/AudioRoutingController;->access$600(Lio/agora/rtc2/internal/AudioRoutingController;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :goto_2
    const-string p1, "onEvent: Exception "

    invoke-static {v1, p1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public reset()V
    .locals 2

    const-string v0, "AudioRoute"

    const-string v1, "Monitor stop state, reset"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lio/agora/rtc2/internal/AudioRoutingController$ControllerStopState;->resetImpl()V

    return-void
.end method

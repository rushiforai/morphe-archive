.class Lio/agora/rtc2/internal/AudioRoutingController$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/internal/AudioRoutingController;->startMonitoring()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/AudioRoutingController;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/AudioRoutingController;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioRoutingController$3;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioRoutingController$3;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$200(Lio/agora/rtc2/internal/AudioRoutingController;)Lio/agora/rtc2/internal/AudioRoutingController$ControllerState;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$3;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {p0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$200(Lio/agora/rtc2/internal/AudioRoutingController;)Lio/agora/rtc2/internal/AudioRoutingController$ControllerState;

    move-result-object p0

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lio/agora/rtc2/internal/AudioRoutingController$ControllerState;->setState(I)V

    :cond_0
    return-void
.end method

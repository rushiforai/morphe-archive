.class Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioRoutingController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioDeviceChangedCallbackImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/AudioRoutingController;


# direct methods
.method private constructor <init>(Lio/agora/rtc2/internal/AudioRoutingController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/rtc2/internal/AudioRoutingController;Lio/agora/rtc2/internal/AudioRoutingController$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;-><init>(Lio/agora/rtc2/internal/AudioRoutingController;)V

    return-void
.end method


# virtual methods
.method public onAudioDeviceChanged(ZI)V
    .locals 3

    invoke-static {}, Lio/agora/rtc2/internal/AudioRoutingController;->access$3700()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    const-string v1, "AudioRoute"

    if-nez v0, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Not handle "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {p0, p2}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1200(Lio/agora/rtc2/internal/AudioRoutingController;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " device event yet!"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v2, 0x5

    if-ne p2, v2, :cond_1

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    move p1, p2

    goto :goto_1

    :cond_2
    const/4 p1, -0x1

    :goto_1
    iget-object p2, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-virtual {p2, v0, p1}, Lio/agora/rtc2/internal/AudioRoutingController;->sendEvent(II)V

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "Device event: "

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {p0, v0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$2100(Lio/agora/rtc2/internal/AudioRoutingController;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", arg: "

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public onAudioDeviceEvent(I)V
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {p1}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1700(Lio/agora/rtc2/internal/AudioRoutingController;)V

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    invoke-static {p0}, Lio/agora/rtc2/internal/AudioRoutingController;->access$1800(Lio/agora/rtc2/internal/AudioRoutingController;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioRoutingController;

    const/16 p1, 0x17

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/internal/AudioRoutingController;->sendEvent(II)V

    :cond_1
    return-void
.end method

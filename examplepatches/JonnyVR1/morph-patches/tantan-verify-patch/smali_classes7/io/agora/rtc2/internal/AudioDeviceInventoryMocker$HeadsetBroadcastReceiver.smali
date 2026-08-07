.class Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HeadsetBroadcastReceiver"
.end annotation


# instance fields
.field private isRegistered:Z

.field final synthetic this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;


# direct methods
.method private constructor <init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->isRegistered:Z

    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;)V

    return-void
.end method


# virtual methods
.method public getRegistered()Z
    .locals 0

    iget-boolean p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->isRegistered:Z

    return p0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "state"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const-string v1, "microphone"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;

    if-ne p2, v1, :cond_1

    move p2, v0

    goto :goto_0

    :cond_1
    const/4 p2, 0x2

    :goto_0
    invoke-static {v2, p2}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->access$302(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;I)I

    :cond_2
    if-ne p1, v1, :cond_3

    move v0, v1

    :cond_3
    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;

    invoke-static {p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->access$300(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;)I

    move-result p1

    invoke-static {p0, p1, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->access$400(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;IZ)V

    :cond_4
    :goto_1
    return-void
.end method

.method public setRegistered(Z)V
    .locals 0

    iput-boolean p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->isRegistered:Z

    return-void
.end method

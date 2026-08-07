.class Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BTHeadsetBroadcastReceiver"
.end annotation


# instance fields
.field private isRegistered:Z

.field final synthetic this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;


# direct methods
.method private constructor <init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->isRegistered:Z

    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$1;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;)V

    return-void
.end method


# virtual methods
.method public getRegistered()Z
    .locals 0

    iget-boolean p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->isRegistered:Z

    return p0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;

    invoke-static {p0, p2}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->access$200(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;Landroid/content/Intent;)V

    return-void
.end method

.method public setRegistered(Z)V
    .locals 0

    iput-boolean p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->isRegistered:Z

    return-void
.end method

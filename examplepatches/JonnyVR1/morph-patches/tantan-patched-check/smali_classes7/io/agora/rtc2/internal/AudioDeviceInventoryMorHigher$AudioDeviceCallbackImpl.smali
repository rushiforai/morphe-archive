.class Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher$AudioDeviceCallbackImpl;
.super Landroid/media/AudioDeviceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioDeviceCallbackImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher$AudioDeviceCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;

    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    const-string p0, "AudioRoute"

    const-string p1, "AudioDeviceCallbackImpl ctor!"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 1

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher$AudioDeviceCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;->access$000(Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;[Landroid/media/AudioDeviceInfo;Z)V

    return-void
.end method

.method public onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 1

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher$AudioDeviceCallbackImpl;->this$0:Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;->access$000(Lio/agora/rtc2/internal/AudioDeviceInventoryMorHigher;[Landroid/media/AudioDeviceInfo;Z)V

    return-void
.end method

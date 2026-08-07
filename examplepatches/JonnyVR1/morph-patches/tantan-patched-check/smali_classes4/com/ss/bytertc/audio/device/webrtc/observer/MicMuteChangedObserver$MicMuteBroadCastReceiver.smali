.class final Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "MicMuteBroadCastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;


# direct methods
.method private constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;->this$0:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;-><init>(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$MicMuteBroadCastReceiver;->this$0:Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "android.media.action.MICROPHONE_MUTE_CHANGED"

    .line 14
    .line 15
    if-ne p2, v0, :cond_0

    .line 16
    .line 17
    :try_start_0
    const-string p2, "audio"

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/media/AudioManager;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->access$100(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;)Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;->access$100(Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver;)Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-interface {p0, p1}, Lcom/ss/bytertc/audio/device/webrtc/observer/MicMuteChangedObserver$OnMicMuteChangedListener;->onMicMuteChanged(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catch_0
    move-exception p0

    .line 46
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string p2, "MicMuteBroadCastReceiver.onReceive, exception: "

    .line 49
    .line 50
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "MicMuteChangedObserver"

    .line 65
    .line 66
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

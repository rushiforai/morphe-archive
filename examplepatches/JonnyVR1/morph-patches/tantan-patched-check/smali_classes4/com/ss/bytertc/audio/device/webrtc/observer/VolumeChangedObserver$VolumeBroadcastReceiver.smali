.class Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VolumeBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;->this$0:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$VolumeBroadcastReceiver;->this$0:Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->access$000(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;)Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "android.media.VOLUME_CHANGED_ACTION"

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    :try_start_0
    const-string p1, "android.media.EXTRA_VOLUME_STREAM_TYPE"

    .line 23
    .line 24
    const/4 v0, -0x1

    .line 25
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 v1, 0x3

    .line 30
    if-eq p1, v1, :cond_1

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    const/4 v1, 0x6

    .line 35
    if-ne p1, v1, :cond_2

    .line 36
    .line 37
    :cond_1
    const-string v1, "android.media.EXTRA_VOLUME_STREAM_VALUE"

    .line 38
    .line 39
    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;->access$000(Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver;)Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/observer/VolumeChangedObserver$OnVolumeChangedListener;->onVolumeChanged(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string p2, "getIntExtra failed. key: EXTRA_VOLUME_STREAM_TYPE, msg: "

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "VolumeChangedObserver"

    .line 71
    .line 72
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    return-void
.end method

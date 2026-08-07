.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$headsetSwitchThread;
.super Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "headsetSwitchThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$headsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;-><init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public _quit()V
    .locals 0

    return-void
.end method

.method public _run()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsMusicScene:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$headsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 16
    .line 17
    iget-object v3, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 18
    .line 19
    invoke-virtual {v0, v3, v2}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSetSpeaker(Landroid/content/Context;Z)I

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$headsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setWiredHeadsetOn(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->updateStatus()V

    .line 30
    .line 31
    .line 32
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsMusicScene:Z

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    const-string v4, "TRAE"

    .line 36
    .line 37
    if-nez v0, :cond_5

    .line 38
    .line 39
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_6

    .line 53
    .line 54
    const-string p0, "connect headset: disableDeviceSwitchFlag"

    .line 55
    .line 56
    invoke-static {v4, v3, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    move v0, v2

    .line 61
    :goto_0
    iget-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->_running:Z

    .line 62
    .line 63
    if-ne v3, v1, :cond_6

    .line 64
    .line 65
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$headsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 66
    .line 67
    iget-object v3, v3, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 68
    .line 69
    invoke-virtual {v3}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_3

    .line 74
    .line 75
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$headsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 76
    .line 77
    iget-object v4, v3, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 78
    .line 79
    invoke-virtual {v3, v4, v2}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSetSpeaker(Landroid/content/Context;Z)I

    .line 80
    .line 81
    .line 82
    :cond_3
    const/4 v3, 0x5

    .line 83
    if-ge v0, v3, :cond_4

    .line 84
    .line 85
    const-wide/16 v3, 0x3e8

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    const-wide/16 v3, 0xfa0

    .line 89
    .line 90
    :goto_1
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    .line 93
    :catch_0
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    :goto_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "connect headset: do nothing"

    .line 103
    .line 104
    invoke-static {v4, v3, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_6
    return-void
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DEVICE_WIREDHEADSET"

    .line 2
    .line 3
    return-object p0
.end method

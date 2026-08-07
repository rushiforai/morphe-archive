.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$speakerSwitchThread;
.super Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "speakerSwitchThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$speakerSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

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
    if-nez v0, :cond_0

    .line 5
    .line 6
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$speakerSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 15
    .line 16
    iget-object v2, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSetSpeaker(Landroid/content/Context;Z)I

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->updateStatus()V

    .line 22
    .line 23
    .line 24
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsMusicScene:Z

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    const-string v3, "TRAE"

    .line 28
    .line 29
    if-nez v0, :cond_6

    .line 30
    .line 31
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    goto :goto_2

    .line 36
    :cond_1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_7

    .line 45
    .line 46
    const-string p0, "connect speakerPhone: disableDeviceSwitchFlag"

    .line 47
    .line 48
    invoke-static {v3, v2, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v4, " _run:"

    .line 61
    .line 62
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$speakerSwitchThread;->getDeviceName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v4, " _running:"

    .line 73
    .line 74
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-boolean v4, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->_running:Z

    .line 78
    .line 79
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v3, v2, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_3
    const/4 v0, 0x0

    .line 90
    :goto_0
    iget-boolean v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->_running:Z

    .line 91
    .line 92
    if-ne v2, v1, :cond_7

    .line 93
    .line 94
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$speakerSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 97
    .line 98
    invoke-virtual {v2}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eq v2, v1, :cond_4

    .line 103
    .line 104
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$speakerSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 105
    .line 106
    iget-object v3, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 107
    .line 108
    invoke-virtual {v2, v3, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSetSpeaker(Landroid/content/Context;Z)I

    .line 109
    .line 110
    .line 111
    :cond_4
    const/4 v2, 0x5

    .line 112
    if-ge v0, v2, :cond_5

    .line 113
    .line 114
    const-wide/16 v2, 0x3e8

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_5
    const-wide/16 v2, 0xfa0

    .line 118
    .line 119
    :goto_1
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .line 121
    .line 122
    :catch_0
    add-int/lit8 v0, v0, 0x1

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_6
    :goto_2
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_7

    .line 130
    .line 131
    const-string p0, "connect speakerPhone: do nothing"

    .line 132
    .line 133
    invoke-static {v3, v2, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_7
    return-void
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DEVICE_SPEAKERPHONE"

    .line 2
    .line 3
    return-object p0
.end method

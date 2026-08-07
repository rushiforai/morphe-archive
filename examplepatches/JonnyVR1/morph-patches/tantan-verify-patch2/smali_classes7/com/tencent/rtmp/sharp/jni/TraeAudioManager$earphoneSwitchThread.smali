.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$earphoneSwitchThread;
.super Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "earphoneSwitchThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$earphoneSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

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
    .locals 4

    .line 1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$earphoneSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 11
    .line 12
    iget-object v2, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v0, v2, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSetSpeaker(Landroid/content/Context;Z)I

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->updateStatus()V

    .line 18
    .line 19
    .line 20
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    const-string v3, "TRAE"

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_5

    .line 32
    .line 33
    const-string p0, "connect earphone: do nothing"

    .line 34
    .line 35
    invoke-static {v3, v2, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 40
    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const-string p0, "connect earphone: disableDeviceSwitchFlag"

    .line 50
    .line 51
    invoke-static {v3, v2, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    move v0, v1

    .line 56
    :goto_0
    iget-boolean v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->_running:Z

    .line 57
    .line 58
    const/4 v3, 0x1

    .line 59
    if-ne v2, v3, :cond_5

    .line 60
    .line 61
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$earphoneSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$earphoneSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 72
    .line 73
    iget-object v3, v2, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 74
    .line 75
    invoke-virtual {v2, v3, v1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalSetSpeaker(Landroid/content/Context;Z)I

    .line 76
    .line 77
    .line 78
    :cond_3
    const/4 v2, 0x5

    .line 79
    if-ge v0, v2, :cond_4

    .line 80
    .line 81
    const-wide/16 v2, 0x3e8

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    const-wide/16 v2, 0xfa0

    .line 85
    .line 86
    :goto_1
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    add-int/lit8 v0, v0, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    return-void
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DEVICE_EARPHONE"

    .line 2
    .line 3
    return-object p0
.end method

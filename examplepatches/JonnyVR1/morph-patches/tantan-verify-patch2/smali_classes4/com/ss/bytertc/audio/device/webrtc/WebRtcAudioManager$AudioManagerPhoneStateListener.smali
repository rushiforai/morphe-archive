.class public Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioManagerPhoneStateListener"
.end annotation


# instance fields
.field private callState:I

.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->callState:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 5

    .line 1
    const-string p2, "onCallStateChanged, from: "

    .line 2
    .line 3
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->callState:I

    .line 7
    .line 8
    iput p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->callState:I

    .line 9
    .line 10
    const-string v2, "WebRtcAudioManager"

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p2, ", to: "

    .line 21
    .line 22
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {v2, p2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    const/4 p2, 0x2

    .line 38
    const/4 v4, 0x1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    if-eq p1, v4, :cond_0

    .line 42
    .line 43
    if-eq p1, p2, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    if-nez v1, :cond_5

    .line 47
    .line 48
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J

    .line 51
    .line 52
    .line 53
    move-result-wide p1

    .line 54
    cmp-long p1, p1, v2

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    const-string p1, "WebRtcAudioManager"

    .line 59
    .line 60
    const-string p2, "startPhoneCall"

    .line 61
    .line 62
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J

    .line 68
    .line 69
    .line 70
    move-result-wide p1

    .line 71
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$900(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;J)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    const-string p0, "WebRtcAudioManager"

    .line 78
    .line 79
    const-string p1, "nativeAudioManager is null"

    .line 80
    .line 81
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    if-eq v1, v4, :cond_3

    .line 86
    .line 87
    if-ne v1, p2, :cond_5

    .line 88
    .line 89
    :cond_3
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 90
    .line 91
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J

    .line 92
    .line 93
    .line 94
    move-result-wide p1

    .line 95
    cmp-long p1, p1, v2

    .line 96
    .line 97
    if-eqz p1, :cond_4

    .line 98
    .line 99
    const-string p1, "WebRtcAudioManager"

    .line 100
    .line 101
    const-string p2, "endPhoneCall"

    .line 102
    .line 103
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 107
    .line 108
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J

    .line 109
    .line 110
    .line 111
    move-result-wide p1

    .line 112
    invoke-static {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$800(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;J)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_4
    const-string p0, "WebRtcAudioManager"

    .line 117
    .line 118
    const-string p1, "nativeAudioManager is null"

    .line 119
    .line 120
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_5
    :goto_0
    monitor-exit v0

    .line 124
    return-void

    .line 125
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    throw p0
.end method

.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 0

    return-void
.end method

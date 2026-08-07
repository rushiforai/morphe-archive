.class Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->registerPhoneStateListener(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

.field final synthetic val$events:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->val$events:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    const-string v0, "WebRtcAudioManager"

    .line 2
    .line 3
    const-string v1, "registerPhoneStateListener success with event: "

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$1000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 14
    .line 15
    new-instance v3, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 16
    .line 17
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 18
    .line 19
    invoke-direct {v3, v4}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v2, v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$1002(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;)Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception v1

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->val$events:I

    .line 29
    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-static {v2, v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$1100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "phone"

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 49
    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$1000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerPhoneStateListener;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget v4, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->val$events:I

    .line 59
    .line 60
    invoke-virtual {v2, v3, v4}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->val$events:I

    .line 64
    .line 65
    const/16 v3, 0x20

    .line 66
    .line 67
    if-ne v2, v3, :cond_3

    .line 68
    .line 69
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    invoke-static {v2, v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$1100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Z)V

    .line 73
    .line 74
    .line 75
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->val$events:I

    .line 81
    .line 82
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 94
    .line 95
    .line 96
    new-instance v2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v3, "registerPhoneStateListener ("

    .line 99
    .line 100
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;->val$events:I

    .line 104
    .line 105
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p0, "), error: "

    .line 109
    .line 110
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p0, ", "

    .line 121
    .line 122
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

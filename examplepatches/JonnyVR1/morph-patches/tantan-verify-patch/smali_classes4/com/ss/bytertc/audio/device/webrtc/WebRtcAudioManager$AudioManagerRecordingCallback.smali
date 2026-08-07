.class Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;
.super Landroid/media/AudioManager$AudioRecordingCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioManagerRecordingCallback"
.end annotation


# instance fields
.field private manager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/AudioManager$AudioRecordingCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->manager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onRecordingConfigChanged(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/AudioRecordingConfiguration;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/media/AudioManager$AudioRecordingCallback;->onRecordingConfigChanged(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-ge v2, v3, :cond_3

    .line 16
    .line 17
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Landroid/media/AudioRecordingConfiguration;

    .line 22
    .line 23
    new-instance v4, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;

    .line 24
    .line 25
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    invoke-direct {v4, v5, v6}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;-><init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$1;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/media/AudioRecordingConfiguration;->getClientAudioSessionId()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-static {v4, v5}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;->access$102(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;I)I

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/media/AudioRecordingConfiguration;->getClientAudioSource()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    invoke-static {v4, v5}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;->access$202(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;I)I

    .line 43
    .line 44
    .line 45
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 46
    .line 47
    const/4 v6, -0x1

    .line 48
    const/16 v7, 0x1d

    .line 49
    .line 50
    if-lt v5, v7, :cond_0

    .line 51
    .line 52
    invoke-static {v3}, Ll/esp0;->a(Landroid/media/AudioRecordingConfiguration;)I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    move v8, v6

    .line 58
    :goto_1
    invoke-static {v4, v8}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;->access$302(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;I)I

    .line 59
    .line 60
    .line 61
    if-lt v5, v7, :cond_2

    .line 62
    .line 63
    invoke-static {v3}, Ll/fsp0;->a(Landroid/media/AudioRecordingConfiguration;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    const/4 v6, 0x1

    .line 70
    goto :goto_2

    .line 71
    :cond_1
    move v6, v1

    .line 72
    :cond_2
    :goto_2
    invoke-static {v4, v6}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;->access$402(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;I)I

    .line 73
    .line 74
    .line 75
    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    add-int/lit8 v2, v2, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->manager:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 82
    .line 83
    monitor-enter p1

    .line 84
    :try_start_0
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 85
    .line 86
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J

    .line 87
    .line 88
    .line 89
    move-result-wide v1

    .line 90
    const-wide/16 v3, 0x0

    .line 91
    .line 92
    cmp-long v1, v1, v3

    .line 93
    .line 94
    if-eqz v1, :cond_5

    .line 95
    .line 96
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 97
    .line 98
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)Ljava/util/Set;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    if-eqz v1, :cond_4

    .line 103
    .line 104
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 105
    .line 106
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)Ljava/util/Set;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {v1, v0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_5

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :catchall_0
    move-exception p0

    .line 118
    goto :goto_4

    .line 119
    :cond_4
    :goto_3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 120
    .line 121
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    new-array v2, v2, [Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$NativeRecordCallbackInfo;

    .line 126
    .line 127
    invoke-interface {v0, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 132
    .line 133
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;)J

    .line 134
    .line 135
    .line 136
    move-result-wide v3

    .line 137
    invoke-static {v1, v2, v3, v4}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$700(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;[Ljava/lang/Object;J)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager$AudioManagerRecordingCallback;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;

    .line 141
    .line 142
    invoke-static {p0, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;->access$602(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioManager;Ljava/util/Set;)Ljava/util/Set;

    .line 143
    .line 144
    .line 145
    :cond_5
    monitor-exit p1

    .line 146
    return-void

    .line 147
    :goto_4
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    throw p0
.end method

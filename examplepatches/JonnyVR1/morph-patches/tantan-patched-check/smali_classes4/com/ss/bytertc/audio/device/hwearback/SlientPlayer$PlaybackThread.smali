.class Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PlaybackThread"
.end annotation


# instance fields
.field private isStop:Z

.field final synthetic this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->isStop:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public declared-synchronized closeThread()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->isStop:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_1

    .line 14
    :catch_0
    move-exception v0

    .line 15
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    .line 18
    :goto_0
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw v0
.end method

.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$000(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$100(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$200(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$300(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$400(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)Z

    .line 24
    .line 25
    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$400(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 35
    .line 36
    const/16 v1, 0x1a

    .line 37
    .line 38
    if-lt v0, v1, :cond_0

    .line 39
    .line 40
    new-instance v0, Landroid/media/AudioFormat$Builder;

    .line 41
    .line 42
    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$000(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$100(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$200(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {v0, v1}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Landroid/media/AudioAttributes$Builder;

    .line 80
    .line 81
    invoke-direct {v1}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 82
    .line 83
    .line 84
    const/4 v2, 0x3

    .line 85
    invoke-virtual {v1, v2}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    new-instance v2, Landroid/media/AudioTrack$Builder;

    .line 94
    .line 95
    invoke-direct {v2}, Landroid/media/AudioTrack$Builder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2, v0}, Landroid/media/AudioTrack$Builder;->setAudioFormat(Landroid/media/AudioFormat;)Landroid/media/AudioTrack$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0, v1}, Landroid/media/AudioTrack$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioTrack$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 107
    .line 108
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$300(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-virtual {v0, v1}, Landroid/media/AudioTrack$Builder;->setBufferSizeInBytes(I)Landroid/media/AudioTrack$Builder;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/4 v1, 0x2

    .line 117
    invoke-static {v0, v1}, Ll/jsf0;->a(Landroid/media/AudioTrack$Builder;I)Landroid/media/AudioTrack$Builder;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Landroid/media/AudioTrack$Builder;->build()Landroid/media/AudioTrack;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    goto :goto_0

    .line 126
    :cond_0
    new-instance v0, Landroid/media/AudioTrack;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 129
    .line 130
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$000(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 135
    .line 136
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$100(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 141
    .line 142
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$200(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 147
    .line 148
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$300(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    const/4 v6, 0x1

    .line 153
    const/4 v1, 0x3

    .line 154
    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 155
    .line 156
    .line 157
    :goto_0
    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->this$0:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 161
    .line 162
    invoke-static {v1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->access$300(Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    new-array v2, v1, [B

    .line 167
    .line 168
    :goto_1
    iget-boolean v3, p0, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer$PlaybackThread;->isStop:Z

    .line 169
    .line 170
    if-nez v3, :cond_1

    .line 171
    .line 172
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 173
    .line 174
    .line 175
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 176
    if-nez v3, :cond_1

    .line 177
    .line 178
    const/4 v3, 0x0

    .line 179
    :try_start_1
    invoke-virtual {v0, v2, v3, v1}, Landroid/media/AudioTrack;->write([BII)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :catch_0
    :cond_1
    :try_start_2
    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :catch_1
    move-exception v0

    .line 194
    move-object p0, v0

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v1, "SlientPlayer createAudioTrack has exception: "

    .line 198
    .line 199
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    const-string v0, "SlientPlayer"

    .line 214
    .line 215
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    :goto_2
    return-void
.end method

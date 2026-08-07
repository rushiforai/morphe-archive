.class Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/audio/WebRtcAudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioTrackThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method

.method private writeBytes(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p2, p3, p0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "AudioTrackThread"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/momo/rtcbase/audio/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "WebRtcAudioTrackExternal"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v2, 0x3

    .line 40
    const/4 v3, 0x1

    .line 41
    const/4 v4, 0x0

    .line 42
    if-ne v0, v2, :cond_0

    .line 43
    .line 44
    move v0, v3

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v0, v4

    .line 47
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$100(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    :goto_1
    iget-boolean v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 61
    .line 62
    iget-object v5, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 63
    .line 64
    if-eqz v2, :cond_4

    .line 65
    .line 66
    invoke-static {v5}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$300(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)J

    .line 67
    .line 68
    .line 69
    move-result-wide v5

    .line 70
    invoke-static {v5, v6, v0}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$400(JI)V

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 74
    .line 75
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-gt v0, v2, :cond_1

    .line 84
    .line 85
    move v2, v3

    .line 86
    goto :goto_2

    .line 87
    :cond_1
    move v2, v4

    .line 88
    :goto_2
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$100(Z)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 92
    .line 93
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$500(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    .line 99
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 100
    .line 101
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 109
    .line 110
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    iget-object v5, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 115
    .line 116
    invoke-static {v5}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$600(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)[B

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 121
    .line 122
    .line 123
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 124
    .line 125
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    :cond_2
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 133
    .line 134
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    iget-object v5, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 139
    .line 140
    invoke-static {v5}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    invoke-direct {p0, v2, v5, v0}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->writeBytes(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eq v2, v0, :cond_3

    .line 149
    .line 150
    new-instance v5, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v6, "AudioTrack.write played invalid number of bytes: "

    .line 153
    .line 154
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    invoke-static {v1, v5}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    if-gez v2, :cond_3

    .line 168
    .line 169
    iput-boolean v4, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 170
    .line 171
    iget-object v5, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 172
    .line 173
    new-instance v6, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v7, "AudioTrack.write failed: "

    .line 176
    .line 177
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-static {v5, v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$700(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :cond_3
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 191
    .line 192
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 197
    .line 198
    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :cond_4
    invoke-static {v5}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    if-eqz v0, :cond_5

    .line 206
    .line 207
    const-string v0, "Calling AudioTrack.stop..."

    .line 208
    .line 209
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioTrack;

    .line 213
    .line 214
    invoke-static {p0}, Lcom/momo/rtcbase/audio/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 219
    .line 220
    .line 221
    const-string p0, "AudioTrack.stop is done."

    .line 222
    .line 223
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    .line 225
    .line 226
    return-void

    .line 227
    :catch_0
    move-exception p0

    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    const-string v2, "AudioTrack.stop failed: "

    .line 231
    .line 232
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    :cond_5
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioTrackExternal"

    .line 2
    .line 3
    const-string v1, "stopThread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 10
    .line 11
    return-void
.end method

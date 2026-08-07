.class Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioTrackThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

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
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

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
    const-string v1, "WebRtcAudioTrack"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

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
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$100(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

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
    iget-boolean v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 61
    .line 62
    if-eqz v2, :cond_5

    .line 63
    .line 64
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$300()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->getAudioContentType()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eq v2, v5, :cond_1

    .line 73
    .line 74
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 75
    .line 76
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$400(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    iget-object v6, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 81
    .line 82
    invoke-static {v6}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$500(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    invoke-static {v2, v5, v6}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;II)Z

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->getAudioContentType()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$302(I)I

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 97
    .line 98
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$700(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v5

    .line 102
    invoke-static {v2, v0, v5, v6}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$800(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;IJ)V

    .line 103
    .line 104
    .line 105
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 106
    .line 107
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-gt v0, v2, :cond_2

    .line 116
    .line 117
    move v2, v3

    .line 118
    goto :goto_2

    .line 119
    :cond_2
    move v2, v4

    .line 120
    :goto_2
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$100(Z)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$900()Z

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    if-eqz v2, :cond_3

    .line 128
    .line 129
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 130
    .line 131
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 139
    .line 140
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-object v5, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 145
    .line 146
    invoke-static {v5}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$1000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)[B

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 154
    .line 155
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 160
    .line 161
    .line 162
    :cond_3
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 163
    .line 164
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iget-object v5, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 169
    .line 170
    invoke-static {v5}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    invoke-direct {p0, v2, v5, v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->writeBytes(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-eq v2, v0, :cond_4

    .line 179
    .line 180
    new-instance v5, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v6, "AudioTrack.write played invalid number of bytes: "

    .line 183
    .line 184
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-static {v1, v5}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    if-gez v2, :cond_4

    .line 198
    .line 199
    iput-boolean v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 200
    .line 201
    iget-object v5, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 202
    .line 203
    new-instance v6, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v7, "AudioTrack.write failed: "

    .line 206
    .line 207
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-static {v5, v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$1100(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    :cond_4
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 221
    .line 222
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$200(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 227
    .line 228
    .line 229
    goto/16 :goto_1

    .line 230
    .line 231
    :cond_5
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 232
    .line 233
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    if-eqz v0, :cond_6

    .line 238
    .line 239
    const-string v0, "Calling AudioTrack.stop..."

    .line 240
    .line 241
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    :try_start_0
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;

    .line 245
    .line 246
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack;)Landroid/media/AudioTrack;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-virtual {p0}, Landroid/media/AudioTrack;->stop()V

    .line 251
    .line 252
    .line 253
    const-string p0, "AudioTrack.stop is done."

    .line 254
    .line 255
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :catch_0
    move-exception p0

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    const-string v2, "AudioTrack.stop failed: "

    .line 263
    .line 264
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    :cond_6
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioTrack"

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
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioTrack$AudioTrackThread;->keepAlive:Z

    .line 10
    .line 11
    return-void
.end method

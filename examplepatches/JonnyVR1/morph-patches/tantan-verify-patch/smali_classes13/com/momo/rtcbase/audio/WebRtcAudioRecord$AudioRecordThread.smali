.class Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/audio/WebRtcAudioRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRecordThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
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
    const-string v1, "AudioRecordThread"

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
    const-string v1, "WebRtcAudioRecordExternal"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v2, 0x3

    .line 40
    const/4 v3, 0x0

    .line 41
    if-ne v0, v2, :cond_0

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v0, v3

    .line 46
    :goto_0
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$100(Z)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_1
    iget-boolean v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 53
    .line 54
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 63
    .line 64
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object v4, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 69
    .line 70
    invoke-static {v4}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-virtual {v0, v2, v4}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 83
    .line 84
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-ne v0, v2, :cond_4

    .line 93
    .line 94
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 95
    .line 96
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$300(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_2

    .line 101
    .line 102
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 103
    .line 104
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 112
    .line 113
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iget-object v4, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 118
    .line 119
    invoke-static {v4}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$400(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)[B

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    :cond_2
    iget-boolean v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 127
    .line 128
    if-eqz v2, :cond_3

    .line 129
    .line 130
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 131
    .line 132
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$500(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)J

    .line 133
    .line 134
    .line 135
    move-result-wide v4

    .line 136
    invoke-static {v2, v4, v5, v0}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;JI)V

    .line 137
    .line 138
    .line 139
    :cond_3
    iget-object v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 140
    .line 141
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$700(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    if-eqz v0, :cond_1

    .line 146
    .line 147
    iget-object v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 148
    .line 149
    invoke-static {v0}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 158
    .line 159
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    iget-object v4, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 168
    .line 169
    invoke-static {v4}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    iget-object v5, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 178
    .line 179
    invoke-static {v5}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$200(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 180
    .line 181
    .line 182
    move-result-object v5

    .line 183
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    add-int/2addr v4, v5

    .line 188
    invoke-static {v0, v2, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iget-object v2, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 193
    .line 194
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$700(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    new-instance v4, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioSamples;

    .line 199
    .line 200
    iget-object v5, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 201
    .line 202
    invoke-static {v5}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    invoke-virtual {v5}, Landroid/media/AudioRecord;->getAudioFormat()I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    iget-object v6, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 211
    .line 212
    invoke-static {v6}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    invoke-virtual {v6}, Landroid/media/AudioRecord;->getChannelCount()I

    .line 217
    .line 218
    .line 219
    move-result v6

    .line 220
    iget-object v7, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 221
    .line 222
    invoke-static {v7}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    invoke-virtual {v7}, Landroid/media/AudioRecord;->getSampleRate()I

    .line 227
    .line 228
    .line 229
    move-result v7

    .line 230
    invoke-direct {v4, v5, v6, v7, v0}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioSamples;-><init>(III[B)V

    .line 231
    .line 232
    .line 233
    invoke-interface {v2, v4}, Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$SamplesReadyCallback;->onWebRtcAudioRecordSamplesReady(Lcom/momo/rtcbase/audio/JavaAudioDeviceModule$AudioSamples;)V

    .line 234
    .line 235
    .line 236
    goto/16 :goto_1

    .line 237
    .line 238
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    const-string v4, "AudioRecord.read failed: "

    .line 241
    .line 242
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    const/4 v4, -0x3

    .line 256
    if-ne v0, v4, :cond_1

    .line 257
    .line 258
    iput-boolean v3, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 259
    .line 260
    iget-object v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 261
    .line 262
    invoke-static {v0, v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$800(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    goto/16 :goto_1

    .line 266
    .line 267
    :cond_5
    :try_start_0
    invoke-static {v2}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    if-eqz v0, :cond_6

    .line 272
    .line 273
    iget-object p0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/audio/WebRtcAudioRecord;

    .line 274
    .line 275
    invoke-static {p0}, Lcom/momo/rtcbase/audio/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/audio/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-virtual {p0}, Landroid/media/AudioRecord;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :catch_0
    move-exception p0

    .line 284
    goto :goto_2

    .line 285
    :cond_6
    return-void

    .line 286
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    const-string v2, "AudioRecord.stop failed: "

    .line 289
    .line 290
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioRecordExternal"

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
    iput-boolean v0, p0, Lcom/momo/rtcbase/audio/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 10
    .line 11
    return-void
.end method

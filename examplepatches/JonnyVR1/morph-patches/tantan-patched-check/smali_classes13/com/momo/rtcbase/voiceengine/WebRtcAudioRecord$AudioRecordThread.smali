.class Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRecordThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

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
    const-string v1, "WebRtcAudioRecord"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

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
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$100(Z)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_1
    iget-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 53
    .line 54
    if-eqz v0, :cond_7

    .line 55
    .line 56
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$200()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->getAudioSource()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eq v0, v2, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$300(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iget-object v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 73
    .line 74
    invoke-static {v4}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$400(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {v0, v2, v4}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$500(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;II)I

    .line 79
    .line 80
    .line 81
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->getAudioSource()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$202(I)I

    .line 86
    .line 87
    .line 88
    :cond_2
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    const-string v0, "AudioRecord creat failed:"

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    goto/16 :goto_2

    .line 102
    .line 103
    :cond_3
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 104
    .line 105
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 110
    .line 111
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget-object v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 116
    .line 117
    invoke-static {v4}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v4}, Ljava/nio/Buffer;->capacity()I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    invoke-virtual {v0, v2, v4}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 130
    .line 131
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-ne v0, v2, :cond_6

    .line 140
    .line 141
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$700()Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_4

    .line 146
    .line 147
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 148
    .line 149
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 157
    .line 158
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    iget-object v4, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 163
    .line 164
    invoke-static {v4}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$800(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)[B

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    .line 171
    :cond_4
    iget-boolean v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 172
    .line 173
    if-eqz v2, :cond_5

    .line 174
    .line 175
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 176
    .line 177
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$900(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)J

    .line 178
    .line 179
    .line 180
    move-result-wide v4

    .line 181
    invoke-static {v2, v0, v4, v5}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$1000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;IJ)V

    .line 182
    .line 183
    .line 184
    :cond_5
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$1100()Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    if-eqz v0, :cond_1

    .line 189
    .line 190
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 191
    .line 192
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iget-object v2, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 201
    .line 202
    invoke-static {v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$600(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-static {}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$1100()Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    new-instance v4, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioSamples;

    .line 219
    .line 220
    iget-object v5, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 221
    .line 222
    invoke-static {v5}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    const/4 v6, 0x0

    .line 227
    invoke-direct {v4, v5, v0, v6}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioSamples;-><init>(Landroid/media/AudioRecord;[BLcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$1;)V

    .line 228
    .line 229
    .line 230
    invoke-interface {v2, v4}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;->onWebRtcAudioRecordSamplesReady(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioSamples;)V

    .line 231
    .line 232
    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 236
    .line 237
    const-string v4, "AudioRecord.read failed: "

    .line 238
    .line 239
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-static {v1, v2}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    const/4 v4, -0x3

    .line 253
    if-ne v0, v4, :cond_1

    .line 254
    .line 255
    iput-boolean v3, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 256
    .line 257
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 258
    .line 259
    invoke-static {v0, v2}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$1300(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    goto/16 :goto_1

    .line 263
    .line 264
    :cond_7
    :goto_2
    :try_start_0
    iget-object v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 265
    .line 266
    invoke-static {v0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    if-eqz v0, :cond_8

    .line 271
    .line 272
    iget-object p0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;

    .line 273
    .line 274
    invoke-static {p0}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->access$000(Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-virtual {p0}, Landroid/media/AudioRecord;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :catch_0
    move-exception p0

    .line 283
    goto :goto_3

    .line 284
    :cond_8
    return-void

    .line 285
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    const-string v2, "AudioRecord.stop failed: "

    .line 288
    .line 289
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    invoke-static {v1, p0}, Lcom/momo/rtcbase/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioRecord"

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
    iput-boolean v0, p0, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 10
    .line 11
    return-void
.end method

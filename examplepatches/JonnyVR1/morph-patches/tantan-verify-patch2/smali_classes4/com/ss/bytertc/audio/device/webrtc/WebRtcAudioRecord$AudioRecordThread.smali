.class Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRecordThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    const-string v0, "WebRtcAudioRecord"

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "AudioRecordThread"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v2, 0x3

    .line 49
    if-eq v0, v2, :cond_2

    .line 50
    .line 51
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "AudioRecord.run failed: incorrect state :"

    .line 54
    .line 55
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 59
    .line 60
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    const-string v2, "null"

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 70
    .line 71
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const-string v2, "WebRtcAudioRecord"

    .line 91
    .line 92
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 96
    .line 97
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 98
    .line 99
    invoke-static {v2, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 103
    .line 104
    .line 105
    :cond_3
    :goto_1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 106
    .line 107
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 108
    .line 109
    if-eqz v0, :cond_8

    .line 110
    .line 111
    :try_start_0
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 116
    .line 117
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 122
    .line 123
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    invoke-virtual {v0, v2, v3}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    .line 132
    .line 133
    .line 134
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    goto :goto_2

    .line 136
    :catch_0
    move-exception v0

    .line 137
    const-string v2, "WebRtcAudioRecord"

    .line 138
    .line 139
    new-instance v3, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    const-string v4, "audioRecord.read failed: "

    .line 142
    .line 143
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 161
    .line 162
    const/4 v0, -0x1

    .line 163
    :goto_2
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 164
    .line 165
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-ne v0, v2, :cond_6

    .line 174
    .line 175
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$300()Z

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    if-eqz v2, :cond_4

    .line 180
    .line 181
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 182
    .line 183
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 188
    .line 189
    .line 190
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 191
    .line 192
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 197
    .line 198
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$400(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)[B

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 203
    .line 204
    .line 205
    :cond_4
    monitor-enter p0

    .line 206
    :try_start_1
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 207
    .line 208
    if-eqz v2, :cond_5

    .line 209
    .line 210
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 211
    .line 212
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$500(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)J

    .line 213
    .line 214
    .line 215
    move-result-wide v3

    .line 216
    invoke-static {v2, v0, v3, v4}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$600(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;IJ)V

    .line 217
    .line 218
    .line 219
    goto :goto_3

    .line 220
    :catchall_0
    move-exception v0

    .line 221
    goto :goto_4

    .line 222
    :cond_5
    :goto_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$700()Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    if-eqz v0, :cond_3

    .line 228
    .line 229
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 230
    .line 231
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 240
    .line 241
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$200(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-static {}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$700()Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    new-instance v3, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;

    .line 258
    .line 259
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 260
    .line 261
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    const/4 v5, 0x0

    .line 266
    invoke-direct {v3, v4, v0, v5}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;-><init>(Landroid/media/AudioRecord;[BLcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$1;)V

    .line 267
    .line 268
    .line 269
    invoke-interface {v2, v3}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;->onWebRtcAudioRecordSamplesReady(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;)V

    .line 270
    .line 271
    .line 272
    goto/16 :goto_1

    .line 273
    .line 274
    :goto_4
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 275
    throw v0

    .line 276
    :cond_6
    const/4 v2, -0x3

    .line 277
    if-eq v0, v2, :cond_7

    .line 278
    .line 279
    const/4 v2, -0x6

    .line 280
    if-ne v0, v2, :cond_3

    .line 281
    .line 282
    :cond_7
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 283
    .line 284
    new-instance v2, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    const-string v3, "AudioRecord.read failed: "

    .line 287
    .line 288
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    const-string v2, "WebRtcAudioRecord"

    .line 299
    .line 300
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 304
    .line 305
    invoke-static {v2, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$100(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    goto/16 :goto_1

    .line 309
    .line 310
    :cond_8
    :try_start_3
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    if-eqz v0, :cond_9

    .line 315
    .line 316
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->this$0:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;

    .line 317
    .line 318
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;->access$000(Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    invoke-virtual {p0}, Landroid/media/AudioRecord;->stop()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 323
    .line 324
    .line 325
    goto :goto_5

    .line 326
    :catch_1
    move-exception p0

    .line 327
    const-string v0, "WebRtcAudioRecord"

    .line 328
    .line 329
    new-instance v1, Ljava/lang/StringBuilder;

    .line 330
    .line 331
    const-string v2, "AudioRecord.stop failed: "

    .line 332
    .line 333
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    .line 349
    .line 350
    :cond_9
    :goto_5
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "WebRtcAudioRecord"

    .line 3
    .line 4
    const-string v1, "stopThread"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw v0
.end method

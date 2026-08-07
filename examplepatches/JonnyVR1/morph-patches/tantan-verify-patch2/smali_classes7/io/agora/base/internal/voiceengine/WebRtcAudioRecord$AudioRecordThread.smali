.class Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRecordThread"
.end annotation


# instance fields
.field private volatile keepAlive:Z

.field final synthetic this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

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
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioUtils;->getThreadInfo()Ljava/lang/String;

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
    const-string v1, "WebRtcAudioRecord [JavaAdm]"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 30
    .line 31
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

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
    const/4 v4, 0x1

    .line 42
    if-ne v0, v2, :cond_0

    .line 43
    .line 44
    move v0, v4

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v0, v3

    .line 47
    :goto_0
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$100(Z)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 51
    .line 52
    .line 53
    :goto_1
    iget-boolean v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 54
    .line 55
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 56
    .line 57
    if-eqz v0, :cond_7

    .line 58
    .line 59
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 64
    .line 65
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 70
    .line 71
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    invoke-virtual {v0, v2, v5}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 84
    .line 85
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-ne v0, v2, :cond_3

    .line 94
    .line 95
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$300()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_1

    .line 100
    .line 101
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 102
    .line 103
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 108
    .line 109
    .line 110
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 111
    .line 112
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 117
    .line 118
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$400(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)[B

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    .line 125
    :cond_1
    iget-boolean v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 126
    .line 127
    if-eqz v2, :cond_2

    .line 128
    .line 129
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 130
    .line 131
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$500(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)I

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    iget-object v6, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 136
    .line 137
    invoke-static {v6}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$600(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)J

    .line 138
    .line 139
    .line 140
    move-result-wide v6

    .line 141
    invoke-static {v2, v0, v5, v6, v7}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$700(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;IIJ)V

    .line 142
    .line 143
    .line 144
    :cond_2
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$800()Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    if-eqz v2, :cond_4

    .line 149
    .line 150
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 151
    .line 152
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 161
    .line 162
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Ljava/nio/ByteBuffer;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-virtual {v5}, Ljava/nio/Buffer;->capacity()I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    invoke-static {v2, v5}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-static {}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$800()Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    new-instance v6, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioSamples;

    .line 179
    .line 180
    iget-object v7, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 181
    .line 182
    invoke-static {v7}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    const/4 v8, 0x0

    .line 187
    invoke-direct {v6, v7, v2, v8}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioSamples;-><init>(Landroid/media/AudioRecord;[BLio/agora/base/internal/voiceengine/WebRtcAudioRecord$1;)V

    .line 188
    .line 189
    .line 190
    invoke-interface {v5, v6}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$WebRtcAudioRecordSamplesReadyCallback;->onWebRtcAudioRecordSamplesReady(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioSamples;)V

    .line 191
    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    const-string v5, "AudioRecord.read failed: "

    .line 197
    .line 198
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    const/4 v5, -0x3

    .line 212
    if-ne v0, v5, :cond_4

    .line 213
    .line 214
    iput-boolean v3, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 215
    .line 216
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 217
    .line 218
    invoke-static {v5, v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1000(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    :cond_4
    :goto_2
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 222
    .line 223
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1100(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)J

    .line 224
    .line 225
    .line 226
    move-result-wide v5

    .line 227
    const-wide/16 v7, 0x0

    .line 228
    .line 229
    cmp-long v2, v5, v7

    .line 230
    .line 231
    if-nez v2, :cond_5

    .line 232
    .line 233
    new-instance v2, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    const-string v5, "AudioRecordThread read first frame : "

    .line 236
    .line 237
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 241
    .line 242
    invoke-static {v5}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)I

    .line 243
    .line 244
    .line 245
    move-result v5

    .line 246
    div-int v5, v0, v5

    .line 247
    .line 248
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    const-string v5, " finished. "

    .line 252
    .line 253
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    :cond_5
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 264
    .line 265
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1200(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)I

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    div-int/2addr v0, v5

    .line 270
    int-to-long v5, v0

    .line 271
    invoke-static {v2, v5, v6}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1114(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;J)J

    .line 272
    .line 273
    .line 274
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 275
    .line 276
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1300(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)I

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    rem-int/lit8 v0, v0, 0x28

    .line 281
    .line 282
    if-nez v0, :cond_6

    .line 283
    .line 284
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 285
    .line 286
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1400(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)I

    .line 287
    .line 288
    .line 289
    goto :goto_3

    .line 290
    :catchall_0
    move-exception v0

    .line 291
    goto :goto_4

    .line 292
    :cond_6
    :goto_3
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 293
    .line 294
    invoke-static {v0}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1300(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)I

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    add-int/2addr v2, v4

    .line 299
    rem-int/lit8 v2, v2, 0x28

    .line 300
    .line 301
    invoke-static {v0, v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$1302(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    .line 303
    .line 304
    goto/16 :goto_1

    .line 305
    .line 306
    :goto_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    const-string v5, "calculateLatencyMillis failed: "

    .line 309
    .line 310
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    goto/16 :goto_1

    .line 328
    .line 329
    :cond_7
    :try_start_1
    invoke-static {v2}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    if-eqz v0, :cond_8

    .line 334
    .line 335
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->this$0:Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;

    .line 336
    .line 337
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;->access$000(Lio/agora/base/internal/voiceengine/WebRtcAudioRecord;)Landroid/media/AudioRecord;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    invoke-virtual {p0}, Landroid/media/AudioRecord;->stop()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 342
    .line 343
    .line 344
    goto :goto_5

    .line 345
    :catch_0
    move-exception p0

    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    .line 347
    .line 348
    const-string v2, "AudioRecord.stop failed: "

    .line 349
    .line 350
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    :cond_8
    :goto_5
    return-void
.end method

.method public stopThread()V
    .locals 2

    .line 1
    const-string v0, "WebRtcAudioRecord [JavaAdm]"

    .line 2
    .line 3
    const-string v1, "stopThread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/WebRtcAudioRecord$AudioRecordThread;->keepAlive:Z

    .line 10
    .line 11
    return-void
.end method

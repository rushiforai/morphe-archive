.class Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioEncoderRunnable"
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 4
    .line 5
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 12
    .line 13
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-static {v0, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 24
    .line 25
    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    const/4 v5, 0x0

    .line 29
    move-wide v7, v3

    .line 30
    :goto_0
    move-object v6, v5

    .line 31
    :cond_1
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v9, "streamerCameraProducer"

    .line 36
    .line 37
    if-nez v0, :cond_c

    .line 38
    .line 39
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 40
    .line 41
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_c

    .line 46
    .line 47
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 48
    .line 49
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    goto/16 :goto_7

    .line 56
    .line 57
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v10, "mAudioProcess.take over"

    .line 60
    .line 61
    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 65
    .line 66
    iget-byte v10, v10, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 67
    .line 68
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v9, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    :try_start_0
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 79
    .line 80
    iget-byte v10, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 81
    .line 82
    const-wide/16 v11, 0x3e8

    .line 83
    .line 84
    const/4 v13, 0x0

    .line 85
    if-eq v10, v2, :cond_8

    .line 86
    .line 87
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->take()Ll/oxd0;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    if-eqz v6, :cond_1

    .line 96
    .line 97
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 98
    .line 99
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 100
    .line 101
    const-wide/16 v14, 0x2710

    .line 102
    .line 103
    invoke-virtual {v0, v14, v15}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-ltz v0, :cond_7

    .line 108
    .line 109
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 110
    .line 111
    invoke-static {v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 112
    .line 113
    .line 114
    move-result-object v10

    .line 115
    if-eqz v10, :cond_3

    .line 116
    .line 117
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 118
    .line 119
    invoke-static {v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 120
    .line 121
    .line 122
    move-result v10

    .line 123
    if-nez v10, :cond_4

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :catch_0
    move-exception v0

    .line 127
    goto/16 :goto_6

    .line 128
    .line 129
    :cond_3
    :goto_2
    iget-object v14, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 130
    .line 131
    iget-object v10, v6, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->array()[B

    .line 134
    .line 135
    .line 136
    move-result-object v17

    .line 137
    const v18, 0xac44

    .line 138
    .line 139
    .line 140
    const/16 v19, 0x0

    .line 141
    .line 142
    const-wide/16 v15, 0x0

    .line 143
    .line 144
    invoke-virtual/range {v14 .. v19}, Lcom/immomo/mediacore/strinf/confrenceHelp;->postPcmData(J[BIZ)V

    .line 145
    .line 146
    .line 147
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 148
    .line 149
    iget-object v14, v6, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->array()[B

    .line 152
    .line 153
    .line 154
    move-result-object v14

    .line 155
    const v15, 0xac44

    .line 156
    .line 157
    .line 158
    invoke-virtual {v10, v14, v15, v13}, Lcom/immomo/mediacore/strinf/confrenceHelp;->postRecordFrame([BIZ)V

    .line 159
    .line 160
    .line 161
    :cond_4
    iget-object v10, v6, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 162
    .line 163
    if-eqz v10, :cond_5

    .line 164
    .line 165
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 166
    .line 167
    invoke-static {v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    move-result-object v10

    .line 171
    aget-object v10, v10, v0

    .line 172
    .line 173
    iget-object v13, v6, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    invoke-virtual {v10, v13}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 176
    .line 177
    .line 178
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 179
    .line 180
    invoke-static {v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[Ljava/nio/ByteBuffer;

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    aget-object v10, v10, v0

    .line 185
    .line 186
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 187
    .line 188
    .line 189
    :cond_5
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 190
    .line 191
    invoke-static {v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 192
    .line 193
    .line 194
    move-result-wide v13

    .line 195
    cmp-long v10, v13, v3

    .line 196
    .line 197
    if-nez v10, :cond_6

    .line 198
    .line 199
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 200
    .line 201
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 202
    .line 203
    .line 204
    move-result-wide v13

    .line 205
    div-long/2addr v13, v11

    .line 206
    invoke-static {v10, v13, v14}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R(Ltv/danmaku/ijk/media/streamer/StreamProducer;J)J

    .line 207
    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 211
    .line 212
    .line 213
    iget-object v10, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 214
    .line 215
    invoke-static {v10}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 216
    .line 217
    .line 218
    :goto_3
    new-instance v10, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .line 222
    .line 223
    const-string v11, "mAudioCodec.queueInputBuffer bufferIndex"

    .line 224
    .line 225
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    const-string v11, "mMediaCodecInputBuffers:"

    .line 232
    .line 233
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    iget-object v11, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 237
    .line 238
    invoke-static {v11}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[Ljava/nio/ByteBuffer;

    .line 239
    .line 240
    .line 241
    move-result-object v11

    .line 242
    aget-object v11, v11, v0

    .line 243
    .line 244
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v10

    .line 251
    invoke-static {v9, v10}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    .line 253
    .line 254
    iget-object v9, v6, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 255
    .line 256
    invoke-virtual {v9}, Ljava/nio/Buffer;->limit()I

    .line 257
    .line 258
    .line 259
    move-result v19

    .line 260
    iget-object v9, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 261
    .line 262
    iget-object v9, v9, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 263
    .line 264
    invoke-virtual {v6}, Ll/oxd0;->d()J

    .line 265
    .line 266
    .line 267
    move-result-wide v20

    .line 268
    const/16 v22, 0x0

    .line 269
    .line 270
    const/16 v18, 0x0

    .line 271
    .line 272
    move/from16 v17, v0

    .line 273
    .line 274
    move-object/from16 v16, v9

    .line 275
    .line 276
    invoke-virtual/range {v16 .. v22}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 277
    .line 278
    .line 279
    move/from16 v0, v19

    .line 280
    .line 281
    int-to-long v9, v0

    .line 282
    add-long/2addr v7, v9

    .line 283
    goto :goto_4

    .line 284
    :cond_7
    const-string v0, "zjl found mAudioCodec no input buffer"

    .line 285
    .line 286
    invoke-static {v9, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    .line 288
    .line 289
    :goto_4
    invoke-virtual {v6}, Ll/oxd0;->f()V

    .line 290
    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :cond_8
    iget-object v10, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 295
    .line 296
    const/16 v14, 0x800

    .line 297
    .line 298
    if-nez v10, :cond_9

    .line 299
    .line 300
    invoke-static {v14}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 301
    .line 302
    .line 303
    move-result-object v10

    .line 304
    iput-object v10, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 305
    .line 306
    :cond_9
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 307
    .line 308
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 309
    .line 310
    invoke-virtual {v0, v13}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 311
    .line 312
    .line 313
    :goto_5
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 314
    .line 315
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    if-lt v14, v0, :cond_b

    .line 320
    .line 321
    new-instance v0, Ljava/lang/StringBuilder;

    .line 322
    .line 323
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 324
    .line 325
    .line 326
    const-string v10, "soft loop pos"

    .line 327
    .line 328
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-static {v9, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    .line 340
    .line 341
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 342
    .line 343
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->take()Ll/oxd0;

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    if-eqz v6, :cond_a

    .line 352
    .line 353
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 354
    .line 355
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 356
    .line 357
    invoke-virtual {v6}, Ll/oxd0;->b()Ljava/nio/ByteBuffer;

    .line 358
    .line 359
    .line 360
    move-result-object v10

    .line 361
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 362
    .line 363
    .line 364
    :cond_a
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 365
    .line 366
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    sub-int/2addr v14, v0

    .line 371
    goto :goto_5

    .line 372
    :cond_b
    const-wide/16 v9, 0x800

    .line 373
    .line 374
    add-long/2addr v7, v9

    .line 375
    invoke-static {v7, v8}, Ltv/danmaku/ijk/media/streamer/Util;->b(J)J

    .line 376
    .line 377
    .line 378
    move-result-wide v9

    .line 379
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 380
    .line 381
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    if-eqz v0, :cond_1

    .line 386
    .line 387
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 388
    .line 389
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 390
    .line 391
    .line 392
    move-result-object v13

    .line 393
    div-long v14, v9, v11

    .line 394
    .line 395
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 396
    .line 397
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 398
    .line 399
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 400
    .line 401
    .line 402
    move-result v9

    .line 403
    int-to-long v9, v9

    .line 404
    move-object/from16 v16, v0

    .line 405
    .line 406
    move-wide/from16 v17, v9

    .line 407
    .line 408
    invoke-virtual/range {v13 .. v18}, Lcom/immomo/mediacore/sink/SinkBase;->writeAudio(JLjava/nio/ByteBuffer;J)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 409
    .line 410
    .line 411
    goto/16 :goto_1

    .line 412
    .line 413
    :goto_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 414
    .line 415
    .line 416
    goto/16 :goto_1

    .line 417
    .line 418
    :cond_c
    :goto_7
    if-eqz v6, :cond_d

    .line 419
    .line 420
    invoke-virtual {v6}, Ll/oxd0;->f()V

    .line 421
    .line 422
    .line 423
    :cond_d
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 424
    .line 425
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    if-eqz v0, :cond_e

    .line 430
    .line 431
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 432
    .line 433
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 438
    .line 439
    .line 440
    :cond_e
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 441
    .line 442
    iput-object v5, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 443
    .line 444
    const-string v0, "zjl found Thread 1 over"

    .line 445
    .line 446
    invoke-static {v9, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    .line 448
    .line 449
    return-void
.end method

.class public Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;
.super Ltv/danmaku/ijk/media/processing/encodec/MuxBase;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# instance fields
.field public final v:Ljava/lang/String;

.field private w:J

.field private x:J

.field private y:J


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;-><init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "MediaCodecAudioMux"

    .line 5
    .line 6
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->v:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 p1, 0x0

    .line 9
    .line 10
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->w:J

    .line 11
    .line 12
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->x:J

    .line 13
    .line 14
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->y:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public c()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_6

    .line 6
    .line 7
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_6

    .line 12
    .line 13
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h:Z

    .line 14
    .line 15
    if-nez v0, :cond_6

    .line 16
    .line 17
    const-string v0, "MediaCodecAudioMux"

    .line 18
    .line 19
    const-string v3, "dequeueOutputBuffer :"

    .line 20
    .line 21
    invoke-static {v0, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 25
    .line 26
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 27
    .line 28
    const-wide/32 v4, 0x7a120

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v3, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 36
    .line 37
    const-string v0, "MediaCodecAudioMux"

    .line 38
    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v4, "dequeueOutputBuffer :"

    .line 45
    .line 46
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget v4, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 50
    .line 51
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v0, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    iget v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 62
    .line 63
    if-ltz v0, :cond_2

    .line 64
    .line 65
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e:[Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    aget-object v0, v3, v0

    .line 68
    .line 69
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 72
    .line 73
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 76
    .line 77
    .line 78
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->x:J

    .line 79
    .line 80
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 81
    .line 82
    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 83
    .line 84
    int-to-long v5, v5

    .line 85
    add-long/2addr v3, v5

    .line 86
    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 87
    .line 88
    int-to-long v5, v5

    .line 89
    sub-long/2addr v3, v5

    .line 90
    iput-wide v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->x:J

    .line 91
    .line 92
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 93
    .line 94
    and-int/lit8 v0, v0, 0x2

    .line 95
    .line 96
    if-eqz v0, :cond_1

    .line 97
    .line 98
    const-string v0, "MediaCodecAudioMux"

    .line 99
    .line 100
    new-instance v3, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v4, "encoderAudio metadata : "

    .line 106
    .line 107
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget v4, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 111
    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-static {v0, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 123
    .line 124
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 125
    .line 126
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 127
    .line 128
    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    sub-int/2addr v0, v3

    .line 133
    const-string v3, "MediaCodecAudioMux"

    .line 134
    .line 135
    new-instance v4, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    const-string v5, "encoderAudio metadata : "

    .line 141
    .line 142
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 146
    .line 147
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v5, ";len:"

    .line 151
    .line 152
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    invoke-static {v3, v4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    new-array v3, v0, [B

    .line 166
    .line 167
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 170
    .line 171
    .line 172
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 180
    .line 181
    .line 182
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->r:Ljava/lang/Object;

    .line 183
    .line 184
    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    :try_start_1
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->q:Lcom/immomo/mediacore/sink/SinkBase;

    .line 186
    .line 187
    if-eqz v5, :cond_0

    .line 188
    .line 189
    int-to-long v6, v0

    .line 190
    invoke-virtual {v5, v4, v6, v7}, Lcom/immomo/mediacore/sink/SinkBase;->writeAudioExtradata(Ljava/nio/ByteBuffer;J)V

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :catchall_0
    move-exception v0

    .line 195
    move-object p0, v0

    .line 196
    goto :goto_2

    .line 197
    :cond_0
    :goto_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    :try_start_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 199
    .line 200
    iget v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 201
    .line 202
    invoke-virtual {v0, v3, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 203
    .line 204
    .line 205
    iput-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 206
    .line 207
    return-void

    .line 208
    :goto_2
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 209
    :try_start_4
    throw p0

    .line 210
    :cond_1
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->w:J

    .line 211
    .line 212
    const-wide/16 v5, 0x0

    .line 213
    .line 214
    cmp-long v0, v3, v5

    .line 215
    .line 216
    if-nez v0, :cond_6

    .line 217
    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 219
    .line 220
    .line 221
    move-result-wide v3

    .line 222
    iput-wide v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->w:J

    .line 223
    .line 224
    goto :goto_3

    .line 225
    :cond_2
    const/4 v3, -0x3

    .line 226
    if-ne v0, v3, :cond_3

    .line 227
    .line 228
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 229
    .line 230
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e:[Ljava/nio/ByteBuffer;

    .line 235
    .line 236
    const-string v0, "MediaCodecAudioMux"

    .line 237
    .line 238
    const-string v3, "INFO_OUTPUT_BUFFERS_CHANGED"

    .line 239
    .line 240
    invoke-static {v0, v3}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :cond_3
    const/4 v3, -0x2

    .line 246
    if-ne v0, v3, :cond_4

    .line 247
    .line 248
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 249
    .line 250
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->b:Landroid/media/MediaFormat;

    .line 255
    .line 256
    const-string v3, "MediaCodecAudioMux"

    .line 257
    .line 258
    invoke-virtual {v0}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-static {v3, v0}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :cond_4
    const/4 v3, -0x1

    .line 268
    if-ne v0, v3, :cond_5

    .line 269
    .line 270
    const-string v0, "MediaCodecAudioMux"

    .line 271
    .line 272
    const-string v3, "No buffer available..."

    .line 273
    .line 274
    invoke-static {v0, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :cond_5
    const-string v0, "MediaCodecAudioMux"

    .line 280
    .line 281
    new-instance v3, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 284
    .line 285
    .line 286
    const-string v4, "Message: "

    .line 287
    .line 288
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    iget v4, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 292
    .line 293
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    invoke-static {v0, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_6
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 306
    .line 307
    if-nez v0, :cond_7

    .line 308
    .line 309
    return-void

    .line 310
    :cond_7
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 311
    .line 312
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 313
    .line 314
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    sub-int v6, v3, v0

    .line 319
    .line 320
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 321
    .line 322
    .line 323
    move-result-object v5

    .line 324
    new-array v0, v6, [B

    .line 325
    .line 326
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 327
    .line 328
    invoke-virtual {v3, v0, v2, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 335
    .line 336
    .line 337
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 338
    .line 339
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 344
    .line 345
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 346
    .line 347
    if-lt v0, v3, :cond_8

    .line 348
    .line 349
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 350
    .line 351
    iget v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 352
    .line 353
    invoke-virtual {v0, v3, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 354
    .line 355
    .line 356
    iput-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 357
    .line 358
    :cond_8
    const-string v0, "MediaCodecAudioMux"

    .line 359
    .line 360
    new-instance v1, Ljava/lang/StringBuilder;

    .line 361
    .line 362
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 363
    .line 364
    .line 365
    const-string v2, "audio mux !"

    .line 366
    .line 367
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    const-string v2, "presentationTimeUs"

    .line 374
    .line 375
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 379
    .line 380
    iget-wide v2, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 381
    .line 382
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    .line 391
    .line 392
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 393
    .line 394
    iget-wide v7, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 395
    .line 396
    const/4 v9, 0x0

    .line 397
    move-object v4, p0

    .line 398
    invoke-virtual/range {v4 .. v9}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->p(Ljava/nio/ByteBuffer;IJI)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 399
    .line 400
    .line 401
    return-void

    .line 402
    :catch_0
    move-exception v0

    .line 403
    move-object p0, v0

    .line 404
    const-string v0, "MediaCodecAudioMux"

    .line 405
    .line 406
    const-string v1, "MediaCodecAudioMux error !"

    .line 407
    .line 408
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    .line 410
    .line 411
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 412
    .line 413
    .line 414
    return-void
.end method

.method public n()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->x:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public o()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->w:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public p(Ljava/nio/ByteBuffer;IJI)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->y:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iput-wide p3, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->y:J

    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->r:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v1

    .line 14
    move-object v0, p0

    .line 15
    :try_start_0
    iget-object p0, v0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->q:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    iget-wide v2, v0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->y:J

    .line 18
    .line 19
    sub-long/2addr p3, v2

    .line 20
    const-wide/16 v2, 0x3e8

    .line 21
    .line 22
    div-long/2addr p3, v2

    .line 23
    move-wide v4, p3

    .line 24
    move-object p3, p1

    .line 25
    move p4, p2

    .line 26
    move-wide p1, v4

    .line 27
    invoke-virtual/range {p0 .. p5}, Lcom/immomo/mediacore/sink/SinkBase;->writeAudioPacket(JLjava/nio/ByteBuffer;II)V

    .line 28
    .line 29
    .line 30
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw p0
.end method

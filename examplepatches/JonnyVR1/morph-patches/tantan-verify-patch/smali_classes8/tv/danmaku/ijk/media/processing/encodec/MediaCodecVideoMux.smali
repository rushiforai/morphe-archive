.class public Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;
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

.field private z:J


# direct methods
.method public constructor <init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;-><init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "MediaCodecVideoMux"

    .line 5
    .line 6
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->v:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 p1, 0x0

    .line 9
    .line 10
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->w:J

    .line 11
    .line 12
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->x:J

    .line 13
    .line 14
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->y:J

    .line 15
    .line 16
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->z:J

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public c()V
    .locals 13
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
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    const/4 v4, 0x0

    .line 7
    if-nez v0, :cond_9

    .line 8
    .line 9
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_9

    .line 14
    .line 15
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h:Z

    .line 16
    .line 17
    if-nez v0, :cond_9

    .line 18
    .line 19
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 20
    .line 21
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 22
    .line 23
    const-wide/32 v6, 0x7a120

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v5, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 31
    .line 32
    if-ltz v0, :cond_5

    .line 33
    .line 34
    const-string v0, "MediaCodecVideoMux"

    .line 35
    .line 36
    new-instance v5, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v6, "Index: "

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 47
    .line 48
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v6, " Time: "

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 57
    .line 58
    iget-wide v6, v6, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 59
    .line 60
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v6, " size: "

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 69
    .line 70
    iget v6, v6, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 71
    .line 72
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-static {v0, v5}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e:[Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    iget v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 85
    .line 86
    aget-object v0, v0, v5

    .line 87
    .line 88
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 91
    .line 92
    .line 93
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->y:J

    .line 94
    .line 95
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 96
    .line 97
    iget v7, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 98
    .line 99
    int-to-long v7, v7

    .line 100
    add-long/2addr v5, v7

    .line 101
    iget v7, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 102
    .line 103
    int-to-long v7, v7

    .line 104
    sub-long/2addr v5, v7

    .line 105
    iput-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->y:J

    .line 106
    .line 107
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 108
    .line 109
    and-int/lit8 v0, v0, 0x2

    .line 110
    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    const-string v0, "MediaCodecVideoMux"

    .line 114
    .line 115
    new-instance v5, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    const-string v6, "encoderVideo  metadata : "

    .line 121
    .line 122
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 126
    .line 127
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-static {v0, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 138
    .line 139
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 140
    .line 141
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/nio/Buffer;->position()I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    sub-int/2addr v0, v5

    .line 148
    new-array v5, v0, [B

    .line 149
    .line 150
    iput-object v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l:[B

    .line 151
    .line 152
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    new-array v6, v0, [B

    .line 157
    .line 158
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    invoke-virtual {v7, v6}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    .line 163
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    invoke-virtual {v7, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 166
    .line 167
    .line 168
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    iget-object v8, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l:[B

    .line 171
    .line 172
    invoke-virtual {v7, v8, v4, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    move v7, v4

    .line 176
    move v8, v7

    .line 177
    move v9, v8

    .line 178
    :goto_1
    iget-object v10, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 179
    .line 180
    iget v10, v10, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 181
    .line 182
    if-ge v1, v10, :cond_1

    .line 183
    .line 184
    const-string v10, "MediaCodecVideoMux"

    .line 185
    .line 186
    new-instance v11, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .line 190
    .line 191
    const-string v12, "configdta"

    .line 192
    .line 193
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    aget-byte v12, v6, v1

    .line 197
    .line 198
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v11

    .line 205
    invoke-static {v10, v11}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    aget-byte v10, v6, v1

    .line 209
    .line 210
    if-nez v10, :cond_0

    .line 211
    .line 212
    add-int/lit8 v10, v1, 0x1

    .line 213
    .line 214
    aget-byte v10, v6, v10

    .line 215
    .line 216
    if-nez v10, :cond_0

    .line 217
    .line 218
    add-int/lit8 v10, v1, 0x2

    .line 219
    .line 220
    aget-byte v10, v6, v10

    .line 221
    .line 222
    if-nez v10, :cond_0

    .line 223
    .line 224
    add-int/lit8 v10, v1, 0x3

    .line 225
    .line 226
    aget-byte v10, v6, v10

    .line 227
    .line 228
    if-ne v10, v3, :cond_0

    .line 229
    .line 230
    const-string v7, "MediaCodecVideoMux"

    .line 231
    .line 232
    new-instance v8, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v9, "find pps"

    .line 238
    .line 239
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v8

    .line 249
    invoke-static {v7, v8}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    .line 251
    .line 252
    add-int/lit8 v7, v1, -0x1

    .line 253
    .line 254
    iget-object v8, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 255
    .line 256
    iget v8, v8, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 257
    .line 258
    add-int/lit8 v9, v8, -0x1

    .line 259
    .line 260
    move v8, v1

    .line 261
    goto :goto_2

    .line 262
    :catch_0
    move-exception v0

    .line 263
    move-object v7, p0

    .line 264
    goto/16 :goto_8

    .line 265
    .line 266
    :cond_0
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 267
    .line 268
    goto :goto_1

    .line 269
    :cond_1
    const-string v1, "MediaCodecVideoMux"

    .line 270
    .line 271
    new-instance v10, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 274
    .line 275
    .line 276
    const-string v11, "spsbegin:"

    .line 277
    .line 278
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    const-string v11, "spsend:"

    .line 285
    .line 286
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string v11, ";ppsbegin:"

    .line 293
    .line 294
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string v11, ";ppsbegin:"

    .line 301
    .line 302
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string v11, ";mBufferInfo.size:"

    .line 309
    .line 310
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    iget-object v11, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 314
    .line 315
    iget v11, v11, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 316
    .line 317
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v10

    .line 324
    invoke-static {v1, v10}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    add-int/2addr v7, v3

    .line 328
    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    iput-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 333
    .line 334
    sub-int/2addr v9, v8

    .line 335
    add-int/2addr v9, v3

    .line 336
    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    iput-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 341
    .line 342
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 343
    .line 344
    invoke-virtual {v1, v6, v4, v7}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 345
    .line 346
    .line 347
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 348
    .line 349
    invoke-virtual {v1, v6, v8, v9}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 350
    .line 351
    .line 352
    const-string v1, "MediaCodecVideoMux"

    .line 353
    .line 354
    new-instance v3, Ljava/lang/StringBuilder;

    .line 355
    .line 356
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 357
    .line 358
    .line 359
    const-string v7, "spslen:"

    .line 360
    .line 361
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 365
    .line 366
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 367
    .line 368
    .line 369
    move-result v7

    .line 370
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    const-string v7, ";mPpsblen:"

    .line 374
    .line 375
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 379
    .line 380
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 381
    .line 382
    .line 383
    move-result v7

    .line 384
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v7, ";mBufferInfo.size:"

    .line 388
    .line 389
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 393
    .line 394
    iget v7, v7, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 395
    .line 396
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    invoke-static {v1, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 404
    .line 405
    .line 406
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 410
    .line 411
    .line 412
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->r:Ljava/lang/Object;

    .line 413
    .line 414
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    :try_start_1
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->q:Lcom/immomo/mediacore/sink/SinkBase;

    .line 416
    .line 417
    if-eqz v3, :cond_2

    .line 418
    .line 419
    int-to-long v6, v0

    .line 420
    invoke-virtual {v3, v5, v6, v7}, Lcom/immomo/mediacore/sink/SinkBase;->writeVideoExtradata(Ljava/nio/ByteBuffer;J)V

    .line 421
    .line 422
    .line 423
    goto :goto_3

    .line 424
    :catchall_0
    move-exception v0

    .line 425
    goto :goto_4

    .line 426
    :cond_2
    :goto_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 427
    :try_start_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 428
    .line 429
    iget v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 430
    .line 431
    invoke-virtual {v0, v1, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 432
    .line 433
    .line 434
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 435
    .line 436
    return-void

    .line 437
    :goto_4
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 438
    :try_start_4
    throw v0

    .line 439
    :cond_3
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->x:J

    .line 440
    .line 441
    const-wide/16 v7, 0x0

    .line 442
    .line 443
    cmp-long v0, v5, v7

    .line 444
    .line 445
    if-nez v0, :cond_4

    .line 446
    .line 447
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 448
    .line 449
    .line 450
    move-result-wide v5

    .line 451
    iput-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->x:J

    .line 452
    .line 453
    :cond_4
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->w:J

    .line 454
    .line 455
    const-wide/16 v7, 0x1

    .line 456
    .line 457
    add-long/2addr v5, v7

    .line 458
    iput-wide v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->w:J

    .line 459
    .line 460
    goto :goto_5

    .line 461
    :cond_5
    const/4 v5, -0x3

    .line 462
    if-ne v0, v5, :cond_6

    .line 463
    .line 464
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 465
    .line 466
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e:[Ljava/nio/ByteBuffer;

    .line 471
    .line 472
    goto/16 :goto_0

    .line 473
    .line 474
    :cond_6
    const/4 v5, -0x2

    .line 475
    if-ne v0, v5, :cond_7

    .line 476
    .line 477
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 478
    .line 479
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->b:Landroid/media/MediaFormat;

    .line 484
    .line 485
    const-string v5, "MediaCodecVideoMux"

    .line 486
    .line 487
    invoke-virtual {v0}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    invoke-static {v5, v0}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    .line 493
    .line 494
    goto/16 :goto_0

    .line 495
    .line 496
    :cond_7
    const/4 v5, -0x1

    .line 497
    if-ne v0, v5, :cond_8

    .line 498
    .line 499
    const-string v0, "MediaCodecVideoMux"

    .line 500
    .line 501
    const-string v5, "No buffer available..."

    .line 502
    .line 503
    invoke-static {v0, v5}, Ll/t9c;->h(Ljava/lang/String;Ljava/lang/String;)I

    .line 504
    .line 505
    .line 506
    goto/16 :goto_0

    .line 507
    .line 508
    :cond_8
    const-string v0, "MediaCodecVideoMux"

    .line 509
    .line 510
    new-instance v5, Ljava/lang/StringBuilder;

    .line 511
    .line 512
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 513
    .line 514
    .line 515
    const-string v6, "Message: "

    .line 516
    .line 517
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 518
    .line 519
    .line 520
    iget v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 521
    .line 522
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 523
    .line 524
    .line 525
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v5

    .line 529
    invoke-static {v0, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :cond_9
    :goto_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 535
    .line 536
    if-nez v0, :cond_a

    .line 537
    .line 538
    return-void

    .line 539
    :cond_a
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 540
    .line 541
    .line 542
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 543
    .line 544
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 545
    .line 546
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 547
    .line 548
    invoke-virtual {v5}, Ljava/nio/Buffer;->position()I

    .line 549
    .line 550
    .line 551
    move-result v5

    .line 552
    sub-int/2addr v0, v5

    .line 553
    new-array v5, v0, [B

    .line 554
    .line 555
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 556
    .line 557
    invoke-virtual {v6, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 558
    .line 559
    .line 560
    invoke-virtual {p0, v5}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->b([B)Z

    .line 561
    .line 562
    .line 563
    aget-byte v1, v5, v1

    .line 564
    .line 565
    and-int/lit8 v6, v1, 0x60

    .line 566
    .line 567
    and-int/lit8 v12, v1, 0x1f

    .line 568
    .line 569
    if-nez v6, :cond_b

    .line 570
    .line 571
    const/4 v1, 0x6

    .line 572
    if-ne v12, v1, :cond_b

    .line 573
    .line 574
    const-string v1, "MediaCodecVideoMux"

    .line 575
    .line 576
    const-string v3, "sei found !"

    .line 577
    .line 578
    invoke-static {v1, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    .line 580
    .line 581
    goto :goto_6

    .line 582
    :cond_b
    const/4 v1, 0x5

    .line 583
    if-ne v12, v1, :cond_c

    .line 584
    .line 585
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->a()[B

    .line 586
    .line 587
    .line 588
    move-result-object v1

    .line 589
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l:[B

    .line 590
    .line 591
    array-length v6, v6

    .line 592
    add-int/2addr v0, v6

    .line 593
    if-eqz v1, :cond_d

    .line 594
    .line 595
    array-length v6, v1

    .line 596
    add-int/2addr v0, v6

    .line 597
    goto :goto_7

    .line 598
    :cond_c
    :goto_6
    move-object v1, v2

    .line 599
    move v3, v4

    .line 600
    :cond_d
    :goto_7
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 601
    .line 602
    .line 603
    move-result-object v8

    .line 604
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 605
    .line 606
    .line 607
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 608
    .line 609
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 610
    .line 611
    .line 612
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 613
    .line 614
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 615
    .line 616
    .line 617
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 618
    .line 619
    .line 620
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 621
    .line 622
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 623
    .line 624
    .line 625
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 626
    .line 627
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 628
    .line 629
    .line 630
    if-eqz v3, :cond_e

    .line 631
    .line 632
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k:Ljava/nio/ByteBuffer;

    .line 633
    .line 634
    invoke-virtual {v8, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 635
    .line 636
    .line 637
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->j:Ljava/nio/ByteBuffer;

    .line 638
    .line 639
    invoke-virtual {v8, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 640
    .line 641
    .line 642
    :cond_e
    invoke-virtual {v8, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 643
    .line 644
    .line 645
    if-eqz v3, :cond_f

    .line 646
    .line 647
    if-eqz v1, :cond_f

    .line 648
    .line 649
    invoke-virtual {v8, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 650
    .line 651
    .line 652
    :cond_f
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 653
    .line 654
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 655
    .line 656
    .line 657
    move-result v0

    .line 658
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 659
    .line 660
    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 661
    .line 662
    if-lt v0, v1, :cond_10

    .line 663
    .line 664
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->c:Landroid/media/MediaCodec;

    .line 665
    .line 666
    iget v1, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g:I

    .line 667
    .line 668
    invoke-virtual {v0, v1, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 669
    .line 670
    .line 671
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f:Ljava/nio/ByteBuffer;

    .line 672
    .line 673
    :cond_10
    const-string v0, "MediaCodecVideoMux"

    .line 674
    .line 675
    new-instance v1, Ljava/lang/StringBuilder;

    .line 676
    .line 677
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 678
    .line 679
    .line 680
    const-string v2, "video mux presentationTimeUs: presentationTimeUs"

    .line 681
    .line 682
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 683
    .line 684
    .line 685
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 686
    .line 687
    iget-wide v2, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 688
    .line 689
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 690
    .line 691
    .line 692
    const-string v2, ";frametype"

    .line 693
    .line 694
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 695
    .line 696
    .line 697
    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 698
    .line 699
    .line 700
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object v1

    .line 704
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    .line 706
    .line 707
    invoke-virtual {v8}, Ljava/nio/Buffer;->limit()I

    .line 708
    .line 709
    .line 710
    move-result v9

    .line 711
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d:Landroid/media/MediaCodec$BufferInfo;

    .line 712
    .line 713
    iget-wide v10, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 714
    .line 715
    move-object v7, p0

    .line 716
    :try_start_5
    invoke-virtual/range {v7 .. v12}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->q(Ljava/nio/ByteBuffer;IJI)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_1

    .line 717
    .line 718
    .line 719
    return-void

    .line 720
    :catch_1
    move-exception v0

    .line 721
    :goto_8
    const-string p0, "MediaCodecVideoMux"

    .line 722
    .line 723
    const-string v1, "MediaCodecVideoMux error !"

    .line 724
    .line 725
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    .line 727
    .line 728
    iget-object p0, v7, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->p:Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;

    .line 729
    .line 730
    if-eqz p0, :cond_11

    .line 731
    .line 732
    const/16 v1, 0x68

    .line 733
    .line 734
    const-wide/32 v2, 0x186a0

    .line 735
    .line 736
    .line 737
    invoke-interface {p0, v1, v2, v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;->a(IJ)V

    .line 738
    .line 739
    .line 740
    :cond_11
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 741
    .line 742
    .line 743
    return-void
.end method

.method public n()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->x:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public o()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->y:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public p()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->w:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public q(Ljava/nio/ByteBuffer;IJI)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->z:J

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
    iput-wide p3, p0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->z:J

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
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget-wide v2, v0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->z:J

    .line 20
    .line 21
    sub-long/2addr p3, v2

    .line 22
    const-wide/16 v2, 0x3e8

    .line 23
    .line 24
    div-long/2addr p3, v2

    .line 25
    move-wide v4, p3

    .line 26
    move-object p3, p1

    .line 27
    move p4, p2

    .line 28
    move-wide p1, v4

    .line 29
    invoke-virtual/range {p0 .. p5}, Lcom/immomo/mediacore/sink/SinkBase;->writeVideoPacket(JLjava/nio/ByteBuffer;II)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    monitor-exit v1

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

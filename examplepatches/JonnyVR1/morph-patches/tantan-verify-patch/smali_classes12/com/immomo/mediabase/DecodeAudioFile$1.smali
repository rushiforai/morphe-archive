.class Lcom/immomo/mediabase/DecodeAudioFile$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/DecodeAudioFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediabase/DecodeAudioFile;


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/DecodeAudioFile;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 6
    .line 7
    if-eqz v2, :cond_13

    .line 8
    .line 9
    iget v2, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioTrackIndex:I

    .line 10
    .line 11
    if-gez v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_b

    .line 14
    .line 15
    :cond_0
    iget-object v0, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    :try_start_0
    iget-object v0, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 24
    .line 25
    const-string v4, "mime"

    .line 26
    .line 27
    invoke-virtual {v0, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 32
    .line 33
    .line 34
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    move-object v4, v0

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    move-object v4, v2

    .line 42
    :goto_0
    iget-object v0, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioFormat:Landroid/media/MediaFormat;

    .line 45
    .line 46
    const/4 v11, 0x0

    .line 47
    invoke-virtual {v4, v0, v2, v2, v11}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Landroid/media/MediaCodec;->start()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    new-instance v12, Landroid/media/MediaCodec$BufferInfo;

    .line 62
    .line 63
    invoke-direct {v12}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 67
    .line 68
    invoke-static {v5}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 69
    .line 70
    .line 71
    move-result-wide v5

    .line 72
    const-wide/16 v13, 0x0

    .line 73
    .line 74
    cmp-long v5, v5, v13

    .line 75
    .line 76
    const-string v6, " currentPos:"

    .line 77
    .line 78
    const-string v15, "HUOHL_DecodeAudioFile"

    .line 79
    .line 80
    if-lez v5, :cond_4

    .line 81
    .line 82
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 83
    .line 84
    invoke-static {v5}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 85
    .line 86
    .line 87
    move-result-wide v7

    .line 88
    cmp-long v5, v13, v7

    .line 89
    .line 90
    if-gez v5, :cond_4

    .line 91
    .line 92
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 93
    .line 94
    iget-object v7, v5, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 95
    .line 96
    invoke-static {v5}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 97
    .line 98
    .line 99
    move-result-wide v8

    .line 100
    const/4 v5, 0x2

    .line 101
    invoke-virtual {v7, v8, v9, v5}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 102
    .line 103
    .line 104
    move-wide v7, v13

    .line 105
    :goto_1
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 106
    .line 107
    invoke-static {v5}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 108
    .line 109
    .line 110
    move-result-wide v9

    .line 111
    cmp-long v5, v7, v9

    .line 112
    .line 113
    if-gez v5, :cond_3

    .line 114
    .line 115
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 116
    .line 117
    iget-object v5, v5, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 118
    .line 119
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->advance()Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-nez v5, :cond_1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_1
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 127
    .line 128
    iget-object v5, v5, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 129
    .line 130
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 131
    .line 132
    .line 133
    move-result-wide v9

    .line 134
    const-wide/16 v16, -0x1

    .line 135
    .line 136
    cmp-long v5, v9, v16

    .line 137
    .line 138
    if-nez v5, :cond_2

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_2
    move-wide v7, v9

    .line 142
    goto :goto_1

    .line 143
    :cond_3
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    const-string v9, "SEEK to "

    .line 146
    .line 147
    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget-object v9, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 151
    .line 152
    invoke-static {v9}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 153
    .line 154
    .line 155
    move-result-wide v9

    .line 156
    invoke-virtual {v5, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-static {v15, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_4
    move-wide v7, v13

    .line 174
    :goto_3
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 175
    .line 176
    invoke-static {v5}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 177
    .line 178
    .line 179
    move-result-wide v9

    .line 180
    cmp-long v5, v9, v13

    .line 181
    .line 182
    const/4 v9, -0x3

    .line 183
    if-lez v5, :cond_6

    .line 184
    .line 185
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 186
    .line 187
    invoke-static {v5}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 188
    .line 189
    .line 190
    move-result-wide v16

    .line 191
    cmp-long v5, v7, v16

    .line 192
    .line 193
    if-gez v5, :cond_6

    .line 194
    .line 195
    iget-object v0, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 198
    .line 199
    if-eqz v0, :cond_5

    .line 200
    .line 201
    invoke-interface {v0, v9}, Lcom/immomo/mediabase/DecodeAudioFileListener;->onDecoderError(I)V

    .line 202
    .line 203
    .line 204
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string v2, "SEEK Error SEEK to "

    .line 207
    .line 208
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v2, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 212
    .line 213
    invoke-static {v2}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 214
    .line 215
    .line 216
    move-result-wide v2

    .line 217
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string v2, ", duration:"

    .line 227
    .line 228
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    iget-object v1, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 232
    .line 233
    iget-wide v1, v1, Lcom/immomo/mediabase/DecodeAudioFile;->mAudioDuration:J

    .line 234
    .line 235
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_6
    move v5, v11

    .line 247
    :goto_4
    iget-object v6, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 248
    .line 249
    invoke-static {v6}, Lcom/immomo/mediabase/DecodeAudioFile;->access$100(Lcom/immomo/mediabase/DecodeAudioFile;)Z

    .line 250
    .line 251
    .line 252
    move-result v6

    .line 253
    if-nez v6, :cond_12

    .line 254
    .line 255
    const/16 v16, 0x4

    .line 256
    .line 257
    const-wide/16 v6, 0x1388

    .line 258
    .line 259
    move v8, v5

    .line 260
    if-nez v5, :cond_b

    .line 261
    .line 262
    invoke-virtual {v4, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 263
    .line 264
    .line 265
    move-result v5

    .line 266
    if-ltz v5, :cond_b

    .line 267
    .line 268
    aget-object v10, v0, v5

    .line 269
    .line 270
    iget-object v6, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 271
    .line 272
    iget-object v6, v6, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 273
    .line 274
    invoke-virtual {v6, v10, v11}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 275
    .line 276
    .line 277
    move-result v6

    .line 278
    if-gez v6, :cond_7

    .line 279
    .line 280
    const/4 v6, 0x1

    .line 281
    move/from16 v18, v6

    .line 282
    .line 283
    move v6, v9

    .line 284
    move v7, v11

    .line 285
    move-wide v8, v13

    .line 286
    goto :goto_5

    .line 287
    :cond_7
    iget-object v7, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 288
    .line 289
    iget-object v7, v7, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 290
    .line 291
    invoke-virtual {v7}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 292
    .line 293
    .line 294
    move-result-wide v18

    .line 295
    move v7, v6

    .line 296
    move v6, v9

    .line 297
    move-wide/from16 v22, v18

    .line 298
    .line 299
    move/from16 v18, v8

    .line 300
    .line 301
    move-wide/from16 v8, v22

    .line 302
    .line 303
    :goto_5
    if-nez v18, :cond_8

    .line 304
    .line 305
    iget-object v10, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 306
    .line 307
    invoke-static {v10}, Lcom/immomo/mediabase/DecodeAudioFile;->access$000(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 308
    .line 309
    .line 310
    move-result-wide v19

    .line 311
    cmp-long v10, v8, v19

    .line 312
    .line 313
    if-gez v10, :cond_8

    .line 314
    .line 315
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 316
    .line 317
    iget-object v5, v5, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 318
    .line 319
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->advance()Z

    .line 320
    .line 321
    .line 322
    move v9, v6

    .line 323
    move/from16 v5, v18

    .line 324
    .line 325
    goto :goto_4

    .line 326
    :cond_8
    if-eqz v18, :cond_9

    .line 327
    .line 328
    move/from16 v10, v16

    .line 329
    .line 330
    :goto_6
    move/from16 v19, v6

    .line 331
    .line 332
    goto :goto_7

    .line 333
    :cond_9
    move v10, v11

    .line 334
    goto :goto_6

    .line 335
    :goto_7
    const/4 v6, 0x0

    .line 336
    move-wide/from16 v20, v13

    .line 337
    .line 338
    move/from16 v3, v19

    .line 339
    .line 340
    const-wide/16 v13, 0x1388

    .line 341
    .line 342
    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 343
    .line 344
    .line 345
    if-nez v18, :cond_a

    .line 346
    .line 347
    iget-object v5, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 348
    .line 349
    iget-object v5, v5, Lcom/immomo/mediabase/DecodeAudioFile;->mExtractor:Landroid/media/MediaExtractor;

    .line 350
    .line 351
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->advance()Z

    .line 352
    .line 353
    .line 354
    :cond_a
    move/from16 v5, v18

    .line 355
    .line 356
    goto :goto_8

    .line 357
    :cond_b
    move v3, v9

    .line 358
    move-wide/from16 v20, v13

    .line 359
    .line 360
    move-wide v13, v6

    .line 361
    move v5, v8

    .line 362
    :goto_8
    invoke-virtual {v4, v12, v13, v14}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 363
    .line 364
    .line 365
    move-result v6

    .line 366
    if-ltz v6, :cond_e

    .line 367
    .line 368
    aget-object v7, v2, v6

    .line 369
    .line 370
    iget v8, v12, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 371
    .line 372
    if-lez v8, :cond_d

    .line 373
    .line 374
    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 375
    .line 376
    .line 377
    move-result-object v8

    .line 378
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 379
    .line 380
    .line 381
    iget v9, v12, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 382
    .line 383
    invoke-virtual {v7, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 387
    .line 388
    .line 389
    move-result-object v9

    .line 390
    iget v10, v12, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 391
    .line 392
    invoke-virtual {v7, v9, v11, v10}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 393
    .line 394
    .line 395
    iget-object v7, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 396
    .line 397
    iget-object v7, v7, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 398
    .line 399
    if-eqz v7, :cond_c

    .line 400
    .line 401
    iget-wide v9, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 402
    .line 403
    invoke-interface {v7, v8, v9, v10}, Lcom/immomo/mediabase/DecodeAudioFileListener;->onFrameAvailable(Ljava/nio/ByteBuffer;J)V

    .line 404
    .line 405
    .line 406
    :cond_c
    iget-object v7, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 407
    .line 408
    invoke-static {v7}, Lcom/immomo/mediabase/DecodeAudioFile;->access$200(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 409
    .line 410
    .line 411
    move-result-wide v7

    .line 412
    cmp-long v7, v7, v20

    .line 413
    .line 414
    if-lez v7, :cond_d

    .line 415
    .line 416
    iget-wide v7, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 417
    .line 418
    iget-object v9, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 419
    .line 420
    invoke-static {v9}, Lcom/immomo/mediabase/DecodeAudioFile;->access$200(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 421
    .line 422
    .line 423
    move-result-wide v9

    .line 424
    cmp-long v7, v7, v9

    .line 425
    .line 426
    if-lez v7, :cond_d

    .line 427
    .line 428
    new-instance v0, Ljava/lang/StringBuilder;

    .line 429
    .line 430
    const-string v2, "audioDecoder \u505c\u6b62\u89e3\u7801\uff1a\u622a\u6b62\u65f6\u95f4\uff1a"

    .line 431
    .line 432
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    iget-object v1, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 436
    .line 437
    invoke-static {v1}, Lcom/immomo/mediabase/DecodeAudioFile;->access$200(Lcom/immomo/mediabase/DecodeAudioFile;)J

    .line 438
    .line 439
    .line 440
    move-result-wide v1

    .line 441
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    const-string v1, "\u5f53\u524d\u89e3\u7801\u65f6\u95f4\uff1a"

    .line 445
    .line 446
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    iget-wide v1, v12, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 450
    .line 451
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    invoke-static {v15, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    .line 460
    .line 461
    goto :goto_a

    .line 462
    :cond_d
    invoke-virtual {v4, v6, v11}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 463
    .line 464
    .line 465
    iget v6, v12, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 466
    .line 467
    and-int/lit8 v6, v6, 0x4

    .line 468
    .line 469
    if-eqz v6, :cond_11

    .line 470
    .line 471
    iget-object v0, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 472
    .line 473
    iget-object v0, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 474
    .line 475
    if-eqz v0, :cond_12

    .line 476
    .line 477
    invoke-interface {v0}, Lcom/immomo/mediabase/DecodeAudioFileListener;->onFinished()V

    .line 478
    .line 479
    .line 480
    goto :goto_a

    .line 481
    :cond_e
    if-ne v6, v3, :cond_f

    .line 482
    .line 483
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 484
    .line 485
    .line 486
    move-result-object v2

    .line 487
    goto :goto_9

    .line 488
    :cond_f
    const/4 v7, -0x2

    .line 489
    if-ne v6, v7, :cond_11

    .line 490
    .line 491
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 492
    .line 493
    .line 494
    move-result-object v6

    .line 495
    iget-object v7, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 496
    .line 497
    invoke-static {v7}, Lcom/immomo/mediabase/DecodeAudioFile;->access$300(Lcom/immomo/mediabase/DecodeAudioFile;)Lcom/immomo/mediabase/AudioParameter;

    .line 498
    .line 499
    .line 500
    move-result-object v7

    .line 501
    const-string v8, "channel-count"

    .line 502
    .line 503
    invoke-virtual {v6, v8}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 504
    .line 505
    .line 506
    move-result v8

    .line 507
    invoke-virtual {v7, v8}, Lcom/immomo/mediabase/AudioParameter;->setNumChannels(I)V

    .line 508
    .line 509
    .line 510
    iget-object v7, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 511
    .line 512
    invoke-static {v7}, Lcom/immomo/mediabase/DecodeAudioFile;->access$300(Lcom/immomo/mediabase/DecodeAudioFile;)Lcom/immomo/mediabase/AudioParameter;

    .line 513
    .line 514
    .line 515
    move-result-object v7

    .line 516
    const-string v8, "sample-rate"

    .line 517
    .line 518
    invoke-virtual {v6, v8}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 519
    .line 520
    .line 521
    move-result v8

    .line 522
    invoke-virtual {v7, v8}, Lcom/immomo/mediabase/AudioParameter;->setSamplingRate(I)V

    .line 523
    .line 524
    .line 525
    iget-object v7, v1, Lcom/immomo/mediabase/DecodeAudioFile$1;->this$0:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 526
    .line 527
    iget-object v7, v7, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 528
    .line 529
    if-eqz v7, :cond_10

    .line 530
    .line 531
    invoke-interface {v7, v6}, Lcom/immomo/mediabase/DecodeAudioFileListener;->onForamtChange(Landroid/media/MediaFormat;)V

    .line 532
    .line 533
    .line 534
    :cond_10
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    :cond_11
    :goto_9
    move v9, v3

    .line 538
    move-wide/from16 v13, v20

    .line 539
    .line 540
    goto/16 :goto_4

    .line 541
    .line 542
    :cond_12
    :goto_a
    invoke-virtual {v4}, Landroid/media/MediaCodec;->flush()V

    .line 543
    .line 544
    .line 545
    invoke-virtual {v4}, Landroid/media/MediaCodec;->release()V

    .line 546
    .line 547
    .line 548
    return-void

    .line 549
    :cond_13
    :goto_b
    iget-object v0, v0, Lcom/immomo/mediabase/DecodeAudioFile;->mDecoderListener:Lcom/immomo/mediabase/DecodeAudioFileListener;

    .line 550
    .line 551
    if-eqz v0, :cond_14

    .line 552
    .line 553
    const/4 v7, -0x2

    .line 554
    invoke-interface {v0, v7}, Lcom/immomo/mediabase/DecodeAudioFileListener;->onDecoderError(I)V

    .line 555
    .line 556
    .line 557
    :cond_14
    return-void
.end method

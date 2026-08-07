.class Ll/qc1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qc1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private a:[B

.field private b:I

.field final synthetic c:Ll/qc1;


# direct methods
.method public constructor <init>(Ll/qc1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/qc1$a;->a:[B

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Ll/qc1$a;->b:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 7
    .line 8
    invoke-static {v0}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_e

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v0, v1

    .line 16
    :catch_0
    :goto_0
    iget-object v2, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 17
    .line 18
    invoke-static {v2}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-wide/16 v3, 0x64

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    iget-object v2, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 27
    .line 28
    invoke-static {v2}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    const/4 v2, 0x5

    .line 39
    if-ge v0, v2, :cond_0

    .line 40
    .line 41
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 v2, 0x2

    .line 48
    const/4 v5, 0x0

    .line 49
    const v6, 0x9100

    .line 50
    .line 51
    .line 52
    :try_start_1
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 53
    .line 54
    invoke-static {v0}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 59
    .line 60
    .line 61
    move v0, v1

    .line 62
    :catch_1
    :goto_1
    iget-object v7, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 63
    .line 64
    invoke-static {v7}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    invoke-virtual {v7}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 69
    .line 70
    .line 71
    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 72
    const/4 v8, 0x3

    .line 73
    if-eq v7, v8, :cond_1

    .line 74
    .line 75
    const/16 v7, 0xa

    .line 76
    .line 77
    if-ge v0, v7, :cond_1

    .line 78
    .line 79
    :try_start_2
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v0, v0, 0x1

    .line 83
    .line 84
    iget-object v7, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 85
    .line 86
    invoke-static {v7}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    invoke-virtual {v7}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :catch_2
    move-exception v0

    .line 95
    goto/16 :goto_6

    .line 96
    .line 97
    :cond_1
    :try_start_3
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 98
    .line 99
    invoke-static {v0}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eq v0, v8, :cond_3

    .line 108
    .line 109
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 110
    .line 111
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 118
    .line 119
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0, v6, v2, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    const-string v3, "AudioRecorder getRecordingState error"

    .line 131
    .line 132
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v0, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    const-string v8, "audioCapture"

    .line 144
    .line 145
    const-string v9, "audioRecorder"

    .line 146
    .line 147
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 148
    .line 149
    invoke-static {v0}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getRecordingState()I

    .line 154
    .line 155
    .line 156
    move-result v10

    .line 157
    const-string v11, "RecordingState error"

    .line 158
    .line 159
    sget-object v0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 162
    .line 163
    .line 164
    move-result v12

    .line 165
    invoke-virtual/range {v7 .. v12}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 166
    .line 167
    .line 168
    goto/16 :goto_7

    .line 169
    .line 170
    :cond_3
    :goto_2
    move v0, v1

    .line 171
    :cond_4
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    if-nez v3, :cond_b

    .line 176
    .line 177
    iget-object v3, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 178
    .line 179
    invoke-static {v3}, Ll/qc1;->v2(Ll/qc1;)Z

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-eqz v3, :cond_b

    .line 184
    .line 185
    iget-object v3, p0, Ll/qc1$a;->a:[B

    .line 186
    .line 187
    if-nez v3, :cond_5

    .line 188
    .line 189
    iget-object v3, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 190
    .line 191
    invoke-static {v3}, Ll/qc1;->w2(Ll/qc1;)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    new-array v3, v3, [B

    .line 196
    .line 197
    iput-object v3, p0, Ll/qc1$a;->a:[B

    .line 198
    .line 199
    :cond_5
    iget-object v3, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 200
    .line 201
    invoke-static {v3}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    iget-object v4, p0, Ll/qc1$a;->a:[B

    .line 206
    .line 207
    iget-object v7, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 208
    .line 209
    invoke-static {v7}, Ll/qc1;->w2(Ll/qc1;)I

    .line 210
    .line 211
    .line 212
    move-result v7

    .line 213
    invoke-virtual {v3, v4, v1, v7}, Landroid/media/AudioRecord;->read([BII)I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    iput v3, p0, Ll/qc1$a;->b:I

    .line 218
    .line 219
    if-lez v3, :cond_7

    .line 220
    .line 221
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 222
    .line 223
    invoke-static {v0}, Ll/qc1;->x2(Ll/qc1;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v4

    .line 227
    monitor-enter v4

    .line 228
    :try_start_4
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 229
    .line 230
    iget-object v3, v0, Ll/jc00;->j:Ll/fb1;

    .line 231
    .line 232
    if-eqz v3, :cond_6

    .line 233
    .line 234
    invoke-static {v0}, Ll/qc1;->w2(Ll/qc1;)I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-object v3, p0, Ll/qc1$a;->a:[B

    .line 243
    .line 244
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 248
    .line 249
    .line 250
    iget-object v3, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 251
    .line 252
    iget-object v3, v3, Ll/jc00;->j:Ll/fb1;

    .line 253
    .line 254
    new-instance v7, Ll/oxd0;

    .line 255
    .line 256
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 257
    .line 258
    .line 259
    move-result-wide v9

    .line 260
    const-wide/16 v11, 0x3e8

    .line 261
    .line 262
    div-long/2addr v9, v11

    .line 263
    invoke-direct {v7, v0, v9, v10, v2}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 264
    .line 265
    .line 266
    invoke-interface {v3, v7}, Ll/fb1;->C(Ll/oxd0;)Ll/oxd0;

    .line 267
    .line 268
    .line 269
    goto :goto_3

    .line 270
    :catchall_0
    move-exception v0

    .line 271
    move-object p0, v0

    .line 272
    goto :goto_4

    .line 273
    :cond_6
    :goto_3
    monitor-exit v4

    .line 274
    goto :goto_2

    .line 275
    :goto_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 276
    throw p0

    .line 277
    :cond_7
    if-gez v3, :cond_9

    .line 278
    .line 279
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 280
    .line 281
    invoke-static {v0}, Ll/qc1;->u2(Ll/qc1;)Ll/qc1$b;

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 285
    .line 286
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    if-eqz v0, :cond_8

    .line 291
    .line 292
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 293
    .line 294
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    invoke-interface {v0, v6, v8, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    :cond_8
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 302
    .line 303
    .line 304
    move-result-object v9

    .line 305
    const-string v10, "audioCapture"

    .line 306
    .line 307
    const-string v11, "audioRecorder"

    .line 308
    .line 309
    const-string v13, "mAudioRecord read error"

    .line 310
    .line 311
    sget-object v0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 312
    .line 313
    invoke-virtual {v0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 314
    .line 315
    .line 316
    move-result v14

    .line 317
    const/4 v12, 0x3

    .line 318
    invoke-virtual/range {v9 .. v14}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 319
    .line 320
    .line 321
    goto :goto_5

    .line 322
    :cond_9
    if-nez v3, :cond_4

    .line 323
    .line 324
    add-int/lit8 v0, v0, 0x1

    .line 325
    .line 326
    const/16 v3, 0x14

    .line 327
    .line 328
    if-le v0, v3, :cond_4

    .line 329
    .line 330
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 331
    .line 332
    invoke-static {v0}, Ll/qc1;->u2(Ll/qc1;)Ll/qc1$b;

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 336
    .line 337
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    if-eqz v0, :cond_a

    .line 342
    .line 343
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 344
    .line 345
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    invoke-interface {v0, v6, v8, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 350
    .line 351
    .line 352
    :cond_a
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 353
    .line 354
    .line 355
    move-result-object v9

    .line 356
    const-string v10, "audioCapture"

    .line 357
    .line 358
    const-string v11, "audioRecorder"

    .line 359
    .line 360
    const-string v13, "mAudioRecord read error"

    .line 361
    .line 362
    sget-object v0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 363
    .line 364
    invoke-virtual {v0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 365
    .line 366
    .line 367
    move-result v14

    .line 368
    const/4 v12, 0x4

    .line 369
    invoke-virtual/range {v9 .. v14}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 370
    .line 371
    .line 372
    :cond_b
    :goto_5
    const-string v0, "AudioRecorderWrapper"

    .line 373
    .line 374
    const-string v3, " mAudioRecord.stop() and release"

    .line 375
    .line 376
    invoke-static {v0, v3}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    .line 378
    .line 379
    :try_start_5
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 380
    .line 381
    invoke-static {v0}, Ll/qc1;->s2(Ll/qc1;)Landroid/media/AudioRecord;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 386
    .line 387
    .line 388
    goto :goto_7

    .line 389
    :catch_3
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 390
    .line 391
    invoke-static {v0}, Ll/qc1;->u2(Ll/qc1;)Ll/qc1$b;

    .line 392
    .line 393
    .line 394
    iget-object v0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 395
    .line 396
    invoke-static {v0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    if-eqz v0, :cond_c

    .line 401
    .line 402
    iget-object p0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 403
    .line 404
    invoke-static {p0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    invoke-interface {p0, v6, v2, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 409
    .line 410
    .line 411
    :cond_c
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 412
    .line 413
    .line 414
    move-result-object v7

    .line 415
    const-string v8, "audioCapture"

    .line 416
    .line 417
    const-string v9, "audioRecorder"

    .line 418
    .line 419
    const-string v11, "mAudioRecord stop error"

    .line 420
    .line 421
    sget-object p0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 422
    .line 423
    invoke-virtual {p0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 424
    .line 425
    .line 426
    move-result v12

    .line 427
    const/4 v10, 0x2

    .line 428
    invoke-virtual/range {v7 .. v12}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 429
    .line 430
    .line 431
    goto :goto_7

    .line 432
    :goto_6
    iget-object v3, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 433
    .line 434
    invoke-static {v3}, Ll/qc1;->u2(Ll/qc1;)Ll/qc1$b;

    .line 435
    .line 436
    .line 437
    iget-object v3, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 438
    .line 439
    invoke-static {v3}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 440
    .line 441
    .line 442
    move-result-object v3

    .line 443
    if-eqz v3, :cond_d

    .line 444
    .line 445
    iget-object p0, p0, Ll/qc1$a;->c:Ll/qc1;

    .line 446
    .line 447
    invoke-static {p0}, Ll/qc1;->t2(Ll/qc1;)Ll/q210$a;

    .line 448
    .line 449
    .line 450
    move-result-object p0

    .line 451
    invoke-interface {p0, v6, v2, v1, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 452
    .line 453
    .line 454
    :cond_d
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 455
    .line 456
    .line 457
    move-result-object v7

    .line 458
    const-string v8, "audioCapture"

    .line 459
    .line 460
    const-string v9, "audioRecorder"

    .line 461
    .line 462
    new-instance p0, Ljava/lang/StringBuilder;

    .line 463
    .line 464
    const-string v1, ""

    .line 465
    .line 466
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v11

    .line 480
    sget-object p0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 481
    .line 482
    invoke-virtual {p0}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 483
    .line 484
    .line 485
    move-result v12

    .line 486
    const/4 v10, 0x1

    .line 487
    invoke-virtual/range {v7 .. v12}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 488
    .line 489
    .line 490
    :catch_4
    :cond_e
    :goto_7
    return-void
.end method

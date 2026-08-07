.class Ll/xmp0$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/IAudioFrameProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xmp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0;


# direct methods
.method public constructor <init>(Ll/xmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onProcessEarMonitorAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onProcessPlayBackAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onProcessRecordAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .locals 12

    .line 1
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->channel()Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->data_size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->sample_rate()Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v3, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 22
    .line 23
    invoke-static {v3}, Ll/xmp0;->f3(Ll/xmp0;)I

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 27
    .line 28
    invoke-static {v3}, Ll/xmp0;->g3(Ll/xmp0;)I

    .line 29
    .line 30
    .line 31
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->data_size()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    new-array v7, v3, [B

    .line 36
    .line 37
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 38
    .line 39
    invoke-static {v4}, Ll/xmp0;->h3(Ll/xmp0;)Z

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    const/4 v10, 0x0

    .line 44
    if-eqz v4, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4, v7, v10, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 55
    .line 56
    invoke-static {v4}, Ll/xmp0;->i3(Ll/xmp0;)Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    const/4 v11, 0x1

    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 64
    .line 65
    invoke-static {v4}, Ll/xmp0;->i3(Ll/xmp0;)Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget-object v5, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 70
    .line 71
    invoke-static {v5}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    iget v5, v5, Ll/uow;->B0:I

    .line 76
    .line 77
    int-to-long v5, v5

    .line 78
    if-ne v0, v11, :cond_1

    .line 79
    .line 80
    move v9, v10

    .line 81
    goto :goto_1

    .line 82
    :cond_1
    move v9, v11

    .line 83
    :goto_1
    const v8, 0xac44

    .line 84
    .line 85
    .line 86
    invoke-interface/range {v4 .. v9}, Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;->onPcmDateCallback(J[BIZ)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 90
    .line 91
    invoke-static {v4}, Ll/xmp0;->j3(Ll/xmp0;)Ll/l6m;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    const/4 v5, 0x0

    .line 96
    if-eqz v4, :cond_3

    .line 97
    .line 98
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 99
    .line 100
    invoke-static {v4}, Ll/xmp0;->l3(Ll/xmp0;)Ll/l6m;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    check-cast v4, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 105
    .line 106
    iget-object v6, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 107
    .line 108
    invoke-static {v6}, Ll/xmp0;->k3(Ll/xmp0;)F

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    invoke-virtual {v4, v6}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->W1(F)V

    .line 113
    .line 114
    .line 115
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 116
    .line 117
    invoke-static {v4}, Ll/xmp0;->m3(Ll/xmp0;)Ll/l6m;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    check-cast v4, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 122
    .line 123
    iget-object v6, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 124
    .line 125
    invoke-static {v6}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    iget v6, v6, Ll/tow;->P:I

    .line 130
    .line 131
    const-string v8, "Volc"

    .line 132
    .line 133
    invoke-virtual {v4, v1, v6, v0, v8}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 137
    .line 138
    invoke-static {v1}, Ll/xmp0;->n3(Ll/xmp0;)Ll/l6m;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 143
    .line 144
    new-instance v4, Ll/oxd0;

    .line 145
    .line 146
    iget-object v6, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 147
    .line 148
    iget v6, v6, Ll/xmp0;->S0:I

    .line 149
    .line 150
    int-to-long v8, v6

    .line 151
    invoke-direct {v4, v7, v8, v9, v0}, Ll/oxd0;-><init>([BJI)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v4}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C(Ll/oxd0;)Ll/oxd0;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    if-eqz v1, :cond_4

    .line 159
    .line 160
    iget-object v4, v1, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    if-eqz v4, :cond_4

    .line 163
    .line 164
    invoke-virtual {v4, v7, v10, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 172
    .line 173
    .line 174
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    .line 181
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_3
    move-object v1, v5

    .line 190
    :cond_4
    :goto_2
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 191
    .line 192
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    if-eqz p1, :cond_5

    .line 197
    .line 198
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 199
    .line 200
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {p1, v7, v2, v0}, Ll/kod0;->o([BII)V

    .line 205
    .line 206
    .line 207
    :cond_5
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 208
    .line 209
    invoke-static {p1}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    if-eqz p1, :cond_d

    .line 214
    .line 215
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 216
    .line 217
    invoke-static {p1}, Ll/xmp0;->q3(Ll/xmp0;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-eqz p1, :cond_d

    .line 222
    .line 223
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 224
    .line 225
    invoke-static {p1}, Ll/xmp0;->r3(Ll/xmp0;)Ll/l6m;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    if-eqz p1, :cond_9

    .line 230
    .line 231
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 232
    .line 233
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    if-eqz p1, :cond_7

    .line 238
    .line 239
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 240
    .line 241
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    const/high16 v2, 0x3f800000    # 1.0f

    .line 246
    .line 247
    invoke-virtual {p1, v2}, Ll/dc1;->j(F)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 251
    .line 252
    invoke-static {p1}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    iget-boolean p1, p1, Ll/uow;->X0:Z

    .line 257
    .line 258
    if-eqz p1, :cond_6

    .line 259
    .line 260
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 261
    .line 262
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {p1, v2}, Ll/dc1;->k(F)V

    .line 267
    .line 268
    .line 269
    :cond_6
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 270
    .line 271
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p1}, Ll/dc1;->g()Ll/oxd0;

    .line 276
    .line 277
    .line 278
    move-result-object v5

    .line 279
    :cond_7
    if-eqz v5, :cond_9

    .line 280
    .line 281
    iget-object p1, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 282
    .line 283
    if-eqz v1, :cond_8

    .line 284
    .line 285
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-virtual {v1}, Ll/oxd0;->c()[B

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-virtual {v5}, Ll/oxd0;->c()[B

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    invoke-virtual {v5}, Ll/oxd0;->e()I

    .line 298
    .line 299
    .line 300
    move-result v4

    .line 301
    invoke-virtual {p1, v1, v2, v4}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    goto :goto_3

    .line 306
    :cond_8
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    invoke-virtual {v5}, Ll/oxd0;->c()[B

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-virtual {v5}, Ll/oxd0;->e()I

    .line 315
    .line 316
    .line 317
    move-result v2

    .line 318
    invoke-virtual {p1, v7, v1, v2}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    :goto_3
    if-eqz p1, :cond_9

    .line 323
    .line 324
    new-instance v1, Ll/oxd0;

    .line 325
    .line 326
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-virtual {v5}, Ll/oxd0;->d()J

    .line 331
    .line 332
    .line 333
    move-result-wide v4

    .line 334
    invoke-direct {v1, p1, v4, v5, v0}, Ll/oxd0;-><init>([BJI)V

    .line 335
    .line 336
    .line 337
    move-object v5, v1

    .line 338
    :cond_9
    const-string p1, "=====replace======:Agora send pcm to IJK "

    .line 339
    .line 340
    const-string v1, "Pipeline_Normal_pip->PIPLINE->VOLC"

    .line 341
    .line 342
    const/4 v2, 0x2

    .line 343
    if-eqz v5, :cond_b

    .line 344
    .line 345
    if-ne v0, v11, :cond_a

    .line 346
    .line 347
    invoke-virtual {v5}, Ll/oxd0;->c()[B

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    invoke-virtual {v5}, Ll/oxd0;->e()I

    .line 352
    .line 353
    .line 354
    move-result v3

    .line 355
    invoke-static {v0, v3}, Ll/jc00;->o2([BI)[B

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    goto :goto_4

    .line 360
    :cond_a
    invoke-virtual {v5}, Ll/oxd0;->c()[B

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    :goto_4
    new-instance v3, Ll/oxd0;

    .line 365
    .line 366
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 367
    .line 368
    iget v4, v4, Ll/xmp0;->S0:I

    .line 369
    .line 370
    int-to-long v4, v4

    .line 371
    invoke-direct {v3, v0, v4, v5, v2}, Ll/oxd0;-><init>([BJI)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {v3, v10}, Ll/oxd0;->g(Z)V

    .line 375
    .line 376
    .line 377
    iget-object v0, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 378
    .line 379
    invoke-static {v0}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    if-eqz v0, :cond_d

    .line 384
    .line 385
    iget-object v0, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 386
    .line 387
    invoke-static {v0}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-interface {v0, v3}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 392
    .line 393
    .line 394
    iget-object p0, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 395
    .line 396
    invoke-static {p0}, Ll/xmp0;->t3(Ll/xmp0;)I

    .line 397
    .line 398
    .line 399
    move-result p0

    .line 400
    rem-int/lit8 p0, p0, 0x32

    .line 401
    .line 402
    if-nez p0, :cond_d

    .line 403
    .line 404
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    invoke-virtual {p0, v1, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    goto :goto_5

    .line 412
    :cond_b
    iget-object v4, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 413
    .line 414
    invoke-static {v4}, Ll/xmp0;->x4(Ll/xmp0;)I

    .line 415
    .line 416
    .line 417
    move-result v4

    .line 418
    if-eq v4, v2, :cond_d

    .line 419
    .line 420
    if-ne v0, v11, :cond_c

    .line 421
    .line 422
    invoke-static {v7, v3}, Ll/jc00;->o2([BI)[B

    .line 423
    .line 424
    .line 425
    move-result-object v7

    .line 426
    :cond_c
    new-instance v0, Ll/oxd0;

    .line 427
    .line 428
    iget-object v3, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 429
    .line 430
    iget v3, v3, Ll/xmp0;->S0:I

    .line 431
    .line 432
    int-to-long v3, v3

    .line 433
    invoke-direct {v0, v7, v3, v4, v2}, Ll/oxd0;-><init>([BJI)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v0, v10}, Ll/oxd0;->g(Z)V

    .line 437
    .line 438
    .line 439
    iget-object v2, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 440
    .line 441
    invoke-static {v2}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    if-eqz v2, :cond_d

    .line 446
    .line 447
    iget-object v2, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 448
    .line 449
    invoke-static {v2}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 450
    .line 451
    .line 452
    move-result-object v2

    .line 453
    invoke-interface {v2, v0}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 454
    .line 455
    .line 456
    iget-object p0, p0, Ll/xmp0$i;->a:Ll/xmp0;

    .line 457
    .line 458
    invoke-static {p0}, Ll/xmp0;->t3(Ll/xmp0;)I

    .line 459
    .line 460
    .line 461
    move-result p0

    .line 462
    rem-int/lit8 p0, p0, 0x32

    .line 463
    .line 464
    if-nez p0, :cond_d

    .line 465
    .line 466
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 467
    .line 468
    .line 469
    move-result-object p0

    .line 470
    invoke-virtual {p0, v1, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    :cond_d
    :goto_5
    return v10
.end method

.method public onProcessRemoteUserAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onProcessScreenAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

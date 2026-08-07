.class public Lorg/spongycastle/crypto/engines/ChaChaEngine;
.super Lorg/spongycastle/crypto/engines/Salsa20Engine;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;-><init>(I)V

    return-void
.end method

.method public static chachaCore(I[I[I)V
    .locals 43

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    const/16 v3, 0x10

    .line 7
    .line 8
    if-ne v2, v3, :cond_3

    .line 9
    .line 10
    array-length v2, v1

    .line 11
    if-ne v2, v3, :cond_2

    .line 12
    .line 13
    rem-int/lit8 v2, p0, 0x2

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    aget v4, v0, v2

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    aget v6, v0, v5

    .line 22
    .line 23
    const/4 v7, 0x2

    .line 24
    aget v8, v0, v7

    .line 25
    .line 26
    const/4 v9, 0x3

    .line 27
    aget v10, v0, v9

    .line 28
    .line 29
    const/4 v11, 0x4

    .line 30
    aget v12, v0, v11

    .line 31
    .line 32
    const/4 v13, 0x5

    .line 33
    aget v14, v0, v13

    .line 34
    .line 35
    const/4 v15, 0x6

    .line 36
    aget v16, v0, v15

    .line 37
    .line 38
    move/from16 v17, v2

    .line 39
    .line 40
    const/4 v2, 0x7

    .line 41
    aget v18, v0, v2

    .line 42
    .line 43
    move/from16 v19, v5

    .line 44
    .line 45
    const/16 v5, 0x8

    .line 46
    .line 47
    aget v20, v0, v5

    .line 48
    .line 49
    const/16 v21, 0x9

    .line 50
    .line 51
    aget v22, v0, v21

    .line 52
    .line 53
    const/16 v23, 0xa

    .line 54
    .line 55
    aget v24, v0, v23

    .line 56
    .line 57
    const/16 v25, 0xb

    .line 58
    .line 59
    aget v26, v0, v25

    .line 60
    .line 61
    move/from16 v27, v7

    .line 62
    .line 63
    const/16 v7, 0xc

    .line 64
    .line 65
    aget v28, v0, v7

    .line 66
    .line 67
    const/16 v29, 0xd

    .line 68
    .line 69
    aget v30, v0, v29

    .line 70
    .line 71
    const/16 v31, 0xe

    .line 72
    .line 73
    aget v32, v0, v31

    .line 74
    .line 75
    const/16 v33, 0xf

    .line 76
    .line 77
    aget v34, v0, v33

    .line 78
    .line 79
    move/from16 v35, v34

    .line 80
    .line 81
    move/from16 v34, v32

    .line 82
    .line 83
    move/from16 v32, v30

    .line 84
    .line 85
    move/from16 v30, v28

    .line 86
    .line 87
    move/from16 v28, v26

    .line 88
    .line 89
    move/from16 v26, v24

    .line 90
    .line 91
    move/from16 v24, v22

    .line 92
    .line 93
    move/from16 v22, v20

    .line 94
    .line 95
    move/from16 v20, v18

    .line 96
    .line 97
    move/from16 v18, v16

    .line 98
    .line 99
    move/from16 v16, v14

    .line 100
    .line 101
    move v14, v12

    .line 102
    move v12, v10

    .line 103
    move v10, v8

    .line 104
    move v8, v6

    .line 105
    move v6, v4

    .line 106
    move/from16 v4, p0

    .line 107
    .line 108
    :goto_0
    if-lez v4, :cond_0

    .line 109
    .line 110
    add-int/2addr v6, v14

    .line 111
    move/from16 v36, v9

    .line 112
    .line 113
    xor-int v9, v30, v6

    .line 114
    .line 115
    invoke-static {v9, v3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 116
    .line 117
    .line 118
    move-result v9

    .line 119
    add-int v22, v22, v9

    .line 120
    .line 121
    xor-int v14, v14, v22

    .line 122
    .line 123
    invoke-static {v14, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 124
    .line 125
    .line 126
    move-result v14

    .line 127
    add-int/2addr v6, v14

    .line 128
    xor-int/2addr v9, v6

    .line 129
    invoke-static {v9, v5}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 130
    .line 131
    .line 132
    move-result v9

    .line 133
    add-int v22, v22, v9

    .line 134
    .line 135
    xor-int v14, v14, v22

    .line 136
    .line 137
    invoke-static {v14, v2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 138
    .line 139
    .line 140
    move-result v14

    .line 141
    add-int v8, v8, v16

    .line 142
    .line 143
    move/from16 v37, v11

    .line 144
    .line 145
    xor-int v11, v32, v8

    .line 146
    .line 147
    invoke-static {v11, v3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 148
    .line 149
    .line 150
    move-result v11

    .line 151
    add-int v24, v24, v11

    .line 152
    .line 153
    move/from16 v38, v13

    .line 154
    .line 155
    xor-int v13, v16, v24

    .line 156
    .line 157
    invoke-static {v13, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 158
    .line 159
    .line 160
    move-result v13

    .line 161
    add-int/2addr v8, v13

    .line 162
    xor-int/2addr v11, v8

    .line 163
    invoke-static {v11, v5}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 164
    .line 165
    .line 166
    move-result v11

    .line 167
    add-int v24, v24, v11

    .line 168
    .line 169
    xor-int v13, v13, v24

    .line 170
    .line 171
    invoke-static {v13, v2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 172
    .line 173
    .line 174
    move-result v13

    .line 175
    add-int v10, v10, v18

    .line 176
    .line 177
    move/from16 v39, v15

    .line 178
    .line 179
    xor-int v15, v34, v10

    .line 180
    .line 181
    invoke-static {v15, v3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 182
    .line 183
    .line 184
    move-result v15

    .line 185
    add-int v26, v26, v15

    .line 186
    .line 187
    xor-int v3, v18, v26

    .line 188
    .line 189
    invoke-static {v3, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    add-int/2addr v10, v3

    .line 194
    xor-int/2addr v15, v10

    .line 195
    invoke-static {v15, v5}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 196
    .line 197
    .line 198
    move-result v15

    .line 199
    add-int v26, v26, v15

    .line 200
    .line 201
    xor-int v3, v3, v26

    .line 202
    .line 203
    invoke-static {v3, v2}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    add-int v12, v12, v20

    .line 208
    .line 209
    xor-int v2, v35, v12

    .line 210
    .line 211
    const/16 v5, 0x10

    .line 212
    .line 213
    invoke-static {v2, v5}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    add-int v28, v28, v2

    .line 218
    .line 219
    xor-int v5, v20, v28

    .line 220
    .line 221
    invoke-static {v5, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    add-int/2addr v12, v5

    .line 226
    xor-int/2addr v2, v12

    .line 227
    const/16 v7, 0x8

    .line 228
    .line 229
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    add-int v28, v28, v2

    .line 234
    .line 235
    xor-int v5, v5, v28

    .line 236
    .line 237
    const/4 v7, 0x7

    .line 238
    invoke-static {v5, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    add-int/2addr v6, v13

    .line 243
    xor-int/2addr v2, v6

    .line 244
    const/16 v7, 0x10

    .line 245
    .line 246
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    add-int v26, v26, v2

    .line 251
    .line 252
    xor-int v7, v13, v26

    .line 253
    .line 254
    const/16 v13, 0xc

    .line 255
    .line 256
    invoke-static {v7, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 257
    .line 258
    .line 259
    move-result v7

    .line 260
    add-int/2addr v6, v7

    .line 261
    xor-int/2addr v2, v6

    .line 262
    const/16 v13, 0x8

    .line 263
    .line 264
    invoke-static {v2, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 265
    .line 266
    .line 267
    move-result v35

    .line 268
    add-int v26, v26, v35

    .line 269
    .line 270
    xor-int v2, v7, v26

    .line 271
    .line 272
    const/4 v7, 0x7

    .line 273
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 274
    .line 275
    .line 276
    move-result v16

    .line 277
    add-int/2addr v8, v3

    .line 278
    xor-int v2, v9, v8

    .line 279
    .line 280
    const/16 v7, 0x10

    .line 281
    .line 282
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    add-int v28, v28, v2

    .line 287
    .line 288
    xor-int v3, v3, v28

    .line 289
    .line 290
    const/16 v13, 0xc

    .line 291
    .line 292
    invoke-static {v3, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    add-int/2addr v8, v3

    .line 297
    xor-int/2addr v2, v8

    .line 298
    const/16 v13, 0x8

    .line 299
    .line 300
    invoke-static {v2, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 301
    .line 302
    .line 303
    move-result v30

    .line 304
    add-int v28, v28, v30

    .line 305
    .line 306
    xor-int v2, v3, v28

    .line 307
    .line 308
    const/4 v7, 0x7

    .line 309
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 310
    .line 311
    .line 312
    move-result v18

    .line 313
    add-int/2addr v10, v5

    .line 314
    xor-int v2, v11, v10

    .line 315
    .line 316
    const/16 v7, 0x10

    .line 317
    .line 318
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    add-int v22, v22, v2

    .line 323
    .line 324
    xor-int v3, v5, v22

    .line 325
    .line 326
    const/16 v13, 0xc

    .line 327
    .line 328
    invoke-static {v3, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 329
    .line 330
    .line 331
    move-result v3

    .line 332
    add-int/2addr v10, v3

    .line 333
    xor-int/2addr v2, v10

    .line 334
    const/16 v13, 0x8

    .line 335
    .line 336
    invoke-static {v2, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 337
    .line 338
    .line 339
    move-result v32

    .line 340
    add-int v22, v22, v32

    .line 341
    .line 342
    xor-int v2, v3, v22

    .line 343
    .line 344
    const/4 v7, 0x7

    .line 345
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 346
    .line 347
    .line 348
    move-result v20

    .line 349
    add-int/2addr v12, v14

    .line 350
    xor-int v2, v15, v12

    .line 351
    .line 352
    const/16 v7, 0x10

    .line 353
    .line 354
    invoke-static {v2, v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 355
    .line 356
    .line 357
    move-result v2

    .line 358
    add-int v24, v24, v2

    .line 359
    .line 360
    xor-int v3, v14, v24

    .line 361
    .line 362
    const/16 v13, 0xc

    .line 363
    .line 364
    invoke-static {v3, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    add-int/2addr v12, v3

    .line 369
    xor-int/2addr v2, v12

    .line 370
    const/16 v13, 0x8

    .line 371
    .line 372
    invoke-static {v2, v13}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 373
    .line 374
    .line 375
    move-result v34

    .line 376
    add-int v24, v24, v34

    .line 377
    .line 378
    xor-int v2, v3, v24

    .line 379
    .line 380
    const/4 v3, 0x7

    .line 381
    invoke-static {v2, v3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    .line 382
    .line 383
    .line 384
    move-result v14

    .line 385
    add-int/lit8 v4, v4, -0x2

    .line 386
    .line 387
    move v3, v7

    .line 388
    move/from16 v9, v36

    .line 389
    .line 390
    move/from16 v11, v37

    .line 391
    .line 392
    move/from16 v13, v38

    .line 393
    .line 394
    move/from16 v15, v39

    .line 395
    .line 396
    const/4 v2, 0x7

    .line 397
    const/16 v5, 0x8

    .line 398
    .line 399
    const/16 v7, 0xc

    .line 400
    .line 401
    goto/16 :goto_0

    .line 402
    .line 403
    :cond_0
    move/from16 v36, v9

    .line 404
    .line 405
    move/from16 v37, v11

    .line 406
    .line 407
    move/from16 v38, v13

    .line 408
    .line 409
    move/from16 v39, v15

    .line 410
    .line 411
    aget v2, v0, v17

    .line 412
    .line 413
    add-int/2addr v6, v2

    .line 414
    aput v6, v1, v17

    .line 415
    .line 416
    aget v2, v0, v19

    .line 417
    .line 418
    add-int/2addr v8, v2

    .line 419
    aput v8, v1, v19

    .line 420
    .line 421
    aget v2, v0, v27

    .line 422
    .line 423
    add-int/2addr v10, v2

    .line 424
    aput v10, v1, v27

    .line 425
    .line 426
    aget v2, v0, v36

    .line 427
    .line 428
    add-int/2addr v12, v2

    .line 429
    aput v12, v1, v36

    .line 430
    .line 431
    aget v2, v0, v37

    .line 432
    .line 433
    add-int/2addr v14, v2

    .line 434
    aput v14, v1, v37

    .line 435
    .line 436
    aget v2, v0, v38

    .line 437
    .line 438
    add-int v16, v16, v2

    .line 439
    .line 440
    aput v16, v1, v38

    .line 441
    .line 442
    aget v2, v0, v39

    .line 443
    .line 444
    add-int v18, v18, v2

    .line 445
    .line 446
    aput v18, v1, v39

    .line 447
    .line 448
    const/16 v40, 0x7

    .line 449
    .line 450
    aget v2, v0, v40

    .line 451
    .line 452
    add-int v20, v20, v2

    .line 453
    .line 454
    aput v20, v1, v40

    .line 455
    .line 456
    const/16 v41, 0x8

    .line 457
    .line 458
    aget v2, v0, v41

    .line 459
    .line 460
    add-int v22, v22, v2

    .line 461
    .line 462
    aput v22, v1, v41

    .line 463
    .line 464
    aget v2, v0, v21

    .line 465
    .line 466
    add-int v24, v24, v2

    .line 467
    .line 468
    aput v24, v1, v21

    .line 469
    .line 470
    aget v2, v0, v23

    .line 471
    .line 472
    add-int v26, v26, v2

    .line 473
    .line 474
    aput v26, v1, v23

    .line 475
    .line 476
    aget v2, v0, v25

    .line 477
    .line 478
    add-int v28, v28, v2

    .line 479
    .line 480
    aput v28, v1, v25

    .line 481
    .line 482
    const/16 v42, 0xc

    .line 483
    .line 484
    aget v2, v0, v42

    .line 485
    .line 486
    add-int v30, v30, v2

    .line 487
    .line 488
    aput v30, v1, v42

    .line 489
    .line 490
    aget v2, v0, v29

    .line 491
    .line 492
    add-int v32, v32, v2

    .line 493
    .line 494
    aput v32, v1, v29

    .line 495
    .line 496
    aget v2, v0, v31

    .line 497
    .line 498
    add-int v34, v34, v2

    .line 499
    .line 500
    aput v34, v1, v31

    .line 501
    .line 502
    aget v0, v0, v33

    .line 503
    .line 504
    add-int v35, v35, v0

    .line 505
    .line 506
    aput v35, v1, v33

    .line 507
    .line 508
    return-void

    .line 509
    :cond_1
    const-string v0, "Number of rounds must be even"

    .line 510
    .line 511
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    return-void

    .line 515
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 516
    .line 517
    .line 518
    return-void

    .line 519
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    .line 520
    .line 521
    .line 522
    return-void
.end method


# virtual methods
.method public advanceCounter()V
    .locals 2

    .line 38
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v0, 0xc

    aget v1, p0, v0

    add-int/lit8 v1, v1, 0x1

    aput v1, p0, v0

    if-nez v1, :cond_0

    const/16 v0, 0xd

    .line 39
    aget v1, p0, v0

    add-int/lit8 v1, v1, 0x1

    aput v1, p0, v0

    :cond_0
    return-void
.end method

.method public advanceCounter(J)V
    .locals 3

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    ushr-long v0, p1, v0

    .line 4
    .line 5
    long-to-int v0, v0

    .line 6
    long-to-int p1, p1

    .line 7
    const/16 p2, 0xd

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 12
    .line 13
    aget v2, v1, p2

    .line 14
    .line 15
    add-int/2addr v2, v0

    .line 16
    aput v2, v1, p2

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 19
    .line 20
    const/16 v0, 0xc

    .line 21
    .line 22
    aget v1, p0, v0

    .line 23
    .line 24
    add-int/2addr p1, v1

    .line 25
    aput p1, p0, v0

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    if-ge p1, v1, :cond_1

    .line 30
    .line 31
    aget p1, p0, p2

    .line 32
    .line 33
    add-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    aput p1, p0, p2

    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public generateKeyStream([B)V
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rounds:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->x:[I

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/engines/ChaChaEngine;->chachaCore(I[I[I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->x:[I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p0, p1, v0}, Lorg/spongycastle/util/Pack;->intToLittleEndian([I[BI)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ChaCha"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->rounds:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getCounter()J
    .locals 6

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 2
    .line 3
    const/16 v0, 0xd

    .line 4
    .line 5
    aget v0, p0, v0

    .line 6
    .line 7
    int-to-long v0, v0

    .line 8
    const/16 v2, 0x20

    .line 9
    .line 10
    shl-long/2addr v0, v2

    .line 11
    const/16 v2, 0xc

    .line 12
    .line 13
    aget p0, p0, v2

    .line 14
    .line 15
    int-to-long v2, p0

    .line 16
    const-wide v4, 0xffffffffL

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    and-long/2addr v2, v4

    .line 22
    or-long/2addr v0, v2

    .line 23
    return-wide v0
.end method

.method public resetCounter()V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 2
    .line 3
    const/16 v0, 0xd

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    const/16 v0, 0xc

    .line 9
    .line 10
    aput v1, p0, v0

    .line 11
    .line 12
    return-void
.end method

.method public retreatCounter()V
    .locals 4

    .line 72
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v0, 0xc

    aget v1, p0, v0

    const/16 v2, 0xd

    if-nez v1, :cond_1

    aget v3, p0, v2

    if-eqz v3, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    const-string p0, "attempt to reduce counter past zero."

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    add-int/lit8 v1, v1, -0x1

    .line 74
    aput v1, p0, v0

    const/4 v0, -0x1

    if-ne v1, v0, :cond_2

    .line 75
    aget v0, p0, v2

    add-int/lit8 v0, v0, -0x1

    aput v0, p0, v2

    :cond_2
    return-void
.end method

.method public retreatCounter(J)V
    .locals 10

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    ushr-long v0, p1, v0

    .line 4
    .line 5
    long-to-int v0, v0

    .line 6
    long-to-int p1, p1

    .line 7
    const-string p2, "attempt to reduce counter past zero."

    .line 8
    .line 9
    const-wide v1, 0xffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    const/16 v3, 0xd

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 19
    .line 20
    aget v5, v4, v3

    .line 21
    .line 22
    int-to-long v6, v5

    .line 23
    and-long/2addr v6, v1

    .line 24
    int-to-long v8, v0

    .line 25
    and-long/2addr v8, v1

    .line 26
    cmp-long v6, v6, v8

    .line 27
    .line 28
    if-ltz v6, :cond_0

    .line 29
    .line 30
    sub-int/2addr v5, v0

    .line 31
    aput v5, v4, v3

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {p2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    :goto_0
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 39
    .line 40
    const/16 v0, 0xc

    .line 41
    .line 42
    aget v4, p0, v0

    .line 43
    .line 44
    int-to-long v5, v4

    .line 45
    and-long/2addr v5, v1

    .line 46
    int-to-long v7, p1

    .line 47
    and-long/2addr v1, v7

    .line 48
    cmp-long v1, v5, v1

    .line 49
    .line 50
    if-ltz v1, :cond_2

    .line 51
    .line 52
    sub-int/2addr v4, p1

    .line 53
    aput v4, p0, v0

    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    aget v1, p0, v3

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    add-int/lit8 v1, v1, -0x1

    .line 61
    .line 62
    aput v1, p0, v3

    .line 63
    .line 64
    sub-int/2addr v4, p1

    .line 65
    aput v4, p0, v0

    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    invoke-static {p2}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public setKey([B[B)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-eqz p1, :cond_3

    .line 4
    .line 5
    array-length v2, p1

    .line 6
    const/16 v3, 0x20

    .line 7
    .line 8
    const/16 v4, 0x10

    .line 9
    .line 10
    if-eq v2, v4, :cond_1

    .line 11
    .line 12
    array-length v2, p1

    .line 13
    if-ne v2, v3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/ChaChaEngine;->getAlgorithmName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, " requires 128 bit or 256 bit key"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/iki;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 27
    .line 28
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    aput v5, v2, v1

    .line 33
    .line 34
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 35
    .line 36
    const/4 v5, 0x5

    .line 37
    invoke-static {p1, v1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    aput v6, v2, v5

    .line 42
    .line 43
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 44
    .line 45
    const/4 v5, 0x6

    .line 46
    const/16 v6, 0x8

    .line 47
    .line 48
    invoke-static {p1, v6}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    aput v7, v2, v5

    .line 53
    .line 54
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 55
    .line 56
    const/4 v5, 0x7

    .line 57
    const/16 v7, 0xc

    .line 58
    .line 59
    invoke-static {p1, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    aput v8, v2, v5

    .line 64
    .line 65
    array-length v2, p1

    .line 66
    if-ne v2, v3, :cond_2

    .line 67
    .line 68
    sget-object v2, Lorg/spongycastle/crypto/engines/Salsa20Engine;->sigma:[B

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    sget-object v2, Lorg/spongycastle/crypto/engines/Salsa20Engine;->tau:[B

    .line 72
    .line 73
    move v4, v0

    .line 74
    :goto_1
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 75
    .line 76
    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    aput v5, v3, v6

    .line 81
    .line 82
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 83
    .line 84
    add-int/lit8 v5, v4, 0x4

    .line 85
    .line 86
    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    const/16 v8, 0x9

    .line 91
    .line 92
    aput v5, v3, v8

    .line 93
    .line 94
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 95
    .line 96
    add-int/lit8 v5, v4, 0x8

    .line 97
    .line 98
    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    const/16 v8, 0xa

    .line 103
    .line 104
    aput v5, v3, v8

    .line 105
    .line 106
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 107
    .line 108
    add-int/2addr v4, v7

    .line 109
    invoke-static {p1, v4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    const/16 v4, 0xb

    .line 114
    .line 115
    aput p1, v3, v4

    .line 116
    .line 117
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 118
    .line 119
    invoke-static {v2, v0}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    aput v3, p1, v0

    .line 124
    .line 125
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 126
    .line 127
    const/4 v3, 0x1

    .line 128
    invoke-static {v2, v1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    aput v4, p1, v3

    .line 133
    .line 134
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 135
    .line 136
    const/4 v3, 0x2

    .line 137
    invoke-static {v2, v6}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    aput v4, p1, v3

    .line 142
    .line 143
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 144
    .line 145
    const/4 v3, 0x3

    .line 146
    invoke-static {v2, v7}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    aput v2, p1, v3

    .line 151
    .line 152
    :cond_3
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 153
    .line 154
    const/16 v2, 0xe

    .line 155
    .line 156
    invoke-static {p2, v0}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    aput v0, p1, v2

    .line 161
    .line 162
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 163
    .line 164
    const/16 p1, 0xf

    .line 165
    .line 166
    invoke-static {p2, v1}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    aput p2, p0, p1

    .line 171
    .line 172
    return-void
.end method

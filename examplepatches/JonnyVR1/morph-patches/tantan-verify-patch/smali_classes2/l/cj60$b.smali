.class public Ll/cj60$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cj60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:C

.field public final b:[F


# direct methods
.method public constructor <init>(C[F)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-char p1, p0, Ll/cj60$b;->a:C

    .line 21
    iput-object p2, p0, Ll/cj60$b;->b:[F

    return-void
.end method

.method public constructor <init>(Ll/cj60$b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-char v0, p1, Ll/cj60$b;->a:C

    .line 5
    .line 6
    iput-char v0, p0, Ll/cj60$b;->a:C

    .line 7
    .line 8
    iget-object p1, p1, Ll/cj60$b;->b:[F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    array-length v1, p1

    .line 12
    invoke-static {p1, v0, v1}, Ll/cj60;->c([FII)[F

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/cj60$b;->b:[F

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/cj60$b;)C
    .locals 0

    .line 1
    iget-char p0, p0, Ll/cj60$b;->a:C

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/cj60$b;C)C
    .locals 0

    .line 1
    iput-char p1, p0, Ll/cj60$b;->a:C

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/cj60$b;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cj60$b;->b:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Landroid/graphics/Path;[FCC[F)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Ll/cj60$b;->e(Landroid/graphics/Path;[FCC[F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Landroid/graphics/Path;[FCC[F)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v10, p3

    .line 4
    .line 5
    move-object/from16 v11, p4

    .line 6
    .line 7
    const/4 v12, 0x0

    .line 8
    aget v1, p1, v12

    .line 9
    .line 10
    const/4 v13, 0x1

    .line 11
    aget v2, p1, v13

    .line 12
    .line 13
    const/4 v14, 0x2

    .line 14
    aget v3, p1, v14

    .line 15
    .line 16
    const/4 v15, 0x3

    .line 17
    aget v4, p1, v15

    .line 18
    .line 19
    const/16 v16, 0x4

    .line 20
    .line 21
    aget v5, p1, v16

    .line 22
    .line 23
    const/16 v17, 0x5

    .line 24
    .line 25
    aget v6, p1, v17

    .line 26
    .line 27
    sparse-switch v10, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    :goto_0
    :sswitch_0
    move/from16 v18, v14

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :sswitch_1
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    .line 37
    .line 38
    .line 39
    move v1, v5

    .line 40
    move v3, v1

    .line 41
    move v2, v6

    .line 42
    move v4, v2

    .line 43
    goto :goto_0

    .line 44
    :sswitch_2
    move/from16 v18, v16

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :sswitch_3
    move/from16 v18, v13

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :sswitch_4
    const/4 v7, 0x6

    .line 51
    :goto_1
    move/from16 v18, v7

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :sswitch_5
    const/4 v7, 0x7

    .line 55
    goto :goto_1

    .line 56
    :goto_2
    move v7, v1

    .line 57
    move v8, v2

    .line 58
    move/from16 v19, v5

    .line 59
    .line 60
    move/from16 v20, v6

    .line 61
    .line 62
    move v9, v12

    .line 63
    move/from16 v1, p2

    .line 64
    .line 65
    :goto_3
    array-length v2, v11

    .line 66
    if-ge v9, v2, :cond_20

    .line 67
    .line 68
    const/16 v2, 0x41

    .line 69
    .line 70
    if-eq v10, v2, :cond_1d

    .line 71
    .line 72
    const/16 v2, 0x43

    .line 73
    .line 74
    if-eq v10, v2, :cond_1c

    .line 75
    .line 76
    const/16 v6, 0x48

    .line 77
    .line 78
    if-eq v10, v6, :cond_1b

    .line 79
    .line 80
    const/16 v6, 0x51

    .line 81
    .line 82
    if-eq v10, v6, :cond_1a

    .line 83
    .line 84
    move/from16 v21, v12

    .line 85
    .line 86
    const/16 v12, 0x56

    .line 87
    .line 88
    if-eq v10, v12, :cond_19

    .line 89
    .line 90
    const/16 v12, 0x61

    .line 91
    .line 92
    if-eq v10, v12, :cond_16

    .line 93
    .line 94
    const/16 v12, 0x63

    .line 95
    .line 96
    if-eq v10, v12, :cond_15

    .line 97
    .line 98
    move/from16 v22, v13

    .line 99
    .line 100
    const/16 v13, 0x68

    .line 101
    .line 102
    if-eq v10, v13, :cond_14

    .line 103
    .line 104
    const/16 v13, 0x71

    .line 105
    .line 106
    if-eq v10, v13, :cond_13

    .line 107
    .line 108
    move/from16 v23, v14

    .line 109
    .line 110
    const/16 v14, 0x76

    .line 111
    .line 112
    if-eq v10, v14, :cond_12

    .line 113
    .line 114
    const/16 v14, 0x4c

    .line 115
    .line 116
    if-eq v10, v14, :cond_11

    .line 117
    .line 118
    const/16 v14, 0x4d

    .line 119
    .line 120
    if-eq v10, v14, :cond_f

    .line 121
    .line 122
    const/16 v14, 0x73

    .line 123
    .line 124
    move/from16 v24, v15

    .line 125
    .line 126
    const/16 v15, 0x53

    .line 127
    .line 128
    const/high16 v25, 0x40000000    # 2.0f

    .line 129
    .line 130
    if-eq v10, v15, :cond_c

    .line 131
    .line 132
    const/16 v5, 0x74

    .line 133
    .line 134
    const/16 v15, 0x54

    .line 135
    .line 136
    if-eq v10, v15, :cond_9

    .line 137
    .line 138
    const/16 v2, 0x6c

    .line 139
    .line 140
    if-eq v10, v2, :cond_8

    .line 141
    .line 142
    const/16 v2, 0x6d

    .line 143
    .line 144
    if-eq v10, v2, :cond_6

    .line 145
    .line 146
    if-eq v10, v14, :cond_3

    .line 147
    .line 148
    if-eq v10, v5, :cond_0

    .line 149
    .line 150
    :goto_4
    move v14, v9

    .line 151
    goto/16 :goto_18

    .line 152
    .line 153
    :cond_0
    if-eq v1, v13, :cond_2

    .line 154
    .line 155
    if-eq v1, v5, :cond_2

    .line 156
    .line 157
    if-eq v1, v6, :cond_2

    .line 158
    .line 159
    if-ne v1, v15, :cond_1

    .line 160
    .line 161
    goto :goto_5

    .line 162
    :cond_1
    const/4 v1, 0x0

    .line 163
    const/4 v5, 0x0

    .line 164
    goto :goto_6

    .line 165
    :cond_2
    :goto_5
    sub-float v5, v7, v3

    .line 166
    .line 167
    sub-float v1, v8, v4

    .line 168
    .line 169
    :goto_6
    aget v2, v11, v9

    .line 170
    .line 171
    add-int/lit8 v3, v9, 0x1

    .line 172
    .line 173
    aget v4, v11, v3

    .line 174
    .line 175
    invoke-virtual {v0, v5, v1, v2, v4}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 176
    .line 177
    .line 178
    add-float/2addr v5, v7

    .line 179
    add-float/2addr v1, v8

    .line 180
    aget v2, v11, v9

    .line 181
    .line 182
    add-float/2addr v7, v2

    .line 183
    aget v2, v11, v3

    .line 184
    .line 185
    add-float/2addr v8, v2

    .line 186
    move v4, v1

    .line 187
    move v3, v5

    .line 188
    goto :goto_4

    .line 189
    :cond_3
    if-eq v1, v12, :cond_5

    .line 190
    .line 191
    if-eq v1, v14, :cond_5

    .line 192
    .line 193
    const/16 v2, 0x43

    .line 194
    .line 195
    if-eq v1, v2, :cond_5

    .line 196
    .line 197
    const/16 v2, 0x53

    .line 198
    .line 199
    if-ne v1, v2, :cond_4

    .line 200
    .line 201
    goto :goto_7

    .line 202
    :cond_4
    const/4 v1, 0x0

    .line 203
    const/4 v2, 0x0

    .line 204
    goto :goto_8

    .line 205
    :cond_5
    :goto_7
    sub-float v5, v7, v3

    .line 206
    .line 207
    sub-float v1, v8, v4

    .line 208
    .line 209
    move v2, v1

    .line 210
    move v1, v5

    .line 211
    :goto_8
    aget v3, v11, v9

    .line 212
    .line 213
    add-int/lit8 v12, v9, 0x1

    .line 214
    .line 215
    aget v4, v11, v12

    .line 216
    .line 217
    add-int/lit8 v13, v9, 0x2

    .line 218
    .line 219
    aget v5, v11, v13

    .line 220
    .line 221
    add-int/lit8 v14, v9, 0x3

    .line 222
    .line 223
    aget v6, v11, v14

    .line 224
    .line 225
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 226
    .line 227
    .line 228
    aget v1, v11, v9

    .line 229
    .line 230
    add-float/2addr v1, v7

    .line 231
    aget v2, v11, v12

    .line 232
    .line 233
    add-float/2addr v2, v8

    .line 234
    aget v3, v11, v13

    .line 235
    .line 236
    add-float/2addr v7, v3

    .line 237
    aget v3, v11, v14

    .line 238
    .line 239
    :goto_9
    add-float/2addr v8, v3

    .line 240
    move v3, v1

    .line 241
    move v4, v2

    .line 242
    goto :goto_4

    .line 243
    :cond_6
    aget v1, v11, v9

    .line 244
    .line 245
    add-float/2addr v7, v1

    .line 246
    add-int/lit8 v2, v9, 0x1

    .line 247
    .line 248
    aget v2, v11, v2

    .line 249
    .line 250
    add-float/2addr v8, v2

    .line 251
    if-lez v9, :cond_7

    .line 252
    .line 253
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 254
    .line 255
    .line 256
    goto :goto_4

    .line 257
    :cond_7
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->rMoveTo(FF)V

    .line 258
    .line 259
    .line 260
    move/from16 v19, v7

    .line 261
    .line 262
    :goto_a
    move/from16 v20, v8

    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_8
    aget v1, v11, v9

    .line 266
    .line 267
    add-int/lit8 v2, v9, 0x1

    .line 268
    .line 269
    aget v5, v11, v2

    .line 270
    .line 271
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 272
    .line 273
    .line 274
    aget v1, v11, v9

    .line 275
    .line 276
    add-float/2addr v7, v1

    .line 277
    aget v1, v11, v2

    .line 278
    .line 279
    :goto_b
    add-float/2addr v8, v1

    .line 280
    goto/16 :goto_4

    .line 281
    .line 282
    :cond_9
    if-eq v1, v13, :cond_a

    .line 283
    .line 284
    if-eq v1, v5, :cond_a

    .line 285
    .line 286
    if-eq v1, v6, :cond_a

    .line 287
    .line 288
    if-ne v1, v15, :cond_b

    .line 289
    .line 290
    :cond_a
    mul-float v7, v7, v25

    .line 291
    .line 292
    sub-float/2addr v7, v3

    .line 293
    mul-float v8, v8, v25

    .line 294
    .line 295
    sub-float/2addr v8, v4

    .line 296
    :cond_b
    aget v1, v11, v9

    .line 297
    .line 298
    add-int/lit8 v2, v9, 0x1

    .line 299
    .line 300
    aget v3, v11, v2

    .line 301
    .line 302
    invoke-virtual {v0, v7, v8, v1, v3}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 303
    .line 304
    .line 305
    aget v1, v11, v9

    .line 306
    .line 307
    aget v2, v11, v2

    .line 308
    .line 309
    move v3, v7

    .line 310
    move v4, v8

    .line 311
    move v14, v9

    .line 312
    move v7, v1

    .line 313
    :goto_c
    move v8, v2

    .line 314
    goto/16 :goto_18

    .line 315
    .line 316
    :cond_c
    if-eq v1, v12, :cond_e

    .line 317
    .line 318
    if-eq v1, v14, :cond_e

    .line 319
    .line 320
    const/16 v2, 0x43

    .line 321
    .line 322
    if-eq v1, v2, :cond_e

    .line 323
    .line 324
    const/16 v2, 0x53

    .line 325
    .line 326
    if-ne v1, v2, :cond_d

    .line 327
    .line 328
    goto :goto_e

    .line 329
    :cond_d
    :goto_d
    move v1, v7

    .line 330
    move v2, v8

    .line 331
    goto :goto_f

    .line 332
    :cond_e
    :goto_e
    mul-float v7, v7, v25

    .line 333
    .line 334
    sub-float/2addr v7, v3

    .line 335
    mul-float v8, v8, v25

    .line 336
    .line 337
    sub-float/2addr v8, v4

    .line 338
    goto :goto_d

    .line 339
    :goto_f
    aget v3, v11, v9

    .line 340
    .line 341
    add-int/lit8 v7, v9, 0x1

    .line 342
    .line 343
    aget v4, v11, v7

    .line 344
    .line 345
    add-int/lit8 v8, v9, 0x2

    .line 346
    .line 347
    aget v5, v11, v8

    .line 348
    .line 349
    add-int/lit8 v12, v9, 0x3

    .line 350
    .line 351
    aget v6, v11, v12

    .line 352
    .line 353
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 354
    .line 355
    .line 356
    aget v1, v11, v9

    .line 357
    .line 358
    aget v2, v11, v7

    .line 359
    .line 360
    aget v3, v11, v8

    .line 361
    .line 362
    aget v4, v11, v12

    .line 363
    .line 364
    move v7, v3

    .line 365
    move v8, v4

    .line 366
    move v14, v9

    .line 367
    :goto_10
    move v3, v1

    .line 368
    move v4, v2

    .line 369
    goto/16 :goto_18

    .line 370
    .line 371
    :cond_f
    move/from16 v24, v15

    .line 372
    .line 373
    aget v1, v11, v9

    .line 374
    .line 375
    add-int/lit8 v2, v9, 0x1

    .line 376
    .line 377
    aget v2, v11, v2

    .line 378
    .line 379
    if-lez v9, :cond_10

    .line 380
    .line 381
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 382
    .line 383
    .line 384
    :goto_11
    move v7, v1

    .line 385
    move v8, v2

    .line 386
    goto/16 :goto_4

    .line 387
    .line 388
    :cond_10
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 389
    .line 390
    .line 391
    move v7, v1

    .line 392
    move/from16 v19, v7

    .line 393
    .line 394
    move v8, v2

    .line 395
    goto/16 :goto_a

    .line 396
    .line 397
    :cond_11
    move/from16 v24, v15

    .line 398
    .line 399
    aget v1, v11, v9

    .line 400
    .line 401
    add-int/lit8 v2, v9, 0x1

    .line 402
    .line 403
    aget v5, v11, v2

    .line 404
    .line 405
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 406
    .line 407
    .line 408
    aget v1, v11, v9

    .line 409
    .line 410
    aget v2, v11, v2

    .line 411
    .line 412
    goto :goto_11

    .line 413
    :cond_12
    move/from16 v24, v15

    .line 414
    .line 415
    aget v1, v11, v9

    .line 416
    .line 417
    const/4 v2, 0x0

    .line 418
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 419
    .line 420
    .line 421
    aget v1, v11, v9

    .line 422
    .line 423
    goto/16 :goto_b

    .line 424
    .line 425
    :cond_13
    move/from16 v23, v14

    .line 426
    .line 427
    move/from16 v24, v15

    .line 428
    .line 429
    aget v1, v11, v9

    .line 430
    .line 431
    add-int/lit8 v2, v9, 0x1

    .line 432
    .line 433
    aget v3, v11, v2

    .line 434
    .line 435
    add-int/lit8 v4, v9, 0x2

    .line 436
    .line 437
    aget v5, v11, v4

    .line 438
    .line 439
    add-int/lit8 v6, v9, 0x3

    .line 440
    .line 441
    aget v12, v11, v6

    .line 442
    .line 443
    invoke-virtual {v0, v1, v3, v5, v12}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 444
    .line 445
    .line 446
    aget v1, v11, v9

    .line 447
    .line 448
    add-float/2addr v1, v7

    .line 449
    aget v2, v11, v2

    .line 450
    .line 451
    add-float/2addr v2, v8

    .line 452
    aget v3, v11, v4

    .line 453
    .line 454
    add-float/2addr v7, v3

    .line 455
    aget v3, v11, v6

    .line 456
    .line 457
    goto/16 :goto_9

    .line 458
    .line 459
    :cond_14
    move/from16 v23, v14

    .line 460
    .line 461
    move/from16 v24, v15

    .line 462
    .line 463
    aget v1, v11, v9

    .line 464
    .line 465
    const/4 v2, 0x0

    .line 466
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 467
    .line 468
    .line 469
    aget v1, v11, v9

    .line 470
    .line 471
    add-float/2addr v7, v1

    .line 472
    goto/16 :goto_4

    .line 473
    .line 474
    :cond_15
    move/from16 v22, v13

    .line 475
    .line 476
    move/from16 v23, v14

    .line 477
    .line 478
    move/from16 v24, v15

    .line 479
    .line 480
    aget v1, v11, v9

    .line 481
    .line 482
    add-int/lit8 v2, v9, 0x1

    .line 483
    .line 484
    aget v2, v11, v2

    .line 485
    .line 486
    add-int/lit8 v12, v9, 0x2

    .line 487
    .line 488
    aget v3, v11, v12

    .line 489
    .line 490
    add-int/lit8 v13, v9, 0x3

    .line 491
    .line 492
    aget v4, v11, v13

    .line 493
    .line 494
    add-int/lit8 v14, v9, 0x4

    .line 495
    .line 496
    aget v5, v11, v14

    .line 497
    .line 498
    add-int/lit8 v15, v9, 0x5

    .line 499
    .line 500
    aget v6, v11, v15

    .line 501
    .line 502
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 503
    .line 504
    .line 505
    aget v0, v11, v12

    .line 506
    .line 507
    add-float/2addr v0, v7

    .line 508
    aget v1, v11, v13

    .line 509
    .line 510
    add-float/2addr v1, v8

    .line 511
    aget v2, v11, v14

    .line 512
    .line 513
    add-float/2addr v7, v2

    .line 514
    aget v2, v11, v15

    .line 515
    .line 516
    add-float/2addr v8, v2

    .line 517
    move v3, v0

    .line 518
    move v4, v1

    .line 519
    goto/16 :goto_4

    .line 520
    .line 521
    :cond_16
    move/from16 v22, v13

    .line 522
    .line 523
    move/from16 v23, v14

    .line 524
    .line 525
    move/from16 v24, v15

    .line 526
    .line 527
    add-int/lit8 v12, v9, 0x5

    .line 528
    .line 529
    aget v0, v11, v12

    .line 530
    .line 531
    add-float v3, v0, v7

    .line 532
    .line 533
    add-int/lit8 v13, v9, 0x6

    .line 534
    .line 535
    aget v0, v11, v13

    .line 536
    .line 537
    add-float v4, v0, v8

    .line 538
    .line 539
    aget v5, v11, v9

    .line 540
    .line 541
    add-int/lit8 v0, v9, 0x1

    .line 542
    .line 543
    aget v6, v11, v0

    .line 544
    .line 545
    add-int/lit8 v0, v9, 0x2

    .line 546
    .line 547
    aget v0, v11, v0

    .line 548
    .line 549
    add-int/lit8 v1, v9, 0x3

    .line 550
    .line 551
    aget v1, v11, v1

    .line 552
    .line 553
    const/4 v2, 0x0

    .line 554
    cmpl-float v1, v1, v2

    .line 555
    .line 556
    if-eqz v1, :cond_17

    .line 557
    .line 558
    move v1, v2

    .line 559
    move v2, v8

    .line 560
    move/from16 v8, v22

    .line 561
    .line 562
    goto :goto_12

    .line 563
    :cond_17
    move v1, v2

    .line 564
    move v2, v8

    .line 565
    move/from16 v8, v21

    .line 566
    .line 567
    :goto_12
    add-int/lit8 v14, v9, 0x4

    .line 568
    .line 569
    aget v14, v11, v14

    .line 570
    .line 571
    cmpl-float v1, v14, v1

    .line 572
    .line 573
    move v14, v9

    .line 574
    if-eqz v1, :cond_18

    .line 575
    .line 576
    move/from16 v9, v22

    .line 577
    .line 578
    :goto_13
    move v1, v7

    .line 579
    move v7, v0

    .line 580
    move-object/from16 v0, p0

    .line 581
    .line 582
    goto :goto_14

    .line 583
    :cond_18
    move/from16 v9, v21

    .line 584
    .line 585
    goto :goto_13

    .line 586
    :goto_14
    invoke-static/range {v0 .. v9}, Ll/cj60$b;->g(Landroid/graphics/Path;FFFFFFFZZ)V

    .line 587
    .line 588
    .line 589
    aget v3, v11, v12

    .line 590
    .line 591
    add-float v7, v1, v3

    .line 592
    .line 593
    aget v1, v11, v13

    .line 594
    .line 595
    add-float v8, v2, v1

    .line 596
    .line 597
    move v3, v7

    .line 598
    move v4, v8

    .line 599
    goto/16 :goto_18

    .line 600
    .line 601
    :cond_19
    move v1, v7

    .line 602
    move/from16 v22, v13

    .line 603
    .line 604
    move/from16 v23, v14

    .line 605
    .line 606
    move/from16 v24, v15

    .line 607
    .line 608
    move v14, v9

    .line 609
    aget v2, v11, v14

    .line 610
    .line 611
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 612
    .line 613
    .line 614
    aget v2, v11, v14

    .line 615
    .line 616
    goto/16 :goto_c

    .line 617
    .line 618
    :cond_1a
    move/from16 v21, v12

    .line 619
    .line 620
    move/from16 v22, v13

    .line 621
    .line 622
    move/from16 v23, v14

    .line 623
    .line 624
    move/from16 v24, v15

    .line 625
    .line 626
    move v14, v9

    .line 627
    aget v1, v11, v14

    .line 628
    .line 629
    add-int/lit8 v9, v14, 0x1

    .line 630
    .line 631
    aget v2, v11, v9

    .line 632
    .line 633
    add-int/lit8 v3, v14, 0x2

    .line 634
    .line 635
    aget v4, v11, v3

    .line 636
    .line 637
    add-int/lit8 v5, v14, 0x3

    .line 638
    .line 639
    aget v6, v11, v5

    .line 640
    .line 641
    invoke-virtual {v0, v1, v2, v4, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 642
    .line 643
    .line 644
    aget v1, v11, v14

    .line 645
    .line 646
    aget v2, v11, v9

    .line 647
    .line 648
    aget v3, v11, v3

    .line 649
    .line 650
    aget v4, v11, v5

    .line 651
    .line 652
    move v7, v3

    .line 653
    move v8, v4

    .line 654
    goto/16 :goto_10

    .line 655
    .line 656
    :cond_1b
    move v2, v8

    .line 657
    move/from16 v21, v12

    .line 658
    .line 659
    move/from16 v22, v13

    .line 660
    .line 661
    move/from16 v23, v14

    .line 662
    .line 663
    move/from16 v24, v15

    .line 664
    .line 665
    move v14, v9

    .line 666
    aget v1, v11, v14

    .line 667
    .line 668
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 669
    .line 670
    .line 671
    aget v1, v11, v14

    .line 672
    .line 673
    move v7, v1

    .line 674
    goto/16 :goto_18

    .line 675
    .line 676
    :cond_1c
    move/from16 v21, v12

    .line 677
    .line 678
    move/from16 v22, v13

    .line 679
    .line 680
    move/from16 v23, v14

    .line 681
    .line 682
    move/from16 v24, v15

    .line 683
    .line 684
    move v14, v9

    .line 685
    aget v1, v11, v14

    .line 686
    .line 687
    add-int/lit8 v9, v14, 0x1

    .line 688
    .line 689
    aget v2, v11, v9

    .line 690
    .line 691
    add-int/lit8 v9, v14, 0x2

    .line 692
    .line 693
    aget v3, v11, v9

    .line 694
    .line 695
    add-int/lit8 v7, v14, 0x3

    .line 696
    .line 697
    aget v4, v11, v7

    .line 698
    .line 699
    add-int/lit8 v8, v14, 0x4

    .line 700
    .line 701
    aget v5, v11, v8

    .line 702
    .line 703
    add-int/lit8 v12, v14, 0x5

    .line 704
    .line 705
    aget v6, v11, v12

    .line 706
    .line 707
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 708
    .line 709
    .line 710
    aget v0, v11, v8

    .line 711
    .line 712
    aget v1, v11, v12

    .line 713
    .line 714
    aget v2, v11, v9

    .line 715
    .line 716
    aget v3, v11, v7

    .line 717
    .line 718
    move v7, v0

    .line 719
    move v8, v1

    .line 720
    move v4, v3

    .line 721
    move v3, v2

    .line 722
    goto :goto_18

    .line 723
    :cond_1d
    move v1, v7

    .line 724
    move v2, v8

    .line 725
    move/from16 v21, v12

    .line 726
    .line 727
    move/from16 v22, v13

    .line 728
    .line 729
    move/from16 v23, v14

    .line 730
    .line 731
    move/from16 v24, v15

    .line 732
    .line 733
    move v14, v9

    .line 734
    add-int/lit8 v12, v14, 0x5

    .line 735
    .line 736
    aget v3, v11, v12

    .line 737
    .line 738
    add-int/lit8 v13, v14, 0x6

    .line 739
    .line 740
    aget v4, v11, v13

    .line 741
    .line 742
    aget v5, v11, v14

    .line 743
    .line 744
    add-int/lit8 v9, v14, 0x1

    .line 745
    .line 746
    aget v6, v11, v9

    .line 747
    .line 748
    add-int/lit8 v9, v14, 0x2

    .line 749
    .line 750
    aget v7, v11, v9

    .line 751
    .line 752
    add-int/lit8 v9, v14, 0x3

    .line 753
    .line 754
    aget v0, v11, v9

    .line 755
    .line 756
    const/4 v8, 0x0

    .line 757
    cmpl-float v0, v0, v8

    .line 758
    .line 759
    if-eqz v0, :cond_1e

    .line 760
    .line 761
    move v0, v8

    .line 762
    move/from16 v8, v22

    .line 763
    .line 764
    goto :goto_15

    .line 765
    :cond_1e
    move v0, v8

    .line 766
    move/from16 v8, v21

    .line 767
    .line 768
    :goto_15
    add-int/lit8 v9, v14, 0x4

    .line 769
    .line 770
    aget v9, v11, v9

    .line 771
    .line 772
    cmpl-float v0, v9, v0

    .line 773
    .line 774
    if-eqz v0, :cond_1f

    .line 775
    .line 776
    move/from16 v9, v22

    .line 777
    .line 778
    :goto_16
    move-object/from16 v0, p0

    .line 779
    .line 780
    goto :goto_17

    .line 781
    :cond_1f
    move/from16 v9, v21

    .line 782
    .line 783
    goto :goto_16

    .line 784
    :goto_17
    invoke-static/range {v0 .. v9}, Ll/cj60$b;->g(Landroid/graphics/Path;FFFFFFFZZ)V

    .line 785
    .line 786
    .line 787
    aget v0, v11, v12

    .line 788
    .line 789
    aget v1, v11, v13

    .line 790
    .line 791
    move v3, v0

    .line 792
    move v7, v3

    .line 793
    move v4, v1

    .line 794
    move v8, v4

    .line 795
    :goto_18
    add-int v9, v14, v18

    .line 796
    .line 797
    move-object/from16 v0, p0

    .line 798
    .line 799
    move v1, v10

    .line 800
    move/from16 v12, v21

    .line 801
    .line 802
    move/from16 v13, v22

    .line 803
    .line 804
    move/from16 v14, v23

    .line 805
    .line 806
    move/from16 v15, v24

    .line 807
    .line 808
    goto/16 :goto_3

    .line 809
    .line 810
    :cond_20
    move v1, v7

    .line 811
    move v2, v8

    .line 812
    move/from16 v21, v12

    .line 813
    .line 814
    move/from16 v22, v13

    .line 815
    .line 816
    move/from16 v23, v14

    .line 817
    .line 818
    move/from16 v24, v15

    .line 819
    .line 820
    aput v1, p1, v21

    .line 821
    .line 822
    aput v2, p1, v22

    .line 823
    .line 824
    aput v3, p1, v23

    .line 825
    .line 826
    aput v4, p1, v24

    .line 827
    .line 828
    aput v19, p1, v16

    .line 829
    .line 830
    aput v20, p1, v17

    .line 831
    .line 832
    return-void

    .line 833
    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_5
        0x43 -> :sswitch_4
        0x48 -> :sswitch_3
        0x4c -> :sswitch_0
        0x4d -> :sswitch_0
        0x51 -> :sswitch_2
        0x53 -> :sswitch_2
        0x54 -> :sswitch_0
        0x56 -> :sswitch_3
        0x5a -> :sswitch_1
        0x61 -> :sswitch_5
        0x63 -> :sswitch_4
        0x68 -> :sswitch_3
        0x6c -> :sswitch_0
        0x6d -> :sswitch_0
        0x71 -> :sswitch_2
        0x73 -> :sswitch_2
        0x74 -> :sswitch_0
        0x76 -> :sswitch_3
        0x7a -> :sswitch_1
    .end sparse-switch
.end method

.method public static f(Landroid/graphics/Path;DDDDDDDDD)V
    .locals 46

    .line 1
    move-wide/from16 v0, p5

    .line 2
    .line 3
    const-wide/high16 v2, 0x4010000000000000L    # 4.0

    .line 4
    .line 5
    mul-double v4, p17, v2

    .line 6
    .line 7
    const-wide v6, 0x400921fb54442d18L    # Math.PI

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    div-double/2addr v4, v6

    .line 13
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    double-to-int v4, v4

    .line 22
    invoke-static/range {p13 .. p14}, Ljava/lang/Math;->cos(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v5

    .line 26
    invoke-static/range {p13 .. p14}, Ljava/lang/Math;->sin(D)D

    .line 27
    .line 28
    .line 29
    move-result-wide v7

    .line 30
    invoke-static/range {p15 .. p16}, Ljava/lang/Math;->cos(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v9

    .line 34
    invoke-static/range {p15 .. p16}, Ljava/lang/Math;->sin(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide v11

    .line 38
    neg-double v13, v0

    .line 39
    mul-double v15, v13, v5

    .line 40
    .line 41
    mul-double v17, v15, v11

    .line 42
    .line 43
    mul-double v19, p7, v7

    .line 44
    .line 45
    mul-double v21, v19, v9

    .line 46
    .line 47
    sub-double v17, v17, v21

    .line 48
    .line 49
    mul-double/2addr v13, v7

    .line 50
    mul-double/2addr v11, v13

    .line 51
    mul-double v21, p7, v5

    .line 52
    .line 53
    mul-double v9, v9, v21

    .line 54
    .line 55
    add-double/2addr v11, v9

    .line 56
    int-to-double v9, v4

    .line 57
    div-double v9, p17, v9

    .line 58
    .line 59
    const/16 v23, 0x0

    .line 60
    .line 61
    move-wide/from16 v29, v2

    .line 62
    .line 63
    move-wide/from16 v25, v11

    .line 64
    .line 65
    move-wide/from16 v27, v17

    .line 66
    .line 67
    move/from16 v2, v23

    .line 68
    .line 69
    move-wide/from16 v11, p9

    .line 70
    .line 71
    move-wide/from16 v17, p11

    .line 72
    .line 73
    move-wide/from16 v23, p15

    .line 74
    .line 75
    :goto_0
    if-ge v2, v4, :cond_0

    .line 76
    .line 77
    add-double v31, v23, v9

    .line 78
    .line 79
    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->sin(D)D

    .line 80
    .line 81
    .line 82
    move-result-wide v33

    .line 83
    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->cos(D)D

    .line 84
    .line 85
    .line 86
    move-result-wide v35

    .line 87
    mul-double v37, v0, v5

    .line 88
    .line 89
    mul-double v37, v37, v35

    .line 90
    .line 91
    add-double v37, p1, v37

    .line 92
    .line 93
    mul-double v39, v19, v33

    .line 94
    .line 95
    sub-double v0, v37, v39

    .line 96
    .line 97
    mul-double v37, p5, v7

    .line 98
    .line 99
    mul-double v37, v37, v35

    .line 100
    .line 101
    add-double v37, p3, v37

    .line 102
    .line 103
    mul-double v39, v21, v33

    .line 104
    .line 105
    move/from16 p7, v2

    .line 106
    .line 107
    add-double v2, v37, v39

    .line 108
    .line 109
    mul-double v37, v15, v33

    .line 110
    .line 111
    mul-double v39, v19, v35

    .line 112
    .line 113
    sub-double v37, v37, v39

    .line 114
    .line 115
    mul-double v33, v33, v13

    .line 116
    .line 117
    mul-double v35, v35, v21

    .line 118
    .line 119
    add-double v33, v33, v35

    .line 120
    .line 121
    sub-double v23, v31, v23

    .line 122
    .line 123
    const-wide/high16 v35, 0x4000000000000000L    # 2.0

    .line 124
    .line 125
    div-double v35, v23, v35

    .line 126
    .line 127
    invoke-static/range {v35 .. v36}, Ljava/lang/Math;->tan(D)D

    .line 128
    .line 129
    .line 130
    move-result-wide v35

    .line 131
    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->sin(D)D

    .line 132
    .line 133
    .line 134
    move-result-wide v23

    .line 135
    const-wide/high16 v39, 0x4008000000000000L    # 3.0

    .line 136
    .line 137
    mul-double v41, v35, v39

    .line 138
    .line 139
    mul-double v41, v41, v35

    .line 140
    .line 141
    add-double v41, v41, v29

    .line 142
    .line 143
    invoke-static/range {v41 .. v42}, Ljava/lang/Math;->sqrt(D)D

    .line 144
    .line 145
    .line 146
    move-result-wide v35

    .line 147
    const-wide/high16 v41, 0x3ff0000000000000L    # 1.0

    .line 148
    .line 149
    sub-double v35, v35, v41

    .line 150
    .line 151
    mul-double v23, v23, v35

    .line 152
    .line 153
    div-double v23, v23, v39

    .line 154
    .line 155
    mul-double v27, v27, v23

    .line 156
    .line 157
    add-double v11, v11, v27

    .line 158
    .line 159
    mul-double v25, v25, v23

    .line 160
    .line 161
    move/from16 v27, v4

    .line 162
    .line 163
    move-wide/from16 v35, v5

    .line 164
    .line 165
    add-double v4, v17, v25

    .line 166
    .line 167
    mul-double v17, v23, v37

    .line 168
    .line 169
    move-wide/from16 p13, v7

    .line 170
    .line 171
    sub-double v6, v0, v17

    .line 172
    .line 173
    mul-double v23, v23, v33

    .line 174
    .line 175
    move-wide/from16 p17, v9

    .line 176
    .line 177
    sub-double v8, v2, v23

    .line 178
    .line 179
    const/4 v10, 0x0

    .line 180
    move-wide/from16 v17, v13

    .line 181
    .line 182
    move-object/from16 v13, p0

    .line 183
    .line 184
    invoke-virtual {v13, v10, v10}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 185
    .line 186
    .line 187
    double-to-float v10, v11

    .line 188
    double-to-float v4, v4

    .line 189
    double-to-float v5, v6

    .line 190
    double-to-float v6, v8

    .line 191
    double-to-float v7, v0

    .line 192
    double-to-float v8, v2

    .line 193
    move/from16 v41, v4

    .line 194
    .line 195
    move/from16 v42, v5

    .line 196
    .line 197
    move/from16 v43, v6

    .line 198
    .line 199
    move/from16 v44, v7

    .line 200
    .line 201
    move/from16 v45, v8

    .line 202
    .line 203
    move/from16 v40, v10

    .line 204
    .line 205
    move-object/from16 v39, v13

    .line 206
    .line 207
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 208
    .line 209
    .line 210
    add-int/lit8 v4, p7, 0x1

    .line 211
    .line 212
    move-wide/from16 v7, p13

    .line 213
    .line 214
    move-wide/from16 v9, p17

    .line 215
    .line 216
    move-wide v11, v0

    .line 217
    move-wide/from16 v13, v17

    .line 218
    .line 219
    move-wide/from16 v23, v31

    .line 220
    .line 221
    move-wide/from16 v25, v33

    .line 222
    .line 223
    move-wide/from16 v5, v35

    .line 224
    .line 225
    move-wide/from16 v0, p5

    .line 226
    .line 227
    move-wide/from16 v17, v2

    .line 228
    .line 229
    move v2, v4

    .line 230
    move/from16 v4, v27

    .line 231
    .line 232
    move-wide/from16 v27, v37

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_0
    return-void
.end method

.method public static g(Landroid/graphics/Path;FFFFFFFZZ)V
    .locals 43

    .line 1
    move/from16 v1, p1

    .line 2
    .line 3
    move/from16 v3, p3

    .line 4
    .line 5
    move/from16 v0, p5

    .line 6
    .line 7
    move/from16 v2, p6

    .line 8
    .line 9
    move/from16 v7, p7

    .line 10
    .line 11
    float-to-double v4, v7

    .line 12
    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v19

    .line 16
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->cos(D)D

    .line 17
    .line 18
    .line 19
    move-result-wide v4

    .line 20
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->sin(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide v8

    .line 24
    float-to-double v10, v1

    .line 25
    mul-double v12, v10, v4

    .line 26
    .line 27
    move/from16 v6, p2

    .line 28
    .line 29
    float-to-double v14, v6

    .line 30
    mul-double v16, v14, v8

    .line 31
    .line 32
    add-double v12, v12, v16

    .line 33
    .line 34
    move-wide/from16 v17, v14

    .line 35
    .line 36
    move-wide v15, v10

    .line 37
    move-wide v13, v12

    .line 38
    float-to-double v11, v0

    .line 39
    div-double/2addr v13, v11

    .line 40
    neg-float v10, v1

    .line 41
    float-to-double v0, v10

    .line 42
    mul-double/2addr v0, v8

    .line 43
    mul-double v21, v17, v4

    .line 44
    .line 45
    add-double v0, v0, v21

    .line 46
    .line 47
    move-wide/from16 v21, v13

    .line 48
    .line 49
    float-to-double v13, v2

    .line 50
    div-double/2addr v0, v13

    .line 51
    move-wide/from16 v23, v0

    .line 52
    .line 53
    float-to-double v0, v3

    .line 54
    mul-double/2addr v0, v4

    .line 55
    move/from16 v10, p4

    .line 56
    .line 57
    move-wide/from16 v25, v0

    .line 58
    .line 59
    float-to-double v0, v10

    .line 60
    mul-double v27, v0, v8

    .line 61
    .line 62
    add-double v25, v25, v27

    .line 63
    .line 64
    div-double v25, v25, v11

    .line 65
    .line 66
    move-wide/from16 v27, v0

    .line 67
    .line 68
    neg-float v0, v3

    .line 69
    float-to-double v0, v0

    .line 70
    mul-double/2addr v0, v8

    .line 71
    mul-double v27, v27, v4

    .line 72
    .line 73
    add-double v0, v0, v27

    .line 74
    .line 75
    div-double/2addr v0, v13

    .line 76
    sub-double v27, v21, v25

    .line 77
    .line 78
    sub-double v29, v23, v0

    .line 79
    .line 80
    add-double v31, v21, v25

    .line 81
    .line 82
    const-wide/high16 v33, 0x4000000000000000L    # 2.0

    .line 83
    .line 84
    div-double v31, v31, v33

    .line 85
    .line 86
    add-double v35, v23, v0

    .line 87
    .line 88
    div-double v35, v35, v33

    .line 89
    .line 90
    mul-double v33, v27, v27

    .line 91
    .line 92
    mul-double v37, v29, v29

    .line 93
    .line 94
    add-double v33, v33, v37

    .line 95
    .line 96
    const-wide/16 v37, 0x0

    .line 97
    .line 98
    cmpl-double v39, v33, v37

    .line 99
    .line 100
    if-nez v39, :cond_0

    .line 101
    .line 102
    return-void

    .line 103
    :cond_0
    const-wide/high16 v39, 0x3ff0000000000000L    # 1.0

    .line 104
    .line 105
    div-double v39, v39, v33

    .line 106
    .line 107
    const-wide/high16 v41, 0x3fd0000000000000L    # 0.25

    .line 108
    .line 109
    sub-double v39, v39, v41

    .line 110
    .line 111
    cmpg-double v41, v39, v37

    .line 112
    .line 113
    if-gez v41, :cond_1

    .line 114
    .line 115
    invoke-static/range {v33 .. v34}, Ljava/lang/Math;->sqrt(D)D

    .line 116
    .line 117
    .line 118
    move-result-wide v0

    .line 119
    const-wide v4, 0x3ffffff583a53b8eL    # 1.99999

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    div-double/2addr v0, v4

    .line 125
    double-to-float v0, v0

    .line 126
    mul-float v5, p5, v0

    .line 127
    .line 128
    mul-float/2addr v0, v2

    .line 129
    move/from16 v1, p1

    .line 130
    .line 131
    move/from16 v8, p8

    .line 132
    .line 133
    move/from16 v9, p9

    .line 134
    .line 135
    move v2, v6

    .line 136
    move v4, v10

    .line 137
    move v6, v0

    .line 138
    move-object/from16 v0, p0

    .line 139
    .line 140
    invoke-static/range {v0 .. v9}, Ll/cj60$b;->g(Landroid/graphics/Path;FFFFFFFZZ)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_1
    move/from16 v2, p9

    .line 145
    .line 146
    invoke-static/range {v39 .. v40}, Ljava/lang/Math;->sqrt(D)D

    .line 147
    .line 148
    .line 149
    move-result-wide v6

    .line 150
    mul-double v27, v27, v6

    .line 151
    .line 152
    mul-double v6, v6, v29

    .line 153
    .line 154
    move/from16 v3, p8

    .line 155
    .line 156
    if-ne v3, v2, :cond_2

    .line 157
    .line 158
    sub-double v31, v31, v6

    .line 159
    .line 160
    add-double v35, v35, v27

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_2
    add-double v31, v31, v6

    .line 164
    .line 165
    sub-double v35, v35, v27

    .line 166
    .line 167
    :goto_0
    sub-double v6, v23, v35

    .line 168
    .line 169
    move-wide/from16 v23, v0

    .line 170
    .line 171
    sub-double v0, v21, v31

    .line 172
    .line 173
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    .line 174
    .line 175
    .line 176
    move-result-wide v21

    .line 177
    sub-double v0, v23, v35

    .line 178
    .line 179
    sub-double v6, v25, v31

    .line 180
    .line 181
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->atan2(DD)D

    .line 182
    .line 183
    .line 184
    move-result-wide v0

    .line 185
    sub-double v0, v0, v21

    .line 186
    .line 187
    cmpl-double v3, v0, v37

    .line 188
    .line 189
    if-ltz v3, :cond_3

    .line 190
    .line 191
    const/4 v6, 0x1

    .line 192
    goto :goto_1

    .line 193
    :cond_3
    const/4 v6, 0x0

    .line 194
    :goto_1
    if-eq v2, v6, :cond_4

    .line 195
    .line 196
    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    if-lez v3, :cond_5

    .line 202
    .line 203
    sub-double/2addr v0, v6

    .line 204
    :cond_4
    :goto_2
    move-wide/from16 v23, v0

    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_5
    add-double/2addr v0, v6

    .line 208
    goto :goto_2

    .line 209
    :goto_3
    mul-double v31, v31, v11

    .line 210
    .line 211
    mul-double v35, v35, v13

    .line 212
    .line 213
    mul-double v0, v31, v4

    .line 214
    .line 215
    mul-double v2, v35, v8

    .line 216
    .line 217
    sub-double/2addr v0, v2

    .line 218
    mul-double v31, v31, v8

    .line 219
    .line 220
    mul-double v35, v35, v4

    .line 221
    .line 222
    add-double v9, v31, v35

    .line 223
    .line 224
    move-object/from16 v6, p0

    .line 225
    .line 226
    move-wide v7, v0

    .line 227
    invoke-static/range {v6 .. v24}, Ll/cj60$b;->f(Landroid/graphics/Path;DDDDDDDDD)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public static h([Ll/cj60$b;Landroid/graphics/Path;)V
    .locals 0
    .param p0    # [Ll/cj60$b;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/graphics/Path;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/cj60;->i([Ll/cj60$b;Landroid/graphics/Path;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

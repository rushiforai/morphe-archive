.class final Lcom/google/android/gms/internal/mlkit_common/zzaq;
.super Lcom/google/android/gms/internal/mlkit_common/zzai;
.source "SourceFile"


# static fields
.field static final zza:Lcom/google/android/gms/internal/mlkit_common/zzai;


# instance fields
.field final transient zzb:[Ljava/lang/Object;

.field private final transient zzc:Ljava/lang/Object;

.field private final transient zzd:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzaq;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v2, v1}, Lcom/google/android/gms/internal/mlkit_common/zzaq;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    sput-object v0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zza:Lcom/google/android/gms/internal/mlkit_common/zzai;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;[Ljava/lang/Object;I)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_common/zzai;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzc:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzb:[Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzd:I

    return-void
.end method

.method public static zzg(I[Ljava/lang/Object;Lcom/google/android/gms/internal/mlkit_common/a;)Lcom/google/android/gms/internal/mlkit_common/zzaq;
    .locals 19

    .line 1
    move/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zza:Lcom/google/android/gms/internal/mlkit_common/zzai;

    .line 10
    .line 11
    check-cast v0, Lcom/google/android/gms/internal/mlkit_common/zzaq;

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x1

    .line 17
    if-ne v0, v5, :cond_1

    .line 18
    .line 19
    aget-object v0, v1, v4

    .line 20
    .line 21
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    aget-object v2, v1, v5

    .line 25
    .line 26
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v2}, Ll/j1z0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzaq;

    .line 33
    .line 34
    invoke-direct {v0, v3, v1, v5}, Lcom/google/android/gms/internal/mlkit_common/zzaq;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    array-length v6, v1

    .line 39
    shr-int/2addr v6, v5

    .line 40
    const-string v7, "index"

    .line 41
    .line 42
    invoke-static {v0, v6, v7}, Ll/mwy0;->b(IILjava/lang/String;)I

    .line 43
    .line 44
    .line 45
    const/4 v6, 0x2

    .line 46
    invoke-static {v0, v6}, Ljava/lang/Math;->max(II)I

    .line 47
    .line 48
    .line 49
    move-result v7

    .line 50
    const v8, 0x2ccccccc

    .line 51
    .line 52
    .line 53
    if-ge v7, v8, :cond_2

    .line 54
    .line 55
    add-int/lit8 v8, v7, -0x1

    .line 56
    .line 57
    invoke-static {v8}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    :goto_0
    add-int/2addr v8, v8

    .line 62
    int-to-double v9, v8

    .line 63
    const-wide v11, 0x3fe6666666666666L    # 0.7

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    mul-double/2addr v9, v11

    .line 69
    int-to-double v11, v7

    .line 70
    cmpg-double v9, v9, v11

    .line 71
    .line 72
    if-gez v9, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/high16 v8, 0x40000000    # 2.0f

    .line 76
    .line 77
    if-ge v7, v8, :cond_18

    .line 78
    .line 79
    :cond_3
    if-ne v0, v5, :cond_4

    .line 80
    .line 81
    aget-object v0, v1, v4

    .line 82
    .line 83
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    aget-object v7, v1, v5

    .line 87
    .line 88
    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v7}, Ll/j1z0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    move/from16 v16, v4

    .line 95
    .line 96
    move v0, v5

    .line 97
    move/from16 v17, v0

    .line 98
    .line 99
    :goto_1
    move/from16 v18, v6

    .line 100
    .line 101
    goto/16 :goto_c

    .line 102
    .line 103
    :cond_4
    add-int/lit8 v7, v8, -0x1

    .line 104
    .line 105
    const/16 v9, 0x80

    .line 106
    .line 107
    const/4 v10, 0x3

    .line 108
    const/4 v11, -0x1

    .line 109
    if-gt v8, v9, :cond_a

    .line 110
    .line 111
    new-array v8, v8, [B

    .line 112
    .line 113
    invoke-static {v8, v11}, Ljava/util/Arrays;->fill([BB)V

    .line 114
    .line 115
    .line 116
    move v9, v4

    .line 117
    move v11, v9

    .line 118
    :goto_2
    if-ge v9, v0, :cond_8

    .line 119
    .line 120
    add-int v12, v11, v11

    .line 121
    .line 122
    add-int v13, v9, v9

    .line 123
    .line 124
    aget-object v14, v1, v13

    .line 125
    .line 126
    invoke-static {v14}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    xor-int/2addr v13, v5

    .line 130
    aget-object v13, v1, v13

    .line 131
    .line 132
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    invoke-static {v14, v13}, Ll/j1z0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v14}, Ljava/lang/Object;->hashCode()I

    .line 139
    .line 140
    .line 141
    move-result v15

    .line 142
    invoke-static {v15}, Ll/s4z0;->a(I)I

    .line 143
    .line 144
    .line 145
    move-result v15

    .line 146
    :goto_3
    and-int/2addr v15, v7

    .line 147
    move/from16 v16, v4

    .line 148
    .line 149
    aget-byte v4, v8, v15

    .line 150
    .line 151
    move/from16 v17, v5

    .line 152
    .line 153
    const/16 v5, 0xff

    .line 154
    .line 155
    and-int/2addr v4, v5

    .line 156
    if-ne v4, v5, :cond_6

    .line 157
    .line 158
    int-to-byte v4, v12

    .line 159
    aput-byte v4, v8, v15

    .line 160
    .line 161
    if-ge v11, v9, :cond_5

    .line 162
    .line 163
    aput-object v14, v1, v12

    .line 164
    .line 165
    xor-int/lit8 v4, v12, 0x1

    .line 166
    .line 167
    aput-object v13, v1, v4

    .line 168
    .line 169
    :cond_5
    add-int/lit8 v11, v11, 0x1

    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_6
    aget-object v5, v1, v4

    .line 173
    .line 174
    invoke-virtual {v14, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v5

    .line 178
    if-eqz v5, :cond_7

    .line 179
    .line 180
    xor-int/lit8 v3, v4, 0x1

    .line 181
    .line 182
    new-instance v4, Ll/ijr0;

    .line 183
    .line 184
    aget-object v5, v1, v3

    .line 185
    .line 186
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    invoke-direct {v4, v14, v13, v5}, Ll/ijr0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    aput-object v13, v1, v3

    .line 193
    .line 194
    move-object v3, v4

    .line 195
    :goto_4
    add-int/lit8 v9, v9, 0x1

    .line 196
    .line 197
    move/from16 v4, v16

    .line 198
    .line 199
    move/from16 v5, v17

    .line 200
    .line 201
    goto :goto_2

    .line 202
    :cond_7
    add-int/lit8 v15, v15, 0x1

    .line 203
    .line 204
    move/from16 v4, v16

    .line 205
    .line 206
    move/from16 v5, v17

    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_8
    move/from16 v16, v4

    .line 210
    .line 211
    move/from16 v17, v5

    .line 212
    .line 213
    if-ne v11, v0, :cond_9

    .line 214
    .line 215
    move/from16 v18, v6

    .line 216
    .line 217
    move-object v3, v8

    .line 218
    goto/16 :goto_c

    .line 219
    .line 220
    :cond_9
    new-array v4, v10, [Ljava/lang/Object;

    .line 221
    .line 222
    aput-object v8, v4, v16

    .line 223
    .line 224
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    aput-object v5, v4, v17

    .line 229
    .line 230
    aput-object v3, v4, v6

    .line 231
    .line 232
    :goto_5
    move-object v3, v4

    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :cond_a
    move/from16 v16, v4

    .line 236
    .line 237
    move/from16 v17, v5

    .line 238
    .line 239
    const v4, 0x8000

    .line 240
    .line 241
    .line 242
    if-gt v8, v4, :cond_10

    .line 243
    .line 244
    new-array v4, v8, [S

    .line 245
    .line 246
    invoke-static {v4, v11}, Ljava/util/Arrays;->fill([SS)V

    .line 247
    .line 248
    .line 249
    move/from16 v5, v16

    .line 250
    .line 251
    move v8, v5

    .line 252
    :goto_6
    if-ge v5, v0, :cond_e

    .line 253
    .line 254
    add-int v9, v8, v8

    .line 255
    .line 256
    add-int v11, v5, v5

    .line 257
    .line 258
    aget-object v12, v1, v11

    .line 259
    .line 260
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    xor-int/lit8 v11, v11, 0x1

    .line 264
    .line 265
    aget-object v11, v1, v11

    .line 266
    .line 267
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    invoke-static {v12, v11}, Ll/j1z0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 274
    .line 275
    .line 276
    move-result v13

    .line 277
    invoke-static {v13}, Ll/s4z0;->a(I)I

    .line 278
    .line 279
    .line 280
    move-result v13

    .line 281
    :goto_7
    and-int/2addr v13, v7

    .line 282
    aget-short v14, v4, v13

    .line 283
    .line 284
    int-to-char v14, v14

    .line 285
    const v15, 0xffff

    .line 286
    .line 287
    .line 288
    if-ne v14, v15, :cond_c

    .line 289
    .line 290
    int-to-short v14, v9

    .line 291
    aput-short v14, v4, v13

    .line 292
    .line 293
    if-ge v8, v5, :cond_b

    .line 294
    .line 295
    aput-object v12, v1, v9

    .line 296
    .line 297
    xor-int/lit8 v9, v9, 0x1

    .line 298
    .line 299
    aput-object v11, v1, v9

    .line 300
    .line 301
    :cond_b
    add-int/lit8 v8, v8, 0x1

    .line 302
    .line 303
    goto :goto_8

    .line 304
    :cond_c
    aget-object v15, v1, v14

    .line 305
    .line 306
    invoke-virtual {v12, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v15

    .line 310
    if-eqz v15, :cond_d

    .line 311
    .line 312
    xor-int/lit8 v3, v14, 0x1

    .line 313
    .line 314
    new-instance v9, Ll/ijr0;

    .line 315
    .line 316
    aget-object v13, v1, v3

    .line 317
    .line 318
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    invoke-direct {v9, v12, v11, v13}, Ll/ijr0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    aput-object v11, v1, v3

    .line 325
    .line 326
    move-object v3, v9

    .line 327
    :goto_8
    add-int/lit8 v5, v5, 0x1

    .line 328
    .line 329
    goto :goto_6

    .line 330
    :cond_d
    add-int/lit8 v13, v13, 0x1

    .line 331
    .line 332
    goto :goto_7

    .line 333
    :cond_e
    if-ne v8, v0, :cond_f

    .line 334
    .line 335
    goto :goto_5

    .line 336
    :cond_f
    new-array v5, v10, [Ljava/lang/Object;

    .line 337
    .line 338
    aput-object v4, v5, v16

    .line 339
    .line 340
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    aput-object v4, v5, v17

    .line 345
    .line 346
    aput-object v3, v5, v6

    .line 347
    .line 348
    move-object v3, v5

    .line 349
    goto/16 :goto_1

    .line 350
    .line 351
    :cond_10
    new-array v4, v8, [I

    .line 352
    .line 353
    invoke-static {v4, v11}, Ljava/util/Arrays;->fill([II)V

    .line 354
    .line 355
    .line 356
    move/from16 v5, v16

    .line 357
    .line 358
    move v8, v5

    .line 359
    :goto_9
    if-ge v5, v0, :cond_14

    .line 360
    .line 361
    add-int v9, v8, v8

    .line 362
    .line 363
    add-int v12, v5, v5

    .line 364
    .line 365
    aget-object v13, v1, v12

    .line 366
    .line 367
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    xor-int/lit8 v12, v12, 0x1

    .line 371
    .line 372
    aget-object v12, v1, v12

    .line 373
    .line 374
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    invoke-static {v13, v12}, Ll/j1z0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {v13}, Ljava/lang/Object;->hashCode()I

    .line 381
    .line 382
    .line 383
    move-result v14

    .line 384
    invoke-static {v14}, Ll/s4z0;->a(I)I

    .line 385
    .line 386
    .line 387
    move-result v14

    .line 388
    :goto_a
    and-int/2addr v14, v7

    .line 389
    aget v15, v4, v14

    .line 390
    .line 391
    if-ne v15, v11, :cond_12

    .line 392
    .line 393
    aput v9, v4, v14

    .line 394
    .line 395
    if-ge v8, v5, :cond_11

    .line 396
    .line 397
    aput-object v13, v1, v9

    .line 398
    .line 399
    xor-int/lit8 v9, v9, 0x1

    .line 400
    .line 401
    aput-object v12, v1, v9

    .line 402
    .line 403
    :cond_11
    add-int/lit8 v8, v8, 0x1

    .line 404
    .line 405
    move/from16 v18, v6

    .line 406
    .line 407
    goto :goto_b

    .line 408
    :cond_12
    move/from16 v18, v6

    .line 409
    .line 410
    aget-object v6, v1, v15

    .line 411
    .line 412
    invoke-virtual {v13, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    if-eqz v6, :cond_13

    .line 417
    .line 418
    xor-int/lit8 v3, v15, 0x1

    .line 419
    .line 420
    new-instance v6, Ll/ijr0;

    .line 421
    .line 422
    aget-object v9, v1, v3

    .line 423
    .line 424
    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    invoke-direct {v6, v13, v12, v9}, Ll/ijr0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 428
    .line 429
    .line 430
    aput-object v12, v1, v3

    .line 431
    .line 432
    move-object v3, v6

    .line 433
    :goto_b
    add-int/lit8 v5, v5, 0x1

    .line 434
    .line 435
    move/from16 v6, v18

    .line 436
    .line 437
    goto :goto_9

    .line 438
    :cond_13
    add-int/lit8 v14, v14, 0x1

    .line 439
    .line 440
    move/from16 v6, v18

    .line 441
    .line 442
    goto :goto_a

    .line 443
    :cond_14
    move/from16 v18, v6

    .line 444
    .line 445
    if-ne v8, v0, :cond_15

    .line 446
    .line 447
    move-object v3, v4

    .line 448
    goto :goto_c

    .line 449
    :cond_15
    new-array v5, v10, [Ljava/lang/Object;

    .line 450
    .line 451
    aput-object v4, v5, v16

    .line 452
    .line 453
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 454
    .line 455
    .line 456
    move-result-object v4

    .line 457
    aput-object v4, v5, v17

    .line 458
    .line 459
    aput-object v3, v5, v18

    .line 460
    .line 461
    move-object v3, v5

    .line 462
    :goto_c
    instance-of v4, v3, [Ljava/lang/Object;

    .line 463
    .line 464
    if-eqz v4, :cond_17

    .line 465
    .line 466
    check-cast v3, [Ljava/lang/Object;

    .line 467
    .line 468
    aget-object v0, v3, v18

    .line 469
    .line 470
    check-cast v0, Ll/ijr0;

    .line 471
    .line 472
    if-eqz v2, :cond_16

    .line 473
    .line 474
    iput-object v0, v2, Lcom/google/android/gms/internal/mlkit_common/a;->c:Ll/ijr0;

    .line 475
    .line 476
    aget-object v0, v3, v16

    .line 477
    .line 478
    aget-object v2, v3, v17

    .line 479
    .line 480
    check-cast v2, Ljava/lang/Integer;

    .line 481
    .line 482
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 483
    .line 484
    .line 485
    move-result v2

    .line 486
    add-int v3, v2, v2

    .line 487
    .line 488
    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    move-object v3, v0

    .line 493
    move v0, v2

    .line 494
    goto :goto_d

    .line 495
    :cond_16
    invoke-virtual {v0}, Ll/ijr0;->a()Ljava/lang/IllegalArgumentException;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    throw v0

    .line 500
    :cond_17
    :goto_d
    new-instance v2, Lcom/google/android/gms/internal/mlkit_common/zzaq;

    .line 501
    .line 502
    invoke-direct {v2, v3, v1, v0}, Lcom/google/android/gms/internal/mlkit_common/zzaq;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 503
    .line 504
    .line 505
    return-object v2

    .line 506
    :cond_18
    const-string v0, "collection too large"

    .line 507
    .line 508
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 509
    .line 510
    .line 511
    return-object v3
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    :cond_0
    :goto_0
    move-object p0, v0

    .line 5
    goto/16 :goto_4

    .line 6
    .line 7
    :cond_1
    iget v1, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzd:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzb:[Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-ne v1, v3, :cond_2

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    aget-object p0, v2, p0

    .line 16
    .line 17
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    aget-object p0, v2, v3

    .line 27
    .line 28
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    goto/16 :goto_4

    .line 32
    .line 33
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzc:Ljava/lang/Object;

    .line 34
    .line 35
    if-nez p0, :cond_3

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    instance-of v1, p0, [B

    .line 39
    .line 40
    const/4 v4, -0x1

    .line 41
    if-eqz v1, :cond_6

    .line 42
    .line 43
    move-object v1, p0

    .line 44
    check-cast v1, [B

    .line 45
    .line 46
    array-length p0, v1

    .line 47
    add-int/lit8 v5, p0, -0x1

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {p0}, Ll/s4z0;->a(I)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    :goto_1
    and-int/2addr p0, v5

    .line 58
    aget-byte v4, v1, p0

    .line 59
    .line 60
    const/16 v6, 0xff

    .line 61
    .line 62
    and-int/2addr v4, v6

    .line 63
    if-ne v4, v6, :cond_4

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    aget-object v6, v2, v4

    .line 67
    .line 68
    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-eqz v6, :cond_5

    .line 73
    .line 74
    xor-int/lit8 p0, v4, 0x1

    .line 75
    .line 76
    aget-object p0, v2, p0

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_5
    add-int/lit8 p0, p0, 0x1

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_6
    instance-of v1, p0, [S

    .line 83
    .line 84
    if-eqz v1, :cond_9

    .line 85
    .line 86
    move-object v1, p0

    .line 87
    check-cast v1, [S

    .line 88
    .line 89
    array-length p0, v1

    .line 90
    add-int/lit8 v5, p0, -0x1

    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-static {p0}, Ll/s4z0;->a(I)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    :goto_2
    and-int/2addr p0, v5

    .line 101
    aget-short v4, v1, p0

    .line 102
    .line 103
    int-to-char v4, v4

    .line 104
    const v6, 0xffff

    .line 105
    .line 106
    .line 107
    if-ne v4, v6, :cond_7

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_7
    aget-object v6, v2, v4

    .line 111
    .line 112
    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    if-eqz v6, :cond_8

    .line 117
    .line 118
    xor-int/lit8 p0, v4, 0x1

    .line 119
    .line 120
    aget-object p0, v2, p0

    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_8
    add-int/lit8 p0, p0, 0x1

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_9
    check-cast p0, [I

    .line 127
    .line 128
    array-length v1, p0

    .line 129
    add-int/2addr v1, v4

    .line 130
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    invoke-static {v5}, Ll/s4z0;->a(I)I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    :goto_3
    and-int/2addr v5, v1

    .line 139
    aget v6, p0, v5

    .line 140
    .line 141
    if-ne v6, v4, :cond_a

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_a
    aget-object v7, v2, v6

    .line 146
    .line 147
    invoke-virtual {p1, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    if-eqz v7, :cond_c

    .line 152
    .line 153
    xor-int/lit8 p0, v6, 0x1

    .line 154
    .line 155
    aget-object p0, v2, p0

    .line 156
    .line 157
    :goto_4
    if-nez p0, :cond_b

    .line 158
    .line 159
    return-object v0

    .line 160
    :cond_b
    return-object p0

    .line 161
    :cond_c
    add-int/lit8 v5, v5, 0x1

    .line 162
    .line 163
    goto :goto_3
.end method

.method public final size()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzd:I

    return p0
.end method

.method public final zza()Lcom/google/android/gms/internal/mlkit_common/zzab;
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzd:I

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/internal/mlkit_common/zzap;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzb:[Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v1, p0, v2, v0}, Lcom/google/android/gms/internal/mlkit_common/zzap;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public final zzd()Lcom/google/android/gms/internal/mlkit_common/zzaj;
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzd:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzb:[Ljava/lang/Object;

    .line 4
    .line 5
    new-instance v2, Lcom/google/android/gms/internal/mlkit_common/zzan;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v2, p0, v1, v3, v0}, Lcom/google/android/gms/internal/mlkit_common/zzan;-><init>(Lcom/google/android/gms/internal/mlkit_common/zzai;[Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v2
.end method

.method public final zze()Lcom/google/android/gms/internal/mlkit_common/zzaj;
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzd:I

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/internal/mlkit_common/zzap;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/gms/internal/mlkit_common/zzaq;->zzb:[Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v1, v2, v3, v0}, Lcom/google/android/gms/internal/mlkit_common/zzap;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/google/android/gms/internal/mlkit_common/zzao;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/mlkit_common/zzao;-><init>(Lcom/google/android/gms/internal/mlkit_common/zzai;Lcom/google/android/gms/internal/mlkit_common/zzaf;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

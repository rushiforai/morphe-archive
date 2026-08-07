.class final Lcom/google/android/gms/internal/ads/zzgbp;
.super Lcom/google/android/gms/internal/ads/zzgad;
.source "SourceFile"


# static fields
.field static final zza:Lcom/google/android/gms/internal/ads/zzgad;


# instance fields
.field final transient zzb:[Ljava/lang/Object;

.field private final transient zzc:Ljava/lang/Object;

.field private final transient zzd:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/ads/zzgbp;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v2, v1}, Lcom/google/android/gms/internal/ads/zzgbp;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    sput-object v0, Lcom/google/android/gms/internal/ads/zzgbp;->zza:Lcom/google/android/gms/internal/ads/zzgad;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;[Ljava/lang/Object;I)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/zzgad;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzc:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzb:[Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzd:I

    return-void
.end method

.method public static zzj(I[Ljava/lang/Object;Lcom/google/android/gms/internal/ads/w2;)Lcom/google/android/gms/internal/ads/zzgbp;
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
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgbp;->zza:Lcom/google/android/gms/internal/ads/zzgad;

    .line 10
    .line 11
    check-cast v0, Lcom/google/android/gms/internal/ads/zzgbp;

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
    invoke-static {v0, v2}, Ll/tpw0;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgbp;

    .line 33
    .line 34
    invoke-direct {v0, v3, v1, v5}, Lcom/google/android/gms/internal/ads/zzgbp;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

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
    invoke-static {v0, v6, v7}, Ll/tow0;->b(IILjava/lang/String;)I

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzgaf;->zzh(I)I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    const/4 v7, 0x2

    .line 50
    if-ne v0, v5, :cond_2

    .line 51
    .line 52
    aget-object v0, v1, v4

    .line 53
    .line 54
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    aget-object v6, v1, v5

    .line 58
    .line 59
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v6}, Ll/tpw0;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    move/from16 v16, v4

    .line 66
    .line 67
    move v0, v5

    .line 68
    move/from16 v17, v0

    .line 69
    .line 70
    :goto_0
    move/from16 v18, v7

    .line 71
    .line 72
    goto/16 :goto_b

    .line 73
    .line 74
    :cond_2
    add-int/lit8 v8, v6, -0x1

    .line 75
    .line 76
    const/16 v9, 0x80

    .line 77
    .line 78
    const/4 v10, 0x3

    .line 79
    const/4 v11, -0x1

    .line 80
    if-gt v6, v9, :cond_8

    .line 81
    .line 82
    new-array v6, v6, [B

    .line 83
    .line 84
    invoke-static {v6, v11}, Ljava/util/Arrays;->fill([BB)V

    .line 85
    .line 86
    .line 87
    move v9, v4

    .line 88
    move v11, v9

    .line 89
    :goto_1
    if-ge v9, v0, :cond_6

    .line 90
    .line 91
    add-int v12, v11, v11

    .line 92
    .line 93
    add-int v13, v9, v9

    .line 94
    .line 95
    aget-object v14, v1, v13

    .line 96
    .line 97
    invoke-static {v14}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    xor-int/2addr v13, v5

    .line 101
    aget-object v13, v1, v13

    .line 102
    .line 103
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    invoke-static {v14, v13}, Ll/tpw0;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v14}, Ljava/lang/Object;->hashCode()I

    .line 110
    .line 111
    .line 112
    move-result v15

    .line 113
    invoke-static {v15}, Ll/jqw0;->a(I)I

    .line 114
    .line 115
    .line 116
    move-result v15

    .line 117
    :goto_2
    and-int/2addr v15, v8

    .line 118
    move/from16 v16, v4

    .line 119
    .line 120
    aget-byte v4, v6, v15

    .line 121
    .line 122
    move/from16 v17, v5

    .line 123
    .line 124
    const/16 v5, 0xff

    .line 125
    .line 126
    and-int/2addr v4, v5

    .line 127
    if-ne v4, v5, :cond_4

    .line 128
    .line 129
    int-to-byte v4, v12

    .line 130
    aput-byte v4, v6, v15

    .line 131
    .line 132
    if-ge v11, v9, :cond_3

    .line 133
    .line 134
    aput-object v14, v1, v12

    .line 135
    .line 136
    xor-int/lit8 v4, v12, 0x1

    .line 137
    .line 138
    aput-object v13, v1, v4

    .line 139
    .line 140
    :cond_3
    add-int/lit8 v11, v11, 0x1

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_4
    aget-object v5, v1, v4

    .line 144
    .line 145
    invoke-virtual {v14, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    if-eqz v5, :cond_5

    .line 150
    .line 151
    xor-int/lit8 v3, v4, 0x1

    .line 152
    .line 153
    new-instance v4, Ll/srw0;

    .line 154
    .line 155
    aget-object v5, v1, v3

    .line 156
    .line 157
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    invoke-direct {v4, v14, v13, v5}, Ll/srw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    aput-object v13, v1, v3

    .line 164
    .line 165
    move-object v3, v4

    .line 166
    :goto_3
    add-int/lit8 v9, v9, 0x1

    .line 167
    .line 168
    move/from16 v4, v16

    .line 169
    .line 170
    move/from16 v5, v17

    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_5
    add-int/lit8 v15, v15, 0x1

    .line 174
    .line 175
    move/from16 v4, v16

    .line 176
    .line 177
    move/from16 v5, v17

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_6
    move/from16 v16, v4

    .line 181
    .line 182
    move/from16 v17, v5

    .line 183
    .line 184
    if-ne v11, v0, :cond_7

    .line 185
    .line 186
    move-object v3, v6

    .line 187
    goto :goto_0

    .line 188
    :cond_7
    new-array v4, v10, [Ljava/lang/Object;

    .line 189
    .line 190
    aput-object v6, v4, v16

    .line 191
    .line 192
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v5

    .line 196
    aput-object v5, v4, v17

    .line 197
    .line 198
    aput-object v3, v4, v7

    .line 199
    .line 200
    :goto_4
    move-object v3, v4

    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_8
    move/from16 v16, v4

    .line 204
    .line 205
    move/from16 v17, v5

    .line 206
    .line 207
    const v4, 0x8000

    .line 208
    .line 209
    .line 210
    if-gt v6, v4, :cond_e

    .line 211
    .line 212
    new-array v4, v6, [S

    .line 213
    .line 214
    invoke-static {v4, v11}, Ljava/util/Arrays;->fill([SS)V

    .line 215
    .line 216
    .line 217
    move/from16 v5, v16

    .line 218
    .line 219
    move v6, v5

    .line 220
    :goto_5
    if-ge v5, v0, :cond_c

    .line 221
    .line 222
    add-int v9, v6, v6

    .line 223
    .line 224
    add-int v11, v5, v5

    .line 225
    .line 226
    aget-object v12, v1, v11

    .line 227
    .line 228
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    xor-int/lit8 v11, v11, 0x1

    .line 232
    .line 233
    aget-object v11, v1, v11

    .line 234
    .line 235
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    invoke-static {v12, v11}, Ll/tpw0;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 242
    .line 243
    .line 244
    move-result v13

    .line 245
    invoke-static {v13}, Ll/jqw0;->a(I)I

    .line 246
    .line 247
    .line 248
    move-result v13

    .line 249
    :goto_6
    and-int/2addr v13, v8

    .line 250
    aget-short v14, v4, v13

    .line 251
    .line 252
    int-to-char v14, v14

    .line 253
    const v15, 0xffff

    .line 254
    .line 255
    .line 256
    if-ne v14, v15, :cond_a

    .line 257
    .line 258
    int-to-short v14, v9

    .line 259
    aput-short v14, v4, v13

    .line 260
    .line 261
    if-ge v6, v5, :cond_9

    .line 262
    .line 263
    aput-object v12, v1, v9

    .line 264
    .line 265
    xor-int/lit8 v9, v9, 0x1

    .line 266
    .line 267
    aput-object v11, v1, v9

    .line 268
    .line 269
    :cond_9
    add-int/lit8 v6, v6, 0x1

    .line 270
    .line 271
    goto :goto_7

    .line 272
    :cond_a
    aget-object v15, v1, v14

    .line 273
    .line 274
    invoke-virtual {v12, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v15

    .line 278
    if-eqz v15, :cond_b

    .line 279
    .line 280
    xor-int/lit8 v3, v14, 0x1

    .line 281
    .line 282
    new-instance v9, Ll/srw0;

    .line 283
    .line 284
    aget-object v13, v1, v3

    .line 285
    .line 286
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    invoke-direct {v9, v12, v11, v13}, Ll/srw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 290
    .line 291
    .line 292
    aput-object v11, v1, v3

    .line 293
    .line 294
    move-object v3, v9

    .line 295
    :goto_7
    add-int/lit8 v5, v5, 0x1

    .line 296
    .line 297
    goto :goto_5

    .line 298
    :cond_b
    add-int/lit8 v13, v13, 0x1

    .line 299
    .line 300
    goto :goto_6

    .line 301
    :cond_c
    if-ne v6, v0, :cond_d

    .line 302
    .line 303
    goto :goto_4

    .line 304
    :cond_d
    new-array v5, v10, [Ljava/lang/Object;

    .line 305
    .line 306
    aput-object v4, v5, v16

    .line 307
    .line 308
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    aput-object v4, v5, v17

    .line 313
    .line 314
    aput-object v3, v5, v7

    .line 315
    .line 316
    move-object v3, v5

    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :cond_e
    new-array v4, v6, [I

    .line 320
    .line 321
    invoke-static {v4, v11}, Ljava/util/Arrays;->fill([II)V

    .line 322
    .line 323
    .line 324
    move/from16 v5, v16

    .line 325
    .line 326
    move v6, v5

    .line 327
    :goto_8
    if-ge v5, v0, :cond_12

    .line 328
    .line 329
    add-int v9, v6, v6

    .line 330
    .line 331
    add-int v12, v5, v5

    .line 332
    .line 333
    aget-object v13, v1, v12

    .line 334
    .line 335
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    xor-int/lit8 v12, v12, 0x1

    .line 339
    .line 340
    aget-object v12, v1, v12

    .line 341
    .line 342
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    invoke-static {v13, v12}, Ll/tpw0;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {v13}, Ljava/lang/Object;->hashCode()I

    .line 349
    .line 350
    .line 351
    move-result v14

    .line 352
    invoke-static {v14}, Ll/jqw0;->a(I)I

    .line 353
    .line 354
    .line 355
    move-result v14

    .line 356
    :goto_9
    and-int/2addr v14, v8

    .line 357
    aget v15, v4, v14

    .line 358
    .line 359
    if-ne v15, v11, :cond_10

    .line 360
    .line 361
    aput v9, v4, v14

    .line 362
    .line 363
    if-ge v6, v5, :cond_f

    .line 364
    .line 365
    aput-object v13, v1, v9

    .line 366
    .line 367
    xor-int/lit8 v9, v9, 0x1

    .line 368
    .line 369
    aput-object v12, v1, v9

    .line 370
    .line 371
    :cond_f
    add-int/lit8 v6, v6, 0x1

    .line 372
    .line 373
    move/from16 v18, v7

    .line 374
    .line 375
    goto :goto_a

    .line 376
    :cond_10
    move/from16 v18, v7

    .line 377
    .line 378
    aget-object v7, v1, v15

    .line 379
    .line 380
    invoke-virtual {v13, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result v7

    .line 384
    if-eqz v7, :cond_11

    .line 385
    .line 386
    xor-int/lit8 v3, v15, 0x1

    .line 387
    .line 388
    new-instance v7, Ll/srw0;

    .line 389
    .line 390
    aget-object v9, v1, v3

    .line 391
    .line 392
    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    invoke-direct {v7, v13, v12, v9}, Ll/srw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 396
    .line 397
    .line 398
    aput-object v12, v1, v3

    .line 399
    .line 400
    move-object v3, v7

    .line 401
    :goto_a
    add-int/lit8 v5, v5, 0x1

    .line 402
    .line 403
    move/from16 v7, v18

    .line 404
    .line 405
    goto :goto_8

    .line 406
    :cond_11
    add-int/lit8 v14, v14, 0x1

    .line 407
    .line 408
    move/from16 v7, v18

    .line 409
    .line 410
    goto :goto_9

    .line 411
    :cond_12
    move/from16 v18, v7

    .line 412
    .line 413
    if-ne v6, v0, :cond_13

    .line 414
    .line 415
    move-object v3, v4

    .line 416
    goto :goto_b

    .line 417
    :cond_13
    new-array v5, v10, [Ljava/lang/Object;

    .line 418
    .line 419
    aput-object v4, v5, v16

    .line 420
    .line 421
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 422
    .line 423
    .line 424
    move-result-object v4

    .line 425
    aput-object v4, v5, v17

    .line 426
    .line 427
    aput-object v3, v5, v18

    .line 428
    .line 429
    move-object v3, v5

    .line 430
    :goto_b
    instance-of v4, v3, [Ljava/lang/Object;

    .line 431
    .line 432
    if-eqz v4, :cond_15

    .line 433
    .line 434
    check-cast v3, [Ljava/lang/Object;

    .line 435
    .line 436
    aget-object v0, v3, v18

    .line 437
    .line 438
    check-cast v0, Ll/srw0;

    .line 439
    .line 440
    if-eqz v2, :cond_14

    .line 441
    .line 442
    iput-object v0, v2, Lcom/google/android/gms/internal/ads/w2;->c:Ll/srw0;

    .line 443
    .line 444
    aget-object v0, v3, v16

    .line 445
    .line 446
    aget-object v2, v3, v17

    .line 447
    .line 448
    check-cast v2, Ljava/lang/Integer;

    .line 449
    .line 450
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    add-int v3, v2, v2

    .line 455
    .line 456
    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v1

    .line 460
    move-object v3, v0

    .line 461
    move v0, v2

    .line 462
    goto :goto_c

    .line 463
    :cond_14
    invoke-virtual {v0}, Ll/srw0;->a()Ljava/lang/IllegalArgumentException;

    .line 464
    .line 465
    .line 466
    move-result-object v0

    .line 467
    throw v0

    .line 468
    :cond_15
    :goto_c
    new-instance v2, Lcom/google/android/gms/internal/ads/zzgbp;

    .line 469
    .line 470
    invoke-direct {v2, v3, v1, v0}, Lcom/google/android/gms/internal/ads/zzgbp;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 471
    .line 472
    .line 473
    return-object v2
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
    iget v1, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzd:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzb:[Ljava/lang/Object;

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
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzc:Ljava/lang/Object;

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
    invoke-static {p0}, Ll/jqw0;->a(I)I

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
    invoke-static {p0}, Ll/jqw0;->a(I)I

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
    invoke-static {v5}, Ll/jqw0;->a(I)I

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

    iget p0, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzd:I

    return p0
.end method

.method public final zza()Lcom/google/android/gms/internal/ads/zzfzv;
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzd:I

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/internal/ads/zzgbo;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzb:[Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-direct {v1, p0, v2, v0}, Lcom/google/android/gms/internal/ads/zzgbo;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public final zzf()Lcom/google/android/gms/internal/ads/zzgaf;
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzd:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzb:[Ljava/lang/Object;

    .line 4
    .line 5
    new-instance v2, Lcom/google/android/gms/internal/ads/zzgbm;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v2, p0, v1, v3, v0}, Lcom/google/android/gms/internal/ads/zzgbm;-><init>(Lcom/google/android/gms/internal/ads/zzgad;[Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v2
.end method

.method public final zzg()Lcom/google/android/gms/internal/ads/zzgaf;
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzd:I

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/internal/ads/zzgbo;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/gms/internal/ads/zzgbp;->zzb:[Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v1, v2, v3, v0}, Lcom/google/android/gms/internal/ads/zzgbo;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgbn;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/ads/zzgbn;-><init>(Lcom/google/android/gms/internal/ads/zzgad;Lcom/google/android/gms/internal/ads/zzgaa;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

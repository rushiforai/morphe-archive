.class public Lorg/eclipse/jetty/util/security/UnixCrypt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final A64TOI:[B

.field private static final CF6464:[[J

.field private static final CIFP:[B

.field private static final ExpandTr:[B

.field private static final IE3264:[[J

.field private static final IP:[B

.field private static final ITOA64:[B

.field private static final P32Tr:[B

.field private static final PC1:[B

.field private static final PC1ROT:[[J

.field private static final PC2:[B

.field private static final PC2ROT:[[[J

.field private static final Rotates:[B

.field private static final S:[[B

.field private static final SPE:[[J


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lorg/eclipse/jetty/util/security/UnixCrypt;->IP:[B

    .line 9
    .line 10
    const/16 v1, 0x30

    .line 11
    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    fill-array-data v1, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v1, Lorg/eclipse/jetty/util/security/UnixCrypt;->ExpandTr:[B

    .line 18
    .line 19
    const/16 v1, 0x38

    .line 20
    .line 21
    new-array v1, v1, [B

    .line 22
    .line 23
    fill-array-data v1, :array_2

    .line 24
    .line 25
    .line 26
    sput-object v1, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC1:[B

    .line 27
    .line 28
    const/16 v1, 0x10

    .line 29
    .line 30
    new-array v2, v1, [B

    .line 31
    .line 32
    fill-array-data v2, :array_3

    .line 33
    .line 34
    .line 35
    sput-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->Rotates:[B

    .line 36
    .line 37
    new-array v2, v0, [B

    .line 38
    .line 39
    fill-array-data v2, :array_4

    .line 40
    .line 41
    .line 42
    sput-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2:[B

    .line 43
    .line 44
    new-array v3, v0, [B

    .line 45
    .line 46
    fill-array-data v3, :array_5

    .line 47
    .line 48
    .line 49
    new-array v4, v0, [B

    .line 50
    .line 51
    fill-array-data v4, :array_6

    .line 52
    .line 53
    .line 54
    new-array v5, v0, [B

    .line 55
    .line 56
    fill-array-data v5, :array_7

    .line 57
    .line 58
    .line 59
    new-array v6, v0, [B

    .line 60
    .line 61
    fill-array-data v6, :array_8

    .line 62
    .line 63
    .line 64
    new-array v7, v0, [B

    .line 65
    .line 66
    fill-array-data v7, :array_9

    .line 67
    .line 68
    .line 69
    new-array v8, v0, [B

    .line 70
    .line 71
    fill-array-data v8, :array_a

    .line 72
    .line 73
    .line 74
    new-array v9, v0, [B

    .line 75
    .line 76
    fill-array-data v9, :array_b

    .line 77
    .line 78
    .line 79
    new-array v10, v0, [B

    .line 80
    .line 81
    fill-array-data v10, :array_c

    .line 82
    .line 83
    .line 84
    filled-new-array/range {v3 .. v10}, [[B

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sput-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->S:[[B

    .line 89
    .line 90
    const/16 v2, 0x20

    .line 91
    .line 92
    new-array v3, v2, [B

    .line 93
    .line 94
    fill-array-data v3, :array_d

    .line 95
    .line 96
    .line 97
    sput-object v3, Lorg/eclipse/jetty/util/security/UnixCrypt;->P32Tr:[B

    .line 98
    .line 99
    new-array v3, v0, [B

    .line 100
    .line 101
    fill-array-data v3, :array_e

    .line 102
    .line 103
    .line 104
    sput-object v3, Lorg/eclipse/jetty/util/security/UnixCrypt;->CIFP:[B

    .line 105
    .line 106
    new-array v3, v0, [B

    .line 107
    .line 108
    fill-array-data v3, :array_f

    .line 109
    .line 110
    .line 111
    sput-object v3, Lorg/eclipse/jetty/util/security/UnixCrypt;->ITOA64:[B

    .line 112
    .line 113
    const/16 v3, 0x80

    .line 114
    .line 115
    new-array v3, v3, [B

    .line 116
    .line 117
    sput-object v3, Lorg/eclipse/jetty/util/security/UnixCrypt;->A64TOI:[B

    .line 118
    .line 119
    const/4 v3, 0x2

    .line 120
    new-array v4, v3, [I

    .line 121
    .line 122
    const/4 v5, 0x1

    .line 123
    aput v1, v4, v5

    .line 124
    .line 125
    const/4 v6, 0x0

    .line 126
    aput v1, v4, v6

    .line 127
    .line 128
    sget-object v7, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 129
    .line 130
    invoke-static {v7, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    check-cast v4, [[J

    .line 135
    .line 136
    sput-object v4, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC1ROT:[[J

    .line 137
    .line 138
    const/4 v4, 0x3

    .line 139
    new-array v8, v4, [I

    .line 140
    .line 141
    aput v1, v8, v3

    .line 142
    .line 143
    aput v1, v8, v5

    .line 144
    .line 145
    aput v3, v8, v6

    .line 146
    .line 147
    invoke-static {v7, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v8

    .line 151
    check-cast v8, [[[J

    .line 152
    .line 153
    sput-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2ROT:[[[J

    .line 154
    .line 155
    new-array v8, v3, [I

    .line 156
    .line 157
    aput v1, v8, v5

    .line 158
    .line 159
    const/16 v9, 0x8

    .line 160
    .line 161
    aput v9, v8, v6

    .line 162
    .line 163
    invoke-static {v7, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    check-cast v8, [[J

    .line 168
    .line 169
    sput-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->IE3264:[[J

    .line 170
    .line 171
    new-array v8, v3, [I

    .line 172
    .line 173
    aput v0, v8, v5

    .line 174
    .line 175
    aput v9, v8, v6

    .line 176
    .line 177
    invoke-static {v7, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v8

    .line 181
    check-cast v8, [[J

    .line 182
    .line 183
    sput-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->SPE:[[J

    .line 184
    .line 185
    new-array v8, v3, [I

    .line 186
    .line 187
    aput v1, v8, v5

    .line 188
    .line 189
    aput v1, v8, v6

    .line 190
    .line 191
    invoke-static {v7, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    check-cast v1, [[J

    .line 196
    .line 197
    sput-object v1, Lorg/eclipse/jetty/util/security/UnixCrypt;->CF6464:[[J

    .line 198
    .line 199
    new-array v1, v0, [B

    .line 200
    .line 201
    new-array v7, v0, [B

    .line 202
    .line 203
    move v8, v6

    .line 204
    :goto_0
    if-ge v8, v0, :cond_0

    .line 205
    .line 206
    sget-object v10, Lorg/eclipse/jetty/util/security/UnixCrypt;->A64TOI:[B

    .line 207
    .line 208
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->ITOA64:[B

    .line 209
    .line 210
    aget-byte v11, v11, v8

    .line 211
    .line 212
    int-to-byte v12, v8

    .line 213
    aput-byte v12, v10, v11

    .line 214
    .line 215
    add-int/lit8 v8, v8, 0x1

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_0
    move v8, v6

    .line 219
    :goto_1
    if-ge v8, v0, :cond_1

    .line 220
    .line 221
    aput-byte v6, v1, v8

    .line 222
    .line 223
    add-int/lit8 v8, v8, 0x1

    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_1
    move v8, v6

    .line 227
    :goto_2
    if-ge v8, v0, :cond_5

    .line 228
    .line 229
    sget-object v10, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2:[B

    .line 230
    .line 231
    aget-byte v10, v10, v8

    .line 232
    .line 233
    if-nez v10, :cond_2

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_2
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->Rotates:[B

    .line 237
    .line 238
    aget-byte v11, v11, v6

    .line 239
    .line 240
    add-int/lit8 v12, v11, -0x1

    .line 241
    .line 242
    add-int/2addr v10, v12

    .line 243
    rem-int/lit8 v12, v10, 0x1c

    .line 244
    .line 245
    if-ge v12, v11, :cond_3

    .line 246
    .line 247
    add-int/lit8 v10, v10, -0x1c

    .line 248
    .line 249
    :cond_3
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC1:[B

    .line 250
    .line 251
    aget-byte v10, v11, v10

    .line 252
    .line 253
    if-lez v10, :cond_4

    .line 254
    .line 255
    add-int/lit8 v10, v10, -0x1

    .line 256
    .line 257
    or-int/lit8 v11, v10, 0x7

    .line 258
    .line 259
    and-int/lit8 v10, v10, 0x7

    .line 260
    .line 261
    sub-int/2addr v11, v10

    .line 262
    add-int/lit8 v10, v11, 0x1

    .line 263
    .line 264
    :cond_4
    int-to-byte v10, v10

    .line 265
    aput-byte v10, v1, v8

    .line 266
    .line 267
    :goto_3
    add-int/lit8 v8, v8, 0x1

    .line 268
    .line 269
    goto :goto_2

    .line 270
    :cond_5
    sget-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC1ROT:[[J

    .line 271
    .line 272
    invoke-static {v8, v1, v9}, Lorg/eclipse/jetty/util/security/UnixCrypt;->init_perm([[J[BI)V

    .line 273
    .line 274
    .line 275
    move v8, v6

    .line 276
    :goto_4
    if-ge v8, v3, :cond_c

    .line 277
    .line 278
    move v10, v6

    .line 279
    :goto_5
    if-ge v10, v0, :cond_6

    .line 280
    .line 281
    aput-byte v6, v7, v10

    .line 282
    .line 283
    aput-byte v6, v1, v10

    .line 284
    .line 285
    add-int/lit8 v10, v10, 0x1

    .line 286
    .line 287
    goto :goto_5

    .line 288
    :cond_6
    move v10, v6

    .line 289
    :goto_6
    if-ge v10, v0, :cond_8

    .line 290
    .line 291
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2:[B

    .line 292
    .line 293
    aget-byte v11, v11, v10

    .line 294
    .line 295
    if-nez v11, :cond_7

    .line 296
    .line 297
    goto :goto_7

    .line 298
    :cond_7
    add-int/lit8 v11, v11, -0x1

    .line 299
    .line 300
    add-int/lit8 v12, v10, 0x1

    .line 301
    .line 302
    int-to-byte v12, v12

    .line 303
    aput-byte v12, v7, v11

    .line 304
    .line 305
    :goto_7
    add-int/lit8 v10, v10, 0x1

    .line 306
    .line 307
    goto :goto_6

    .line 308
    :cond_8
    move v10, v6

    .line 309
    :goto_8
    if-ge v10, v0, :cond_b

    .line 310
    .line 311
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2:[B

    .line 312
    .line 313
    aget-byte v11, v11, v10

    .line 314
    .line 315
    if-nez v11, :cond_9

    .line 316
    .line 317
    goto :goto_9

    .line 318
    :cond_9
    add-int/2addr v11, v8

    .line 319
    rem-int/lit8 v12, v11, 0x1c

    .line 320
    .line 321
    if-gt v12, v8, :cond_a

    .line 322
    .line 323
    add-int/lit8 v11, v11, -0x1c

    .line 324
    .line 325
    :cond_a
    aget-byte v11, v7, v11

    .line 326
    .line 327
    aput-byte v11, v1, v10

    .line 328
    .line 329
    :goto_9
    add-int/lit8 v10, v10, 0x1

    .line 330
    .line 331
    goto :goto_8

    .line 332
    :cond_b
    sget-object v10, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2ROT:[[[J

    .line 333
    .line 334
    aget-object v10, v10, v8

    .line 335
    .line 336
    invoke-static {v10, v1, v9}, Lorg/eclipse/jetty/util/security/UnixCrypt;->init_perm([[J[BI)V

    .line 337
    .line 338
    .line 339
    add-int/lit8 v8, v8, 0x1

    .line 340
    .line 341
    goto :goto_4

    .line 342
    :cond_c
    move v8, v6

    .line 343
    :goto_a
    if-ge v8, v9, :cond_12

    .line 344
    .line 345
    move v10, v6

    .line 346
    :goto_b
    if-ge v10, v9, :cond_11

    .line 347
    .line 348
    if-ge v10, v3, :cond_d

    .line 349
    .line 350
    move v11, v6

    .line 351
    goto :goto_c

    .line 352
    :cond_d
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->IP:[B

    .line 353
    .line 354
    sget-object v12, Lorg/eclipse/jetty/util/security/UnixCrypt;->ExpandTr:[B

    .line 355
    .line 356
    mul-int/lit8 v13, v8, 0x6

    .line 357
    .line 358
    add-int/2addr v13, v10

    .line 359
    sub-int/2addr v13, v3

    .line 360
    aget-byte v12, v12, v13

    .line 361
    .line 362
    sub-int/2addr v12, v5

    .line 363
    aget-byte v11, v11, v12

    .line 364
    .line 365
    :goto_c
    if-le v11, v2, :cond_e

    .line 366
    .line 367
    add-int/lit8 v11, v11, -0x20

    .line 368
    .line 369
    goto :goto_d

    .line 370
    :cond_e
    if-lez v11, :cond_f

    .line 371
    .line 372
    add-int/lit8 v11, v11, -0x1

    .line 373
    .line 374
    :cond_f
    :goto_d
    if-lez v11, :cond_10

    .line 375
    .line 376
    add-int/lit8 v11, v11, -0x1

    .line 377
    .line 378
    or-int/lit8 v12, v11, 0x7

    .line 379
    .line 380
    and-int/lit8 v11, v11, 0x7

    .line 381
    .line 382
    sub-int/2addr v12, v11

    .line 383
    add-int/lit8 v11, v12, 0x1

    .line 384
    .line 385
    :cond_10
    mul-int/lit8 v12, v8, 0x8

    .line 386
    .line 387
    add-int/2addr v12, v10

    .line 388
    int-to-byte v11, v11

    .line 389
    aput-byte v11, v1, v12

    .line 390
    .line 391
    add-int/lit8 v10, v10, 0x1

    .line 392
    .line 393
    goto :goto_b

    .line 394
    :cond_11
    add-int/lit8 v8, v8, 0x1

    .line 395
    .line 396
    goto :goto_a

    .line 397
    :cond_12
    sget-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->IE3264:[[J

    .line 398
    .line 399
    invoke-static {v8, v1, v9}, Lorg/eclipse/jetty/util/security/UnixCrypt;->init_perm([[J[BI)V

    .line 400
    .line 401
    .line 402
    move v8, v6

    .line 403
    :goto_e
    if-ge v8, v0, :cond_14

    .line 404
    .line 405
    sget-object v10, Lorg/eclipse/jetty/util/security/UnixCrypt;->IP:[B

    .line 406
    .line 407
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->CIFP:[B

    .line 408
    .line 409
    aget-byte v11, v11, v8

    .line 410
    .line 411
    sub-int/2addr v11, v5

    .line 412
    aget-byte v10, v10, v11

    .line 413
    .line 414
    if-lez v10, :cond_13

    .line 415
    .line 416
    add-int/lit8 v10, v10, -0x1

    .line 417
    .line 418
    or-int/lit8 v11, v10, 0x7

    .line 419
    .line 420
    and-int/lit8 v10, v10, 0x7

    .line 421
    .line 422
    sub-int/2addr v11, v10

    .line 423
    add-int/lit8 v10, v11, 0x1

    .line 424
    .line 425
    :cond_13
    sub-int/2addr v10, v5

    .line 426
    add-int/lit8 v8, v8, 0x1

    .line 427
    .line 428
    int-to-byte v11, v8

    .line 429
    aput-byte v11, v1, v10

    .line 430
    .line 431
    goto :goto_e

    .line 432
    :cond_14
    sget-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->CF6464:[[J

    .line 433
    .line 434
    invoke-static {v8, v1, v9}, Lorg/eclipse/jetty/util/security/UnixCrypt;->init_perm([[J[BI)V

    .line 435
    .line 436
    .line 437
    move v8, v6

    .line 438
    :goto_f
    const/16 v10, 0x30

    .line 439
    .line 440
    if-ge v8, v10, :cond_15

    .line 441
    .line 442
    sget-object v10, Lorg/eclipse/jetty/util/security/UnixCrypt;->P32Tr:[B

    .line 443
    .line 444
    sget-object v11, Lorg/eclipse/jetty/util/security/UnixCrypt;->ExpandTr:[B

    .line 445
    .line 446
    aget-byte v11, v11, v8

    .line 447
    .line 448
    sub-int/2addr v11, v5

    .line 449
    aget-byte v10, v10, v11

    .line 450
    .line 451
    aput-byte v10, v1, v8

    .line 452
    .line 453
    add-int/lit8 v8, v8, 0x1

    .line 454
    .line 455
    goto :goto_f

    .line 456
    :cond_15
    move v8, v6

    .line 457
    :goto_10
    if-ge v8, v9, :cond_1a

    .line 458
    .line 459
    move v10, v6

    .line 460
    :goto_11
    if-ge v10, v0, :cond_19

    .line 461
    .line 462
    and-int/lit8 v11, v10, 0x1

    .line 463
    .line 464
    shl-int/lit8 v11, v11, 0x5

    .line 465
    .line 466
    shr-int/lit8 v12, v10, 0x1

    .line 467
    .line 468
    and-int/2addr v12, v5

    .line 469
    shl-int/2addr v12, v4

    .line 470
    or-int/2addr v11, v12

    .line 471
    shr-int/lit8 v12, v10, 0x2

    .line 472
    .line 473
    and-int/2addr v12, v5

    .line 474
    shl-int/2addr v12, v3

    .line 475
    or-int/2addr v11, v12

    .line 476
    shr-int/lit8 v12, v10, 0x3

    .line 477
    .line 478
    and-int/2addr v12, v5

    .line 479
    shl-int/2addr v12, v5

    .line 480
    or-int/2addr v11, v12

    .line 481
    shr-int/lit8 v12, v10, 0x4

    .line 482
    .line 483
    and-int/2addr v12, v5

    .line 484
    or-int/2addr v11, v12

    .line 485
    shr-int/lit8 v12, v10, 0x5

    .line 486
    .line 487
    and-int/2addr v12, v5

    .line 488
    const/4 v13, 0x4

    .line 489
    shl-int/2addr v12, v13

    .line 490
    or-int/2addr v11, v12

    .line 491
    sget-object v12, Lorg/eclipse/jetty/util/security/UnixCrypt;->S:[[B

    .line 492
    .line 493
    aget-object v12, v12, v8

    .line 494
    .line 495
    aget-byte v11, v12, v11

    .line 496
    .line 497
    shr-int/lit8 v12, v11, 0x3

    .line 498
    .line 499
    and-int/2addr v12, v5

    .line 500
    shr-int/lit8 v14, v11, 0x2

    .line 501
    .line 502
    and-int/2addr v14, v5

    .line 503
    shl-int/2addr v14, v5

    .line 504
    or-int/2addr v12, v14

    .line 505
    shr-int/lit8 v14, v11, 0x1

    .line 506
    .line 507
    and-int/2addr v14, v5

    .line 508
    shl-int/2addr v14, v3

    .line 509
    or-int/2addr v12, v14

    .line 510
    and-int/2addr v11, v5

    .line 511
    shl-int/2addr v11, v4

    .line 512
    or-int/2addr v11, v12

    .line 513
    move v12, v6

    .line 514
    :goto_12
    if-ge v12, v2, :cond_16

    .line 515
    .line 516
    aput-byte v6, v7, v12

    .line 517
    .line 518
    add-int/lit8 v12, v12, 0x1

    .line 519
    .line 520
    goto :goto_12

    .line 521
    :cond_16
    move v12, v6

    .line 522
    :goto_13
    if-ge v12, v13, :cond_17

    .line 523
    .line 524
    mul-int/lit8 v14, v8, 0x4

    .line 525
    .line 526
    add-int/2addr v14, v12

    .line 527
    shr-int v15, v11, v12

    .line 528
    .line 529
    and-int/2addr v15, v5

    .line 530
    int-to-byte v15, v15

    .line 531
    aput-byte v15, v7, v14

    .line 532
    .line 533
    add-int/lit8 v12, v12, 0x1

    .line 534
    .line 535
    goto :goto_13

    .line 536
    :cond_17
    const/16 v11, 0x18

    .line 537
    .line 538
    const-wide/16 v12, 0x0

    .line 539
    .line 540
    :goto_14
    add-int/lit8 v14, v11, -0x1

    .line 541
    .line 542
    if-ltz v14, :cond_18

    .line 543
    .line 544
    shl-long/2addr v12, v5

    .line 545
    aget-byte v15, v1, v14

    .line 546
    .line 547
    sub-int/2addr v15, v5

    .line 548
    aget-byte v15, v7, v15

    .line 549
    .line 550
    move-object/from16 v16, v1

    .line 551
    .line 552
    int-to-long v0, v15

    .line 553
    shl-long/2addr v0, v2

    .line 554
    or-long/2addr v0, v12

    .line 555
    add-int/lit8 v11, v11, 0x17

    .line 556
    .line 557
    aget-byte v11, v16, v11

    .line 558
    .line 559
    sub-int/2addr v11, v5

    .line 560
    aget-byte v11, v7, v11

    .line 561
    .line 562
    int-to-long v11, v11

    .line 563
    or-long v12, v0, v11

    .line 564
    .line 565
    move v11, v14

    .line 566
    move-object/from16 v1, v16

    .line 567
    .line 568
    const/16 v0, 0x40

    .line 569
    .line 570
    goto :goto_14

    .line 571
    :cond_18
    move-object/from16 v16, v1

    .line 572
    .line 573
    sget-object v0, Lorg/eclipse/jetty/util/security/UnixCrypt;->SPE:[[J

    .line 574
    .line 575
    aget-object v0, v0, v8

    .line 576
    .line 577
    invoke-static {v12, v13}, Lorg/eclipse/jetty/util/security/UnixCrypt;->to_six_bit(J)J

    .line 578
    .line 579
    .line 580
    move-result-wide v11

    .line 581
    aput-wide v11, v0, v10

    .line 582
    .line 583
    add-int/lit8 v10, v10, 0x1

    .line 584
    .line 585
    const/16 v0, 0x40

    .line 586
    .line 587
    goto :goto_11

    .line 588
    :cond_19
    move-object/from16 v16, v1

    .line 589
    .line 590
    add-int/lit8 v8, v8, 0x1

    .line 591
    .line 592
    const/16 v0, 0x40

    .line 593
    .line 594
    goto/16 :goto_10

    .line 595
    .line 596
    :cond_1a
    return-void

    .line 597
    :array_0
    .array-data 1
        0x3at
        0x32t
        0x2at
        0x22t
        0x1at
        0x12t
        0xat
        0x2t
        0x3ct
        0x34t
        0x2ct
        0x24t
        0x1ct
        0x14t
        0xct
        0x4t
        0x3et
        0x36t
        0x2et
        0x26t
        0x1et
        0x16t
        0xet
        0x6t
        0x40t
        0x38t
        0x30t
        0x28t
        0x20t
        0x18t
        0x10t
        0x8t
        0x39t
        0x31t
        0x29t
        0x21t
        0x19t
        0x11t
        0x9t
        0x1t
        0x3bt
        0x33t
        0x2bt
        0x23t
        0x1bt
        0x13t
        0xbt
        0x3t
        0x3dt
        0x35t
        0x2dt
        0x25t
        0x1dt
        0x15t
        0xdt
        0x5t
        0x3ft
        0x37t
        0x2ft
        0x27t
        0x1ft
        0x17t
        0xft
        0x7t
    .end array-data

    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    :array_1
    .array-data 1
        0x20t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        0x18t
        0x19t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x1t
    .end array-data

    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    :array_2
    .array-data 1
        0x39t
        0x31t
        0x29t
        0x21t
        0x19t
        0x11t
        0x9t
        0x1t
        0x3at
        0x32t
        0x2at
        0x22t
        0x1at
        0x12t
        0xat
        0x2t
        0x3bt
        0x33t
        0x2bt
        0x23t
        0x1bt
        0x13t
        0xbt
        0x3t
        0x3ct
        0x34t
        0x2ct
        0x24t
        0x3ft
        0x37t
        0x2ft
        0x27t
        0x1ft
        0x17t
        0xft
        0x7t
        0x3et
        0x36t
        0x2et
        0x26t
        0x1et
        0x16t
        0xet
        0x6t
        0x3dt
        0x35t
        0x2dt
        0x25t
        0x1dt
        0x15t
        0xdt
        0x5t
        0x1ct
        0x14t
        0xct
        0x4t
    .end array-data

    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    :array_3
    .array-data 1
        0x1t
        0x1t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x1t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x1t
    .end array-data

    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    :array_4
    .array-data 1
        0x9t
        0x12t
        0xet
        0x11t
        0xbt
        0x18t
        0x1t
        0x5t
        0x16t
        0x19t
        0x3t
        0x1ct
        0xft
        0x6t
        0x15t
        0xat
        0x23t
        0x26t
        0x17t
        0x13t
        0xct
        0x4t
        0x1at
        0x8t
        0x2bt
        0x36t
        0x10t
        0x7t
        0x1bt
        0x14t
        0xdt
        0x2t
        0x0t
        0x0t
        0x29t
        0x34t
        0x1ft
        0x25t
        0x2ft
        0x37t
        0x0t
        0x0t
        0x1et
        0x28t
        0x33t
        0x2dt
        0x21t
        0x30t
        0x0t
        0x0t
        0x2ct
        0x31t
        0x27t
        0x38t
        0x22t
        0x35t
        0x0t
        0x0t
        0x2et
        0x2at
        0x32t
        0x24t
        0x1dt
        0x20t
    .end array-data

    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    :array_5
    .array-data 1
        0xet
        0x4t
        0xdt
        0x1t
        0x2t
        0xft
        0xbt
        0x8t
        0x3t
        0xat
        0x6t
        0xct
        0x5t
        0x9t
        0x0t
        0x7t
        0x0t
        0xft
        0x7t
        0x4t
        0xet
        0x2t
        0xdt
        0x1t
        0xat
        0x6t
        0xct
        0xbt
        0x9t
        0x5t
        0x3t
        0x8t
        0x4t
        0x1t
        0xet
        0x8t
        0xdt
        0x6t
        0x2t
        0xbt
        0xft
        0xct
        0x9t
        0x7t
        0x3t
        0xat
        0x5t
        0x0t
        0xft
        0xct
        0x8t
        0x2t
        0x4t
        0x9t
        0x1t
        0x7t
        0x5t
        0xbt
        0x3t
        0xet
        0xat
        0x0t
        0x6t
        0xdt
    .end array-data

    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    :array_6
    .array-data 1
        0xft
        0x1t
        0x8t
        0xet
        0x6t
        0xbt
        0x3t
        0x4t
        0x9t
        0x7t
        0x2t
        0xdt
        0xct
        0x0t
        0x5t
        0xat
        0x3t
        0xdt
        0x4t
        0x7t
        0xft
        0x2t
        0x8t
        0xet
        0xct
        0x0t
        0x1t
        0xat
        0x6t
        0x9t
        0xbt
        0x5t
        0x0t
        0xet
        0x7t
        0xbt
        0xat
        0x4t
        0xdt
        0x1t
        0x5t
        0x8t
        0xct
        0x6t
        0x9t
        0x3t
        0x2t
        0xft
        0xdt
        0x8t
        0xat
        0x1t
        0x3t
        0xft
        0x4t
        0x2t
        0xbt
        0x6t
        0x7t
        0xct
        0x0t
        0x5t
        0xet
        0x9t
    .end array-data

    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    :array_7
    .array-data 1
        0xat
        0x0t
        0x9t
        0xet
        0x6t
        0x3t
        0xft
        0x5t
        0x1t
        0xdt
        0xct
        0x7t
        0xbt
        0x4t
        0x2t
        0x8t
        0xdt
        0x7t
        0x0t
        0x9t
        0x3t
        0x4t
        0x6t
        0xat
        0x2t
        0x8t
        0x5t
        0xet
        0xct
        0xbt
        0xft
        0x1t
        0xdt
        0x6t
        0x4t
        0x9t
        0x8t
        0xft
        0x3t
        0x0t
        0xbt
        0x1t
        0x2t
        0xct
        0x5t
        0xat
        0xet
        0x7t
        0x1t
        0xat
        0xdt
        0x0t
        0x6t
        0x9t
        0x8t
        0x7t
        0x4t
        0xft
        0xet
        0x3t
        0xbt
        0x5t
        0x2t
        0xct
    .end array-data

    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    .line 848
    .line 849
    :array_8
    .array-data 1
        0x7t
        0xdt
        0xet
        0x3t
        0x0t
        0x6t
        0x9t
        0xat
        0x1t
        0x2t
        0x8t
        0x5t
        0xbt
        0xct
        0x4t
        0xft
        0xdt
        0x8t
        0xbt
        0x5t
        0x6t
        0xft
        0x0t
        0x3t
        0x4t
        0x7t
        0x2t
        0xct
        0x1t
        0xat
        0xet
        0x9t
        0xat
        0x6t
        0x9t
        0x0t
        0xct
        0xbt
        0x7t
        0xdt
        0xft
        0x1t
        0x3t
        0xet
        0x5t
        0x2t
        0x8t
        0x4t
        0x3t
        0xft
        0x0t
        0x6t
        0xat
        0x1t
        0xdt
        0x8t
        0x9t
        0x4t
        0x5t
        0xbt
        0xct
        0x7t
        0x2t
        0xet
    .end array-data

    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    .line 858
    .line 859
    .line 860
    .line 861
    .line 862
    .line 863
    .line 864
    .line 865
    .line 866
    .line 867
    .line 868
    .line 869
    .line 870
    .line 871
    .line 872
    .line 873
    .line 874
    .line 875
    .line 876
    .line 877
    .line 878
    .line 879
    .line 880
    .line 881
    .line 882
    .line 883
    .line 884
    .line 885
    :array_9
    .array-data 1
        0x2t
        0xct
        0x4t
        0x1t
        0x7t
        0xat
        0xbt
        0x6t
        0x8t
        0x5t
        0x3t
        0xft
        0xdt
        0x0t
        0xet
        0x9t
        0xet
        0xbt
        0x2t
        0xct
        0x4t
        0x7t
        0xdt
        0x1t
        0x5t
        0x0t
        0xft
        0xat
        0x3t
        0x9t
        0x8t
        0x6t
        0x4t
        0x2t
        0x1t
        0xbt
        0xat
        0xdt
        0x7t
        0x8t
        0xft
        0x9t
        0xct
        0x5t
        0x6t
        0x3t
        0x0t
        0xet
        0xbt
        0x8t
        0xct
        0x7t
        0x1t
        0xet
        0x2t
        0xdt
        0x6t
        0xft
        0x0t
        0x9t
        0xat
        0x4t
        0x5t
        0x3t
    .end array-data

    .line 886
    .line 887
    .line 888
    .line 889
    .line 890
    .line 891
    .line 892
    .line 893
    .line 894
    .line 895
    .line 896
    .line 897
    .line 898
    .line 899
    .line 900
    .line 901
    .line 902
    .line 903
    .line 904
    .line 905
    .line 906
    .line 907
    .line 908
    .line 909
    .line 910
    .line 911
    .line 912
    .line 913
    .line 914
    .line 915
    .line 916
    .line 917
    .line 918
    .line 919
    .line 920
    .line 921
    :array_a
    .array-data 1
        0xct
        0x1t
        0xat
        0xft
        0x9t
        0x2t
        0x6t
        0x8t
        0x0t
        0xdt
        0x3t
        0x4t
        0xet
        0x7t
        0x5t
        0xbt
        0xat
        0xft
        0x4t
        0x2t
        0x7t
        0xct
        0x9t
        0x5t
        0x6t
        0x1t
        0xdt
        0xet
        0x0t
        0xbt
        0x3t
        0x8t
        0x9t
        0xet
        0xft
        0x5t
        0x2t
        0x8t
        0xct
        0x3t
        0x7t
        0x0t
        0x4t
        0xat
        0x1t
        0xdt
        0xbt
        0x6t
        0x4t
        0x3t
        0x2t
        0xct
        0x9t
        0x5t
        0xft
        0xat
        0xbt
        0xet
        0x1t
        0x7t
        0x6t
        0x0t
        0x8t
        0xdt
    .end array-data

    .line 922
    .line 923
    .line 924
    .line 925
    .line 926
    .line 927
    .line 928
    .line 929
    .line 930
    .line 931
    .line 932
    .line 933
    .line 934
    .line 935
    .line 936
    .line 937
    .line 938
    .line 939
    .line 940
    .line 941
    .line 942
    .line 943
    .line 944
    .line 945
    .line 946
    .line 947
    .line 948
    .line 949
    .line 950
    .line 951
    .line 952
    .line 953
    .line 954
    .line 955
    .line 956
    .line 957
    :array_b
    .array-data 1
        0x4t
        0xbt
        0x2t
        0xet
        0xft
        0x0t
        0x8t
        0xdt
        0x3t
        0xct
        0x9t
        0x7t
        0x5t
        0xat
        0x6t
        0x1t
        0xdt
        0x0t
        0xbt
        0x7t
        0x4t
        0x9t
        0x1t
        0xat
        0xet
        0x3t
        0x5t
        0xct
        0x2t
        0xft
        0x8t
        0x6t
        0x1t
        0x4t
        0xbt
        0xdt
        0xct
        0x3t
        0x7t
        0xet
        0xat
        0xft
        0x6t
        0x8t
        0x0t
        0x5t
        0x9t
        0x2t
        0x6t
        0xbt
        0xdt
        0x8t
        0x1t
        0x4t
        0xat
        0x7t
        0x9t
        0x5t
        0x0t
        0xft
        0xet
        0x2t
        0x3t
        0xct
    .end array-data

    .line 958
    .line 959
    .line 960
    .line 961
    .line 962
    .line 963
    .line 964
    .line 965
    .line 966
    .line 967
    .line 968
    .line 969
    .line 970
    .line 971
    .line 972
    .line 973
    .line 974
    .line 975
    .line 976
    .line 977
    .line 978
    .line 979
    .line 980
    .line 981
    .line 982
    .line 983
    .line 984
    .line 985
    .line 986
    .line 987
    .line 988
    .line 989
    .line 990
    .line 991
    .line 992
    .line 993
    :array_c
    .array-data 1
        0xdt
        0x2t
        0x8t
        0x4t
        0x6t
        0xft
        0xbt
        0x1t
        0xat
        0x9t
        0x3t
        0xet
        0x5t
        0x0t
        0xct
        0x7t
        0x1t
        0xft
        0xdt
        0x8t
        0xat
        0x3t
        0x7t
        0x4t
        0xct
        0x5t
        0x6t
        0xbt
        0x0t
        0xet
        0x9t
        0x2t
        0x7t
        0xbt
        0x4t
        0x1t
        0x9t
        0xct
        0xet
        0x2t
        0x0t
        0x6t
        0xat
        0xdt
        0xft
        0x3t
        0x5t
        0x8t
        0x2t
        0x1t
        0xet
        0x7t
        0x4t
        0xat
        0x8t
        0xdt
        0xft
        0xct
        0x9t
        0x0t
        0x3t
        0x5t
        0x6t
        0xbt
    .end array-data

    .line 994
    .line 995
    .line 996
    .line 997
    .line 998
    .line 999
    .line 1000
    .line 1001
    .line 1002
    .line 1003
    .line 1004
    .line 1005
    .line 1006
    .line 1007
    .line 1008
    .line 1009
    .line 1010
    .line 1011
    .line 1012
    .line 1013
    .line 1014
    .line 1015
    .line 1016
    .line 1017
    .line 1018
    .line 1019
    .line 1020
    .line 1021
    .line 1022
    .line 1023
    .line 1024
    .line 1025
    .line 1026
    .line 1027
    .line 1028
    :array_d
    .array-data 1
        0x10t
        0x7t
        0x14t
        0x15t
        0x1dt
        0xct
        0x1ct
        0x11t
        0x1t
        0xft
        0x17t
        0x1at
        0x5t
        0x12t
        0x1ft
        0xat
        0x2t
        0x8t
        0x18t
        0xet
        0x20t
        0x1bt
        0x3t
        0x9t
        0x13t
        0xdt
        0x1et
        0x6t
        0x16t
        0xbt
        0x4t
        0x19t
    .end array-data

    :array_e
    .array-data 1
        0x1t
        0x2t
        0x3t
        0x4t
        0x11t
        0x12t
        0x13t
        0x14t
        0x5t
        0x6t
        0x7t
        0x8t
        0x15t
        0x16t
        0x17t
        0x18t
        0x9t
        0xat
        0xbt
        0xct
        0x19t
        0x1at
        0x1bt
        0x1ct
        0xdt
        0xet
        0xft
        0x10t
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x31t
        0x32t
        0x33t
        0x34t
        0x25t
        0x26t
        0x27t
        0x28t
        0x35t
        0x36t
        0x37t
        0x38t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x3dt
        0x3et
        0x3ft
        0x40t
    .end array-data

    :array_f
    .array-data 1
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static crypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    if-eqz p0, :cond_6

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    move v6, v3

    .line 19
    move-wide v7, v4

    .line 20
    :goto_0
    const/16 v9, 0x8

    .line 21
    .line 22
    const/4 v10, 0x2

    .line 23
    if-ge v6, v9, :cond_2

    .line 24
    .line 25
    shl-long/2addr v7, v9

    .line 26
    if-ge v6, v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    .line 29
    .line 30
    .line 31
    move-result v9

    .line 32
    mul-int/2addr v9, v10

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v9, v3

    .line 35
    :goto_1
    int-to-long v9, v9

    .line 36
    or-long/2addr v7, v9

    .line 37
    add-int/lit8 v6, v6, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    invoke-static {v7, v8}, Lorg/eclipse/jetty/util/security/UnixCrypt;->des_setkey(J)[J

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    move v6, v3

    .line 45
    move v2, v10

    .line 46
    :goto_2
    add-int/lit8 v2, v2, -0x1

    .line 47
    .line 48
    if-ltz v2, :cond_4

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    if-ge v2, v7, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    const/16 v7, 0x2e

    .line 62
    .line 63
    :goto_3
    int-to-byte v8, v7

    .line 64
    aput-byte v8, v1, v2

    .line 65
    .line 66
    shl-int/lit8 v6, v6, 0x6

    .line 67
    .line 68
    sget-object v8, Lorg/eclipse/jetty/util/security/UnixCrypt;->A64TOI:[B

    .line 69
    .line 70
    aget-byte v7, v8, v7

    .line 71
    .line 72
    and-int/lit16 v7, v7, 0xff

    .line 73
    .line 74
    or-int/2addr v6, v7

    .line 75
    goto :goto_2

    .line 76
    :cond_4
    const/16 p1, 0x19

    .line 77
    .line 78
    invoke-static {v4, v5, v6, p1, p0}, Lorg/eclipse/jetty/util/security/UnixCrypt;->des_cipher(JII[J)J

    .line 79
    .line 80
    .line 81
    move-result-wide p0

    .line 82
    sget-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->ITOA64:[B

    .line 83
    .line 84
    long-to-int v4, p0

    .line 85
    shl-int/2addr v4, v10

    .line 86
    and-int/lit8 v4, v4, 0x3f

    .line 87
    .line 88
    aget-byte v2, v2, v4

    .line 89
    .line 90
    const/16 v4, 0xc

    .line 91
    .line 92
    aput-byte v2, v1, v4

    .line 93
    .line 94
    const/4 v2, 0x4

    .line 95
    :goto_4
    shr-long/2addr p0, v2

    .line 96
    add-int/lit8 v4, v4, -0x1

    .line 97
    .line 98
    if-lt v4, v10, :cond_5

    .line 99
    .line 100
    sget-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->ITOA64:[B

    .line 101
    .line 102
    long-to-int v5, p0

    .line 103
    and-int/lit8 v5, v5, 0x3f

    .line 104
    .line 105
    aget-byte v2, v2, v5

    .line 106
    .line 107
    aput-byte v2, v1, v4

    .line 108
    .line 109
    const/4 v2, 0x6

    .line 110
    goto :goto_4

    .line 111
    :cond_5
    new-instance p0, Ljava/lang/String;

    .line 112
    .line 113
    invoke-direct {p0, v1, v3, v0}, Ljava/lang/String;-><init>([BII)V

    .line 114
    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_6
    :goto_5
    const-string p0, "*"

    .line 118
    .line 119
    return-object p0
.end method

.method private static des_cipher(JII[J)J
    .locals 37

    .line 1
    invoke-static/range {p2 .. p2}, Lorg/eclipse/jetty/util/security/UnixCrypt;->to_six_bit(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide v1, 0x5555555555555555L    # 1.1945305291614955E103

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long v1, p0, v1

    .line 11
    .line 12
    const-wide v3, -0x5555555600000000L    # -3.720660661677042E-103

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    and-long v3, p0, v3

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    shr-long v6, p0, v5

    .line 21
    .line 22
    const-wide/32 v8, 0x55555555

    .line 23
    .line 24
    .line 25
    and-long/2addr v6, v8

    .line 26
    or-long/2addr v3, v6

    .line 27
    shl-long v6, v1, v5

    .line 28
    .line 29
    const/16 v8, 0x20

    .line 30
    .line 31
    shl-long/2addr v1, v8

    .line 32
    or-long/2addr v1, v6

    .line 33
    const-wide v6, -0x100000000L

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    and-long/2addr v1, v6

    .line 39
    shr-long v6, v3, v8

    .line 40
    .line 41
    or-long/2addr v3, v6

    .line 42
    const-wide v6, 0xffffffffL

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    and-long/2addr v3, v6

    .line 48
    or-long/2addr v1, v3

    .line 49
    shr-long/2addr v1, v8

    .line 50
    long-to-int v1, v1

    .line 51
    sget-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->IE3264:[[J

    .line 52
    .line 53
    invoke-static {v1, v2}, Lorg/eclipse/jetty/util/security/UnixCrypt;->perm3264(I[[J)J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    long-to-int v1, v3

    .line 58
    invoke-static {v1, v2}, Lorg/eclipse/jetty/util/security/UnixCrypt;->perm3264(I[[J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v1

    .line 62
    move-wide v9, v3

    .line 63
    move-wide v2, v1

    .line 64
    move/from16 v1, p3

    .line 65
    .line 66
    :goto_0
    add-int/lit8 v1, v1, -0x1

    .line 67
    .line 68
    if-ltz v1, :cond_1

    .line 69
    .line 70
    const/4 v11, 0x0

    .line 71
    :goto_1
    const/16 v12, 0x8

    .line 72
    .line 73
    if-ge v11, v12, :cond_0

    .line 74
    .line 75
    shl-int/lit8 v12, v11, 0x1

    .line 76
    .line 77
    aget-wide v13, p4, v12

    .line 78
    .line 79
    shr-long v15, v2, v8

    .line 80
    .line 81
    xor-long/2addr v15, v2

    .line 82
    move/from16 p2, v5

    .line 83
    .line 84
    const/16 p0, 0x0

    .line 85
    .line 86
    int-to-long v4, v0

    .line 87
    and-long/2addr v15, v4

    .line 88
    and-long/2addr v15, v6

    .line 89
    shl-long v17, v15, v8

    .line 90
    .line 91
    or-long v15, v15, v17

    .line 92
    .line 93
    xor-long/2addr v15, v2

    .line 94
    xor-long/2addr v13, v15

    .line 95
    sget-object v15, Lorg/eclipse/jetty/util/security/UnixCrypt;->SPE:[[J

    .line 96
    .line 97
    aget-object v16, v15, p0

    .line 98
    .line 99
    const/16 v17, 0x3a

    .line 100
    .line 101
    shr-long v18, v13, v17

    .line 102
    .line 103
    const-wide/16 v20, 0x3f

    .line 104
    .line 105
    move-wide/from16 v22, v6

    .line 106
    .line 107
    and-long v6, v18, v20

    .line 108
    .line 109
    long-to-int v6, v6

    .line 110
    aget-wide v6, v16, v6

    .line 111
    .line 112
    aget-object v18, v15, p2

    .line 113
    .line 114
    const/16 v19, 0x32

    .line 115
    .line 116
    shr-long v24, v13, v19

    .line 117
    .line 118
    move/from16 p1, v8

    .line 119
    .line 120
    move-wide/from16 v26, v9

    .line 121
    .line 122
    and-long v8, v24, v20

    .line 123
    .line 124
    long-to-int v8, v8

    .line 125
    aget-wide v8, v18, v8

    .line 126
    .line 127
    xor-long/2addr v6, v8

    .line 128
    const/4 v8, 0x2

    .line 129
    aget-object v9, v15, v8

    .line 130
    .line 131
    const/16 v10, 0x2a

    .line 132
    .line 133
    shr-long v24, v13, v10

    .line 134
    .line 135
    move/from16 p3, v8

    .line 136
    .line 137
    move-object/from16 v28, v9

    .line 138
    .line 139
    and-long v8, v24, v20

    .line 140
    .line 141
    long-to-int v8, v8

    .line 142
    aget-wide v8, v28, v8

    .line 143
    .line 144
    xor-long/2addr v6, v8

    .line 145
    const/4 v8, 0x3

    .line 146
    aget-object v8, v15, v8

    .line 147
    .line 148
    const/16 v9, 0x22

    .line 149
    .line 150
    shr-long v24, v13, v9

    .line 151
    .line 152
    move/from16 v30, v9

    .line 153
    .line 154
    move/from16 v29, v10

    .line 155
    .line 156
    and-long v9, v24, v20

    .line 157
    .line 158
    long-to-int v9, v9

    .line 159
    aget-wide v9, v8, v9

    .line 160
    .line 161
    xor-long/2addr v6, v9

    .line 162
    const/4 v9, 0x4

    .line 163
    aget-object v9, v15, v9

    .line 164
    .line 165
    const/16 v10, 0x1a

    .line 166
    .line 167
    shr-long v24, v13, v10

    .line 168
    .line 169
    move/from16 v32, v10

    .line 170
    .line 171
    move/from16 v31, v11

    .line 172
    .line 173
    and-long v10, v24, v20

    .line 174
    .line 175
    long-to-int v10, v10

    .line 176
    aget-wide v10, v9, v10

    .line 177
    .line 178
    xor-long/2addr v6, v10

    .line 179
    const/4 v10, 0x5

    .line 180
    aget-object v10, v15, v10

    .line 181
    .line 182
    const/16 v11, 0x12

    .line 183
    .line 184
    shr-long v24, v13, v11

    .line 185
    .line 186
    move/from16 v34, v11

    .line 187
    .line 188
    move/from16 v33, v12

    .line 189
    .line 190
    and-long v11, v24, v20

    .line 191
    .line 192
    long-to-int v11, v11

    .line 193
    aget-wide v11, v10, v11

    .line 194
    .line 195
    xor-long/2addr v6, v11

    .line 196
    const/4 v11, 0x6

    .line 197
    aget-object v11, v15, v11

    .line 198
    .line 199
    const/16 v12, 0xa

    .line 200
    .line 201
    shr-long v24, v13, v12

    .line 202
    .line 203
    move-wide/from16 v35, v13

    .line 204
    .line 205
    move v14, v12

    .line 206
    and-long v12, v24, v20

    .line 207
    .line 208
    long-to-int v12, v12

    .line 209
    aget-wide v12, v11, v12

    .line 210
    .line 211
    xor-long/2addr v6, v12

    .line 212
    const/4 v12, 0x7

    .line 213
    aget-object v12, v15, v12

    .line 214
    .line 215
    shr-long v24, v35, p3

    .line 216
    .line 217
    move v13, v14

    .line 218
    and-long v14, v24, v20

    .line 219
    .line 220
    long-to-int v14, v14

    .line 221
    aget-wide v14, v12, v14

    .line 222
    .line 223
    xor-long/2addr v6, v14

    .line 224
    xor-long v6, v26, v6

    .line 225
    .line 226
    add-int/lit8 v14, v33, 0x1

    .line 227
    .line 228
    aget-wide v14, p4, v14

    .line 229
    .line 230
    shr-long v24, v6, p1

    .line 231
    .line 232
    xor-long v24, v24, v6

    .line 233
    .line 234
    and-long v4, v24, v4

    .line 235
    .line 236
    and-long v4, v4, v22

    .line 237
    .line 238
    shl-long v24, v4, p1

    .line 239
    .line 240
    or-long v4, v4, v24

    .line 241
    .line 242
    xor-long/2addr v4, v6

    .line 243
    xor-long/2addr v4, v14

    .line 244
    shr-long v14, v4, v17

    .line 245
    .line 246
    and-long v14, v14, v20

    .line 247
    .line 248
    long-to-int v14, v14

    .line 249
    aget-wide v14, v16, v14

    .line 250
    .line 251
    shr-long v16, v4, v19

    .line 252
    .line 253
    move/from16 v19, v13

    .line 254
    .line 255
    move-wide/from16 v24, v14

    .line 256
    .line 257
    and-long v13, v16, v20

    .line 258
    .line 259
    long-to-int v13, v13

    .line 260
    aget-wide v13, v18, v13

    .line 261
    .line 262
    xor-long v13, v24, v13

    .line 263
    .line 264
    shr-long v15, v4, v29

    .line 265
    .line 266
    move/from16 v17, v0

    .line 267
    .line 268
    move/from16 v18, v1

    .line 269
    .line 270
    and-long v0, v15, v20

    .line 271
    .line 272
    long-to-int v0, v0

    .line 273
    aget-wide v0, v28, v0

    .line 274
    .line 275
    xor-long/2addr v0, v13

    .line 276
    shr-long v13, v4, v30

    .line 277
    .line 278
    and-long v13, v13, v20

    .line 279
    .line 280
    long-to-int v13, v13

    .line 281
    aget-wide v13, v8, v13

    .line 282
    .line 283
    xor-long/2addr v0, v13

    .line 284
    shr-long v13, v4, v32

    .line 285
    .line 286
    and-long v13, v13, v20

    .line 287
    .line 288
    long-to-int v8, v13

    .line 289
    aget-wide v8, v9, v8

    .line 290
    .line 291
    xor-long/2addr v0, v8

    .line 292
    shr-long v8, v4, v34

    .line 293
    .line 294
    and-long v8, v8, v20

    .line 295
    .line 296
    long-to-int v8, v8

    .line 297
    aget-wide v8, v10, v8

    .line 298
    .line 299
    xor-long/2addr v0, v8

    .line 300
    shr-long v8, v4, v19

    .line 301
    .line 302
    and-long v8, v8, v20

    .line 303
    .line 304
    long-to-int v8, v8

    .line 305
    aget-wide v8, v11, v8

    .line 306
    .line 307
    xor-long/2addr v0, v8

    .line 308
    shr-long v4, v4, p3

    .line 309
    .line 310
    and-long v4, v4, v20

    .line 311
    .line 312
    long-to-int v4, v4

    .line 313
    aget-wide v4, v12, v4

    .line 314
    .line 315
    xor-long/2addr v0, v4

    .line 316
    xor-long/2addr v2, v0

    .line 317
    add-int/lit8 v11, v31, 0x1

    .line 318
    .line 319
    move/from16 v8, p1

    .line 320
    .line 321
    move/from16 v5, p2

    .line 322
    .line 323
    move-wide v9, v6

    .line 324
    move/from16 v0, v17

    .line 325
    .line 326
    move/from16 v1, v18

    .line 327
    .line 328
    move-wide/from16 v6, v22

    .line 329
    .line 330
    goto/16 :goto_1

    .line 331
    .line 332
    :cond_0
    move/from16 v17, v0

    .line 333
    .line 334
    move/from16 v18, v1

    .line 335
    .line 336
    move/from16 p2, v5

    .line 337
    .line 338
    move-wide/from16 v22, v6

    .line 339
    .line 340
    move/from16 p1, v8

    .line 341
    .line 342
    move-wide/from16 v26, v9

    .line 343
    .line 344
    xor-long v0, v26, v2

    .line 345
    .line 346
    xor-long/2addr v2, v0

    .line 347
    xor-long v9, v0, v2

    .line 348
    .line 349
    move/from16 v0, v17

    .line 350
    .line 351
    move/from16 v1, v18

    .line 352
    .line 353
    goto/16 :goto_0

    .line 354
    .line 355
    :cond_1
    move/from16 p2, v5

    .line 356
    .line 357
    move/from16 p1, v8

    .line 358
    .line 359
    const/16 v0, 0x23

    .line 360
    .line 361
    shr-long v4, v9, v0

    .line 362
    .line 363
    const-wide/32 v6, 0xf0f0f0f

    .line 364
    .line 365
    .line 366
    and-long/2addr v4, v6

    .line 367
    shl-long v8, v9, p2

    .line 368
    .line 369
    const-wide v10, 0xf0f0f0f0L

    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    and-long/2addr v8, v10

    .line 375
    or-long/2addr v4, v8

    .line 376
    shl-long v4, v4, p1

    .line 377
    .line 378
    shr-long v0, v2, v0

    .line 379
    .line 380
    and-long/2addr v0, v6

    .line 381
    shl-long v2, v2, p2

    .line 382
    .line 383
    and-long/2addr v2, v10

    .line 384
    or-long/2addr v0, v2

    .line 385
    or-long/2addr v0, v4

    .line 386
    sget-object v2, Lorg/eclipse/jetty/util/security/UnixCrypt;->CF6464:[[J

    .line 387
    .line 388
    invoke-static {v0, v1, v2}, Lorg/eclipse/jetty/util/security/UnixCrypt;->perm6464(J[[J)J

    .line 389
    .line 390
    .line 391
    move-result-wide v0

    .line 392
    return-wide v0
.end method

.method private static des_setkey(J)[J
    .locals 8

    .line 1
    sget-object v0, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC1ROT:[[J

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lorg/eclipse/jetty/util/security/UnixCrypt;->perm6464(J[[J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    const/16 v0, 0x10

    .line 8
    .line 9
    new-array v1, v0, [J

    .line 10
    .line 11
    const-wide v2, -0x303030300000001L    # -1.157117777211213E294

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    and-long v4, p0, v2

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    aput-wide v4, v1, v6

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    move v5, v4

    .line 23
    :goto_0
    if-ge v5, v0, :cond_0

    .line 24
    .line 25
    aput-wide p0, v1, v5

    .line 26
    .line 27
    sget-object v6, Lorg/eclipse/jetty/util/security/UnixCrypt;->PC2ROT:[[[J

    .line 28
    .line 29
    sget-object v7, Lorg/eclipse/jetty/util/security/UnixCrypt;->Rotates:[B

    .line 30
    .line 31
    aget-byte v7, v7, v5

    .line 32
    .line 33
    sub-int/2addr v7, v4

    .line 34
    aget-object v6, v6, v7

    .line 35
    .line 36
    invoke-static {p0, p1, v6}, Lorg/eclipse/jetty/util/security/UnixCrypt;->perm6464(J[[J)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    and-long v6, p0, v2

    .line 41
    .line 42
    aput-wide v6, v1, v5

    .line 43
    .line 44
    add-int/lit8 v5, v5, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-object v1
.end method

.method private static init_perm([[J[BI)V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    mul-int/lit8 v2, p2, 0x8

    .line 4
    .line 5
    if-ge v1, v2, :cond_3

    .line 6
    .line 7
    aget-byte v2, p1, v1

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    sub-int/2addr v2, v3

    .line 11
    if-gez v2, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    shr-int/lit8 v4, v2, 0x2

    .line 15
    .line 16
    and-int/lit8 v2, v2, 0x3

    .line 17
    .line 18
    shl-int v2, v3, v2

    .line 19
    .line 20
    move v3, v0

    .line 21
    :goto_1
    const/16 v5, 0x10

    .line 22
    .line 23
    if-ge v3, v5, :cond_2

    .line 24
    .line 25
    and-int/lit8 v5, v1, 0x7

    .line 26
    .line 27
    shr-int/lit8 v6, v1, 0x3

    .line 28
    .line 29
    rsub-int/lit8 v6, v6, 0x7

    .line 30
    .line 31
    shl-int/lit8 v6, v6, 0x3

    .line 32
    .line 33
    add-int/2addr v5, v6

    .line 34
    and-int v6, v3, v2

    .line 35
    .line 36
    if-eqz v6, :cond_1

    .line 37
    .line 38
    aget-object v6, p0, v4

    .line 39
    .line 40
    aget-wide v7, v6, v3

    .line 41
    .line 42
    const-wide/16 v9, 0x1

    .line 43
    .line 44
    shl-long/2addr v9, v5

    .line 45
    or-long/2addr v7, v9

    .line 46
    aput-wide v7, v6, v3

    .line 47
    .line 48
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 7
    .line 8
    const-string v1, "Usage - java org.eclipse.util.UnixCrypt <key> <salt>"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "Crypt="

    .line 21
    .line 22
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aget-object v3, p0, v3

    .line 27
    .line 28
    aget-object p0, p0, v2

    .line 29
    .line 30
    invoke-static {v3, p0}, Lorg/eclipse/jetty/util/security/UnixCrypt;->crypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private static perm3264(I[[J)J
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x4

    .line 4
    move v3, v2

    .line 5
    :goto_0
    add-int/lit8 v3, v3, -0x1

    .line 6
    .line 7
    if-ltz v3, :cond_0

    .line 8
    .line 9
    and-int/lit16 v4, p0, 0xff

    .line 10
    .line 11
    shr-int/lit8 v5, p0, 0x8

    .line 12
    .line 13
    shl-int/lit8 v6, v3, 0x1

    .line 14
    .line 15
    aget-object v7, p1, v6

    .line 16
    .line 17
    and-int/lit8 p0, p0, 0xf

    .line 18
    .line 19
    aget-wide v8, v7, p0

    .line 20
    .line 21
    or-long/2addr v0, v8

    .line 22
    add-int/lit8 v6, v6, 0x1

    .line 23
    .line 24
    aget-object p0, p1, v6

    .line 25
    .line 26
    shr-int/2addr v4, v2

    .line 27
    aget-wide v6, p0, v4

    .line 28
    .line 29
    or-long/2addr v0, v6

    .line 30
    move p0, v5

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-wide v0
.end method

.method private static perm6464(J[[J)J
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/16 v2, 0x8

    .line 4
    .line 5
    move v3, v2

    .line 6
    :goto_0
    add-int/lit8 v3, v3, -0x1

    .line 7
    .line 8
    if-ltz v3, :cond_0

    .line 9
    .line 10
    const-wide/16 v4, 0xff

    .line 11
    .line 12
    and-long/2addr v4, p0

    .line 13
    long-to-int v4, v4

    .line 14
    shr-long/2addr p0, v2

    .line 15
    shl-int/lit8 v5, v3, 0x1

    .line 16
    .line 17
    aget-object v6, p2, v5

    .line 18
    .line 19
    and-int/lit8 v7, v4, 0xf

    .line 20
    .line 21
    aget-wide v7, v6, v7

    .line 22
    .line 23
    or-long/2addr v0, v7

    .line 24
    add-int/lit8 v5, v5, 0x1

    .line 25
    .line 26
    aget-object v5, p2, v5

    .line 27
    .line 28
    shr-int/lit8 v4, v4, 0x4

    .line 29
    .line 30
    aget-wide v4, v5, v4

    .line 31
    .line 32
    or-long/2addr v0, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-wide v0
.end method

.method private static to_six_bit(I)I
    .locals 3

    .line 2
    shl-int/lit8 v0, p0, 0x1a

    const/high16 v1, -0x4000000

    and-int/2addr v0, v1

    shl-int/lit8 v1, p0, 0xc

    const/high16 v2, 0xfc0000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    shr-int/lit8 v1, p0, 0x2

    const v2, 0xfc00

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    shr-int/lit8 p0, p0, 0x10

    and-int/lit16 p0, p0, 0xfc

    or-int/2addr p0, v0

    return p0
.end method

.method private static to_six_bit(J)J
    .locals 6

    .line 1
    const/16 v0, 0x1a

    shl-long v0, p0, v0

    const-wide v2, -0x3ffffff04000000L

    and-long/2addr v0, v2

    const/16 v2, 0xc

    shl-long v2, p0, v2

    const-wide v4, 0xfc000000fc0000L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    const/4 v2, 0x2

    shr-long v2, p0, v2

    const-wide v4, 0xfc000000fc00L

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    const/16 v2, 0x10

    shr-long/2addr p0, v2

    const-wide v2, 0xfc000000fcL

    and-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
.end method

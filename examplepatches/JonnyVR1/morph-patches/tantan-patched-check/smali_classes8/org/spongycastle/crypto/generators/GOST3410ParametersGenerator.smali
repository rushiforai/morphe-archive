.class public Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ONE:Ljava/math/BigInteger;

.field private static final TWO:Ljava/math/BigInteger;


# instance fields
.field private init_random:Ljava/security/SecureRandom;

.field private size:I

.field private typeproc:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 8
    .line 9
    const-wide/16 v0, 0x2

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private procedure_A(II[Ljava/math/BigInteger;I)I
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    :goto_0
    const v2, 0x8000

    .line 6
    .line 7
    .line 8
    if-ltz v1, :cond_b

    .line 9
    .line 10
    const/high16 v3, 0x10000

    .line 11
    .line 12
    if-le v1, v3, :cond_0

    .line 13
    .line 14
    goto/16 :goto_9

    .line 15
    .line 16
    :cond_0
    move/from16 v4, p2

    .line 17
    .line 18
    :goto_1
    const/4 v5, 0x1

    .line 19
    if-ltz v4, :cond_a

    .line 20
    .line 21
    if-gt v4, v3, :cond_a

    .line 22
    .line 23
    div-int/lit8 v6, v4, 0x2

    .line 24
    .line 25
    if-nez v6, :cond_1

    .line 26
    .line 27
    goto/16 :goto_8

    .line 28
    .line 29
    :cond_1
    new-instance v0, Ljava/math/BigInteger;

    .line 30
    .line 31
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ljava/math/BigInteger;

    .line 39
    .line 40
    const-string v3, "19381"

    .line 41
    .line 42
    invoke-direct {v2, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-array v3, v5, [Ljava/math/BigInteger;

    .line 46
    .line 47
    new-instance v4, Ljava/math/BigInteger;

    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {v4, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    aput-object v4, v3, v1

    .line 58
    .line 59
    new-array v4, v5, [I

    .line 60
    .line 61
    aput p4, v4, v1

    .line 62
    .line 63
    move v6, v1

    .line 64
    move v7, v6

    .line 65
    :goto_2
    aget v8, v4, v6

    .line 66
    .line 67
    const/16 v9, 0x11

    .line 68
    .line 69
    if-lt v8, v9, :cond_2

    .line 70
    .line 71
    array-length v7, v4

    .line 72
    add-int/2addr v7, v5

    .line 73
    new-array v8, v7, [I

    .line 74
    .line 75
    array-length v9, v4

    .line 76
    invoke-static {v4, v1, v8, v1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    .line 78
    .line 79
    new-array v4, v7, [I

    .line 80
    .line 81
    invoke-static {v8, v1, v4, v1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    .line 83
    .line 84
    add-int/lit8 v7, v6, 0x1

    .line 85
    .line 86
    aget v6, v4, v6

    .line 87
    .line 88
    div-int/lit8 v6, v6, 0x2

    .line 89
    .line 90
    aput v6, v4, v7

    .line 91
    .line 92
    move v6, v7

    .line 93
    goto :goto_2

    .line 94
    :cond_2
    add-int/lit8 v6, v7, 0x1

    .line 95
    .line 96
    new-array v6, v6, [Ljava/math/BigInteger;

    .line 97
    .line 98
    new-instance v8, Ljava/math/BigInteger;

    .line 99
    .line 100
    const-string v9, "8003"

    .line 101
    .line 102
    const/16 v10, 0x10

    .line 103
    .line 104
    invoke-direct {v8, v9, v10}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    aput-object v8, v6, v7

    .line 108
    .line 109
    add-int/lit8 v8, v7, -0x1

    .line 110
    .line 111
    move v9, v1

    .line 112
    :goto_3
    if-ge v9, v7, :cond_9

    .line 113
    .line 114
    aget v11, v4, v8

    .line 115
    .line 116
    div-int/2addr v11, v10

    .line 117
    :goto_4
    array-length v12, v3

    .line 118
    new-array v13, v12, [Ljava/math/BigInteger;

    .line 119
    .line 120
    array-length v14, v3

    .line 121
    invoke-static {v3, v1, v13, v1, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 122
    .line 123
    .line 124
    add-int/lit8 v3, v11, 0x1

    .line 125
    .line 126
    new-array v14, v3, [Ljava/math/BigInteger;

    .line 127
    .line 128
    invoke-static {v13, v1, v14, v1, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 129
    .line 130
    .line 131
    move v3, v1

    .line 132
    :goto_5
    if-ge v3, v11, :cond_3

    .line 133
    .line 134
    add-int/lit8 v12, v3, 0x1

    .line 135
    .line 136
    aget-object v3, v14, v3

    .line 137
    .line 138
    invoke-virtual {v3, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    sget-object v13, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 147
    .line 148
    invoke-virtual {v13, v10}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 149
    .line 150
    .line 151
    move-result-object v13

    .line 152
    invoke-virtual {v3, v13}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    aput-object v3, v14, v12

    .line 157
    .line 158
    move v3, v12

    .line 159
    goto :goto_5

    .line 160
    :cond_3
    new-instance v3, Ljava/math/BigInteger;

    .line 161
    .line 162
    const-string v12, "0"

    .line 163
    .line 164
    invoke-direct {v3, v12}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    move v12, v1

    .line 168
    :goto_6
    if-ge v12, v11, :cond_4

    .line 169
    .line 170
    aget-object v13, v14, v12

    .line 171
    .line 172
    sget-object v15, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 173
    .line 174
    move/from16 p0, v1

    .line 175
    .line 176
    mul-int/lit8 v1, v12, 0x10

    .line 177
    .line 178
    invoke-virtual {v15, v1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v13, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    add-int/lit8 v12, v12, 0x1

    .line 191
    .line 192
    move/from16 v1, p0

    .line 193
    .line 194
    goto :goto_6

    .line 195
    :cond_4
    move/from16 p0, v1

    .line 196
    .line 197
    aget-object v1, v14, v11

    .line 198
    .line 199
    aput-object v1, v14, p0

    .line 200
    .line 201
    sget-object v1, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 202
    .line 203
    aget v12, v4, v8

    .line 204
    .line 205
    sub-int/2addr v12, v5

    .line 206
    invoke-virtual {v1, v12}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 207
    .line 208
    .line 209
    move-result-object v12

    .line 210
    add-int/lit8 v13, v8, 0x1

    .line 211
    .line 212
    aget-object v15, v6, v13

    .line 213
    .line 214
    invoke-virtual {v12, v15}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 215
    .line 216
    .line 217
    move-result-object v12

    .line 218
    aget v15, v4, v8

    .line 219
    .line 220
    sub-int/2addr v15, v5

    .line 221
    invoke-virtual {v1, v15}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 222
    .line 223
    .line 224
    move-result-object v15

    .line 225
    invoke-virtual {v15, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    aget-object v15, v6, v13

    .line 230
    .line 231
    mul-int/lit8 v10, v11, 0x10

    .line 232
    .line 233
    invoke-virtual {v1, v10}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 234
    .line 235
    .line 236
    move-result-object v10

    .line 237
    invoke-virtual {v15, v10}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 238
    .line 239
    .line 240
    move-result-object v10

    .line 241
    invoke-virtual {v3, v10}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    invoke-virtual {v12, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    sget-object v10, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 254
    .line 255
    invoke-virtual {v1, v10}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-nez v1, :cond_5

    .line 260
    .line 261
    invoke-virtual {v3, v10}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    :cond_5
    move-object v1, v3

    .line 266
    move/from16 v3, p0

    .line 267
    .line 268
    :goto_7
    aget-object v10, v6, v13

    .line 269
    .line 270
    move-object v12, v6

    .line 271
    int-to-long v5, v3

    .line 272
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 273
    .line 274
    .line 275
    move-result-object v15

    .line 276
    invoke-virtual {v1, v15}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 277
    .line 278
    .line 279
    move-result-object v15

    .line 280
    invoke-virtual {v10, v15}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 281
    .line 282
    .line 283
    move-result-object v10

    .line 284
    sget-object v15, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 285
    .line 286
    invoke-virtual {v10, v15}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 287
    .line 288
    .line 289
    move-result-object v10

    .line 290
    aput-object v10, v12, v8

    .line 291
    .line 292
    move-object/from16 v16, v0

    .line 293
    .line 294
    sget-object v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 295
    .line 296
    move-object/from16 v17, v2

    .line 297
    .line 298
    aget v2, v4, v8

    .line 299
    .line 300
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 301
    .line 302
    .line 303
    move-result-object v2

    .line 304
    invoke-virtual {v10, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 305
    .line 306
    .line 307
    move-result v2

    .line 308
    const/4 v10, 0x1

    .line 309
    if-ne v2, v10, :cond_6

    .line 310
    .line 311
    move/from16 v1, p0

    .line 312
    .line 313
    move v5, v10

    .line 314
    move-object v6, v12

    .line 315
    move-object v3, v14

    .line 316
    move-object/from16 v0, v16

    .line 317
    .line 318
    move-object/from16 v2, v17

    .line 319
    .line 320
    const/16 v10, 0x10

    .line 321
    .line 322
    goto/16 :goto_4

    .line 323
    .line 324
    :cond_6
    aget-object v2, v12, v13

    .line 325
    .line 326
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 327
    .line 328
    .line 329
    move-result-object v10

    .line 330
    invoke-virtual {v1, v10}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 331
    .line 332
    .line 333
    move-result-object v10

    .line 334
    invoke-virtual {v2, v10}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    aget-object v10, v12, v8

    .line 339
    .line 340
    invoke-virtual {v0, v2, v10}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    invoke-virtual {v2, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 345
    .line 346
    .line 347
    move-result v2

    .line 348
    if-nez v2, :cond_8

    .line 349
    .line 350
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    aget-object v5, v12, v8

    .line 359
    .line 360
    invoke-virtual {v0, v2, v5}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    if-eqz v0, :cond_8

    .line 369
    .line 370
    add-int/lit8 v8, v8, -0x1

    .line 371
    .line 372
    if-ltz v8, :cond_7

    .line 373
    .line 374
    add-int/lit8 v9, v9, 0x1

    .line 375
    .line 376
    const/4 v5, 0x1

    .line 377
    const/16 v10, 0x10

    .line 378
    .line 379
    move/from16 v1, p0

    .line 380
    .line 381
    move-object v6, v12

    .line 382
    move-object v3, v14

    .line 383
    move-object/from16 v0, v16

    .line 384
    .line 385
    move-object/from16 v2, v17

    .line 386
    .line 387
    goto/16 :goto_3

    .line 388
    .line 389
    :cond_7
    aget-object v0, v12, p0

    .line 390
    .line 391
    aput-object v0, p3, p0

    .line 392
    .line 393
    const/4 v10, 0x1

    .line 394
    aget-object v0, v12, v10

    .line 395
    .line 396
    aput-object v0, p3, v10

    .line 397
    .line 398
    aget-object v0, v14, p0

    .line 399
    .line 400
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    return v0

    .line 405
    :cond_8
    add-int/lit8 v3, v3, 0x2

    .line 406
    .line 407
    move-object v6, v12

    .line 408
    move-object/from16 v0, v16

    .line 409
    .line 410
    move-object/from16 v2, v17

    .line 411
    .line 412
    const/4 v5, 0x1

    .line 413
    goto/16 :goto_7

    .line 414
    .line 415
    :cond_9
    move/from16 p0, v1

    .line 416
    .line 417
    aget-object v0, v3, p0

    .line 418
    .line 419
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    return v0

    .line 424
    :cond_a
    :goto_8
    iget-object v4, v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 425
    .line 426
    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    .line 427
    .line 428
    .line 429
    move-result v4

    .line 430
    div-int/2addr v4, v2

    .line 431
    const/4 v10, 0x1

    .line 432
    add-int/2addr v4, v10

    .line 433
    goto/16 :goto_1

    .line 434
    .line 435
    :cond_b
    :goto_9
    iget-object v1, v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 436
    .line 437
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 438
    .line 439
    .line 440
    move-result v1

    .line 441
    div-int/2addr v1, v2

    .line 442
    goto/16 :goto_0
.end method

.method private procedure_Aa(JJ[Ljava/math/BigInteger;I)J
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    :goto_0
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v5, v1, v3

    .line 8
    .line 9
    if-ltz v5, :cond_b

    .line 10
    .line 11
    const-wide v5, 0x100000000L

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    cmp-long v7, v1, v5

    .line 17
    .line 18
    if-lez v7, :cond_0

    .line 19
    .line 20
    goto/16 :goto_9

    .line 21
    .line 22
    :cond_0
    move-wide/from16 v7, p3

    .line 23
    .line 24
    :goto_1
    cmp-long v9, v7, v3

    .line 25
    .line 26
    const/4 v10, 0x1

    .line 27
    if-ltz v9, :cond_a

    .line 28
    .line 29
    cmp-long v9, v7, v5

    .line 30
    .line 31
    if-gtz v9, :cond_a

    .line 32
    .line 33
    const-wide/16 v11, 0x2

    .line 34
    .line 35
    div-long v11, v7, v11

    .line 36
    .line 37
    cmp-long v9, v11, v3

    .line 38
    .line 39
    if-nez v9, :cond_1

    .line 40
    .line 41
    goto/16 :goto_8

    .line 42
    .line 43
    :cond_1
    new-instance v0, Ljava/math/BigInteger;

    .line 44
    .line 45
    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-direct {v0, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Ljava/math/BigInteger;

    .line 53
    .line 54
    const-string v4, "97781173"

    .line 55
    .line 56
    invoke-direct {v3, v4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-array v4, v10, [Ljava/math/BigInteger;

    .line 60
    .line 61
    new-instance v5, Ljava/math/BigInteger;

    .line 62
    .line 63
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-direct {v5, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    aput-object v5, v4, v1

    .line 72
    .line 73
    new-array v2, v10, [I

    .line 74
    .line 75
    aput p6, v2, v1

    .line 76
    .line 77
    move v5, v1

    .line 78
    move v6, v5

    .line 79
    :goto_2
    aget v7, v2, v5

    .line 80
    .line 81
    const/16 v8, 0x21

    .line 82
    .line 83
    if-lt v7, v8, :cond_2

    .line 84
    .line 85
    array-length v6, v2

    .line 86
    add-int/2addr v6, v10

    .line 87
    new-array v7, v6, [I

    .line 88
    .line 89
    array-length v8, v2

    .line 90
    invoke-static {v2, v1, v7, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    .line 92
    .line 93
    new-array v2, v6, [I

    .line 94
    .line 95
    invoke-static {v7, v1, v2, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 96
    .line 97
    .line 98
    add-int/lit8 v6, v5, 0x1

    .line 99
    .line 100
    aget v5, v2, v5

    .line 101
    .line 102
    div-int/lit8 v5, v5, 0x2

    .line 103
    .line 104
    aput v5, v2, v6

    .line 105
    .line 106
    move v5, v6

    .line 107
    goto :goto_2

    .line 108
    :cond_2
    add-int/lit8 v5, v6, 0x1

    .line 109
    .line 110
    new-array v5, v5, [Ljava/math/BigInteger;

    .line 111
    .line 112
    new-instance v7, Ljava/math/BigInteger;

    .line 113
    .line 114
    const-string v8, "8000000B"

    .line 115
    .line 116
    const/16 v9, 0x10

    .line 117
    .line 118
    invoke-direct {v7, v8, v9}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    aput-object v7, v5, v6

    .line 122
    .line 123
    add-int/lit8 v7, v6, -0x1

    .line 124
    .line 125
    move v8, v1

    .line 126
    :goto_3
    if-ge v8, v6, :cond_9

    .line 127
    .line 128
    aget v9, v2, v7

    .line 129
    .line 130
    const/16 v11, 0x20

    .line 131
    .line 132
    div-int/2addr v9, v11

    .line 133
    :goto_4
    array-length v12, v4

    .line 134
    new-array v13, v12, [Ljava/math/BigInteger;

    .line 135
    .line 136
    array-length v14, v4

    .line 137
    invoke-static {v4, v1, v13, v1, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    .line 139
    .line 140
    add-int/lit8 v4, v9, 0x1

    .line 141
    .line 142
    new-array v14, v4, [Ljava/math/BigInteger;

    .line 143
    .line 144
    invoke-static {v13, v1, v14, v1, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    .line 146
    .line 147
    move v4, v1

    .line 148
    :goto_5
    if-ge v4, v9, :cond_3

    .line 149
    .line 150
    add-int/lit8 v12, v4, 0x1

    .line 151
    .line 152
    aget-object v4, v14, v4

    .line 153
    .line 154
    invoke-virtual {v4, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    sget-object v13, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 163
    .line 164
    invoke-virtual {v13, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 165
    .line 166
    .line 167
    move-result-object v13

    .line 168
    invoke-virtual {v4, v13}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    aput-object v4, v14, v12

    .line 173
    .line 174
    move v4, v12

    .line 175
    goto :goto_5

    .line 176
    :cond_3
    new-instance v4, Ljava/math/BigInteger;

    .line 177
    .line 178
    const-string v12, "0"

    .line 179
    .line 180
    invoke-direct {v4, v12}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    move v12, v1

    .line 184
    :goto_6
    if-ge v12, v9, :cond_4

    .line 185
    .line 186
    aget-object v13, v14, v12

    .line 187
    .line 188
    sget-object v15, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 189
    .line 190
    move/from16 p0, v1

    .line 191
    .line 192
    mul-int/lit8 v1, v12, 0x20

    .line 193
    .line 194
    invoke-virtual {v15, v1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v13, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    add-int/lit8 v12, v12, 0x1

    .line 207
    .line 208
    move/from16 v1, p0

    .line 209
    .line 210
    goto :goto_6

    .line 211
    :cond_4
    move/from16 p0, v1

    .line 212
    .line 213
    aget-object v1, v14, v9

    .line 214
    .line 215
    aput-object v1, v14, p0

    .line 216
    .line 217
    sget-object v1, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 218
    .line 219
    aget v12, v2, v7

    .line 220
    .line 221
    sub-int/2addr v12, v10

    .line 222
    invoke-virtual {v1, v12}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 223
    .line 224
    .line 225
    move-result-object v12

    .line 226
    add-int/lit8 v13, v7, 0x1

    .line 227
    .line 228
    aget-object v15, v5, v13

    .line 229
    .line 230
    invoke-virtual {v12, v15}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 231
    .line 232
    .line 233
    move-result-object v12

    .line 234
    aget v15, v2, v7

    .line 235
    .line 236
    sub-int/2addr v15, v10

    .line 237
    invoke-virtual {v1, v15}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 238
    .line 239
    .line 240
    move-result-object v15

    .line 241
    invoke-virtual {v15, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    aget-object v15, v5, v13

    .line 246
    .line 247
    mul-int/lit8 v11, v9, 0x20

    .line 248
    .line 249
    invoke-virtual {v1, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 250
    .line 251
    .line 252
    move-result-object v11

    .line 253
    invoke-virtual {v15, v11}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 254
    .line 255
    .line 256
    move-result-object v11

    .line 257
    invoke-virtual {v4, v11}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    invoke-virtual {v12, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    invoke-virtual {v4, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    sget-object v11, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 270
    .line 271
    invoke-virtual {v1, v11}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    if-nez v1, :cond_5

    .line 276
    .line 277
    invoke-virtual {v4, v11}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 278
    .line 279
    .line 280
    move-result-object v4

    .line 281
    :cond_5
    move-object v1, v4

    .line 282
    move/from16 v4, p0

    .line 283
    .line 284
    :goto_7
    aget-object v11, v5, v13

    .line 285
    .line 286
    move-object/from16 p3, v11

    .line 287
    .line 288
    int-to-long v10, v4

    .line 289
    invoke-static {v10, v11}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 290
    .line 291
    .line 292
    move-result-object v12

    .line 293
    invoke-virtual {v1, v12}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 294
    .line 295
    .line 296
    move-result-object v12

    .line 297
    move-object/from16 v15, p3

    .line 298
    .line 299
    invoke-virtual {v15, v12}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 300
    .line 301
    .line 302
    move-result-object v12

    .line 303
    sget-object v15, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 304
    .line 305
    invoke-virtual {v12, v15}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 306
    .line 307
    .line 308
    move-result-object v12

    .line 309
    aput-object v12, v5, v7

    .line 310
    .line 311
    move-object/from16 p3, v0

    .line 312
    .line 313
    sget-object v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 314
    .line 315
    move-object/from16 p4, v2

    .line 316
    .line 317
    aget v2, p4, v7

    .line 318
    .line 319
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    invoke-virtual {v12, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    const/4 v12, 0x1

    .line 328
    if-ne v2, v12, :cond_6

    .line 329
    .line 330
    move/from16 v1, p0

    .line 331
    .line 332
    move-object/from16 v0, p3

    .line 333
    .line 334
    move-object/from16 v2, p4

    .line 335
    .line 336
    move v10, v12

    .line 337
    move-object v4, v14

    .line 338
    const/16 v11, 0x20

    .line 339
    .line 340
    goto/16 :goto_4

    .line 341
    .line 342
    :cond_6
    aget-object v2, v5, v13

    .line 343
    .line 344
    invoke-static {v10, v11}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 345
    .line 346
    .line 347
    move-result-object v12

    .line 348
    invoke-virtual {v1, v12}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 349
    .line 350
    .line 351
    move-result-object v12

    .line 352
    invoke-virtual {v2, v12}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    aget-object v12, v5, v7

    .line 357
    .line 358
    invoke-virtual {v0, v2, v12}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-virtual {v2, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    if-nez v2, :cond_8

    .line 367
    .line 368
    invoke-static {v10, v11}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 369
    .line 370
    .line 371
    move-result-object v2

    .line 372
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    aget-object v10, v5, v7

    .line 377
    .line 378
    invoke-virtual {v0, v2, v10}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-virtual {v0, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    if-eqz v0, :cond_8

    .line 387
    .line 388
    add-int/lit8 v7, v7, -0x1

    .line 389
    .line 390
    if-ltz v7, :cond_7

    .line 391
    .line 392
    add-int/lit8 v8, v8, 0x1

    .line 393
    .line 394
    const/4 v10, 0x1

    .line 395
    move/from16 v1, p0

    .line 396
    .line 397
    move-object/from16 v0, p3

    .line 398
    .line 399
    move-object/from16 v2, p4

    .line 400
    .line 401
    move-object v4, v14

    .line 402
    goto/16 :goto_3

    .line 403
    .line 404
    :cond_7
    aget-object v0, v5, p0

    .line 405
    .line 406
    aput-object v0, p5, p0

    .line 407
    .line 408
    const/4 v12, 0x1

    .line 409
    aget-object v0, v5, v12

    .line 410
    .line 411
    aput-object v0, p5, v12

    .line 412
    .line 413
    aget-object v0, v14, p0

    .line 414
    .line 415
    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    .line 416
    .line 417
    .line 418
    move-result-wide v0

    .line 419
    return-wide v0

    .line 420
    :cond_8
    add-int/lit8 v4, v4, 0x2

    .line 421
    .line 422
    move-object/from16 v0, p3

    .line 423
    .line 424
    move-object/from16 v2, p4

    .line 425
    .line 426
    const/4 v10, 0x1

    .line 427
    goto/16 :goto_7

    .line 428
    .line 429
    :cond_9
    move/from16 p0, v1

    .line 430
    .line 431
    aget-object v0, v4, p0

    .line 432
    .line 433
    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    .line 434
    .line 435
    .line 436
    move-result-wide v0

    .line 437
    return-wide v0

    .line 438
    :cond_a
    :goto_8
    iget-object v7, v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 439
    .line 440
    invoke-virtual {v7}, Ljava/util/Random;->nextInt()I

    .line 441
    .line 442
    .line 443
    move-result v7

    .line 444
    mul-int/lit8 v7, v7, 0x2

    .line 445
    .line 446
    const/4 v12, 0x1

    .line 447
    add-int/2addr v7, v12

    .line 448
    int-to-long v7, v7

    .line 449
    goto/16 :goto_1

    .line 450
    .line 451
    :cond_b
    :goto_9
    iget-object v1, v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 452
    .line 453
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 454
    .line 455
    .line 456
    move-result v1

    .line 457
    mul-int/lit8 v1, v1, 0x2

    .line 458
    .line 459
    int-to-long v1, v1

    .line 460
    goto/16 :goto_0
.end method

.method private procedure_B(II[Ljava/math/BigInteger;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    :goto_0
    const v2, 0x8000

    .line 6
    .line 7
    .line 8
    if-ltz v1, :cond_8

    .line 9
    .line 10
    const/high16 v3, 0x10000

    .line 11
    .line 12
    if-le v1, v3, :cond_0

    .line 13
    .line 14
    goto/16 :goto_7

    .line 15
    .line 16
    :cond_0
    move/from16 v4, p2

    .line 17
    .line 18
    :goto_1
    const/4 v5, 0x1

    .line 19
    if-ltz v4, :cond_1

    .line 20
    .line 21
    if-gt v4, v3, :cond_1

    .line 22
    .line 23
    div-int/lit8 v6, v4, 0x2

    .line 24
    .line 25
    if-nez v6, :cond_2

    .line 26
    .line 27
    :cond_1
    move/from16 p1, v5

    .line 28
    .line 29
    goto/16 :goto_6

    .line 30
    .line 31
    :cond_2
    const/4 v2, 0x2

    .line 32
    new-array v2, v2, [Ljava/math/BigInteger;

    .line 33
    .line 34
    new-instance v6, Ljava/math/BigInteger;

    .line 35
    .line 36
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {v6, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance v7, Ljava/math/BigInteger;

    .line 44
    .line 45
    const-string v3, "19381"

    .line 46
    .line 47
    invoke-direct {v7, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/16 v3, 0x100

    .line 51
    .line 52
    invoke-direct {v0, v1, v4, v2, v3}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_A(II[Ljava/math/BigInteger;I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v8, 0x0

    .line 57
    aget-object v9, v2, v8

    .line 58
    .line 59
    const/16 v3, 0x200

    .line 60
    .line 61
    invoke-direct {v0, v1, v4, v2, v3}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_A(II[Ljava/math/BigInteger;I)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    aget-object v4, v2, v8

    .line 66
    .line 67
    const/16 v1, 0x41

    .line 68
    .line 69
    new-array v10, v1, [Ljava/math/BigInteger;

    .line 70
    .line 71
    new-instance v1, Ljava/math/BigInteger;

    .line 72
    .line 73
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    aput-object v1, v10, v8

    .line 81
    .line 82
    :goto_2
    move v0, v8

    .line 83
    :goto_3
    const/16 v1, 0x40

    .line 84
    .line 85
    if-ge v0, v1, :cond_3

    .line 86
    .line 87
    add-int/lit8 v1, v0, 0x1

    .line 88
    .line 89
    aget-object v0, v10, v0

    .line 90
    .line 91
    invoke-virtual {v0, v7}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget-object v2, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 100
    .line 101
    const/16 v3, 0x10

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    aput-object v0, v10, v1

    .line 112
    .line 113
    move v0, v1

    .line 114
    goto :goto_3

    .line 115
    :cond_3
    new-instance v0, Ljava/math/BigInteger;

    .line 116
    .line 117
    const-string v2, "0"

    .line 118
    .line 119
    invoke-direct {v0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    move v2, v8

    .line 123
    :goto_4
    if-ge v2, v1, :cond_4

    .line 124
    .line 125
    aget-object v3, v10, v2

    .line 126
    .line 127
    sget-object v11, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 128
    .line 129
    mul-int/lit8 v12, v2, 0x10

    .line 130
    .line 131
    invoke-virtual {v11, v12}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 132
    .line 133
    .line 134
    move-result-object v11

    .line 135
    invoke-virtual {v3, v11}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    add-int/lit8 v2, v2, 0x1

    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_4
    aget-object v1, v10, v1

    .line 147
    .line 148
    aput-object v1, v10, v8

    .line 149
    .line 150
    sget-object v1, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 151
    .line 152
    const/16 v2, 0x3ff

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v9, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 159
    .line 160
    .line 161
    move-result-object v11

    .line 162
    invoke-virtual {v3, v11}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v9, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    const/16 v11, 0x400

    .line 179
    .line 180
    invoke-virtual {v1, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 181
    .line 182
    .line 183
    move-result-object v12

    .line 184
    invoke-virtual {v2, v12}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    sget-object v2, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 201
    .line 202
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-nez v1, :cond_5

    .line 207
    .line 208
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    :cond_5
    move-object v12, v0

    .line 213
    move v0, v8

    .line 214
    :goto_5
    invoke-virtual {v9, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    int-to-long v2, v0

    .line 219
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 220
    .line 221
    .line 222
    move-result-object v13

    .line 223
    invoke-virtual {v12, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 224
    .line 225
    .line 226
    move-result-object v13

    .line 227
    invoke-virtual {v1, v13}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    sget-object v13, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 232
    .line 233
    invoke-virtual {v1, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    sget-object v14, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 238
    .line 239
    invoke-virtual {v14, v11}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 240
    .line 241
    .line 242
    move-result-object v15

    .line 243
    invoke-virtual {v1, v15}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 244
    .line 245
    .line 246
    move-result v15

    .line 247
    if-ne v15, v5, :cond_6

    .line 248
    .line 249
    goto/16 :goto_2

    .line 250
    .line 251
    :cond_6
    invoke-virtual {v9, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 252
    .line 253
    .line 254
    move-result-object v15

    .line 255
    move/from16 p1, v5

    .line 256
    .line 257
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    invoke-virtual {v12, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 262
    .line 263
    .line 264
    move-result-object v5

    .line 265
    invoke-virtual {v15, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 266
    .line 267
    .line 268
    move-result-object v5

    .line 269
    invoke-virtual {v14, v5, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    invoke-virtual {v5, v13}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    if-nez v5, :cond_7

    .line 278
    .line 279
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    invoke-virtual {v12, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v9, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    invoke-virtual {v14, v2, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-virtual {v2, v13}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 296
    .line 297
    .line 298
    move-result v2

    .line 299
    if-eqz v2, :cond_7

    .line 300
    .line 301
    aput-object v1, p3, v8

    .line 302
    .line 303
    aput-object v9, p3, p1

    .line 304
    .line 305
    return-void

    .line 306
    :cond_7
    add-int/lit8 v0, v0, 0x2

    .line 307
    .line 308
    move/from16 v5, p1

    .line 309
    .line 310
    goto :goto_5

    .line 311
    :goto_6
    iget-object v4, v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 312
    .line 313
    invoke-virtual {v4}, Ljava/util/Random;->nextInt()I

    .line 314
    .line 315
    .line 316
    move-result v4

    .line 317
    div-int/2addr v4, v2

    .line 318
    add-int/lit8 v4, v4, 0x1

    .line 319
    .line 320
    goto/16 :goto_1

    .line 321
    .line 322
    :cond_8
    :goto_7
    iget-object v1, v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 323
    .line 324
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    div-int/2addr v1, v2

    .line 329
    goto/16 :goto_0
.end method

.method private procedure_Bb(JJ[Ljava/math/BigInteger;)V
    .locals 18

    .line 1
    move-wide/from16 v1, p1

    .line 2
    .line 3
    :goto_0
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    const/4 v5, 0x2

    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    const-wide v6, 0x100000000L

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    cmp-long v0, v1, v6

    .line 16
    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    move-object/from16 v1, p0

    .line 20
    .line 21
    goto/16 :goto_7

    .line 22
    .line 23
    :cond_1
    move-wide v8, v3

    .line 24
    move-wide/from16 v3, p3

    .line 25
    .line 26
    :goto_1
    cmp-long v0, v3, v8

    .line 27
    .line 28
    const/4 v10, 0x1

    .line 29
    if-ltz v0, :cond_2

    .line 30
    .line 31
    cmp-long v0, v3, v6

    .line 32
    .line 33
    if-gtz v0, :cond_2

    .line 34
    .line 35
    const-wide/16 v11, 0x2

    .line 36
    .line 37
    div-long v11, v3, v11

    .line 38
    .line 39
    cmp-long v0, v11, v8

    .line 40
    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    :cond_2
    move-wide/from16 v16, v1

    .line 44
    .line 45
    move/from16 p1, v10

    .line 46
    .line 47
    move-object/from16 v1, p0

    .line 48
    .line 49
    goto/16 :goto_6

    .line 50
    .line 51
    :cond_3
    new-array v5, v5, [Ljava/math/BigInteger;

    .line 52
    .line 53
    new-instance v11, Ljava/math/BigInteger;

    .line 54
    .line 55
    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {v11, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance v12, Ljava/math/BigInteger;

    .line 63
    .line 64
    const-string v0, "97781173"

    .line 65
    .line 66
    invoke-direct {v12, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const/16 v6, 0x100

    .line 70
    .line 71
    move-object/from16 v0, p0

    .line 72
    .line 73
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_Aa(JJ[Ljava/math/BigInteger;I)J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    const/4 v13, 0x0

    .line 78
    aget-object v14, v5, v13

    .line 79
    .line 80
    const/16 v6, 0x200

    .line 81
    .line 82
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_Aa(JJ[Ljava/math/BigInteger;I)J

    .line 83
    .line 84
    .line 85
    move-result-wide v0

    .line 86
    aget-object v2, v5, v13

    .line 87
    .line 88
    const/16 v3, 0x21

    .line 89
    .line 90
    new-array v3, v3, [Ljava/math/BigInteger;

    .line 91
    .line 92
    new-instance v4, Ljava/math/BigInteger;

    .line 93
    .line 94
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-direct {v4, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    aput-object v4, v3, v13

    .line 102
    .line 103
    :goto_2
    move v0, v13

    .line 104
    :goto_3
    const/16 v1, 0x20

    .line 105
    .line 106
    if-ge v0, v1, :cond_4

    .line 107
    .line 108
    add-int/lit8 v4, v0, 0x1

    .line 109
    .line 110
    aget-object v0, v3, v0

    .line 111
    .line 112
    invoke-virtual {v0, v12}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0, v11}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sget-object v5, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 121
    .line 122
    invoke-virtual {v5, v1}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    aput-object v0, v3, v4

    .line 131
    .line 132
    move v0, v4

    .line 133
    goto :goto_3

    .line 134
    :cond_4
    new-instance v0, Ljava/math/BigInteger;

    .line 135
    .line 136
    const-string v4, "0"

    .line 137
    .line 138
    invoke-direct {v0, v4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    move v4, v13

    .line 142
    :goto_4
    if-ge v4, v1, :cond_5

    .line 143
    .line 144
    aget-object v5, v3, v4

    .line 145
    .line 146
    sget-object v6, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 147
    .line 148
    mul-int/lit8 v7, v4, 0x20

    .line 149
    .line 150
    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    add-int/lit8 v4, v4, 0x1

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_5
    aget-object v1, v3, v1

    .line 166
    .line 167
    aput-object v1, v3, v13

    .line 168
    .line 169
    sget-object v1, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 170
    .line 171
    const/16 v4, 0x3ff

    .line 172
    .line 173
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v14, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-virtual {v5, v6}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    invoke-virtual {v4, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v14, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    const/16 v15, 0x400

    .line 198
    .line 199
    invoke-virtual {v1, v15}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 200
    .line 201
    .line 202
    move-result-object v6

    .line 203
    invoke-virtual {v4, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v5, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    sget-object v4, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 220
    .line 221
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-nez v1, :cond_6

    .line 226
    .line 227
    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    :cond_6
    move v1, v13

    .line 232
    :goto_5
    invoke-virtual {v14, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    int-to-long v5, v1

    .line 237
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    invoke-virtual {v0, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 242
    .line 243
    .line 244
    move-result-object v7

    .line 245
    invoke-virtual {v4, v7}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 246
    .line 247
    .line 248
    move-result-object v4

    .line 249
    sget-object v7, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 250
    .line 251
    invoke-virtual {v4, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 252
    .line 253
    .line 254
    move-result-object v4

    .line 255
    sget-object v8, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 256
    .line 257
    invoke-virtual {v8, v15}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 258
    .line 259
    .line 260
    move-result-object v9

    .line 261
    invoke-virtual {v4, v9}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 262
    .line 263
    .line 264
    move-result v9

    .line 265
    if-ne v9, v10, :cond_7

    .line 266
    .line 267
    goto/16 :goto_2

    .line 268
    .line 269
    :cond_7
    invoke-virtual {v14, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    move/from16 p1, v10

    .line 274
    .line 275
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 276
    .line 277
    .line 278
    move-result-object v10

    .line 279
    invoke-virtual {v0, v10}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 280
    .line 281
    .line 282
    move-result-object v10

    .line 283
    invoke-virtual {v9, v10}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 284
    .line 285
    .line 286
    move-result-object v9

    .line 287
    invoke-virtual {v8, v9, v4}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 288
    .line 289
    .line 290
    move-result-object v9

    .line 291
    invoke-virtual {v9, v7}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 292
    .line 293
    .line 294
    move-result v9

    .line 295
    if-nez v9, :cond_8

    .line 296
    .line 297
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 298
    .line 299
    .line 300
    move-result-object v5

    .line 301
    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 302
    .line 303
    .line 304
    move-result-object v5

    .line 305
    invoke-virtual {v14, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    invoke-virtual {v8, v5, v4}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 310
    .line 311
    .line 312
    move-result-object v5

    .line 313
    invoke-virtual {v5, v7}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    if-eqz v5, :cond_8

    .line 318
    .line 319
    aput-object v4, p5, v13

    .line 320
    .line 321
    aput-object v14, p5, p1

    .line 322
    .line 323
    return-void

    .line 324
    :cond_8
    add-int/lit8 v1, v1, 0x2

    .line 325
    .line 326
    move/from16 v10, p1

    .line 327
    .line 328
    goto :goto_5

    .line 329
    :goto_6
    iget-object v0, v1, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 330
    .line 331
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    mul-int/2addr v0, v5

    .line 336
    add-int/lit8 v0, v0, 0x1

    .line 337
    .line 338
    int-to-long v3, v0

    .line 339
    move-wide/from16 v1, v16

    .line 340
    .line 341
    goto/16 :goto_1

    .line 342
    .line 343
    :goto_7
    iget-object v0, v1, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 344
    .line 345
    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    .line 346
    .line 347
    .line 348
    move-result v0

    .line 349
    mul-int/2addr v0, v5

    .line 350
    int-to-long v2, v0

    .line 351
    move-wide v1, v2

    .line 352
    goto/16 :goto_0
.end method

.method private procedure_C(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .locals 5

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    :cond_0
    new-instance v2, Ljava/math/BigInteger;

    .line 16
    .line 17
    iget-object v3, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 18
    .line 19
    invoke-direct {v2, v1, v3}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    .line 20
    .line 21
    .line 22
    sget-object v3, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-lez v4, :cond_0

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-gez v4, :cond_0

    .line 35
    .line 36
    invoke-virtual {v2, p2, p1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    return-object v2
.end method


# virtual methods
.method public generateParameters()Lorg/spongycastle/crypto/params/GOST3410Parameters;
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v6, v0, [Ljava/math/BigInteger;

    .line 3
    .line 4
    iget v0, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->typeproc:I

    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 7
    .line 8
    const/4 v8, 0x0

    .line 9
    const-string v7, "Ooops! key size 512 or 1024 bit."

    .line 10
    .line 11
    const/16 v2, 0x400

    .line 12
    .line 13
    const/16 v3, 0x200

    .line 14
    .line 15
    const/4 v9, 0x1

    .line 16
    if-ne v0, v9, :cond_2

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget v4, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->size:I

    .line 29
    .line 30
    if-eq v4, v3, :cond_1

    .line 31
    .line 32
    if-ne v4, v2, :cond_0

    .line 33
    .line 34
    invoke-direct {p0, v0, v1, v6}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_B(II[Ljava/math/BigInteger;)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-static {v7}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    const/4 p0, 0x0

    .line 42
    return-object p0

    .line 43
    :cond_1
    invoke-direct {p0, v0, v1, v6, v3}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_A(II[Ljava/math/BigInteger;I)I

    .line 44
    .line 45
    .line 46
    :goto_1
    aget-object v2, v6, v8

    .line 47
    .line 48
    aget-object v3, v6, v9

    .line 49
    .line 50
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_C(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    new-instance v4, Lorg/spongycastle/crypto/params/GOST3410Parameters;

    .line 55
    .line 56
    new-instance v5, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .line 57
    .line 58
    invoke-direct {v5, v0, v1}, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;-><init>(II)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v4, v2, v3, p0, v5}, Lorg/spongycastle/crypto/params/GOST3410Parameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;)V

    .line 62
    .line 63
    .line 64
    return-object v4

    .line 65
    :cond_2
    invoke-virtual {v1}, Ljava/util/Random;->nextLong()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    iget-object v4, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 70
    .line 71
    invoke-virtual {v4}, Ljava/util/Random;->nextLong()J

    .line 72
    .line 73
    .line 74
    move-result-wide v4

    .line 75
    iget v10, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->size:I

    .line 76
    .line 77
    if-eq v10, v3, :cond_4

    .line 78
    .line 79
    if-ne v10, v2, :cond_3

    .line 80
    .line 81
    move-wide v2, v0

    .line 82
    move-object v1, p0

    .line 83
    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_Bb(JJ[Ljava/math/BigInteger;)V

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_3
    invoke-static {v7}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    move-wide v2, v0

    .line 92
    move-object v1, p0

    .line 93
    const/16 v7, 0x200

    .line 94
    .line 95
    invoke-direct/range {v1 .. v7}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_Aa(JJ[Ljava/math/BigInteger;I)J

    .line 96
    .line 97
    .line 98
    :goto_2
    aget-object p0, v6, v8

    .line 99
    .line 100
    aget-object v0, v6, v9

    .line 101
    .line 102
    invoke-direct {v1, p0, v0}, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->procedure_C(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    new-instance v6, Lorg/spongycastle/crypto/params/GOST3410Parameters;

    .line 107
    .line 108
    new-instance v7, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;

    .line 109
    .line 110
    invoke-direct {v7, v2, v3, v4, v5}, Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;-><init>(JJ)V

    .line 111
    .line 112
    .line 113
    invoke-direct {v6, p0, v0, v1, v7}, Lorg/spongycastle/crypto/params/GOST3410Parameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/GOST3410ValidationParameters;)V

    .line 114
    .line 115
    .line 116
    return-object v6
.end method

.method public init(IILjava/security/SecureRandom;)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->size:I

    .line 2
    .line 3
    iput p2, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->typeproc:I

    .line 4
    .line 5
    iput-object p3, p0, Lorg/spongycastle/crypto/generators/GOST3410ParametersGenerator;->init_random:Ljava/security/SecureRandom;

    .line 6
    .line 7
    return-void
.end method

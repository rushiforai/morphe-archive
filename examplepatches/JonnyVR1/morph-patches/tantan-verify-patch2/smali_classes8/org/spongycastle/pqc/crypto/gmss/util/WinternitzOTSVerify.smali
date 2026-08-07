.class public Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private messDigestOTS:Lorg/spongycastle/crypto/Digest;

.field private w:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 5
    .line 6
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Verify([B[B)[B
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 8
    .line 9
    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    new-array v4, v3, [B

    .line 14
    .line 15
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 16
    .line 17
    array-length v5, v1

    .line 18
    const/4 v6, 0x0

    .line 19
    invoke-interface {v4, v1, v6, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 23
    .line 24
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    new-array v4, v1, [B

    .line 29
    .line 30
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 31
    .line 32
    invoke-interface {v5, v4, v6}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 33
    .line 34
    .line 35
    shl-int/lit8 v5, v3, 0x3

    .line 36
    .line 37
    iget v7, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 38
    .line 39
    add-int/lit8 v8, v7, -0x1

    .line 40
    .line 41
    add-int/2addr v8, v5

    .line 42
    div-int/2addr v8, v7

    .line 43
    shl-int v7, v8, v7

    .line 44
    .line 45
    const/4 v9, 0x1

    .line 46
    add-int/2addr v7, v9

    .line 47
    invoke-virtual {v0, v7}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getLog(I)I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    iget v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 52
    .line 53
    add-int v11, v7, v10

    .line 54
    .line 55
    sub-int/2addr v11, v9

    .line 56
    div-int/2addr v11, v10

    .line 57
    add-int/2addr v11, v8

    .line 58
    mul-int/2addr v11, v3

    .line 59
    array-length v12, v2

    .line 60
    if-eq v11, v12, :cond_0

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    return-object v0

    .line 64
    :cond_0
    new-array v12, v11, [B

    .line 65
    .line 66
    const/16 v13, 0x8

    .line 67
    .line 68
    rem-int v14, v13, v10

    .line 69
    .line 70
    if-nez v14, :cond_6

    .line 71
    .line 72
    div-int/2addr v13, v10

    .line 73
    shl-int v5, v9, v10

    .line 74
    .line 75
    sub-int/2addr v5, v9

    .line 76
    new-array v9, v3, [B

    .line 77
    .line 78
    move v10, v6

    .line 79
    move v14, v10

    .line 80
    move v15, v14

    .line 81
    :goto_0
    if-ge v10, v1, :cond_3

    .line 82
    .line 83
    :goto_1
    if-ge v6, v13, :cond_2

    .line 84
    .line 85
    aget-byte v16, v4, v10

    .line 86
    .line 87
    and-int v16, v16, v5

    .line 88
    .line 89
    add-int v14, v14, v16

    .line 90
    .line 91
    move/from16 p1, v1

    .line 92
    .line 93
    mul-int v1, v15, v3

    .line 94
    .line 95
    move-object/from16 v17, v4

    .line 96
    .line 97
    const/4 v4, 0x0

    .line 98
    invoke-static {v2, v1, v9, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    .line 100
    .line 101
    move/from16 v4, v16

    .line 102
    .line 103
    :goto_2
    if-ge v4, v5, :cond_1

    .line 104
    .line 105
    move/from16 v16, v4

    .line 106
    .line 107
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 108
    .line 109
    move/from16 v18, v6

    .line 110
    .line 111
    array-length v6, v9

    .line 112
    move/from16 v19, v8

    .line 113
    .line 114
    const/4 v8, 0x0

    .line 115
    invoke-interface {v4, v9, v8, v6}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 116
    .line 117
    .line 118
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 119
    .line 120
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    new-array v9, v4, [B

    .line 125
    .line 126
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 127
    .line 128
    invoke-interface {v4, v9, v8}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 129
    .line 130
    .line 131
    add-int/lit8 v4, v16, 0x1

    .line 132
    .line 133
    move/from16 v6, v18

    .line 134
    .line 135
    move/from16 v8, v19

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_1
    move/from16 v18, v6

    .line 139
    .line 140
    move/from16 v19, v8

    .line 141
    .line 142
    const/4 v8, 0x0

    .line 143
    invoke-static {v9, v8, v12, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 144
    .line 145
    .line 146
    aget-byte v1, v17, v10

    .line 147
    .line 148
    iget v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 149
    .line 150
    ushr-int/2addr v1, v4

    .line 151
    int-to-byte v1, v1

    .line 152
    aput-byte v1, v17, v10

    .line 153
    .line 154
    add-int/lit8 v15, v15, 0x1

    .line 155
    .line 156
    add-int/lit8 v6, v18, 0x1

    .line 157
    .line 158
    move/from16 v1, p1

    .line 159
    .line 160
    move-object/from16 v4, v17

    .line 161
    .line 162
    move/from16 v8, v19

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_2
    move/from16 p1, v1

    .line 166
    .line 167
    move-object/from16 v17, v4

    .line 168
    .line 169
    move/from16 v19, v8

    .line 170
    .line 171
    add-int/lit8 v10, v10, 0x1

    .line 172
    .line 173
    const/4 v6, 0x0

    .line 174
    goto :goto_0

    .line 175
    :cond_3
    move/from16 v19, v8

    .line 176
    .line 177
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 178
    .line 179
    shl-int v1, v19, v1

    .line 180
    .line 181
    sub-int/2addr v1, v14

    .line 182
    const/4 v4, 0x0

    .line 183
    :goto_3
    if-ge v4, v7, :cond_5

    .line 184
    .line 185
    and-int v6, v1, v5

    .line 186
    .line 187
    mul-int v8, v15, v3

    .line 188
    .line 189
    const/4 v10, 0x0

    .line 190
    invoke-static {v2, v8, v9, v10, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 191
    .line 192
    .line 193
    :goto_4
    if-ge v6, v5, :cond_4

    .line 194
    .line 195
    iget-object v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 196
    .line 197
    array-length v14, v9

    .line 198
    invoke-interface {v13, v9, v10, v14}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 199
    .line 200
    .line 201
    iget-object v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 202
    .line 203
    invoke-interface {v9}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 204
    .line 205
    .line 206
    move-result v9

    .line 207
    new-array v9, v9, [B

    .line 208
    .line 209
    iget-object v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 210
    .line 211
    invoke-interface {v13, v9, v10}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 212
    .line 213
    .line 214
    add-int/lit8 v6, v6, 0x1

    .line 215
    .line 216
    goto :goto_4

    .line 217
    :cond_4
    invoke-static {v9, v10, v12, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 218
    .line 219
    .line 220
    iget v6, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 221
    .line 222
    ushr-int/2addr v1, v6

    .line 223
    add-int/lit8 v15, v15, 0x1

    .line 224
    .line 225
    add-int/2addr v4, v6

    .line 226
    goto :goto_3

    .line 227
    :cond_5
    const/4 v1, 0x0

    .line 228
    goto/16 :goto_16

    .line 229
    .line 230
    :cond_6
    move-object/from16 v17, v4

    .line 231
    .line 232
    move/from16 v19, v8

    .line 233
    .line 234
    if-ge v10, v13, :cond_f

    .line 235
    .line 236
    div-int v1, v3, v10

    .line 237
    .line 238
    shl-int v4, v9, v10

    .line 239
    .line 240
    sub-int/2addr v4, v9

    .line 241
    new-array v5, v3, [B

    .line 242
    .line 243
    const/4 v6, 0x0

    .line 244
    const/4 v8, 0x0

    .line 245
    const/4 v10, 0x0

    .line 246
    const/16 v16, 0x0

    .line 247
    .line 248
    :goto_5
    if-ge v6, v1, :cond_a

    .line 249
    .line 250
    move/from16 p1, v9

    .line 251
    .line 252
    const/4 v9, 0x0

    .line 253
    const-wide/16 v20, 0x0

    .line 254
    .line 255
    :goto_6
    iget v14, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 256
    .line 257
    if-ge v9, v14, :cond_7

    .line 258
    .line 259
    aget-byte v14, v17, v8

    .line 260
    .line 261
    and-int/lit16 v14, v14, 0xff

    .line 262
    .line 263
    shl-int/lit8 v15, v9, 0x3

    .line 264
    .line 265
    shl-int/2addr v14, v15

    .line 266
    int-to-long v14, v14

    .line 267
    xor-long v20, v20, v14

    .line 268
    .line 269
    add-int/lit8 v8, v8, 0x1

    .line 270
    .line 271
    add-int/lit8 v9, v9, 0x1

    .line 272
    .line 273
    goto :goto_6

    .line 274
    :cond_7
    const/4 v9, 0x0

    .line 275
    :goto_7
    if-ge v9, v13, :cond_9

    .line 276
    .line 277
    int-to-long v14, v4

    .line 278
    and-long v14, v20, v14

    .line 279
    .line 280
    long-to-int v14, v14

    .line 281
    add-int/2addr v10, v14

    .line 282
    mul-int v15, v16, v3

    .line 283
    .line 284
    move/from16 v18, v13

    .line 285
    .line 286
    const/4 v13, 0x0

    .line 287
    invoke-static {v2, v15, v5, v13, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 288
    .line 289
    .line 290
    :goto_8
    if-ge v14, v4, :cond_8

    .line 291
    .line 292
    move/from16 v22, v1

    .line 293
    .line 294
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 295
    .line 296
    move/from16 v23, v6

    .line 297
    .line 298
    array-length v6, v5

    .line 299
    invoke-interface {v1, v5, v13, v6}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 300
    .line 301
    .line 302
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 303
    .line 304
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 305
    .line 306
    .line 307
    move-result v1

    .line 308
    new-array v5, v1, [B

    .line 309
    .line 310
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 311
    .line 312
    invoke-interface {v1, v5, v13}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 313
    .line 314
    .line 315
    add-int/lit8 v14, v14, 0x1

    .line 316
    .line 317
    move/from16 v1, v22

    .line 318
    .line 319
    move/from16 v6, v23

    .line 320
    .line 321
    goto :goto_8

    .line 322
    :cond_8
    move/from16 v22, v1

    .line 323
    .line 324
    move/from16 v23, v6

    .line 325
    .line 326
    invoke-static {v5, v13, v12, v15, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 327
    .line 328
    .line 329
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 330
    .line 331
    ushr-long v20, v20, v1

    .line 332
    .line 333
    add-int/lit8 v16, v16, 0x1

    .line 334
    .line 335
    add-int/lit8 v9, v9, 0x1

    .line 336
    .line 337
    move/from16 v13, v18

    .line 338
    .line 339
    move/from16 v1, v22

    .line 340
    .line 341
    goto :goto_7

    .line 342
    :cond_9
    move/from16 v22, v1

    .line 343
    .line 344
    move/from16 v23, v6

    .line 345
    .line 346
    move/from16 v18, v13

    .line 347
    .line 348
    add-int/lit8 v6, v23, 0x1

    .line 349
    .line 350
    move/from16 v9, p1

    .line 351
    .line 352
    goto :goto_5

    .line 353
    :cond_a
    move/from16 p1, v9

    .line 354
    .line 355
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 356
    .line 357
    rem-int v1, v3, v1

    .line 358
    .line 359
    const/4 v6, 0x0

    .line 360
    const-wide/16 v14, 0x0

    .line 361
    .line 362
    :goto_9
    if-ge v6, v1, :cond_b

    .line 363
    .line 364
    aget-byte v9, v17, v8

    .line 365
    .line 366
    and-int/lit16 v9, v9, 0xff

    .line 367
    .line 368
    shl-int/lit8 v13, v6, 0x3

    .line 369
    .line 370
    shl-int/2addr v9, v13

    .line 371
    move-object v13, v5

    .line 372
    move/from16 v18, v6

    .line 373
    .line 374
    int-to-long v5, v9

    .line 375
    xor-long/2addr v14, v5

    .line 376
    add-int/lit8 v8, v8, 0x1

    .line 377
    .line 378
    add-int/lit8 v6, v18, 0x1

    .line 379
    .line 380
    move-object v5, v13

    .line 381
    goto :goto_9

    .line 382
    :cond_b
    move-object v13, v5

    .line 383
    shl-int/lit8 v1, v1, 0x3

    .line 384
    .line 385
    const/4 v6, 0x0

    .line 386
    :goto_a
    if-ge v6, v1, :cond_d

    .line 387
    .line 388
    int-to-long v8, v4

    .line 389
    and-long/2addr v8, v14

    .line 390
    long-to-int v8, v8

    .line 391
    add-int/2addr v10, v8

    .line 392
    mul-int v9, v16, v3

    .line 393
    .line 394
    const/4 v13, 0x0

    .line 395
    invoke-static {v2, v9, v5, v13, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 396
    .line 397
    .line 398
    :goto_b
    if-ge v8, v4, :cond_c

    .line 399
    .line 400
    move/from16 p1, v1

    .line 401
    .line 402
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 403
    .line 404
    move/from16 v17, v6

    .line 405
    .line 406
    array-length v6, v5

    .line 407
    invoke-interface {v1, v5, v13, v6}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 408
    .line 409
    .line 410
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 411
    .line 412
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    new-array v5, v1, [B

    .line 417
    .line 418
    iget-object v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 419
    .line 420
    invoke-interface {v1, v5, v13}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 421
    .line 422
    .line 423
    add-int/lit8 v8, v8, 0x1

    .line 424
    .line 425
    move/from16 v1, p1

    .line 426
    .line 427
    move/from16 v6, v17

    .line 428
    .line 429
    goto :goto_b

    .line 430
    :cond_c
    move/from16 p1, v1

    .line 431
    .line 432
    move/from16 v17, v6

    .line 433
    .line 434
    invoke-static {v5, v13, v12, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 435
    .line 436
    .line 437
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 438
    .line 439
    ushr-long/2addr v14, v1

    .line 440
    add-int/lit8 v16, v16, 0x1

    .line 441
    .line 442
    add-int v6, v17, v1

    .line 443
    .line 444
    move/from16 v1, p1

    .line 445
    .line 446
    goto :goto_a

    .line 447
    :cond_d
    iget v1, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 448
    .line 449
    shl-int v1, v19, v1

    .line 450
    .line 451
    sub-int/2addr v1, v10

    .line 452
    const/4 v6, 0x0

    .line 453
    :goto_c
    if-ge v6, v7, :cond_5

    .line 454
    .line 455
    and-int v8, v1, v4

    .line 456
    .line 457
    mul-int v9, v16, v3

    .line 458
    .line 459
    const/4 v13, 0x0

    .line 460
    invoke-static {v2, v9, v5, v13, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 461
    .line 462
    .line 463
    :goto_d
    if-ge v8, v4, :cond_e

    .line 464
    .line 465
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 466
    .line 467
    array-length v14, v5

    .line 468
    invoke-interface {v10, v5, v13, v14}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 469
    .line 470
    .line 471
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 472
    .line 473
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 474
    .line 475
    .line 476
    move-result v5

    .line 477
    new-array v5, v5, [B

    .line 478
    .line 479
    iget-object v10, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 480
    .line 481
    invoke-interface {v10, v5, v13}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 482
    .line 483
    .line 484
    add-int/lit8 v8, v8, 0x1

    .line 485
    .line 486
    goto :goto_d

    .line 487
    :cond_e
    invoke-static {v5, v13, v12, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 488
    .line 489
    .line 490
    iget v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 491
    .line 492
    ushr-int/2addr v1, v8

    .line 493
    add-int/lit8 v16, v16, 0x1

    .line 494
    .line 495
    add-int/2addr v6, v8

    .line 496
    goto :goto_c

    .line 497
    :cond_f
    move/from16 p1, v9

    .line 498
    .line 499
    move/from16 v18, v13

    .line 500
    .line 501
    const/16 v1, 0x39

    .line 502
    .line 503
    if-ge v10, v1, :cond_5

    .line 504
    .line 505
    sub-int/2addr v5, v10

    .line 506
    shl-int v1, p1, v10

    .line 507
    .line 508
    add-int/lit8 v1, v1, -0x1

    .line 509
    .line 510
    new-array v4, v3, [B

    .line 511
    .line 512
    move-object v8, v4

    .line 513
    const/4 v4, 0x0

    .line 514
    const/4 v6, 0x0

    .line 515
    const/4 v9, 0x0

    .line 516
    :goto_e
    if-gt v9, v5, :cond_12

    .line 517
    .line 518
    ushr-int/lit8 v10, v9, 0x3

    .line 519
    .line 520
    rem-int/lit8 v15, v9, 0x8

    .line 521
    .line 522
    const-wide/16 v20, 0x1

    .line 523
    .line 524
    iget v13, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 525
    .line 526
    add-int/2addr v9, v13

    .line 527
    add-int/lit8 v13, v9, 0x7

    .line 528
    .line 529
    ushr-int/lit8 v13, v13, 0x3

    .line 530
    .line 531
    const/4 v14, 0x0

    .line 532
    const-wide/16 v22, 0x0

    .line 533
    .line 534
    :goto_f
    if-ge v10, v13, :cond_10

    .line 535
    .line 536
    move/from16 v16, v5

    .line 537
    .line 538
    aget-byte v5, v17, v10

    .line 539
    .line 540
    and-int/lit16 v5, v5, 0xff

    .line 541
    .line 542
    shl-int/lit8 v24, v14, 0x3

    .line 543
    .line 544
    shl-int v5, v5, v24

    .line 545
    .line 546
    move/from16 v24, v6

    .line 547
    .line 548
    int-to-long v5, v5

    .line 549
    xor-long v22, v22, v5

    .line 550
    .line 551
    add-int/lit8 v14, v14, 0x1

    .line 552
    .line 553
    add-int/lit8 v10, v10, 0x1

    .line 554
    .line 555
    move/from16 v5, v16

    .line 556
    .line 557
    move/from16 v6, v24

    .line 558
    .line 559
    goto :goto_f

    .line 560
    :cond_10
    move/from16 v16, v5

    .line 561
    .line 562
    move/from16 v24, v6

    .line 563
    .line 564
    ushr-long v5, v22, v15

    .line 565
    .line 566
    int-to-long v13, v1

    .line 567
    and-long/2addr v5, v13

    .line 568
    move-wide/from16 v22, v5

    .line 569
    .line 570
    int-to-long v4, v4

    .line 571
    add-long v4, v4, v22

    .line 572
    .line 573
    long-to-int v4, v4

    .line 574
    mul-int v6, v24, v3

    .line 575
    .line 576
    const/4 v10, 0x0

    .line 577
    invoke-static {v2, v6, v8, v10, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 578
    .line 579
    .line 580
    :goto_10
    cmp-long v5, v22, v13

    .line 581
    .line 582
    if-gez v5, :cond_11

    .line 583
    .line 584
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 585
    .line 586
    array-length v15, v8

    .line 587
    invoke-interface {v5, v8, v10, v15}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 588
    .line 589
    .line 590
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 591
    .line 592
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 593
    .line 594
    .line 595
    move-result v5

    .line 596
    new-array v8, v5, [B

    .line 597
    .line 598
    iget-object v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 599
    .line 600
    invoke-interface {v5, v8, v10}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 601
    .line 602
    .line 603
    add-long v22, v22, v20

    .line 604
    .line 605
    goto :goto_10

    .line 606
    :cond_11
    invoke-static {v8, v10, v12, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 607
    .line 608
    .line 609
    add-int/lit8 v6, v24, 0x1

    .line 610
    .line 611
    move/from16 v5, v16

    .line 612
    .line 613
    goto :goto_e

    .line 614
    :cond_12
    move/from16 v24, v6

    .line 615
    .line 616
    const-wide/16 v20, 0x1

    .line 617
    .line 618
    ushr-int/lit8 v5, v9, 0x3

    .line 619
    .line 620
    if-ge v5, v3, :cond_15

    .line 621
    .line 622
    rem-int/lit8 v9, v9, 0x8

    .line 623
    .line 624
    const/4 v6, 0x0

    .line 625
    const-wide/16 v14, 0x0

    .line 626
    .line 627
    :goto_11
    if-ge v5, v3, :cond_13

    .line 628
    .line 629
    aget-byte v10, v17, v5

    .line 630
    .line 631
    and-int/lit16 v10, v10, 0xff

    .line 632
    .line 633
    shl-int/lit8 v13, v6, 0x3

    .line 634
    .line 635
    shl-int/2addr v10, v13

    .line 636
    move v13, v5

    .line 637
    move/from16 v16, v6

    .line 638
    .line 639
    int-to-long v5, v10

    .line 640
    xor-long/2addr v14, v5

    .line 641
    add-int/lit8 v6, v16, 0x1

    .line 642
    .line 643
    add-int/lit8 v5, v13, 0x1

    .line 644
    .line 645
    goto :goto_11

    .line 646
    :cond_13
    ushr-long v5, v14, v9

    .line 647
    .line 648
    int-to-long v9, v1

    .line 649
    and-long/2addr v5, v9

    .line 650
    int-to-long v13, v4

    .line 651
    add-long/2addr v13, v5

    .line 652
    long-to-int v4, v13

    .line 653
    mul-int v13, v24, v3

    .line 654
    .line 655
    const/4 v14, 0x0

    .line 656
    invoke-static {v2, v13, v8, v14, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 657
    .line 658
    .line 659
    :goto_12
    cmp-long v15, v5, v9

    .line 660
    .line 661
    if-gez v15, :cond_14

    .line 662
    .line 663
    iget-object v15, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 664
    .line 665
    move/from16 v16, v4

    .line 666
    .line 667
    array-length v4, v8

    .line 668
    invoke-interface {v15, v8, v14, v4}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 669
    .line 670
    .line 671
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 672
    .line 673
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 674
    .line 675
    .line 676
    move-result v4

    .line 677
    new-array v8, v4, [B

    .line 678
    .line 679
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 680
    .line 681
    invoke-interface {v4, v8, v14}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 682
    .line 683
    .line 684
    add-long v5, v5, v20

    .line 685
    .line 686
    move/from16 v4, v16

    .line 687
    .line 688
    goto :goto_12

    .line 689
    :cond_14
    move/from16 v16, v4

    .line 690
    .line 691
    invoke-static {v8, v14, v12, v13, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 692
    .line 693
    .line 694
    add-int/lit8 v6, v24, 0x1

    .line 695
    .line 696
    goto :goto_13

    .line 697
    :cond_15
    move/from16 v6, v24

    .line 698
    .line 699
    :goto_13
    iget v5, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 700
    .line 701
    shl-int v5, v19, v5

    .line 702
    .line 703
    sub-int/2addr v5, v4

    .line 704
    const/4 v4, 0x0

    .line 705
    :goto_14
    if-ge v4, v7, :cond_5

    .line 706
    .line 707
    and-int v9, v5, v1

    .line 708
    .line 709
    int-to-long v9, v9

    .line 710
    mul-int v13, v6, v3

    .line 711
    .line 712
    const/4 v14, 0x0

    .line 713
    invoke-static {v2, v13, v8, v14, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 714
    .line 715
    .line 716
    :goto_15
    int-to-long v14, v1

    .line 717
    cmp-long v14, v9, v14

    .line 718
    .line 719
    if-gez v14, :cond_16

    .line 720
    .line 721
    iget-object v14, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 722
    .line 723
    array-length v15, v8

    .line 724
    move/from16 p1, v1

    .line 725
    .line 726
    const/4 v1, 0x0

    .line 727
    invoke-interface {v14, v8, v1, v15}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 728
    .line 729
    .line 730
    iget-object v8, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 731
    .line 732
    invoke-interface {v8}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 733
    .line 734
    .line 735
    move-result v8

    .line 736
    new-array v8, v8, [B

    .line 737
    .line 738
    iget-object v14, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 739
    .line 740
    invoke-interface {v14, v8, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 741
    .line 742
    .line 743
    add-long v9, v9, v20

    .line 744
    .line 745
    move/from16 v1, p1

    .line 746
    .line 747
    goto :goto_15

    .line 748
    :cond_16
    move/from16 p1, v1

    .line 749
    .line 750
    const/4 v1, 0x0

    .line 751
    invoke-static {v8, v1, v12, v13, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 752
    .line 753
    .line 754
    iget v9, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 755
    .line 756
    ushr-int/2addr v5, v9

    .line 757
    add-int/lit8 v6, v6, 0x1

    .line 758
    .line 759
    add-int/2addr v4, v9

    .line 760
    move/from16 v1, p1

    .line 761
    .line 762
    goto :goto_14

    .line 763
    :goto_16
    new-array v2, v3, [B

    .line 764
    .line 765
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 766
    .line 767
    invoke-interface {v2, v12, v1, v11}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 768
    .line 769
    .line 770
    iget-object v2, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 771
    .line 772
    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 773
    .line 774
    .line 775
    move-result v2

    .line 776
    new-array v2, v2, [B

    .line 777
    .line 778
    iget-object v0, v0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 779
    .line 780
    invoke-interface {v0, v2, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 781
    .line 782
    .line 783
    return-object v2
.end method

.method public getLog(I)I
    .locals 1

    const/4 p0, 0x1

    const/4 v0, 0x2

    :goto_0
    if-ge v0, p1, :cond_0

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return p0
.end method

.method public getSignatureLength()I
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->messDigestOTS:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    shl-int/lit8 v1, v0, 0x3

    .line 8
    .line 9
    iget v2, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 10
    .line 11
    add-int/lit8 v3, v2, -0x1

    .line 12
    .line 13
    add-int/2addr v1, v3

    .line 14
    div-int/2addr v1, v2

    .line 15
    shl-int v2, v1, v2

    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->getLog(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget p0, p0, Lorg/spongycastle/pqc/crypto/gmss/util/WinternitzOTSVerify;->w:I

    .line 24
    .line 25
    add-int/2addr v2, p0

    .line 26
    add-int/lit8 v2, v2, -0x1

    .line 27
    .line 28
    div-int/2addr v2, p0

    .line 29
    add-int/2addr v1, v2

    .line 30
    mul-int/2addr v0, v1

    .line 31
    return v0
.end method

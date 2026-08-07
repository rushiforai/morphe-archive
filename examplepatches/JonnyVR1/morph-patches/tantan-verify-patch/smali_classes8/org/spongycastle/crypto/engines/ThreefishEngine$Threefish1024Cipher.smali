.class final Lorg/spongycastle/crypto/engines/ThreefishEngine$Threefish1024Cipher;
.super Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/engines/ThreefishEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Threefish1024Cipher"
.end annotation


# static fields
.field private static final ROTATION_0_0:I = 0x18

.field private static final ROTATION_0_1:I = 0xd

.field private static final ROTATION_0_2:I = 0x8

.field private static final ROTATION_0_3:I = 0x2f

.field private static final ROTATION_0_4:I = 0x8

.field private static final ROTATION_0_5:I = 0x11

.field private static final ROTATION_0_6:I = 0x16

.field private static final ROTATION_0_7:I = 0x25

.field private static final ROTATION_1_0:I = 0x26

.field private static final ROTATION_1_1:I = 0x13

.field private static final ROTATION_1_2:I = 0xa

.field private static final ROTATION_1_3:I = 0x37

.field private static final ROTATION_1_4:I = 0x31

.field private static final ROTATION_1_5:I = 0x12

.field private static final ROTATION_1_6:I = 0x17

.field private static final ROTATION_1_7:I = 0x34

.field private static final ROTATION_2_0:I = 0x21

.field private static final ROTATION_2_1:I = 0x4

.field private static final ROTATION_2_2:I = 0x33

.field private static final ROTATION_2_3:I = 0xd

.field private static final ROTATION_2_4:I = 0x22

.field private static final ROTATION_2_5:I = 0x29

.field private static final ROTATION_2_6:I = 0x3b

.field private static final ROTATION_2_7:I = 0x11

.field private static final ROTATION_3_0:I = 0x5

.field private static final ROTATION_3_1:I = 0x14

.field private static final ROTATION_3_2:I = 0x30

.field private static final ROTATION_3_3:I = 0x29

.field private static final ROTATION_3_4:I = 0x2f

.field private static final ROTATION_3_5:I = 0x1c

.field private static final ROTATION_3_6:I = 0x10

.field private static final ROTATION_3_7:I = 0x19

.field private static final ROTATION_4_0:I = 0x29

.field private static final ROTATION_4_1:I = 0x9

.field private static final ROTATION_4_2:I = 0x25

.field private static final ROTATION_4_3:I = 0x1f

.field private static final ROTATION_4_4:I = 0xc

.field private static final ROTATION_4_5:I = 0x2f

.field private static final ROTATION_4_6:I = 0x2c

.field private static final ROTATION_4_7:I = 0x1e

.field private static final ROTATION_5_0:I = 0x10

.field private static final ROTATION_5_1:I = 0x22

.field private static final ROTATION_5_2:I = 0x38

.field private static final ROTATION_5_3:I = 0x33

.field private static final ROTATION_5_4:I = 0x4

.field private static final ROTATION_5_5:I = 0x35

.field private static final ROTATION_5_6:I = 0x2a

.field private static final ROTATION_5_7:I = 0x29

.field private static final ROTATION_6_0:I = 0x1f

.field private static final ROTATION_6_1:I = 0x2c

.field private static final ROTATION_6_2:I = 0x2f

.field private static final ROTATION_6_3:I = 0x2e

.field private static final ROTATION_6_4:I = 0x13

.field private static final ROTATION_6_5:I = 0x2a

.field private static final ROTATION_6_6:I = 0x2c

.field private static final ROTATION_6_7:I = 0x19

.field private static final ROTATION_7_0:I = 0x9

.field private static final ROTATION_7_1:I = 0x30

.field private static final ROTATION_7_2:I = 0x23

.field private static final ROTATION_7_3:I = 0x34

.field private static final ROTATION_7_4:I = 0x17

.field private static final ROTATION_7_5:I = 0x1f

.field private static final ROTATION_7_6:I = 0x25

.field private static final ROTATION_7_7:I = 0x14


# direct methods
.method public constructor <init>([J[J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;-><init>([J[J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public decryptBlock([J[J)V
    .locals 93

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->kw:[J

    .line 4
    .line 5
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->t:[J

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$300()[I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    array-length v4, v1

    .line 16
    const/16 v5, 0x21

    .line 17
    .line 18
    if-ne v4, v5, :cond_2

    .line 19
    .line 20
    array-length v4, v0

    .line 21
    const/4 v6, 0x5

    .line 22
    if-ne v4, v6, :cond_1

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aget-wide v7, p1, v4

    .line 26
    .line 27
    const/4 v9, 0x1

    .line 28
    aget-wide v10, p1, v9

    .line 29
    .line 30
    const/4 v12, 0x2

    .line 31
    aget-wide v13, p1, v12

    .line 32
    .line 33
    const/4 v15, 0x3

    .line 34
    aget-wide v16, p1, v15

    .line 35
    .line 36
    move/from16 p0, v4

    .line 37
    .line 38
    const/4 v4, 0x4

    .line 39
    aget-wide v18, p1, v4

    .line 40
    .line 41
    aget-wide v20, p1, v6

    .line 42
    .line 43
    const/16 v22, 0x6

    .line 44
    .line 45
    aget-wide v23, p1, v22

    .line 46
    .line 47
    const/16 v25, 0x7

    .line 48
    .line 49
    aget-wide v26, p1, v25

    .line 50
    .line 51
    move/from16 v28, v12

    .line 52
    .line 53
    const/16 v12, 0x8

    .line 54
    .line 55
    aget-wide v29, p1, v12

    .line 56
    .line 57
    move/from16 v31, v15

    .line 58
    .line 59
    const/16 v15, 0x9

    .line 60
    .line 61
    aget-wide v32, p1, v15

    .line 62
    .line 63
    const/16 v12, 0xa

    .line 64
    .line 65
    aget-wide v35, p1, v12

    .line 66
    .line 67
    const/16 v37, 0xb

    .line 68
    .line 69
    aget-wide v38, p1, v37

    .line 70
    .line 71
    const/16 v12, 0xc

    .line 72
    .line 73
    aget-wide v41, p1, v12

    .line 74
    .line 75
    const/16 v5, 0xd

    .line 76
    .line 77
    aget-wide v43, p1, v5

    .line 78
    .line 79
    const/16 v45, 0xe

    .line 80
    .line 81
    aget-wide v46, p1, v45

    .line 82
    .line 83
    const/16 v48, 0xf

    .line 84
    .line 85
    aget-wide v49, p1, v48

    .line 86
    .line 87
    const/16 v6, 0x13

    .line 88
    .line 89
    :goto_0
    if-lt v6, v9, :cond_0

    .line 90
    .line 91
    aget v53, v2, v6

    .line 92
    .line 93
    aget v54, v3, v6

    .line 94
    .line 95
    add-int/lit8 v55, v53, 0x1

    .line 96
    .line 97
    aget-wide v56, v1, v55

    .line 98
    .line 99
    sub-long v7, v7, v56

    .line 100
    .line 101
    add-int/lit8 v56, v53, 0x2

    .line 102
    .line 103
    aget-wide v57, v1, v56

    .line 104
    .line 105
    sub-long v10, v10, v57

    .line 106
    .line 107
    add-int/lit8 v57, v53, 0x3

    .line 108
    .line 109
    aget-wide v58, v1, v57

    .line 110
    .line 111
    sub-long v13, v13, v58

    .line 112
    .line 113
    add-int/lit8 v58, v53, 0x4

    .line 114
    .line 115
    aget-wide v59, v1, v58

    .line 116
    .line 117
    sub-long v4, v16, v59

    .line 118
    .line 119
    add-int/lit8 v16, v53, 0x5

    .line 120
    .line 121
    aget-wide v59, v1, v16

    .line 122
    .line 123
    move/from16 v62, v9

    .line 124
    .line 125
    move-wide/from16 v63, v10

    .line 126
    .line 127
    sub-long v9, v18, v59

    .line 128
    .line 129
    add-int/lit8 v11, v53, 0x6

    .line 130
    .line 131
    aget-wide v17, v1, v11

    .line 132
    .line 133
    move-wide/from16 v65, v13

    .line 134
    .line 135
    sub-long v12, v20, v17

    .line 136
    .line 137
    add-int/lit8 v14, v53, 0x7

    .line 138
    .line 139
    aget-wide v17, v1, v14

    .line 140
    .line 141
    move-object/from16 v67, v0

    .line 142
    .line 143
    move-object/from16 v60, v1

    .line 144
    .line 145
    sub-long v0, v23, v17

    .line 146
    .line 147
    add-int/lit8 v17, v53, 0x8

    .line 148
    .line 149
    aget-wide v18, v60, v17

    .line 150
    .line 151
    move-object/from16 v68, v2

    .line 152
    .line 153
    move-object/from16 v69, v3

    .line 154
    .line 155
    sub-long v2, v26, v18

    .line 156
    .line 157
    add-int/lit8 v18, v53, 0x9

    .line 158
    .line 159
    aget-wide v19, v60, v18

    .line 160
    .line 161
    move-wide/from16 v23, v2

    .line 162
    .line 163
    sub-long v2, v29, v19

    .line 164
    .line 165
    add-int/lit8 v19, v53, 0xa

    .line 166
    .line 167
    aget-wide v20, v60, v19

    .line 168
    .line 169
    move-wide/from16 v70, v4

    .line 170
    .line 171
    sub-long v4, v32, v20

    .line 172
    .line 173
    add-int/lit8 v20, v53, 0xb

    .line 174
    .line 175
    aget-wide v26, v60, v20

    .line 176
    .line 177
    move-wide/from16 v29, v2

    .line 178
    .line 179
    sub-long v2, v35, v26

    .line 180
    .line 181
    add-int/lit8 v21, v53, 0xc

    .line 182
    .line 183
    aget-wide v26, v60, v21

    .line 184
    .line 185
    move-wide/from16 v32, v2

    .line 186
    .line 187
    sub-long v2, v38, v26

    .line 188
    .line 189
    add-int/lit8 v26, v53, 0xd

    .line 190
    .line 191
    aget-wide v35, v60, v26

    .line 192
    .line 193
    move/from16 v72, v11

    .line 194
    .line 195
    move-wide/from16 v73, v12

    .line 196
    .line 197
    sub-long v11, v41, v35

    .line 198
    .line 199
    add-int/lit8 v13, v53, 0xe

    .line 200
    .line 201
    aget-wide v35, v60, v13

    .line 202
    .line 203
    add-int/lit8 v27, v54, 0x1

    .line 204
    .line 205
    aget-wide v38, v67, v27

    .line 206
    .line 207
    add-long v35, v35, v38

    .line 208
    .line 209
    move/from16 v38, v13

    .line 210
    .line 211
    move/from16 v75, v14

    .line 212
    .line 213
    sub-long v13, v43, v35

    .line 214
    .line 215
    add-int/lit8 v35, v53, 0xf

    .line 216
    .line 217
    aget-wide v41, v60, v35

    .line 218
    .line 219
    add-int/lit8 v36, v54, 0x2

    .line 220
    .line 221
    aget-wide v43, v67, v36

    .line 222
    .line 223
    add-long v41, v41, v43

    .line 224
    .line 225
    move-wide/from16 v76, v11

    .line 226
    .line 227
    sub-long v11, v46, v41

    .line 228
    .line 229
    add-int/lit8 v36, v53, 0x10

    .line 230
    .line 231
    aget-wide v41, v60, v36

    .line 232
    .line 233
    move-wide/from16 v43, v11

    .line 234
    .line 235
    int-to-long v11, v6

    .line 236
    add-long v41, v41, v11

    .line 237
    .line 238
    const-wide/16 v46, 0x1

    .line 239
    .line 240
    add-long v41, v41, v46

    .line 241
    .line 242
    move-wide/from16 v46, v11

    .line 243
    .line 244
    sub-long v11, v49, v41

    .line 245
    .line 246
    invoke-static {v11, v12, v15, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 247
    .line 248
    .line 249
    move-result-wide v11

    .line 250
    sub-long/2addr v7, v11

    .line 251
    const/16 v15, 0x30

    .line 252
    .line 253
    move-wide/from16 v41, v11

    .line 254
    .line 255
    move-wide/from16 v11, v65

    .line 256
    .line 257
    invoke-static {v2, v3, v15, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 258
    .line 259
    .line 260
    move-result-wide v2

    .line 261
    sub-long/2addr v11, v2

    .line 262
    const/16 v15, 0x23

    .line 263
    .line 264
    invoke-static {v13, v14, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 265
    .line 266
    .line 267
    move-result-wide v13

    .line 268
    sub-long/2addr v0, v13

    .line 269
    const/16 v15, 0x34

    .line 270
    .line 271
    invoke-static {v4, v5, v15, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 272
    .line 273
    .line 274
    move-result-wide v4

    .line 275
    sub-long/2addr v9, v4

    .line 276
    const/16 v15, 0x17

    .line 277
    .line 278
    move-wide/from16 v49, v43

    .line 279
    .line 280
    move-wide/from16 v43, v2

    .line 281
    .line 282
    move-wide/from16 v2, v49

    .line 283
    .line 284
    move-wide/from16 v49, v4

    .line 285
    .line 286
    move-wide/from16 v4, v63

    .line 287
    .line 288
    invoke-static {v4, v5, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 289
    .line 290
    .line 291
    move-result-wide v4

    .line 292
    sub-long/2addr v2, v4

    .line 293
    const/16 v15, 0x1f

    .line 294
    .line 295
    move-wide/from16 v64, v29

    .line 296
    .line 297
    move-wide/from16 v29, v13

    .line 298
    .line 299
    move-wide/from16 v13, v64

    .line 300
    .line 301
    move-wide/from16 v64, v2

    .line 302
    .line 303
    move-wide/from16 v2, v73

    .line 304
    .line 305
    invoke-static {v2, v3, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 306
    .line 307
    .line 308
    move-result-wide v2

    .line 309
    sub-long/2addr v13, v2

    .line 310
    const/16 v15, 0x25

    .line 311
    .line 312
    move-wide/from16 v73, v32

    .line 313
    .line 314
    move-wide/from16 v32, v0

    .line 315
    .line 316
    move-wide/from16 v0, v73

    .line 317
    .line 318
    move-wide/from16 v73, v13

    .line 319
    .line 320
    move-wide/from16 v13, v70

    .line 321
    .line 322
    invoke-static {v13, v14, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 323
    .line 324
    .line 325
    move-result-wide v13

    .line 326
    sub-long/2addr v0, v13

    .line 327
    const/16 v15, 0x14

    .line 328
    .line 329
    move-wide/from16 v79, v0

    .line 330
    .line 331
    move-wide/from16 v0, v23

    .line 332
    .line 333
    move-wide/from16 v23, v4

    .line 334
    .line 335
    move-wide/from16 v4, v76

    .line 336
    .line 337
    invoke-static {v0, v1, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 338
    .line 339
    .line 340
    move-result-wide v0

    .line 341
    sub-long/2addr v4, v0

    .line 342
    const/16 v15, 0x1f

    .line 343
    .line 344
    invoke-static {v0, v1, v15, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 345
    .line 346
    .line 347
    move-result-wide v0

    .line 348
    sub-long/2addr v7, v0

    .line 349
    const/16 v15, 0x2c

    .line 350
    .line 351
    invoke-static {v2, v3, v15, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 352
    .line 353
    .line 354
    move-result-wide v2

    .line 355
    sub-long/2addr v11, v2

    .line 356
    const/16 v15, 0x2f

    .line 357
    .line 358
    invoke-static {v13, v14, v15, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 359
    .line 360
    .line 361
    move-result-wide v13

    .line 362
    sub-long/2addr v9, v13

    .line 363
    const/16 v15, 0x2e

    .line 364
    .line 365
    move-wide/from16 v81, v23

    .line 366
    .line 367
    move-wide/from16 v23, v13

    .line 368
    .line 369
    move-wide/from16 v13, v81

    .line 370
    .line 371
    move-wide/from16 v81, v2

    .line 372
    .line 373
    move-wide/from16 v2, v32

    .line 374
    .line 375
    invoke-static {v13, v14, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 376
    .line 377
    .line 378
    move-result-wide v13

    .line 379
    sub-long/2addr v2, v13

    .line 380
    move-wide/from16 v32, v13

    .line 381
    .line 382
    move-wide/from16 v13, v41

    .line 383
    .line 384
    const/16 v15, 0x13

    .line 385
    .line 386
    invoke-static {v13, v14, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 387
    .line 388
    .line 389
    move-result-wide v13

    .line 390
    sub-long/2addr v4, v13

    .line 391
    const/16 v15, 0x2a

    .line 392
    .line 393
    move-wide/from16 v41, v4

    .line 394
    .line 395
    move-wide/from16 v4, v29

    .line 396
    .line 397
    move-wide/from16 v29, v0

    .line 398
    .line 399
    move-wide/from16 v0, v64

    .line 400
    .line 401
    invoke-static {v4, v5, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 402
    .line 403
    .line 404
    move-result-wide v4

    .line 405
    sub-long/2addr v0, v4

    .line 406
    move-wide/from16 v64, v0

    .line 407
    .line 408
    move-wide/from16 v0, v43

    .line 409
    .line 410
    const/16 v15, 0x2c

    .line 411
    .line 412
    move-wide/from16 v43, v9

    .line 413
    .line 414
    move-wide/from16 v9, v73

    .line 415
    .line 416
    invoke-static {v0, v1, v15, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 417
    .line 418
    .line 419
    move-result-wide v0

    .line 420
    sub-long/2addr v9, v0

    .line 421
    const/16 v15, 0x19

    .line 422
    .line 423
    move-wide/from16 v83, v9

    .line 424
    .line 425
    move-wide/from16 v9, v49

    .line 426
    .line 427
    move-wide/from16 v49, v13

    .line 428
    .line 429
    move-wide/from16 v13, v79

    .line 430
    .line 431
    invoke-static {v9, v10, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 432
    .line 433
    .line 434
    move-result-wide v9

    .line 435
    sub-long/2addr v13, v9

    .line 436
    const/16 v15, 0x10

    .line 437
    .line 438
    invoke-static {v9, v10, v15, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 439
    .line 440
    .line 441
    move-result-wide v9

    .line 442
    sub-long/2addr v7, v9

    .line 443
    const/16 v15, 0x22

    .line 444
    .line 445
    invoke-static {v4, v5, v15, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 446
    .line 447
    .line 448
    move-result-wide v4

    .line 449
    sub-long/2addr v11, v4

    .line 450
    const/16 v15, 0x38

    .line 451
    .line 452
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 453
    .line 454
    .line 455
    move-result-wide v0

    .line 456
    sub-long/2addr v2, v0

    .line 457
    const/16 v15, 0x33

    .line 458
    .line 459
    move-wide/from16 v85, v4

    .line 460
    .line 461
    move-wide/from16 v4, v43

    .line 462
    .line 463
    move-wide/from16 v43, v0

    .line 464
    .line 465
    move-wide/from16 v0, v49

    .line 466
    .line 467
    invoke-static {v0, v1, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 468
    .line 469
    .line 470
    move-result-wide v0

    .line 471
    sub-long/2addr v4, v0

    .line 472
    move-wide/from16 v49, v0

    .line 473
    .line 474
    move-wide/from16 v0, v29

    .line 475
    .line 476
    const/4 v15, 0x4

    .line 477
    invoke-static {v0, v1, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 478
    .line 479
    .line 480
    move-result-wide v0

    .line 481
    sub-long/2addr v13, v0

    .line 482
    const/16 v15, 0x35

    .line 483
    .line 484
    move-wide/from16 v87, v13

    .line 485
    .line 486
    move-wide/from16 v13, v23

    .line 487
    .line 488
    move-wide/from16 v23, v9

    .line 489
    .line 490
    move-wide/from16 v9, v41

    .line 491
    .line 492
    invoke-static {v13, v14, v15, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 493
    .line 494
    .line 495
    move-result-wide v13

    .line 496
    sub-long/2addr v9, v13

    .line 497
    move-wide/from16 v41, v64

    .line 498
    .line 499
    move-wide/from16 v64, v0

    .line 500
    .line 501
    move-wide/from16 v0, v41

    .line 502
    .line 503
    move-wide/from16 v41, v9

    .line 504
    .line 505
    move-wide/from16 v9, v81

    .line 506
    .line 507
    const/16 v15, 0x2a

    .line 508
    .line 509
    invoke-static {v9, v10, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 510
    .line 511
    .line 512
    move-result-wide v9

    .line 513
    sub-long/2addr v0, v9

    .line 514
    const/16 v15, 0x29

    .line 515
    .line 516
    move-wide/from16 v81, v0

    .line 517
    .line 518
    move-wide/from16 v0, v32

    .line 519
    .line 520
    move-wide/from16 v32, v2

    .line 521
    .line 522
    move-wide/from16 v2, v83

    .line 523
    .line 524
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 525
    .line 526
    .line 527
    move-result-wide v0

    .line 528
    sub-long/2addr v2, v0

    .line 529
    invoke-static {v0, v1, v15, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 530
    .line 531
    .line 532
    move-result-wide v0

    .line 533
    sub-long/2addr v7, v0

    .line 534
    const/16 v15, 0x9

    .line 535
    .line 536
    invoke-static {v13, v14, v15, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 537
    .line 538
    .line 539
    move-result-wide v13

    .line 540
    sub-long/2addr v11, v13

    .line 541
    const/16 v15, 0x25

    .line 542
    .line 543
    invoke-static {v9, v10, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 544
    .line 545
    .line 546
    move-result-wide v9

    .line 547
    sub-long/2addr v4, v9

    .line 548
    move-wide/from16 v83, v0

    .line 549
    .line 550
    move-wide/from16 v0, v32

    .line 551
    .line 552
    const/16 v15, 0x1f

    .line 553
    .line 554
    move-wide/from16 v32, v4

    .line 555
    .line 556
    move-wide/from16 v4, v64

    .line 557
    .line 558
    invoke-static {v4, v5, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 559
    .line 560
    .line 561
    move-result-wide v4

    .line 562
    sub-long/2addr v0, v4

    .line 563
    move-wide/from16 v64, v0

    .line 564
    .line 565
    move-wide/from16 v0, v23

    .line 566
    .line 567
    const/16 v15, 0xc

    .line 568
    .line 569
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 570
    .line 571
    .line 572
    move-result-wide v0

    .line 573
    sub-long/2addr v2, v0

    .line 574
    move-wide/from16 v23, v0

    .line 575
    .line 576
    move-wide/from16 v0, v43

    .line 577
    .line 578
    const/16 v15, 0x2f

    .line 579
    .line 580
    move-wide/from16 v43, v2

    .line 581
    .line 582
    move-wide/from16 v2, v87

    .line 583
    .line 584
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 585
    .line 586
    .line 587
    move-result-wide v0

    .line 588
    sub-long/2addr v2, v0

    .line 589
    move-wide/from16 v87, v41

    .line 590
    .line 591
    move-wide/from16 v41, v2

    .line 592
    .line 593
    move-wide/from16 v2, v87

    .line 594
    .line 595
    move-wide/from16 v87, v0

    .line 596
    .line 597
    move-wide/from16 v0, v85

    .line 598
    .line 599
    const/16 v15, 0x2c

    .line 600
    .line 601
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 602
    .line 603
    .line 604
    move-result-wide v0

    .line 605
    sub-long/2addr v2, v0

    .line 606
    const/16 v15, 0x1e

    .line 607
    .line 608
    move-wide/from16 v85, v0

    .line 609
    .line 610
    move-wide/from16 v0, v49

    .line 611
    .line 612
    move-wide/from16 v49, v2

    .line 613
    .line 614
    move-wide/from16 v2, v81

    .line 615
    .line 616
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 617
    .line 618
    .line 619
    move-result-wide v0

    .line 620
    sub-long/2addr v2, v0

    .line 621
    aget-wide v81, v60, v53

    .line 622
    .line 623
    sub-long v7, v7, v81

    .line 624
    .line 625
    aget-wide v81, v60, v55

    .line 626
    .line 627
    move-wide/from16 v89, v0

    .line 628
    .line 629
    sub-long v0, v83, v81

    .line 630
    .line 631
    aget-wide v55, v60, v56

    .line 632
    .line 633
    sub-long v11, v11, v55

    .line 634
    .line 635
    aget-wide v55, v60, v57

    .line 636
    .line 637
    sub-long v13, v13, v55

    .line 638
    .line 639
    aget-wide v55, v60, v58

    .line 640
    .line 641
    move-wide/from16 v57, v2

    .line 642
    .line 643
    sub-long v2, v32, v55

    .line 644
    .line 645
    aget-wide v15, v60, v16

    .line 646
    .line 647
    sub-long/2addr v9, v15

    .line 648
    aget-wide v15, v60, v72

    .line 649
    .line 650
    move-wide/from16 v32, v4

    .line 651
    .line 652
    sub-long v4, v64, v15

    .line 653
    .line 654
    aget-wide v15, v60, v75

    .line 655
    .line 656
    move-wide/from16 v55, v13

    .line 657
    .line 658
    sub-long v13, v32, v15

    .line 659
    .line 660
    aget-wide v15, v60, v17

    .line 661
    .line 662
    move-wide/from16 v32, v13

    .line 663
    .line 664
    sub-long v13, v43, v15

    .line 665
    .line 666
    aget-wide v15, v60, v18

    .line 667
    .line 668
    move-wide/from16 v17, v9

    .line 669
    .line 670
    sub-long v9, v23, v15

    .line 671
    .line 672
    aget-wide v15, v60, v19

    .line 673
    .line 674
    move-wide/from16 v23, v13

    .line 675
    .line 676
    sub-long v13, v41, v15

    .line 677
    .line 678
    aget-wide v15, v60, v20

    .line 679
    .line 680
    move-wide/from16 v19, v13

    .line 681
    .line 682
    sub-long v13, v87, v15

    .line 683
    .line 684
    aget-wide v15, v60, v21

    .line 685
    .line 686
    move-wide/from16 v41, v0

    .line 687
    .line 688
    sub-long v0, v49, v15

    .line 689
    .line 690
    aget-wide v15, v60, v26

    .line 691
    .line 692
    aget-wide v43, v67, v54

    .line 693
    .line 694
    add-long v15, v15, v43

    .line 695
    .line 696
    move-wide/from16 v43, v0

    .line 697
    .line 698
    sub-long v0, v85, v15

    .line 699
    .line 700
    aget-wide v15, v60, v38

    .line 701
    .line 702
    aget-wide v26, v67, v27

    .line 703
    .line 704
    add-long v15, v15, v26

    .line 705
    .line 706
    move-wide/from16 v26, v2

    .line 707
    .line 708
    sub-long v2, v57, v15

    .line 709
    .line 710
    aget-wide v15, v60, v35

    .line 711
    .line 712
    add-long v15, v15, v46

    .line 713
    .line 714
    move-wide/from16 v46, v2

    .line 715
    .line 716
    sub-long v2, v89, v15

    .line 717
    .line 718
    const/4 v15, 0x5

    .line 719
    invoke-static {v2, v3, v15, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 720
    .line 721
    .line 722
    move-result-wide v2

    .line 723
    sub-long/2addr v7, v2

    .line 724
    const/16 v15, 0x14

    .line 725
    .line 726
    invoke-static {v13, v14, v15, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 727
    .line 728
    .line 729
    move-result-wide v13

    .line 730
    sub-long/2addr v11, v13

    .line 731
    const/16 v15, 0x30

    .line 732
    .line 733
    invoke-static {v0, v1, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 734
    .line 735
    .line 736
    move-result-wide v0

    .line 737
    sub-long/2addr v4, v0

    .line 738
    move/from16 v53, v6

    .line 739
    .line 740
    move-wide v15, v13

    .line 741
    move-wide/from16 v13, v26

    .line 742
    .line 743
    const/16 v6, 0x29

    .line 744
    .line 745
    invoke-static {v9, v10, v6, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 746
    .line 747
    .line 748
    move-result-wide v9

    .line 749
    sub-long/2addr v13, v9

    .line 750
    move-wide/from16 v35, v0

    .line 751
    .line 752
    move-wide/from16 v26, v9

    .line 753
    .line 754
    move-wide/from16 v9, v41

    .line 755
    .line 756
    move-wide/from16 v0, v46

    .line 757
    .line 758
    const/16 v6, 0x2f

    .line 759
    .line 760
    invoke-static {v9, v10, v6, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 761
    .line 762
    .line 763
    move-result-wide v9

    .line 764
    sub-long/2addr v0, v9

    .line 765
    const/16 v6, 0x1c

    .line 766
    .line 767
    move-wide/from16 v41, v0

    .line 768
    .line 769
    move-wide/from16 v0, v17

    .line 770
    .line 771
    move-wide/from16 v17, v2

    .line 772
    .line 773
    move-wide/from16 v2, v23

    .line 774
    .line 775
    invoke-static {v0, v1, v6, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 776
    .line 777
    .line 778
    move-result-wide v0

    .line 779
    sub-long/2addr v2, v0

    .line 780
    move-wide/from16 v23, v19

    .line 781
    .line 782
    move-wide/from16 v19, v4

    .line 783
    .line 784
    move-wide/from16 v4, v23

    .line 785
    .line 786
    move-wide/from16 v23, v2

    .line 787
    .line 788
    move-wide/from16 v2, v55

    .line 789
    .line 790
    const/16 v6, 0x10

    .line 791
    .line 792
    invoke-static {v2, v3, v6, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 793
    .line 794
    .line 795
    move-result-wide v2

    .line 796
    sub-long/2addr v4, v2

    .line 797
    move-wide/from16 v46, v4

    .line 798
    .line 799
    move-wide/from16 v4, v32

    .line 800
    .line 801
    const/16 v6, 0x19

    .line 802
    .line 803
    move-wide/from16 v32, v9

    .line 804
    .line 805
    move-wide/from16 v9, v43

    .line 806
    .line 807
    invoke-static {v4, v5, v6, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 808
    .line 809
    .line 810
    move-result-wide v4

    .line 811
    sub-long/2addr v9, v4

    .line 812
    const/16 v6, 0x21

    .line 813
    .line 814
    invoke-static {v4, v5, v6, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 815
    .line 816
    .line 817
    move-result-wide v4

    .line 818
    sub-long/2addr v7, v4

    .line 819
    const/4 v6, 0x4

    .line 820
    invoke-static {v0, v1, v6, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 821
    .line 822
    .line 823
    move-result-wide v0

    .line 824
    sub-long/2addr v11, v0

    .line 825
    const/16 v6, 0x33

    .line 826
    .line 827
    invoke-static {v2, v3, v6, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 828
    .line 829
    .line 830
    move-result-wide v2

    .line 831
    sub-long/2addr v13, v2

    .line 832
    move-wide/from16 v43, v0

    .line 833
    .line 834
    move-wide/from16 v0, v19

    .line 835
    .line 836
    const/16 v6, 0xd

    .line 837
    .line 838
    move-wide/from16 v19, v2

    .line 839
    .line 840
    move-wide/from16 v2, v32

    .line 841
    .line 842
    invoke-static {v2, v3, v6, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 843
    .line 844
    .line 845
    move-result-wide v2

    .line 846
    sub-long/2addr v0, v2

    .line 847
    move-wide/from16 v32, v2

    .line 848
    .line 849
    move-wide/from16 v2, v17

    .line 850
    .line 851
    const/16 v6, 0x22

    .line 852
    .line 853
    invoke-static {v2, v3, v6, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 854
    .line 855
    .line 856
    move-result-wide v2

    .line 857
    sub-long/2addr v9, v2

    .line 858
    move-wide/from16 v29, v4

    .line 859
    .line 860
    move-wide/from16 v17, v9

    .line 861
    .line 862
    move-wide/from16 v9, v35

    .line 863
    .line 864
    move-wide/from16 v4, v41

    .line 865
    .line 866
    const/16 v6, 0x29

    .line 867
    .line 868
    invoke-static {v9, v10, v6, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 869
    .line 870
    .line 871
    move-result-wide v9

    .line 872
    sub-long/2addr v4, v9

    .line 873
    const/16 v6, 0x3b

    .line 874
    .line 875
    move-wide/from16 v35, v4

    .line 876
    .line 877
    move-wide v4, v15

    .line 878
    move-wide v15, v2

    .line 879
    move-wide/from16 v2, v23

    .line 880
    .line 881
    invoke-static {v4, v5, v6, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 882
    .line 883
    .line 884
    move-result-wide v4

    .line 885
    sub-long/2addr v2, v4

    .line 886
    const/16 v6, 0x11

    .line 887
    .line 888
    move-wide/from16 v23, v2

    .line 889
    .line 890
    move-wide/from16 v2, v26

    .line 891
    .line 892
    move-wide/from16 v26, v13

    .line 893
    .line 894
    move-wide/from16 v13, v46

    .line 895
    .line 896
    invoke-static {v2, v3, v6, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 897
    .line 898
    .line 899
    move-result-wide v2

    .line 900
    sub-long/2addr v13, v2

    .line 901
    const/16 v6, 0x26

    .line 902
    .line 903
    invoke-static {v2, v3, v6, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 904
    .line 905
    .line 906
    move-result-wide v2

    .line 907
    sub-long/2addr v7, v2

    .line 908
    const/16 v6, 0x13

    .line 909
    .line 910
    invoke-static {v9, v10, v6, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 911
    .line 912
    .line 913
    move-result-wide v9

    .line 914
    sub-long/2addr v11, v9

    .line 915
    const/16 v6, 0xa

    .line 916
    .line 917
    invoke-static {v4, v5, v6, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 918
    .line 919
    .line 920
    move-result-wide v4

    .line 921
    sub-long/2addr v0, v4

    .line 922
    const/16 v6, 0x37

    .line 923
    .line 924
    move-wide/from16 v41, v15

    .line 925
    .line 926
    move-wide v15, v4

    .line 927
    move-wide/from16 v4, v41

    .line 928
    .line 929
    move-wide/from16 v41, v9

    .line 930
    .line 931
    move-wide/from16 v9, v26

    .line 932
    .line 933
    invoke-static {v4, v5, v6, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 934
    .line 935
    .line 936
    move-result-wide v4

    .line 937
    sub-long/2addr v9, v4

    .line 938
    const/16 v6, 0x31

    .line 939
    .line 940
    move-wide/from16 v26, v4

    .line 941
    .line 942
    move-wide/from16 v4, v29

    .line 943
    .line 944
    invoke-static {v4, v5, v6, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 945
    .line 946
    .line 947
    move-result-wide v4

    .line 948
    sub-long/2addr v13, v4

    .line 949
    const/16 v6, 0x12

    .line 950
    .line 951
    move-wide/from16 v29, v17

    .line 952
    .line 953
    move-wide/from16 v17, v2

    .line 954
    .line 955
    move-wide/from16 v2, v29

    .line 956
    .line 957
    move-wide/from16 v29, v13

    .line 958
    .line 959
    move-wide/from16 v13, v19

    .line 960
    .line 961
    invoke-static {v13, v14, v6, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 962
    .line 963
    .line 964
    move-result-wide v13

    .line 965
    sub-long/2addr v2, v13

    .line 966
    move-wide/from16 v19, v35

    .line 967
    .line 968
    move-wide/from16 v35, v0

    .line 969
    .line 970
    move-wide/from16 v0, v19

    .line 971
    .line 972
    move-wide/from16 v19, v2

    .line 973
    .line 974
    move-wide/from16 v2, v43

    .line 975
    .line 976
    const/16 v6, 0x17

    .line 977
    .line 978
    invoke-static {v2, v3, v6, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 979
    .line 980
    .line 981
    move-result-wide v2

    .line 982
    sub-long/2addr v0, v2

    .line 983
    move-wide/from16 v43, v23

    .line 984
    .line 985
    move-wide/from16 v23, v4

    .line 986
    .line 987
    move-wide/from16 v4, v43

    .line 988
    .line 989
    move-wide/from16 v43, v0

    .line 990
    .line 991
    move-wide/from16 v0, v32

    .line 992
    .line 993
    const/16 v6, 0x34

    .line 994
    .line 995
    invoke-static {v0, v1, v6, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 996
    .line 997
    .line 998
    move-result-wide v0

    .line 999
    sub-long/2addr v4, v0

    .line 1000
    const/16 v6, 0x18

    .line 1001
    .line 1002
    invoke-static {v0, v1, v6, v7, v8}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1003
    .line 1004
    .line 1005
    move-result-wide v0

    .line 1006
    sub-long/2addr v7, v0

    .line 1007
    const/16 v6, 0xd

    .line 1008
    .line 1009
    invoke-static {v13, v14, v6, v11, v12}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1010
    .line 1011
    .line 1012
    move-result-wide v13

    .line 1013
    sub-long/2addr v11, v13

    .line 1014
    const/16 v6, 0x8

    .line 1015
    .line 1016
    invoke-static {v2, v3, v6, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1017
    .line 1018
    .line 1019
    move-result-wide v2

    .line 1020
    sub-long/2addr v9, v2

    .line 1021
    move-wide/from16 v32, v23

    .line 1022
    .line 1023
    move-wide/from16 v23, v0

    .line 1024
    .line 1025
    move-wide/from16 v0, v32

    .line 1026
    .line 1027
    move-wide/from16 v32, v7

    .line 1028
    .line 1029
    move-wide/from16 v6, v35

    .line 1030
    .line 1031
    const/16 v8, 0x2f

    .line 1032
    .line 1033
    invoke-static {v0, v1, v8, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1034
    .line 1035
    .line 1036
    move-result-wide v0

    .line 1037
    sub-long/2addr v6, v0

    .line 1038
    move-wide/from16 v35, v0

    .line 1039
    .line 1040
    move-wide/from16 v0, v17

    .line 1041
    .line 1042
    const/16 v8, 0x8

    .line 1043
    .line 1044
    invoke-static {v0, v1, v8, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1045
    .line 1046
    .line 1047
    move-result-wide v0

    .line 1048
    sub-long/2addr v4, v0

    .line 1049
    move-wide/from16 v17, v0

    .line 1050
    .line 1051
    move-wide v0, v15

    .line 1052
    const/16 v8, 0x11

    .line 1053
    .line 1054
    move-wide v15, v2

    .line 1055
    move-wide/from16 v2, v29

    .line 1056
    .line 1057
    invoke-static {v0, v1, v8, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1058
    .line 1059
    .line 1060
    move-result-wide v38

    .line 1061
    sub-long v0, v2, v38

    .line 1062
    .line 1063
    const/16 v2, 0x16

    .line 1064
    .line 1065
    move-wide/from16 v29, v19

    .line 1066
    .line 1067
    move-wide/from16 v19, v4

    .line 1068
    .line 1069
    move-wide/from16 v3, v29

    .line 1070
    .line 1071
    move-wide/from16 v29, v0

    .line 1072
    .line 1073
    move-wide/from16 v0, v41

    .line 1074
    .line 1075
    invoke-static {v0, v1, v2, v3, v4}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1076
    .line 1077
    .line 1078
    move-result-wide v0

    .line 1079
    sub-long v41, v3, v0

    .line 1080
    .line 1081
    move-wide/from16 v2, v26

    .line 1082
    .line 1083
    move-wide/from16 v4, v43

    .line 1084
    .line 1085
    const/16 v8, 0x25

    .line 1086
    .line 1087
    invoke-static {v2, v3, v8, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->xorRotr(JIJ)J

    .line 1088
    .line 1089
    .line 1090
    move-result-wide v49

    .line 1091
    sub-long v46, v4, v49

    .line 1092
    .line 1093
    add-int/lit8 v2, v53, -0x2

    .line 1094
    .line 1095
    move-wide/from16 v43, v0

    .line 1096
    .line 1097
    move-wide/from16 v26, v35

    .line 1098
    .line 1099
    move-object/from16 v1, v60

    .line 1100
    .line 1101
    move-object/from16 v0, v67

    .line 1102
    .line 1103
    move-object/from16 v3, v69

    .line 1104
    .line 1105
    const/4 v4, 0x4

    .line 1106
    move-wide/from16 v35, v29

    .line 1107
    .line 1108
    move-wide/from16 v29, v19

    .line 1109
    .line 1110
    move-wide/from16 v20, v15

    .line 1111
    .line 1112
    const/16 v15, 0x9

    .line 1113
    .line 1114
    move-wide/from16 v91, v6

    .line 1115
    .line 1116
    move v6, v2

    .line 1117
    move-wide/from16 v7, v32

    .line 1118
    .line 1119
    move-object/from16 v2, v68

    .line 1120
    .line 1121
    move-wide/from16 v32, v17

    .line 1122
    .line 1123
    move-wide/from16 v18, v9

    .line 1124
    .line 1125
    move-wide/from16 v16, v13

    .line 1126
    .line 1127
    move/from16 v9, v62

    .line 1128
    .line 1129
    move-wide v13, v11

    .line 1130
    move-wide/from16 v10, v23

    .line 1131
    .line 1132
    const/16 v12, 0xc

    .line 1133
    .line 1134
    move-wide/from16 v23, v91

    .line 1135
    .line 1136
    goto/16 :goto_0

    .line 1137
    .line 1138
    :cond_0
    move-object/from16 v67, v0

    .line 1139
    .line 1140
    move-object/from16 v60, v1

    .line 1141
    .line 1142
    move/from16 v62, v9

    .line 1143
    .line 1144
    aget-wide v0, v60, p0

    .line 1145
    .line 1146
    sub-long/2addr v7, v0

    .line 1147
    aget-wide v0, v60, v62

    .line 1148
    .line 1149
    sub-long/2addr v10, v0

    .line 1150
    aget-wide v0, v60, v28

    .line 1151
    .line 1152
    sub-long/2addr v13, v0

    .line 1153
    aget-wide v0, v60, v31

    .line 1154
    .line 1155
    sub-long v16, v16, v0

    .line 1156
    .line 1157
    const/16 v61, 0x4

    .line 1158
    .line 1159
    aget-wide v0, v60, v61

    .line 1160
    .line 1161
    sub-long v18, v18, v0

    .line 1162
    .line 1163
    const/16 v52, 0x5

    .line 1164
    .line 1165
    aget-wide v0, v60, v52

    .line 1166
    .line 1167
    sub-long v20, v20, v0

    .line 1168
    .line 1169
    aget-wide v0, v60, v22

    .line 1170
    .line 1171
    sub-long v23, v23, v0

    .line 1172
    .line 1173
    aget-wide v0, v60, v25

    .line 1174
    .line 1175
    sub-long v26, v26, v0

    .line 1176
    .line 1177
    const/16 v34, 0x8

    .line 1178
    .line 1179
    aget-wide v0, v60, v34

    .line 1180
    .line 1181
    sub-long v29, v29, v0

    .line 1182
    .line 1183
    const/16 v78, 0x9

    .line 1184
    .line 1185
    aget-wide v0, v60, v78

    .line 1186
    .line 1187
    sub-long v32, v32, v0

    .line 1188
    .line 1189
    const/16 v40, 0xa

    .line 1190
    .line 1191
    aget-wide v0, v60, v40

    .line 1192
    .line 1193
    sub-long v35, v35, v0

    .line 1194
    .line 1195
    aget-wide v0, v60, v37

    .line 1196
    .line 1197
    sub-long v38, v38, v0

    .line 1198
    .line 1199
    const/16 v59, 0xc

    .line 1200
    .line 1201
    aget-wide v0, v60, v59

    .line 1202
    .line 1203
    sub-long v41, v41, v0

    .line 1204
    .line 1205
    const/16 v51, 0xd

    .line 1206
    .line 1207
    aget-wide v0, v60, v51

    .line 1208
    .line 1209
    aget-wide v2, v67, p0

    .line 1210
    .line 1211
    add-long/2addr v0, v2

    .line 1212
    sub-long v43, v43, v0

    .line 1213
    .line 1214
    aget-wide v0, v60, v45

    .line 1215
    .line 1216
    aget-wide v2, v67, v62

    .line 1217
    .line 1218
    add-long/2addr v0, v2

    .line 1219
    sub-long v46, v46, v0

    .line 1220
    .line 1221
    aget-wide v0, v60, v48

    .line 1222
    .line 1223
    sub-long v49, v49, v0

    .line 1224
    .line 1225
    aput-wide v7, p2, p0

    .line 1226
    .line 1227
    aput-wide v10, p2, v62

    .line 1228
    .line 1229
    aput-wide v13, p2, v28

    .line 1230
    .line 1231
    aput-wide v16, p2, v31

    .line 1232
    .line 1233
    const/16 v61, 0x4

    .line 1234
    .line 1235
    aput-wide v18, p2, v61

    .line 1236
    .line 1237
    const/16 v52, 0x5

    .line 1238
    .line 1239
    aput-wide v20, p2, v52

    .line 1240
    .line 1241
    aput-wide v23, p2, v22

    .line 1242
    .line 1243
    aput-wide v26, p2, v25

    .line 1244
    .line 1245
    const/16 v34, 0x8

    .line 1246
    .line 1247
    aput-wide v29, p2, v34

    .line 1248
    .line 1249
    const/16 v78, 0x9

    .line 1250
    .line 1251
    aput-wide v32, p2, v78

    .line 1252
    .line 1253
    const/16 v40, 0xa

    .line 1254
    .line 1255
    aput-wide v35, p2, v40

    .line 1256
    .line 1257
    aput-wide v38, p2, v37

    .line 1258
    .line 1259
    const/16 v59, 0xc

    .line 1260
    .line 1261
    aput-wide v41, p2, v59

    .line 1262
    .line 1263
    const/16 v51, 0xd

    .line 1264
    .line 1265
    aput-wide v43, p2, v51

    .line 1266
    .line 1267
    aput-wide v46, p2, v45

    .line 1268
    .line 1269
    aput-wide v49, p2, v48

    .line 1270
    .line 1271
    return-void

    .line 1272
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 1273
    .line 1274
    .line 1275
    return-void

    .line 1276
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 1277
    .line 1278
    .line 1279
    return-void
.end method

.method public encryptBlock([J[J)V
    .locals 93

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->kw:[J

    .line 4
    .line 5
    iget-object v0, v0, Lorg/spongycastle/crypto/engines/ThreefishEngine$ThreefishCipher;->t:[J

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$300()[I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->access$100()[I

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    array-length v4, v1

    .line 16
    const/16 v5, 0x21

    .line 17
    .line 18
    if-ne v4, v5, :cond_2

    .line 19
    .line 20
    array-length v4, v0

    .line 21
    const/4 v6, 0x5

    .line 22
    if-ne v4, v6, :cond_1

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aget-wide v7, p1, v4

    .line 26
    .line 27
    const/4 v9, 0x1

    .line 28
    aget-wide v10, p1, v9

    .line 29
    .line 30
    const/4 v12, 0x2

    .line 31
    aget-wide v13, p1, v12

    .line 32
    .line 33
    const/4 v15, 0x3

    .line 34
    aget-wide v16, p1, v15

    .line 35
    .line 36
    move/from16 p0, v4

    .line 37
    .line 38
    const/4 v4, 0x4

    .line 39
    aget-wide v18, p1, v4

    .line 40
    .line 41
    aget-wide v20, p1, v6

    .line 42
    .line 43
    const/16 v22, 0x6

    .line 44
    .line 45
    aget-wide v23, p1, v22

    .line 46
    .line 47
    const/16 v25, 0x7

    .line 48
    .line 49
    aget-wide v26, p1, v25

    .line 50
    .line 51
    move/from16 v28, v9

    .line 52
    .line 53
    const/16 v9, 0x8

    .line 54
    .line 55
    aget-wide v29, p1, v9

    .line 56
    .line 57
    move/from16 v31, v12

    .line 58
    .line 59
    const/16 v12, 0x9

    .line 60
    .line 61
    aget-wide v32, p1, v12

    .line 62
    .line 63
    move/from16 v34, v15

    .line 64
    .line 65
    const/16 v15, 0xa

    .line 66
    .line 67
    aget-wide v35, p1, v15

    .line 68
    .line 69
    const/16 v37, 0xb

    .line 70
    .line 71
    aget-wide v38, p1, v37

    .line 72
    .line 73
    move/from16 v40, v12

    .line 74
    .line 75
    const/16 v12, 0xc

    .line 76
    .line 77
    aget-wide v41, p1, v12

    .line 78
    .line 79
    move/from16 v43, v12

    .line 80
    .line 81
    const/16 v12, 0xd

    .line 82
    .line 83
    aget-wide v44, p1, v12

    .line 84
    .line 85
    const/16 v46, 0xe

    .line 86
    .line 87
    aget-wide v47, p1, v46

    .line 88
    .line 89
    const/16 v49, 0xf

    .line 90
    .line 91
    aget-wide v50, p1, v49

    .line 92
    .line 93
    aget-wide v52, v1, p0

    .line 94
    .line 95
    add-long v7, v7, v52

    .line 96
    .line 97
    aget-wide v52, v1, v28

    .line 98
    .line 99
    add-long v10, v10, v52

    .line 100
    .line 101
    aget-wide v52, v1, v31

    .line 102
    .line 103
    add-long v13, v13, v52

    .line 104
    .line 105
    aget-wide v52, v1, v34

    .line 106
    .line 107
    add-long v16, v16, v52

    .line 108
    .line 109
    aget-wide v52, v1, v4

    .line 110
    .line 111
    add-long v18, v18, v52

    .line 112
    .line 113
    aget-wide v52, v1, v6

    .line 114
    .line 115
    add-long v20, v20, v52

    .line 116
    .line 117
    aget-wide v52, v1, v22

    .line 118
    .line 119
    add-long v23, v23, v52

    .line 120
    .line 121
    aget-wide v52, v1, v25

    .line 122
    .line 123
    add-long v26, v26, v52

    .line 124
    .line 125
    aget-wide v52, v1, v9

    .line 126
    .line 127
    add-long v29, v29, v52

    .line 128
    .line 129
    aget-wide v52, v1, v40

    .line 130
    .line 131
    add-long v32, v32, v52

    .line 132
    .line 133
    aget-wide v52, v1, v15

    .line 134
    .line 135
    add-long v35, v35, v52

    .line 136
    .line 137
    aget-wide v52, v1, v37

    .line 138
    .line 139
    add-long v38, v38, v52

    .line 140
    .line 141
    aget-wide v52, v1, v43

    .line 142
    .line 143
    add-long v41, v41, v52

    .line 144
    .line 145
    aget-wide v52, v1, v12

    .line 146
    .line 147
    aget-wide v54, v0, p0

    .line 148
    .line 149
    add-long v52, v52, v54

    .line 150
    .line 151
    add-long v44, v44, v52

    .line 152
    .line 153
    aget-wide v52, v1, v46

    .line 154
    .line 155
    aget-wide v54, v0, v28

    .line 156
    .line 157
    add-long v52, v52, v54

    .line 158
    .line 159
    add-long v47, v47, v52

    .line 160
    .line 161
    aget-wide v52, v1, v49

    .line 162
    .line 163
    add-long v50, v50, v52

    .line 164
    .line 165
    move-wide/from16 v4, v20

    .line 166
    .line 167
    move-wide/from16 v56, v26

    .line 168
    .line 169
    move-wide/from16 v58, v32

    .line 170
    .line 171
    move-wide/from16 v60, v38

    .line 172
    .line 173
    move-wide/from16 v62, v44

    .line 174
    .line 175
    move-wide/from16 v64, v50

    .line 176
    .line 177
    move-wide/from16 v19, v18

    .line 178
    .line 179
    move-wide/from16 v91, v7

    .line 180
    .line 181
    move/from16 v8, v28

    .line 182
    .line 183
    move-wide/from16 v6, v16

    .line 184
    .line 185
    move-wide/from16 v17, v91

    .line 186
    .line 187
    :goto_0
    const/16 v15, 0x14

    .line 188
    .line 189
    if-ge v8, v15, :cond_0

    .line 190
    .line 191
    aget v27, v2, v8

    .line 192
    .line 193
    aget v32, v3, v8

    .line 194
    .line 195
    move-wide/from16 v38, v13

    .line 196
    .line 197
    add-long v12, v17, v10

    .line 198
    .line 199
    const/16 v14, 0x18

    .line 200
    .line 201
    invoke-static {v10, v11, v14, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 202
    .line 203
    .line 204
    move-result-wide v10

    .line 205
    move-wide/from16 v17, v10

    .line 206
    .line 207
    add-long v9, v38, v6

    .line 208
    .line 209
    const/16 v11, 0xd

    .line 210
    .line 211
    invoke-static {v6, v7, v11, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 212
    .line 213
    .line 214
    move-result-wide v6

    .line 215
    add-long v14, v19, v4

    .line 216
    .line 217
    const/16 v11, 0x8

    .line 218
    .line 219
    invoke-static {v4, v5, v11, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 220
    .line 221
    .line 222
    move-result-wide v4

    .line 223
    move-wide/from16 v50, v12

    .line 224
    .line 225
    move-wide/from16 v19, v14

    .line 226
    .line 227
    move-wide/from16 v11, v56

    .line 228
    .line 229
    add-long v13, v23, v11

    .line 230
    .line 231
    const/16 v15, 0x2f

    .line 232
    .line 233
    invoke-static {v11, v12, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 234
    .line 235
    .line 236
    move-result-wide v11

    .line 237
    move-object/from16 v52, v0

    .line 238
    .line 239
    move-object/from16 v45, v1

    .line 240
    .line 241
    move-object/from16 v53, v2

    .line 242
    .line 243
    move-object/from16 v54, v3

    .line 244
    .line 245
    move-wide/from16 v0, v58

    .line 246
    .line 247
    add-long v2, v29, v0

    .line 248
    .line 249
    const/16 v15, 0x8

    .line 250
    .line 251
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 252
    .line 253
    .line 254
    move-result-wide v0

    .line 255
    move-wide/from16 v29, v2

    .line 256
    .line 257
    move-wide/from16 v38, v9

    .line 258
    .line 259
    move-wide/from16 v2, v60

    .line 260
    .line 261
    add-long v9, v35, v2

    .line 262
    .line 263
    const/16 v15, 0x11

    .line 264
    .line 265
    invoke-static {v2, v3, v15, v9, v10}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 266
    .line 267
    .line 268
    move-result-wide v2

    .line 269
    move-wide/from16 v35, v9

    .line 270
    .line 271
    move-wide/from16 v56, v13

    .line 272
    .line 273
    move-wide/from16 v9, v62

    .line 274
    .line 275
    add-long v13, v41, v9

    .line 276
    .line 277
    const/16 v15, 0x16

    .line 278
    .line 279
    invoke-static {v9, v10, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 280
    .line 281
    .line 282
    move-result-wide v9

    .line 283
    move-wide/from16 v58, v4

    .line 284
    .line 285
    move-wide/from16 v41, v13

    .line 286
    .line 287
    move-wide/from16 v13, v64

    .line 288
    .line 289
    add-long v4, v47, v13

    .line 290
    .line 291
    const/16 v15, 0x25

    .line 292
    .line 293
    invoke-static {v13, v14, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 294
    .line 295
    .line 296
    move-result-wide v13

    .line 297
    move-wide/from16 v47, v4

    .line 298
    .line 299
    add-long v4, v50, v0

    .line 300
    .line 301
    const/16 v15, 0x26

    .line 302
    .line 303
    invoke-static {v0, v1, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 304
    .line 305
    .line 306
    move-result-wide v0

    .line 307
    move-wide/from16 v60, v4

    .line 308
    .line 309
    add-long v4, v38, v9

    .line 310
    .line 311
    const/16 v15, 0x13

    .line 312
    .line 313
    invoke-static {v9, v10, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 314
    .line 315
    .line 316
    move-result-wide v9

    .line 317
    move-wide/from16 v38, v4

    .line 318
    .line 319
    add-long v4, v56, v2

    .line 320
    .line 321
    const/16 v15, 0xa

    .line 322
    .line 323
    invoke-static {v2, v3, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 324
    .line 325
    .line 326
    move-result-wide v2

    .line 327
    move-wide/from16 v56, v4

    .line 328
    .line 329
    add-long v4, v19, v13

    .line 330
    .line 331
    const/16 v15, 0x37

    .line 332
    .line 333
    invoke-static {v13, v14, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 334
    .line 335
    .line 336
    move-result-wide v13

    .line 337
    move-wide/from16 v19, v4

    .line 338
    .line 339
    add-long v4, v35, v11

    .line 340
    .line 341
    const/16 v15, 0x31

    .line 342
    .line 343
    invoke-static {v11, v12, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 344
    .line 345
    .line 346
    move-result-wide v11

    .line 347
    move-wide/from16 v35, v4

    .line 348
    .line 349
    add-long v4, v41, v6

    .line 350
    .line 351
    const/16 v15, 0x12

    .line 352
    .line 353
    invoke-static {v6, v7, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 354
    .line 355
    .line 356
    move-result-wide v6

    .line 357
    move-wide/from16 v41, v4

    .line 358
    .line 359
    add-long v4, v47, v58

    .line 360
    .line 361
    const/16 v15, 0x17

    .line 362
    .line 363
    move-wide/from16 v47, v0

    .line 364
    .line 365
    move-wide/from16 v0, v58

    .line 366
    .line 367
    invoke-static {v0, v1, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 368
    .line 369
    .line 370
    move-result-wide v0

    .line 371
    move-wide/from16 v58, v4

    .line 372
    .line 373
    add-long v4, v29, v17

    .line 374
    .line 375
    const/16 v15, 0x34

    .line 376
    .line 377
    move-wide/from16 v62, v2

    .line 378
    .line 379
    move-wide/from16 v2, v17

    .line 380
    .line 381
    invoke-static {v2, v3, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 382
    .line 383
    .line 384
    move-result-wide v2

    .line 385
    move-wide/from16 v17, v4

    .line 386
    .line 387
    add-long v4, v60, v11

    .line 388
    .line 389
    const/16 v15, 0x21

    .line 390
    .line 391
    invoke-static {v11, v12, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 392
    .line 393
    .line 394
    move-result-wide v11

    .line 395
    move-wide/from16 v60, v4

    .line 396
    .line 397
    add-long v4, v38, v0

    .line 398
    .line 399
    const/4 v15, 0x4

    .line 400
    invoke-static {v0, v1, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 401
    .line 402
    .line 403
    move-result-wide v0

    .line 404
    move-wide/from16 v38, v4

    .line 405
    .line 406
    add-long v4, v19, v6

    .line 407
    .line 408
    const/16 v15, 0x33

    .line 409
    .line 410
    invoke-static {v6, v7, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 411
    .line 412
    .line 413
    move-result-wide v6

    .line 414
    move-wide/from16 v19, v4

    .line 415
    .line 416
    add-long v4, v56, v2

    .line 417
    .line 418
    const/16 v15, 0xd

    .line 419
    .line 420
    invoke-static {v2, v3, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 421
    .line 422
    .line 423
    move-result-wide v2

    .line 424
    move-wide/from16 v64, v4

    .line 425
    .line 426
    add-long v4, v41, v13

    .line 427
    .line 428
    const/16 v15, 0x22

    .line 429
    .line 430
    invoke-static {v13, v14, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 431
    .line 432
    .line 433
    move-result-wide v13

    .line 434
    move-wide/from16 v41, v4

    .line 435
    .line 436
    add-long v4, v58, v9

    .line 437
    .line 438
    const/16 v15, 0x29

    .line 439
    .line 440
    invoke-static {v9, v10, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 441
    .line 442
    .line 443
    move-result-wide v9

    .line 444
    move-wide/from16 v58, v4

    .line 445
    .line 446
    add-long v4, v17, v62

    .line 447
    .line 448
    const/16 v15, 0x3b

    .line 449
    .line 450
    move-wide/from16 v66, v11

    .line 451
    .line 452
    move-wide/from16 v11, v62

    .line 453
    .line 454
    invoke-static {v11, v12, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 455
    .line 456
    .line 457
    move-result-wide v11

    .line 458
    move-wide/from16 v62, v4

    .line 459
    .line 460
    add-long v4, v35, v47

    .line 461
    .line 462
    move-wide/from16 v35, v6

    .line 463
    .line 464
    move-wide/from16 v6, v47

    .line 465
    .line 466
    const/16 v15, 0x11

    .line 467
    .line 468
    invoke-static {v6, v7, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 469
    .line 470
    .line 471
    move-result-wide v6

    .line 472
    move-wide/from16 v47, v4

    .line 473
    .line 474
    add-long v4, v60, v13

    .line 475
    .line 476
    const/4 v15, 0x5

    .line 477
    invoke-static {v13, v14, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 478
    .line 479
    .line 480
    move-result-wide v13

    .line 481
    move-wide/from16 v60, v4

    .line 482
    .line 483
    add-long v4, v38, v11

    .line 484
    .line 485
    const/16 v15, 0x14

    .line 486
    .line 487
    invoke-static {v11, v12, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 488
    .line 489
    .line 490
    move-result-wide v11

    .line 491
    move-wide/from16 v38, v4

    .line 492
    .line 493
    add-long v4, v64, v9

    .line 494
    .line 495
    const/16 v15, 0x30

    .line 496
    .line 497
    invoke-static {v9, v10, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 498
    .line 499
    .line 500
    move-result-wide v9

    .line 501
    move-wide/from16 v64, v4

    .line 502
    .line 503
    add-long v4, v19, v6

    .line 504
    .line 505
    const/16 v15, 0x29

    .line 506
    .line 507
    invoke-static {v6, v7, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 508
    .line 509
    .line 510
    move-result-wide v6

    .line 511
    move-wide/from16 v19, v4

    .line 512
    .line 513
    add-long v4, v58, v2

    .line 514
    .line 515
    const/16 v15, 0x2f

    .line 516
    .line 517
    invoke-static {v2, v3, v15, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 518
    .line 519
    .line 520
    move-result-wide v2

    .line 521
    move-wide/from16 v58, v2

    .line 522
    .line 523
    add-long v2, v62, v0

    .line 524
    .line 525
    const/16 v15, 0x1c

    .line 526
    .line 527
    invoke-static {v0, v1, v15, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 528
    .line 529
    .line 530
    move-result-wide v0

    .line 531
    move-wide/from16 v62, v0

    .line 532
    .line 533
    add-long v0, v47, v35

    .line 534
    .line 535
    const/16 v15, 0x10

    .line 536
    .line 537
    move-wide/from16 v47, v2

    .line 538
    .line 539
    move-wide/from16 v2, v35

    .line 540
    .line 541
    invoke-static {v2, v3, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 542
    .line 543
    .line 544
    move-result-wide v2

    .line 545
    move-wide/from16 v35, v0

    .line 546
    .line 547
    add-long v0, v41, v66

    .line 548
    .line 549
    const/16 v15, 0x19

    .line 550
    .line 551
    move-wide/from16 v41, v2

    .line 552
    .line 553
    move-wide/from16 v2, v66

    .line 554
    .line 555
    invoke-static {v2, v3, v15, v0, v1}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 556
    .line 557
    .line 558
    move-result-wide v2

    .line 559
    aget-wide v66, v45, v27

    .line 560
    .line 561
    add-long v60, v60, v66

    .line 562
    .line 563
    add-int/lit8 v66, v27, 0x1

    .line 564
    .line 565
    aget-wide v67, v45, v66

    .line 566
    .line 567
    move-wide/from16 v69, v0

    .line 568
    .line 569
    add-long v0, v58, v67

    .line 570
    .line 571
    add-int/lit8 v58, v27, 0x2

    .line 572
    .line 573
    aget-wide v67, v45, v58

    .line 574
    .line 575
    add-long v38, v38, v67

    .line 576
    .line 577
    add-int/lit8 v59, v27, 0x3

    .line 578
    .line 579
    aget-wide v67, v45, v59

    .line 580
    .line 581
    move-wide/from16 v71, v2

    .line 582
    .line 583
    add-long v2, v41, v67

    .line 584
    .line 585
    add-int/lit8 v41, v27, 0x4

    .line 586
    .line 587
    aget-wide v67, v45, v41

    .line 588
    .line 589
    add-long v19, v19, v67

    .line 590
    .line 591
    add-int/lit8 v42, v27, 0x5

    .line 592
    .line 593
    aget-wide v67, v45, v42

    .line 594
    .line 595
    move-wide/from16 v73, v4

    .line 596
    .line 597
    add-long v4, v62, v67

    .line 598
    .line 599
    add-int/lit8 v62, v27, 0x6

    .line 600
    .line 601
    aget-wide v67, v45, v62

    .line 602
    .line 603
    add-long v63, v64, v67

    .line 604
    .line 605
    add-int/lit8 v65, v27, 0x7

    .line 606
    .line 607
    aget-wide v67, v45, v65

    .line 608
    .line 609
    move-wide/from16 v75, v6

    .line 610
    .line 611
    add-long v6, v71, v67

    .line 612
    .line 613
    add-int/lit8 v67, v27, 0x8

    .line 614
    .line 615
    aget-wide v71, v45, v67

    .line 616
    .line 617
    add-long v47, v47, v71

    .line 618
    .line 619
    add-int/lit8 v68, v27, 0x9

    .line 620
    .line 621
    aget-wide v71, v45, v68

    .line 622
    .line 623
    move-wide/from16 v77, v9

    .line 624
    .line 625
    add-long v9, v75, v71

    .line 626
    .line 627
    add-int/lit8 v71, v27, 0xa

    .line 628
    .line 629
    aget-wide v75, v45, v71

    .line 630
    .line 631
    add-long v35, v35, v75

    .line 632
    .line 633
    add-int/lit8 v72, v27, 0xb

    .line 634
    .line 635
    aget-wide v75, v45, v72

    .line 636
    .line 637
    add-long v11, v11, v75

    .line 638
    .line 639
    add-int/lit8 v75, v27, 0xc

    .line 640
    .line 641
    aget-wide v79, v45, v75

    .line 642
    .line 643
    add-long v69, v69, v79

    .line 644
    .line 645
    add-int/lit8 v76, v27, 0xd

    .line 646
    .line 647
    aget-wide v79, v45, v76

    .line 648
    .line 649
    aget-wide v81, v52, v32

    .line 650
    .line 651
    add-long v79, v79, v81

    .line 652
    .line 653
    move-wide/from16 v81, v13

    .line 654
    .line 655
    add-long v13, v77, v79

    .line 656
    .line 657
    add-int/lit8 v77, v27, 0xe

    .line 658
    .line 659
    aget-wide v78, v45, v77

    .line 660
    .line 661
    add-int/lit8 v80, v32, 0x1

    .line 662
    .line 663
    aget-wide v83, v52, v80

    .line 664
    .line 665
    add-long v78, v78, v83

    .line 666
    .line 667
    add-long v73, v73, v78

    .line 668
    .line 669
    add-int/lit8 v78, v27, 0xf

    .line 670
    .line 671
    aget-wide v83, v45, v78

    .line 672
    .line 673
    move-wide/from16 v85, v13

    .line 674
    .line 675
    int-to-long v13, v8

    .line 676
    add-long v83, v83, v13

    .line 677
    .line 678
    move-wide/from16 v87, v13

    .line 679
    .line 680
    add-long v13, v81, v83

    .line 681
    .line 682
    move-wide/from16 v81, v13

    .line 683
    .line 684
    add-long v13, v60, v0

    .line 685
    .line 686
    const/16 v15, 0x29

    .line 687
    .line 688
    invoke-static {v0, v1, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 689
    .line 690
    .line 691
    move-result-wide v0

    .line 692
    move-wide/from16 v83, v13

    .line 693
    .line 694
    add-long v13, v38, v2

    .line 695
    .line 696
    move/from16 v15, v40

    .line 697
    .line 698
    invoke-static {v2, v3, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 699
    .line 700
    .line 701
    move-result-wide v2

    .line 702
    move-wide/from16 v38, v13

    .line 703
    .line 704
    add-long v13, v19, v4

    .line 705
    .line 706
    const/16 v15, 0x25

    .line 707
    .line 708
    invoke-static {v4, v5, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 709
    .line 710
    .line 711
    move-result-wide v4

    .line 712
    move-wide/from16 v19, v13

    .line 713
    .line 714
    add-long v13, v63, v6

    .line 715
    .line 716
    const/16 v15, 0x1f

    .line 717
    .line 718
    invoke-static {v6, v7, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 719
    .line 720
    .line 721
    move-result-wide v6

    .line 722
    move-wide/from16 v63, v13

    .line 723
    .line 724
    add-long v13, v47, v9

    .line 725
    .line 726
    move/from16 v15, v43

    .line 727
    .line 728
    invoke-static {v9, v10, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 729
    .line 730
    .line 731
    move-result-wide v9

    .line 732
    move-wide/from16 v89, v13

    .line 733
    .line 734
    add-long v13, v35, v11

    .line 735
    .line 736
    const/16 v15, 0x2f

    .line 737
    .line 738
    invoke-static {v11, v12, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 739
    .line 740
    .line 741
    move-result-wide v11

    .line 742
    move-wide/from16 v35, v13

    .line 743
    .line 744
    add-long v13, v69, v85

    .line 745
    .line 746
    const/16 v15, 0x2c

    .line 747
    .line 748
    move-wide/from16 v69, v0

    .line 749
    .line 750
    move-wide/from16 v0, v85

    .line 751
    .line 752
    invoke-static {v0, v1, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 753
    .line 754
    .line 755
    move-result-wide v0

    .line 756
    move-wide/from16 v85, v13

    .line 757
    .line 758
    add-long v13, v73, v81

    .line 759
    .line 760
    const/16 v15, 0x1e

    .line 761
    .line 762
    move-wide/from16 v73, v4

    .line 763
    .line 764
    move-wide/from16 v4, v81

    .line 765
    .line 766
    invoke-static {v4, v5, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 767
    .line 768
    .line 769
    move-result-wide v4

    .line 770
    move-wide/from16 v81, v13

    .line 771
    .line 772
    add-long v13, v83, v9

    .line 773
    .line 774
    const/16 v15, 0x10

    .line 775
    .line 776
    invoke-static {v9, v10, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 777
    .line 778
    .line 779
    move-result-wide v9

    .line 780
    move-wide/from16 v83, v13

    .line 781
    .line 782
    add-long v13, v38, v0

    .line 783
    .line 784
    const/16 v15, 0x22

    .line 785
    .line 786
    invoke-static {v0, v1, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 787
    .line 788
    .line 789
    move-result-wide v0

    .line 790
    move-wide/from16 v38, v13

    .line 791
    .line 792
    add-long v13, v63, v11

    .line 793
    .line 794
    const/16 v15, 0x38

    .line 795
    .line 796
    invoke-static {v11, v12, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 797
    .line 798
    .line 799
    move-result-wide v11

    .line 800
    move-wide/from16 v63, v13

    .line 801
    .line 802
    add-long v13, v19, v4

    .line 803
    .line 804
    const/16 v15, 0x33

    .line 805
    .line 806
    invoke-static {v4, v5, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 807
    .line 808
    .line 809
    move-result-wide v4

    .line 810
    move-wide/from16 v19, v13

    .line 811
    .line 812
    add-long v13, v35, v6

    .line 813
    .line 814
    const/4 v15, 0x4

    .line 815
    invoke-static {v6, v7, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 816
    .line 817
    .line 818
    move-result-wide v6

    .line 819
    move-wide/from16 v35, v13

    .line 820
    .line 821
    add-long v13, v85, v2

    .line 822
    .line 823
    const/16 v15, 0x35

    .line 824
    .line 825
    invoke-static {v2, v3, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 826
    .line 827
    .line 828
    move-result-wide v2

    .line 829
    move-wide/from16 v56, v13

    .line 830
    .line 831
    add-long v13, v81, v73

    .line 832
    .line 833
    const/16 v15, 0x2a

    .line 834
    .line 835
    move/from16 v61, v8

    .line 836
    .line 837
    move-wide/from16 v81, v9

    .line 838
    .line 839
    move-wide/from16 v8, v73

    .line 840
    .line 841
    invoke-static {v8, v9, v15, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 842
    .line 843
    .line 844
    move-result-wide v8

    .line 845
    move-wide/from16 v73, v13

    .line 846
    .line 847
    add-long v13, v89, v69

    .line 848
    .line 849
    move-wide/from16 v85, v11

    .line 850
    .line 851
    move-wide/from16 v10, v69

    .line 852
    .line 853
    const/16 v12, 0x29

    .line 854
    .line 855
    invoke-static {v10, v11, v12, v13, v14}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 856
    .line 857
    .line 858
    move-result-wide v10

    .line 859
    move-wide/from16 v69, v13

    .line 860
    .line 861
    add-long v12, v83, v6

    .line 862
    .line 863
    const/16 v14, 0x1f

    .line 864
    .line 865
    invoke-static {v6, v7, v14, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 866
    .line 867
    .line 868
    move-result-wide v6

    .line 869
    move-wide/from16 v83, v12

    .line 870
    .line 871
    add-long v12, v38, v8

    .line 872
    .line 873
    const/16 v14, 0x2c

    .line 874
    .line 875
    invoke-static {v8, v9, v14, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 876
    .line 877
    .line 878
    move-result-wide v8

    .line 879
    add-long v14, v19, v2

    .line 880
    .line 881
    move-wide/from16 v19, v12

    .line 882
    .line 883
    const/16 v12, 0x2f

    .line 884
    .line 885
    invoke-static {v2, v3, v12, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 886
    .line 887
    .line 888
    move-result-wide v2

    .line 889
    add-long v12, v63, v10

    .line 890
    .line 891
    move-wide/from16 v38, v14

    .line 892
    .line 893
    const/16 v14, 0x2e

    .line 894
    .line 895
    invoke-static {v10, v11, v14, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 896
    .line 897
    .line 898
    move-result-wide v10

    .line 899
    add-long v14, v56, v4

    .line 900
    .line 901
    move-wide/from16 v56, v12

    .line 902
    .line 903
    const/16 v12, 0x13

    .line 904
    .line 905
    invoke-static {v4, v5, v12, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 906
    .line 907
    .line 908
    move-result-wide v4

    .line 909
    add-long v12, v73, v0

    .line 910
    .line 911
    move-wide/from16 v63, v14

    .line 912
    .line 913
    const/16 v14, 0x2a

    .line 914
    .line 915
    invoke-static {v0, v1, v14, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 916
    .line 917
    .line 918
    move-result-wide v0

    .line 919
    add-long v14, v69, v85

    .line 920
    .line 921
    move-wide/from16 v73, v6

    .line 922
    .line 923
    move-wide/from16 v69, v12

    .line 924
    .line 925
    move-wide/from16 v12, v85

    .line 926
    .line 927
    const/16 v6, 0x2c

    .line 928
    .line 929
    invoke-static {v12, v13, v6, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 930
    .line 931
    .line 932
    move-result-wide v6

    .line 933
    add-long v12, v35, v81

    .line 934
    .line 935
    move-wide/from16 v35, v14

    .line 936
    .line 937
    move-wide/from16 v14, v81

    .line 938
    .line 939
    move-wide/from16 v81, v2

    .line 940
    .line 941
    const/16 v2, 0x19

    .line 942
    .line 943
    invoke-static {v14, v15, v2, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 944
    .line 945
    .line 946
    move-result-wide v2

    .line 947
    add-long v14, v83, v4

    .line 948
    .line 949
    move-wide/from16 v83, v12

    .line 950
    .line 951
    const/16 v12, 0x9

    .line 952
    .line 953
    invoke-static {v4, v5, v12, v14, v15}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 954
    .line 955
    .line 956
    move-result-wide v4

    .line 957
    add-long v12, v19, v6

    .line 958
    .line 959
    move-wide/from16 v19, v4

    .line 960
    .line 961
    const/16 v4, 0x30

    .line 962
    .line 963
    invoke-static {v6, v7, v4, v12, v13}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 964
    .line 965
    .line 966
    move-result-wide v4

    .line 967
    add-long v6, v56, v0

    .line 968
    .line 969
    move-wide/from16 v17, v4

    .line 970
    .line 971
    const/16 v4, 0x23

    .line 972
    .line 973
    invoke-static {v0, v1, v4, v6, v7}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 974
    .line 975
    .line 976
    move-result-wide v0

    .line 977
    add-long v4, v38, v2

    .line 978
    .line 979
    move-wide/from16 v38, v0

    .line 980
    .line 981
    const/16 v0, 0x34

    .line 982
    .line 983
    invoke-static {v2, v3, v0, v4, v5}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 984
    .line 985
    .line 986
    move-result-wide v0

    .line 987
    add-long v2, v69, v10

    .line 988
    .line 989
    move-wide/from16 v56, v0

    .line 990
    .line 991
    const/16 v0, 0x17

    .line 992
    .line 993
    invoke-static {v10, v11, v0, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 994
    .line 995
    .line 996
    move-result-wide v0

    .line 997
    add-long v10, v35, v8

    .line 998
    .line 999
    move-wide/from16 v29, v0

    .line 1000
    .line 1001
    const/16 v0, 0x1f

    .line 1002
    .line 1003
    invoke-static {v8, v9, v0, v10, v11}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 1004
    .line 1005
    .line 1006
    move-result-wide v0

    .line 1007
    add-long v8, v83, v81

    .line 1008
    .line 1009
    move-wide/from16 v35, v0

    .line 1010
    .line 1011
    move-wide/from16 v47, v2

    .line 1012
    .line 1013
    move-wide/from16 v0, v81

    .line 1014
    .line 1015
    const/16 v2, 0x25

    .line 1016
    .line 1017
    invoke-static {v0, v1, v2, v8, v9}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 1018
    .line 1019
    .line 1020
    move-result-wide v0

    .line 1021
    add-long v2, v63, v73

    .line 1022
    .line 1023
    move-wide/from16 v50, v0

    .line 1024
    .line 1025
    move-wide/from16 v63, v4

    .line 1026
    .line 1027
    move-wide/from16 v0, v73

    .line 1028
    .line 1029
    const/16 v4, 0x14

    .line 1030
    .line 1031
    invoke-static {v0, v1, v4, v2, v3}, Lorg/spongycastle/crypto/engines/ThreefishEngine;->rotlXor(JIJ)J

    .line 1032
    .line 1033
    .line 1034
    move-result-wide v0

    .line 1035
    aget-wide v4, v45, v66

    .line 1036
    .line 1037
    add-long/2addr v4, v14

    .line 1038
    aget-wide v14, v45, v58

    .line 1039
    .line 1040
    add-long v14, v29, v14

    .line 1041
    .line 1042
    aget-wide v29, v45, v59

    .line 1043
    .line 1044
    add-long v12, v12, v29

    .line 1045
    .line 1046
    aget-wide v29, v45, v41

    .line 1047
    .line 1048
    add-long v29, v50, v29

    .line 1049
    .line 1050
    aget-wide v41, v45, v42

    .line 1051
    .line 1052
    add-long v41, v63, v41

    .line 1053
    .line 1054
    aget-wide v50, v45, v62

    .line 1055
    .line 1056
    add-long v35, v35, v50

    .line 1057
    .line 1058
    aget-wide v50, v45, v65

    .line 1059
    .line 1060
    add-long v6, v6, v50

    .line 1061
    .line 1062
    aget-wide v50, v45, v67

    .line 1063
    .line 1064
    add-long v0, v0, v50

    .line 1065
    .line 1066
    aget-wide v50, v45, v68

    .line 1067
    .line 1068
    add-long v10, v10, v50

    .line 1069
    .line 1070
    aget-wide v50, v45, v71

    .line 1071
    .line 1072
    add-long v58, v56, v50

    .line 1073
    .line 1074
    aget-wide v50, v45, v72

    .line 1075
    .line 1076
    add-long v8, v8, v50

    .line 1077
    .line 1078
    aget-wide v50, v45, v75

    .line 1079
    .line 1080
    add-long v17, v17, v50

    .line 1081
    .line 1082
    aget-wide v50, v45, v76

    .line 1083
    .line 1084
    add-long v2, v2, v50

    .line 1085
    .line 1086
    aget-wide v50, v45, v77

    .line 1087
    .line 1088
    aget-wide v56, v52, v80

    .line 1089
    .line 1090
    add-long v50, v50, v56

    .line 1091
    .line 1092
    add-long v62, v38, v50

    .line 1093
    .line 1094
    aget-wide v38, v45, v78

    .line 1095
    .line 1096
    add-int/lit8 v32, v32, 0x2

    .line 1097
    .line 1098
    aget-wide v50, v52, v32

    .line 1099
    .line 1100
    add-long v38, v38, v50

    .line 1101
    .line 1102
    add-long v47, v47, v38

    .line 1103
    .line 1104
    const/16 v24, 0x10

    .line 1105
    .line 1106
    add-int/lit8 v27, v27, 0x10

    .line 1107
    .line 1108
    aget-wide v23, v45, v27

    .line 1109
    .line 1110
    add-long v23, v23, v87

    .line 1111
    .line 1112
    const-wide/16 v38, 0x1

    .line 1113
    .line 1114
    add-long v23, v23, v38

    .line 1115
    .line 1116
    add-long v64, v19, v23

    .line 1117
    .line 1118
    add-int/lit8 v19, v61, 0x2

    .line 1119
    .line 1120
    move-wide/from16 v56, v0

    .line 1121
    .line 1122
    move-wide/from16 v23, v6

    .line 1123
    .line 1124
    move-wide/from16 v60, v17

    .line 1125
    .line 1126
    move-wide/from16 v6, v29

    .line 1127
    .line 1128
    move-object/from16 v1, v45

    .line 1129
    .line 1130
    move-object/from16 v0, v52

    .line 1131
    .line 1132
    const/16 v40, 0x9

    .line 1133
    .line 1134
    const/16 v43, 0xc

    .line 1135
    .line 1136
    move-wide/from16 v17, v4

    .line 1137
    .line 1138
    move-wide/from16 v29, v10

    .line 1139
    .line 1140
    move-wide v10, v14

    .line 1141
    move-wide/from16 v4, v35

    .line 1142
    .line 1143
    move-wide/from16 v35, v8

    .line 1144
    .line 1145
    move-wide v13, v12

    .line 1146
    move/from16 v8, v19

    .line 1147
    .line 1148
    move-wide/from16 v19, v41

    .line 1149
    .line 1150
    const/16 v9, 0x8

    .line 1151
    .line 1152
    const/16 v12, 0xd

    .line 1153
    .line 1154
    move-wide/from16 v41, v2

    .line 1155
    .line 1156
    move-object/from16 v2, v53

    .line 1157
    .line 1158
    move-object/from16 v3, v54

    .line 1159
    .line 1160
    goto/16 :goto_0

    .line 1161
    .line 1162
    :cond_0
    move-wide/from16 v50, v10

    .line 1163
    .line 1164
    move-wide/from16 v38, v13

    .line 1165
    .line 1166
    move-wide/from16 v11, v56

    .line 1167
    .line 1168
    move-wide/from16 v0, v58

    .line 1169
    .line 1170
    move-wide/from16 v2, v60

    .line 1171
    .line 1172
    move-wide/from16 v9, v62

    .line 1173
    .line 1174
    move-wide/from16 v13, v64

    .line 1175
    .line 1176
    aput-wide v17, p2, p0

    .line 1177
    .line 1178
    aput-wide v50, p2, v28

    .line 1179
    .line 1180
    aput-wide v38, p2, v31

    .line 1181
    .line 1182
    aput-wide v6, p2, v34

    .line 1183
    .line 1184
    const/16 v21, 0x4

    .line 1185
    .line 1186
    aput-wide v19, p2, v21

    .line 1187
    .line 1188
    const/16 v16, 0x5

    .line 1189
    .line 1190
    aput-wide v4, p2, v16

    .line 1191
    .line 1192
    aput-wide v23, p2, v22

    .line 1193
    .line 1194
    aput-wide v11, p2, v25

    .line 1195
    .line 1196
    const/16 v15, 0x8

    .line 1197
    .line 1198
    aput-wide v29, p2, v15

    .line 1199
    .line 1200
    const/16 v40, 0x9

    .line 1201
    .line 1202
    aput-wide v0, p2, v40

    .line 1203
    .line 1204
    const/16 v26, 0xa

    .line 1205
    .line 1206
    aput-wide v35, p2, v26

    .line 1207
    .line 1208
    aput-wide v2, p2, v37

    .line 1209
    .line 1210
    const/16 v43, 0xc

    .line 1211
    .line 1212
    aput-wide v41, p2, v43

    .line 1213
    .line 1214
    const/16 v33, 0xd

    .line 1215
    .line 1216
    aput-wide v9, p2, v33

    .line 1217
    .line 1218
    aput-wide v47, p2, v46

    .line 1219
    .line 1220
    aput-wide v13, p2, v49

    .line 1221
    .line 1222
    return-void

    .line 1223
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 1224
    .line 1225
    .line 1226
    return-void

    .line 1227
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 1228
    .line 1229
    .line 1230
    return-void
.end method

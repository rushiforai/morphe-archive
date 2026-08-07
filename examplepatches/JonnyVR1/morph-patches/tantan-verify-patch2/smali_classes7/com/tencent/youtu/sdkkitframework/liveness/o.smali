.class public Lcom/tencent/youtu/sdkkitframework/liveness/o;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/liveness/o$a;
    }
.end annotation


# static fields
.field public static a:I

.field public static b:I


# direct methods
.method public static a([FLcom/tencent/youtu/sdkkitframework/liveness/o$a;)I
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "o"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, "[YTFaceTraceInterface.blockJudge] input pointsVis is null."

    .line 9
    .line 10
    invoke-static {v2, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    return v0

    .line 15
    :cond_0
    array-length v3, v0

    .line 16
    const/16 v4, 0x5a

    .line 17
    .line 18
    if-eq v3, v4, :cond_1

    .line 19
    .line 20
    new-instance v3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v4, "[YTFaceTraceInterface.blockJudge] input pointsVis.length != 90. current pointsVis.length: "

    .line 23
    .line 24
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    array-length v0, v0

    .line 28
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v2, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    const/4 v0, -0x2

    .line 39
    return v0

    .line 40
    :cond_1
    const/4 v1, 0x0

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;

    .line 44
    .line 45
    invoke-direct {v3, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;-><init>(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move-object/from16 v3, p1

    .line 50
    .line 51
    :goto_0
    const/16 v4, 0x21

    .line 52
    .line 53
    move v6, v1

    .line 54
    move v5, v4

    .line 55
    :goto_1
    const/16 v7, 0x2d

    .line 56
    .line 57
    if-gt v5, v7, :cond_4

    .line 58
    .line 59
    add-int/lit8 v7, v5, -0x1

    .line 60
    .line 61
    aget v7, v0, v7

    .line 62
    .line 63
    iget v8, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 64
    .line 65
    cmpg-float v7, v7, v8

    .line 66
    .line 67
    if-gez v7, :cond_3

    .line 68
    .line 69
    add-int/lit8 v6, v6, 0x1

    .line 70
    .line 71
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_4
    const-string v5, ","

    .line 75
    .line 76
    const-string v8, "]"

    .line 77
    .line 78
    const-string v9, "-"

    .line 79
    .line 80
    const-string v10, "["

    .line 81
    .line 82
    const/4 v11, 0x4

    .line 83
    if-lt v6, v11, :cond_7

    .line 84
    .line 85
    new-instance v1, Ljava/lang/StringBuffer;

    .line 86
    .line 87
    invoke-direct {v1, v10}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :goto_2
    if-gt v4, v7, :cond_6

    .line 91
    .line 92
    add-int/lit8 v6, v4, -0x1

    .line 93
    .line 94
    aget v10, v0, v6

    .line 95
    .line 96
    iget v11, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 97
    .line 98
    cmpg-float v10, v10, v11

    .line 99
    .line 100
    if-gez v10, :cond_5

    .line 101
    .line 102
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 106
    .line 107
    .line 108
    aget v6, v0, v6

    .line 109
    .line 110
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    .line 115
    .line 116
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_6
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->b:F

    .line 127
    .line 128
    const-string v3, "SHELTER_NOSE"

    .line 129
    .line 130
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Ljava/lang/String;Ljava/lang/String;F)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    const/4 v0, 0x5

    .line 138
    return v0

    .line 139
    :cond_7
    const/16 v4, 0x2e

    .line 140
    .line 141
    move v7, v1

    .line 142
    move v6, v4

    .line 143
    :goto_3
    const/16 v12, 0x43

    .line 144
    .line 145
    if-gt v6, v12, :cond_9

    .line 146
    .line 147
    add-int/lit8 v12, v6, -0x1

    .line 148
    .line 149
    aget v12, v0, v12

    .line 150
    .line 151
    iget v13, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 152
    .line 153
    cmpg-float v12, v12, v13

    .line 154
    .line 155
    if-gez v12, :cond_8

    .line 156
    .line 157
    add-int/lit8 v7, v7, 0x1

    .line 158
    .line 159
    :cond_8
    add-int/lit8 v6, v6, 0x1

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_9
    const/4 v6, 0x3

    .line 163
    if-lt v7, v11, :cond_c

    .line 164
    .line 165
    new-instance v1, Ljava/lang/StringBuffer;

    .line 166
    .line 167
    invoke-direct {v1, v10}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :goto_4
    if-gt v4, v12, :cond_b

    .line 171
    .line 172
    add-int/lit8 v7, v4, -0x1

    .line 173
    .line 174
    aget v10, v0, v7

    .line 175
    .line 176
    iget v11, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 177
    .line 178
    cmpg-float v10, v10, v11

    .line 179
    .line 180
    if-gez v10, :cond_a

    .line 181
    .line 182
    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 186
    .line 187
    .line 188
    aget v7, v0, v7

    .line 189
    .line 190
    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 194
    .line 195
    .line 196
    :cond_a
    add-int/lit8 v4, v4, 0x1

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_b
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->d:F

    .line 207
    .line 208
    const-string v3, "SHELTER_MOUTH"

    .line 209
    .line 210
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Ljava/lang/String;Ljava/lang/String;F)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    return v6

    .line 218
    :cond_c
    const/16 v4, 0x9

    .line 219
    .line 220
    move v7, v1

    .line 221
    :goto_5
    const/16 v12, 0x10

    .line 222
    .line 223
    if-gt v4, v12, :cond_e

    .line 224
    .line 225
    add-int/lit8 v12, v4, -0x1

    .line 226
    .line 227
    aget v12, v0, v12

    .line 228
    .line 229
    iget v13, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 230
    .line 231
    cmpg-float v12, v12, v13

    .line 232
    .line 233
    if-gez v12, :cond_d

    .line 234
    .line 235
    add-int/lit8 v7, v7, 0x1

    .line 236
    .line 237
    :cond_d
    add-int/lit8 v4, v4, 0x1

    .line 238
    .line 239
    goto :goto_5

    .line 240
    :cond_e
    const/16 v4, 0x19

    .line 241
    .line 242
    :goto_6
    const/16 v12, 0x20

    .line 243
    .line 244
    if-gt v4, v12, :cond_10

    .line 245
    .line 246
    add-int/lit8 v12, v4, -0x1

    .line 247
    .line 248
    aget v12, v0, v12

    .line 249
    .line 250
    iget v13, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 251
    .line 252
    cmpg-float v12, v12, v13

    .line 253
    .line 254
    if-gez v12, :cond_f

    .line 255
    .line 256
    add-int/lit8 v7, v7, 0x1

    .line 257
    .line 258
    :cond_f
    add-int/lit8 v4, v4, 0x1

    .line 259
    .line 260
    goto :goto_6

    .line 261
    :cond_10
    const/16 v4, 0x59

    .line 262
    .line 263
    aget v4, v0, v4

    .line 264
    .line 265
    iget v12, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 266
    .line 267
    cmpg-float v4, v4, v12

    .line 268
    .line 269
    if-gez v4, :cond_11

    .line 270
    .line 271
    add-int/lit8 v7, v7, 0x1

    .line 272
    .line 273
    :cond_11
    if-lt v7, v11, :cond_12

    .line 274
    .line 275
    const/4 v0, 0x6

    .line 276
    return v0

    .line 277
    :cond_12
    const/4 v4, 0x1

    .line 278
    move v12, v1

    .line 279
    move v7, v4

    .line 280
    :goto_7
    const/16 v13, 0x8

    .line 281
    .line 282
    if-gt v7, v13, :cond_14

    .line 283
    .line 284
    add-int/lit8 v13, v7, -0x1

    .line 285
    .line 286
    aget v13, v0, v13

    .line 287
    .line 288
    iget v14, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 289
    .line 290
    cmpg-float v13, v13, v14

    .line 291
    .line 292
    if-gez v13, :cond_13

    .line 293
    .line 294
    add-int/lit8 v12, v12, 0x1

    .line 295
    .line 296
    :cond_13
    add-int/lit8 v7, v7, 0x1

    .line 297
    .line 298
    goto :goto_7

    .line 299
    :cond_14
    const/16 v7, 0x11

    .line 300
    .line 301
    :goto_8
    const/16 v13, 0x18

    .line 302
    .line 303
    if-gt v7, v13, :cond_16

    .line 304
    .line 305
    add-int/lit8 v13, v7, -0x1

    .line 306
    .line 307
    aget v13, v0, v13

    .line 308
    .line 309
    iget v14, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 310
    .line 311
    cmpg-float v13, v13, v14

    .line 312
    .line 313
    if-gez v13, :cond_15

    .line 314
    .line 315
    add-int/lit8 v12, v12, 0x1

    .line 316
    .line 317
    :cond_15
    add-int/lit8 v7, v7, 0x1

    .line 318
    .line 319
    goto :goto_8

    .line 320
    :cond_16
    const/16 v7, 0x58

    .line 321
    .line 322
    aget v13, v0, v7

    .line 323
    .line 324
    iget v14, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->e:F

    .line 325
    .line 326
    cmpg-float v13, v13, v14

    .line 327
    .line 328
    if-gez v13, :cond_17

    .line 329
    .line 330
    add-int/lit8 v12, v12, 0x1

    .line 331
    .line 332
    :cond_17
    if-lt v12, v11, :cond_18

    .line 333
    .line 334
    const/4 v0, 0x7

    .line 335
    return v0

    .line 336
    :cond_18
    const/16 v12, 0x44

    .line 337
    .line 338
    move v14, v1

    .line 339
    move v13, v12

    .line 340
    :goto_9
    const/16 v15, 0x4a

    .line 341
    .line 342
    if-gt v13, v15, :cond_1a

    .line 343
    .line 344
    add-int/lit8 v15, v13, -0x1

    .line 345
    .line 346
    aget v15, v0, v15

    .line 347
    .line 348
    move/from16 v16, v1

    .line 349
    .line 350
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 351
    .line 352
    cmpg-float v1, v15, v1

    .line 353
    .line 354
    if-gez v1, :cond_19

    .line 355
    .line 356
    add-int/lit8 v14, v14, 0x1

    .line 357
    .line 358
    :cond_19
    add-int/lit8 v13, v13, 0x1

    .line 359
    .line 360
    move/from16 v1, v16

    .line 361
    .line 362
    goto :goto_9

    .line 363
    :cond_1a
    move/from16 v16, v1

    .line 364
    .line 365
    if-lt v14, v6, :cond_1d

    .line 366
    .line 367
    new-instance v1, Ljava/lang/StringBuffer;

    .line 368
    .line 369
    invoke-direct {v1, v10}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    :goto_a
    if-gt v12, v15, :cond_1c

    .line 373
    .line 374
    add-int/lit8 v6, v12, -0x1

    .line 375
    .line 376
    aget v7, v0, v6

    .line 377
    .line 378
    iget v10, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 379
    .line 380
    cmpg-float v7, v7, v10

    .line 381
    .line 382
    if-gez v7, :cond_1b

    .line 383
    .line 384
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 388
    .line 389
    .line 390
    aget v6, v0, v6

    .line 391
    .line 392
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 396
    .line 397
    .line 398
    :cond_1b
    add-int/lit8 v12, v12, 0x1

    .line 399
    .line 400
    goto :goto_a

    .line 401
    :cond_1c
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 402
    .line 403
    .line 404
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 409
    .line 410
    const-string v3, "SHELTER_LEFT_FACE"

    .line 411
    .line 412
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Ljava/lang/String;Ljava/lang/String;F)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 417
    .line 418
    .line 419
    return v4

    .line 420
    :cond_1d
    const/16 v1, 0x52

    .line 421
    .line 422
    move v4, v1

    .line 423
    move/from16 v12, v16

    .line 424
    .line 425
    :goto_b
    if-gt v4, v7, :cond_1f

    .line 426
    .line 427
    add-int/lit8 v13, v4, -0x1

    .line 428
    .line 429
    aget v13, v0, v13

    .line 430
    .line 431
    iget v14, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 432
    .line 433
    cmpg-float v13, v13, v14

    .line 434
    .line 435
    if-gez v13, :cond_1e

    .line 436
    .line 437
    add-int/lit8 v12, v12, 0x1

    .line 438
    .line 439
    :cond_1e
    add-int/lit8 v4, v4, 0x1

    .line 440
    .line 441
    goto :goto_b

    .line 442
    :cond_1f
    if-lt v12, v6, :cond_22

    .line 443
    .line 444
    new-instance v4, Ljava/lang/StringBuffer;

    .line 445
    .line 446
    invoke-direct {v4, v10}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    :goto_c
    if-gt v1, v7, :cond_21

    .line 450
    .line 451
    add-int/lit8 v6, v1, -0x1

    .line 452
    .line 453
    aget v10, v0, v6

    .line 454
    .line 455
    iget v12, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 456
    .line 457
    cmpg-float v10, v10, v12

    .line 458
    .line 459
    if-gez v10, :cond_20

    .line 460
    .line 461
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 462
    .line 463
    .line 464
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 465
    .line 466
    .line 467
    aget v6, v0, v6

    .line 468
    .line 469
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 470
    .line 471
    .line 472
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 473
    .line 474
    .line 475
    :cond_20
    add-int/lit8 v1, v1, 0x1

    .line 476
    .line 477
    goto :goto_c

    .line 478
    :cond_21
    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 479
    .line 480
    .line 481
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->a:F

    .line 486
    .line 487
    const-string v3, "SHELTER_RIGHT_FACE"

    .line 488
    .line 489
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Ljava/lang/String;Ljava/lang/String;F)Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 494
    .line 495
    .line 496
    return v11

    .line 497
    :cond_22
    const/16 v1, 0x4b

    .line 498
    .line 499
    move v4, v1

    .line 500
    move/from16 v5, v16

    .line 501
    .line 502
    :goto_d
    const/16 v7, 0x51

    .line 503
    .line 504
    if-gt v4, v7, :cond_24

    .line 505
    .line 506
    add-int/lit8 v7, v4, -0x1

    .line 507
    .line 508
    aget v7, v0, v7

    .line 509
    .line 510
    iget v11, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 511
    .line 512
    cmpg-float v7, v7, v11

    .line 513
    .line 514
    if-gez v7, :cond_23

    .line 515
    .line 516
    add-int/lit8 v5, v5, 0x1

    .line 517
    .line 518
    :cond_23
    add-int/lit8 v4, v4, 0x1

    .line 519
    .line 520
    goto :goto_d

    .line 521
    :cond_24
    if-lt v5, v6, :cond_27

    .line 522
    .line 523
    new-instance v4, Ljava/lang/StringBuffer;

    .line 524
    .line 525
    invoke-direct {v4, v10}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    :goto_e
    if-gt v1, v7, :cond_26

    .line 529
    .line 530
    add-int/lit8 v5, v1, -0x1

    .line 531
    .line 532
    aget v6, v0, v5

    .line 533
    .line 534
    iget v10, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 535
    .line 536
    cmpg-float v6, v6, v10

    .line 537
    .line 538
    if-gez v6, :cond_25

    .line 539
    .line 540
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 541
    .line 542
    .line 543
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 544
    .line 545
    .line 546
    aget v5, v0, v5

    .line 547
    .line 548
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 549
    .line 550
    .line 551
    const-string v5, ";"

    .line 552
    .line 553
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 554
    .line 555
    .line 556
    :cond_25
    add-int/lit8 v1, v1, 0x1

    .line 557
    .line 558
    goto :goto_e

    .line 559
    :cond_26
    invoke-virtual {v4, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 560
    .line 561
    .line 562
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    iget v1, v3, Lcom/tencent/youtu/sdkkitframework/liveness/o$a;->c:F

    .line 567
    .line 568
    const-string v3, "SHELTER_CHIN"

    .line 569
    .line 570
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Ljava/lang/String;Ljava/lang/String;F)Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v0

    .line 574
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 575
    .line 576
    .line 577
    const/4 v0, 0x2

    .line 578
    return v0

    .line 579
    :cond_27
    return v16
.end method

.method public static a(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    .line 627
    iget v0, p0, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->left:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 628
    iget v1, p0, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 629
    iget v2, p0, Landroid/graphics/Rect;->right:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 630
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 631
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v0, v1, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p1
.end method

.method public static a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)Landroid/graphics/Rect;
    .locals 13

    .line 614
    iget-object v0, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    const/4 v3, 0x1

    .line 615
    aget v0, v0, v3

    move v4, v2

    move v5, v4

    move v2, v1

    move v1, v0

    :goto_0
    const/16 v6, 0xb4

    if-ge v2, v6, :cond_0

    .line 616
    iget-object v6, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    aget v6, v6, v2

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 617
    iget-object v6, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    aget v6, v6, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    add-int/lit8 v6, v2, 0x1

    .line 618
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    aget v7, v7, v6

    invoke-static {v1, v7}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 619
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    aget v6, v7, v6

    invoke-static {v0, v6}, Ljava/lang/Math;->max(FF)F

    move-result v0

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 620
    :cond_0
    sget p0, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a:I

    add-int/lit8 v2, p0, -0x1

    int-to-float v2, v2

    sub-float v4, v2, v4

    sub-float/2addr v2, v5

    float-to-double v5, v2

    sub-float v2, v4, v2

    float-to-double v7, v2

    const-wide v9, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v7, v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    div-double/2addr v7, v11

    sub-double/2addr v5, v7

    double-to-float v2, v5

    float-to-double v5, v4

    sub-float/2addr v4, v2

    float-to-double v7, v4

    mul-double/2addr v7, v9

    div-double/2addr v7, v11

    add-double/2addr v5, v7

    double-to-float v4, v5

    float-to-double v5, v1

    sub-float v1, v0, v1

    float-to-double v7, v1

    mul-double/2addr v7, v9

    div-double/2addr v7, v11

    sub-double/2addr v5, v7

    double-to-float v1, v5

    float-to-double v5, v0

    sub-float/2addr v0, v1

    float-to-double v7, v0

    mul-double/2addr v7, v9

    div-double/2addr v7, v11

    add-double/2addr v5, v7

    double-to-float v0, v5

    const/4 v5, 0x0

    cmpg-float v6, v2, v5

    if-gez v6, :cond_1

    move v2, v5

    :cond_1
    cmpg-float v6, v4, v5

    if-gez v6, :cond_2

    move v4, v5

    :cond_2
    add-int/lit8 v6, p0, -0x1

    int-to-float v6, v6

    cmpl-float v7, v2, v6

    if-lez v7, :cond_3

    move v2, v6

    :cond_3
    sub-int/2addr p0, v3

    int-to-float p0, p0

    cmpl-float v6, v4, p0

    if-lez v6, :cond_4

    move v4, p0

    :cond_4
    cmpg-float p0, v1, v5

    if-gez p0, :cond_5

    move v1, v5

    :cond_5
    cmpg-float p0, v0, v5

    if-gez p0, :cond_6

    move v0, v5

    .line 621
    :cond_6
    sget p0, Lcom/tencent/youtu/sdkkitframework/liveness/o;->b:I

    add-int/lit8 v5, p0, -0x1

    int-to-float v5, v5

    cmpl-float v6, v1, v5

    if-lez v6, :cond_7

    move v1, v5

    :cond_7
    sub-int/2addr p0, v3

    int-to-float p0, p0

    cmpl-float v3, v0, p0

    if-lez v3, :cond_8

    move v0, p0

    .line 622
    :cond_8
    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    float-to-int v2, v2

    .line 623
    iput v2, p0, Landroid/graphics/Rect;->left:I

    float-to-int v1, v1

    .line 624
    iput v1, p0, Landroid/graphics/Rect;->top:I

    float-to-int v1, v4

    .line 625
    iput v1, p0, Landroid/graphics/Rect;->right:I

    float-to-int v0, v0

    .line 626
    iput v0, p0, Landroid/graphics/Rect;->bottom:I

    return-object p0
.end method

.method public static a(I)Ljava/lang/String;
    .locals 1

    .line 632
    const/4 v0, 0x4

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    if-ne p0, v0, :cond_1

    const-string p0, "fl_pose_closer"

    return-object p0

    :cond_1
    const/4 v0, 0x3

    if-ne p0, v0, :cond_2

    const-string p0, "fl_pose_farer"

    return-object p0

    :cond_2
    const/4 v0, 0x5

    if-ne p0, v0, :cond_3

    const-string p0, "fl_pose_incorrect"

    return-object p0

    :cond_3
    const/4 v0, 0x1

    if-ne p0, v0, :cond_4

    const-string p0, "fl_no_face"

    return-object p0

    :cond_4
    const/4 v0, 0x6

    if-ne p0, v0, :cond_5

    const-string p0, "fl_pose_open_eye"

    return-object p0

    :cond_5
    const/16 v0, 0x8

    if-ne p0, v0, :cond_6

    :goto_0
    const-string p0, "fl_incomplete_face"

    return-object p0

    :cond_6
    const/4 v0, 0x7

    if-ne p0, v0, :cond_7

    const-string p0, "fl_too_many_faces"

    return-object p0

    :cond_7
    const-string p0, "fl_pose_keep"

    return-object p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;F)Ljava/lang/String;
    .locals 3

    .line 696
    const-string v0, "o"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "quality_type"

    .line 697
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p0, "quality_score"

    .line 698
    invoke-virtual {v1, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    float-to-double p0, p2

    const-string p2, "quality_thr"

    .line 699
    invoke-virtual {v1, p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "make log json error"

    .line 700
    invoke-static {v0, p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 701
    :goto_0
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_1
    const-string p1, "TraceType"

    const-string p2, "FaceQuality"

    .line 702
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "TraceData"

    .line 703
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    const-string p2, "make log info error"

    .line 704
    invoke-static {v0, p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 705
    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a([Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;II)Ljava/lang/String;
    .locals 11

    .line 657
    const-string v0, "o"

    const-string v1, "TraceData"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v3, "TraceType"

    const-string v4, "FaceTracker"

    .line 658
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 659
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "detect_rect"

    .line 660
    :try_start_1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    move-result-object v5

    invoke-virtual {v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getDetectRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-static {v5}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Landroid/graphics/Rect;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "pose_state"

    .line 661
    invoke-virtual {v3, v4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p2, "shelter_state"

    .line 662
    invoke-virtual {v3, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 663
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    const-string p2, "faces"

    .line 664
    invoke-virtual {v3, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p0, :cond_0

    .line 665
    array-length p2, p0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, p2, :cond_0

    aget-object v6, p0, v5

    .line 666
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 667
    invoke-virtual {p1, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v8, "frameId"

    .line 668
    :try_start_2
    iget v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->frameId:I

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    const-string v8, "traceId"

    .line 669
    :try_start_3
    iget v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->traceId:I

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    const-string v8, "rect"

    .line 670
    :try_start_4
    iget-object v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceRect:Landroid/graphics/Rect;

    invoke-static {v9}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Landroid/graphics/Rect;)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    const-string v8, "points"

    .line 671
    :try_start_5
    iget-object v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    invoke-static {v9, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a([FZ)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    const-string v8, "visible"

    .line 672
    :try_start_6
    iget-object v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceVisible:[F

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a([FZ)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0

    const-string v8, "angle_r"

    .line 673
    :try_start_7
    iget v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    float-to-double v9, v9

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    const-string v8, "angle_p"

    .line 674
    :try_start_8
    iget v9, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    float-to-double v9, v9

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_0

    const-string v8, "angle_y"

    .line 675
    :try_start_9
    iget v6, v6, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    float-to-double v9, v6

    invoke-virtual {v7, v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    .line 676
    :cond_0
    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 677
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "TraceJson: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 678
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Ljava/lang/String;)[B

    move-result-object p0

    const/4 p1, 0x2

    invoke-static {p0, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    .line 679
    invoke-virtual {v2, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_0

    goto :goto_2

    :goto_1
    const-string p1, "make log info error"

    .line 680
    invoke-static {v0, p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 681
    :goto_2
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/graphics/Rect;)Lorg/json/JSONArray;
    .locals 2

    .line 649
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 650
    iget v1, p0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 651
    iget v1, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 652
    iget v1, p0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 653
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    return-object v0
.end method

.method public static a([FZ)Lorg/json/JSONArray;
    .locals 5

    .line 654
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 655
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p0, v2

    if-eqz p1, :cond_0

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float/2addr v3, v4

    .line 656
    :cond_0
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FFF)Z
    .locals 9

    .line 633
    const-string v0, "o"

    iget v1, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 634
    iget v2, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 635
    iget p0, p0, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpg-float v3, v1, p1

    const/4 v4, 0x0

    if-gtz v3, :cond_0

    cmpg-float v3, v2, p2

    if-gtz v3, :cond_0

    cmpg-float v3, p0, p3

    if-gtz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    if-nez v3, :cond_1

    .line 636
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 637
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "face_angle_force_check_result"

    .line 638
    invoke-virtual {v6, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    float-to-double v7, v1

    const-string v1, "angle_yaw"

    .line 639
    invoke-virtual {v6, v1, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    float-to-double v1, v2

    const-string v4, "angle_pitch"

    .line 640
    invoke-virtual {v6, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    float-to-double v1, p0

    const-string p0, "angle_roll"

    .line 641
    invoke-virtual {v6, p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    float-to-double p0, p1

    const-string v1, "angle_yaw_thr"

    .line 642
    invoke-virtual {v6, v1, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    float-to-double p0, p2

    const-string p2, "angle_pitch_thr"

    .line 643
    invoke-virtual {v6, p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    float-to-double p0, p3

    const-string p2, "angle_roll_thr"

    .line 644
    invoke-virtual {v6, p2, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    const-string p0, "TraceType"

    const-string p1, "FaceAngleForceCheck"

    .line 645
    invoke-virtual {v5, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p0, "TraceData"

    .line 646
    invoke-virtual {v5, p0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "make log json error"

    .line 647
    invoke-static {v0, p1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 648
    :goto_1
    invoke-static {v0, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    return v3
.end method

.method public static a(Ljava/lang/String;)[B
    .locals 6

    const-string v0, " gzip.close(): "

    const-string v1, "o"

    const/4 v2, 0x0

    if-eqz p0, :cond_3

    .line 682
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    goto :goto_4

    .line 683
    :cond_0
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 684
    new-instance v4, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v4, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string v5, "UTF-8"

    .line 685
    invoke-virtual {p0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/io/OutputStream;->write([B)V

    .line 686
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 687
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 688
    :try_start_2
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-object p0

    :catch_0
    move-exception v2

    .line 689
    invoke-static {v1, v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p0

    :catchall_0
    move-exception p0

    move-object v2, v4

    goto :goto_2

    :catch_1
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_2

    :catch_2
    move-exception p0

    move-object v4, v2

    :goto_0
    :try_start_3
    const-string v3, "compress Exception e: "

    .line 690
    invoke-static {v1, v3, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_1

    .line 691
    :try_start_4
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    :catch_3
    move-exception p0

    .line 692
    invoke-static {v1, v0, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-object v2

    :goto_2
    if-eqz v2, :cond_2

    .line 693
    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    :catch_4
    move-exception v2

    .line 694
    invoke-static {v1, v0, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 695
    :cond_2
    :goto_3
    throw p0

    :cond_3
    :goto_4
    return-object v2
.end method

.method public static a([Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;)[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;
    .locals 20

    move-object/from16 v0, p0

    const/4 v2, 0x0

    .line 580
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_12

    .line 581
    aget-object v3, v0, v2

    iget-object v4, v3, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    const/16 v5, 0xb4

    .line 582
    new-array v5, v5, [F

    const/16 v6, 0xd

    .line 583
    new-array v7, v6, [I

    fill-array-data v7, :array_0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_1
    const/16 v11, 0x20

    if-ge v8, v11, :cond_0

    add-int/lit8 v11, v9, 0x1

    .line 584
    aget v12, v4, v10

    aput v12, v5, v9

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v10, v10, 0x1

    move v9, v11

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    :goto_2
    if-ge v8, v11, :cond_1

    add-int/lit8 v12, v9, 0x1

    .line 585
    aget v13, v4, v10

    aput v13, v5, v9

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v10, v10, 0x1

    move v9, v12

    goto :goto_2

    :cond_1
    const/16 v8, 0x2c

    .line 586
    new-array v11, v8, [F

    const/4 v12, 0x0

    :goto_3
    if-ge v12, v8, :cond_2

    .line 587
    aget v13, v4, v10

    aput v13, v11, v12

    add-int/lit8 v12, v12, 0x1

    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_2
    const/16 v12, 0x10

    .line 588
    aget v13, v11, v12

    const/16 v14, 0x12

    aget v14, v11, v14

    add-float/2addr v13, v14

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    aput v13, v11, v12

    const/16 v13, 0x13

    .line 589
    aget v15, v11, v13

    add-float/2addr v15, v15

    div-float/2addr v15, v14

    aput v15, v11, v13

    const/16 v13, 0x1c

    .line 590
    aget v15, v11, v13

    const/16 v16, 0x1a

    aget v16, v11, v16

    add-float v15, v15, v16

    div-float/2addr v15, v14

    aput v15, v11, v13

    const/16 v13, 0x1d

    .line 591
    aget v15, v11, v13

    const/16 v16, 0x1b

    aget v16, v11, v16

    add-float v15, v15, v16

    div-float/2addr v15, v14

    aput v15, v11, v13

    const/4 v13, 0x0

    :goto_4
    const/4 v15, 0x2

    const/4 v1, 0x1

    if-ge v13, v6, :cond_3

    add-int/lit8 v17, v9, 0x1

    .line 592
    aget v18, v7, v13

    mul-int/lit8 v19, v18, 0x2

    aget v19, v11, v19

    aput v19, v5, v9

    add-int/lit8 v9, v9, 0x2

    mul-int/lit8 v18, v18, 0x2

    add-int/lit8 v18, v18, 0x1

    .line 593
    aget v1, v11, v18

    aput v1, v5, v17

    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    :cond_3
    const/4 v7, 0x0

    :goto_5
    if-ge v7, v8, :cond_4

    add-int/lit8 v11, v9, 0x1

    .line 594
    aget v13, v4, v10

    aput v13, v5, v9

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v10, v10, 0x1

    move v9, v11

    goto :goto_5

    :cond_4
    const/4 v7, 0x0

    :goto_6
    const/16 v8, 0x52

    if-ge v7, v8, :cond_6

    .line 595
    div-int/lit8 v8, v7, 0x2

    rem-int/2addr v8, v15

    if-ne v8, v1, :cond_5

    goto :goto_7

    :cond_5
    add-int/lit8 v8, v9, 0x1

    .line 596
    aget v11, v4, v10

    aput v11, v5, v9

    move v9, v8

    :goto_7
    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    :cond_6
    const/4 v7, 0x0

    :goto_8
    const/16 v8, 0xe

    if-ge v7, v8, :cond_7

    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v10, v10, 0x1

    goto :goto_8

    :cond_7
    const/4 v7, 0x0

    :goto_9
    const/4 v11, 0x4

    if-ge v7, v11, :cond_8

    add-int/lit8 v11, v9, 0x1

    .line 597
    aget v13, v4, v10

    aput v13, v5, v9

    add-int/lit8 v7, v7, 0x1

    add-int/2addr v10, v1

    move v9, v11

    goto :goto_9

    .line 598
    :cond_8
    iput-object v5, v3, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    .line 599
    aget-object v3, v0, v2

    iget-object v4, v3, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceVisible:[F

    const/16 v5, 0x5a

    .line 600
    new-array v5, v5, [F

    .line 601
    new-array v7, v6, [I

    fill-array-data v7, :array_1

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_a
    if-ge v9, v12, :cond_9

    add-int/lit8 v13, v10, 0x1

    .line 602
    aget v17, v4, v11

    aput v17, v5, v10

    add-int/lit8 v9, v9, 0x1

    add-int/lit8 v11, v11, 0x1

    move v10, v13

    goto :goto_a

    :cond_9
    const/4 v9, 0x0

    :goto_b
    if-ge v9, v12, :cond_a

    add-int/lit8 v13, v10, 0x1

    .line 603
    aget v17, v4, v11

    aput v17, v5, v10

    add-int/lit8 v9, v9, 0x1

    add-int/lit8 v11, v11, 0x1

    move v10, v13

    goto :goto_b

    :cond_a
    const/16 v9, 0x16

    .line 604
    new-array v12, v9, [F

    const/4 v13, 0x0

    :goto_c
    if-ge v13, v9, :cond_b

    .line 605
    aget v17, v4, v11

    aput v17, v12, v13

    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v11, v11, 0x1

    goto :goto_c

    :cond_b
    const/16 v13, 0x8

    .line 606
    aget v17, v12, v13

    const/16 v18, 0x9

    aget v18, v12, v18

    add-float v17, v17, v18

    div-float v17, v17, v14

    aput v17, v12, v13

    .line 607
    aget v13, v12, v8

    aget v17, v12, v6

    add-float v13, v13, v17

    div-float/2addr v13, v14

    aput v13, v12, v8

    const/4 v8, 0x0

    :goto_d
    if-ge v8, v6, :cond_c

    add-int/lit8 v13, v10, 0x1

    .line 608
    aget v14, v7, v8

    aget v14, v12, v14

    aput v14, v5, v10

    add-int/lit8 v8, v8, 0x1

    move v10, v13

    goto :goto_d

    :cond_c
    const/4 v6, 0x0

    :goto_e
    if-ge v6, v9, :cond_d

    add-int/lit8 v7, v10, 0x1

    .line 609
    aget v8, v4, v11

    aput v8, v5, v10

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v11, v11, 0x1

    move v10, v7

    goto :goto_e

    :cond_d
    const/4 v6, 0x0

    :goto_f
    const/16 v7, 0x29

    if-ge v6, v7, :cond_f

    .line 610
    rem-int/lit8 v7, v6, 0x2

    if-ne v7, v1, :cond_e

    goto :goto_10

    :cond_e
    add-int/lit8 v7, v10, 0x1

    .line 611
    aget v8, v4, v11

    aput v8, v5, v10

    move v10, v7

    :goto_10
    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v11, v11, 0x1

    goto :goto_f

    :cond_f
    const/4 v6, 0x0

    :goto_11
    const/4 v7, 0x7

    if-ge v6, v7, :cond_10

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v11, v11, 0x1

    goto :goto_11

    :cond_10
    const/4 v6, 0x0

    :goto_12
    if-ge v6, v15, :cond_11

    add-int/lit8 v7, v10, 0x1

    .line 612
    aget v8, v4, v11

    aput v8, v5, v10

    add-int/lit8 v6, v6, 0x1

    add-int/2addr v11, v1

    move v10, v7

    goto :goto_12

    .line 613
    :cond_11
    iput-object v5, v3, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceVisible:[F

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_12
    return-object v0

    :array_0
    .array-data 4
        0x0
        0x4
        0x12
        0x13
        0x7
        0x8
        0xa
        0xb
        0xc
        0xe
        0xf
        0x15
        0x14
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x4
        0x12
        0x13
        0x7
        0x8
        0xa
        0xb
        0xc
        0xe
        0xf
        0x15
        0x14
    .end array-data
.end method

.method public static b(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const-string p0, "fl_no_left_face"

    return-object p0

    :cond_0
    const/4 v0, 0x2

    if-ne p0, v0, :cond_1

    const-string p0, "fl_no_chin"

    return-object p0

    :cond_1
    const/4 v0, 0x3

    if-ne p0, v0, :cond_2

    const-string p0, "fl_no_mouth"

    return-object p0

    :cond_2
    const/4 v0, 0x4

    if-ne p0, v0, :cond_3

    const-string p0, "fl_no_right_face"

    return-object p0

    :cond_3
    const/4 v0, 0x5

    if-ne p0, v0, :cond_4

    const-string p0, "fl_no_nose"

    return-object p0

    :cond_4
    const/4 v0, 0x6

    if-ne p0, v0, :cond_5

    const-string p0, "fl_no_right_eye"

    return-object p0

    :cond_5
    const/4 v0, 0x7

    if-ne p0, v0, :cond_6

    const-string p0, "fl_no_left_eye"

    return-object p0

    :cond_6
    const-string p0, ""

    return-object p0
.end method

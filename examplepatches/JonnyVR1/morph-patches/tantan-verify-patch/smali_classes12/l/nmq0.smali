.class public Ll/nmq0;
.super Ll/hb20;
.source "SourceFile"


# instance fields
.field public I:Ljava/nio/ByteBuffer;

.field public J:Ljava/nio/ByteBuffer;

.field public K:Ljava/nio/ByteBuffer;

.field private L:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/hb20;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/nmq0;->I:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    iput-object v0, p0, Ll/nmq0;->J:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    iput-object v0, p0, Ll/nmq0;->K:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/xej;->i:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public O(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/xej;->a:I

    .line 3
    .line 4
    div-int/lit8 p1, p1, 0x5a

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/xej;->x(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P(I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    const/16 v3, 0x8

    .line 7
    .line 8
    const/16 v4, 0x20

    .line 9
    .line 10
    const/4 v5, 0x2

    .line 11
    const/4 v6, 0x1

    .line 12
    const/4 v7, 0x0

    .line 13
    const/4 v8, 0x3

    .line 14
    if-ne v1, v8, :cond_0

    .line 15
    .line 16
    new-array v1, v3, [F

    .line 17
    .line 18
    fill-array-data v1, :array_0

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/xej;->A([F)V

    .line 22
    .line 23
    .line 24
    new-array v1, v2, [Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    iput-object v1, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    new-array v2, v3, [F

    .line 29
    .line 30
    fill-array-data v2, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v9

    .line 37
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    aput-object v9, v1, v7

    .line 50
    .line 51
    iget-object v1, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    aget-object v1, v1, v7

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 60
    .line 61
    .line 62
    new-array v1, v3, [F

    .line 63
    .line 64
    fill-array-data v1, :array_2

    .line 65
    .line 66
    .line 67
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    aput-object v9, v2, v6

    .line 86
    .line 87
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    aget-object v2, v2, v6

    .line 90
    .line 91
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 96
    .line 97
    .line 98
    new-array v1, v3, [F

    .line 99
    .line 100
    fill-array-data v1, :array_3

    .line 101
    .line 102
    .line 103
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    aput-object v6, v2, v5

    .line 122
    .line 123
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 124
    .line 125
    aget-object v2, v2, v5

    .line 126
    .line 127
    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 132
    .line 133
    .line 134
    new-array v1, v3, [F

    .line 135
    .line 136
    fill-array-data v1, :array_4

    .line 137
    .line 138
    .line 139
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 140
    .line 141
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    aput-object v3, v2, v8

    .line 158
    .line 159
    iget-object v0, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 160
    .line 161
    aget-object v0, v0, v8

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_0
    const/high16 v9, 0x3f800000    # 1.0f

    .line 172
    .line 173
    const/4 v10, 0x0

    .line 174
    if-eqz v1, :cond_3

    .line 175
    .line 176
    if-eq v1, v6, :cond_2

    .line 177
    .line 178
    if-eq v1, v5, :cond_1

    .line 179
    .line 180
    move v1, v10

    .line 181
    move v11, v1

    .line 182
    move v10, v9

    .line 183
    goto :goto_0

    .line 184
    :cond_1
    move v1, v9

    .line 185
    move v11, v1

    .line 186
    move v9, v10

    .line 187
    goto :goto_0

    .line 188
    :cond_2
    move v11, v9

    .line 189
    move v1, v10

    .line 190
    goto :goto_0

    .line 191
    :cond_3
    move v1, v9

    .line 192
    move v11, v10

    .line 193
    move v10, v1

    .line 194
    move v9, v11

    .line 195
    :goto_0
    new-array v12, v3, [F

    .line 196
    .line 197
    aput v9, v12, v7

    .line 198
    .line 199
    aput v10, v12, v6

    .line 200
    .line 201
    aput v1, v12, v5

    .line 202
    .line 203
    aput v10, v12, v8

    .line 204
    .line 205
    aput v9, v12, v2

    .line 206
    .line 207
    const/4 v13, 0x5

    .line 208
    aput v11, v12, v13

    .line 209
    .line 210
    const/4 v14, 0x6

    .line 211
    aput v1, v12, v14

    .line 212
    .line 213
    const/4 v15, 0x7

    .line 214
    aput v11, v12, v15

    .line 215
    .line 216
    move/from16 v16, v2

    .line 217
    .line 218
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 219
    .line 220
    move/from16 v17, v4

    .line 221
    .line 222
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    move/from16 v18, v5

    .line 227
    .line 228
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    aput-object v4, v2, v7

    .line 241
    .line 242
    iget-object v2, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 243
    .line 244
    aget-object v2, v2, v7

    .line 245
    .line 246
    invoke-virtual {v2, v12}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-virtual {v2, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 251
    .line 252
    .line 253
    new-array v2, v3, [F

    .line 254
    .line 255
    aput v11, v2, v7

    .line 256
    .line 257
    aput v9, v2, v6

    .line 258
    .line 259
    aput v11, v2, v18

    .line 260
    .line 261
    aput v1, v2, v8

    .line 262
    .line 263
    aput v10, v2, v16

    .line 264
    .line 265
    aput v9, v2, v13

    .line 266
    .line 267
    aput v10, v2, v14

    .line 268
    .line 269
    aput v1, v2, v15

    .line 270
    .line 271
    iget-object v4, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 272
    .line 273
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 278
    .line 279
    .line 280
    move-result-object v12

    .line 281
    invoke-virtual {v5, v12}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    aput-object v5, v4, v6

    .line 290
    .line 291
    iget-object v4, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 292
    .line 293
    aget-object v4, v4, v6

    .line 294
    .line 295
    invoke-virtual {v4, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-virtual {v2, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 300
    .line 301
    .line 302
    new-array v2, v3, [F

    .line 303
    .line 304
    aput v1, v2, v7

    .line 305
    .line 306
    aput v11, v2, v6

    .line 307
    .line 308
    aput v9, v2, v18

    .line 309
    .line 310
    aput v11, v2, v8

    .line 311
    .line 312
    aput v1, v2, v16

    .line 313
    .line 314
    aput v10, v2, v13

    .line 315
    .line 316
    aput v9, v2, v14

    .line 317
    .line 318
    aput v10, v2, v15

    .line 319
    .line 320
    iget-object v4, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 321
    .line 322
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 327
    .line 328
    .line 329
    move-result-object v12

    .line 330
    invoke-virtual {v5, v12}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 331
    .line 332
    .line 333
    move-result-object v5

    .line 334
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 335
    .line 336
    .line 337
    move-result-object v5

    .line 338
    aput-object v5, v4, v18

    .line 339
    .line 340
    iget-object v4, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 341
    .line 342
    aget-object v4, v4, v18

    .line 343
    .line 344
    invoke-virtual {v4, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    invoke-virtual {v2, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 349
    .line 350
    .line 351
    new-array v2, v3, [F

    .line 352
    .line 353
    aput v10, v2, v7

    .line 354
    .line 355
    aput v1, v2, v6

    .line 356
    .line 357
    aput v10, v2, v18

    .line 358
    .line 359
    aput v9, v2, v8

    .line 360
    .line 361
    aput v11, v2, v16

    .line 362
    .line 363
    aput v1, v2, v13

    .line 364
    .line 365
    aput v11, v2, v14

    .line 366
    .line 367
    aput v9, v2, v15

    .line 368
    .line 369
    iget-object v1, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 370
    .line 371
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    aput-object v3, v1, v8

    .line 388
    .line 389
    iget-object v0, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 390
    .line 391
    aget-object v0, v0, v8

    .line 392
    .line 393
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {v0, v7}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 398
    .line 399
    .line 400
    return-void

    .line 401
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
    .end array-data

    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    :array_3
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public V([BI)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/hb20;->F:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    mul-int/lit8 v1, p2, 0x2

    .line 8
    .line 9
    :try_start_0
    div-int/lit8 v1, v1, 0x3

    .line 10
    .line 11
    div-int/lit8 v2, p2, 0x6

    .line 12
    .line 13
    div-int/lit8 p2, p2, 0x6

    .line 14
    .line 15
    iget-object v3, p0, Ll/nmq0;->I:Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    if-eqz v3, :cond_1

    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-le v1, v3, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iput-object v3, p0, Ll/nmq0;->I:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    :cond_2
    iget-object v3, p0, Ll/nmq0;->J:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    if-eqz v3, :cond_3

    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-le v2, v3, :cond_4

    .line 43
    .line 44
    :cond_3
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iput-object v3, p0, Ll/nmq0;->J:Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    :cond_4
    iget-object v3, p0, Ll/nmq0;->K:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    if-eqz v3, :cond_5

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-le p2, v3, :cond_6

    .line 59
    .line 60
    :cond_5
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iput-object v3, p0, Ll/nmq0;->K:Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    :cond_6
    iget-object v3, p0, Ll/nmq0;->I:Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    const/4 v4, 0x0

    .line 69
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 70
    .line 71
    .line 72
    iget-object v3, p0, Ll/nmq0;->J:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Ll/nmq0;->K:Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Ll/nmq0;->I:Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    invoke-virtual {v3, p1, v4, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Ll/nmq0;->J:Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    invoke-virtual {v3, p1, v1, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/nmq0;->K:Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    add-int/2addr v1, v2

    .line 95
    invoke-virtual {p0, p1, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    monitor-exit v0

    .line 99
    return-void

    .line 100
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    throw p0
.end method

.method public f()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/hb20;->f()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    iget v2, p0, Ll/xej;->h:I

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    filled-new-array {v2}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v1, p0, Ll/xej;->h:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    :cond_0
    :try_start_1
    iget-object p0, p0, Ll/nmq0;->L:[I

    .line 20
    .line 21
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 22
    .line 23
    .line 24
    :catch_1
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D SamplerY;uniform sampler2D SamplerU;uniform sampler2D SamplerV;varying mediump vec2 coordinate;void main(){vec3 rgb;vec3 yuv;yuv.r = texture2D(SamplerY, coordinate).r - (16.0/255.0);\nyuv.g = texture2D(SamplerU, coordinate).r - 0.5;\nyuv.b = texture2D(SamplerV, coordinate).r - 0.5;\n mat3 colorConvertion = mat3(1.164, 1.164, 1.164,\n                             0.0, -0.392, 2.017,\n                             1.596, -0.813, 0.0);\n rgb = colorConvertion * yuv;   gl_FragColor = vec4(rgb, 1.0);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;attribute mediump vec4 inputTextureCoordinate;varying mediump vec2 coordinate;void main(){    gl_Position = position;    coordinate = inputTextureCoordinate.xy;}"

    .line 2
    .line 3
    return-object p0
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/hb20;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/hb20;->u()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    new-array v1, v0, [I

    .line 6
    .line 7
    iput-object v1, p0, Ll/nmq0;->L:[I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 11
    .line 12
    .line 13
    move v1, v2

    .line 14
    :goto_0
    const/4 v3, 0x1

    .line 15
    if-ge v1, v0, :cond_0

    .line 16
    .line 17
    iget-object v4, p0, Ll/nmq0;->L:[I

    .line 18
    .line 19
    aget v4, v4, v1

    .line 20
    .line 21
    const v5, 0x84c0

    .line 22
    .line 23
    .line 24
    add-int/2addr v5, v1

    .line 25
    invoke-static {v5}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 26
    .line 27
    .line 28
    const/16 v5, 0xde1

    .line 29
    .line 30
    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 31
    .line 32
    .line 33
    const/16 v4, 0xcf5

    .line 34
    .line 35
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 36
    .line 37
    .line 38
    const/16 v3, 0x2801

    .line 39
    .line 40
    const/16 v4, 0x2601

    .line 41
    .line 42
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 43
    .line 44
    .line 45
    const/16 v3, 0x2800

    .line 46
    .line 47
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 48
    .line 49
    .line 50
    const/16 v3, 0x2802

    .line 51
    .line 52
    const v4, 0x812f

    .line 53
    .line 54
    .line 55
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 56
    .line 57
    .line 58
    const/16 v3, 0x2803

    .line 59
    .line 60
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget v0, p0, Ll/xej;->d:I

    .line 67
    .line 68
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 69
    .line 70
    .line 71
    iget v0, p0, Ll/xej;->d:I

    .line 72
    .line 73
    const-string v1, "SamplerY"

    .line 74
    .line 75
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 80
    .line 81
    .line 82
    iget v0, p0, Ll/xej;->d:I

    .line 83
    .line 84
    const-string v1, "SamplerU"

    .line 85
    .line 86
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 91
    .line 92
    .line 93
    iget p0, p0, Ll/xej;->d:I

    .line 94
    .line 95
    const-string v0, "SamplerV"

    .line 96
    .line 97
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    const/4 v0, 0x2

    .line 102
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hfj;->L()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/hb20;->v()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public w()V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super {v0}, Ll/hb20;->w()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Ll/xej;->b:Ljava/nio/FloatBuffer;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/xej;->r()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0}, Ll/xej;->n()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget v4, v0, Ll/xej;->a:I

    .line 21
    .line 22
    const/4 v5, 0x2

    .line 23
    rem-int/2addr v4, v5

    .line 24
    const/4 v6, 0x1

    .line 25
    if-ne v4, v6, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/xej;->n()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0}, Ll/xej;->r()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    :cond_0
    move v10, v1

    .line 36
    move v11, v3

    .line 37
    iget v1, v0, Ll/xej;->d:I

    .line 38
    .line 39
    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 40
    .line 41
    .line 42
    iget v1, v0, Ll/xej;->d:I

    .line 43
    .line 44
    const-string v3, "SamplerY"

    .line 45
    .line 46
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 51
    .line 52
    .line 53
    iget v1, v0, Ll/xej;->d:I

    .line 54
    .line 55
    const-string v3, "SamplerU"

    .line 56
    .line 57
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v1, v6}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 62
    .line 63
    .line 64
    iget v1, v0, Ll/xej;->d:I

    .line 65
    .line 66
    const-string v3, "SamplerV"

    .line 67
    .line 68
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-static {v1, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 73
    .line 74
    .line 75
    iget v12, v0, Ll/xej;->f:I

    .line 76
    .line 77
    const/16 v16, 0x0

    .line 78
    .line 79
    iget-object v1, v0, Ll/xej;->b:Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    const/4 v13, 0x2

    .line 82
    const/16 v14, 0x1406

    .line 83
    .line 84
    const/4 v15, 0x0

    .line 85
    move-object/from16 v17, v1

    .line 86
    .line 87
    invoke-static/range {v12 .. v17}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 88
    .line 89
    .line 90
    iget v1, v0, Ll/xej;->f:I

    .line 91
    .line 92
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 93
    .line 94
    .line 95
    iget-object v1, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 96
    .line 97
    iget v3, v0, Ll/xej;->a:I

    .line 98
    .line 99
    aget-object v1, v1, v3

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 102
    .line 103
    .line 104
    iget v12, v0, Ll/xej;->g:I

    .line 105
    .line 106
    iget-object v1, v0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 107
    .line 108
    iget v3, v0, Ll/xej;->a:I

    .line 109
    .line 110
    aget-object v17, v1, v3

    .line 111
    .line 112
    invoke-static/range {v12 .. v17}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 113
    .line 114
    .line 115
    iget v1, v0, Ll/xej;->g:I

    .line 116
    .line 117
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 118
    .line 119
    .line 120
    iget-object v1, v0, Ll/hb20;->F:Ljava/lang/Object;

    .line 121
    .line 122
    monitor-enter v1

    .line 123
    :try_start_0
    iget-object v15, v0, Ll/nmq0;->I:Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    iget-object v3, v0, Ll/nmq0;->J:Ljava/nio/ByteBuffer;

    .line 126
    .line 127
    iget-object v4, v0, Ll/nmq0;->K:Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    if-eqz v15, :cond_2

    .line 130
    .line 131
    if-eqz v3, :cond_2

    .line 132
    .line 133
    if-nez v4, :cond_1

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {v15, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 143
    .line 144
    .line 145
    const v7, 0x84c0

    .line 146
    .line 147
    .line 148
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 149
    .line 150
    .line 151
    iget-object v7, v0, Ll/nmq0;->L:[I

    .line 152
    .line 153
    aget v2, v7, v2

    .line 154
    .line 155
    const/16 v7, 0xde1

    .line 156
    .line 157
    invoke-static {v7, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 158
    .line 159
    .line 160
    const/16 v13, 0x1909

    .line 161
    .line 162
    const/16 v14, 0x1401

    .line 163
    .line 164
    move v2, v7

    .line 165
    const/16 v7, 0xde1

    .line 166
    .line 167
    const/4 v8, 0x0

    .line 168
    const/16 v9, 0x1909

    .line 169
    .line 170
    const/4 v12, 0x0

    .line 171
    invoke-static/range {v7 .. v15}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 172
    .line 173
    .line 174
    const v7, 0x84c1

    .line 175
    .line 176
    .line 177
    invoke-static {v7}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 178
    .line 179
    .line 180
    iget-object v7, v0, Ll/nmq0;->L:[I

    .line 181
    .line 182
    aget v6, v7, v6

    .line 183
    .line 184
    invoke-static {v2, v6}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 185
    .line 186
    .line 187
    div-int/lit8 v19, v10, 0x2

    .line 188
    .line 189
    div-int/lit8 v20, v11, 0x2

    .line 190
    .line 191
    const/16 v22, 0x1909

    .line 192
    .line 193
    const/16 v23, 0x1401

    .line 194
    .line 195
    const/16 v16, 0xde1

    .line 196
    .line 197
    const/16 v17, 0x0

    .line 198
    .line 199
    const/16 v18, 0x1909

    .line 200
    .line 201
    const/16 v21, 0x0

    .line 202
    .line 203
    move-object/from16 v24, v3

    .line 204
    .line 205
    invoke-static/range {v16 .. v24}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 206
    .line 207
    .line 208
    const v3, 0x84c2

    .line 209
    .line 210
    .line 211
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 212
    .line 213
    .line 214
    iget-object v0, v0, Ll/nmq0;->L:[I

    .line 215
    .line 216
    aget v0, v0, v5

    .line 217
    .line 218
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 219
    .line 220
    .line 221
    div-int/lit8 v19, v10, 0x2

    .line 222
    .line 223
    div-int/lit8 v20, v11, 0x2

    .line 224
    .line 225
    const/16 v22, 0x1909

    .line 226
    .line 227
    const/16 v23, 0x1401

    .line 228
    .line 229
    const/16 v16, 0xde1

    .line 230
    .line 231
    const/16 v17, 0x0

    .line 232
    .line 233
    const/16 v18, 0x1909

    .line 234
    .line 235
    const/16 v21, 0x0

    .line 236
    .line 237
    move-object/from16 v24, v4

    .line 238
    .line 239
    invoke-static/range {v16 .. v24}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 240
    .line 241
    .line 242
    monitor-exit v1

    .line 243
    return-void

    .line 244
    :catchall_0
    move-exception v0

    .line 245
    goto :goto_1

    .line 246
    :cond_2
    :goto_0
    monitor-exit v1

    .line 247
    return-void

    .line 248
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    throw v0
.end method

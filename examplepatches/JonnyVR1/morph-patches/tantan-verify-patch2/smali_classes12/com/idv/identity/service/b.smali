.class public final Lcom/idv/identity/service/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/idv/identity/base/algorithm/IDFrame;

.field public final synthetic b:Lcom/idv/identity/service/IdentityFaceService;


# direct methods
.method public constructor <init>(Lcom/idv/identity/service/IdentityFaceService;Lcom/idv/identity/base/algorithm/IDFrame;)V
    .locals 0

    iput-object p1, p0, Lcom/idv/identity/service/b;->b:Lcom/idv/identity/service/IdentityFaceService;

    iput-object p2, p0, Lcom/idv/identity/service/b;->a:Lcom/idv/identity/base/algorithm/IDFrame;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "MD5"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    iget-object v4, v0, Lcom/idv/identity/service/b;->a:Lcom/idv/identity/base/algorithm/IDFrame;

    .line 11
    .line 12
    const/4 v5, 0x2

    .line 13
    const/4 v6, 0x3

    .line 14
    const/4 v7, 0x4

    .line 15
    if-eqz v4, :cond_11

    .line 16
    .line 17
    iget v10, v4, Lcom/idv/identity/base/algorithm/IDFrame;->frameMode:I

    .line 18
    .line 19
    packed-switch v10, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    const/4 v10, -0x1

    .line 23
    goto :goto_0

    .line 24
    :pswitch_0
    const/4 v10, 0x6

    .line 25
    goto :goto_0

    .line 26
    :pswitch_1
    move v10, v7

    .line 27
    goto :goto_0

    .line 28
    :pswitch_2
    move v10, v6

    .line 29
    goto :goto_0

    .line 30
    :pswitch_3
    move v10, v5

    .line 31
    goto :goto_0

    .line 32
    :pswitch_4
    move v10, v2

    .line 33
    goto :goto_0

    .line 34
    :pswitch_5
    const/4 v10, 0x0

    .line 35
    :goto_0
    if-ltz v10, :cond_11

    .line 36
    .line 37
    iget-object v12, v4, Lcom/idv/identity/base/algorithm/IDFrame;->data:[B

    .line 38
    .line 39
    iget v13, v4, Lcom/idv/identity/base/algorithm/IDFrame;->width:I

    .line 40
    .line 41
    iget v14, v4, Lcom/idv/identity/base/algorithm/IDFrame;->height:I

    .line 42
    .line 43
    invoke-static {v12, v13, v14, v10}, Ll/srq0;->b([BIII)Landroid/graphics/Bitmap;

    .line 44
    .line 45
    .line 46
    move-result-object v15

    .line 47
    if-eqz v15, :cond_11

    .line 48
    .line 49
    invoke-static {v15}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v10

    .line 57
    :try_start_0
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 58
    .line 59
    .line 60
    move-result-object v12
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :try_start_1
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    invoke-virtual {v12, v10}, Ljava/security/MessageDigest;->update([B)V
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catch_0
    const/4 v12, 0x0

    .line 70
    :catch_1
    :goto_1
    const-string v10, "%02X"

    .line 71
    .line 72
    if-eqz v12, :cond_0

    .line 73
    .line 74
    invoke-virtual {v12}, Ljava/security/MessageDigest;->digest()[B

    .line 75
    .line 76
    .line 77
    move-result-object v12

    .line 78
    array-length v13, v12

    .line 79
    const/4 v14, 0x0

    .line 80
    :goto_2
    if-ge v14, v13, :cond_0

    .line 81
    .line 82
    aget-byte v16, v12, v14

    .line 83
    .line 84
    invoke-static/range {v16 .. v16}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 85
    .line 86
    .line 87
    move-result-object v16

    .line 88
    filled-new-array/range {v16 .. v16}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    add-int/lit8 v14, v14, 0x1

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_0
    new-instance v9, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v12, "IdentityImageAndroid idFrame.rotation"

    .line 101
    .line 102
    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget v12, v4, Lcom/idv/identity/base/algorithm/IDFrame;->rotation:I

    .line 106
    .line 107
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    invoke-static {v9}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget v9, v4, Lcom/idv/identity/base/algorithm/IDFrame;->rotation:I

    .line 118
    .line 119
    invoke-static {v15}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 120
    .line 121
    .line 122
    move-result v12

    .line 123
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v12

    .line 127
    new-instance v13, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    :try_start_2
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 133
    .line 134
    .line 135
    move-result-object v14
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_2

    .line 136
    :try_start_3
    invoke-virtual {v12}, Ljava/lang/String;->getBytes()[B

    .line 137
    .line 138
    .line 139
    move-result-object v12

    .line 140
    invoke-virtual {v14, v12}, Ljava/security/MessageDigest;->update([B)V
    :try_end_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_3

    .line 141
    .line 142
    .line 143
    goto :goto_3

    .line 144
    :catch_2
    const/4 v14, 0x0

    .line 145
    :catch_3
    :goto_3
    if-eqz v14, :cond_1

    .line 146
    .line 147
    invoke-virtual {v14}, Ljava/security/MessageDigest;->digest()[B

    .line 148
    .line 149
    .line 150
    move-result-object v12

    .line 151
    array-length v14, v12

    .line 152
    const/4 v11, 0x0

    .line 153
    :goto_4
    if-ge v11, v14, :cond_1

    .line 154
    .line 155
    aget-byte v16, v12, v11

    .line 156
    .line 157
    invoke-static/range {v16 .. v16}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 158
    .line 159
    .line 160
    move-result-object v16

    .line 161
    filled-new-array/range {v16 .. v16}, [Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v8

    .line 165
    invoke-static {v10, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v8

    .line 169
    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    add-int/lit8 v11, v11, 0x1

    .line 173
    .line 174
    goto :goto_4

    .line 175
    :cond_1
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v8

    .line 179
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v8

    .line 183
    const/4 v11, 0x0

    .line 184
    :goto_5
    sget-object v12, Ll/rxk;->b:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result v12

    .line 190
    if-ge v11, v12, :cond_2

    .line 191
    .line 192
    sget-object v12, Ll/rxk;->b:Ljava/util/List;

    .line 193
    .line 194
    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v12

    .line 198
    check-cast v12, Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v12

    .line 204
    if-eq v12, v2, :cond_3

    .line 205
    .line 206
    add-int/lit8 v11, v11, 0x1

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_2
    sget-object v8, Ll/rxk;->d:Ljava/util/List;

    .line 210
    .line 211
    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    :cond_3
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    .line 215
    .line 216
    .line 217
    move-result v18

    .line 218
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    .line 219
    .line 220
    .line 221
    move-result v19

    .line 222
    new-instance v8, Landroid/graphics/Matrix;

    .line 223
    .line 224
    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 225
    .line 226
    .line 227
    int-to-float v9, v9

    .line 228
    invoke-virtual {v8, v9}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 229
    .line 230
    .line 231
    const/16 v17, 0x0

    .line 232
    .line 233
    const/16 v21, 0x0

    .line 234
    .line 235
    const/16 v16, 0x0

    .line 236
    .line 237
    move-object/from16 v20, v8

    .line 238
    .line 239
    invoke-static/range {v15 .. v21}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 240
    .line 241
    .line 242
    move-result-object v8

    .line 243
    invoke-static {v8}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 244
    .line 245
    .line 246
    move-result v9

    .line 247
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v9

    .line 251
    new-instance v11, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    :try_start_4
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 257
    .line 258
    .line 259
    move-result-object v12
    :try_end_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_4

    .line 260
    :try_start_5
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    .line 261
    .line 262
    .line 263
    move-result-object v9

    .line 264
    invoke-virtual {v12, v9}, Ljava/security/MessageDigest;->update([B)V
    :try_end_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_5

    .line 265
    .line 266
    .line 267
    goto :goto_6

    .line 268
    :catch_4
    const/4 v12, 0x0

    .line 269
    :catch_5
    :goto_6
    if-eqz v12, :cond_4

    .line 270
    .line 271
    invoke-virtual {v12}, Ljava/security/MessageDigest;->digest()[B

    .line 272
    .line 273
    .line 274
    move-result-object v9

    .line 275
    array-length v12, v9

    .line 276
    const/4 v13, 0x0

    .line 277
    :goto_7
    if-ge v13, v12, :cond_4

    .line 278
    .line 279
    aget-byte v14, v9, v13

    .line 280
    .line 281
    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 282
    .line 283
    .line 284
    move-result-object v14

    .line 285
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v14

    .line 289
    invoke-static {v10, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v14

    .line 293
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    add-int/lit8 v13, v13, 0x1

    .line 297
    .line 298
    goto :goto_7

    .line 299
    :cond_4
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v9

    .line 303
    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v9

    .line 307
    sget-object v11, Ll/rxk;->b:Ljava/util/List;

    .line 308
    .line 309
    invoke-interface {v11, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    invoke-virtual {v8, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v9

    .line 316
    if-eqz v9, :cond_5

    .line 317
    .line 318
    goto :goto_8

    .line 319
    :cond_5
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->recycle()V

    .line 320
    .line 321
    .line 322
    :goto_8
    invoke-static {v8}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 323
    .line 324
    .line 325
    move-result v9

    .line 326
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v9

    .line 330
    new-instance v11, Ljava/lang/StringBuilder;

    .line 331
    .line 332
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 333
    .line 334
    .line 335
    :try_start_6
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 336
    .line 337
    .line 338
    move-result-object v12
    :try_end_6
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6 .. :try_end_6} :catch_6

    .line 339
    :try_start_7
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    .line 340
    .line 341
    .line 342
    move-result-object v9

    .line 343
    invoke-virtual {v12, v9}, Ljava/security/MessageDigest;->update([B)V
    :try_end_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_7} :catch_7

    .line 344
    .line 345
    .line 346
    goto :goto_9

    .line 347
    :catch_6
    const/4 v12, 0x0

    .line 348
    :catch_7
    :goto_9
    if-eqz v12, :cond_6

    .line 349
    .line 350
    invoke-virtual {v12}, Ljava/security/MessageDigest;->digest()[B

    .line 351
    .line 352
    .line 353
    move-result-object v9

    .line 354
    array-length v12, v9

    .line 355
    const/4 v13, 0x0

    .line 356
    :goto_a
    if-ge v13, v12, :cond_6

    .line 357
    .line 358
    aget-byte v14, v9, v13

    .line 359
    .line 360
    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 361
    .line 362
    .line 363
    move-result-object v14

    .line 364
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v14

    .line 368
    invoke-static {v10, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v14

    .line 372
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    add-int/lit8 v13, v13, 0x1

    .line 376
    .line 377
    goto :goto_a

    .line 378
    :cond_6
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v9

    .line 382
    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v9

    .line 386
    const/4 v11, 0x0

    .line 387
    :goto_b
    sget-object v12, Ll/rxk;->b:Ljava/util/List;

    .line 388
    .line 389
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 390
    .line 391
    .line 392
    move-result v12

    .line 393
    if-ge v11, v12, :cond_7

    .line 394
    .line 395
    sget-object v12, Ll/rxk;->b:Ljava/util/List;

    .line 396
    .line 397
    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v12

    .line 401
    check-cast v12, Ljava/lang/String;

    .line 402
    .line 403
    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    move-result v12

    .line 407
    if-eq v12, v2, :cond_8

    .line 408
    .line 409
    add-int/lit8 v11, v11, 0x1

    .line 410
    .line 411
    goto :goto_b

    .line 412
    :cond_7
    sget-object v9, Ll/rxk;->d:Ljava/util/List;

    .line 413
    .line 414
    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    :cond_8
    const/16 v9, 0x9

    .line 418
    .line 419
    new-array v9, v9, [F

    .line 420
    .line 421
    fill-array-data v9, :array_0

    .line 422
    .line 423
    .line 424
    new-instance v11, Landroid/graphics/Matrix;

    .line 425
    .line 426
    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    .line 427
    .line 428
    .line 429
    invoke-virtual {v11, v9}, Landroid/graphics/Matrix;->setValues([F)V

    .line 430
    .line 431
    .line 432
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getWidth()I

    .line 433
    .line 434
    .line 435
    move-result v25

    .line 436
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    .line 437
    .line 438
    .line 439
    move-result v26

    .line 440
    const/16 v24, 0x0

    .line 441
    .line 442
    const/16 v28, 0x1

    .line 443
    .line 444
    const/16 v23, 0x0

    .line 445
    .line 446
    move-object/from16 v22, v8

    .line 447
    .line 448
    move-object/from16 v27, v11

    .line 449
    .line 450
    invoke-static/range {v22 .. v28}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 451
    .line 452
    .line 453
    move-result-object v12

    .line 454
    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Bitmap;->recycle()V

    .line 455
    .line 456
    .line 457
    invoke-static {v12}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 458
    .line 459
    .line 460
    move-result v8

    .line 461
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object v8

    .line 465
    new-instance v9, Ljava/lang/StringBuilder;

    .line 466
    .line 467
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 468
    .line 469
    .line 470
    :try_start_8
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 471
    .line 472
    .line 473
    move-result-object v11
    :try_end_8
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_8 .. :try_end_8} :catch_8

    .line 474
    :try_start_9
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    .line 475
    .line 476
    .line 477
    move-result-object v8

    .line 478
    invoke-virtual {v11, v8}, Ljava/security/MessageDigest;->update([B)V
    :try_end_9
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_9 .. :try_end_9} :catch_9

    .line 479
    .line 480
    .line 481
    goto :goto_c

    .line 482
    :catch_8
    const/4 v11, 0x0

    .line 483
    :catch_9
    :goto_c
    if-eqz v11, :cond_9

    .line 484
    .line 485
    invoke-virtual {v11}, Ljava/security/MessageDigest;->digest()[B

    .line 486
    .line 487
    .line 488
    move-result-object v8

    .line 489
    array-length v11, v8

    .line 490
    const/4 v13, 0x0

    .line 491
    :goto_d
    if-ge v13, v11, :cond_9

    .line 492
    .line 493
    aget-byte v14, v8, v13

    .line 494
    .line 495
    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 496
    .line 497
    .line 498
    move-result-object v14

    .line 499
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v14

    .line 503
    invoke-static {v10, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v14

    .line 507
    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    add-int/lit8 v13, v13, 0x1

    .line 511
    .line 512
    goto :goto_d

    .line 513
    :cond_9
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object v8

    .line 517
    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v8

    .line 521
    sget-object v9, Ll/rxk;->b:Ljava/util/List;

    .line 522
    .line 523
    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    if-eqz v12, :cond_11

    .line 527
    .line 528
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    .line 529
    .line 530
    .line 531
    move-result v8

    .line 532
    const/16 v9, 0x1e0

    .line 533
    .line 534
    if-le v8, v9, :cond_a

    .line 535
    .line 536
    goto :goto_e

    .line 537
    :cond_a
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    .line 538
    .line 539
    .line 540
    move-result v9

    .line 541
    :goto_e
    iget v4, v4, Lcom/idv/identity/base/algorithm/IDFrame;->width:I

    .line 542
    .line 543
    if-eq v9, v4, :cond_10

    .line 544
    .line 545
    invoke-static {v12}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 546
    .line 547
    .line 548
    move-result v4

    .line 549
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v4

    .line 553
    new-instance v8, Ljava/lang/StringBuilder;

    .line 554
    .line 555
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 556
    .line 557
    .line 558
    :try_start_a
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 559
    .line 560
    .line 561
    move-result-object v11
    :try_end_a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_a .. :try_end_a} :catch_a

    .line 562
    :try_start_b
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 563
    .line 564
    .line 565
    move-result-object v4

    .line 566
    invoke-virtual {v11, v4}, Ljava/security/MessageDigest;->update([B)V
    :try_end_b
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_b .. :try_end_b} :catch_b

    .line 567
    .line 568
    .line 569
    goto :goto_f

    .line 570
    :catch_a
    const/4 v11, 0x0

    .line 571
    :catch_b
    :goto_f
    if-eqz v11, :cond_b

    .line 572
    .line 573
    invoke-virtual {v11}, Ljava/security/MessageDigest;->digest()[B

    .line 574
    .line 575
    .line 576
    move-result-object v4

    .line 577
    array-length v11, v4

    .line 578
    const/4 v13, 0x0

    .line 579
    :goto_10
    if-ge v13, v11, :cond_b

    .line 580
    .line 581
    aget-byte v14, v4, v13

    .line 582
    .line 583
    invoke-static {v14}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 584
    .line 585
    .line 586
    move-result-object v14

    .line 587
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v14

    .line 591
    invoke-static {v10, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 592
    .line 593
    .line 594
    move-result-object v14

    .line 595
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    add-int/lit8 v13, v13, 0x1

    .line 599
    .line 600
    goto :goto_10

    .line 601
    :cond_b
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 602
    .line 603
    .line 604
    move-result-object v4

    .line 605
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v4

    .line 609
    const/4 v8, 0x0

    .line 610
    :goto_11
    sget-object v11, Ll/rxk;->b:Ljava/util/List;

    .line 611
    .line 612
    invoke-interface {v11}, Ljava/util/List;->size()I

    .line 613
    .line 614
    .line 615
    move-result v11

    .line 616
    if-ge v8, v11, :cond_c

    .line 617
    .line 618
    sget-object v11, Ll/rxk;->b:Ljava/util/List;

    .line 619
    .line 620
    invoke-interface {v11, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 621
    .line 622
    .line 623
    move-result-object v11

    .line 624
    check-cast v11, Ljava/lang/String;

    .line 625
    .line 626
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 627
    .line 628
    .line 629
    move-result v11

    .line 630
    if-eq v11, v2, :cond_d

    .line 631
    .line 632
    add-int/lit8 v8, v8, 0x1

    .line 633
    .line 634
    goto :goto_11

    .line 635
    :cond_c
    sget-object v4, Ll/rxk;->d:Ljava/util/List;

    .line 636
    .line 637
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    :cond_d
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    .line 641
    .line 642
    .line 643
    move-result v15

    .line 644
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    .line 645
    .line 646
    .line 647
    move-result v16

    .line 648
    int-to-float v3, v9

    .line 649
    int-to-float v4, v15

    .line 650
    div-float/2addr v3, v4

    .line 651
    new-instance v4, Landroid/graphics/Matrix;

    .line 652
    .line 653
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 654
    .line 655
    .line 656
    invoke-virtual {v4, v3, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 657
    .line 658
    .line 659
    const/4 v14, 0x0

    .line 660
    const/16 v18, 0x1

    .line 661
    .line 662
    const/4 v13, 0x0

    .line 663
    move-object/from16 v17, v4

    .line 664
    .line 665
    invoke-static/range {v12 .. v18}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 666
    .line 667
    .line 668
    move-result-object v3

    .line 669
    if-eq v3, v12, :cond_e

    .line 670
    .line 671
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->recycle()V

    .line 672
    .line 673
    .line 674
    :cond_e
    invoke-static {v3}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 675
    .line 676
    .line 677
    move-result v4

    .line 678
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 679
    .line 680
    .line 681
    move-result-object v4

    .line 682
    new-instance v8, Ljava/lang/StringBuilder;

    .line 683
    .line 684
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 685
    .line 686
    .line 687
    :try_start_c
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 688
    .line 689
    .line 690
    move-result-object v9
    :try_end_c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_c .. :try_end_c} :catch_c

    .line 691
    :try_start_d
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 692
    .line 693
    .line 694
    move-result-object v1

    .line 695
    invoke-virtual {v9, v1}, Ljava/security/MessageDigest;->update([B)V
    :try_end_d
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_d .. :try_end_d} :catch_d

    .line 696
    .line 697
    .line 698
    goto :goto_12

    .line 699
    :catch_c
    const/4 v9, 0x0

    .line 700
    :catch_d
    :goto_12
    if-eqz v9, :cond_f

    .line 701
    .line 702
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    .line 703
    .line 704
    .line 705
    move-result-object v1

    .line 706
    array-length v4, v1

    .line 707
    const/4 v11, 0x0

    .line 708
    :goto_13
    if-ge v11, v4, :cond_f

    .line 709
    .line 710
    aget-byte v9, v1, v11

    .line 711
    .line 712
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 713
    .line 714
    .line 715
    move-result-object v9

    .line 716
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 717
    .line 718
    .line 719
    move-result-object v9

    .line 720
    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object v9

    .line 724
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 725
    .line 726
    .line 727
    add-int/lit8 v11, v11, 0x1

    .line 728
    .line 729
    goto :goto_13

    .line 730
    :cond_f
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 731
    .line 732
    .line 733
    move-result-object v1

    .line 734
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 735
    .line 736
    .line 737
    move-result-object v1

    .line 738
    sget-object v4, Ll/rxk;->b:Ljava/util/List;

    .line 739
    .line 740
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 741
    .line 742
    .line 743
    move-object v9, v3

    .line 744
    goto :goto_14

    .line 745
    :cond_10
    move-object v9, v12

    .line 746
    goto :goto_14

    .line 747
    :cond_11
    const/4 v9, 0x0

    .line 748
    :goto_14
    if-nez v9, :cond_12

    .line 749
    .line 750
    const-string v0, "IdentityFaceService highQualityImage  is  null"

    .line 751
    .line 752
    invoke-static {v0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 753
    .line 754
    .line 755
    return-void

    .line 756
    :cond_12
    iget-object v1, v0, Lcom/idv/identity/service/b;->b:Lcom/idv/identity/service/IdentityFaceService;

    .line 757
    .line 758
    iget-object v1, v1, Lcom/idv/identity/service/IdentityFaceService;->identityFaceCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 759
    .line 760
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 761
    .line 762
    .line 763
    move-result-object v1

    .line 764
    :cond_13
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 765
    .line 766
    .line 767
    move-result v3

    .line 768
    if-eqz v3, :cond_1a

    .line 769
    .line 770
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 771
    .line 772
    .line 773
    move-result-object v3

    .line 774
    check-cast v3, Ll/gfm;

    .line 775
    .line 776
    iget-object v4, v0, Lcom/idv/identity/service/b;->a:Lcom/idv/identity/base/algorithm/IDFrame;

    .line 777
    .line 778
    iget v4, v4, Lcom/idv/identity/base/algorithm/IDFrame;->frameType:I

    .line 779
    .line 780
    if-ne v4, v5, :cond_14

    .line 781
    .line 782
    invoke-interface {v3, v9}, Ll/gfm;->h(Landroid/graphics/Bitmap;)V

    .line 783
    .line 784
    .line 785
    goto :goto_15

    .line 786
    :cond_14
    if-ne v4, v6, :cond_15

    .line 787
    .line 788
    invoke-interface {v3, v9}, Ll/gfm;->l(Landroid/graphics/Bitmap;)V

    .line 789
    .line 790
    .line 791
    goto :goto_15

    .line 792
    :cond_15
    if-ne v4, v2, :cond_16

    .line 793
    .line 794
    invoke-interface {v3, v9}, Ll/gfm;->b(Landroid/graphics/Bitmap;)V

    .line 795
    .line 796
    .line 797
    goto :goto_15

    .line 798
    :cond_16
    if-ne v4, v7, :cond_17

    .line 799
    .line 800
    invoke-interface {v3, v9}, Ll/gfm;->d(Landroid/graphics/Bitmap;)V

    .line 801
    .line 802
    .line 803
    goto :goto_15

    .line 804
    :cond_17
    const/4 v8, 0x5

    .line 805
    if-ne v4, v8, :cond_18

    .line 806
    .line 807
    invoke-interface {v3, v9}, Ll/gfm;->c(Landroid/graphics/Bitmap;)V

    .line 808
    .line 809
    .line 810
    goto :goto_15

    .line 811
    :cond_18
    const/4 v8, 0x6

    .line 812
    if-ne v4, v8, :cond_19

    .line 813
    .line 814
    invoke-interface {v3, v9}, Ll/gfm;->i(Landroid/graphics/Bitmap;)V

    .line 815
    .line 816
    .line 817
    goto :goto_15

    .line 818
    :cond_19
    const/4 v10, 0x7

    .line 819
    if-ne v4, v10, :cond_13

    .line 820
    .line 821
    invoke-interface {v3, v9}, Ll/gfm;->a(Landroid/graphics/Bitmap;)V

    .line 822
    .line 823
    .line 824
    goto :goto_15

    .line 825
    :cond_1a
    return-void

    .line 826
    nop

    .line 827
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

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
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

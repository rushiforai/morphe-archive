.class public final Ll/ker0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ifr0;


# static fields
.field public static final d:[I

.field public static final e:Ll/jer0;

.field public static final f:Ll/jer0;


# instance fields
.field public b:Lcom/google/android/gms/internal/ads/zzgaa;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/vor0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/ker0;->d:[I

    .line 9
    .line 10
    new-instance v0, Ll/jer0;

    .line 11
    .line 12
    sget-object v1, Ll/ger0;->a:Ll/ger0;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/jer0;-><init>(Ll/ier0;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/ker0;->e:Ll/jer0;

    .line 18
    .line 19
    new-instance v0, Ll/jer0;

    .line 20
    .line 21
    sget-object v1, Ll/her0;->a:Ll/her0;

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/jer0;-><init>(Ll/ier0;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/ker0;->f:Ll/jer0;

    .line 27
    .line 28
    return-void

    .line 29
    :array_0
    .array-data 4
        0x5
        0x4
        0xc
        0x8
        0x3
        0xa
        0x9
        0xb
        0x6
        0x2
        0x0
        0x1
        0x7
        0x10
        0xf
        0xe
        0x11
        0x12
        0x13
        0x14
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ror0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ror0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ker0;->c:Ll/vor0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Landroid/net/Uri;Ljava/util/Map;)[Ll/per0;
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/16 v2, 0x14

    .line 7
    .line 8
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    const-string v3, "Content-Type"

    .line 12
    .line 13
    move-object/from16 v4, p2

    .line 14
    .line 15
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Ljava/util/List;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    if-eqz v6, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    move-object v4, v3

    .line 37
    check-cast v4, Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto/16 :goto_b

    .line 42
    .line 43
    :cond_1
    :goto_0
    const/16 v7, 0x10

    .line 44
    .line 45
    const/16 v8, 0x11

    .line 46
    .line 47
    const/4 v9, 0x5

    .line 48
    const/4 v10, 0x4

    .line 49
    const/4 v11, 0x7

    .line 50
    const/4 v12, 0x6

    .line 51
    const/16 v13, 0xb

    .line 52
    .line 53
    const/16 v14, 0xe

    .line 54
    .line 55
    const/16 v15, 0xd

    .line 56
    .line 57
    const/16 v16, 0x13

    .line 58
    .line 59
    const/16 v17, 0x9

    .line 60
    .line 61
    const/16 v18, 0xc

    .line 62
    .line 63
    const/16 v19, 0x1

    .line 64
    .line 65
    const/16 v20, 0xf

    .line 66
    .line 67
    const/16 v21, 0x8

    .line 68
    .line 69
    const/16 v22, 0xa

    .line 70
    .line 71
    const/4 v3, -0x1

    .line 72
    if-nez v4, :cond_3

    .line 73
    .line 74
    :cond_2
    :goto_1
    move v4, v3

    .line 75
    goto/16 :goto_6

    .line 76
    .line 77
    :cond_3
    invoke-static {v4}, Ll/a8t0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v23

    .line 85
    sparse-switch v23, :sswitch_data_0

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :sswitch_0
    const-string v5, "video/x-matroska"

    .line 90
    .line 91
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eqz v4, :cond_2

    .line 96
    .line 97
    goto/16 :goto_4

    .line 98
    .line 99
    :sswitch_1
    const-string v5, "audio/webm"

    .line 100
    .line 101
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_2

    .line 106
    .line 107
    goto/16 :goto_4

    .line 108
    .line 109
    :sswitch_2
    const-string v5, "audio/mpeg"

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    if-eqz v4, :cond_2

    .line 116
    .line 117
    move v4, v11

    .line 118
    goto/16 :goto_6

    .line 119
    .line 120
    :sswitch_3
    const-string v5, "audio/midi"

    .line 121
    .line 122
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    if-eqz v4, :cond_2

    .line 127
    .line 128
    move/from16 v4, v20

    .line 129
    .line 130
    goto/16 :goto_6

    .line 131
    .line 132
    :sswitch_4
    const-string v5, "audio/flac"

    .line 133
    .line 134
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_2

    .line 139
    .line 140
    move v4, v10

    .line 141
    goto/16 :goto_6

    .line 142
    .line 143
    :sswitch_5
    const-string v5, "audio/eac3"

    .line 144
    .line 145
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    if-eqz v4, :cond_2

    .line 150
    .line 151
    goto/16 :goto_5

    .line 152
    .line 153
    :sswitch_6
    const-string v5, "audio/3gpp"

    .line 154
    .line 155
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    if-eqz v4, :cond_2

    .line 160
    .line 161
    goto/16 :goto_3

    .line 162
    .line 163
    :sswitch_7
    const-string v5, "video/mp4"

    .line 164
    .line 165
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    if-eqz v4, :cond_2

    .line 170
    .line 171
    goto/16 :goto_2

    .line 172
    .line 173
    :sswitch_8
    const-string v5, "audio/wav"

    .line 174
    .line 175
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-eqz v4, :cond_2

    .line 180
    .line 181
    move/from16 v4, v18

    .line 182
    .line 183
    goto/16 :goto_6

    .line 184
    .line 185
    :sswitch_9
    const-string v5, "audio/ogg"

    .line 186
    .line 187
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v4

    .line 191
    if-eqz v4, :cond_2

    .line 192
    .line 193
    move/from16 v4, v17

    .line 194
    .line 195
    goto/16 :goto_6

    .line 196
    .line 197
    :sswitch_a
    const-string v5, "audio/mp4"

    .line 198
    .line 199
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    if-eqz v4, :cond_2

    .line 204
    .line 205
    goto/16 :goto_2

    .line 206
    .line 207
    :sswitch_b
    const-string v5, "audio/amr"

    .line 208
    .line 209
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    if-eqz v4, :cond_2

    .line 214
    .line 215
    goto/16 :goto_3

    .line 216
    .line 217
    :sswitch_c
    const-string v5, "audio/ac4"

    .line 218
    .line 219
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    if-eqz v4, :cond_2

    .line 224
    .line 225
    move/from16 v4, v19

    .line 226
    .line 227
    goto/16 :goto_6

    .line 228
    .line 229
    :sswitch_d
    const-string v5, "audio/ac3"

    .line 230
    .line 231
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v4

    .line 235
    if-eqz v4, :cond_2

    .line 236
    .line 237
    goto/16 :goto_5

    .line 238
    .line 239
    :sswitch_e
    const-string v5, "video/x-flv"

    .line 240
    .line 241
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    if-eqz v4, :cond_2

    .line 246
    .line 247
    move v4, v9

    .line 248
    goto/16 :goto_6

    .line 249
    .line 250
    :sswitch_f
    const-string v5, "application/webm"

    .line 251
    .line 252
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result v4

    .line 256
    if-eqz v4, :cond_2

    .line 257
    .line 258
    goto/16 :goto_4

    .line 259
    .line 260
    :sswitch_10
    const-string v5, "audio/x-matroska"

    .line 261
    .line 262
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v4

    .line 266
    if-eqz v4, :cond_2

    .line 267
    .line 268
    goto/16 :goto_4

    .line 269
    .line 270
    :sswitch_11
    const-string v5, "image/png"

    .line 271
    .line 272
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v4

    .line 276
    if-eqz v4, :cond_2

    .line 277
    .line 278
    move v4, v8

    .line 279
    goto/16 :goto_6

    .line 280
    .line 281
    :sswitch_12
    const-string v5, "image/bmp"

    .line 282
    .line 283
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    if-eqz v4, :cond_2

    .line 288
    .line 289
    move/from16 v4, v16

    .line 290
    .line 291
    goto/16 :goto_6

    .line 292
    .line 293
    :sswitch_13
    const-string v5, "text/vtt"

    .line 294
    .line 295
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v4

    .line 299
    if-eqz v4, :cond_2

    .line 300
    .line 301
    move v4, v15

    .line 302
    goto/16 :goto_6

    .line 303
    .line 304
    :sswitch_14
    const-string v5, "video/x-msvideo"

    .line 305
    .line 306
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result v4

    .line 310
    if-eqz v4, :cond_2

    .line 311
    .line 312
    move v4, v7

    .line 313
    goto/16 :goto_6

    .line 314
    .line 315
    :sswitch_15
    const-string v5, "application/mp4"

    .line 316
    .line 317
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v4

    .line 321
    if-eqz v4, :cond_2

    .line 322
    .line 323
    :goto_2
    move/from16 v4, v21

    .line 324
    .line 325
    goto :goto_6

    .line 326
    :sswitch_16
    const-string v5, "image/webp"

    .line 327
    .line 328
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v4

    .line 332
    if-eqz v4, :cond_2

    .line 333
    .line 334
    const/16 v4, 0x12

    .line 335
    .line 336
    goto :goto_6

    .line 337
    :sswitch_17
    const-string v5, "image/jpeg"

    .line 338
    .line 339
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v4

    .line 343
    if-eqz v4, :cond_2

    .line 344
    .line 345
    move v4, v14

    .line 346
    goto :goto_6

    .line 347
    :sswitch_18
    const-string v5, "image/heif"

    .line 348
    .line 349
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v4

    .line 353
    if-eqz v4, :cond_2

    .line 354
    .line 355
    move v4, v2

    .line 356
    goto :goto_6

    .line 357
    :sswitch_19
    const-string v5, "audio/amr-wb"

    .line 358
    .line 359
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 360
    .line 361
    .line 362
    move-result v4

    .line 363
    if-eqz v4, :cond_2

    .line 364
    .line 365
    :goto_3
    const/4 v4, 0x3

    .line 366
    goto :goto_6

    .line 367
    :sswitch_1a
    const-string v5, "video/webm"

    .line 368
    .line 369
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    move-result v4

    .line 373
    if-eqz v4, :cond_2

    .line 374
    .line 375
    :goto_4
    move v4, v12

    .line 376
    goto :goto_6

    .line 377
    :sswitch_1b
    const-string v5, "video/mp2t"

    .line 378
    .line 379
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result v4

    .line 383
    if-eqz v4, :cond_2

    .line 384
    .line 385
    move v4, v13

    .line 386
    goto :goto_6

    .line 387
    :sswitch_1c
    const-string v5, "video/mp2p"

    .line 388
    .line 389
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result v4

    .line 393
    if-eqz v4, :cond_2

    .line 394
    .line 395
    move/from16 v4, v22

    .line 396
    .line 397
    goto :goto_6

    .line 398
    :sswitch_1d
    const-string v5, "audio/eac3-joc"

    .line 399
    .line 400
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 401
    .line 402
    .line 403
    move-result v4

    .line 404
    if-eqz v4, :cond_2

    .line 405
    .line 406
    :goto_5
    const/4 v4, 0x0

    .line 407
    :goto_6
    if-eq v4, v3, :cond_4

    .line 408
    .line 409
    invoke-virtual {v1, v4, v0}, Ll/ker0;->b(ILjava/util/List;)V

    .line 410
    .line 411
    .line 412
    :cond_4
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v5

    .line 416
    if-nez v5, :cond_6

    .line 417
    .line 418
    :cond_5
    move v12, v3

    .line 419
    goto/16 :goto_8

    .line 420
    .line 421
    :cond_6
    const-string v6, ".ac3"

    .line 422
    .line 423
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 424
    .line 425
    .line 426
    move-result v6

    .line 427
    if-nez v6, :cond_7

    .line 428
    .line 429
    const-string v6, ".ec3"

    .line 430
    .line 431
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 432
    .line 433
    .line 434
    move-result v6

    .line 435
    if-eqz v6, :cond_8

    .line 436
    .line 437
    :cond_7
    const/4 v12, 0x0

    .line 438
    goto/16 :goto_8

    .line 439
    .line 440
    :cond_8
    const-string v6, ".ac4"

    .line 441
    .line 442
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 443
    .line 444
    .line 445
    move-result v6

    .line 446
    if-eqz v6, :cond_a

    .line 447
    .line 448
    :cond_9
    :goto_7
    move/from16 v12, v19

    .line 449
    .line 450
    goto/16 :goto_8

    .line 451
    .line 452
    :cond_a
    const-string v6, ".adts"

    .line 453
    .line 454
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 455
    .line 456
    .line 457
    move-result v6

    .line 458
    const/16 v19, 0x2

    .line 459
    .line 460
    if-nez v6, :cond_9

    .line 461
    .line 462
    const-string v6, ".aac"

    .line 463
    .line 464
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 465
    .line 466
    .line 467
    move-result v6

    .line 468
    if-eqz v6, :cond_b

    .line 469
    .line 470
    goto :goto_7

    .line 471
    :cond_b
    const-string v6, ".amr"

    .line 472
    .line 473
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 474
    .line 475
    .line 476
    move-result v6

    .line 477
    if-eqz v6, :cond_c

    .line 478
    .line 479
    const/4 v12, 0x3

    .line 480
    goto/16 :goto_8

    .line 481
    .line 482
    :cond_c
    const-string v6, ".flac"

    .line 483
    .line 484
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 485
    .line 486
    .line 487
    move-result v6

    .line 488
    if-eqz v6, :cond_d

    .line 489
    .line 490
    move v12, v10

    .line 491
    goto/16 :goto_8

    .line 492
    .line 493
    :cond_d
    const-string v6, ".flv"

    .line 494
    .line 495
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 496
    .line 497
    .line 498
    move-result v6

    .line 499
    if-eqz v6, :cond_e

    .line 500
    .line 501
    move v12, v9

    .line 502
    goto/16 :goto_8

    .line 503
    .line 504
    :cond_e
    const-string v6, ".mid"

    .line 505
    .line 506
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 507
    .line 508
    .line 509
    move-result v6

    .line 510
    if-nez v6, :cond_f

    .line 511
    .line 512
    const-string v6, ".midi"

    .line 513
    .line 514
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 515
    .line 516
    .line 517
    move-result v6

    .line 518
    if-nez v6, :cond_f

    .line 519
    .line 520
    const-string v6, ".smf"

    .line 521
    .line 522
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 523
    .line 524
    .line 525
    move-result v6

    .line 526
    if-eqz v6, :cond_10

    .line 527
    .line 528
    :cond_f
    move/from16 v12, v20

    .line 529
    .line 530
    goto/16 :goto_8

    .line 531
    .line 532
    :cond_10
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 533
    .line 534
    .line 535
    move-result v6

    .line 536
    const-string v9, ".mk"

    .line 537
    .line 538
    add-int/lit8 v6, v6, -0x4

    .line 539
    .line 540
    invoke-virtual {v5, v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 541
    .line 542
    .line 543
    move-result v6

    .line 544
    if-nez v6, :cond_26

    .line 545
    .line 546
    const-string v6, ".webm"

    .line 547
    .line 548
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 549
    .line 550
    .line 551
    move-result v6

    .line 552
    if-eqz v6, :cond_11

    .line 553
    .line 554
    goto/16 :goto_8

    .line 555
    .line 556
    :cond_11
    const-string v6, ".mp3"

    .line 557
    .line 558
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 559
    .line 560
    .line 561
    move-result v6

    .line 562
    if-eqz v6, :cond_12

    .line 563
    .line 564
    move v12, v11

    .line 565
    goto/16 :goto_8

    .line 566
    .line 567
    :cond_12
    const-string v6, ".mp4"

    .line 568
    .line 569
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 570
    .line 571
    .line 572
    move-result v6

    .line 573
    if-nez v6, :cond_13

    .line 574
    .line 575
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 576
    .line 577
    .line 578
    move-result v6

    .line 579
    add-int/lit8 v6, v6, -0x4

    .line 580
    .line 581
    const-string v9, ".m4"

    .line 582
    .line 583
    invoke-virtual {v5, v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 584
    .line 585
    .line 586
    move-result v6

    .line 587
    if-nez v6, :cond_13

    .line 588
    .line 589
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 590
    .line 591
    .line 592
    move-result v6

    .line 593
    const-string v9, ".mp4"

    .line 594
    .line 595
    add-int/lit8 v6, v6, -0x5

    .line 596
    .line 597
    invoke-virtual {v5, v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 598
    .line 599
    .line 600
    move-result v6

    .line 601
    if-nez v6, :cond_13

    .line 602
    .line 603
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 604
    .line 605
    .line 606
    move-result v6

    .line 607
    add-int/lit8 v6, v6, -0x5

    .line 608
    .line 609
    const-string v9, ".cmf"

    .line 610
    .line 611
    invoke-virtual {v5, v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 612
    .line 613
    .line 614
    move-result v6

    .line 615
    if-eqz v6, :cond_14

    .line 616
    .line 617
    :cond_13
    move/from16 v12, v21

    .line 618
    .line 619
    goto/16 :goto_8

    .line 620
    .line 621
    :cond_14
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 622
    .line 623
    .line 624
    move-result v6

    .line 625
    add-int/lit8 v6, v6, -0x4

    .line 626
    .line 627
    const-string v9, ".og"

    .line 628
    .line 629
    invoke-virtual {v5, v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 630
    .line 631
    .line 632
    move-result v6

    .line 633
    if-nez v6, :cond_15

    .line 634
    .line 635
    const-string v6, ".opus"

    .line 636
    .line 637
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 638
    .line 639
    .line 640
    move-result v6

    .line 641
    if-eqz v6, :cond_16

    .line 642
    .line 643
    :cond_15
    move/from16 v12, v17

    .line 644
    .line 645
    goto/16 :goto_8

    .line 646
    .line 647
    :cond_16
    const-string v6, ".ps"

    .line 648
    .line 649
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 650
    .line 651
    .line 652
    move-result v6

    .line 653
    if-nez v6, :cond_17

    .line 654
    .line 655
    const-string v6, ".mpeg"

    .line 656
    .line 657
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 658
    .line 659
    .line 660
    move-result v6

    .line 661
    if-nez v6, :cond_17

    .line 662
    .line 663
    const-string v6, ".mpg"

    .line 664
    .line 665
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 666
    .line 667
    .line 668
    move-result v6

    .line 669
    if-nez v6, :cond_17

    .line 670
    .line 671
    const-string v6, ".m2p"

    .line 672
    .line 673
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 674
    .line 675
    .line 676
    move-result v6

    .line 677
    if-eqz v6, :cond_18

    .line 678
    .line 679
    :cond_17
    move/from16 v12, v22

    .line 680
    .line 681
    goto/16 :goto_8

    .line 682
    .line 683
    :cond_18
    const-string v6, ".ts"

    .line 684
    .line 685
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 686
    .line 687
    .line 688
    move-result v6

    .line 689
    if-nez v6, :cond_19

    .line 690
    .line 691
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 692
    .line 693
    .line 694
    move-result v6

    .line 695
    add-int/lit8 v6, v6, -0x4

    .line 696
    .line 697
    const-string v9, ".ts"

    .line 698
    .line 699
    invoke-virtual {v5, v9, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 700
    .line 701
    .line 702
    move-result v6

    .line 703
    if-eqz v6, :cond_1a

    .line 704
    .line 705
    :cond_19
    move v12, v13

    .line 706
    goto/16 :goto_8

    .line 707
    .line 708
    :cond_1a
    const-string v6, ".wav"

    .line 709
    .line 710
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 711
    .line 712
    .line 713
    move-result v6

    .line 714
    if-nez v6, :cond_1b

    .line 715
    .line 716
    const-string v6, ".wave"

    .line 717
    .line 718
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 719
    .line 720
    .line 721
    move-result v6

    .line 722
    if-eqz v6, :cond_1c

    .line 723
    .line 724
    :cond_1b
    move/from16 v12, v18

    .line 725
    .line 726
    goto/16 :goto_8

    .line 727
    .line 728
    :cond_1c
    const-string v6, ".vtt"

    .line 729
    .line 730
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 731
    .line 732
    .line 733
    move-result v6

    .line 734
    if-nez v6, :cond_1d

    .line 735
    .line 736
    const-string v6, ".webvtt"

    .line 737
    .line 738
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 739
    .line 740
    .line 741
    move-result v6

    .line 742
    if-eqz v6, :cond_1e

    .line 743
    .line 744
    :cond_1d
    move v12, v15

    .line 745
    goto :goto_8

    .line 746
    :cond_1e
    const-string v6, ".jpg"

    .line 747
    .line 748
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 749
    .line 750
    .line 751
    move-result v6

    .line 752
    if-nez v6, :cond_1f

    .line 753
    .line 754
    const-string v6, ".jpeg"

    .line 755
    .line 756
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 757
    .line 758
    .line 759
    move-result v6

    .line 760
    if-eqz v6, :cond_20

    .line 761
    .line 762
    :cond_1f
    move v12, v14

    .line 763
    goto :goto_8

    .line 764
    :cond_20
    const-string v6, ".avi"

    .line 765
    .line 766
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 767
    .line 768
    .line 769
    move-result v6

    .line 770
    if-eqz v6, :cond_21

    .line 771
    .line 772
    move v12, v7

    .line 773
    goto :goto_8

    .line 774
    :cond_21
    const-string v6, ".png"

    .line 775
    .line 776
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 777
    .line 778
    .line 779
    move-result v6

    .line 780
    if-eqz v6, :cond_22

    .line 781
    .line 782
    move v12, v8

    .line 783
    goto :goto_8

    .line 784
    :cond_22
    const-string v6, ".webp"

    .line 785
    .line 786
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 787
    .line 788
    .line 789
    move-result v6

    .line 790
    if-eqz v6, :cond_23

    .line 791
    .line 792
    const/16 v12, 0x12

    .line 793
    .line 794
    goto :goto_8

    .line 795
    :cond_23
    const-string v6, ".bmp"

    .line 796
    .line 797
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 798
    .line 799
    .line 800
    move-result v6

    .line 801
    if-nez v6, :cond_24

    .line 802
    .line 803
    const-string v6, ".dib"

    .line 804
    .line 805
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 806
    .line 807
    .line 808
    move-result v6

    .line 809
    if-eqz v6, :cond_25

    .line 810
    .line 811
    :cond_24
    move/from16 v12, v16

    .line 812
    .line 813
    goto :goto_8

    .line 814
    :cond_25
    const-string v6, ".heic"

    .line 815
    .line 816
    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 817
    .line 818
    .line 819
    move-result v5

    .line 820
    if-eqz v5, :cond_5

    .line 821
    .line 822
    move v12, v2

    .line 823
    :cond_26
    :goto_8
    if-eq v12, v3, :cond_27

    .line 824
    .line 825
    if-eq v12, v4, :cond_27

    .line 826
    .line 827
    invoke-virtual {v1, v12, v0}, Ll/ker0;->b(ILjava/util/List;)V

    .line 828
    .line 829
    .line 830
    :cond_27
    sget-object v3, Ll/ker0;->d:[I

    .line 831
    .line 832
    const/4 v5, 0x0

    .line 833
    :goto_9
    if-ge v5, v2, :cond_29

    .line 834
    .line 835
    aget v6, v3, v5

    .line 836
    .line 837
    if-eq v6, v4, :cond_28

    .line 838
    .line 839
    if-eq v6, v12, :cond_28

    .line 840
    .line 841
    invoke-virtual {v1, v6, v0}, Ll/ker0;->b(ILjava/util/List;)V

    .line 842
    .line 843
    .line 844
    :cond_28
    add-int/lit8 v5, v5, 0x1

    .line 845
    .line 846
    goto :goto_9

    .line 847
    :cond_29
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 848
    .line 849
    .line 850
    move-result v2

    .line 851
    new-array v2, v2, [Ll/per0;

    .line 852
    .line 853
    const/4 v5, 0x0

    .line 854
    :goto_a
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 855
    .line 856
    .line 857
    move-result v3

    .line 858
    if-ge v5, v3, :cond_2a

    .line 859
    .line 860
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 861
    .line 862
    .line 863
    move-result-object v3

    .line 864
    check-cast v3, Ll/per0;

    .line 865
    .line 866
    aput-object v3, v2, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 867
    .line 868
    add-int/lit8 v5, v5, 0x1

    .line 869
    .line 870
    goto :goto_a

    .line 871
    :cond_2a
    monitor-exit p0

    .line 872
    return-object v2

    .line 873
    :goto_b
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 874
    throw v0

    .line 875
    :sswitch_data_0
    .sparse-switch
        -0x7e929daa -> :sswitch_1d
        -0x6315f78b -> :sswitch_1c
        -0x6315f787 -> :sswitch_1b
        -0x63118f53 -> :sswitch_1a
        -0x5fc6f775 -> :sswitch_19
        -0x58a8e8f2 -> :sswitch_18
        -0x58a7d764 -> :sswitch_17
        -0x58a21830 -> :sswitch_16
        -0x4a681e4e -> :sswitch_15
        -0x405dba54 -> :sswitch_14
        -0x3be2f26c -> :sswitch_13
        -0x3468a12f -> :sswitch_12
        -0x34686c8b -> :sswitch_11
        -0x17118226 -> :sswitch_10
        -0x2974308 -> :sswitch_f
        0xd45707 -> :sswitch_e
        0xb269698 -> :sswitch_d
        0xb269699 -> :sswitch_c
        0xb26980d -> :sswitch_b
        0xb26c538 -> :sswitch_a
        0xb26cbd6 -> :sswitch_9
        0xb26e933 -> :sswitch_8
        0x4f62635d -> :sswitch_7
        0x59976a2d -> :sswitch_6
        0x59ae0c65 -> :sswitch_5
        0x59aeaa01 -> :sswitch_4
        0x59b1cdba -> :sswitch_3
        0x59b1e81e -> :sswitch_2
        0x59b64a32 -> :sswitch_1
        0x79909c15 -> :sswitch_0
    .end sparse-switch
.end method

.method public final b(ILjava/util/List;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    packed-switch p1, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    :pswitch_0
    goto :goto_0

    .line 6
    :pswitch_1
    new-instance p0, Ll/lir0;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/lir0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_2
    new-instance p0, Ll/mhr0;

    .line 16
    .line 17
    invoke-direct {p0}, Ll/mhr0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :pswitch_3
    new-instance p0, Ll/tur0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/tur0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_4
    new-instance p0, Ll/oor0;

    .line 34
    .line 35
    invoke-direct {p0}, Ll/oor0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :pswitch_5
    new-instance p0, Ll/fhr0;

    .line 43
    .line 44
    invoke-direct {p0}, Ll/fhr0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_6
    sget-object p0, Ll/ker0;->f:Ll/jer0;

    .line 52
    .line 53
    new-array p1, v0, [Ljava/lang/Object;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/jer0;->a([Ljava/lang/Object;)Ll/per0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_0
    :goto_0
    return-void

    .line 65
    :pswitch_7
    new-instance p0, Ll/mir0;

    .line 66
    .line 67
    invoke-direct {p0, v0}, Ll/mir0;-><init>(I)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :pswitch_8
    new-instance p0, Ll/our0;

    .line 75
    .line 76
    invoke-direct {p0}, Ll/our0;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :pswitch_9
    iget-object p1, p0, Ll/ker0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 84
    .line 85
    if-nez p1, :cond_1

    .line 86
    .line 87
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Ll/ker0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 92
    .line 93
    :cond_1
    iget-object v4, p0, Ll/ker0;->c:Ll/vor0;

    .line 94
    .line 95
    new-instance v1, Ll/cur0;

    .line 96
    .line 97
    new-instance v5, Ll/nnw0;

    .line 98
    .line 99
    const-wide/16 v2, 0x0

    .line 100
    .line 101
    invoke-direct {v5, v2, v3}, Ll/nnw0;-><init>(J)V

    .line 102
    .line 103
    .line 104
    new-instance v6, Ll/vrr0;

    .line 105
    .line 106
    iget-object p0, p0, Ll/ker0;->b:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 107
    .line 108
    invoke-direct {v6, v0, p0}, Ll/vrr0;-><init>(ILjava/util/List;)V

    .line 109
    .line 110
    .line 111
    const v7, 0x1b8a0

    .line 112
    .line 113
    .line 114
    const/4 v2, 0x1

    .line 115
    const/4 v3, 0x1

    .line 116
    invoke-direct/range {v1 .. v7}, Ll/cur0;-><init>(IILl/vor0;Ll/nnw0;Ll/fur0;I)V

    .line 117
    .line 118
    .line 119
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :pswitch_a
    new-instance p0, Ll/htr0;

    .line 124
    .line 125
    invoke-direct {p0}, Ll/htr0;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :pswitch_b
    new-instance p0, Ll/rnr0;

    .line 133
    .line 134
    invoke-direct {p0}, Ll/rnr0;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :pswitch_c
    iget-object v1, p0, Ll/ker0;->c:Ll/vor0;

    .line 142
    .line 143
    new-instance v0, Ll/xmr0;

    .line 144
    .line 145
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    const/4 v6, 0x0

    .line 150
    const/16 v2, 0x20

    .line 151
    .line 152
    const/4 v3, 0x0

    .line 153
    const/4 v4, 0x0

    .line 154
    invoke-direct/range {v0 .. v6}, Ll/xmr0;-><init>(Ll/vor0;ILl/nnw0;Ll/hnr0;Ljava/util/List;Ll/sgr0;)V

    .line 155
    .line 156
    .line 157
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Ll/ker0;->c:Ll/vor0;

    .line 161
    .line 162
    new-instance p1, Ll/cnr0;

    .line 163
    .line 164
    const/16 v0, 0x10

    .line 165
    .line 166
    invoke-direct {p1, p0, v0}, Ll/cnr0;-><init>(Ll/vor0;I)V

    .line 167
    .line 168
    .line 169
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :pswitch_d
    new-instance p0, Ll/rlr0;

    .line 174
    .line 175
    invoke-direct {p0, v0}, Ll/rlr0;-><init>(I)V

    .line 176
    .line 177
    .line 178
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :pswitch_e
    new-instance p0, Ll/zkr0;

    .line 183
    .line 184
    invoke-direct {p0, v0}, Ll/zkr0;-><init>(I)V

    .line 185
    .line 186
    .line 187
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :pswitch_f
    new-instance p0, Ll/hir0;

    .line 192
    .line 193
    invoke-direct {p0}, Ll/hir0;-><init>()V

    .line 194
    .line 195
    .line 196
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :pswitch_10
    sget-object p0, Ll/ker0;->e:Ll/jer0;

    .line 201
    .line 202
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-virtual {p0, p1}, Ll/jer0;->a([Ljava/lang/Object;)Ll/per0;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    if-eqz p0, :cond_2

    .line 215
    .line 216
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_2
    new-instance p0, Ll/eir0;

    .line 221
    .line 222
    invoke-direct {p0, v0}, Ll/eir0;-><init>(I)V

    .line 223
    .line 224
    .line 225
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :pswitch_11
    new-instance p0, Ll/ahr0;

    .line 230
    .line 231
    invoke-direct {p0, v0}, Ll/ahr0;-><init>(I)V

    .line 232
    .line 233
    .line 234
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    return-void

    .line 238
    :pswitch_12
    new-instance p0, Ll/trr0;

    .line 239
    .line 240
    invoke-direct {p0, v0}, Ll/trr0;-><init>(I)V

    .line 241
    .line 242
    .line 243
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :pswitch_13
    new-instance p0, Ll/qrr0;

    .line 248
    .line 249
    invoke-direct {p0}, Ll/qrr0;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    return-void

    .line 256
    :pswitch_14
    new-instance p0, Ll/nrr0;

    .line 257
    .line 258
    invoke-direct {p0}, Ll/nrr0;-><init>()V

    .line 259
    .line 260
    .line 261
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.class public Ltech/sud/runtime/core/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/core/b$a;
    }
.end annotation


# static fields
.field private static c:Ltech/sud/runtime/core/b;


# instance fields
.field public a:Ltech/sud/runtime/core/a;

.field public b:Z

.field private final d:Landroid/app/Activity;

.field private final e:Ltech/sud/runtime/core/b$a;

.field private final f:Ltech/sud/runtime/component/b/a;

.field private g:Ltech/sud/runtime/component/c/f;

.field private h:Ltech/sud/runtime/component/c/e;

.field private i:Ltech/sud/runtime/component/c/a;

.field private final j:Ltech/sud/runtime/component/d/a;

.field private k:Ltech/sud/runtime/component/c/i;

.field private final l:Ltech/sud/runtime/core/g;

.field private m:Ljava/lang/String;

.field private n:Ltech/sud/runtime/component/f/a;

.field private o:I

.field private p:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ltech/sud/runtime/core/g;Ljava/util/HashMap;Ltech/sud/runtime/component/d/a;)V
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ltech/sud/runtime/core/g;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ltech/sud/runtime/component/d/a;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v3, p1

    .line 4
    .line 5
    move-object/from16 v9, p4

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-boolean v2, v1, Ltech/sud/runtime/core/b;->b:Z

    .line 12
    .line 13
    iput v2, v1, Ltech/sud/runtime/core/b;->o:I

    .line 14
    .line 15
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 16
    .line 17
    const-string v4, "SudNative"

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-boolean v0, v0, Ltech/sud/runtime/core/b;->b:Z

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const-string v0, "J: NativePlayer _currentNativePlayer != null"

    .line 26
    .line 27
    invoke-static {v4, v0}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 31
    .line 32
    invoke-virtual {v0}, Ltech/sud/runtime/core/b;->a()V

    .line 33
    .line 34
    .line 35
    :cond_0
    sput-object v1, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 36
    .line 37
    move-object/from16 v0, p2

    .line 38
    .line 39
    iput-object v0, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 40
    .line 41
    iput-object v3, v1, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, v1, Ltech/sud/runtime/core/b;->m:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual/range {p3 .. p3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    const/4 v7, 0x1

    .line 62
    const-string v0, ""

    .line 63
    .line 64
    move-object v8, v0

    .line 65
    move v11, v2

    .line 66
    move v12, v11

    .line 67
    move v13, v12

    .line 68
    move v14, v13

    .line 69
    move v15, v14

    .line 70
    move/from16 v16, v15

    .line 71
    .line 72
    move/from16 v17, v16

    .line 73
    .line 74
    move/from16 v18, v17

    .line 75
    .line 76
    move/from16 v20, v18

    .line 77
    .line 78
    move/from16 v21, v20

    .line 79
    .line 80
    move v10, v7

    .line 81
    move/from16 v19, v10

    .line 82
    .line 83
    move/from16 v23, v19

    .line 84
    .line 85
    const/16 v22, 0x0

    .line 86
    .line 87
    move/from16 v7, v21

    .line 88
    .line 89
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    const/16 v24, 0x2

    .line 94
    .line 95
    if-eqz v0, :cond_12

    .line 96
    .line 97
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Ljava/util/Map$Entry;

    .line 102
    .line 103
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v25

    .line 107
    move-object/from16 v2, v25

    .line 108
    .line 109
    check-cast v2, Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v25

    .line 118
    const/16 v26, 0xf

    .line 119
    .line 120
    const/16 v27, 0x3

    .line 121
    .line 122
    const/16 v28, -0x1

    .line 123
    .line 124
    sparse-switch v25, :sswitch_data_0

    .line 125
    .line 126
    .line 127
    :goto_1
    move/from16 v24, v28

    .line 128
    .line 129
    goto/16 :goto_2

    .line 130
    .line 131
    :sswitch_0
    const-string v6, "sysUIVis"

    .line 132
    .line 133
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v6

    .line 137
    if-nez v6, :cond_1

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_1
    move/from16 v24, v26

    .line 141
    .line 142
    goto/16 :goto_2

    .line 143
    .line 144
    :sswitch_1
    const-string v6, "runtime.mode"

    .line 145
    .line 146
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v6

    .line 150
    if-nez v6, :cond_2

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_2
    const/16 v24, 0xe

    .line 154
    .line 155
    goto/16 :goto_2

    .line 156
    .line 157
    :sswitch_2
    const-string v6, "sud.frameworkVersion"

    .line 158
    .line 159
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    if-nez v6, :cond_3

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_3
    const/16 v24, 0xd

    .line 167
    .line 168
    goto/16 :goto_2

    .line 169
    .line 170
    :sswitch_3
    const-string v6, "fps.show"

    .line 171
    .line 172
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v6

    .line 176
    if-nez v6, :cond_4

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_4
    const/16 v24, 0xc

    .line 180
    .line 181
    goto/16 :goto_2

    .line 182
    .line 183
    :sswitch_4
    const-string v6, "jsConsole.autoCreate"

    .line 184
    .line 185
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    if-nez v6, :cond_5

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_5
    const/16 v24, 0xb

    .line 193
    .line 194
    goto/16 :goto_2

    .line 195
    .line 196
    :sswitch_5
    const-string v6, "disableAudioFocus"

    .line 197
    .line 198
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v6

    .line 202
    if-nez v6, :cond_6

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_6
    const/16 v24, 0xa

    .line 206
    .line 207
    goto/16 :goto_2

    .line 208
    .line 209
    :sswitch_6
    const-string v6, "immersiveMode"

    .line 210
    .line 211
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v6

    .line 215
    if-nez v6, :cond_7

    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_7
    const/16 v24, 0x9

    .line 219
    .line 220
    goto/16 :goto_2

    .line 221
    .line 222
    :sswitch_7
    const-string v6, "fullscreen"

    .line 223
    .line 224
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v6

    .line 228
    if-nez v6, :cond_8

    .line 229
    .line 230
    goto :goto_1

    .line 231
    :cond_8
    const/16 v24, 0x8

    .line 232
    .line 233
    goto/16 :goto_2

    .line 234
    .line 235
    :sswitch_8
    const-string v6, "enableOrientation"

    .line 236
    .line 237
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    if-nez v6, :cond_9

    .line 242
    .line 243
    goto :goto_1

    .line 244
    :cond_9
    const/16 v24, 0x7

    .line 245
    .line 246
    goto :goto_2

    .line 247
    :sswitch_9
    const-string v6, "keyboardBottomOffset"

    .line 248
    .line 249
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v6

    .line 253
    if-nez v6, :cond_a

    .line 254
    .line 255
    goto/16 :goto_1

    .line 256
    .line 257
    :cond_a
    const/16 v24, 0x6

    .line 258
    .line 259
    goto :goto_2

    .line 260
    :sswitch_a
    const-string v6, "cachePath"

    .line 261
    .line 262
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v6

    .line 266
    if-nez v6, :cond_b

    .line 267
    .line 268
    goto/16 :goto_1

    .line 269
    .line 270
    :cond_b
    const/16 v24, 0x5

    .line 271
    .line 272
    goto :goto_2

    .line 273
    :sswitch_b
    const-string v6, "useCutout"

    .line 274
    .line 275
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v6

    .line 279
    if-nez v6, :cond_c

    .line 280
    .line 281
    goto/16 :goto_1

    .line 282
    .line 283
    :cond_c
    const/16 v24, 0x4

    .line 284
    .line 285
    goto :goto_2

    .line 286
    :sswitch_c
    const-string v6, "jsConsole"

    .line 287
    .line 288
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result v6

    .line 292
    if-nez v6, :cond_d

    .line 293
    .line 294
    goto/16 :goto_1

    .line 295
    .line 296
    :cond_d
    move/from16 v24, v27

    .line 297
    .line 298
    goto :goto_2

    .line 299
    :sswitch_d
    const-string v6, "transparent"

    .line 300
    .line 301
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v6

    .line 305
    if-nez v6, :cond_10

    .line 306
    .line 307
    goto/16 :goto_1

    .line 308
    .line 309
    :sswitch_e
    const-string v6, "activityLifecycle"

    .line 310
    .line 311
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    if-nez v6, :cond_e

    .line 316
    .line 317
    goto/16 :goto_1

    .line 318
    .line 319
    :cond_e
    move/from16 v24, v23

    .line 320
    .line 321
    goto :goto_2

    .line 322
    :sswitch_f
    const-string v6, "fps.logTime"

    .line 323
    .line 324
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v6

    .line 328
    if-nez v6, :cond_f

    .line 329
    .line 330
    goto/16 :goto_1

    .line 331
    .line 332
    :cond_f
    const/16 v24, 0x0

    .line 333
    .line 334
    :cond_10
    :goto_2
    packed-switch v24, :pswitch_data_0

    .line 335
    .line 336
    .line 337
    iget-object v6, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 338
    .line 339
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    check-cast v0, Ljava/lang/String;

    .line 344
    .line 345
    invoke-virtual {v6, v2, v0}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    goto :goto_3

    .line 349
    :pswitch_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    check-cast v0, Ljava/lang/String;

    .line 354
    .line 355
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 356
    .line 357
    .line 358
    move-result v0

    .line 359
    xor-int/lit8 v20, v0, 0x1

    .line 360
    .line 361
    :cond_11
    :goto_3
    const/4 v2, 0x0

    .line 362
    goto/16 :goto_0

    .line 363
    .line 364
    :pswitch_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v6

    .line 368
    check-cast v6, Ljava/lang/String;

    .line 369
    .line 370
    invoke-static {v6}, Ltech/sud/runtime/core/b;->a(Ljava/lang/String;)I

    .line 371
    .line 372
    .line 373
    iget-object v6, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 374
    .line 375
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    check-cast v0, Ljava/lang/String;

    .line 380
    .line 381
    invoke-virtual {v6, v2, v0}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    move/from16 v11, v23

    .line 385
    .line 386
    move/from16 v14, v27

    .line 387
    .line 388
    goto :goto_3

    .line 389
    :pswitch_2
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    move-object v8, v0

    .line 394
    check-cast v8, Ljava/lang/String;

    .line 395
    .line 396
    goto :goto_3

    .line 397
    :pswitch_3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    check-cast v0, Ljava/lang/String;

    .line 402
    .line 403
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 404
    .line 405
    .line 406
    move-result v13

    .line 407
    goto :goto_3

    .line 408
    :pswitch_4
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    check-cast v0, Ljava/lang/String;

    .line 413
    .line 414
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 415
    .line 416
    .line 417
    move-result v19

    .line 418
    goto :goto_3

    .line 419
    :pswitch_5
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    const-string v2, "true"

    .line 424
    .line 425
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v21

    .line 429
    goto :goto_3

    .line 430
    :pswitch_6
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    check-cast v0, Ljava/lang/String;

    .line 435
    .line 436
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 437
    .line 438
    .line 439
    move-result v15

    .line 440
    if-nez v12, :cond_11

    .line 441
    .line 442
    move/from16 v16, v15

    .line 443
    .line 444
    goto :goto_3

    .line 445
    :pswitch_7
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    check-cast v0, Ljava/lang/String;

    .line 450
    .line 451
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 452
    .line 453
    .line 454
    move-result v16

    .line 455
    move/from16 v12, v23

    .line 456
    .line 457
    goto :goto_3

    .line 458
    :pswitch_8
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v0

    .line 462
    check-cast v0, Ljava/lang/String;

    .line 463
    .line 464
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 465
    .line 466
    .line 467
    move-result v0

    .line 468
    iput-boolean v0, v1, Ltech/sud/runtime/core/b;->p:Z

    .line 469
    .line 470
    goto :goto_3

    .line 471
    :pswitch_9
    :try_start_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    check-cast v0, Ljava/lang/String;

    .line 476
    .line 477
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 478
    .line 479
    .line 480
    move-result v0

    .line 481
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 482
    .line 483
    .line 484
    move-result-object v22
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 485
    goto :goto_3

    .line 486
    :catch_0
    move-exception v0

    .line 487
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 488
    .line 489
    .line 490
    goto/16 :goto_3

    .line 491
    .line 492
    :pswitch_a
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 493
    .line 494
    .line 495
    move-result-object v0

    .line 496
    check-cast v0, Ljava/lang/String;

    .line 497
    .line 498
    iput-object v0, v1, Ltech/sud/runtime/core/b;->m:Ljava/lang/String;

    .line 499
    .line 500
    goto/16 :goto_3

    .line 501
    .line 502
    :pswitch_b
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    check-cast v0, Ljava/lang/String;

    .line 507
    .line 508
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 509
    .line 510
    .line 511
    move-result v17

    .line 512
    goto/16 :goto_3

    .line 513
    .line 514
    :pswitch_c
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 515
    .line 516
    .line 517
    move-result-object v6

    .line 518
    check-cast v6, Ljava/lang/String;

    .line 519
    .line 520
    invoke-static {v6}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 521
    .line 522
    .line 523
    move-result v18

    .line 524
    iget-object v6, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 525
    .line 526
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object v0

    .line 530
    check-cast v0, Ljava/lang/String;

    .line 531
    .line 532
    invoke-virtual {v6, v2, v0}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    .line 534
    .line 535
    goto/16 :goto_3

    .line 536
    .line 537
    :pswitch_d
    if-nez v11, :cond_11

    .line 538
    .line 539
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    check-cast v0, Ljava/lang/String;

    .line 544
    .line 545
    invoke-static {v0}, Ltech/sud/runtime/core/b;->a(Ljava/lang/String;)I

    .line 546
    .line 547
    .line 548
    move-result v0

    .line 549
    and-int/lit8 v14, v0, 0xf

    .line 550
    .line 551
    goto/16 :goto_3

    .line 552
    .line 553
    :pswitch_e
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    check-cast v0, Ljava/lang/String;

    .line 558
    .line 559
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ljava/lang/String;)Z

    .line 560
    .line 561
    .line 562
    move-result v10

    .line 563
    goto/16 :goto_3

    .line 564
    .line 565
    :pswitch_f
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    check-cast v0, Ljava/lang/String;

    .line 570
    .line 571
    invoke-static {v0}, Ltech/sud/runtime/core/b;->a(Ljava/lang/String;)I

    .line 572
    .line 573
    .line 574
    move-result v7

    .line 575
    goto/16 :goto_3

    .line 576
    .line 577
    :cond_12
    if-eqz v10, :cond_13

    .line 578
    .line 579
    new-instance v0, Ltech/sud/runtime/core/b$a;

    .line 580
    .line 581
    const/4 v2, 0x0

    .line 582
    invoke-direct {v0, v1, v2}, Ltech/sud/runtime/core/b$a;-><init>(Ltech/sud/runtime/core/b;Ltech/sud/runtime/core/b$1;)V

    .line 583
    .line 584
    .line 585
    iput-object v0, v1, Ltech/sud/runtime/core/b;->e:Ltech/sud/runtime/core/b$a;

    .line 586
    .line 587
    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 588
    .line 589
    .line 590
    move-result-object v2

    .line 591
    invoke-virtual {v2, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 592
    .line 593
    .line 594
    goto :goto_4

    .line 595
    :cond_13
    const/4 v2, 0x0

    .line 596
    iput-object v2, v1, Ltech/sud/runtime/core/b;->e:Ltech/sud/runtime/core/b$a;

    .line 597
    .line 598
    :goto_4
    invoke-virtual {v1}, Ltech/sud/runtime/core/b;->d()Landroid/content/Context;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 603
    .line 604
    .line 605
    move-result-object v2

    .line 606
    iget-object v5, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 607
    .line 608
    const-string v6, "app.id"

    .line 609
    .line 610
    invoke-virtual {v5, v6, v2}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    .line 612
    .line 613
    :try_start_1
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 614
    .line 615
    .line 616
    move-result-object v0
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 617
    const/4 v5, 0x0

    .line 618
    :try_start_2
    invoke-virtual {v0, v2, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 619
    .line 620
    .line 621
    move-result-object v6
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 622
    :try_start_3
    iget-object v5, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 623
    .line 624
    const-string v10, "app.verName"

    .line 625
    .line 626
    iget-object v11, v6, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 627
    .line 628
    invoke-virtual {v5, v10, v11}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    iget-object v5, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 632
    .line 633
    const-string v10, "app.verCode"

    .line 634
    .line 635
    iget v6, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 636
    .line 637
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 638
    .line 639
    .line 640
    move-result-object v6

    .line 641
    invoke-virtual {v5, v10, v6}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    .line 643
    .line 644
    iget-object v5, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 645
    .line 646
    const-string v6, "app.name"
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_1

    .line 647
    .line 648
    const/4 v10, 0x0

    .line 649
    :try_start_4
    invoke-virtual {v0, v2, v10}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 650
    .line 651
    .line 652
    move-result-object v2

    .line 653
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 658
    .line 659
    .line 660
    move-result-object v0

    .line 661
    invoke-virtual {v5, v6, v0}, Ltech/sud/runtime/core/g;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_3

    .line 662
    .line 663
    .line 664
    goto :goto_5

    .line 665
    :catch_1
    const/4 v10, 0x0

    .line 666
    goto :goto_5

    .line 667
    :catch_2
    move v10, v5

    .line 668
    :catch_3
    :goto_5
    iput-object v9, v1, Ltech/sud/runtime/core/b;->j:Ltech/sud/runtime/component/d/a;

    .line 669
    .line 670
    const-string v0, "@enableConsole"

    .line 671
    .line 672
    invoke-virtual {v9, v0}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;)Z

    .line 673
    .line 674
    .line 675
    move-result v2

    .line 676
    if-nez v2, :cond_14

    .line 677
    .line 678
    new-instance v2, Ltech/sud/runtime/core/b$1;

    .line 679
    .line 680
    invoke-direct {v2, v1}, Ltech/sud/runtime/core/b$1;-><init>(Ltech/sud/runtime/core/b;)V

    .line 681
    .line 682
    .line 683
    invoke-virtual {v9, v0, v2}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 684
    .line 685
    .line 686
    :cond_14
    invoke-virtual {v1}, Ltech/sud/runtime/core/b;->e()V

    .line 687
    .line 688
    .line 689
    if-eqz v15, :cond_15

    .line 690
    .line 691
    const/16 v5, 0x10

    .line 692
    .line 693
    goto :goto_6

    .line 694
    :cond_15
    move v5, v10

    .line 695
    :goto_6
    or-int v0, v14, v5

    .line 696
    .line 697
    if-eqz v16, :cond_16

    .line 698
    .line 699
    goto :goto_7

    .line 700
    :cond_16
    move/from16 v24, v10

    .line 701
    .line 702
    :goto_7
    or-int v0, v0, v24

    .line 703
    .line 704
    if-eqz v17, :cond_17

    .line 705
    .line 706
    const/16 v5, 0x40

    .line 707
    .line 708
    goto :goto_8

    .line 709
    :cond_17
    move v5, v10

    .line 710
    :goto_8
    or-int/2addr v0, v5

    .line 711
    if-eqz v20, :cond_18

    .line 712
    .line 713
    const/16 v2, 0x80

    .line 714
    .line 715
    goto :goto_9

    .line 716
    :cond_18
    move v2, v10

    .line 717
    :goto_9
    or-int/2addr v0, v2

    .line 718
    const-string v2, "NativePlayer AdapterLayout"

    .line 719
    .line 720
    invoke-static {v4, v2}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 721
    .line 722
    .line 723
    new-instance v2, Ltech/sud/runtime/core/a;

    .line 724
    .line 725
    iget-object v5, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 726
    .line 727
    move v4, v0

    .line 728
    move v6, v13

    .line 729
    move-object/from16 v10, v22

    .line 730
    .line 731
    invoke-direct/range {v2 .. v10}, Ltech/sud/runtime/core/a;-><init>(Landroid/content/Context;ILtech/sud/runtime/core/g;ZILjava/lang/String;Ltech/sud/runtime/component/d/a;Ljava/lang/Integer;)V

    .line 732
    .line 733
    .line 734
    iput-object v2, v1, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 735
    .line 736
    new-instance v0, Ltech/sud/runtime/component/b/a;

    .line 737
    .line 738
    invoke-direct {v0, v3}, Ltech/sud/runtime/component/b/a;-><init>(Landroid/content/Context;)V

    .line 739
    .line 740
    .line 741
    iput-object v0, v1, Ltech/sud/runtime/core/b;->f:Ltech/sud/runtime/component/b/a;

    .line 742
    .line 743
    new-instance v0, Ltech/sud/runtime/component/c/f;

    .line 744
    .line 745
    iget-object v2, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 746
    .line 747
    invoke-direct {v0, v2, v3}, Ltech/sud/runtime/component/c/f;-><init>(Ltech/sud/runtime/core/g;Landroid/content/Context;)V

    .line 748
    .line 749
    .line 750
    iput-object v0, v1, Ltech/sud/runtime/core/b;->g:Ltech/sud/runtime/component/c/f;

    .line 751
    .line 752
    if-eqz v18, :cond_19

    .line 753
    .line 754
    if-eqz v19, :cond_19

    .line 755
    .line 756
    iget-object v0, v1, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 757
    .line 758
    invoke-virtual {v1, v0}, Ltech/sud/runtime/core/b;->a(Landroid/widget/FrameLayout;)V

    .line 759
    .line 760
    .line 761
    :cond_19
    new-instance v0, Ltech/sud/runtime/component/c/e;

    .line 762
    .line 763
    invoke-direct {v0, v3}, Ltech/sud/runtime/component/c/e;-><init>(Landroid/content/Context;)V

    .line 764
    .line 765
    .line 766
    iput-object v0, v1, Ltech/sud/runtime/core/b;->h:Ltech/sud/runtime/component/c/e;

    .line 767
    .line 768
    new-instance v0, Ltech/sud/runtime/component/c/i;

    .line 769
    .line 770
    invoke-direct {v0, v1}, Ltech/sud/runtime/component/c/i;-><init>(Ltech/sud/runtime/core/b;)V

    .line 771
    .line 772
    .line 773
    iput-object v0, v1, Ltech/sud/runtime/core/b;->k:Ltech/sud/runtime/component/c/i;

    .line 774
    .line 775
    if-nez v21, :cond_1a

    .line 776
    .line 777
    new-instance v0, Ltech/sud/runtime/component/c/a;

    .line 778
    .line 779
    iget-object v2, v1, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 780
    .line 781
    invoke-direct {v0, v2, v3}, Ltech/sud/runtime/component/c/a;-><init>(Ltech/sud/runtime/core/g;Landroid/content/Context;)V

    .line 782
    .line 783
    .line 784
    iput-object v0, v1, Ltech/sud/runtime/core/b;->i:Ltech/sud/runtime/component/c/a;

    .line 785
    .line 786
    :cond_1a
    return-void

    .line 787
    :sswitch_data_0
    .sparse-switch
        -0x732d33d4 -> :sswitch_f
        -0x6ccfeae5 -> :sswitch_e
        -0x66e3a2ae -> :sswitch_d
        -0x55936432 -> :sswitch_c
        -0x3ac0e1cd -> :sswitch_b
        -0x21010939 -> :sswitch_a
        -0x1e4d7bdb -> :sswitch_9
        -0x74a07b3 -> :sswitch_8
        0x68f7bbb -> :sswitch_7
        0x12d982fe -> :sswitch_6
        0x16e63baa -> :sswitch_5
        0x2900e1ab -> :sswitch_4
        0x4f6d30e2 -> :sswitch_3
        0x6fbd5b26 -> :sswitch_2
        0x70a9c9f9 -> :sswitch_1
        0x7406c63f -> :sswitch_0
    .end sparse-switch

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
    .line 850
    .line 851
    .line 852
    .line 853
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Ljava/lang/String;)I
    .locals 0

    .line 51
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method public static synthetic a(Ltech/sud/runtime/core/b;)V
    .locals 0

    .line 59
    invoke-direct {p0}, Ltech/sud/runtime/core/b;->l()V

    return-void
.end method

.method public static b()Landroid/content/Context;
    .locals 1

    .line 29
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 30
    :cond_0
    iget-object v0, v0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    return-object v0
.end method

.method public static synthetic b(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/b/a;
    .locals 0

    .line 31
    iget-object p0, p0, Ltech/sud/runtime/core/b;->f:Ltech/sud/runtime/component/b/a;

    return-object p0
.end method

.method public static b(Ljava/lang/String;)Z
    .locals 2

    .line 1
    const-string v0, "YES"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    const-string v0, "TRUE"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :catch_0
    :cond_1
    return v0

    .line 28
    :cond_2
    :goto_0
    return v1
.end method

.method public static synthetic c(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/f/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/f;
    .locals 0

    .line 6
    iget-object p0, p0, Ltech/sud/runtime/core/b;->g:Ltech/sud/runtime/component/c/f;

    return-object p0
.end method

.method public static synthetic e(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/d/a;
    .locals 0

    .line 19
    iget-object p0, p0, Ltech/sud/runtime/core/b;->j:Ltech/sud/runtime/component/d/a;

    return-object p0
.end method

.method public static synthetic f(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/i;
    .locals 0

    .line 41
    iget-object p0, p0, Ltech/sud/runtime/core/b;->k:Ltech/sud/runtime/component/c/i;

    return-object p0
.end method

.method public static synthetic g(Ltech/sud/runtime/core/b;)Z
    .locals 0

    .line 40
    iget-boolean p0, p0, Ltech/sud/runtime/core/b;->p:Z

    return p0
.end method

.method public static synthetic h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;
    .locals 0

    .line 29
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    return-object p0
.end method

.method private j()V
    .locals 4

    .line 1
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "J: Begin destroy NativePlayer"

    .line 7
    .line 8
    const-string v1, "SudNative"

    .line 9
    .line 10
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ltech/sud/runtime/core/b;->k()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->h()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ltech/sud/runtime/core/b;->j:Ltech/sud/runtime/component/d/a;

    .line 22
    .line 23
    invoke-virtual {v0}, Ltech/sud/runtime/component/d/a;->a()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Ltech/sud/runtime/component/f/a;->c()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/core/b;->h:Ltech/sud/runtime/component/c/e;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v3, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 41
    .line 42
    invoke-virtual {v0, v3}, Ltech/sud/runtime/component/c/e;->a(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    iput-object v2, p0, Ltech/sud/runtime/core/b;->h:Ltech/sud/runtime/component/c/e;

    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Ltech/sud/runtime/core/b;->g:Ltech/sud/runtime/component/c/f;

    .line 48
    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    iget-object v3, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ltech/sud/runtime/component/c/f;->a(Landroid/content/Context;)V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Ltech/sud/runtime/core/b;->g:Ltech/sud/runtime/component/c/f;

    .line 57
    .line 58
    :cond_3
    iget-object v0, p0, Ltech/sud/runtime/core/b;->k:Ltech/sud/runtime/component/c/i;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/i;->a()V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Ltech/sud/runtime/core/b;->k:Ltech/sud/runtime/component/c/i;

    .line 66
    .line 67
    :cond_4
    iget-object v0, p0, Ltech/sud/runtime/core/b;->i:Ltech/sud/runtime/component/c/a;

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/a;->a()V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Ltech/sud/runtime/core/b;->i:Ltech/sud/runtime/component/c/a;

    .line 75
    .line 76
    :cond_5
    iget-object v0, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 77
    .line 78
    invoke-virtual {v0}, Ltech/sud/runtime/core/g;->a()V

    .line 79
    .line 80
    .line 81
    :try_start_0
    iget-object v0, p0, Ltech/sud/runtime/core/b;->e:Ltech/sud/runtime/core/b$a;

    .line 82
    .line 83
    if-eqz v0, :cond_6

    .line 84
    .line 85
    iget-object v0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v3, p0, Ltech/sud/runtime/core/b;->e:Ltech/sud/runtime/core/b$a;

    .line 92
    .line 93
    invoke-virtual {v0, v3}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :catch_0
    move-exception v0

    .line 98
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 99
    .line 100
    .line 101
    :cond_6
    :goto_0
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 102
    .line 103
    if-ne p0, v0, :cond_7

    .line 104
    .line 105
    sput-object v2, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 106
    .line 107
    :cond_7
    const-string v0, "J: End destroy NativePlayer"

    .line 108
    .line 109
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 113
    .line 114
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 119
    .line 120
    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 121
    .line 122
    if-eqz v1, :cond_8

    .line 123
    .line 124
    check-cast v0, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method private k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/b;->f:Ltech/sud/runtime/component/b/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltech/sud/runtime/component/b/a;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private l()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/core/b;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    const/4 v0, 0x1

    .line 49
    iput-boolean v0, p0, Ltech/sud/runtime/core/b;->b:Z

    .line 50
    invoke-direct {p0}, Ltech/sud/runtime/core/b;->j()V

    return-void
.end method

.method public a(Landroid/widget/FrameLayout;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ltech/sud/runtime/component/f/a;

    .line 8
    .line 9
    iget-object v1, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 10
    .line 11
    invoke-direct {v0, v1, p1}, Ltech/sud/runtime/component/f/a;-><init>(Landroid/content/Context;Landroid/widget/FrameLayout;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Ltech/sud/runtime/component/f/a;->b()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    if-eqz v0, :cond_1

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Ltech/sud/runtime/component/f/a;->b()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/widget/FrameLayout;

    .line 34
    .line 35
    iget-object v0, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 41
    .line 42
    invoke-virtual {p1}, Ltech/sud/runtime/component/f/a;->c()V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    iput-object p1, p0, Ltech/sud/runtime/core/b;->n:Ltech/sud/runtime/component/f/a;

    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 2

    .line 52
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 53
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    if-nez v0, :cond_1

    .line 55
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    invoke-virtual {p0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 56
    :cond_1
    invoke-virtual {v0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public a(Ljava/lang/Runnable;J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    .line 57
    invoke-virtual {p0, p1}, Ltech/sud/runtime/core/b;->a(Ljava/lang/Runnable;)V

    return-void

    .line 58
    :cond_0
    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 60
    iget-object p0, p0, Ltech/sud/runtime/core/b;->j:Ltech/sud/runtime/component/d/a;

    if-eqz p0, :cond_0

    .line 61
    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/component/d/a;->b(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public a(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    .line 62
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 63
    const-string v1, "cmd"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    .line 64
    const-string p1, "data"

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    :cond_0
    const-string p1, "RTGlobalEvent"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ltech/sud/runtime/core/b;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 32
    const-string v0, "WXAudioInterruption_onChange"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 33
    iget-object p0, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    const-string p1, "1"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/16 p2, 0xd

    invoke-virtual {p0, p2, p1}, Ltech/sud/runtime/core/g;->b(II)V

    :cond_0
    return-void
.end method

.method public c()Landroid/app/Activity;
    .locals 0

    .line 4
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    return-object p0
.end method

.method public d()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/core/b;->c()Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 2
    .line 3
    iget-object v1, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ltech/sud/runtime/core/b;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1, v2}, Ltech/sud/runtime/core/g;->a(Ltech/sud/runtime/core/b;Landroid/content/res/AssetManager;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public emit(IIILjava/lang/String;)Ljava/lang/Object;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_5

    .line 4
    .line 5
    const/16 v2, 0x12

    .line 6
    .line 7
    if-eq p1, v2, :cond_4

    .line 8
    .line 9
    const/16 v2, 0x1a

    .line 10
    .line 11
    if-eq p1, v2, :cond_3

    .line 12
    .line 13
    packed-switch p1, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    const-string v2, ""

    .line 17
    .line 18
    packed-switch p1, :pswitch_data_1

    .line 19
    .line 20
    .line 21
    packed-switch p1, :pswitch_data_2

    .line 22
    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :pswitch_0
    iget-object p0, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 27
    .line 28
    invoke-virtual {p0}, Ltech/sud/runtime/core/g;->b()Ltech/sud/runtime/component/g/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, p2}, Ltech/sud/runtime/component/g/a;->a(I)V

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :pswitch_1
    iget-object p0, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 37
    .line 38
    invoke-virtual {p0}, Ltech/sud/runtime/core/g;->b()Ltech/sud/runtime/component/g/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p4}, Ltech/sud/runtime/component/g/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :pswitch_2
    if-eq p2, v1, :cond_0

    .line 48
    .line 49
    return-object v0

    .line 50
    :cond_0
    new-instance p1, Ltech/sud/runtime/component/g/g;

    .line 51
    .line 52
    iget-object p0, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ltech/sud/runtime/component/g/g;-><init>(Ltech/sud/runtime/core/g;)V

    .line 55
    .line 56
    .line 57
    return-object p1

    .line 58
    :pswitch_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 64
    .line 65
    invoke-static {p0}, Ltech/sud/runtime/component/c/f;->b(Landroid/content/Context;)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :pswitch_4
    iget-object p0, p0, Ltech/sud/runtime/core/b;->h:Ltech/sud/runtime/component/c/e;

    .line 78
    .line 79
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/e;->a()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_1

    .line 84
    .line 85
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_1
    return-object v0

    .line 89
    :pswitch_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 95
    .line 96
    invoke-static {p0}, Ltech/sud/runtime/component/c/c;->a(Landroid/app/Activity;)F

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    const p2, 0x461c4000    # 10000.0f

    .line 101
    .line 102
    .line 103
    mul-float/2addr p0, p2

    .line 104
    float-to-int p0, p0

    .line 105
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :pswitch_6
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 114
    .line 115
    invoke-static {p0}, Ltech/sud/runtime/component/c/c;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :pswitch_7
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 121
    .line 122
    invoke-static {p0, p4}, Ltech/sud/runtime/component/c/c;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_2

    .line 127
    .line 128
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_2
    return-object v0

    .line 132
    :pswitch_8
    iget-object p0, p0, Ltech/sud/runtime/core/b;->d:Landroid/app/Activity;

    .line 133
    .line 134
    invoke-static {p0}, Ltech/sud/runtime/component/c/c;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0

    .line 139
    :cond_3
    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 140
    .line 141
    invoke-virtual {p0}, Ltech/sud/runtime/core/a;->e()Ltech/sud/runtime/core/c;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-interface {p0}, Ltech/sud/runtime/core/c;->a()Ltech/sud/runtime/core/d;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, p2}, Ltech/sud/runtime/core/d;->a(I)V

    .line 150
    .line 151
    .line 152
    return-object v0

    .line 153
    :cond_4
    iget-object v2, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 154
    .line 155
    invoke-virtual {v2}, Ltech/sud/runtime/core/a;->c()Ltech/sud/runtime/core/i;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v2, v1}, Ltech/sud/runtime/core/i;->a(Z)V

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_5
    iget-object v1, p0, Ltech/sud/runtime/core/b;->l:Ltech/sud/runtime/core/g;

    .line 164
    .line 165
    invoke-virtual {v1}, Ltech/sud/runtime/core/g;->b()Ltech/sud/runtime/component/g/a;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Ltech/sud/runtime/component/g/a;->a()V

    .line 170
    .line 171
    .line 172
    :goto_0
    new-instance v2, Ltech/sud/runtime/core/b$2;

    .line 173
    .line 174
    move-object v3, p0

    .line 175
    move v4, p1

    .line 176
    move v6, p2

    .line 177
    move v7, p3

    .line 178
    move-object v5, p4

    .line 179
    invoke-direct/range {v2 .. v7}, Ltech/sud/runtime/core/b$2;-><init>(Ltech/sud/runtime/core/b;ILjava/lang/String;II)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v3, v2}, Ltech/sud/runtime/core/b;->a(Ljava/lang/Runnable;)V

    .line 183
    .line 184
    .line 185
    return-object v0

    .line 186
    nop

    .line 187
    :pswitch_data_0
    .packed-switch 0x1d
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :pswitch_data_1
    .packed-switch 0x21
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x25
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f()V
    .locals 1

    .line 1
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-ne v0, p0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Ltech/sud/runtime/core/b;->b:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Ltech/sud/runtime/core/b;->o:I

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    iput v0, p0, Ltech/sud/runtime/core/b;->o:I

    .line 18
    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 22
    .line 23
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->f()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ltech/sud/runtime/core/b;->k:Ltech/sud/runtime/component/c/i;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/i;->c()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p0, Ltech/sud/runtime/core/b;->i:Ltech/sud/runtime/component/c/a;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/a;->c()V

    .line 38
    .line 39
    .line 40
    :cond_3
    :goto_0
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    sget-object v0, Ltech/sud/runtime/core/b;->c:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-ne v0, p0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Ltech/sud/runtime/core/b;->b:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Ltech/sud/runtime/core/b;->o:I

    .line 11
    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->g()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ltech/sud/runtime/core/b;->k:Ltech/sud/runtime/component/c/i;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/i;->b()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/core/b;->i:Ltech/sud/runtime/component/c/a;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0}, Ltech/sud/runtime/component/c/a;->b()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget v0, p0, Ltech/sud/runtime/core/b;->o:I

    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    iput v0, p0, Ltech/sud/runtime/core/b;->o:I

    .line 38
    .line 39
    :cond_3
    :goto_0
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltech/sud/runtime/core/b;->m:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "/games/"

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ltech/sud/runtime/component/file/FileOperation;->a(Ljava/io/File;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public i()[Ljava/lang/String;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ltech/sud/runtime/core/JNIShell;->version(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {v0}, Ltech/sud/runtime/core/JNIShell;->version(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "1.3.0"

    .line 12
    .line 13
    filled-new-array {v1, p0, v0}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

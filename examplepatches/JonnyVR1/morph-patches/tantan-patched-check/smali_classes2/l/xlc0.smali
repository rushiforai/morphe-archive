.class public final Ll/xlc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ulc0;


# instance fields
.field public final a:Landroidx/room/RoomDatabase;


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 0
    .param p1    # Landroidx/room/RoomDatabase;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xlc0;->a:Landroidx/room/RoomDatabase;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/xlc0;Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xlc0;->d(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static synthetic c(Ll/xlc0;Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xlc0;->e(Ljava/util/HashMap;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public static f()Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/q7h0;)Ljava/util/List;
    .locals 62
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q7h0;",
            ")",
            "Ljava/util/List<",
            "Ll/mjq0$c;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/xlc0;->a:Landroidx/room/RoomDatabase;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Ll/xlc0;->a:Landroidx/room/RoomDatabase;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    move-object/from16 v4, p1

    .line 13
    .line 14
    invoke-static {v1, v4, v2, v3}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :try_start_0
    const-string v4, "id"

    .line 19
    .line 20
    invoke-static {v1, v4}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const-string v5, "state"

    .line 25
    .line 26
    invoke-static {v1, v5}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    const-string v6, "output"

    .line 31
    .line 32
    invoke-static {v1, v6}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    const-string v7, "initial_delay"

    .line 37
    .line 38
    invoke-static {v1, v7}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    const-string v8, "interval_duration"

    .line 43
    .line 44
    invoke-static {v1, v8}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v8

    .line 48
    const-string v9, "flex_duration"

    .line 49
    .line 50
    invoke-static {v1, v9}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    const-string v10, "run_attempt_count"

    .line 55
    .line 56
    invoke-static {v1, v10}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v10

    .line 60
    const-string v11, "backoff_policy"

    .line 61
    .line 62
    invoke-static {v1, v11}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v11

    .line 66
    const-string v12, "backoff_delay_duration"

    .line 67
    .line 68
    invoke-static {v1, v12}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v12

    .line 72
    const-string v13, "last_enqueue_time"

    .line 73
    .line 74
    invoke-static {v1, v13}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v13

    .line 78
    const-string v14, "period_count"

    .line 79
    .line 80
    invoke-static {v1, v14}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v14

    .line 84
    const-string v15, "generation"

    .line 85
    .line 86
    invoke-static {v1, v15}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v15

    .line 90
    const-string v2, "next_schedule_time_override"

    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    const-string v3, "stop_reason"

    .line 97
    .line 98
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    move/from16 p1, v3

    .line 103
    .line 104
    const-string v3, "required_network_type"

    .line 105
    .line 106
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    move/from16 v16, v3

    .line 111
    .line 112
    const-string v3, "required_network_request"

    .line 113
    .line 114
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    move/from16 v17, v3

    .line 119
    .line 120
    const-string v3, "requires_charging"

    .line 121
    .line 122
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    move/from16 v18, v3

    .line 127
    .line 128
    const-string v3, "requires_device_idle"

    .line 129
    .line 130
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    move/from16 v19, v3

    .line 135
    .line 136
    const-string v3, "requires_battery_not_low"

    .line 137
    .line 138
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    move/from16 v20, v3

    .line 143
    .line 144
    const-string v3, "requires_storage_not_low"

    .line 145
    .line 146
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    move/from16 v21, v3

    .line 151
    .line 152
    const-string v3, "trigger_content_update_delay"

    .line 153
    .line 154
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    move/from16 v22, v3

    .line 159
    .line 160
    const-string v3, "trigger_max_content_delay"

    .line 161
    .line 162
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    move/from16 v23, v3

    .line 167
    .line 168
    const-string v3, "content_uri_triggers"

    .line 169
    .line 170
    invoke-static {v1, v3}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    move/from16 v24, v3

    .line 175
    .line 176
    new-instance v3, Ljava/util/HashMap;

    .line 177
    .line 178
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 179
    .line 180
    .line 181
    move/from16 v25, v2

    .line 182
    .line 183
    new-instance v2, Ljava/util/HashMap;

    .line 184
    .line 185
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 186
    .line 187
    .line 188
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 189
    .line 190
    .line 191
    move-result v26

    .line 192
    if-eqz v26, :cond_2

    .line 193
    .line 194
    move/from16 v26, v15

    .line 195
    .line 196
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v15

    .line 200
    invoke-virtual {v3, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v27

    .line 204
    if-nez v27, :cond_0

    .line 205
    .line 206
    move/from16 v27, v14

    .line 207
    .line 208
    new-instance v14, Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v3, v15, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    goto :goto_1

    .line 217
    :catchall_0
    move-exception v0

    .line 218
    goto/16 :goto_29

    .line 219
    .line 220
    :cond_0
    move/from16 v27, v14

    .line 221
    .line 222
    :goto_1
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v14

    .line 226
    invoke-virtual {v2, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result v15

    .line 230
    if-nez v15, :cond_1

    .line 231
    .line 232
    new-instance v15, Ljava/util/ArrayList;

    .line 233
    .line 234
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v2, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    :cond_1
    move/from16 v15, v26

    .line 241
    .line 242
    move/from16 v14, v27

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_2
    move/from16 v27, v14

    .line 246
    .line 247
    move/from16 v26, v15

    .line 248
    .line 249
    const/4 v14, -0x1

    .line 250
    invoke-interface {v1, v14}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0, v3}, Ll/xlc0;->e(Ljava/util/HashMap;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v0, v2}, Ll/xlc0;->d(Ljava/util/HashMap;)V

    .line 257
    .line 258
    .line 259
    new-instance v0, Ljava/util/ArrayList;

    .line 260
    .line 261
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    .line 262
    .line 263
    .line 264
    move-result v15

    .line 265
    invoke-direct {v0, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 266
    .line 267
    .line 268
    :goto_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 269
    .line 270
    .line 271
    move-result v15

    .line 272
    if-eqz v15, :cond_1e

    .line 273
    .line 274
    if-ne v4, v14, :cond_3

    .line 275
    .line 276
    const/16 v29, 0x0

    .line 277
    .line 278
    goto :goto_3

    .line 279
    :cond_3
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v15

    .line 283
    move-object/from16 v29, v15

    .line 284
    .line 285
    :goto_3
    if-ne v5, v14, :cond_4

    .line 286
    .line 287
    const/16 v30, 0x0

    .line 288
    .line 289
    goto :goto_4

    .line 290
    :cond_4
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 291
    .line 292
    .line 293
    move-result v15

    .line 294
    invoke-static {v15}, Ll/yjq0;->g(I)Landroidx/work/WorkInfo$State;

    .line 295
    .line 296
    .line 297
    move-result-object v15

    .line 298
    move-object/from16 v30, v15

    .line 299
    .line 300
    :goto_4
    if-ne v6, v14, :cond_5

    .line 301
    .line 302
    const/16 v31, 0x0

    .line 303
    .line 304
    goto :goto_5

    .line 305
    :cond_5
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 306
    .line 307
    .line 308
    move-result-object v15

    .line 309
    invoke-static {v15}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 310
    .line 311
    .line 312
    move-result-object v15

    .line 313
    move-object/from16 v31, v15

    .line 314
    .line 315
    :goto_5
    const-wide/16 v32, 0x0

    .line 316
    .line 317
    if-ne v7, v14, :cond_6

    .line 318
    .line 319
    move-wide/from16 v34, v32

    .line 320
    .line 321
    goto :goto_6

    .line 322
    :cond_6
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 323
    .line 324
    .line 325
    move-result-wide v34

    .line 326
    :goto_6
    if-ne v8, v14, :cond_7

    .line 327
    .line 328
    move-wide/from16 v36, v32

    .line 329
    .line 330
    goto :goto_7

    .line 331
    :cond_7
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getLong(I)J

    .line 332
    .line 333
    .line 334
    move-result-wide v36

    .line 335
    :goto_7
    if-ne v9, v14, :cond_8

    .line 336
    .line 337
    move-wide/from16 v38, v32

    .line 338
    .line 339
    goto :goto_8

    .line 340
    :cond_8
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getLong(I)J

    .line 341
    .line 342
    .line 343
    move-result-wide v38

    .line 344
    :goto_8
    if-ne v10, v14, :cond_9

    .line 345
    .line 346
    const/16 v28, 0x0

    .line 347
    .line 348
    goto :goto_9

    .line 349
    :cond_9
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 350
    .line 351
    .line 352
    move-result v28

    .line 353
    :goto_9
    if-ne v11, v14, :cond_a

    .line 354
    .line 355
    const/16 v40, 0x0

    .line 356
    .line 357
    goto :goto_a

    .line 358
    :cond_a
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 359
    .line 360
    .line 361
    move-result v40

    .line 362
    invoke-static/range {v40 .. v40}, Ll/yjq0;->d(I)Landroidx/work/BackoffPolicy;

    .line 363
    .line 364
    .line 365
    move-result-object v40

    .line 366
    :goto_a
    if-ne v12, v14, :cond_b

    .line 367
    .line 368
    move-wide/from16 v41, v32

    .line 369
    .line 370
    goto :goto_b

    .line 371
    :cond_b
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getLong(I)J

    .line 372
    .line 373
    .line 374
    move-result-wide v41

    .line 375
    :goto_b
    if-ne v13, v14, :cond_c

    .line 376
    .line 377
    move-wide/from16 v43, v32

    .line 378
    .line 379
    :goto_c
    move/from16 v15, v27

    .line 380
    .line 381
    goto :goto_d

    .line 382
    :cond_c
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 383
    .line 384
    .line 385
    move-result-wide v43

    .line 386
    goto :goto_c

    .line 387
    :goto_d
    if-ne v15, v14, :cond_d

    .line 388
    .line 389
    move/from16 v45, v26

    .line 390
    .line 391
    move/from16 v26, v5

    .line 392
    .line 393
    move/from16 v5, v45

    .line 394
    .line 395
    const/16 v45, 0x0

    .line 396
    .line 397
    goto :goto_e

    .line 398
    :cond_d
    invoke-interface {v1, v15}, Landroid/database/Cursor;->getInt(I)I

    .line 399
    .line 400
    .line 401
    move-result v27

    .line 402
    move/from16 v45, v26

    .line 403
    .line 404
    move/from16 v26, v5

    .line 405
    .line 406
    move/from16 v5, v45

    .line 407
    .line 408
    move/from16 v45, v27

    .line 409
    .line 410
    :goto_e
    if-ne v5, v14, :cond_e

    .line 411
    .line 412
    move/from16 v46, v25

    .line 413
    .line 414
    move/from16 v25, v5

    .line 415
    .line 416
    move/from16 v5, v46

    .line 417
    .line 418
    const/16 v46, 0x0

    .line 419
    .line 420
    goto :goto_f

    .line 421
    :cond_e
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 422
    .line 423
    .line 424
    move-result v27

    .line 425
    move/from16 v46, v25

    .line 426
    .line 427
    move/from16 v25, v5

    .line 428
    .line 429
    move/from16 v5, v46

    .line 430
    .line 431
    move/from16 v46, v27

    .line 432
    .line 433
    :goto_f
    if-ne v5, v14, :cond_f

    .line 434
    .line 435
    move-wide/from16 v47, v32

    .line 436
    .line 437
    :goto_10
    move/from16 v27, v5

    .line 438
    .line 439
    move/from16 v5, p1

    .line 440
    .line 441
    goto :goto_11

    .line 442
    :cond_f
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getLong(I)J

    .line 443
    .line 444
    .line 445
    move-result-wide v47

    .line 446
    goto :goto_10

    .line 447
    :goto_11
    if-ne v5, v14, :cond_10

    .line 448
    .line 449
    const/16 v49, 0x0

    .line 450
    .line 451
    :goto_12
    move/from16 p1, v5

    .line 452
    .line 453
    move/from16 v5, v16

    .line 454
    .line 455
    goto :goto_13

    .line 456
    :cond_10
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 457
    .line 458
    .line 459
    move-result v49

    .line 460
    goto :goto_12

    .line 461
    :goto_13
    if-ne v5, v14, :cond_11

    .line 462
    .line 463
    const/16 v52, 0x0

    .line 464
    .line 465
    :goto_14
    move/from16 v16, v5

    .line 466
    .line 467
    move/from16 v5, v17

    .line 468
    .line 469
    goto :goto_15

    .line 470
    :cond_11
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 471
    .line 472
    .line 473
    move-result v16

    .line 474
    invoke-static/range {v16 .. v16}, Ll/yjq0;->e(I)Landroidx/work/NetworkType;

    .line 475
    .line 476
    .line 477
    move-result-object v16

    .line 478
    move-object/from16 v52, v16

    .line 479
    .line 480
    goto :goto_14

    .line 481
    :goto_15
    if-ne v5, v14, :cond_12

    .line 482
    .line 483
    const/16 v51, 0x0

    .line 484
    .line 485
    :goto_16
    move/from16 v17, v5

    .line 486
    .line 487
    move/from16 v5, v18

    .line 488
    .line 489
    goto :goto_17

    .line 490
    :cond_12
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getBlob(I)[B

    .line 491
    .line 492
    .line 493
    move-result-object v17

    .line 494
    invoke-static/range {v17 .. v17}, Ll/yjq0;->l([B)Ll/al20;

    .line 495
    .line 496
    .line 497
    move-result-object v17

    .line 498
    move-object/from16 v51, v17

    .line 499
    .line 500
    goto :goto_16

    .line 501
    :goto_17
    if-ne v5, v14, :cond_13

    .line 502
    .line 503
    const/16 v53, 0x0

    .line 504
    .line 505
    :goto_18
    move/from16 v18, v5

    .line 506
    .line 507
    move/from16 v5, v19

    .line 508
    .line 509
    goto :goto_1a

    .line 510
    :cond_13
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 511
    .line 512
    .line 513
    move-result v18

    .line 514
    if-eqz v18, :cond_14

    .line 515
    .line 516
    const/16 v18, 0x1

    .line 517
    .line 518
    goto :goto_19

    .line 519
    :cond_14
    const/16 v18, 0x0

    .line 520
    .line 521
    :goto_19
    move/from16 v53, v18

    .line 522
    .line 523
    goto :goto_18

    .line 524
    :goto_1a
    if-ne v5, v14, :cond_15

    .line 525
    .line 526
    const/16 v54, 0x0

    .line 527
    .line 528
    :goto_1b
    move/from16 v19, v5

    .line 529
    .line 530
    move/from16 v5, v20

    .line 531
    .line 532
    goto :goto_1d

    .line 533
    :cond_15
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 534
    .line 535
    .line 536
    move-result v19

    .line 537
    if-eqz v19, :cond_16

    .line 538
    .line 539
    const/16 v19, 0x1

    .line 540
    .line 541
    goto :goto_1c

    .line 542
    :cond_16
    const/16 v19, 0x0

    .line 543
    .line 544
    :goto_1c
    move/from16 v54, v19

    .line 545
    .line 546
    goto :goto_1b

    .line 547
    :goto_1d
    if-ne v5, v14, :cond_17

    .line 548
    .line 549
    const/16 v55, 0x0

    .line 550
    .line 551
    :goto_1e
    move/from16 v20, v5

    .line 552
    .line 553
    move/from16 v5, v21

    .line 554
    .line 555
    goto :goto_20

    .line 556
    :cond_17
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 557
    .line 558
    .line 559
    move-result v20

    .line 560
    if-eqz v20, :cond_18

    .line 561
    .line 562
    const/16 v20, 0x1

    .line 563
    .line 564
    goto :goto_1f

    .line 565
    :cond_18
    const/16 v20, 0x0

    .line 566
    .line 567
    :goto_1f
    move/from16 v55, v20

    .line 568
    .line 569
    goto :goto_1e

    .line 570
    :goto_20
    if-ne v5, v14, :cond_19

    .line 571
    .line 572
    const/16 v56, 0x0

    .line 573
    .line 574
    :goto_21
    move/from16 v21, v5

    .line 575
    .line 576
    move/from16 v5, v22

    .line 577
    .line 578
    goto :goto_23

    .line 579
    :cond_19
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 580
    .line 581
    .line 582
    move-result v21

    .line 583
    if-eqz v21, :cond_1a

    .line 584
    .line 585
    const/16 v21, 0x1

    .line 586
    .line 587
    goto :goto_22

    .line 588
    :cond_1a
    const/16 v21, 0x0

    .line 589
    .line 590
    :goto_22
    move/from16 v56, v21

    .line 591
    .line 592
    goto :goto_21

    .line 593
    :goto_23
    if-ne v5, v14, :cond_1b

    .line 594
    .line 595
    move-wide/from16 v57, v32

    .line 596
    .line 597
    :goto_24
    move/from16 v22, v5

    .line 598
    .line 599
    move/from16 v5, v23

    .line 600
    .line 601
    goto :goto_25

    .line 602
    :cond_1b
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getLong(I)J

    .line 603
    .line 604
    .line 605
    move-result-wide v57

    .line 606
    goto :goto_24

    .line 607
    :goto_25
    if-ne v5, v14, :cond_1c

    .line 608
    .line 609
    :goto_26
    move/from16 v23, v5

    .line 610
    .line 611
    move/from16 v5, v24

    .line 612
    .line 613
    move-wide/from16 v59, v32

    .line 614
    .line 615
    goto :goto_27

    .line 616
    :cond_1c
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getLong(I)J

    .line 617
    .line 618
    .line 619
    move-result-wide v32

    .line 620
    goto :goto_26

    .line 621
    :goto_27
    if-ne v5, v14, :cond_1d

    .line 622
    .line 623
    const/16 v61, 0x0

    .line 624
    .line 625
    goto :goto_28

    .line 626
    :cond_1d
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getBlob(I)[B

    .line 627
    .line 628
    .line 629
    move-result-object v24

    .line 630
    invoke-static/range {v24 .. v24}, Ll/yjq0;->b([B)Ljava/util/Set;

    .line 631
    .line 632
    .line 633
    move-result-object v24

    .line 634
    move-object/from16 v61, v24

    .line 635
    .line 636
    :goto_28
    new-instance v50, Ll/l06;

    .line 637
    .line 638
    invoke-direct/range {v50 .. v61}, Ll/l06;-><init>(Ll/al20;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 639
    .line 640
    .line 641
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v14

    .line 645
    invoke-virtual {v3, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 646
    .line 647
    .line 648
    move-result-object v14

    .line 649
    check-cast v14, Ljava/util/ArrayList;

    .line 650
    .line 651
    move-object/from16 v52, v3

    .line 652
    .line 653
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object v3

    .line 657
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 658
    .line 659
    .line 660
    move-result-object v3

    .line 661
    move-object/from16 v51, v3

    .line 662
    .line 663
    check-cast v51, Ljava/util/ArrayList;

    .line 664
    .line 665
    move-wide/from16 v32, v34

    .line 666
    .line 667
    move-wide/from16 v34, v36

    .line 668
    .line 669
    move-wide/from16 v36, v38

    .line 670
    .line 671
    move/from16 v39, v28

    .line 672
    .line 673
    new-instance v28, Ll/mjq0$c;

    .line 674
    .line 675
    move-object/from16 v38, v50

    .line 676
    .line 677
    move-object/from16 v50, v14

    .line 678
    .line 679
    invoke-direct/range {v28 .. v51}, Ll/mjq0$c;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLl/l06;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    .line 680
    .line 681
    .line 682
    move-object/from16 v3, v28

    .line 683
    .line 684
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 685
    .line 686
    .line 687
    move/from16 v24, v5

    .line 688
    .line 689
    move/from16 v5, v26

    .line 690
    .line 691
    move-object/from16 v3, v52

    .line 692
    .line 693
    const/4 v14, -0x1

    .line 694
    move/from16 v26, v25

    .line 695
    .line 696
    move/from16 v25, v27

    .line 697
    .line 698
    move/from16 v27, v15

    .line 699
    .line 700
    goto/16 :goto_2

    .line 701
    .line 702
    :cond_1e
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 703
    .line 704
    .line 705
    return-object v0

    .line 706
    :goto_29
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 707
    .line 708
    .line 709
    throw v0
.end method

.method public final d(Ljava/util/HashMap;)V
    .locals 5
    .param p1    # Ljava/util/HashMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroidx/work/Data;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x3e7

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-le v1, v2, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/wlc0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/wlc0;-><init>(Ll/xlc0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v3, v0}, Ll/pwc0;->a(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Ll/h8g0;->b()Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "SELECT `progress`,`work_spec_id` FROM `WorkProgress` WHERE `work_spec_id` IN ("

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v1, v2}, Ll/h8g0;->a(Ljava/lang/StringBuilder;I)V

    .line 44
    .line 45
    .line 46
    const-string v4, ")"

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    move v2, v3

    .line 64
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v2, v4}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    add-int/2addr v2, v3

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object p0, p0, Ll/xlc0;->a:Landroidx/room/RoomDatabase;

    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-static {p0, v1, v2, v0}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    :try_start_0
    const-string v0, "work_spec_id"

    .line 90
    .line 91
    invoke-static {p0, v0}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    const/4 v1, -0x1

    .line 96
    if-ne v0, v1, :cond_3

    .line 97
    .line 98
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ljava/util/ArrayList;

    .line 117
    .line 118
    if-eqz v1, :cond_3

    .line 119
    .line 120
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v3}, Landroidx/work/Data;->b([B)Landroidx/work/Data;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :catchall_0
    move-exception p1

    .line 133
    goto :goto_2

    .line 134
    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 139
    .line 140
    .line 141
    throw p1
.end method

.method public final e(Ljava/util/HashMap;)V
    .locals 5
    .param p1    # Ljava/util/HashMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x3e7

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-le v1, v2, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/vlc0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/vlc0;-><init>(Ll/xlc0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v3, v0}, Ll/pwc0;->a(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Ll/h8g0;->b()Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "SELECT `tag`,`work_spec_id` FROM `WorkTag` WHERE `work_spec_id` IN ("

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v1, v2}, Ll/h8g0;->a(Ljava/lang/StringBuilder;I)V

    .line 44
    .line 45
    .line 46
    const-string v4, ")"

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1, v2}, Ll/zkd0;->d(Ljava/lang/String;I)Ll/zkd0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    move v2, v3

    .line 64
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_2

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v2, v4}, Ll/zkd0;->bindString(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    add-int/2addr v2, v3

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object p0, p0, Ll/xlc0;->a:Landroidx/room/RoomDatabase;

    .line 82
    .line 83
    const/4 v0, 0x0

    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-static {p0, v1, v2, v0}, Ll/o1c;->b(Landroidx/room/RoomDatabase;Ll/q7h0;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    :try_start_0
    const-string v0, "work_spec_id"

    .line 90
    .line 91
    invoke-static {p0, v0}, Ll/xyb;->d(Landroid/database/Cursor;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    const/4 v1, -0x1

    .line 96
    if-ne v0, v1, :cond_3

    .line 97
    .line 98
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ljava/util/ArrayList;

    .line 117
    .line 118
    if-eqz v1, :cond_3

    .line 119
    .line 120
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :catchall_0
    move-exception p1

    .line 129
    goto :goto_2

    .line 130
    :cond_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :goto_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 135
    .line 136
    .line 137
    throw p1
.end method

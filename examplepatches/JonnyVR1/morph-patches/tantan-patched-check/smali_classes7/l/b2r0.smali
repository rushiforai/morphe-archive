.class public abstract Ll/b2r0;
.super Ll/u1r0;
.source "SourceFile"


# instance fields
.field protected volatile A:J

.field private B:I

.field private C:J

.field protected t:Ljava/lang/Exception;

.field protected u:Ljava/net/Socket;

.field v:Ljava/lang/String;

.field private w:Ljava/lang/String;

.field protected x:Lcom/xiaomi/push/service/XMPushService;

.field protected volatile y:J

.field protected volatile z:J


# direct methods
.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;Ll/v1r0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Ll/u1r0;-><init>(Lcom/xiaomi/push/service/XMPushService;Ll/v1r0;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-object p2, p0, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 6
    .line 7
    iput-object p2, p0, Ll/b2r0;->v:Ljava/lang/String;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Ll/b2r0;->y:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/b2r0;->z:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/b2r0;->A:J

    .line 16
    .line 17
    iput-wide v0, p0, Ll/b2r0;->C:J

    .line 18
    .line 19
    iput-object p1, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 20
    .line 21
    return-void
.end method

.method private L(Ljava/lang/String;I)V
    .locals 29

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "|"

    .line 8
    .line 9
    const-string v4, "\n"

    .line 10
    .line 11
    const-string v5, " err:"

    .line 12
    .line 13
    const-string v6, " port:"

    .line 14
    .line 15
    const-string v7, "SMACK: Could not connect to "

    .line 16
    .line 17
    const-string v8, "SMACK: Could not connect to:"

    .line 18
    .line 19
    const/4 v9, 0x0

    .line 20
    iput-object v9, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 21
    .line 22
    new-instance v9, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v10, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v11, "get bucket for host : "

    .line 30
    .line 31
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    invoke-static {v10}, Ll/ouq0;->b(Ljava/lang/String;)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    invoke-virtual/range {p0 .. p1}, Ll/b2r0;->H(Ljava/lang/String;)Ll/swq0;

    .line 49
    .line 50
    .line 51
    move-result-object v11

    .line 52
    invoke-static {v10}, Ll/ouq0;->l(Ljava/lang/Integer;)V

    .line 53
    .line 54
    .line 55
    const/4 v10, 0x1

    .line 56
    if-eqz v11, :cond_0

    .line 57
    .line 58
    invoke-virtual {v11, v10}, Ll/swq0;->d(Z)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v9

    .line 62
    :cond_0
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 63
    .line 64
    .line 65
    move-result-object v12

    .line 66
    invoke-virtual {v12, v0}, Ll/xwq0;->d(Ljava/lang/String;)Ll/swq0;

    .line 67
    .line 68
    .line 69
    move-result-object v12

    .line 70
    if-eqz v12, :cond_2

    .line 71
    .line 72
    invoke-virtual {v12, v10}, Ll/swq0;->d(Z)Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object v12

    .line 76
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v12

    .line 80
    :cond_1
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v13

    .line 84
    if-eqz v13, :cond_2

    .line 85
    .line 86
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v13

    .line 90
    check-cast v13, Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 93
    .line 94
    .line 95
    move-result v14

    .line 96
    const/4 v15, -0x1

    .line 97
    if-ne v14, v15, :cond_1

    .line 98
    .line 99
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    .line 104
    .line 105
    .line 106
    move-result v12

    .line 107
    if-eqz v12, :cond_3

    .line 108
    .line 109
    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    :cond_3
    const-wide/16 v12, 0x0

    .line 113
    .line 114
    iput-wide v12, v1, Ll/b2r0;->A:J

    .line 115
    .line 116
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 117
    .line 118
    .line 119
    move-result-wide v18

    .line 120
    iget-object v0, v1, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 121
    .line 122
    invoke-static {v0}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v14

    .line 126
    new-instance v15, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    move-object/from16 p1, v15

    .line 136
    .line 137
    const-string v0, ""

    .line 138
    .line 139
    move-object/from16 v17, v0

    .line 140
    .line 141
    const/4 v0, 0x0

    .line 142
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 143
    .line 144
    .line 145
    move-result v16

    .line 146
    if-eqz v16, :cond_d

    .line 147
    .line 148
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v16

    .line 152
    move-object/from16 v12, v16

    .line 153
    .line 154
    check-cast v12, Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 157
    .line 158
    .line 159
    move-result-wide v22

    .line 160
    iget v13, v1, Ll/u1r0;->a:I

    .line 161
    .line 162
    add-int/2addr v13, v10

    .line 163
    iput v13, v1, Ll/u1r0;->a:I

    .line 164
    .line 165
    add-int/lit8 v24, v0, 0x1

    .line 166
    .line 167
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 168
    .line 169
    :try_start_1
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    const-string v13, "begin to connect to "

    .line 173
    .line 174
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1}, Ll/b2r0;->G()Ljava/net/Socket;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object v0, v1, Ll/b2r0;->u:Ljava/net/Socket;

    .line 192
    .line 193
    invoke-static {v12, v2}, Ll/uwq0;->c(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget-object v13, v1, Ll/b2r0;->u:Ljava/net/Socket;

    .line 198
    .line 199
    const/16 v15, 0x1f40

    .line 200
    .line 201
    invoke-virtual {v13, v0, v15}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 202
    .line 203
    .line 204
    const-string v0, "tcp connected"

    .line 205
    .line 206
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, v1, Ll/b2r0;->u:Ljava/net/Socket;

    .line 210
    .line 211
    invoke-virtual {v0, v10}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 212
    .line 213
    .line 214
    iput-object v12, v1, Ll/b2r0;->w:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v1}, Ll/b2r0;->I()V

    .line 217
    .line 218
    .line 219
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 220
    .line 221
    .line 222
    move-result-wide v25
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 223
    move-object v13, v11

    .line 224
    sub-long v10, v25, v22

    .line 225
    .line 226
    :try_start_2
    iput-wide v10, v1, Ll/u1r0;->b:J

    .line 227
    .line 228
    iput-object v14, v1, Ll/u1r0;->k:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 229
    .line 230
    if-eqz v13, :cond_4

    .line 231
    .line 232
    const/16 v25, 0x0

    .line 233
    .line 234
    const-wide/16 v15, 0x0

    .line 235
    .line 236
    move-object/from16 v20, v9

    .line 237
    .line 238
    move-object/from16 v9, p1

    .line 239
    .line 240
    move-object/from16 p1, v20

    .line 241
    .line 242
    const-wide/16 v20, 0x0

    .line 243
    .line 244
    move-wide/from16 v27, v10

    .line 245
    .line 246
    move-object v11, v13

    .line 247
    move-object v10, v14

    .line 248
    move-wide/from16 v13, v27

    .line 249
    .line 250
    :try_start_3
    invoke-virtual/range {v11 .. v16}, Ll/swq0;->s(Ljava/lang/String;JJ)V

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :catchall_0
    move-exception v0

    .line 255
    goto/16 :goto_6

    .line 256
    .line 257
    :catch_0
    move-exception v0

    .line 258
    :goto_2
    move-object/from16 v13, v17

    .line 259
    .line 260
    goto/16 :goto_b

    .line 261
    .line 262
    :cond_4
    move-object v10, v9

    .line 263
    move-object/from16 v9, p1

    .line 264
    .line 265
    move-object/from16 p1, v10

    .line 266
    .line 267
    move-object v11, v13

    .line 268
    move-object v10, v14

    .line 269
    const-wide/16 v20, 0x0

    .line 270
    .line 271
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 272
    .line 273
    .line 274
    move-result-wide v13

    .line 275
    iput-wide v13, v1, Ll/b2r0;->A:J

    .line 276
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .line 281
    .line 282
    const-string v13, "connected to "

    .line 283
    .line 284
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    const-string v13, " in "

    .line 291
    .line 292
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    iget-wide v13, v1, Ll/u1r0;->b:J

    .line 296
    .line 297
    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 305
    .line 306
    .line 307
    move-object/from16 v13, v17

    .line 308
    .line 309
    move/from16 v0, v24

    .line 310
    .line 311
    const/4 v10, 0x1

    .line 312
    goto/16 :goto_10

    .line 313
    .line 314
    :catchall_1
    move-exception v0

    .line 315
    move-object v10, v9

    .line 316
    move-object/from16 v9, p1

    .line 317
    .line 318
    move-object/from16 p1, v10

    .line 319
    .line 320
    move-object v11, v13

    .line 321
    :goto_4
    move-object v10, v14

    .line 322
    const-wide/16 v20, 0x0

    .line 323
    .line 324
    goto :goto_6

    .line 325
    :catch_1
    move-exception v0

    .line 326
    move-object v10, v9

    .line 327
    move-object/from16 v9, p1

    .line 328
    .line 329
    move-object/from16 p1, v10

    .line 330
    .line 331
    move-object v11, v13

    .line 332
    :goto_5
    move-object v10, v14

    .line 333
    const-wide/16 v20, 0x0

    .line 334
    .line 335
    goto :goto_2

    .line 336
    :catchall_2
    move-exception v0

    .line 337
    move-object v10, v9

    .line 338
    move-object/from16 v9, p1

    .line 339
    .line 340
    move-object/from16 p1, v10

    .line 341
    .line 342
    goto :goto_4

    .line 343
    :catch_2
    move-exception v0

    .line 344
    move-object v10, v9

    .line 345
    move-object/from16 v9, p1

    .line 346
    .line 347
    move-object/from16 p1, v10

    .line 348
    .line 349
    goto :goto_5

    .line 350
    :goto_6
    :try_start_4
    new-instance v13, Ljava/lang/Exception;

    .line 351
    .line 352
    const-string v14, "abnormal exception"

    .line 353
    .line 354
    invoke-direct {v13, v14, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 355
    .line 356
    .line 357
    iput-object v13, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 358
    .line 359
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 360
    .line 361
    .line 362
    new-instance v0, Ljava/lang/StringBuilder;

    .line 363
    .line 364
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    iget-object v0, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 393
    .line 394
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 409
    .line 410
    .line 411
    move-result v0

    .line 412
    if-eqz v0, :cond_5

    .line 413
    .line 414
    move-object v0, v12

    .line 415
    goto :goto_7

    .line 416
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 417
    .line 418
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 419
    .line 420
    .line 421
    move-object/from16 v13, v17

    .line 422
    .line 423
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    :goto_7
    iget-object v13, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 437
    .line 438
    invoke-static {v12, v13}, Lcom/xiaomi/push/i;->h(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 439
    .line 440
    .line 441
    if-eqz v11, :cond_6

    .line 442
    .line 443
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 444
    .line 445
    .line 446
    move-result-wide v13

    .line 447
    sub-long v13, v13, v22

    .line 448
    .line 449
    iget-object v15, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 450
    .line 451
    move-object/from16 v17, v15

    .line 452
    .line 453
    const-wide/16 v15, 0x0

    .line 454
    .line 455
    invoke-virtual/range {v11 .. v17}, Ll/swq0;->t(Ljava/lang/String;JJLjava/lang/Exception;)V

    .line 456
    .line 457
    .line 458
    :cond_6
    iget-object v12, v1, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 459
    .line 460
    invoke-static {v12}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v12

    .line 464
    invoke-static {v10, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 465
    .line 466
    .line 467
    move-result v12

    .line 468
    if-nez v12, :cond_7

    .line 469
    .line 470
    :goto_8
    move-object v13, v0

    .line 471
    :goto_9
    move/from16 v0, v24

    .line 472
    .line 473
    :goto_a
    const/4 v10, 0x0

    .line 474
    goto/16 :goto_10

    .line 475
    .line 476
    :cond_7
    move-object/from16 v17, v0

    .line 477
    .line 478
    goto/16 :goto_d

    .line 479
    .line 480
    :catchall_3
    move-exception v0

    .line 481
    move-object/from16 v13, v17

    .line 482
    .line 483
    goto/16 :goto_e

    .line 484
    .line 485
    :catch_3
    move-exception v0

    .line 486
    move-object v10, v9

    .line 487
    move-object/from16 v9, p1

    .line 488
    .line 489
    move-object/from16 p1, v10

    .line 490
    .line 491
    move-object v10, v14

    .line 492
    move-object/from16 v13, v17

    .line 493
    .line 494
    const-wide/16 v20, 0x0

    .line 495
    .line 496
    :goto_b
    :try_start_5
    iput-object v0, v1, Ll/b2r0;->t:Ljava/lang/Exception;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 497
    .line 498
    new-instance v0, Ljava/lang/StringBuilder;

    .line 499
    .line 500
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 501
    .line 502
    .line 503
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v0

    .line 510
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    .line 518
    .line 519
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    .line 521
    .line 522
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 523
    .line 524
    .line 525
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    .line 527
    .line 528
    iget-object v0, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 529
    .line 530
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 539
    .line 540
    .line 541
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 545
    .line 546
    .line 547
    move-result v0

    .line 548
    if-eqz v0, :cond_8

    .line 549
    .line 550
    move-object v0, v12

    .line 551
    goto :goto_c

    .line 552
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 553
    .line 554
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 555
    .line 556
    .line 557
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    .line 559
    .line 560
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    .line 562
    .line 563
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object v0

    .line 570
    :goto_c
    iget-object v13, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 571
    .line 572
    invoke-static {v12, v13}, Lcom/xiaomi/push/i;->h(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 573
    .line 574
    .line 575
    if-eqz v11, :cond_9

    .line 576
    .line 577
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 578
    .line 579
    .line 580
    move-result-wide v13

    .line 581
    sub-long v13, v13, v22

    .line 582
    .line 583
    iget-object v15, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 584
    .line 585
    move-object/from16 v17, v15

    .line 586
    .line 587
    const-wide/16 v15, 0x0

    .line 588
    .line 589
    invoke-virtual/range {v11 .. v17}, Ll/swq0;->t(Ljava/lang/String;JJLjava/lang/Exception;)V

    .line 590
    .line 591
    .line 592
    :cond_9
    iget-object v12, v1, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 593
    .line 594
    invoke-static {v12}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 595
    .line 596
    .line 597
    move-result-object v12

    .line 598
    invoke-static {v10, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 599
    .line 600
    .line 601
    move-result v12

    .line 602
    if-nez v12, :cond_7

    .line 603
    .line 604
    goto/16 :goto_8

    .line 605
    .line 606
    :goto_d
    move-object v0, v9

    .line 607
    move-object/from16 v9, p1

    .line 608
    .line 609
    move-object/from16 p1, v0

    .line 610
    .line 611
    move-object v14, v10

    .line 612
    move-wide/from16 v12, v20

    .line 613
    .line 614
    move/from16 v0, v24

    .line 615
    .line 616
    const/4 v10, 0x1

    .line 617
    goto/16 :goto_1

    .line 618
    .line 619
    :catchall_4
    move-exception v0

    .line 620
    :goto_e
    new-instance v14, Ljava/lang/StringBuilder;

    .line 621
    .line 622
    invoke-direct {v14, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 623
    .line 624
    .line 625
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 626
    .line 627
    .line 628
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object v8

    .line 632
    invoke-static {v8}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 633
    .line 634
    .line 635
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 636
    .line 637
    .line 638
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 639
    .line 640
    .line 641
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    .line 643
    .line 644
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 645
    .line 646
    .line 647
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 648
    .line 649
    .line 650
    iget-object v2, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 651
    .line 652
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 653
    .line 654
    .line 655
    move-result-object v2

    .line 656
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 657
    .line 658
    .line 659
    move-result-object v2

    .line 660
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 661
    .line 662
    .line 663
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    .line 665
    .line 666
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 667
    .line 668
    .line 669
    move-result v2

    .line 670
    if-eqz v2, :cond_a

    .line 671
    .line 672
    move-object v2, v12

    .line 673
    goto :goto_f

    .line 674
    :cond_a
    new-instance v2, Ljava/lang/StringBuilder;

    .line 675
    .line 676
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 677
    .line 678
    .line 679
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 680
    .line 681
    .line 682
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 683
    .line 684
    .line 685
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    .line 687
    .line 688
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 689
    .line 690
    .line 691
    move-result-object v2

    .line 692
    :goto_f
    iget-object v3, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 693
    .line 694
    invoke-static {v12, v3}, Lcom/xiaomi/push/i;->h(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 695
    .line 696
    .line 697
    if-eqz v11, :cond_b

    .line 698
    .line 699
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 700
    .line 701
    .line 702
    move-result-wide v3

    .line 703
    sub-long v13, v3, v22

    .line 704
    .line 705
    const-wide/16 v15, 0x0

    .line 706
    .line 707
    iget-object v3, v1, Ll/b2r0;->t:Ljava/lang/Exception;

    .line 708
    .line 709
    move-object/from16 v17, v3

    .line 710
    .line 711
    invoke-virtual/range {v11 .. v17}, Ll/swq0;->t(Ljava/lang/String;JJLjava/lang/Exception;)V

    .line 712
    .line 713
    .line 714
    :cond_b
    iget-object v3, v1, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 715
    .line 716
    invoke-static {v3}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 717
    .line 718
    .line 719
    move-result-object v3

    .line 720
    invoke-static {v10, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 721
    .line 722
    .line 723
    move-result v3

    .line 724
    if-nez v3, :cond_c

    .line 725
    .line 726
    move-object v13, v2

    .line 727
    goto/16 :goto_9

    .line 728
    .line 729
    :cond_c
    throw v0

    .line 730
    :cond_d
    move-object/from16 v9, p1

    .line 731
    .line 732
    move-wide/from16 v20, v12

    .line 733
    .line 734
    move-object/from16 v13, v17

    .line 735
    .line 736
    goto/16 :goto_a

    .line 737
    .line 738
    :goto_10
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 739
    .line 740
    .line 741
    move-result-object v2

    .line 742
    invoke-virtual {v2}, Ll/xwq0;->c()V

    .line 743
    .line 744
    .line 745
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 746
    .line 747
    .line 748
    move-result-wide v2

    .line 749
    sub-long v2, v2, v18

    .line 750
    .line 751
    long-to-int v2, v2

    .line 752
    if-nez v10, :cond_10

    .line 753
    .line 754
    iget-wide v3, v1, Ll/b2r0;->C:J

    .line 755
    .line 756
    cmp-long v0, v3, v20

    .line 757
    .line 758
    if-eqz v0, :cond_e

    .line 759
    .line 760
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 761
    .line 762
    .line 763
    move-result-wide v3

    .line 764
    iget-wide v5, v1, Ll/b2r0;->C:J

    .line 765
    .line 766
    sub-long/2addr v3, v5

    .line 767
    const-wide/32 v5, 0x75300

    .line 768
    .line 769
    .line 770
    cmp-long v0, v3, v5

    .line 771
    .line 772
    if-lez v0, :cond_f

    .line 773
    .line 774
    :cond_e
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 775
    .line 776
    .line 777
    move-result-wide v3

    .line 778
    iput-wide v3, v1, Ll/b2r0;->C:J

    .line 779
    .line 780
    iget-object v0, v1, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 781
    .line 782
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 783
    .line 784
    .line 785
    move-result-object v0

    .line 786
    invoke-static {v0}, Ll/mtq0;->v(Landroid/content/Context;)Z

    .line 787
    .line 788
    .line 789
    move-result v0

    .line 790
    sget-object v1, Lcom/xiaomi/push/ei;->j:Lcom/xiaomi/push/ei;

    .line 791
    .line 792
    invoke-virtual {v1}, Lcom/xiaomi/push/ei;->a()I

    .line 793
    .line 794
    .line 795
    move-result v1

    .line 796
    const/4 v3, 0x0

    .line 797
    invoke-static {v3, v1, v2, v13, v0}, Lcom/xiaomi/push/i;->d(IIILjava/lang/String;I)V

    .line 798
    .line 799
    .line 800
    :cond_f
    new-instance v0, Lcom/xiaomi/push/fi;

    .line 801
    .line 802
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    invoke-direct {v0, v1}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    .line 807
    .line 808
    .line 809
    throw v0

    .line 810
    :cond_10
    const/4 v3, 0x0

    .line 811
    sget-object v1, Lcom/xiaomi/push/ei;->i:Lcom/xiaomi/push/ei;

    .line 812
    .line 813
    invoke-virtual {v1}, Lcom/xiaomi/push/ei;->a()I

    .line 814
    .line 815
    .line 816
    move-result v1

    .line 817
    invoke-static {v3, v1, v2, v13, v0}, Lcom/xiaomi/push/i;->d(IIILjava/lang/String;I)V

    .line 818
    .line 819
    .line 820
    return-void
.end method

.method private N(Ll/v1r0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/v1r0;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/v1r0;->a()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {p0, v0, p1}, Ll/b2r0;->L(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public A(Z)V
    .locals 7

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v3

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v5

    .line 9
    invoke-virtual {p0, p1}, Ll/b2r0;->O(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/xiaomi/push/service/m;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/m;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/xiaomi/push/service/m;->c()V

    .line 19
    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 24
    .line 25
    new-instance v0, Ll/b2r0$a;

    .line 26
    .line 27
    const/16 v2, 0xd

    .line 28
    .line 29
    move-object v1, p0

    .line 30
    invoke-direct/range {v0 .. v6}, Ll/b2r0$a;-><init>(Ll/b2r0;IJJ)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v1, 0x2710

    .line 34
    .line 35
    invoke-virtual {p1, v0, v1, v2}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;J)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public F()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Ljava/net/Socket;
    .locals 0

    .line 1
    new-instance p0, Ljava/net/Socket;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/net/Socket;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public H(Ljava/lang/String;)Ll/swq0;
    .locals 2

    .line 1
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1}, Ll/xwq0;->a(Ljava/lang/String;Z)Ll/swq0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/swq0;->u()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Ll/b2r0$c;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/b2r0$c;-><init>(Ll/b2r0;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/o2r0;->a(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-object v0
.end method

.method public abstract I()V
.end method

.method public declared-synchronized J(ILjava/lang/Exception;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/u1r0;->s()I

    .line 3
    .line 4
    .line 5
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    const/4 v1, 0x2

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :cond_0
    :try_start_1
    invoke-virtual {p0, v1, p1, p2}, Ll/u1r0;->h(IILjava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    const-string p1, ""

    .line 15
    .line 16
    iput-object p1, p0, Ll/u1r0;->j:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 17
    .line 18
    :try_start_2
    iget-object p1, p0, Ll/b2r0;->u:Ljava/net/Socket;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/net/Socket;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    .line 22
    .line 23
    :catchall_0
    const-wide/16 p1, 0x0

    .line 24
    .line 25
    :try_start_3
    iput-wide p1, p0, Ll/b2r0;->y:J

    .line 26
    .line 27
    iput-wide p1, p0, Ll/b2r0;->z:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_1
    move-exception p1

    .line 32
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 33
    throw p1
.end method

.method public K(Ljava/lang/Exception;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/b2r0;->A:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/32 v2, 0x493e0

    .line 9
    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-gez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 17
    .line 18
    invoke-static {v0}, Ll/mtq0;->t(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget v0, p0, Ll/b2r0;->B:I

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    iput v0, p0, Ll/b2r0;->B:I

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    if-lt v0, v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/b2r0;->c()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v3, "max short conn time reached, sink down current host:"

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const-wide/16 v2, 0x0

    .line 55
    .line 56
    invoke-virtual {p0, v0, v2, v3, p1}, Ll/b2r0;->M(Ljava/lang/String;JLjava/lang/Exception;)V

    .line 57
    .line 58
    .line 59
    iput v1, p0, Ll/b2r0;->B:I

    .line 60
    .line 61
    :cond_0
    return-void

    .line 62
    :cond_1
    iput v1, p0, Ll/b2r0;->B:I

    .line 63
    .line 64
    return-void
.end method

.method public M(Ljava/lang/String;JLjava/lang/Exception;)V
    .locals 9

    .line 1
    invoke-static {}, Ll/v1r0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p0, v1}, Ll/xwq0;->a(Ljava/lang/String;Z)Ll/swq0;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const-wide/16 v6, 0x0

    .line 17
    .line 18
    move-object v3, p1

    .line 19
    move-wide v4, p2

    .line 20
    move-object v8, p4

    .line 21
    invoke-virtual/range {v2 .. v8}, Ll/swq0;->t(Ljava/lang/String;JJLjava/lang/Exception;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/xwq0;->c()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public abstract O(Z)V
.end method

.method public P()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1r0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(ILjava/lang/Exception;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/mtq0;->u()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b2r0;->x:Lcom/xiaomi/push/service/XMPushService;

    .line 5
    .line 6
    new-instance v1, Ll/b2r0$b;

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-direct {v1, p0, v2, p1, p2}, Ll/b2r0$b;-><init>(Ll/b2r0;IILjava/lang/Exception;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public declared-synchronized R()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/u1r0;->D()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/u1r0;->B()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v1, v1, v0}, Ll/u1r0;->h(IILjava/lang/Exception;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/u1r0;->n:Ll/v1r0;

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ll/b2r0;->N(Ll/v1r0;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_2

    .line 29
    :catch_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "WARNING: current xmpp has connected"

    .line 32
    .line 33
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :goto_1
    :try_start_2
    new-instance v1, Lcom/xiaomi/push/fi;

    .line 39
    .line 40
    invoke-direct {v1, v0}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw v1

    .line 44
    :goto_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 45
    throw v0
.end method

.method public S()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/b2r0;->y:J

    .line 6
    .line 7
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/b2r0;->z:J

    .line 6
    .line 7
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2r0;->w:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(ILjava/lang/Exception;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b2r0;->J(ILjava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x12

    .line 7
    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    :cond_0
    iget-wide v0, p0, Ll/b2r0;->A:J

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long p1, v0, v2

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/b2r0;->K(Ljava/lang/Exception;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

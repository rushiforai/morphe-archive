.class public Ll/col;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile a:Ll/rg50;

.field private static volatile b:Ll/rg50;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static a(Ljava/lang/String;Ljava/lang/String;Ll/ag60;Ll/bej0;)Ll/i5d0;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v4, p3

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    const-string v6, ""

    .line 11
    .line 12
    if-eqz v4, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v7, Lcom/immomo/utils/tools/TraceData$LogNode;->PREPARE_TO_SEND_NETWORK_REQUEST:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 19
    .line 20
    new-array v8, v5, [Ljava/lang/Object;

    .line 21
    .line 22
    invoke-static {v7, v3, v6, v8}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    invoke-interface {v4, v0, v7}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v7

    .line 33
    const/4 v9, 0x1

    .line 34
    const/4 v0, 0x0

    .line 35
    move-object v10, v0

    .line 36
    move v11, v9

    .line 37
    :goto_0
    const/4 v12, 0x4

    .line 38
    if-gt v11, v12, :cond_c

    .line 39
    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    :try_start_0
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v13, Lcom/immomo/utils/tools/TraceData$LogNode;->SEND_NETWORK_REQUEST_TIMES:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 47
    .line 48
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v14

    .line 52
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v14

    .line 56
    invoke-static {v13, v3, v6, v14}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v13

    .line 60
    invoke-interface {v4, v0, v13}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catchall_0
    move-exception v0

    .line 65
    goto :goto_4

    .line 66
    :catch_0
    move-exception v0

    .line 67
    goto/16 :goto_7

    .line 68
    .line 69
    :cond_1
    :goto_1
    if-le v11, v9, :cond_2

    .line 70
    .line 71
    invoke-static {v1, v2, v3, v9}, Ll/col;->b(Ljava/lang/String;Ljava/lang/String;Ll/ag60;I)Ll/i5d0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    :goto_2
    move-object v10, v0

    .line 76
    goto :goto_3

    .line 77
    :cond_2
    invoke-static {v1, v2, v3, v5}, Ll/col;->b(Ljava/lang/String;Ljava/lang/String;Ll/ag60;I)Ll/i5d0;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_2

    .line 82
    :goto_3
    invoke-virtual {v10}, Ll/i5d0;->q()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/16 v13, 0xc8

    .line 87
    .line 88
    if-lt v0, v13, :cond_4

    .line 89
    .line 90
    const/16 v13, 0x12b

    .line 91
    .line 92
    if-gt v0, v13, :cond_4

    .line 93
    .line 94
    if-eqz v4, :cond_3

    .line 95
    .line 96
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    sget-object v13, Lcom/immomo/utils/tools/TraceData$LogNode;->NETWORK_REQUEST_SUCCESSFUL_TIMES:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 101
    .line 102
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v14

    .line 106
    filled-new-array {v14}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    invoke-static {v13, v3, v6, v14}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v13

    .line 114
    invoke-interface {v4, v0, v13}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    return-object v10

    .line 118
    :cond_4
    new-instance v13, Lcom/immomo/utils/network/exception/HttpResponseStatusErrorException;

    .line 119
    .line 120
    invoke-direct {v13, v0}, Lcom/immomo/utils/network/exception/HttpResponseStatusErrorException;-><init>(I)V

    .line 121
    .line 122
    .line 123
    throw v13
    :try_end_0
    .catch Lcom/immomo/utils/network/exception/HttpResponseStatusErrorException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    :goto_4
    add-int/lit8 v13, v11, 0x1

    .line 125
    .line 126
    const/16 v14, 0xa

    .line 127
    .line 128
    if-gt v13, v12, :cond_8

    .line 129
    .line 130
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 131
    .line 132
    .line 133
    move-result-wide v15

    .line 134
    sub-long/2addr v15, v7

    .line 135
    const-wide/16 v17, 0x7530

    .line 136
    .line 137
    cmp-long v12, v15, v17

    .line 138
    .line 139
    if-lez v12, :cond_5

    .line 140
    .line 141
    goto :goto_6

    .line 142
    :cond_5
    if-eqz v4, :cond_6

    .line 143
    .line 144
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v12

    .line 148
    sget-object v15, Lcom/immomo/utils/tools/TraceData$LogNode;->WAIT_ONE_SECOND_AND_REQUEST_AGAIN:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 149
    .line 150
    new-instance v9, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    new-array v14, v14, [B

    .line 156
    .line 157
    fill-array-data v14, :array_0

    .line 158
    .line 159
    .line 160
    invoke-static {v14}, Ll/riw;->a([B)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v14

    .line 164
    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v9

    .line 182
    filled-new-array {v9}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v9

    .line 186
    invoke-static {v15, v3, v0, v9}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-interface {v4, v12, v0}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    goto :goto_5

    .line 194
    :catchall_1
    move-exception v0

    .line 195
    goto/16 :goto_8

    .line 196
    .line 197
    :cond_6
    :goto_5
    const-wide/16 v11, 0x3e8

    .line 198
    .line 199
    invoke-static {v11, v12}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 200
    .line 201
    .line 202
    if-eqz v10, :cond_7

    .line 203
    .line 204
    invoke-virtual {v10}, Ll/i5d0;->k()Ll/k5d0;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    if-eqz v0, :cond_7

    .line 209
    .line 210
    invoke-virtual {v10}, Ll/i5d0;->k()Ll/k5d0;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v0}, Ll/k5d0;->close()V

    .line 215
    .line 216
    .line 217
    :cond_7
    move v11, v13

    .line 218
    const/4 v9, 0x1

    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_8
    :goto_6
    if-eqz v4, :cond_9

    .line 222
    .line 223
    :try_start_2
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    sget-object v2, Lcom/immomo/utils/tools/TraceData$LogNode;->REQUEST_TIMED_OUT:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 228
    .line 229
    new-instance v5, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .line 233
    .line 234
    new-array v6, v14, [B

    .line 235
    .line 236
    fill-array-data v6, :array_1

    .line 237
    .line 238
    .line 239
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v6

    .line 243
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v6

    .line 250
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object v6

    .line 261
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v6

    .line 265
    invoke-static {v2, v3, v5, v6}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-interface {v4, v1, v2}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    :cond_9
    throw v0

    .line 273
    :goto_7
    if-eqz v4, :cond_a

    .line 274
    .line 275
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    sget-object v2, Lcom/immomo/utils/tools/TraceData$LogNode;->NETWORK_REQUEST_FAILED_TIMES:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 280
    .line 281
    new-instance v5, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 284
    .line 285
    .line 286
    const/16 v6, 0x21

    .line 287
    .line 288
    new-array v6, v6, [B

    .line 289
    .line 290
    fill-array-data v6, :array_2

    .line 291
    .line 292
    .line 293
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v6

    .line 304
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 312
    .line 313
    .line 314
    move-result-object v6

    .line 315
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v6

    .line 319
    invoke-static {v2, v3, v5, v6}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    invoke-interface {v4, v1, v2}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    :cond_a
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 327
    :goto_8
    if-eqz v10, :cond_b

    .line 328
    .line 329
    invoke-virtual {v10}, Ll/i5d0;->k()Ll/k5d0;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    if-eqz v1, :cond_b

    .line 334
    .line 335
    invoke-virtual {v10}, Ll/i5d0;->k()Ll/k5d0;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    invoke-virtual {v1}, Ll/k5d0;->close()V

    .line 340
    .line 341
    .line 342
    :cond_b
    throw v0

    .line 343
    :cond_c
    if-eqz v4, :cond_d

    .line 344
    .line 345
    invoke-static {}, Ll/xiw;->c()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    sget-object v1, Lcom/immomo/utils/tools/TraceData$LogNode;->NETWORK_REQUEST_FAILED:Lcom/immomo/utils/tools/TraceData$LogNode;

    .line 350
    .line 351
    const/16 v2, 0x24

    .line 352
    .line 353
    new-array v2, v2, [B

    .line 354
    .line 355
    fill-array-data v2, :array_3

    .line 356
    .line 357
    .line 358
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    new-array v5, v5, [Ljava/lang/Object;

    .line 363
    .line 364
    invoke-static {v1, v3, v2, v5}, Lcom/immomo/utils/tools/TraceData;->a(Lcom/immomo/utils/tools/TraceData$LogNode;Ll/ag60;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    invoke-interface {v4, v0, v1}, Ll/bej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    :cond_d
    new-instance v0, Lcom/immomo/utils/network/exception/HttpBaseException;

    .line 372
    .line 373
    const/16 v1, 0x24

    .line 374
    .line 375
    new-array v1, v1, [B

    .line 376
    .line 377
    fill-array-data v1, :array_4

    .line 378
    .line 379
    .line 380
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    invoke-direct {v0, v1}, Lcom/immomo/utils/network/exception/HttpBaseException;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    throw v0

    .line 388
    nop

    .line 389
    :array_0
    .array-data 1
        0x64t
        0xet
        0x43t
        0x58t
        0x16t
        0x7t
        0x52t
        0xat
        0x54t
        0xdt
    .end array-data

    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    nop

    .line 399
    :array_1
    .array-data 1
        0x64t
        0xet
        0x43t
        0x58t
        0x16t
        0x7t
        0x52t
        0xat
        0x54t
        0xdt
    .end array-data

    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    nop

    .line 409
    :array_2
    .array-data 1
        0x78t
        0x12t
        0x45t
        0x47t
        0x33t
        0x3t
        0x43t
        0x16t
        0x5et
        0x59t
        0x12t
        0x3t
        0x63t
        0x12t
        0x50t
        0x43t
        0x14t
        0x15t
        0x75t
        0x14t
        0x43t
        0x58t
        0x13t
        0x23t
        0x48t
        0x5t
        0x54t
        0x47t
        0x15t
        0xft
        0x5ft
        0x8t
        0xbt
    .end array-data

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
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    nop

    .line 431
    :array_3
    .array-data 1
        -0x29t
        -0x25t
        -0x60t
        -0x30t
        -0x26t
        -0x6t
        -0x28t
        -0x37t
        -0x7at
        -0x2ft
        -0x30t
        -0x1ct
        -0x2bt
        -0x3et
        -0x80t
        -0x21t
        -0x2bt
        -0x3dt
        -0x21t
        -0x26t
        -0x43t
        -0x21t
        -0x32t
        -0x2ft
        -0x29t
        -0x32t
        -0x44t
        -0x2et
        -0xft
        -0x18t
        -0x27t
        -0x1ft
        -0x44t
        -0x21t
        -0x32t
        -0xdt
    .end array-data

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
    :array_4
    .array-data 1
        -0x29t
        -0x25t
        -0x60t
        -0x30t
        -0x26t
        -0x6t
        -0x28t
        -0x37t
        -0x7at
        -0x2ft
        -0x30t
        -0x1ct
        -0x2bt
        -0x3et
        -0x80t
        -0x21t
        -0x2bt
        -0x3dt
        -0x21t
        -0x26t
        -0x43t
        -0x21t
        -0x32t
        -0x2ft
        -0x29t
        -0x32t
        -0x44t
        -0x2et
        -0xft
        -0x18t
        -0x27t
        -0x1ft
        -0x44t
        -0x21t
        -0x32t
        -0xdt
    .end array-data
.end method

.method private static b(Ljava/lang/String;Ljava/lang/String;Ll/ag60;I)Ll/i5d0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l1j$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l1j$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    new-array v1, v1, [B

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1, p1}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x7

    .line 21
    new-array v1, v0, [B

    .line 22
    .line 23
    fill-array-data v1, :array_1

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p2, Ll/ag60;->f:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v1, v2}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 v1, 0x2

    .line 37
    new-array v2, v1, [B

    .line 38
    .line 39
    fill-array-data v2, :array_2

    .line 40
    .line 41
    .line 42
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-array v3, v0, [B

    .line 47
    .line 48
    fill-array-data v3, :array_3

    .line 49
    .line 50
    .line 51
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {p1, v2, v3}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-array v1, v1, [B

    .line 60
    .line 61
    fill-array-data v1, :array_4

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {}, Ll/xiw;->b()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {p1, v1, v2}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Ll/l1j$a;->b()Ll/l1j;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    if-eqz p3, :cond_1

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    if-eq p3, v1, :cond_0

    .line 84
    .line 85
    const/4 p3, 0x0

    .line 86
    goto :goto_0

    .line 87
    :cond_0
    invoke-static {}, Ll/col;->d()Ll/rg50;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    goto :goto_0

    .line 92
    :cond_1
    invoke-static {}, Ll/col;->c()Ll/rg50;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    :goto_0
    new-instance v1, Ll/x1d0$a;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/x1d0$a;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const/16 v1, 0xa

    .line 106
    .line 107
    new-array v2, v1, [B

    .line 108
    .line 109
    fill-array-data v2, :array_5

    .line 110
    .line 111
    .line 112
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const/4 v3, 0x5

    .line 117
    new-array v4, v3, [B

    .line 118
    .line 119
    fill-array-data v4, :array_6

    .line 120
    .line 121
    .line 122
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-virtual {p0, v2, v4}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    new-array v0, v0, [B

    .line 131
    .line 132
    fill-array-data v0, :array_7

    .line 133
    .line 134
    .line 135
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-array v2, v3, [B

    .line 140
    .line 141
    fill-array-data v2, :array_8

    .line 142
    .line 143
    .line 144
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-virtual {p0, v0, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    const/16 v0, 0xf

    .line 153
    .line 154
    new-array v0, v0, [B

    .line 155
    .line 156
    fill-array-data v0, :array_9

    .line 157
    .line 158
    .line 159
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-array v2, v3, [B

    .line 164
    .line 165
    fill-array-data v2, :array_a

    .line 166
    .line 167
    .line 168
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {p0, v0, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    new-array v0, v1, [B

    .line 177
    .line 178
    fill-array-data v0, :array_b

    .line 179
    .line 180
    .line 181
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget-object v2, p2, Ll/ag60;->e:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {p0, v0, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    const/16 v0, 0xc

    .line 192
    .line 193
    new-array v0, v0, [B

    .line 194
    .line 195
    fill-array-data v0, :array_c

    .line 196
    .line 197
    .line 198
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    const/16 v2, 0x21

    .line 203
    .line 204
    new-array v2, v2, [B

    .line 205
    .line 206
    fill-array-data v2, :array_d

    .line 207
    .line 208
    .line 209
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {p0, v0, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    const/4 v0, 0x6

    .line 218
    new-array v0, v0, [B

    .line 219
    .line 220
    fill-array-data v0, :array_e

    .line 221
    .line 222
    .line 223
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    new-instance v2, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .line 231
    .line 232
    new-array v1, v1, [B

    .line 233
    .line 234
    fill-array-data v1, :array_f

    .line 235
    .line 236
    .line 237
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    iget-object p2, p2, Ll/ag60;->c:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    invoke-virtual {p0, v0, p2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    if-eqz p3, :cond_2

    .line 266
    .line 267
    invoke-virtual {p3, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    return-object p0

    .line 276
    :cond_2
    const/16 p0, 0x12

    .line 277
    .line 278
    new-array p0, p0, [B

    .line 279
    .line 280
    fill-array-data p0, :array_10

    .line 281
    .line 282
    .line 283
    invoke-static {p0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    const/4 p0, 0x0

    .line 291
    return-object p0

    .line 292
    nop

    .line 293
    :array_0
    .array-data 1
        0x5dt
        0x1ct
        0x58t
        0x47t
    .end array-data

    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    :array_1
    .array-data 1
        0x51t
        0x16t
        0x41t
        0x59t
        0x0t
        0xbt
        0x55t
    .end array-data

    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    :array_2
    .array-data 1
        0x5ft
        0x15t
    .end array-data

    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    nop

    .line 313
    :array_3
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
    .end array-data

    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    :array_4
    .array-data 1
        0x43t
        0x10t
    .end array-data

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    nop

    .line 327
    :array_5
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x59t
        0x4t
        0x5t
        0x44t
        0xft
        0x5et
        0x59t
    .end array-data

    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    nop

    .line 337
    :array_6
    .array-data 1
        0x53t
        0xat
        0x5et
        0x44t
        0x4t
    .end array-data

    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    nop

    .line 345
    :array_7
    .array-data 1
        0x73t
        0xet
        0x50t
        0x45t
        0x12t
        0x3t
        0x44t
    .end array-data

    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    :array_8
    .array-data 1
        0x65t
        0x32t
        0x77t
        0x1at
        0x59t
    .end array-data

    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    nop

    .line 361
    :array_9
    .array-data 1
        0x71t
        0x5t
        0x52t
        0x52t
        0x11t
        0x12t
        0x1dt
        0x2at
        0x50t
        0x59t
        0x6t
        0x13t
        0x51t
        0x1t
        0x54t
    .end array-data

    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    :array_a
    .array-data 1
        0x4at
        0xet
        0x1ct
        0x74t
        0x2ft
    .end array-data

    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    nop

    .line 381
    :array_b
    .array-data 1
        0x65t
        0x15t
        0x54t
        0x45t
        0x4ct
        0x27t
        0x57t
        0x3t
        0x5ft
        0x43t
    .end array-data

    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    nop

    .line 391
    :array_c
    .array-data 1
        0x73t
        0x9t
        0x5ft
        0x43t
        0x4t
        0x8t
        0x44t
        0x4bt
        0x65t
        0x4et
        0x11t
        0x3t
    .end array-data

    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    :array_d
    .array-data 1
        0x51t
        0x16t
        0x41t
        0x5bt
        0x8t
        0x5t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
        0x49t
        0x48t
        0x4bt
        0x46t
        0x40t
        0x16t
        0x4bt
        0x56t
        0x9t
        0x43t
        0x5at
        0x4ct
        0x13t
        0x42t
        0xat
        0x54t
        0x59t
        0x2t
        0x9t
        0x54t
        0x3t
        0x55t
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
    .line 422
    nop

    .line 423
    :array_e
    .array-data 1
        0x53t
        0x9t
        0x5et
        0x5ct
        0x8t
        0x3t
    .end array-data

    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    nop

    .line 431
    :array_f
    .array-data 1
        0x63t
        0x23t
        0x62t
        0x64t
        0x28t
        0x29t
        0x7et
        0x2ft
        0x75t
        0xat
    .end array-data

    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    nop

    .line 441
    :array_10
    .array-data 1
        0x78t
        0x12t
        0x45t
        0x47t
        0x22t
        0xat
        0x59t
        0x3t
        0x5ft
        0x43t
        0x41t
        0xft
        0x43t
        0x46t
        0x5ft
        0x42t
        0xdt
        0xat
    .end array-data
.end method

.method private static c()Ll/rg50;
    .locals 5

    .line 1
    sget-object v0, Ll/col;->a:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/col;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/col;->a:Ll/rg50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/rg50;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/rg50;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ll/rg50;->v()Ll/rg50$b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    const-wide/16 v3, 0xf

    .line 24
    .line 25
    invoke-virtual {v1, v3, v4, v2}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v3, v4, v2}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget-object v2, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 34
    .line 35
    sget-object v3, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 36
    .line 37
    filled-new-array {v2, v3}, [Lokhttp3/Protocol;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ll/rg50$b;->r(Ljava/util/List;)Ll/rg50$b;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ll/rg50$b;->s(Ljava/net/Proxy;)Ll/rg50$b;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/rg50$b;->c()Ll/rg50;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sput-object v1, Ll/col;->a:Ll/rg50;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v1

    .line 67
    goto :goto_1

    .line 68
    :cond_0
    :goto_0
    monitor-exit v0

    .line 69
    goto :goto_2

    .line 70
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    throw v1

    .line 72
    :cond_1
    :goto_2
    sget-object v0, Ll/col;->a:Ll/rg50;

    .line 73
    .line 74
    return-object v0
.end method

.method private static d()Ll/rg50;
    .locals 5

    .line 1
    sget-object v0, Ll/col;->b:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/col;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/col;->b:Ll/rg50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/rg50;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/rg50;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ll/rg50;->v()Ll/rg50$b;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    const-wide/16 v3, 0xf

    .line 24
    .line 25
    invoke-virtual {v1, v3, v4, v2}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v3, v4, v2}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget-object v2, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 34
    .line 35
    sget-object v3, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 36
    .line 37
    filled-new-array {v2, v3}, [Lokhttp3/Protocol;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ll/rg50$b;->r(Ljava/util/List;)Ll/rg50$b;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/qml;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/qml;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ll/rg50$b;->k(Ll/t4f;)Ll/rg50$b;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/tml;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/tml;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ll/rg50$b;->s(Ljava/net/Proxy;)Ll/rg50$b;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Ll/rg50$b;->c()Ll/rg50;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sput-object v1, Ll/col;->b:Ll/rg50;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catchall_0
    move-exception v1

    .line 85
    goto :goto_1

    .line 86
    :cond_0
    :goto_0
    monitor-exit v0

    .line 87
    goto :goto_2

    .line 88
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    throw v1

    .line 90
    :cond_1
    :goto_2
    sget-object v0, Ll/col;->b:Ll/rg50;

    .line 91
    .line 92
    return-object v0
.end method

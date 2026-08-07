.class public final Ltech/sud/logger/Suddo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic Suddo:I

.field public final synthetic Sudfor:Ljava/lang/String;

.field public final synthetic Sudif:Ltech/sud/logger/Sudelse;

.field public final synthetic Sudint:J

.field public final synthetic Sudnew:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILtech/sud/logger/Sudelse;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 1
    iput p1, p0, Ltech/sud/logger/Suddo;->Suddo:I

    .line 2
    .line 3
    iput-object p2, p0, Ltech/sud/logger/Suddo;->Sudif:Ltech/sud/logger/Sudelse;

    .line 4
    .line 5
    iput-object p3, p0, Ltech/sud/logger/Suddo;->Sudfor:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p4, p0, Ltech/sud/logger/Suddo;->Sudint:J

    .line 8
    .line 9
    iput-object p6, p0, Ltech/sud/logger/Suddo;->Sudnew:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ltech/sud/logger/Suddo;->Suddo:I

    .line 4
    .line 5
    iget-object v2, v0, Ltech/sud/logger/Suddo;->Sudif:Ltech/sud/logger/Sudelse;

    .line 6
    .line 7
    iget-object v2, v2, Ltech/sud/logger/Sudelse;->Suddo:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v4, v0, Ltech/sud/logger/Suddo;->Sudif:Ltech/sud/logger/Sudelse;

    .line 15
    .line 16
    iget-object v4, v4, Ltech/sud/logger/Sudelse;->Sudfor:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v4, v0, Ltech/sud/logger/Suddo;->Sudfor:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-wide v4, v0, Ltech/sud/logger/Suddo;->Sudint:J

    .line 31
    .line 32
    iget-object v0, v0, Ltech/sud/logger/Suddo;->Sudnew:Ljava/lang/String;

    .line 33
    .line 34
    sget v6, Ltech/sud/logger/LogUtils;->V:I

    .line 35
    .line 36
    new-instance v6, Ljava/util/Date;

    .line 37
    .line 38
    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    .line 39
    .line 40
    .line 41
    sget-object v7, Ltech/sud/logger/LogUtils;->Sudnew:Ljava/text/SimpleDateFormat;

    .line 42
    .line 43
    const-string v8, "yyyy_MM_dd HH:mm:ss.SSS "

    .line 44
    .line 45
    if-nez v7, :cond_0

    .line 46
    .line 47
    new-instance v7, Ljava/text/SimpleDateFormat;

    .line 48
    .line 49
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 50
    .line 51
    invoke-direct {v7, v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 52
    .line 53
    .line 54
    sput-object v7, Ltech/sud/logger/LogUtils;->Sudnew:Ljava/text/SimpleDateFormat;

    .line 55
    .line 56
    :cond_0
    sget-object v7, Ltech/sud/logger/LogUtils;->Sudnew:Ljava/text/SimpleDateFormat;

    .line 57
    .line 58
    invoke-virtual {v7, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    const/4 v9, 0x0

    .line 63
    const/16 v10, 0xa

    .line 64
    .line 65
    invoke-virtual {v7, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    sget-object v12, Ltech/sud/logger/LogUtils;->Sudnew:Ljava/text/SimpleDateFormat;

    .line 70
    .line 71
    if-nez v12, :cond_1

    .line 72
    .line 73
    new-instance v12, Ljava/text/SimpleDateFormat;

    .line 74
    .line 75
    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 76
    .line 77
    invoke-direct {v12, v8, v13}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 78
    .line 79
    .line 80
    sput-object v12, Ltech/sud/logger/LogUtils;->Sudnew:Ljava/text/SimpleDateFormat;

    .line 81
    .line 82
    :cond_1
    sget-object v8, Ltech/sud/logger/LogUtils;->Sudnew:Ljava/text/SimpleDateFormat;

    .line 83
    .line 84
    invoke-virtual {v8, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-virtual {v6, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    new-instance v8, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    sget-object v12, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 98
    .line 99
    iget-object v13, v12, Ltech/sud/logger/Sudcase;->Sudif:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v13, :cond_2

    .line 102
    .line 103
    iget-object v13, v12, Ltech/sud/logger/Sudcase;->Suddo:Ljava/lang/String;

    .line 104
    .line 105
    :cond_2
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v13, v12, Ltech/sud/logger/Sudcase;->Sudfor:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v13, "_"

    .line 114
    .line 115
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget-object v6, v12, Ltech/sud/logger/Sudcase;->Sudcase:Ljava/lang/String;

    .line 125
    .line 126
    const-string v12, ""

    .line 127
    .line 128
    const-string v14, ":"

    .line 129
    .line 130
    if-nez v6, :cond_3

    .line 131
    .line 132
    move-object v6, v12

    .line 133
    goto :goto_0

    .line 134
    :cond_3
    invoke-virtual {v6, v14, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v6

    .line 138
    :goto_0
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    const-string v8, ".txt"

    .line 146
    .line 147
    invoke-virtual {v6, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v15

    .line 151
    move/from16 v16, v9

    .line 152
    .line 153
    :goto_1
    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v17

    .line 157
    const/16 v18, 0x0

    .line 158
    .line 159
    if-eqz v17, :cond_4

    .line 160
    .line 161
    :goto_2
    move/from16 v19, v1

    .line 162
    .line 163
    move-object/from16 v20, v2

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_4
    new-instance v9, Ljava/io/File;

    .line 167
    .line 168
    invoke-direct {v9, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 172
    .line 173
    .line 174
    move-result v17

    .line 175
    if-eqz v17, :cond_7

    .line 176
    .line 177
    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    .line 178
    .line 179
    .line 180
    move-result v17

    .line 181
    if-nez v17, :cond_5

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_5
    sget-object v10, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 185
    .line 186
    move/from16 v19, v1

    .line 187
    .line 188
    move-object/from16 v20, v2

    .line 189
    .line 190
    iget-wide v1, v10, Ltech/sud/logger/Sudcase;->Sudgoto:J

    .line 191
    .line 192
    const-wide/16 v21, 0x400

    .line 193
    .line 194
    cmp-long v1, v1, v21

    .line 195
    .line 196
    if-lez v1, :cond_8

    .line 197
    .line 198
    invoke-virtual {v9}, Ljava/io/File;->length()J

    .line 199
    .line 200
    .line 201
    move-result-wide v1

    .line 202
    iget-wide v9, v10, Ltech/sud/logger/Sudcase;->Sudgoto:J

    .line 203
    .line 204
    cmp-long v1, v1, v9

    .line 205
    .line 206
    if-lez v1, :cond_8

    .line 207
    .line 208
    :goto_3
    add-int/lit8 v1, v16, 0x1

    .line 209
    .line 210
    new-instance v2, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    sget-object v9, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 225
    .line 226
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v15

    .line 236
    const/16 v2, 0x64

    .line 237
    .line 238
    if-le v1, v2, :cond_6

    .line 239
    .line 240
    move-object/from16 v15, v18

    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_6
    move/from16 v16, v1

    .line 244
    .line 245
    move/from16 v1, v19

    .line 246
    .line 247
    move-object/from16 v2, v20

    .line 248
    .line 249
    const/4 v9, 0x0

    .line 250
    const/16 v10, 0xa

    .line 251
    .line 252
    goto :goto_1

    .line 253
    :cond_7
    move/from16 v19, v1

    .line 254
    .line 255
    move-object/from16 v20, v2

    .line 256
    .line 257
    :cond_8
    :goto_4
    :try_start_0
    invoke-static {v15, v11}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/String;Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-nez v1, :cond_9

    .line 262
    .line 263
    const-string v0, "LogUtils"

    .line 264
    .line 265
    new-instance v1, Ljava/lang/StringBuilder;

    .line 266
    .line 267
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 268
    .line 269
    .line 270
    const-string v2, "create "

    .line 271
    .line 272
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    const-string v2, " failed!"

    .line 279
    .line 280
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_9
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    if-nez v1, :cond_a

    .line 296
    .line 297
    :goto_5
    move-object/from16 v1, v18

    .line 298
    .line 299
    goto :goto_7

    .line 300
    :cond_a
    invoke-virtual {v1}, Ljava/util/TimeZone;->getRawOffset()I

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    const v2, 0x36ee80

    .line 305
    .line 306
    .line 307
    div-int v2, v1, v2

    .line 308
    .line 309
    const v6, 0xea60

    .line 310
    .line 311
    .line 312
    div-int/2addr v1, v6

    .line 313
    rem-int/lit8 v1, v1, 0x3c

    .line 314
    .line 315
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    if-ltz v2, :cond_b

    .line 320
    .line 321
    const-string v6, "+"

    .line 322
    .line 323
    goto :goto_6

    .line 324
    :cond_b
    const-string v6, "-"

    .line 325
    .line 326
    :goto_6
    new-instance v8, Ljava/lang/StringBuilder;

    .line 327
    .line 328
    const-string v9, "UTC"

    .line 329
    .line 330
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    const/16 v2, 0xa

    .line 347
    .line 348
    if-ge v1, v2, :cond_c

    .line 349
    .line 350
    const-string v12, "0"

    .line 351
    .line 352
    :cond_c
    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    const-string v1, " "

    .line 359
    .line 360
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v18

    .line 367
    goto :goto_5

    .line 368
    :goto_7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 369
    .line 370
    const-string v6, "("

    .line 371
    .line 372
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    sget v6, Ltech/sud/logger/LogUtils;->Sudtry:I

    .line 376
    .line 377
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    const-string v0, ")"

    .line 393
    .line 394
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    const/16 v2, 0xb

    .line 402
    .line 403
    invoke-virtual {v7, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    new-instance v4, Ljava/lang/StringBuilder;

    .line 408
    .line 409
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 410
    .line 411
    .line 412
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    sget-object v1, Ltech/sud/logger/LogUtils;->Suddo:[C

    .line 419
    .line 420
    add-int/lit8 v2, v19, -0x2

    .line 421
    .line 422
    aget-char v1, v1, v2

    .line 423
    .line 424
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v1, "/"

    .line 428
    .line 429
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    move-object/from16 v1, v20

    .line 433
    .line 434
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    sget-object v0, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 444
    .line 445
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    const/4 v1, 0x0

    .line 453
    :try_start_1
    invoke-static {v15, v0, v1}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 454
    .line 455
    .line 456
    return-void

    .line 457
    :catch_0
    move-exception v0

    .line 458
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 459
    .line 460
    .line 461
    goto :goto_8

    .line 462
    :catch_1
    move-exception v0

    .line 463
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 464
    .line 465
    .line 466
    :goto_8
    return-void
.end method

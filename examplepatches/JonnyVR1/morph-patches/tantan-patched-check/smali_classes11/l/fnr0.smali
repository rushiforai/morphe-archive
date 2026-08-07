.class public final Ll/fnr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ll/dpw0;

.field public static final e:Ll/dpw0;


# instance fields
.field public final a:Ljava/util/List;

.field public b:I

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x3a

    .line 2
    .line 3
    invoke-static {v0}, Ll/bow0;->b(C)Ll/bow0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/dpw0;->c(Ll/bow0;)Ll/dpw0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/fnr0;->d:Ll/dpw0;

    .line 12
    .line 13
    const/16 v0, 0x2a

    .line 14
    .line 15
    invoke-static {v0}, Ll/bow0;->b(C)Ll/bow0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/dpw0;->c(Ll/bow0;)Ll/dpw0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/fnr0;->e:Ll/dpw0;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fnr0;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/fnr0;->b:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Ll/qer0;Ll/yfr0;Ljava/util/List;)I
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget v3, v0, Ll/fnr0;->b:I

    .line 8
    .line 9
    const/4 v6, 0x1

    .line 10
    if-eqz v3, :cond_d

    .line 11
    .line 12
    const/4 v7, 0x2

    .line 13
    const/16 v8, 0x8

    .line 14
    .line 15
    const/4 v9, 0x0

    .line 16
    if-eq v3, v6, :cond_b

    .line 17
    .line 18
    const/4 v10, 0x3

    .line 19
    const/16 v11, 0x890

    .line 20
    .line 21
    const/16 v12, 0xb03

    .line 22
    .line 23
    const/16 v13, 0xb00

    .line 24
    .line 25
    const/16 v14, 0xb04

    .line 26
    .line 27
    const/16 v15, 0xb01

    .line 28
    .line 29
    if-eq v3, v7, :cond_7

    .line 30
    .line 31
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 32
    .line 33
    .line 34
    move-result-wide v16

    .line 35
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 36
    .line 37
    .line 38
    move-result-wide v18

    .line 39
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 40
    .line 41
    .line 42
    move-result-wide v20

    .line 43
    sub-long v18, v18, v20

    .line 44
    .line 45
    iget v3, v0, Ll/fnr0;->c:I

    .line 46
    .line 47
    int-to-long v4, v3

    .line 48
    new-instance v3, Ll/bgw0;

    .line 49
    .line 50
    sub-long v4, v18, v4

    .line 51
    .line 52
    long-to-int v4, v4

    .line 53
    invoke-direct {v3, v4}, Ll/bgw0;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-interface {v1, v5, v9, v4}, Ll/qer0;->h([BII)V

    .line 61
    .line 62
    .line 63
    move v1, v9

    .line 64
    :goto_0
    iget-object v4, v0, Ll/fnr0;->a:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-ge v1, v4, :cond_6

    .line 71
    .line 72
    iget-object v4, v0, Ll/fnr0;->a:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Ll/enr0;

    .line 79
    .line 80
    iget-wide v7, v4, Ll/enr0;->a:J

    .line 81
    .line 82
    sub-long v7, v7, v16

    .line 83
    .line 84
    long-to-int v7, v7

    .line 85
    invoke-virtual {v3, v7}, Ll/bgw0;->k(I)V

    .line 86
    .line 87
    .line 88
    const/4 v7, 0x4

    .line 89
    invoke-virtual {v3, v7}, Ll/bgw0;->l(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3}, Ll/bgw0;->x()I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    sget-object v8, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 97
    .line 98
    invoke-virtual {v3, v7, v8}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 103
    .line 104
    .line 105
    move-result v18

    .line 106
    sparse-switch v18, :sswitch_data_0

    .line 107
    .line 108
    .line 109
    :cond_0
    const/4 v1, 0x0

    .line 110
    goto/16 :goto_5

    .line 111
    .line 112
    :sswitch_0
    const-string v6, "Super_SlowMotion_BGM"

    .line 113
    .line 114
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    if-eqz v5, :cond_0

    .line 119
    .line 120
    move v5, v15

    .line 121
    goto :goto_1

    .line 122
    :sswitch_1
    const-string v6, "Super_SlowMotion_Deflickering_On"

    .line 123
    .line 124
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eqz v5, :cond_0

    .line 129
    .line 130
    move v5, v14

    .line 131
    goto :goto_1

    .line 132
    :sswitch_2
    const-string v6, "Super_SlowMotion_Data"

    .line 133
    .line 134
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-eqz v5, :cond_0

    .line 139
    .line 140
    move v5, v13

    .line 141
    goto :goto_1

    .line 142
    :sswitch_3
    const-string v6, "Super_SlowMotion_Edit_Data"

    .line 143
    .line 144
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    if-eqz v5, :cond_0

    .line 149
    .line 150
    move v5, v12

    .line 151
    goto :goto_1

    .line 152
    :sswitch_4
    const-string v6, "SlowMotion_Data"

    .line 153
    .line 154
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    if-eqz v5, :cond_0

    .line 159
    .line 160
    move v5, v11

    .line 161
    :goto_1
    iget v4, v4, Ll/enr0;->b:I

    .line 162
    .line 163
    add-int/lit8 v7, v7, 0x8

    .line 164
    .line 165
    sub-int/2addr v4, v7

    .line 166
    if-eq v5, v11, :cond_3

    .line 167
    .line 168
    if-eq v5, v13, :cond_2

    .line 169
    .line 170
    if-eq v5, v15, :cond_2

    .line 171
    .line 172
    if-eq v5, v12, :cond_2

    .line 173
    .line 174
    if-ne v5, v14, :cond_1

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 178
    .line 179
    .line 180
    return v9

    .line 181
    :cond_2
    :goto_2
    move-object/from16 v6, p3

    .line 182
    .line 183
    goto :goto_4

    .line 184
    :cond_3
    new-instance v6, Ljava/util/ArrayList;

    .line 185
    .line 186
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3, v4, v8}, Ll/bgw0;->a(ILjava/nio/charset/Charset;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    sget-object v5, Ll/fnr0;->e:Ll/dpw0;

    .line 194
    .line 195
    invoke-virtual {v5, v4}, Ll/dpw0;->f(Ljava/lang/CharSequence;)Ljava/util/List;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    move v7, v9

    .line 200
    :goto_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    if-ge v7, v5, :cond_5

    .line 205
    .line 206
    sget-object v5, Ll/fnr0;->d:Ll/dpw0;

    .line 207
    .line 208
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v8

    .line 212
    check-cast v8, Ljava/lang/CharSequence;

    .line 213
    .line 214
    invoke-virtual {v5, v8}, Ll/dpw0;->f(Ljava/lang/CharSequence;)Ljava/util/List;

    .line 215
    .line 216
    .line 217
    move-result-object v5

    .line 218
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 219
    .line 220
    .line 221
    move-result v8

    .line 222
    if-ne v8, v10, :cond_4

    .line 223
    .line 224
    :try_start_0
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v8

    .line 228
    check-cast v8, Ljava/lang/String;

    .line 229
    .line 230
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 231
    .line 232
    .line 233
    move-result-wide v23

    .line 234
    const/4 v8, 0x1

    .line 235
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v22

    .line 239
    check-cast v22, Ljava/lang/String;

    .line 240
    .line 241
    invoke-static/range {v22 .. v22}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 242
    .line 243
    .line 244
    move-result-wide v25

    .line 245
    const/4 v8, 0x2

    .line 246
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v22

    .line 250
    check-cast v22, Ljava/lang/String;

    .line 251
    .line 252
    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    move-result v8

    .line 256
    add-int/lit8 v8, v8, -0x1

    .line 257
    .line 258
    const/16 v19, 0x1

    .line 259
    .line 260
    shl-int v27, v19, v8

    .line 261
    .line 262
    new-instance v22, Lcom/google/android/gms/internal/ads/zzahi;

    .line 263
    .line 264
    invoke-direct/range {v22 .. v27}, Lcom/google/android/gms/internal/ads/zzahi;-><init>(JJI)V

    .line 265
    .line 266
    .line 267
    move-object/from16 v8, v22

    .line 268
    .line 269
    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    .line 271
    .line 272
    add-int/lit8 v7, v7, 0x1

    .line 273
    .line 274
    goto :goto_3

    .line 275
    :catch_0
    move-exception v0

    .line 276
    const/4 v1, 0x0

    .line 277
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    throw v0

    .line 282
    :cond_4
    const/4 v1, 0x0

    .line 283
    invoke-static {v1, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    throw v0

    .line 288
    :cond_5
    new-instance v4, Lcom/google/android/gms/internal/ads/zzahj;

    .line 289
    .line 290
    invoke-direct {v4, v6}, Lcom/google/android/gms/internal/ads/zzahj;-><init>(Ljava/util/List;)V

    .line 291
    .line 292
    .line 293
    move-object/from16 v6, p3

    .line 294
    .line 295
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 299
    .line 300
    const/4 v6, 0x1

    .line 301
    const/4 v7, 0x2

    .line 302
    goto/16 :goto_0

    .line 303
    .line 304
    :goto_5
    const-string v0, "Invalid SEF name"

    .line 305
    .line 306
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    throw v0

    .line 311
    :cond_6
    const-wide/16 v0, 0x0

    .line 312
    .line 313
    iput-wide v0, v2, Ll/yfr0;->a:J

    .line 314
    .line 315
    :goto_6
    const/4 v8, 0x1

    .line 316
    goto/16 :goto_a

    .line 317
    .line 318
    :cond_7
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 319
    .line 320
    .line 321
    move-result-wide v3

    .line 322
    iget v6, v0, Ll/fnr0;->c:I

    .line 323
    .line 324
    add-int/lit8 v6, v6, -0x14

    .line 325
    .line 326
    new-instance v7, Ll/bgw0;

    .line 327
    .line 328
    invoke-direct {v7, v6}, Ll/bgw0;-><init>(I)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v7}, Ll/bgw0;->m()[B

    .line 332
    .line 333
    .line 334
    move-result-object v5

    .line 335
    invoke-interface {v1, v5, v9, v6}, Ll/qer0;->h([BII)V

    .line 336
    .line 337
    .line 338
    move v1, v9

    .line 339
    :goto_7
    div-int/lit8 v5, v6, 0xc

    .line 340
    .line 341
    if-ge v1, v5, :cond_9

    .line 342
    .line 343
    const/4 v5, 0x2

    .line 344
    invoke-virtual {v7, v5}, Ll/bgw0;->l(I)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v7}, Ll/bgw0;->c()S

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    if-eq v5, v11, :cond_8

    .line 352
    .line 353
    if-eq v5, v13, :cond_8

    .line 354
    .line 355
    if-eq v5, v15, :cond_8

    .line 356
    .line 357
    if-eq v5, v12, :cond_8

    .line 358
    .line 359
    if-eq v5, v14, :cond_8

    .line 360
    .line 361
    invoke-virtual {v7, v8}, Ll/bgw0;->l(I)V

    .line 362
    .line 363
    .line 364
    goto :goto_8

    .line 365
    :cond_8
    iget v11, v0, Ll/fnr0;->c:I

    .line 366
    .line 367
    int-to-long v12, v11

    .line 368
    sub-long v11, v3, v12

    .line 369
    .line 370
    invoke-virtual {v7}, Ll/bgw0;->x()I

    .line 371
    .line 372
    .line 373
    move-result v13

    .line 374
    int-to-long v14, v13

    .line 375
    invoke-virtual {v7}, Ll/bgw0;->x()I

    .line 376
    .line 377
    .line 378
    move-result v13

    .line 379
    iget-object v8, v0, Ll/fnr0;->a:Ljava/util/List;

    .line 380
    .line 381
    new-instance v9, Ll/enr0;

    .line 382
    .line 383
    sub-long/2addr v11, v14

    .line 384
    invoke-direct {v9, v5, v11, v12, v13}, Ll/enr0;-><init>(IJI)V

    .line 385
    .line 386
    .line 387
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    :goto_8
    add-int/lit8 v1, v1, 0x1

    .line 391
    .line 392
    const/16 v8, 0x8

    .line 393
    .line 394
    const/4 v9, 0x0

    .line 395
    const/16 v11, 0x890

    .line 396
    .line 397
    const/16 v12, 0xb03

    .line 398
    .line 399
    const/16 v13, 0xb00

    .line 400
    .line 401
    const/16 v14, 0xb04

    .line 402
    .line 403
    const/16 v15, 0xb01

    .line 404
    .line 405
    goto :goto_7

    .line 406
    :cond_9
    iget-object v1, v0, Ll/fnr0;->a:Ljava/util/List;

    .line 407
    .line 408
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    if-eqz v1, :cond_a

    .line 413
    .line 414
    const-wide/16 v3, 0x0

    .line 415
    .line 416
    iput-wide v3, v2, Ll/yfr0;->a:J

    .line 417
    .line 418
    goto :goto_6

    .line 419
    :cond_a
    iput v10, v0, Ll/fnr0;->b:I

    .line 420
    .line 421
    iget-object v0, v0, Ll/fnr0;->a:Ljava/util/List;

    .line 422
    .line 423
    const/4 v3, 0x0

    .line 424
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    check-cast v0, Ll/enr0;

    .line 429
    .line 430
    iget-wide v0, v0, Ll/enr0;->a:J

    .line 431
    .line 432
    iput-wide v0, v2, Ll/yfr0;->a:J

    .line 433
    .line 434
    goto :goto_6

    .line 435
    :cond_b
    move v3, v9

    .line 436
    new-instance v4, Ll/bgw0;

    .line 437
    .line 438
    const/16 v5, 0x8

    .line 439
    .line 440
    invoke-direct {v4, v5}, Ll/bgw0;-><init>(I)V

    .line 441
    .line 442
    .line 443
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 444
    .line 445
    .line 446
    move-result-object v6

    .line 447
    invoke-interface {v1, v6, v3, v5}, Ll/qer0;->h([BII)V

    .line 448
    .line 449
    .line 450
    invoke-virtual {v4}, Ll/bgw0;->x()I

    .line 451
    .line 452
    .line 453
    move-result v3

    .line 454
    add-int/2addr v3, v5

    .line 455
    iput v3, v0, Ll/fnr0;->c:I

    .line 456
    .line 457
    invoke-virtual {v4}, Ll/bgw0;->v()I

    .line 458
    .line 459
    .line 460
    move-result v3

    .line 461
    const v4, 0x53454654

    .line 462
    .line 463
    .line 464
    if-eq v3, v4, :cond_c

    .line 465
    .line 466
    const-wide/16 v3, 0x0

    .line 467
    .line 468
    iput-wide v3, v2, Ll/yfr0;->a:J

    .line 469
    .line 470
    goto/16 :goto_6

    .line 471
    .line 472
    :cond_c
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 473
    .line 474
    .line 475
    move-result-wide v3

    .line 476
    iget v1, v0, Ll/fnr0;->c:I

    .line 477
    .line 478
    add-int/lit8 v1, v1, -0xc

    .line 479
    .line 480
    int-to-long v5, v1

    .line 481
    sub-long/2addr v3, v5

    .line 482
    iput-wide v3, v2, Ll/yfr0;->a:J

    .line 483
    .line 484
    const/4 v5, 0x2

    .line 485
    iput v5, v0, Ll/fnr0;->b:I

    .line 486
    .line 487
    goto/16 :goto_6

    .line 488
    .line 489
    :cond_d
    const-wide/16 v3, 0x0

    .line 490
    .line 491
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 492
    .line 493
    .line 494
    move-result-wide v5

    .line 495
    const-wide/16 v7, -0x1

    .line 496
    .line 497
    cmp-long v1, v5, v7

    .line 498
    .line 499
    if-eqz v1, :cond_e

    .line 500
    .line 501
    const-wide/16 v7, 0x8

    .line 502
    .line 503
    cmp-long v1, v5, v7

    .line 504
    .line 505
    if-gez v1, :cond_f

    .line 506
    .line 507
    :cond_e
    move-wide v4, v3

    .line 508
    goto :goto_9

    .line 509
    :cond_f
    const-wide/16 v3, -0x8

    .line 510
    .line 511
    add-long v4, v5, v3

    .line 512
    .line 513
    :goto_9
    iput-wide v4, v2, Ll/yfr0;->a:J

    .line 514
    .line 515
    const/4 v8, 0x1

    .line 516
    iput v8, v0, Ll/fnr0;->b:I

    .line 517
    .line 518
    :goto_a
    return v8

    .line 519
    :sswitch_data_0
    .sparse-switch
        -0x6604662e -> :sswitch_4
        -0x4f6659e5 -> :sswitch_3
        -0x4a96a712 -> :sswitch_2
        -0x3182f331 -> :sswitch_1
        0x68f2d704 -> :sswitch_0
    .end sparse-switch
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fnr0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/fnr0;->b:I

    .line 8
    .line 9
    return-void
.end method

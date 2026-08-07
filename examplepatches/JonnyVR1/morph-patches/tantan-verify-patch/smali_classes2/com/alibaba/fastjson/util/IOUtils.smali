.class public Lcom/alibaba/fastjson/util/IOUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ASCII_CHARS:[C

.field public static final CA:[C

.field public static final DEFAULT_PROPERTIES:Ljava/util/Properties;

.field public static final DIGITS:[C

.field static final DigitOnes:[C

.field static final DigitTens:[C

.field public static final FASTJSON_COMPATIBLEWITHFIELDNAME:Ljava/lang/String; = "fastjson.compatibleWithFieldName"

.field public static final FASTJSON_COMPATIBLEWITHJAVABEAN:Ljava/lang/String; = "fastjson.compatibleWithJavaBean"

.field public static final FASTJSON_PROPERTIES:Ljava/lang/String; = "fastjson.properties"

.field public static final IA:[I

.field public static final UTF8:Ljava/nio/charset/Charset;

.field static final digits:[C

.field public static final firstIdentifierFlags:[Z

.field public static final identifierFlags:[Z

.field public static final replaceChars:[C

.field static final sizeTable:[I

.field public static final specicalFlags_doubleQuotes:[B

.field public static final specicalFlags_doubleQuotesFlags:[Z

.field public static final specicalFlags_singleQuotes:[B

.field public static final specicalFlags_singleQuotesFlags:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    new-instance v0, Ljava/util/Properties;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/util/IOUtils;->DEFAULT_PROPERTIES:Ljava/util/Properties;

    .line 7
    .line 8
    const-string v0, "UTF-8"

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    .line 15
    .line 16
    const/16 v0, 0x10

    .line 17
    .line 18
    new-array v0, v0, [C

    .line 19
    .line 20
    fill-array-data v0, :array_0

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    .line 24
    .line 25
    const/16 v0, 0x100

    .line 26
    .line 27
    new-array v1, v0, [Z

    .line 28
    .line 29
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    .line 30
    .line 31
    new-array v1, v0, [Z

    .line 32
    .line 33
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    move v2, v1

    .line 37
    :goto_0
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    .line 38
    .line 39
    array-length v4, v3

    .line 40
    const/16 v5, 0x5f

    .line 41
    .line 42
    const/16 v6, 0x7a

    .line 43
    .line 44
    const/16 v7, 0x61

    .line 45
    .line 46
    const/16 v8, 0x5a

    .line 47
    .line 48
    const/16 v9, 0x41

    .line 49
    .line 50
    const/4 v10, 0x1

    .line 51
    if-ge v2, v4, :cond_4

    .line 52
    .line 53
    if-lt v2, v9, :cond_0

    .line 54
    .line 55
    if-gt v2, v8, :cond_0

    .line 56
    .line 57
    aput-boolean v10, v3, v2

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    if-lt v2, v7, :cond_1

    .line 61
    .line 62
    if-gt v2, v6, :cond_1

    .line 63
    .line 64
    aput-boolean v10, v3, v2

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    if-eq v2, v5, :cond_2

    .line 68
    .line 69
    const/16 v4, 0x24

    .line 70
    .line 71
    if-ne v2, v4, :cond_3

    .line 72
    .line 73
    :cond_2
    aput-boolean v10, v3, v2

    .line 74
    .line 75
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 76
    .line 77
    int-to-char v2, v2

    .line 78
    goto :goto_0

    .line 79
    :cond_4
    move v2, v1

    .line 80
    :goto_2
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    .line 81
    .line 82
    array-length v4, v3

    .line 83
    const/16 v11, 0x30

    .line 84
    .line 85
    if-ge v2, v4, :cond_9

    .line 86
    .line 87
    if-lt v2, v9, :cond_5

    .line 88
    .line 89
    if-gt v2, v8, :cond_5

    .line 90
    .line 91
    aput-boolean v10, v3, v2

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_5
    if-lt v2, v7, :cond_6

    .line 95
    .line 96
    if-gt v2, v6, :cond_6

    .line 97
    .line 98
    aput-boolean v10, v3, v2

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_6
    if-ne v2, v5, :cond_7

    .line 102
    .line 103
    aput-boolean v10, v3, v2

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_7
    if-lt v2, v11, :cond_8

    .line 107
    .line 108
    const/16 v4, 0x39

    .line 109
    .line 110
    if-gt v2, v4, :cond_8

    .line 111
    .line 112
    aput-boolean v10, v3, v2

    .line 113
    .line 114
    :cond_8
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 115
    .line 116
    int-to-char v2, v2

    .line 117
    goto :goto_2

    .line 118
    :cond_9
    :try_start_0
    invoke-static {}, Lcom/alibaba/fastjson/util/IOUtils;->loadPropertiesFromFile()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    .line 120
    .line 121
    :catchall_0
    const/16 v2, 0xa1

    .line 122
    .line 123
    new-array v3, v2, [B

    .line 124
    .line 125
    sput-object v3, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 126
    .line 127
    new-array v4, v2, [B

    .line 128
    .line 129
    sput-object v4, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 130
    .line 131
    new-array v5, v2, [Z

    .line 132
    .line 133
    sput-object v5, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotesFlags:[Z

    .line 134
    .line 135
    new-array v5, v2, [Z

    .line 136
    .line 137
    sput-object v5, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotesFlags:[Z

    .line 138
    .line 139
    const/16 v5, 0x5d

    .line 140
    .line 141
    new-array v5, v5, [C

    .line 142
    .line 143
    sput-object v5, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 144
    .line 145
    const/4 v5, 0x4

    .line 146
    aput-byte v5, v3, v1

    .line 147
    .line 148
    aput-byte v5, v3, v10

    .line 149
    .line 150
    const/4 v6, 0x2

    .line 151
    aput-byte v5, v3, v6

    .line 152
    .line 153
    const/4 v7, 0x3

    .line 154
    aput-byte v5, v3, v7

    .line 155
    .line 156
    aput-byte v5, v3, v5

    .line 157
    .line 158
    const/4 v8, 0x5

    .line 159
    aput-byte v5, v3, v8

    .line 160
    .line 161
    const/4 v9, 0x6

    .line 162
    aput-byte v5, v3, v9

    .line 163
    .line 164
    const/4 v12, 0x7

    .line 165
    aput-byte v5, v3, v12

    .line 166
    .line 167
    const/16 v13, 0x8

    .line 168
    .line 169
    aput-byte v10, v3, v13

    .line 170
    .line 171
    const/16 v14, 0x9

    .line 172
    .line 173
    aput-byte v10, v3, v14

    .line 174
    .line 175
    const/16 v15, 0xa

    .line 176
    .line 177
    aput-byte v10, v3, v15

    .line 178
    .line 179
    const/16 v16, 0xb

    .line 180
    .line 181
    aput-byte v5, v3, v16

    .line 182
    .line 183
    const/16 v17, 0xc

    .line 184
    .line 185
    aput-byte v10, v3, v17

    .line 186
    .line 187
    const/16 v18, 0xd

    .line 188
    .line 189
    aput-byte v10, v3, v18

    .line 190
    .line 191
    const/16 v19, 0x22

    .line 192
    .line 193
    aput-byte v10, v3, v19

    .line 194
    .line 195
    const/16 v20, 0x5c

    .line 196
    .line 197
    aput-byte v10, v3, v20

    .line 198
    .line 199
    aput-byte v5, v4, v1

    .line 200
    .line 201
    aput-byte v5, v4, v10

    .line 202
    .line 203
    aput-byte v5, v4, v6

    .line 204
    .line 205
    aput-byte v5, v4, v7

    .line 206
    .line 207
    aput-byte v5, v4, v5

    .line 208
    .line 209
    aput-byte v5, v4, v8

    .line 210
    .line 211
    aput-byte v5, v4, v9

    .line 212
    .line 213
    aput-byte v5, v4, v12

    .line 214
    .line 215
    aput-byte v10, v4, v13

    .line 216
    .line 217
    aput-byte v10, v4, v14

    .line 218
    .line 219
    aput-byte v10, v4, v15

    .line 220
    .line 221
    aput-byte v5, v4, v16

    .line 222
    .line 223
    aput-byte v10, v4, v17

    .line 224
    .line 225
    aput-byte v10, v4, v18

    .line 226
    .line 227
    aput-byte v10, v4, v20

    .line 228
    .line 229
    const/16 v3, 0x27

    .line 230
    .line 231
    aput-byte v10, v4, v3

    .line 232
    .line 233
    const/16 v4, 0xe

    .line 234
    .line 235
    move/from16 v21, v1

    .line 236
    .line 237
    :goto_4
    const/16 v1, 0x1f

    .line 238
    .line 239
    if-gt v4, v1, :cond_a

    .line 240
    .line 241
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 242
    .line 243
    aput-byte v5, v1, v4

    .line 244
    .line 245
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 246
    .line 247
    aput-byte v5, v1, v4

    .line 248
    .line 249
    add-int/lit8 v4, v4, 0x1

    .line 250
    .line 251
    goto :goto_4

    .line 252
    :cond_a
    const/16 v1, 0x7f

    .line 253
    .line 254
    :goto_5
    const/16 v4, 0xa0

    .line 255
    .line 256
    if-ge v1, v4, :cond_b

    .line 257
    .line 258
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 259
    .line 260
    aput-byte v5, v4, v1

    .line 261
    .line 262
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 263
    .line 264
    aput-byte v5, v4, v1

    .line 265
    .line 266
    add-int/lit8 v1, v1, 0x1

    .line 267
    .line 268
    goto :goto_5

    .line 269
    :cond_b
    move/from16 v1, v21

    .line 270
    .line 271
    :goto_6
    if-ge v1, v2, :cond_e

    .line 272
    .line 273
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotesFlags:[Z

    .line 274
    .line 275
    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    .line 276
    .line 277
    aget-byte v22, v22, v1

    .line 278
    .line 279
    if-eqz v22, :cond_c

    .line 280
    .line 281
    move/from16 v22, v10

    .line 282
    .line 283
    goto :goto_7

    .line 284
    :cond_c
    move/from16 v22, v21

    .line 285
    .line 286
    :goto_7
    aput-boolean v22, v4, v1

    .line 287
    .line 288
    sget-object v4, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotesFlags:[Z

    .line 289
    .line 290
    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 291
    .line 292
    aget-byte v22, v22, v1

    .line 293
    .line 294
    if-eqz v22, :cond_d

    .line 295
    .line 296
    move/from16 v22, v10

    .line 297
    .line 298
    goto :goto_8

    .line 299
    :cond_d
    move/from16 v22, v21

    .line 300
    .line 301
    :goto_8
    aput-boolean v22, v4, v1

    .line 302
    .line 303
    add-int/lit8 v1, v1, 0x1

    .line 304
    .line 305
    goto :goto_6

    .line 306
    :cond_e
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    .line 307
    .line 308
    aput-char v11, v1, v21

    .line 309
    .line 310
    const/16 v2, 0x31

    .line 311
    .line 312
    aput-char v2, v1, v10

    .line 313
    .line 314
    const/16 v2, 0x32

    .line 315
    .line 316
    aput-char v2, v1, v6

    .line 317
    .line 318
    const/16 v2, 0x33

    .line 319
    .line 320
    aput-char v2, v1, v7

    .line 321
    .line 322
    const/16 v2, 0x34

    .line 323
    .line 324
    aput-char v2, v1, v5

    .line 325
    .line 326
    const/16 v2, 0x35

    .line 327
    .line 328
    aput-char v2, v1, v8

    .line 329
    .line 330
    const/16 v2, 0x36

    .line 331
    .line 332
    aput-char v2, v1, v9

    .line 333
    .line 334
    const/16 v2, 0x37

    .line 335
    .line 336
    aput-char v2, v1, v12

    .line 337
    .line 338
    const/16 v2, 0x62

    .line 339
    .line 340
    aput-char v2, v1, v13

    .line 341
    .line 342
    const/16 v2, 0x74

    .line 343
    .line 344
    aput-char v2, v1, v14

    .line 345
    .line 346
    const/16 v2, 0x6e

    .line 347
    .line 348
    aput-char v2, v1, v15

    .line 349
    .line 350
    const/16 v2, 0x76

    .line 351
    .line 352
    aput-char v2, v1, v16

    .line 353
    .line 354
    const/16 v2, 0x66

    .line 355
    .line 356
    aput-char v2, v1, v17

    .line 357
    .line 358
    const/16 v2, 0x72

    .line 359
    .line 360
    aput-char v2, v1, v18

    .line 361
    .line 362
    aput-char v19, v1, v19

    .line 363
    .line 364
    aput-char v3, v1, v3

    .line 365
    .line 366
    const/16 v2, 0x2f

    .line 367
    .line 368
    const/16 v3, 0x2f

    .line 369
    .line 370
    aput-char v3, v1, v2

    .line 371
    .line 372
    aput-char v20, v1, v20

    .line 373
    .line 374
    const/16 v1, 0x60

    .line 375
    .line 376
    new-array v1, v1, [C

    .line 377
    .line 378
    fill-array-data v1, :array_1

    .line 379
    .line 380
    .line 381
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    .line 382
    .line 383
    const/16 v1, 0x24

    .line 384
    .line 385
    new-array v1, v1, [C

    .line 386
    .line 387
    fill-array-data v1, :array_2

    .line 388
    .line 389
    .line 390
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    .line 391
    .line 392
    const/16 v1, 0x64

    .line 393
    .line 394
    new-array v2, v1, [C

    .line 395
    .line 396
    fill-array-data v2, :array_3

    .line 397
    .line 398
    .line 399
    sput-object v2, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    .line 400
    .line 401
    new-array v1, v1, [C

    .line 402
    .line 403
    fill-array-data v1, :array_4

    .line 404
    .line 405
    .line 406
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    .line 407
    .line 408
    new-array v1, v15, [I

    .line 409
    .line 410
    fill-array-data v1, :array_5

    .line 411
    .line 412
    .line 413
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->sizeTable:[I

    .line 414
    .line 415
    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    .line 416
    .line 417
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    sput-object v1, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    .line 422
    .line 423
    new-array v0, v0, [I

    .line 424
    .line 425
    sput-object v0, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 426
    .line 427
    const/4 v2, -0x1

    .line 428
    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 429
    .line 430
    .line 431
    array-length v0, v1

    .line 432
    move/from16 v1, v21

    .line 433
    .line 434
    :goto_9
    if-ge v1, v0, :cond_f

    .line 435
    .line 436
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 437
    .line 438
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    .line 439
    .line 440
    aget-char v3, v3, v1

    .line 441
    .line 442
    aput v1, v2, v3

    .line 443
    .line 444
    add-int/lit8 v1, v1, 0x1

    .line 445
    .line 446
    goto :goto_9

    .line 447
    :cond_f
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 448
    .line 449
    const/16 v1, 0x3d

    .line 450
    .line 451
    aput v21, v0, v1

    .line 452
    .line 453
    return-void

    .line 454
    nop

    .line 455
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data

    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
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
    :array_1
    .array-data 2
        0x30s
        0x30s
        0x30s
        0x31s
        0x30s
        0x32s
        0x30s
        0x33s
        0x30s
        0x34s
        0x30s
        0x35s
        0x30s
        0x36s
        0x30s
        0x37s
        0x30s
        0x38s
        0x30s
        0x39s
        0x30s
        0x41s
        0x30s
        0x42s
        0x30s
        0x43s
        0x30s
        0x44s
        0x30s
        0x45s
        0x30s
        0x46s
        0x31s
        0x30s
        0x31s
        0x31s
        0x31s
        0x32s
        0x31s
        0x33s
        0x31s
        0x34s
        0x31s
        0x35s
        0x31s
        0x36s
        0x31s
        0x37s
        0x31s
        0x38s
        0x31s
        0x39s
        0x31s
        0x41s
        0x31s
        0x42s
        0x31s
        0x43s
        0x31s
        0x44s
        0x31s
        0x45s
        0x31s
        0x46s
        0x32s
        0x30s
        0x32s
        0x31s
        0x32s
        0x32s
        0x32s
        0x33s
        0x32s
        0x34s
        0x32s
        0x35s
        0x32s
        0x36s
        0x32s
        0x37s
        0x32s
        0x38s
        0x32s
        0x39s
        0x32s
        0x41s
        0x32s
        0x42s
        0x32s
        0x43s
        0x32s
        0x44s
        0x32s
        0x45s
        0x32s
        0x46s
    .end array-data

    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    :array_2
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
    .end array-data

    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    :array_3
    .array-data 2
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x30s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x31s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x32s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x33s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x34s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x35s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x36s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x37s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x38s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
        0x39s
    .end array-data

    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    :array_4
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
    .end array-data

    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
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
    :array_5
    .array-data 4
        0x9
        0x63
        0x3e7
        0x270f
        0x1869f
        0xf423f
        0x98967f
        0x5f5e0ff
        0x3b9ac9ff
        0x7fffffff
    .end array-data
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

.method public static close(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    :cond_0
    return-void
.end method

.method public static decode(Ljava/nio/charset/CharsetDecoder;Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0, p2}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/nio/charset/CoderResult;->throwException()V
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void

    .line 29
    :catch_0
    move-exception p0

    .line 30
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "utf8 decode error, "

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-direct {p1, p2, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    throw p1
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-array v0, v2, [B

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    add-int/lit8 v3, v1, -0x1

    .line 14
    .line 15
    move v4, v2

    .line 16
    :goto_0
    if-ge v4, v3, :cond_1

    .line 17
    .line 18
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 19
    .line 20
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    and-int/lit16 v6, v6, 0xff

    .line 25
    .line 26
    aget v5, v5, v6

    .line 27
    .line 28
    if-gez v5, :cond_1

    .line 29
    .line 30
    add-int/lit8 v4, v4, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    :goto_1
    if-lez v3, :cond_2

    .line 34
    .line 35
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    and-int/lit16 v6, v6, 0xff

    .line 42
    .line 43
    aget v5, v5, v6

    .line 44
    .line 45
    if-gez v5, :cond_2

    .line 46
    .line 47
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    const/16 v6, 0x3d

    .line 55
    .line 56
    const/4 v7, 0x1

    .line 57
    if-ne v5, v6, :cond_4

    .line 58
    .line 59
    add-int/lit8 v5, v3, -0x1

    .line 60
    .line 61
    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    if-ne v5, v6, :cond_3

    .line 66
    .line 67
    const/4 v5, 0x2

    .line 68
    goto :goto_2

    .line 69
    :cond_3
    move v5, v7

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    move v5, v2

    .line 72
    :goto_2
    sub-int v6, v3, v4

    .line 73
    .line 74
    add-int/2addr v6, v7

    .line 75
    const/16 v8, 0x4c

    .line 76
    .line 77
    if-le v1, v8, :cond_6

    .line 78
    .line 79
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    const/16 v8, 0xd

    .line 84
    .line 85
    if-ne v1, v8, :cond_5

    .line 86
    .line 87
    div-int/lit8 v1, v6, 0x4e

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_5
    move v1, v2

    .line 91
    :goto_3
    shl-int/2addr v1, v7

    .line 92
    goto :goto_4

    .line 93
    :cond_6
    move v1, v2

    .line 94
    :goto_4
    sub-int/2addr v6, v1

    .line 95
    mul-int/lit8 v6, v6, 0x6

    .line 96
    .line 97
    shr-int/lit8 v6, v6, 0x3

    .line 98
    .line 99
    sub-int/2addr v6, v5

    .line 100
    new-array v8, v6, [B

    .line 101
    .line 102
    div-int/lit8 v9, v6, 0x3

    .line 103
    .line 104
    mul-int/lit8 v9, v9, 0x3

    .line 105
    .line 106
    move v10, v2

    .line 107
    move v11, v10

    .line 108
    :goto_5
    if-ge v10, v9, :cond_8

    .line 109
    .line 110
    sget-object v12, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 111
    .line 112
    add-int/lit8 v13, v4, 0x1

    .line 113
    .line 114
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 115
    .line 116
    .line 117
    move-result v14

    .line 118
    aget v14, v12, v14

    .line 119
    .line 120
    shl-int/lit8 v14, v14, 0x12

    .line 121
    .line 122
    add-int/lit8 v15, v4, 0x2

    .line 123
    .line 124
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v13

    .line 128
    aget v13, v12, v13

    .line 129
    .line 130
    shl-int/lit8 v13, v13, 0xc

    .line 131
    .line 132
    or-int/2addr v13, v14

    .line 133
    add-int/lit8 v14, v4, 0x3

    .line 134
    .line 135
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v15

    .line 139
    aget v15, v12, v15

    .line 140
    .line 141
    shl-int/lit8 v15, v15, 0x6

    .line 142
    .line 143
    or-int/2addr v13, v15

    .line 144
    add-int/lit8 v15, v4, 0x4

    .line 145
    .line 146
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    .line 147
    .line 148
    .line 149
    move-result v14

    .line 150
    aget v12, v12, v14

    .line 151
    .line 152
    or-int/2addr v12, v13

    .line 153
    add-int/lit8 v13, v10, 0x1

    .line 154
    .line 155
    shr-int/lit8 v14, v12, 0x10

    .line 156
    .line 157
    int-to-byte v14, v14

    .line 158
    aput-byte v14, v8, v10

    .line 159
    .line 160
    add-int/lit8 v14, v10, 0x2

    .line 161
    .line 162
    shr-int/lit8 v2, v12, 0x8

    .line 163
    .line 164
    int-to-byte v2, v2

    .line 165
    aput-byte v2, v8, v13

    .line 166
    .line 167
    add-int/lit8 v10, v10, 0x3

    .line 168
    .line 169
    int-to-byte v2, v12

    .line 170
    aput-byte v2, v8, v14

    .line 171
    .line 172
    if-lez v1, :cond_7

    .line 173
    .line 174
    add-int/lit8 v11, v11, 0x1

    .line 175
    .line 176
    const/16 v2, 0x13

    .line 177
    .line 178
    if-ne v11, v2, :cond_7

    .line 179
    .line 180
    add-int/lit8 v4, v4, 0x6

    .line 181
    .line 182
    const/4 v11, 0x0

    .line 183
    goto :goto_6

    .line 184
    :cond_7
    move v4, v15

    .line 185
    :goto_6
    const/4 v2, 0x0

    .line 186
    goto :goto_5

    .line 187
    :cond_8
    if-ge v10, v6, :cond_a

    .line 188
    .line 189
    const/4 v2, 0x0

    .line 190
    const/16 v16, 0x0

    .line 191
    .line 192
    :goto_7
    sub-int v1, v3, v5

    .line 193
    .line 194
    if-gt v4, v1, :cond_9

    .line 195
    .line 196
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    .line 197
    .line 198
    add-int/lit8 v9, v4, 0x1

    .line 199
    .line 200
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    .line 201
    .line 202
    .line 203
    move-result v4

    .line 204
    aget v1, v1, v4

    .line 205
    .line 206
    mul-int/lit8 v4, v16, 0x6

    .line 207
    .line 208
    rsub-int/lit8 v4, v4, 0x12

    .line 209
    .line 210
    shl-int/2addr v1, v4

    .line 211
    or-int/2addr v2, v1

    .line 212
    add-int/lit8 v16, v16, 0x1

    .line 213
    .line 214
    move v4, v9

    .line 215
    goto :goto_7

    .line 216
    :cond_9
    const/16 v0, 0x10

    .line 217
    .line 218
    :goto_8
    if-ge v10, v6, :cond_a

    .line 219
    .line 220
    add-int/lit8 v1, v10, 0x1

    .line 221
    .line 222
    shr-int v3, v2, v0

    .line 223
    .line 224
    int-to-byte v3, v3

    .line 225
    aput-byte v3, v8, v10

    .line 226
    .line 227
    add-int/lit8 v0, v0, -0x8

    .line 228
    .line 229
    move v10, v1

    .line 230
    goto :goto_8

    .line 231
    :cond_a
    return-object v8
.end method

.method public static decodeBase64(Ljava/lang/String;II)[B
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p2

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 232
    new-array v0, v2, [B

    return-object v0

    :cond_0
    add-int v3, p1, v1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    move/from16 v5, p1

    :goto_0
    if-ge v5, v3, :cond_1

    .line 233
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aget v6, v6, v7

    if-gez v6, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-lez v3, :cond_2

    .line 234
    sget-object v6, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aget v6, v6, v7

    if-gez v6, :cond_2

    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 235
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3d

    if-ne v6, v7, :cond_4

    add-int/lit8 v6, v3, -0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v7, :cond_3

    const/4 v6, 0x2

    goto :goto_2

    :cond_3
    move v6, v4

    goto :goto_2

    :cond_4
    move v6, v2

    :goto_2
    sub-int v7, v3, v5

    add-int/2addr v7, v4

    const/16 v8, 0x4c

    if-le v1, v8, :cond_6

    .line 236
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v8, 0xd

    if-ne v1, v8, :cond_5

    div-int/lit8 v1, v7, 0x4e

    goto :goto_3

    :cond_5
    move v1, v2

    :goto_3
    shl-int/2addr v1, v4

    goto :goto_4

    :cond_6
    move v1, v2

    :goto_4
    sub-int/2addr v7, v1

    mul-int/lit8 v7, v7, 0x6

    shr-int/lit8 v7, v7, 0x3

    sub-int/2addr v7, v6

    .line 237
    new-array v8, v7, [B

    .line 238
    div-int/lit8 v9, v7, 0x3

    mul-int/lit8 v9, v9, 0x3

    move v10, v2

    move v11, v10

    :goto_5
    if-ge v10, v9, :cond_8

    .line 239
    sget-object v12, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v13, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v14

    aget v14, v12, v14

    shl-int/lit8 v14, v14, 0x12

    add-int/lit8 v15, v5, 0x2

    .line 240
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    aget v13, v12, v13

    shl-int/lit8 v13, v13, 0xc

    or-int/2addr v13, v14

    add-int/lit8 v14, v5, 0x3

    .line 241
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    aget v15, v12, v15

    shl-int/lit8 v15, v15, 0x6

    or-int/2addr v13, v15

    add-int/lit8 v15, v5, 0x4

    .line 242
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    aget v12, v12, v14

    or-int/2addr v12, v13

    add-int/lit8 v13, v10, 0x1

    shr-int/lit8 v14, v12, 0x10

    int-to-byte v14, v14

    .line 243
    aput-byte v14, v8, v10

    add-int/lit8 v14, v10, 0x2

    shr-int/lit8 v2, v12, 0x8

    int-to-byte v2, v2

    .line 244
    aput-byte v2, v8, v13

    add-int/lit8 v10, v10, 0x3

    int-to-byte v2, v12

    .line 245
    aput-byte v2, v8, v14

    if-lez v1, :cond_7

    add-int/lit8 v11, v11, 0x1

    const/16 v2, 0x13

    if-ne v11, v2, :cond_7

    add-int/lit8 v5, v5, 0x6

    const/4 v11, 0x0

    goto :goto_6

    :cond_7
    move v5, v15

    :goto_6
    const/4 v2, 0x0

    goto :goto_5

    :cond_8
    if-ge v10, v7, :cond_a

    const/4 v2, 0x0

    const/16 v16, 0x0

    :goto_7
    sub-int v1, v3, v6

    if-gt v5, v1, :cond_9

    .line 246
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v9, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aget v1, v1, v5

    mul-int/lit8 v5, v16, 0x6

    rsub-int/lit8 v5, v5, 0x12

    shl-int/2addr v1, v5

    or-int/2addr v2, v1

    add-int/lit8 v16, v16, 0x1

    move v5, v9

    goto :goto_7

    :cond_9
    const/16 v0, 0x10

    :goto_8
    if-ge v10, v7, :cond_a

    add-int/lit8 v1, v10, 0x1

    shr-int v3, v2, v0

    int-to-byte v3, v3

    .line 247
    aput-byte v3, v8, v10

    add-int/lit8 v0, v0, -0x8

    move v10, v1

    goto :goto_8

    :cond_a
    return-object v8
.end method

.method public static decodeBase64([CII)[B
    .locals 16

    move/from16 v0, p2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 248
    new-array v0, v1, [B

    return-object v0

    :cond_0
    add-int v2, p1, v0

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    move/from16 v4, p1

    :goto_0
    if-ge v4, v2, :cond_1

    .line 249
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    aget-char v6, p0, v4

    aget v5, v5, v6

    if-gez v5, :cond_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-lez v2, :cond_2

    .line 250
    sget-object v5, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    aget-char v6, p0, v2

    aget v5, v5, v6

    if-gez v5, :cond_2

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 251
    :cond_2
    aget-char v5, p0, v2

    const/16 v6, 0x3d

    if-ne v5, v6, :cond_4

    add-int/lit8 v5, v2, -0x1

    aget-char v5, p0, v5

    if-ne v5, v6, :cond_3

    const/4 v5, 0x2

    goto :goto_2

    :cond_3
    move v5, v3

    goto :goto_2

    :cond_4
    move v5, v1

    :goto_2
    sub-int v6, v2, v4

    add-int/2addr v6, v3

    const/16 v7, 0x4c

    if-le v0, v7, :cond_6

    .line 252
    aget-char v0, p0, v7

    const/16 v7, 0xd

    if-ne v0, v7, :cond_5

    div-int/lit8 v0, v6, 0x4e

    goto :goto_3

    :cond_5
    move v0, v1

    :goto_3
    shl-int/2addr v0, v3

    goto :goto_4

    :cond_6
    move v0, v1

    :goto_4
    sub-int/2addr v6, v0

    mul-int/lit8 v6, v6, 0x6

    shr-int/lit8 v6, v6, 0x3

    sub-int/2addr v6, v5

    .line 253
    new-array v7, v6, [B

    .line 254
    div-int/lit8 v8, v6, 0x3

    mul-int/lit8 v8, v8, 0x3

    move v9, v1

    move v10, v9

    :goto_5
    if-ge v9, v8, :cond_8

    .line 255
    sget-object v11, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v12, v4, 0x1

    aget-char v13, p0, v4

    aget v13, v11, v13

    shl-int/lit8 v13, v13, 0x12

    add-int/lit8 v14, v4, 0x2

    aget-char v12, p0, v12

    aget v12, v11, v12

    shl-int/lit8 v12, v12, 0xc

    or-int/2addr v12, v13

    add-int/lit8 v13, v4, 0x3

    aget-char v14, p0, v14

    aget v14, v11, v14

    shl-int/lit8 v14, v14, 0x6

    or-int/2addr v12, v14

    add-int/lit8 v14, v4, 0x4

    aget-char v13, p0, v13

    aget v11, v11, v13

    or-int/2addr v11, v12

    add-int/lit8 v12, v9, 0x1

    shr-int/lit8 v13, v11, 0x10

    int-to-byte v13, v13

    .line 256
    aput-byte v13, v7, v9

    add-int/lit8 v13, v9, 0x2

    shr-int/lit8 v15, v11, 0x8

    int-to-byte v15, v15

    .line 257
    aput-byte v15, v7, v12

    add-int/lit8 v9, v9, 0x3

    int-to-byte v11, v11

    .line 258
    aput-byte v11, v7, v13

    if-lez v0, :cond_7

    add-int/lit8 v10, v10, 0x1

    const/16 v11, 0x13

    if-ne v10, v11, :cond_7

    add-int/lit8 v4, v4, 0x6

    move v10, v1

    goto :goto_5

    :cond_7
    move v4, v14

    goto :goto_5

    :cond_8
    if-ge v9, v6, :cond_a

    move v0, v1

    :goto_6
    sub-int v8, v2, v5

    if-gt v4, v8, :cond_9

    .line 259
    sget-object v8, Lcom/alibaba/fastjson/util/IOUtils;->IA:[I

    add-int/lit8 v10, v4, 0x1

    aget-char v4, p0, v4

    aget v4, v8, v4

    mul-int/lit8 v8, v0, 0x6

    rsub-int/lit8 v8, v8, 0x12

    shl-int/2addr v4, v8

    or-int/2addr v1, v4

    add-int/2addr v0, v3

    move v4, v10

    goto :goto_6

    :cond_9
    const/16 v0, 0x10

    :goto_7
    if-ge v9, v6, :cond_a

    add-int/lit8 v2, v9, 0x1

    shr-int v3, v1, v0

    int-to-byte v3, v3

    .line 260
    aput-byte v3, v7, v9

    add-int/lit8 v0, v0, -0x8

    move v9, v2

    goto :goto_7

    :cond_a
    return-object v7
.end method

.method public static decodeUTF8([BII[C)I
    .locals 8

    .line 1
    add-int v0, p1, p2

    .line 2
    .line 3
    array-length v1, p3

    .line 4
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, p2, :cond_0

    .line 10
    .line 11
    aget-byte v2, p0, p1

    .line 12
    .line 13
    if-ltz v2, :cond_0

    .line 14
    .line 15
    add-int/lit8 v3, v1, 0x1

    .line 16
    .line 17
    add-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    int-to-char v2, v2

    .line 20
    aput-char v2, p3, v1

    .line 21
    .line 22
    move v1, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    :goto_1
    if-ge p1, v0, :cond_c

    .line 25
    .line 26
    add-int/lit8 p2, p1, 0x1

    .line 27
    .line 28
    aget-byte v2, p0, p1

    .line 29
    .line 30
    if-ltz v2, :cond_1

    .line 31
    .line 32
    add-int/lit8 p1, v1, 0x1

    .line 33
    .line 34
    int-to-char v2, v2

    .line 35
    aput-char v2, p3, v1

    .line 36
    .line 37
    move v1, p1

    .line 38
    move p1, p2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    shr-int/lit8 v3, v2, 0x5

    .line 41
    .line 42
    const/4 v4, -0x2

    .line 43
    const/16 v5, 0x80

    .line 44
    .line 45
    const/4 v6, -0x1

    .line 46
    if-ne v3, v4, :cond_4

    .line 47
    .line 48
    and-int/lit8 v3, v2, 0x1e

    .line 49
    .line 50
    if-eqz v3, :cond_4

    .line 51
    .line 52
    if-ge p2, v0, :cond_3

    .line 53
    .line 54
    add-int/lit8 p1, p1, 0x2

    .line 55
    .line 56
    aget-byte p2, p0, p2

    .line 57
    .line 58
    and-int/lit16 v3, p2, 0xc0

    .line 59
    .line 60
    if-eq v3, v5, :cond_2

    .line 61
    .line 62
    return v6

    .line 63
    :cond_2
    add-int/lit8 v3, v1, 0x1

    .line 64
    .line 65
    shl-int/lit8 v2, v2, 0x6

    .line 66
    .line 67
    xor-int/2addr p2, v2

    .line 68
    xor-int/lit16 p2, p2, 0xf80

    .line 69
    .line 70
    int-to-char p2, p2

    .line 71
    aput-char p2, p3, v1

    .line 72
    .line 73
    move v1, v3

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    return v6

    .line 76
    :cond_4
    shr-int/lit8 v3, v2, 0x4

    .line 77
    .line 78
    if-ne v3, v4, :cond_9

    .line 79
    .line 80
    add-int/lit8 v3, p1, 0x2

    .line 81
    .line 82
    if-ge v3, v0, :cond_8

    .line 83
    .line 84
    aget-byte p2, p0, p2

    .line 85
    .line 86
    add-int/lit8 p1, p1, 0x3

    .line 87
    .line 88
    aget-byte v3, p0, v3

    .line 89
    .line 90
    const/16 v4, -0x20

    .line 91
    .line 92
    if-ne v2, v4, :cond_5

    .line 93
    .line 94
    and-int/lit16 v4, p2, 0xe0

    .line 95
    .line 96
    if-eq v4, v5, :cond_8

    .line 97
    .line 98
    :cond_5
    and-int/lit16 v4, p2, 0xc0

    .line 99
    .line 100
    if-ne v4, v5, :cond_8

    .line 101
    .line 102
    and-int/lit16 v4, v3, 0xc0

    .line 103
    .line 104
    if-eq v4, v5, :cond_6

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_6
    shl-int/lit8 v2, v2, 0xc

    .line 108
    .line 109
    shl-int/lit8 p2, p2, 0x6

    .line 110
    .line 111
    xor-int/2addr p2, v2

    .line 112
    const v2, -0x1e080

    .line 113
    .line 114
    .line 115
    xor-int/2addr v2, v3

    .line 116
    xor-int/2addr p2, v2

    .line 117
    int-to-char p2, p2

    .line 118
    const v2, 0xd800

    .line 119
    .line 120
    .line 121
    if-lt p2, v2, :cond_7

    .line 122
    .line 123
    const v2, 0xe000

    .line 124
    .line 125
    .line 126
    if-ge p2, v2, :cond_7

    .line 127
    .line 128
    return v6

    .line 129
    :cond_7
    add-int/lit8 v2, v1, 0x1

    .line 130
    .line 131
    aput-char p2, p3, v1

    .line 132
    .line 133
    move v1, v2

    .line 134
    goto :goto_1

    .line 135
    :cond_8
    :goto_2
    return v6

    .line 136
    :cond_9
    shr-int/lit8 v3, v2, 0x3

    .line 137
    .line 138
    if-ne v3, v4, :cond_b

    .line 139
    .line 140
    add-int/lit8 v3, p1, 0x3

    .line 141
    .line 142
    if-ge v3, v0, :cond_b

    .line 143
    .line 144
    add-int/lit8 v3, p1, 0x2

    .line 145
    .line 146
    aget-byte p2, p0, p2

    .line 147
    .line 148
    add-int/lit8 v4, p1, 0x3

    .line 149
    .line 150
    aget-byte v3, p0, v3

    .line 151
    .line 152
    add-int/lit8 p1, p1, 0x4

    .line 153
    .line 154
    aget-byte v4, p0, v4

    .line 155
    .line 156
    shl-int/lit8 v2, v2, 0x12

    .line 157
    .line 158
    shl-int/lit8 v7, p2, 0xc

    .line 159
    .line 160
    xor-int/2addr v2, v7

    .line 161
    shl-int/lit8 v7, v3, 0x6

    .line 162
    .line 163
    xor-int/2addr v2, v7

    .line 164
    const v7, 0x381f80

    .line 165
    .line 166
    .line 167
    xor-int/2addr v7, v4

    .line 168
    xor-int/2addr v2, v7

    .line 169
    and-int/lit16 p2, p2, 0xc0

    .line 170
    .line 171
    if-ne p2, v5, :cond_b

    .line 172
    .line 173
    and-int/lit16 p2, v3, 0xc0

    .line 174
    .line 175
    if-ne p2, v5, :cond_b

    .line 176
    .line 177
    and-int/lit16 p2, v4, 0xc0

    .line 178
    .line 179
    if-ne p2, v5, :cond_b

    .line 180
    .line 181
    const/high16 p2, 0x10000

    .line 182
    .line 183
    if-lt v2, p2, :cond_b

    .line 184
    .line 185
    const/high16 p2, 0x110000

    .line 186
    .line 187
    if-lt v2, p2, :cond_a

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :cond_a
    add-int/lit8 p2, v1, 0x1

    .line 191
    .line 192
    ushr-int/lit8 v3, v2, 0xa

    .line 193
    .line 194
    const v4, 0xd7c0

    .line 195
    .line 196
    .line 197
    add-int/2addr v3, v4

    .line 198
    int-to-char v3, v3

    .line 199
    aput-char v3, p3, v1

    .line 200
    .line 201
    add-int/lit8 v1, v1, 0x2

    .line 202
    .line 203
    and-int/lit16 v2, v2, 0x3ff

    .line 204
    .line 205
    const v3, 0xdc00

    .line 206
    .line 207
    .line 208
    add-int/2addr v2, v3

    .line 209
    int-to-char v2, v2

    .line 210
    aput-char v2, p3, p2

    .line 211
    .line 212
    goto/16 :goto_1

    .line 213
    .line 214
    :cond_b
    :goto_3
    return v6

    .line 215
    :cond_c
    return v1
.end method

.method public static encodeUTF8([CII[B)I
    .locals 9

    .line 1
    add-int v0, p1, p2

    .line 2
    .line 3
    array-length v1, p3

    .line 4
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    const/16 v2, 0x80

    .line 10
    .line 11
    if-ge v1, p2, :cond_0

    .line 12
    .line 13
    aget-char v3, p0, p1

    .line 14
    .line 15
    if-ge v3, v2, :cond_0

    .line 16
    .line 17
    add-int/lit8 v2, v1, 0x1

    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    int-to-byte v3, v3

    .line 22
    aput-byte v3, p3, v1

    .line 23
    .line 24
    move v1, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    :goto_1
    if-ge p1, v0, :cond_9

    .line 27
    .line 28
    add-int/lit8 p2, p1, 0x1

    .line 29
    .line 30
    aget-char v3, p0, p1

    .line 31
    .line 32
    if-ge v3, v2, :cond_1

    .line 33
    .line 34
    add-int/lit8 p1, v1, 0x1

    .line 35
    .line 36
    int-to-byte v3, v3

    .line 37
    aput-byte v3, p3, v1

    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    const/16 v4, 0x800

    .line 41
    .line 42
    if-ge v3, v4, :cond_2

    .line 43
    .line 44
    add-int/lit8 p1, v1, 0x1

    .line 45
    .line 46
    shr-int/lit8 v4, v3, 0x6

    .line 47
    .line 48
    or-int/lit16 v4, v4, 0xc0

    .line 49
    .line 50
    int-to-byte v4, v4

    .line 51
    aput-byte v4, p3, v1

    .line 52
    .line 53
    add-int/lit8 v1, v1, 0x2

    .line 54
    .line 55
    and-int/lit8 v3, v3, 0x3f

    .line 56
    .line 57
    or-int/2addr v3, v2

    .line 58
    int-to-byte v3, v3

    .line 59
    aput-byte v3, p3, p1

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_2
    const v4, 0xd800

    .line 63
    .line 64
    .line 65
    const/16 v5, 0x3f

    .line 66
    .line 67
    if-lt v3, v4, :cond_8

    .line 68
    .line 69
    const v6, 0xe000

    .line 70
    .line 71
    .line 72
    if-ge v3, v6, :cond_8

    .line 73
    .line 74
    const v7, 0xdc00

    .line 75
    .line 76
    .line 77
    if-lt v3, v4, :cond_5

    .line 78
    .line 79
    if-ge v3, v7, :cond_5

    .line 80
    .line 81
    sub-int v4, v0, p1

    .line 82
    .line 83
    const/4 v8, 0x2

    .line 84
    if-ge v4, v8, :cond_3

    .line 85
    .line 86
    const/4 v3, -0x1

    .line 87
    goto :goto_4

    .line 88
    :cond_3
    add-int/lit8 v4, p1, 0x1

    .line 89
    .line 90
    aget-char v4, p0, v4

    .line 91
    .line 92
    if-lt v4, v7, :cond_4

    .line 93
    .line 94
    if-ge v4, v6, :cond_4

    .line 95
    .line 96
    shl-int/lit8 v3, v3, 0xa

    .line 97
    .line 98
    add-int/2addr v3, v4

    .line 99
    const v4, -0x35fdc00

    .line 100
    .line 101
    .line 102
    add-int/2addr v3, v4

    .line 103
    goto :goto_4

    .line 104
    :cond_4
    add-int/lit8 p1, v1, 0x1

    .line 105
    .line 106
    aput-byte v5, p3, v1

    .line 107
    .line 108
    :goto_2
    move v1, p1

    .line 109
    :goto_3
    move p1, p2

    .line 110
    goto :goto_1

    .line 111
    :cond_5
    if-lt v3, v7, :cond_6

    .line 112
    .line 113
    if-ge v3, v6, :cond_6

    .line 114
    .line 115
    add-int/lit8 p1, v1, 0x1

    .line 116
    .line 117
    aput-byte v5, p3, v1

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_6
    :goto_4
    if-gez v3, :cond_7

    .line 121
    .line 122
    add-int/lit8 p1, v1, 0x1

    .line 123
    .line 124
    aput-byte v5, p3, v1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_7
    add-int/lit8 p2, v1, 0x1

    .line 128
    .line 129
    shr-int/lit8 v4, v3, 0x12

    .line 130
    .line 131
    or-int/lit16 v4, v4, 0xf0

    .line 132
    .line 133
    int-to-byte v4, v4

    .line 134
    aput-byte v4, p3, v1

    .line 135
    .line 136
    add-int/lit8 v4, v1, 0x2

    .line 137
    .line 138
    shr-int/lit8 v6, v3, 0xc

    .line 139
    .line 140
    and-int/2addr v6, v5

    .line 141
    or-int/2addr v6, v2

    .line 142
    int-to-byte v6, v6

    .line 143
    aput-byte v6, p3, p2

    .line 144
    .line 145
    add-int/lit8 p2, v1, 0x3

    .line 146
    .line 147
    shr-int/lit8 v6, v3, 0x6

    .line 148
    .line 149
    and-int/2addr v5, v6

    .line 150
    or-int/2addr v5, v2

    .line 151
    int-to-byte v5, v5

    .line 152
    aput-byte v5, p3, v4

    .line 153
    .line 154
    add-int/lit8 v1, v1, 0x4

    .line 155
    .line 156
    and-int/lit8 v3, v3, 0x3f

    .line 157
    .line 158
    or-int/2addr v3, v2

    .line 159
    int-to-byte v3, v3

    .line 160
    aput-byte v3, p3, p2

    .line 161
    .line 162
    add-int/lit8 p2, p1, 0x2

    .line 163
    .line 164
    move p1, v1

    .line 165
    goto :goto_2

    .line 166
    :cond_8
    add-int/lit8 p1, v1, 0x1

    .line 167
    .line 168
    shr-int/lit8 v4, v3, 0xc

    .line 169
    .line 170
    or-int/lit16 v4, v4, 0xe0

    .line 171
    .line 172
    int-to-byte v4, v4

    .line 173
    aput-byte v4, p3, v1

    .line 174
    .line 175
    add-int/lit8 v4, v1, 0x2

    .line 176
    .line 177
    shr-int/lit8 v6, v3, 0x6

    .line 178
    .line 179
    and-int/2addr v5, v6

    .line 180
    or-int/2addr v5, v2

    .line 181
    int-to-byte v5, v5

    .line 182
    aput-byte v5, p3, p1

    .line 183
    .line 184
    add-int/lit8 v1, v1, 0x3

    .line 185
    .line 186
    and-int/lit8 p1, v3, 0x3f

    .line 187
    .line 188
    or-int/2addr p1, v2

    .line 189
    int-to-byte p1, p1

    .line 190
    aput-byte p1, p3, v4

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_9
    return v1
.end method

.method public static firstIdentifier(C)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifierFlags:[Z

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge p0, v1, :cond_0

    .line 5
    .line 6
    aget-boolean p0, v0, p0

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static getChars(BI[C)V
    .locals 4

    if-gez p0, :cond_0

    neg-int p0, p0

    const/16 v0, 0x2d

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const v1, 0xcccd

    mul-int/2addr v1, p0

    ushr-int/lit8 v1, v1, 0x13

    shl-int/lit8 v2, v1, 0x3

    shl-int/lit8 v3, v1, 0x1

    add-int/2addr v2, v3

    sub-int/2addr p0, v2

    add-int/lit8 v2, p1, -0x1

    .line 125
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    aget-char p0, v3, p0

    aput-char p0, p2, v2

    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    add-int/lit8 p1, p1, -0x2

    .line 126
    aput-char v0, p2, p1

    :cond_1
    return-void

    :cond_2
    move p0, v1

    move p1, v2

    goto :goto_0
.end method

.method public static getChars(II[C)V
    .locals 4

    if-gez p0, :cond_0

    neg-int p0, p0

    const/16 v0, 0x2d

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/high16 v1, 0x10000

    if-lt p0, v1, :cond_1

    .line 120
    div-int/lit8 v1, p0, 0x64

    shl-int/lit8 v2, v1, 0x6

    shl-int/lit8 v3, v1, 0x5

    add-int/2addr v2, v3

    shl-int/lit8 v3, v1, 0x2

    add-int/2addr v2, v3

    sub-int/2addr p0, v2

    add-int/lit8 v2, p1, -0x1

    .line 121
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    aget-char v3, v3, p0

    aput-char v3, p2, v2

    add-int/lit8 p1, p1, -0x2

    .line 122
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    aget-char p0, v2, p0

    aput-char p0, p2, p1

    move p0, v1

    goto :goto_0

    :cond_1
    :goto_1
    const v1, 0xcccd

    mul-int/2addr v1, p0

    ushr-int/lit8 v1, v1, 0x13

    shl-int/lit8 v2, v1, 0x3

    shl-int/lit8 v3, v1, 0x1

    add-int/2addr v2, v3

    sub-int/2addr p0, v2

    add-int/lit8 v2, p1, -0x1

    .line 123
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    aget-char p0, v3, p0

    aput-char p0, p2, v2

    if-nez v1, :cond_3

    if-eqz v0, :cond_2

    add-int/lit8 p1, p1, -0x2

    .line 124
    aput-char v0, p2, p1

    :cond_2
    return-void

    :cond_3
    move p0, v1

    move p1, v2

    goto :goto_1
.end method

.method public static getChars(JI[C)V
    .locals 7

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    neg-long p0, p0

    .line 8
    const/16 v0, 0x2d

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    const-wide/32 v1, 0x7fffffff

    .line 13
    .line 14
    .line 15
    cmp-long v1, p0, v1

    .line 16
    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    const-wide/16 v1, 0x64

    .line 20
    .line 21
    div-long v1, p0, v1

    .line 22
    .line 23
    const/4 v3, 0x6

    .line 24
    shl-long v3, v1, v3

    .line 25
    .line 26
    const/4 v5, 0x5

    .line 27
    shl-long v5, v1, v5

    .line 28
    .line 29
    add-long/2addr v3, v5

    .line 30
    const/4 v5, 0x2

    .line 31
    shl-long v5, v1, v5

    .line 32
    .line 33
    add-long/2addr v3, v5

    .line 34
    sub-long/2addr p0, v3

    .line 35
    long-to-int p0, p0

    .line 36
    add-int/lit8 p1, p2, -0x1

    .line 37
    .line 38
    sget-object v3, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    .line 39
    .line 40
    aget-char v3, v3, p0

    .line 41
    .line 42
    aput-char v3, p3, p1

    .line 43
    .line 44
    add-int/lit8 p2, p2, -0x2

    .line 45
    .line 46
    sget-object p1, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    .line 47
    .line 48
    aget-char p0, p1, p0

    .line 49
    .line 50
    aput-char p0, p3, p2

    .line 51
    .line 52
    move-wide p0, v1

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    long-to-int p0, p0

    .line 55
    :goto_1
    const/high16 p1, 0x10000

    .line 56
    .line 57
    if-lt p0, p1, :cond_2

    .line 58
    .line 59
    div-int/lit8 p1, p0, 0x64

    .line 60
    .line 61
    shl-int/lit8 v1, p1, 0x6

    .line 62
    .line 63
    shl-int/lit8 v2, p1, 0x5

    .line 64
    .line 65
    add-int/2addr v1, v2

    .line 66
    shl-int/lit8 v2, p1, 0x2

    .line 67
    .line 68
    add-int/2addr v1, v2

    .line 69
    sub-int/2addr p0, v1

    .line 70
    add-int/lit8 v1, p2, -0x1

    .line 71
    .line 72
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->DigitOnes:[C

    .line 73
    .line 74
    aget-char v2, v2, p0

    .line 75
    .line 76
    aput-char v2, p3, v1

    .line 77
    .line 78
    add-int/lit8 p2, p2, -0x2

    .line 79
    .line 80
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->DigitTens:[C

    .line 81
    .line 82
    aget-char p0, v1, p0

    .line 83
    .line 84
    aput-char p0, p3, p2

    .line 85
    .line 86
    move p0, p1

    .line 87
    goto :goto_1

    .line 88
    :cond_2
    :goto_2
    const p1, 0xcccd

    .line 89
    .line 90
    .line 91
    mul-int/2addr p1, p0

    .line 92
    ushr-int/lit8 p1, p1, 0x13

    .line 93
    .line 94
    shl-int/lit8 v1, p1, 0x3

    .line 95
    .line 96
    shl-int/lit8 v2, p1, 0x1

    .line 97
    .line 98
    add-int/2addr v1, v2

    .line 99
    sub-int/2addr p0, v1

    .line 100
    add-int/lit8 v1, p2, -0x1

    .line 101
    .line 102
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->digits:[C

    .line 103
    .line 104
    aget-char p0, v2, p0

    .line 105
    .line 106
    aput-char p0, p3, v1

    .line 107
    .line 108
    if-nez p1, :cond_4

    .line 109
    .line 110
    if-eqz v0, :cond_3

    .line 111
    .line 112
    add-int/lit8 p2, p2, -0x2

    .line 113
    .line 114
    aput-char v0, p3, p2

    .line 115
    .line 116
    :cond_3
    return-void

    .line 117
    :cond_4
    move p0, p1

    .line 118
    move p2, v1

    .line 119
    goto :goto_2
.end method

.method public static getStringProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    goto :goto_0

    .line 6
    :catch_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->DEFAULT_PROPERTIES:Ljava/util/Properties;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    return-object v0
.end method

.method public static isIdent(C)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->identifierFlags:[Z

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge p0, v1, :cond_0

    .line 5
    .line 6
    aget-boolean p0, v0, p0

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static isValidJsonpQueryParam(Ljava/lang/String;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    move v2, v0

    .line 16
    :goto_0
    if-ge v2, v1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/16 v4, 0x2e

    .line 23
    .line 24
    if-eq v3, v4, :cond_1

    .line 25
    .line 26
    invoke-static {v3}, Lcom/alibaba/fastjson/util/IOUtils;->isIdent(C)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    return v0

    .line 33
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_3
    :goto_1
    return v0
.end method

.method public static loadPropertiesFromFile()V
    .locals 2

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/util/IOUtils$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/util/IOUtils$1;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/io/InputStream;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_0
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->DEFAULT_PROPERTIES:Ljava/util/Properties;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    :catch_0
    :cond_0
    return-void
.end method

.method public static readAll(Ljava/io/Reader;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x800

    .line 7
    .line 8
    :try_start_0
    new-array v2, v1, [C

    .line 9
    .line 10
    :goto_0
    const/4 v3, 0x0

    .line 11
    invoke-virtual {p0, v2, v3, v1}, Ljava/io/Reader;->read([CII)I

    .line 12
    .line 13
    .line 14
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    if-gez v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    :try_start_1
    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    const-string v0, "read string from reader error"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public static stringSize(I)I
    .locals 2

    const/4 v0, 0x0

    .line 2
    :goto_0
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->sizeTable:[I

    aget v1, v1, v0

    if-gt p0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static stringSize(J)I
    .locals 6

    .line 1
    const-wide/16 v0, 0xa

    const/4 v2, 0x1

    move-wide v3, v0

    :goto_0
    const/16 v5, 0x13

    if-ge v2, v5, :cond_1

    cmp-long v5, p0, v3

    if-gez v5, :cond_0

    return v2

    :cond_0
    mul-long/2addr v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v5
.end method

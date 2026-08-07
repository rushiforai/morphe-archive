.class public Lorg/seamless/util/io/MD5Crypt;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final SALTCHARS:Ljava/lang/String; = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

.field private static final itoa64:Ljava/lang/String; = "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final bytes2u(B)I
    .locals 0

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method private static final clearbits([B)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p0

    .line 4
    if-ge v1, v2, :cond_0

    .line 5
    .line 6
    aput-byte v0, p0, v1

    .line 7
    .line 8
    add-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void
.end method

.method public static final crypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 435
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 436
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 437
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    const/16 v3, 0x8

    if-ge v2, v3, :cond_0

    .line 438
    invoke-virtual {v1}, Ljava/util/Random;->nextFloat()F

    move-result v2

    const/high16 v3, 0x42780000    # 62.0f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    add-int/lit8 v3, v2, 0x1

    .line 439
    const-string v4, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 440
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "$1$"

    invoke-static {p0, v0, v1}, Lorg/seamless/util/io/MD5Crypt;->crypt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final crypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 434
    const-string v0, "$1$"

    invoke-static {p0, p1, v0}, Lorg/seamless/util/io/MD5Crypt;->crypt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final crypt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    const-string v0, "md5"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 9
    .line 10
    .line 11
    move-result-object v3
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    .line 12
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :cond_0
    const/16 v4, 0x24

    .line 27
    .line 28
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    const/4 v6, -0x1

    .line 33
    const/4 v7, 0x0

    .line 34
    if-eq v5, v6, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    const/16 v5, 0x8

    .line 49
    .line 50
    if-le v4, v5, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    :goto_0
    const/16 v6, 0x10

    .line 107
    .line 108
    if-lez v4, :cond_4

    .line 109
    .line 110
    if-le v4, v6, :cond_3

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    move v6, v4

    .line 114
    :goto_1
    invoke-virtual {v2, v3, v7, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 115
    .line 116
    .line 117
    add-int/lit8 v4, v4, -0x10

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    invoke-static {v3}, Lorg/seamless/util/io/MD5Crypt;->clearbits([B)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    :goto_2
    const/4 v8, 0x1

    .line 128
    if-eqz v4, :cond_6

    .line 129
    .line 130
    and-int/lit8 v9, v4, 0x1

    .line 131
    .line 132
    if-eqz v9, :cond_5

    .line 133
    .line 134
    invoke-virtual {v2, v3, v7, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 139
    .line 140
    .line 141
    move-result-object v9

    .line 142
    invoke-virtual {v2, v9, v7, v8}, Ljava/security/MessageDigest;->update([BII)V

    .line 143
    .line 144
    .line 145
    :goto_3
    ushr-int/lit8 v4, v4, 0x1

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_6
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    move v3, v7

    .line 153
    :goto_4
    const/16 v4, 0x3e8

    .line 154
    .line 155
    if-ge v3, v4, :cond_b

    .line 156
    .line 157
    :try_start_1
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 158
    .line 159
    .line 160
    move-result-object v4
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0

    .line 161
    and-int/lit8 v9, v3, 0x1

    .line 162
    .line 163
    if-eqz v9, :cond_7

    .line 164
    .line 165
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 166
    .line 167
    .line 168
    move-result-object v10

    .line 169
    invoke-virtual {v4, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 170
    .line 171
    .line 172
    goto :goto_5

    .line 173
    :cond_7
    invoke-virtual {v4, v2, v7, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 174
    .line 175
    .line 176
    :goto_5
    rem-int/lit8 v10, v3, 0x3

    .line 177
    .line 178
    if-eqz v10, :cond_8

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    invoke-virtual {v4, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 185
    .line 186
    .line 187
    :cond_8
    rem-int/lit8 v10, v3, 0x7

    .line 188
    .line 189
    if-eqz v10, :cond_9

    .line 190
    .line 191
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 192
    .line 193
    .line 194
    move-result-object v10

    .line 195
    invoke-virtual {v4, v10}, Ljava/security/MessageDigest;->update([B)V

    .line 196
    .line 197
    .line 198
    :cond_9
    if-eqz v9, :cond_a

    .line 199
    .line 200
    invoke-virtual {v4, v2, v7, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 201
    .line 202
    .line 203
    goto :goto_6

    .line 204
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v4, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 209
    .line 210
    .line 211
    :goto_6
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    add-int/lit8 v3, v3, 0x1

    .line 216
    .line 217
    goto :goto_4

    .line 218
    :catch_0
    return-object v1

    .line 219
    :cond_b
    new-instance p0, Ljava/lang/StringBuffer;

    .line 220
    .line 221
    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 228
    .line 229
    .line 230
    const-string p1, "$"

    .line 231
    .line 232
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 233
    .line 234
    .line 235
    aget-byte p1, v2, v7

    .line 236
    .line 237
    invoke-static {p1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    shl-int/2addr p1, v6

    .line 242
    const/4 p2, 0x6

    .line 243
    aget-byte p2, v2, p2

    .line 244
    .line 245
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    shl-int/2addr p2, v5

    .line 250
    or-int/2addr p1, p2

    .line 251
    const/16 p2, 0xc

    .line 252
    .line 253
    aget-byte p2, v2, p2

    .line 254
    .line 255
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 256
    .line 257
    .line 258
    move-result p2

    .line 259
    or-int/2addr p1, p2

    .line 260
    int-to-long p1, p1

    .line 261
    const/4 v0, 0x4

    .line 262
    invoke-static {p1, p2, v0}, Lorg/seamless/util/io/MD5Crypt;->to64(JI)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 267
    .line 268
    .line 269
    aget-byte p1, v2, v8

    .line 270
    .line 271
    invoke-static {p1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    shl-int/2addr p1, v6

    .line 276
    const/4 p2, 0x7

    .line 277
    aget-byte p2, v2, p2

    .line 278
    .line 279
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 280
    .line 281
    .line 282
    move-result p2

    .line 283
    shl-int/2addr p2, v5

    .line 284
    or-int/2addr p1, p2

    .line 285
    const/16 p2, 0xd

    .line 286
    .line 287
    aget-byte p2, v2, p2

    .line 288
    .line 289
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 290
    .line 291
    .line 292
    move-result p2

    .line 293
    or-int/2addr p1, p2

    .line 294
    int-to-long p1, p1

    .line 295
    invoke-static {p1, p2, v0}, Lorg/seamless/util/io/MD5Crypt;->to64(JI)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 300
    .line 301
    .line 302
    const/4 p1, 0x2

    .line 303
    aget-byte p2, v2, p1

    .line 304
    .line 305
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 306
    .line 307
    .line 308
    move-result p2

    .line 309
    shl-int/2addr p2, v6

    .line 310
    aget-byte v1, v2, v5

    .line 311
    .line 312
    invoke-static {v1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    shl-int/2addr v1, v5

    .line 317
    or-int/2addr p2, v1

    .line 318
    const/16 v1, 0xe

    .line 319
    .line 320
    aget-byte v1, v2, v1

    .line 321
    .line 322
    invoke-static {v1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    or-int/2addr p2, v1

    .line 327
    int-to-long v3, p2

    .line 328
    invoke-static {v3, v4, v0}, Lorg/seamless/util/io/MD5Crypt;->to64(JI)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 333
    .line 334
    .line 335
    const/4 p2, 0x3

    .line 336
    aget-byte p2, v2, p2

    .line 337
    .line 338
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 339
    .line 340
    .line 341
    move-result p2

    .line 342
    shl-int/2addr p2, v6

    .line 343
    const/16 v1, 0x9

    .line 344
    .line 345
    aget-byte v1, v2, v1

    .line 346
    .line 347
    invoke-static {v1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    shl-int/2addr v1, v5

    .line 352
    or-int/2addr p2, v1

    .line 353
    const/16 v1, 0xf

    .line 354
    .line 355
    aget-byte v1, v2, v1

    .line 356
    .line 357
    invoke-static {v1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    or-int/2addr p2, v1

    .line 362
    int-to-long v3, p2

    .line 363
    invoke-static {v3, v4, v0}, Lorg/seamless/util/io/MD5Crypt;->to64(JI)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p2

    .line 367
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 368
    .line 369
    .line 370
    aget-byte p2, v2, v0

    .line 371
    .line 372
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 373
    .line 374
    .line 375
    move-result p2

    .line 376
    shl-int/2addr p2, v6

    .line 377
    const/16 v1, 0xa

    .line 378
    .line 379
    aget-byte v1, v2, v1

    .line 380
    .line 381
    invoke-static {v1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    shl-int/2addr v1, v5

    .line 386
    or-int/2addr p2, v1

    .line 387
    const/4 v1, 0x5

    .line 388
    aget-byte v1, v2, v1

    .line 389
    .line 390
    invoke-static {v1}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    or-int/2addr p2, v1

    .line 395
    int-to-long v3, p2

    .line 396
    invoke-static {v3, v4, v0}, Lorg/seamless/util/io/MD5Crypt;->to64(JI)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object p2

    .line 400
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 401
    .line 402
    .line 403
    const/16 p2, 0xb

    .line 404
    .line 405
    aget-byte p2, v2, p2

    .line 406
    .line 407
    invoke-static {p2}, Lorg/seamless/util/io/MD5Crypt;->bytes2u(B)I

    .line 408
    .line 409
    .line 410
    move-result p2

    .line 411
    int-to-long v0, p2

    .line 412
    invoke-static {v0, v1, p1}, Lorg/seamless/util/io/MD5Crypt;->to64(JI)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 417
    .line 418
    .line 419
    invoke-static {v2}, Lorg/seamless/util/io/MD5Crypt;->clearbits([B)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    return-object p0

    .line 427
    :catch_1
    move-exception p0

    .line 428
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 429
    .line 430
    invoke-virtual {p1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 431
    .line 432
    .line 433
    return-object v1
.end method

.method public static isEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 87
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    invoke-static {p0, p1}, Lorg/seamless/util/io/MD5Crypt;->isEqual([CLjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isEqual([CLjava/lang/String;)Z
    .locals 6

    .line 1
    const-string v0, "\\$"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x4

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eq v1, v2, :cond_0

    .line 11
    .line 12
    return v3

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([C)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x2

    .line 23
    aget-object p0, v0, p0

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v4, "$"

    .line 28
    .line 29
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 v5, 0x1

    .line 33
    aget-object v0, v0, v5

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v1, p0, v0}, Lorg/seamless/util/io/MD5Crypt;->crypt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    if-eqz p1, :cond_5

    .line 54
    .line 55
    if-nez p0, :cond_1

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_1
    array-length v0, p1

    .line 59
    array-length v1, p0

    .line 60
    if-ne v0, v1, :cond_4

    .line 61
    .line 62
    move v0, v3

    .line 63
    move v1, v5

    .line 64
    :goto_0
    array-length v2, p1

    .line 65
    if-ge v0, v2, :cond_3

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    aget-char v1, p1, v0

    .line 70
    .line 71
    aget-char v2, p0, v0

    .line 72
    .line 73
    if-ne v1, v2, :cond_2

    .line 74
    .line 75
    move v1, v5

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    move v1, v3

    .line 78
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    return v1

    .line 82
    :cond_4
    return v3

    .line 83
    :cond_5
    :goto_2
    if-ne p1, p0, :cond_6

    .line 84
    .line 85
    return v5

    .line 86
    :cond_6
    return v3
.end method

.method private static final to64(JI)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    add-int/lit8 p2, p2, -0x1

    .line 7
    .line 8
    if-ltz p2, :cond_0

    .line 9
    .line 10
    const-wide/16 v1, 0x3f

    .line 11
    .line 12
    and-long/2addr v1, p0

    .line 13
    long-to-int v1, v1

    .line 14
    const-string v2, "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    .line 15
    .line 16
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x6

    .line 24
    ushr-long/2addr p0, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

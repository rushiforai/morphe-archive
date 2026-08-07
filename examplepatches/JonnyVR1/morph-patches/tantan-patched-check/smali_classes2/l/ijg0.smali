.class public final Ll/ijg0;
.super Ll/gjg0;
.source "SourceFile"


# instance fields
.field public a:Ljava/io/InputStream;

.field public b:Ll/kgg0;

.field public c:J

.field public final d:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 1
    new-instance v0, Ll/kgg0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/kgg0;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/gjg0;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v1, v1, [B

    .line 11
    .line 12
    iput-object v1, p0, Ll/ijg0;->d:[B

    .line 13
    .line 14
    iput-object v0, p0, Ll/ijg0;->b:Ll/kgg0;

    .line 15
    .line 16
    iput-object p1, p0, Ll/ijg0;->a:Ljava/io/InputStream;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final available()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijg0;->b:Ll/kgg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/kgg0;->b:Ll/mng0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mng0;->a()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final close()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/ijg0;->b:Ll/kgg0;

    .line 3
    .line 4
    invoke-static {v1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/ijg0;->b:Ll/kgg0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/ijg0;->a:Ljava/io/InputStream;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ijg0;->a:Ljava/io/InputStream;

    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    iget-object v2, p0, Ll/ijg0;->a:Ljava/io/InputStream;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/ijg0;->a:Ljava/io/InputStream;

    .line 28
    .line 29
    :cond_1
    throw v1
.end method

.method public final read()I
    .locals 2

    .line 432
    :cond_0
    iget-object v0, p0, Ll/ijg0;->d:[B

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 433
    iget-object p0, p0, Ll/ijg0;->d:[B

    const/4 v0, 0x0

    aget-byte p0, p0, v0

    and-int/lit16 p0, p0, 0xff

    return p0

    .line 434
    :cond_1
    const-string p0, "Invalid return value from read: "

    invoke-static {v0, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 435
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0

    :cond_2
    return v1
.end method

.method public final read([BII)I
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    iget-object v3, v0, Ll/ijg0;->b:Ll/kgg0;

    .line 10
    .line 11
    if-eqz v3, :cond_16

    .line 12
    .line 13
    :goto_0
    iget-boolean v5, v3, Ll/kgg0;->a:Z

    .line 14
    .line 15
    if-eqz v5, :cond_2

    .line 16
    .line 17
    iget-object v5, v3, Ll/kgg0;->b:Ll/mng0;

    .line 18
    .line 19
    invoke-virtual {v5}, Ll/mng0;->d()Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 v2, -0x1

    .line 27
    goto/16 :goto_7

    .line 28
    .line 29
    :cond_2
    :goto_1
    iget-object v5, v3, Ll/kgg0;->b:Ll/mng0;

    .line 30
    .line 31
    invoke-virtual {v5}, Ll/mng0;->c()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    const/4 v6, 0x1

    .line 36
    if-ne v5, v6, :cond_13

    .line 37
    .line 38
    iget-object v5, v3, Ll/kgg0;->c:Ll/drg0;

    .line 39
    .line 40
    invoke-static {v5, v6}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 41
    .line 42
    .line 43
    move-result-wide v7

    .line 44
    const-wide/16 v9, 0x1

    .line 45
    .line 46
    cmp-long v5, v7, v9

    .line 47
    .line 48
    if-nez v5, :cond_3

    .line 49
    .line 50
    move v5, v6

    .line 51
    goto :goto_2

    .line 52
    :cond_3
    move v5, v2

    .line 53
    :goto_2
    iput-boolean v5, v3, Ll/kgg0;->a:Z

    .line 54
    .line 55
    iget-object v5, v3, Ll/kgg0;->c:Ll/drg0;

    .line 56
    .line 57
    const/4 v7, 0x2

    .line 58
    invoke-static {v5, v7}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 59
    .line 60
    .line 61
    move-result-wide v11

    .line 62
    long-to-int v5, v11

    .line 63
    const/16 v8, 0x10

    .line 64
    .line 65
    if-eqz v5, :cond_11

    .line 66
    .line 67
    const/4 v11, 0x4

    .line 68
    if-eq v5, v6, :cond_10

    .line 69
    .line 70
    if-ne v5, v7, :cond_f

    .line 71
    .line 72
    iget-object v5, v3, Ll/kgg0;->c:Ll/drg0;

    .line 73
    .line 74
    const/4 v12, 0x5

    .line 75
    invoke-static {v5, v12}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 76
    .line 77
    .line 78
    move-result-wide v13

    .line 79
    const-wide/16 v15, 0x101

    .line 80
    .line 81
    add-long/2addr v13, v15

    .line 82
    long-to-int v5, v13

    .line 83
    new-array v5, v5, [I

    .line 84
    .line 85
    iget-object v13, v3, Ll/kgg0;->c:Ll/drg0;

    .line 86
    .line 87
    invoke-static {v13, v12}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 88
    .line 89
    .line 90
    move-result-wide v12

    .line 91
    add-long/2addr v12, v9

    .line 92
    long-to-int v9, v12

    .line 93
    new-array v9, v9, [I

    .line 94
    .line 95
    filled-new-array {v5, v9}, [[I

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    iget-object v9, v3, Ll/kgg0;->c:Ll/drg0;

    .line 100
    .line 101
    aget-object v10, v5, v2

    .line 102
    .line 103
    aget-object v12, v5, v6

    .line 104
    .line 105
    invoke-static {v9, v11}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 106
    .line 107
    .line 108
    move-result-wide v13

    .line 109
    const-wide/16 v15, 0x4

    .line 110
    .line 111
    add-long/2addr v13, v15

    .line 112
    long-to-int v11, v13

    .line 113
    const/16 v13, 0x13

    .line 114
    .line 115
    new-array v13, v13, [I

    .line 116
    .line 117
    move v14, v2

    .line 118
    :goto_3
    const/4 v15, 0x3

    .line 119
    move/from16 v16, v6

    .line 120
    .line 121
    const-string v6, "Truncated Deflate64 Stream"

    .line 122
    .line 123
    const-wide/16 v17, -0x1

    .line 124
    .line 125
    if-ge v14, v11, :cond_5

    .line 126
    .line 127
    sget-object v19, Ll/kgg0;->h:[I

    .line 128
    .line 129
    aget v19, v19, v14

    .line 130
    .line 131
    move-object/from16 v20, v5

    .line 132
    .line 133
    invoke-virtual {v9, v15}, Ll/drg0;->readBits(I)J

    .line 134
    .line 135
    .line 136
    move-result-wide v4

    .line 137
    cmp-long v15, v4, v17

    .line 138
    .line 139
    if-eqz v15, :cond_4

    .line 140
    .line 141
    long-to-int v4, v4

    .line 142
    aput v4, v13, v19

    .line 143
    .line 144
    add-int/lit8 v14, v14, 0x1

    .line 145
    .line 146
    move/from16 v6, v16

    .line 147
    .line 148
    move-object/from16 v5, v20

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_4
    new-instance v0, Ljava/io/EOFException;

    .line 152
    .line 153
    invoke-direct {v0, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    throw v0

    .line 157
    :cond_5
    move-object/from16 v20, v5

    .line 158
    .line 159
    invoke-static {v13}, Ll/kgg0;->e([I)Ll/uqg0;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    array-length v5, v10

    .line 164
    array-length v11, v12

    .line 165
    add-int/2addr v5, v11

    .line 166
    new-array v11, v5, [I

    .line 167
    .line 168
    move v13, v2

    .line 169
    move v14, v13

    .line 170
    const/16 v19, -0x1

    .line 171
    .line 172
    :goto_4
    if-ge v13, v5, :cond_e

    .line 173
    .line 174
    if-lez v14, :cond_6

    .line 175
    .line 176
    add-int/lit8 v21, v13, 0x1

    .line 177
    .line 178
    aput v19, v11, v13

    .line 179
    .line 180
    add-int/lit8 v14, v14, -0x1

    .line 181
    .line 182
    move/from16 v13, v21

    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_6
    invoke-static {v9, v4}, Ll/kgg0;->b(Ll/drg0;Ll/uqg0;)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-ge v2, v8, :cond_7

    .line 190
    .line 191
    add-int/lit8 v19, v13, 0x1

    .line 192
    .line 193
    aput v2, v11, v13

    .line 194
    .line 195
    move/from16 v13, v19

    .line 196
    .line 197
    move/from16 v19, v2

    .line 198
    .line 199
    const/4 v2, 0x0

    .line 200
    goto :goto_4

    .line 201
    :cond_7
    if-ne v2, v8, :cond_9

    .line 202
    .line 203
    invoke-virtual {v9, v7}, Ll/drg0;->readBits(I)J

    .line 204
    .line 205
    .line 206
    move-result-wide v22

    .line 207
    cmp-long v2, v22, v17

    .line 208
    .line 209
    if-eqz v2, :cond_8

    .line 210
    .line 211
    move-wide/from16 v23, v22

    .line 212
    .line 213
    goto :goto_5

    .line 214
    :cond_8
    new-instance v0, Ljava/io/EOFException;

    .line 215
    .line 216
    invoke-direct {v0, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    throw v0

    .line 220
    :cond_9
    const/16 v7, 0x11

    .line 221
    .line 222
    if-ne v2, v7, :cond_c

    .line 223
    .line 224
    invoke-virtual {v9, v15}, Ll/drg0;->readBits(I)J

    .line 225
    .line 226
    .line 227
    move-result-wide v23

    .line 228
    cmp-long v2, v23, v17

    .line 229
    .line 230
    if-eqz v2, :cond_b

    .line 231
    .line 232
    const/16 v19, 0x0

    .line 233
    .line 234
    :goto_5
    const-wide/16 v25, 0x3

    .line 235
    .line 236
    move-object/from16 v27, v9

    .line 237
    .line 238
    add-long v8, v23, v25

    .line 239
    .line 240
    long-to-int v14, v8

    .line 241
    :cond_a
    move-object/from16 v9, v27

    .line 242
    .line 243
    const/4 v2, 0x0

    .line 244
    const/4 v7, 0x2

    .line 245
    const/16 v8, 0x10

    .line 246
    .line 247
    goto :goto_4

    .line 248
    :cond_b
    new-instance v0, Ljava/io/EOFException;

    .line 249
    .line 250
    invoke-direct {v0, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    throw v0

    .line 254
    :cond_c
    move-object/from16 v27, v9

    .line 255
    .line 256
    const/16 v8, 0x12

    .line 257
    .line 258
    if-ne v2, v8, :cond_a

    .line 259
    .line 260
    const/4 v2, 0x7

    .line 261
    move-object/from16 v8, v27

    .line 262
    .line 263
    invoke-virtual {v8, v2}, Ll/drg0;->readBits(I)J

    .line 264
    .line 265
    .line 266
    move-result-wide v23

    .line 267
    cmp-long v2, v23, v17

    .line 268
    .line 269
    if-eqz v2, :cond_d

    .line 270
    .line 271
    const-wide/16 v25, 0xb

    .line 272
    .line 273
    move-object/from16 v27, v8

    .line 274
    .line 275
    add-long v7, v23, v25

    .line 276
    .line 277
    long-to-int v14, v7

    .line 278
    move-object/from16 v9, v27

    .line 279
    .line 280
    const/4 v2, 0x0

    .line 281
    const/4 v7, 0x2

    .line 282
    const/16 v8, 0x10

    .line 283
    .line 284
    const/16 v19, 0x0

    .line 285
    .line 286
    goto :goto_4

    .line 287
    :cond_d
    new-instance v0, Ljava/io/EOFException;

    .line 288
    .line 289
    invoke-direct {v0, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    throw v0

    .line 293
    :cond_e
    array-length v2, v10

    .line 294
    const/4 v4, 0x0

    .line 295
    invoke-static {v11, v4, v10, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 296
    .line 297
    .line 298
    array-length v2, v10

    .line 299
    array-length v5, v12

    .line 300
    invoke-static {v11, v2, v12, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 301
    .line 302
    .line 303
    new-instance v2, Ll/bwg0;

    .line 304
    .line 305
    aget-object v5, v20, v4

    .line 306
    .line 307
    aget-object v6, v20, v16

    .line 308
    .line 309
    invoke-direct {v2, v3, v15, v5, v6}, Ll/bwg0;-><init>(Ll/kgg0;I[I[I)V

    .line 310
    .line 311
    .line 312
    iput-object v2, v3, Ll/kgg0;->b:Ll/mng0;

    .line 313
    .line 314
    move v2, v4

    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :cond_f
    move v4, v2

    .line 318
    const-string v0, "Unsupported compression: "

    .line 319
    .line 320
    invoke-static {v5, v0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    return v4

    .line 328
    :cond_10
    new-instance v2, Ll/bwg0;

    .line 329
    .line 330
    sget-object v4, Ll/kgg0;->i:[I

    .line 331
    .line 332
    sget-object v5, Ll/kgg0;->j:[I

    .line 333
    .line 334
    invoke-direct {v2, v3, v11, v4, v5}, Ll/bwg0;-><init>(Ll/kgg0;I[I[I)V

    .line 335
    .line 336
    .line 337
    iput-object v2, v3, Ll/kgg0;->b:Ll/mng0;

    .line 338
    .line 339
    :goto_6
    const/4 v2, 0x0

    .line 340
    goto/16 :goto_0

    .line 341
    .line 342
    :cond_11
    iget-object v4, v3, Ll/kgg0;->c:Ll/drg0;

    .line 343
    .line 344
    invoke-virtual {v4}, Ll/drg0;->alignWithByteBoundary()V

    .line 345
    .line 346
    .line 347
    iget-object v4, v3, Ll/kgg0;->c:Ll/drg0;

    .line 348
    .line 349
    const/16 v2, 0x10

    .line 350
    .line 351
    invoke-static {v4, v2}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 352
    .line 353
    .line 354
    move-result-wide v4

    .line 355
    iget-object v6, v3, Ll/kgg0;->c:Ll/drg0;

    .line 356
    .line 357
    invoke-static {v6, v2}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 358
    .line 359
    .line 360
    move-result-wide v6

    .line 361
    const-wide/32 v8, 0xffff

    .line 362
    .line 363
    .line 364
    xor-long v10, v4, v8

    .line 365
    .line 366
    and-long/2addr v8, v10

    .line 367
    cmp-long v2, v8, v6

    .line 368
    .line 369
    if-nez v2, :cond_12

    .line 370
    .line 371
    new-instance v2, Ll/rfg0;

    .line 372
    .line 373
    invoke-direct {v2, v3, v4, v5}, Ll/rfg0;-><init>(Ll/kgg0;J)V

    .line 374
    .line 375
    .line 376
    iput-object v2, v3, Ll/kgg0;->b:Ll/mng0;

    .line 377
    .line 378
    goto :goto_6

    .line 379
    :cond_12
    const-string v0, "Illegal LEN / NLEN values"

    .line 380
    .line 381
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    const/16 v21, 0x0

    .line 385
    .line 386
    return v21

    .line 387
    :cond_13
    move/from16 v21, v2

    .line 388
    .line 389
    iget-object v2, v3, Ll/kgg0;->b:Ll/mng0;

    .line 390
    .line 391
    move-object/from16 v4, p1

    .line 392
    .line 393
    move/from16 v5, p2

    .line 394
    .line 395
    invoke-virtual {v2, v4, v5, v1}, Ll/mng0;->b([BII)I

    .line 396
    .line 397
    .line 398
    move-result v2

    .line 399
    if-eqz v2, :cond_15

    .line 400
    .line 401
    :goto_7
    iget-object v1, v0, Ll/ijg0;->b:Ll/kgg0;

    .line 402
    .line 403
    iget-object v1, v1, Ll/kgg0;->c:Ll/drg0;

    .line 404
    .line 405
    invoke-virtual {v1}, Ll/drg0;->getBytesRead()J

    .line 406
    .line 407
    .line 408
    move-result-wide v3

    .line 409
    iput-wide v3, v0, Ll/ijg0;->c:J

    .line 410
    .line 411
    invoke-virtual {v0, v2}, Ll/gjg0;->count(I)V

    .line 412
    .line 413
    .line 414
    const/4 v6, -0x1

    .line 415
    if-ne v2, v6, :cond_14

    .line 416
    .line 417
    iget-object v1, v0, Ll/ijg0;->b:Ll/kgg0;

    .line 418
    .line 419
    invoke-static {v1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 420
    .line 421
    .line 422
    const/4 v1, 0x0

    .line 423
    iput-object v1, v0, Ll/ijg0;->b:Ll/kgg0;

    .line 424
    .line 425
    :cond_14
    return v2

    .line 426
    :cond_15
    move/from16 v2, v21

    .line 427
    .line 428
    goto/16 :goto_0

    .line 429
    .line 430
    :cond_16
    const/4 v6, -0x1

    .line 431
    return v6
.end method

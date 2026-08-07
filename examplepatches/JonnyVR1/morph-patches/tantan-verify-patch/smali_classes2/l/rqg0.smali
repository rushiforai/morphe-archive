.class public final Ll/rqg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:I

.field public d:J

.field public final e:Ll/aug0;

.field public final f:Ll/bog0;


# direct methods
.method public constructor <init>(Ll/aug0;Ll/bog0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rqg0;->e:Ll/aug0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rqg0;->f:Ll/bog0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v1, v1, Ll/jwg0;->g:Ll/nmg0;

    .line 8
    .line 9
    new-instance v1, Ll/kng0;

    .line 10
    .line 11
    iget-object v2, v0, Ll/rqg0;->e:Ll/aug0;

    .line 12
    .line 13
    iget-object v3, v0, Ll/rqg0;->f:Ll/bog0;

    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Ll/kng0;-><init>(Ll/aug0;Ll/bog0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iget-object v4, v4, Ll/jwg0;->g:Ll/nmg0;

    .line 23
    .line 24
    invoke-virtual {v4, v2}, Ll/nmg0;->c(Ll/aug0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    iget-object v4, v4, Ll/jwg0;->g:Ll/nmg0;

    .line 32
    .line 33
    invoke-virtual {v4}, Ll/nmg0;->b()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    iget-object v4, v4, Ll/jwg0;->d:Ll/pog0;

    .line 41
    .line 42
    iget-object v5, v2, Ll/aug0;->c:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Ll/pog0;->a(Ljava/lang/String;)Ll/rug0;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v5, v2, Ll/aug0;->x:Ljava/util/Map;

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Ll/rug0;->b(Ljava/util/Map;)V

    .line 51
    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    :try_start_0
    iget-object v6, v3, Ll/bog0;->c:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v6}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    if-nez v6, :cond_0

    .line 61
    .line 62
    const-string v6, "If-Match"

    .line 63
    .line 64
    iget-object v3, v3, Ll/bog0;->c:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v7, v4, Ll/rug0;->b:Ll/x1d0$a;

    .line 67
    .line 68
    invoke-virtual {v7, v6, v3}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_0
    move-exception v0

    .line 73
    goto/16 :goto_1d

    .line 74
    .line 75
    :cond_0
    :goto_0
    const-string v3, "Range"

    .line 76
    .line 77
    const-string v6, "bytes=0-0"

    .line 78
    .line 79
    iget-object v7, v4, Ll/rug0;->b:Ll/x1d0$a;

    .line 80
    .line 81
    invoke-virtual {v7, v3, v6}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 82
    .line 83
    .line 84
    iget-object v3, v2, Ll/aug0;->e:Ljava/util/Map;

    .line 85
    .line 86
    if-eqz v3, :cond_1

    .line 87
    .line 88
    invoke-static {v3, v4}, Ll/ytg0;->c(Ljava/util/Map;Ll/csg0;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    iget-object v3, v3, Ll/jwg0;->b:Ll/d0h0;

    .line 96
    .line 97
    iget-object v3, v3, Ll/d0h0;->a:Ll/oyg0;

    .line 98
    .line 99
    iget-object v6, v4, Ll/rug0;->c:Ll/x1d0;

    .line 100
    .line 101
    if-eqz v6, :cond_2

    .line 102
    .line 103
    invoke-virtual {v6}, Ll/x1d0;->e()Ll/e0l;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    invoke-virtual {v6}, Ll/e0l;->l()Ljava/util/Map;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    goto :goto_1

    .line 112
    :cond_2
    iget-object v6, v4, Ll/rug0;->b:Ll/x1d0$a;

    .line 113
    .line 114
    invoke-virtual {v6}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-virtual {v6}, Ll/x1d0;->e()Ll/e0l;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-virtual {v6}, Ll/e0l;->l()Ljava/util/Map;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    :goto_1
    invoke-virtual {v3, v2, v6}, Ll/oyg0;->f(Ll/aug0;Ljava/util/Map;)V

    .line 127
    .line 128
    .line 129
    iget-object v6, v4, Ll/rug0;->b:Ll/x1d0$a;

    .line 130
    .line 131
    invoke-virtual {v6}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    iput-object v6, v4, Ll/rug0;->c:Ll/x1d0;

    .line 136
    .line 137
    iget-object v7, v4, Ll/rug0;->a:Ll/rg50;

    .line 138
    .line 139
    invoke-virtual {v7, v6}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    invoke-interface {v6}, Ll/ry3;->execute()Ll/i5d0;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    iput-object v6, v4, Ll/rug0;->d:Ll/i5d0;

    .line 148
    .line 149
    invoke-virtual {v6}, Ll/i5d0;->Q()Ll/i5d0;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    if-eqz v6, :cond_4

    .line 154
    .line 155
    iget-object v7, v4, Ll/rug0;->d:Ll/i5d0;

    .line 156
    .line 157
    invoke-virtual {v7}, Ll/i5d0;->I()Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    if-eqz v7, :cond_4

    .line 162
    .line 163
    invoke-virtual {v6}, Ll/i5d0;->q()I

    .line 164
    .line 165
    .line 166
    move-result v6

    .line 167
    const/16 v7, 0x12d

    .line 168
    .line 169
    if-eq v6, v7, :cond_3

    .line 170
    .line 171
    const/16 v7, 0x12e

    .line 172
    .line 173
    if-eq v6, v7, :cond_3

    .line 174
    .line 175
    const/16 v7, 0x12f

    .line 176
    .line 177
    if-eq v6, v7, :cond_3

    .line 178
    .line 179
    const/16 v7, 0x12c

    .line 180
    .line 181
    if-eq v6, v7, :cond_3

    .line 182
    .line 183
    const/16 v7, 0x133

    .line 184
    .line 185
    if-eq v6, v7, :cond_3

    .line 186
    .line 187
    const/16 v7, 0x134

    .line 188
    .line 189
    if-ne v6, v7, :cond_4

    .line 190
    .line 191
    :cond_3
    iget-object v6, v4, Ll/rug0;->d:Ll/i5d0;

    .line 192
    .line 193
    invoke-virtual {v6}, Ll/i5d0;->Z()Ll/x1d0;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    invoke-virtual {v6}, Ll/x1d0;->k()Ll/rnl;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    invoke-virtual {v6}, Ll/rnl;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    goto :goto_2

    .line 206
    :cond_4
    move-object v6, v5

    .line 207
    :goto_2
    iput-object v6, v2, Ll/aug0;->w:Ljava/lang/String;

    .line 208
    .line 209
    iget-object v2, v4, Ll/rug0;->d:Ll/i5d0;

    .line 210
    .line 211
    if-eqz v2, :cond_2d

    .line 212
    .line 213
    invoke-virtual {v2}, Ll/i5d0;->q()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    iput v2, v1, Ll/kng0;->f:I

    .line 218
    .line 219
    iget-object v2, v4, Ll/rug0;->d:Ll/i5d0;

    .line 220
    .line 221
    if-eqz v2, :cond_2c

    .line 222
    .line 223
    invoke-virtual {v2}, Ll/i5d0;->q()I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    const/16 v6, 0xce

    .line 228
    .line 229
    const/4 v7, 0x1

    .line 230
    if-ne v2, v6, :cond_5

    .line 231
    .line 232
    move v2, v7

    .line 233
    goto :goto_3

    .line 234
    :cond_5
    const-string v2, "Accept-Ranges"

    .line 235
    .line 236
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v2

    .line 240
    const-string v8, "bytes"

    .line 241
    .line 242
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v2

    .line 246
    :goto_3
    iput-boolean v2, v1, Ll/kng0;->b:Z

    .line 247
    .line 248
    const-string v2, "Content-Range"

    .line 249
    .line 250
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    const/4 v8, 0x2

    .line 255
    const-wide/16 v9, -0x1

    .line 256
    .line 257
    if-nez v2, :cond_6

    .line 258
    .line 259
    goto :goto_4

    .line 260
    :cond_6
    const-string v11, "/"

    .line 261
    .line 262
    invoke-virtual {v2, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    array-length v11, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    if-lt v11, v8, :cond_7

    .line 268
    .line 269
    :try_start_1
    aget-object v2, v2, v7

    .line 270
    .line 271
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 272
    .line 273
    .line 274
    move-result-wide v11
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 275
    goto :goto_5

    .line 276
    :catch_0
    :cond_7
    :goto_4
    move-wide v11, v9

    .line 277
    :goto_5
    cmp-long v2, v11, v9

    .line 278
    .line 279
    if-eqz v2, :cond_8

    .line 280
    .line 281
    goto :goto_6

    .line 282
    :cond_8
    :try_start_2
    const-string v2, "Transfer-Encoding"

    .line 283
    .line 284
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    if-eqz v2, :cond_9

    .line 289
    .line 290
    const-string v11, "chunked"

    .line 291
    .line 292
    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    :cond_9
    move-wide v11, v9

    .line 296
    :goto_6
    iput-wide v11, v1, Ll/kng0;->c:J

    .line 297
    .line 298
    const-string v2, "Etag"

    .line 299
    .line 300
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v2

    .line 304
    iput-object v2, v1, Ll/kng0;->d:Ljava/lang/String;

    .line 305
    .line 306
    invoke-static {v4}, Ll/kng0;->a(Ll/rug0;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    iput-object v2, v1, Ll/kng0;->e:Ljava/lang/String;

    .line 311
    .line 312
    iget-object v2, v4, Ll/rug0;->d:Ll/i5d0;

    .line 313
    .line 314
    if-nez v2, :cond_a

    .line 315
    .line 316
    move-object v2, v5

    .line 317
    goto :goto_7

    .line 318
    :cond_a
    invoke-virtual {v2}, Ll/i5d0;->F()Ll/e0l;

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    invoke-virtual {v2}, Ll/e0l;->l()Ljava/util/Map;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    :goto_7
    if-nez v2, :cond_b

    .line 327
    .line 328
    new-instance v2, Ljava/util/HashMap;

    .line 329
    .line 330
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 331
    .line 332
    .line 333
    :cond_b
    iget-object v11, v1, Ll/kng0;->a:Ll/aug0;

    .line 334
    .line 335
    iget v12, v1, Ll/kng0;->f:I

    .line 336
    .line 337
    invoke-virtual {v3, v11, v12, v2}, Ll/oyg0;->h(Ll/aug0;ILjava/util/Map;)V

    .line 338
    .line 339
    .line 340
    iget-wide v2, v1, Ll/kng0;->c:J

    .line 341
    .line 342
    cmp-long v2, v2, v9

    .line 343
    .line 344
    if-eqz v2, :cond_c

    .line 345
    .line 346
    goto :goto_8

    .line 347
    :cond_c
    const-string v2, "Content-Range"

    .line 348
    .line 349
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    if-eqz v2, :cond_d

    .line 354
    .line 355
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 356
    .line 357
    .line 358
    move-result v2

    .line 359
    if-lez v2, :cond_d

    .line 360
    .line 361
    goto :goto_8

    .line 362
    :cond_d
    const-string v2, "Transfer-Encoding"

    .line 363
    .line 364
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    if-eqz v2, :cond_e

    .line 369
    .line 370
    const-string v11, "chunked"

    .line 371
    .line 372
    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 373
    .line 374
    .line 375
    move-result v2

    .line 376
    if-eqz v2, :cond_e

    .line 377
    .line 378
    goto :goto_8

    .line 379
    :cond_e
    const-string v2, "Content-Length"

    .line 380
    .line 381
    invoke-virtual {v4, v2}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    if-eqz v2, :cond_10

    .line 386
    .line 387
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 388
    .line 389
    .line 390
    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 391
    if-gtz v2, :cond_f

    .line 392
    .line 393
    goto :goto_8

    .line 394
    :cond_f
    move v2, v7

    .line 395
    goto :goto_9

    .line 396
    :cond_10
    :goto_8
    const/4 v2, 0x0

    .line 397
    :goto_9
    iput-object v5, v4, Ll/rug0;->c:Ll/x1d0;

    .line 398
    .line 399
    iget-object v11, v4, Ll/rug0;->d:Ll/i5d0;

    .line 400
    .line 401
    if-eqz v11, :cond_11

    .line 402
    .line 403
    invoke-virtual {v11}, Ll/i5d0;->close()V

    .line 404
    .line 405
    .line 406
    :cond_11
    iput-object v5, v4, Ll/rug0;->d:Ll/i5d0;

    .line 407
    .line 408
    if-eqz v2, :cond_19

    .line 409
    .line 410
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    iget-object v2, v2, Ll/jwg0;->d:Ll/pog0;

    .line 415
    .line 416
    iget-object v4, v1, Ll/kng0;->a:Ll/aug0;

    .line 417
    .line 418
    iget-object v4, v4, Ll/aug0;->c:Ljava/lang/String;

    .line 419
    .line 420
    invoke-virtual {v2, v4}, Ll/pog0;->a(Ljava/lang/String;)Ll/rug0;

    .line 421
    .line 422
    .line 423
    move-result-object v2

    .line 424
    iget-object v4, v1, Ll/kng0;->a:Ll/aug0;

    .line 425
    .line 426
    iget-object v4, v4, Ll/aug0;->x:Ljava/util/Map;

    .line 427
    .line 428
    invoke-virtual {v2, v4}, Ll/rug0;->b(Ljava/util/Map;)V

    .line 429
    .line 430
    .line 431
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 432
    .line 433
    .line 434
    move-result-object v4

    .line 435
    iget-object v4, v4, Ll/jwg0;->b:Ll/d0h0;

    .line 436
    .line 437
    iget-object v4, v4, Ll/d0h0;->a:Ll/oyg0;

    .line 438
    .line 439
    :try_start_3
    const-string v11, "HEAD"

    .line 440
    .line 441
    iget-object v12, v2, Ll/rug0;->b:Ll/x1d0$a;

    .line 442
    .line 443
    invoke-virtual {v12, v11, v5}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 444
    .line 445
    .line 446
    iget-object v11, v1, Ll/kng0;->a:Ll/aug0;

    .line 447
    .line 448
    iget-object v11, v11, Ll/aug0;->e:Ljava/util/Map;

    .line 449
    .line 450
    if-eqz v11, :cond_12

    .line 451
    .line 452
    invoke-static {v11, v2}, Ll/ytg0;->c(Ljava/util/Map;Ll/csg0;)V

    .line 453
    .line 454
    .line 455
    goto :goto_a

    .line 456
    :catchall_1
    move-exception v0

    .line 457
    goto/16 :goto_e

    .line 458
    .line 459
    :cond_12
    :goto_a
    iget-object v11, v1, Ll/kng0;->a:Ll/aug0;

    .line 460
    .line 461
    iget-object v12, v2, Ll/rug0;->c:Ll/x1d0;

    .line 462
    .line 463
    if-eqz v12, :cond_13

    .line 464
    .line 465
    invoke-virtual {v12}, Ll/x1d0;->e()Ll/e0l;

    .line 466
    .line 467
    .line 468
    move-result-object v12

    .line 469
    invoke-virtual {v12}, Ll/e0l;->l()Ljava/util/Map;

    .line 470
    .line 471
    .line 472
    move-result-object v12

    .line 473
    goto :goto_b

    .line 474
    :cond_13
    iget-object v12, v2, Ll/rug0;->b:Ll/x1d0$a;

    .line 475
    .line 476
    invoke-virtual {v12}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 477
    .line 478
    .line 479
    move-result-object v12

    .line 480
    invoke-virtual {v12}, Ll/x1d0;->e()Ll/e0l;

    .line 481
    .line 482
    .line 483
    move-result-object v12

    .line 484
    invoke-virtual {v12}, Ll/e0l;->l()Ljava/util/Map;

    .line 485
    .line 486
    .line 487
    move-result-object v12

    .line 488
    :goto_b
    invoke-virtual {v4, v11, v12}, Ll/oyg0;->f(Ll/aug0;Ljava/util/Map;)V

    .line 489
    .line 490
    .line 491
    iget-object v11, v2, Ll/rug0;->b:Ll/x1d0$a;

    .line 492
    .line 493
    invoke-virtual {v11}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 494
    .line 495
    .line 496
    move-result-object v11

    .line 497
    iput-object v11, v2, Ll/rug0;->c:Ll/x1d0;

    .line 498
    .line 499
    iget-object v12, v2, Ll/rug0;->a:Ll/rg50;

    .line 500
    .line 501
    invoke-virtual {v12, v11}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 502
    .line 503
    .line 504
    move-result-object v11

    .line 505
    invoke-interface {v11}, Ll/ry3;->execute()Ll/i5d0;

    .line 506
    .line 507
    .line 508
    move-result-object v11

    .line 509
    iput-object v11, v2, Ll/rug0;->d:Ll/i5d0;

    .line 510
    .line 511
    iget-object v12, v1, Ll/kng0;->a:Ll/aug0;

    .line 512
    .line 513
    if-eqz v11, :cond_17

    .line 514
    .line 515
    invoke-virtual {v11}, Ll/i5d0;->q()I

    .line 516
    .line 517
    .line 518
    move-result v11

    .line 519
    iget-object v13, v2, Ll/rug0;->d:Ll/i5d0;

    .line 520
    .line 521
    if-nez v13, :cond_14

    .line 522
    .line 523
    move-object v13, v5

    .line 524
    goto :goto_c

    .line 525
    :cond_14
    invoke-virtual {v13}, Ll/i5d0;->F()Ll/e0l;

    .line 526
    .line 527
    .line 528
    move-result-object v13

    .line 529
    invoke-virtual {v13}, Ll/e0l;->l()Ljava/util/Map;

    .line 530
    .line 531
    .line 532
    move-result-object v13

    .line 533
    :goto_c
    invoke-virtual {v4, v12, v11, v13}, Ll/oyg0;->h(Ll/aug0;ILjava/util/Map;)V

    .line 534
    .line 535
    .line 536
    const-string v4, "Content-Length"

    .line 537
    .line 538
    invoke-virtual {v2, v4}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 542
    if-nez v4, :cond_15

    .line 543
    .line 544
    :catch_1
    move-wide v11, v9

    .line 545
    goto :goto_d

    .line 546
    :cond_15
    :try_start_4
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 547
    .line 548
    .line 549
    move-result-wide v11
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 550
    :goto_d
    :try_start_5
    iput-wide v11, v1, Ll/kng0;->c:J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 551
    .line 552
    iput-object v5, v2, Ll/rug0;->c:Ll/x1d0;

    .line 553
    .line 554
    iget-object v4, v2, Ll/rug0;->d:Ll/i5d0;

    .line 555
    .line 556
    if-eqz v4, :cond_16

    .line 557
    .line 558
    invoke-virtual {v4}, Ll/i5d0;->close()V

    .line 559
    .line 560
    .line 561
    :cond_16
    iput-object v5, v2, Ll/rug0;->d:Ll/i5d0;

    .line 562
    .line 563
    goto :goto_f

    .line 564
    :cond_17
    :try_start_6
    new-instance v0, Ljava/io/IOException;

    .line 565
    .line 566
    const-string v1, "Please invoke execute first!"

    .line 567
    .line 568
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 572
    :goto_e
    iput-object v5, v2, Ll/rug0;->c:Ll/x1d0;

    .line 573
    .line 574
    iget-object v1, v2, Ll/rug0;->d:Ll/i5d0;

    .line 575
    .line 576
    if-eqz v1, :cond_18

    .line 577
    .line 578
    invoke-virtual {v1}, Ll/i5d0;->close()V

    .line 579
    .line 580
    .line 581
    :cond_18
    iput-object v5, v2, Ll/rug0;->d:Ll/i5d0;

    .line 582
    .line 583
    throw v0

    .line 584
    :cond_19
    :goto_f
    iget-boolean v2, v1, Ll/kng0;->b:Z

    .line 585
    .line 586
    iget-wide v11, v1, Ll/kng0;->c:J

    .line 587
    .line 588
    cmp-long v4, v11, v9

    .line 589
    .line 590
    if-nez v4, :cond_1a

    .line 591
    .line 592
    move v4, v7

    .line 593
    goto :goto_10

    .line 594
    :cond_1a
    const/4 v4, 0x0

    .line 595
    :goto_10
    iget-object v9, v1, Ll/kng0;->d:Ljava/lang/String;

    .line 596
    .line 597
    iget-object v10, v1, Ll/kng0;->e:Ljava/lang/String;

    .line 598
    .line 599
    iget v1, v1, Ll/kng0;->f:I

    .line 600
    .line 601
    iget-object v13, v0, Ll/rqg0;->e:Ll/aug0;

    .line 602
    .line 603
    iget-object v14, v0, Ll/rqg0;->f:Ll/bog0;

    .line 604
    .line 605
    iget-object v15, v13, Ll/aug0;->s:Ll/mhg0;

    .line 606
    .line 607
    iget-object v15, v15, Ll/mhg0;->a:Ljava/lang/String;

    .line 608
    .line 609
    invoke-static {v15}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 610
    .line 611
    .line 612
    move-result v15

    .line 613
    if-eqz v15, :cond_23

    .line 614
    .line 615
    invoke-static {v10}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 616
    .line 617
    .line 618
    move-result v15

    .line 619
    if-eqz v15, :cond_21

    .line 620
    .line 621
    iget-object v10, v13, Ll/aug0;->c:Ljava/lang/String;

    .line 622
    .line 623
    sget-object v15, Ll/nmg0;->c:Ljava/util/regex/Pattern;

    .line 624
    .line 625
    invoke-virtual {v15, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 626
    .line 627
    .line 628
    move-result-object v15

    .line 629
    move-object/from16 v16, v5

    .line 630
    .line 631
    :goto_11
    invoke-virtual {v15}, Ljava/util/regex/Matcher;->find()Z

    .line 632
    .line 633
    .line 634
    move-result v17

    .line 635
    if-eqz v17, :cond_1b

    .line 636
    .line 637
    invoke-virtual {v15, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 638
    .line 639
    .line 640
    move-result-object v16

    .line 641
    goto :goto_11

    .line 642
    :cond_1b
    invoke-static/range {v16 .. v16}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 643
    .line 644
    .line 645
    move-result v15

    .line 646
    if-eqz v15, :cond_1e

    .line 647
    .line 648
    :try_start_7
    const-string v15, "MD5"

    .line 649
    .line 650
    invoke-static {v15}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 651
    .line 652
    .line 653
    move-result-object v15

    .line 654
    const-string v3, "UTF-8"

    .line 655
    .line 656
    invoke-virtual {v10, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 657
    .line 658
    .line 659
    move-result-object v3

    .line 660
    invoke-virtual {v15, v3}, Ljava/security/MessageDigest;->digest([B)[B

    .line 661
    .line 662
    .line 663
    move-result-object v3
    :try_end_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7 .. :try_end_7} :catch_2

    .line 664
    goto :goto_12

    .line 665
    :catch_2
    move-object v3, v5

    .line 666
    :goto_12
    if-eqz v3, :cond_1f

    .line 667
    .line 668
    new-instance v5, Ljava/lang/StringBuilder;

    .line 669
    .line 670
    array-length v10, v3

    .line 671
    mul-int/2addr v10, v8

    .line 672
    invoke-direct {v5, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 673
    .line 674
    .line 675
    array-length v8, v3

    .line 676
    const/4 v10, 0x0

    .line 677
    :goto_13
    if-ge v10, v8, :cond_1d

    .line 678
    .line 679
    aget-byte v15, v3, v10

    .line 680
    .line 681
    and-int/lit16 v15, v15, 0xff

    .line 682
    .line 683
    const/16 v7, 0x10

    .line 684
    .line 685
    if-ge v15, v7, :cond_1c

    .line 686
    .line 687
    const/16 v7, 0x30

    .line 688
    .line 689
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 690
    .line 691
    .line 692
    :cond_1c
    invoke-static {v15}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 693
    .line 694
    .line 695
    move-result-object v7

    .line 696
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 697
    .line 698
    .line 699
    add-int/lit8 v10, v10, 0x1

    .line 700
    .line 701
    const/4 v7, 0x1

    .line 702
    goto :goto_13

    .line 703
    :cond_1d
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v5

    .line 707
    goto :goto_14

    .line 708
    :cond_1e
    move-object/from16 v5, v16

    .line 709
    .line 710
    :cond_1f
    :goto_14
    if-eqz v5, :cond_20

    .line 711
    .line 712
    move-object v10, v5

    .line 713
    goto :goto_15

    .line 714
    :cond_20
    const-string v0, "Can\'t find valid filename."

    .line 715
    .line 716
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 717
    .line 718
    .line 719
    return-void

    .line 720
    :cond_21
    :goto_15
    iget-object v3, v13, Ll/aug0;->s:Ll/mhg0;

    .line 721
    .line 722
    iget-object v3, v3, Ll/mhg0;->a:Ljava/lang/String;

    .line 723
    .line 724
    invoke-static {v3}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 725
    .line 726
    .line 727
    move-result v3

    .line 728
    if-eqz v3, :cond_23

    .line 729
    .line 730
    monitor-enter v13

    .line 731
    :try_start_8
    iget-object v3, v13, Ll/aug0;->s:Ll/mhg0;

    .line 732
    .line 733
    iget-object v3, v3, Ll/mhg0;->a:Ljava/lang/String;

    .line 734
    .line 735
    invoke-static {v3}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 736
    .line 737
    .line 738
    move-result v3

    .line 739
    if-eqz v3, :cond_22

    .line 740
    .line 741
    iget-object v3, v13, Ll/aug0;->s:Ll/mhg0;

    .line 742
    .line 743
    iput-object v10, v3, Ll/mhg0;->a:Ljava/lang/String;

    .line 744
    .line 745
    iget-object v3, v14, Ll/bog0;->f:Ll/mhg0;

    .line 746
    .line 747
    iput-object v10, v3, Ll/mhg0;->a:Ljava/lang/String;

    .line 748
    .line 749
    goto :goto_16

    .line 750
    :catchall_2
    move-exception v0

    .line 751
    goto :goto_17

    .line 752
    :cond_22
    :goto_16
    monitor-exit v13

    .line 753
    goto :goto_18

    .line 754
    :goto_17
    monitor-exit v13
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 755
    throw v0

    .line 756
    :cond_23
    :goto_18
    iget-object v3, v0, Ll/rqg0;->f:Ll/bog0;

    .line 757
    .line 758
    iput-boolean v4, v3, Ll/bog0;->i:Z

    .line 759
    .line 760
    iput-object v9, v3, Ll/bog0;->c:Ljava/lang/String;

    .line 761
    .line 762
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 763
    .line 764
    .line 765
    move-result-object v3

    .line 766
    iget-object v3, v3, Ll/jwg0;->a:Ll/ieg0;

    .line 767
    .line 768
    iget-object v4, v0, Ll/rqg0;->e:Ll/aug0;

    .line 769
    .line 770
    invoke-virtual {v3, v4}, Ll/ieg0;->i(Ll/aug0;)Z

    .line 771
    .line 772
    .line 773
    move-result v3

    .line 774
    if-nez v3, :cond_2b

    .line 775
    .line 776
    iget-object v3, v0, Ll/rqg0;->f:Ll/bog0;

    .line 777
    .line 778
    invoke-virtual {v3}, Ll/bog0;->e()J

    .line 779
    .line 780
    .line 781
    move-result-wide v3

    .line 782
    const-wide/16 v7, 0x0

    .line 783
    .line 784
    cmp-long v3, v3, v7

    .line 785
    .line 786
    if-eqz v3, :cond_24

    .line 787
    .line 788
    const/4 v3, 0x1

    .line 789
    goto :goto_19

    .line 790
    :cond_24
    const/4 v3, 0x0

    .line 791
    :goto_19
    iget-object v4, v0, Ll/rqg0;->f:Ll/bog0;

    .line 792
    .line 793
    invoke-static {v1, v3, v4, v9}, Ll/nmg0;->a(IZLl/bog0;Ljava/lang/String;)I

    .line 794
    .line 795
    .line 796
    move-result v3

    .line 797
    if-nez v3, :cond_25

    .line 798
    .line 799
    const/4 v4, 0x1

    .line 800
    goto :goto_1a

    .line 801
    :cond_25
    const/4 v4, 0x0

    .line 802
    :goto_1a
    iput-boolean v4, v0, Ll/rqg0;->b:Z

    .line 803
    .line 804
    iput v3, v0, Ll/rqg0;->c:I

    .line 805
    .line 806
    iput-wide v11, v0, Ll/rqg0;->d:J

    .line 807
    .line 808
    iput-boolean v2, v0, Ll/rqg0;->a:Z

    .line 809
    .line 810
    const/16 v2, 0x1a0

    .line 811
    .line 812
    if-ne v1, v2, :cond_26

    .line 813
    .line 814
    cmp-long v2, v11, v7

    .line 815
    .line 816
    if-ltz v2, :cond_26

    .line 817
    .line 818
    if-eqz v4, :cond_26

    .line 819
    .line 820
    goto :goto_1c

    .line 821
    :cond_26
    iget-object v2, v0, Ll/rqg0;->f:Ll/bog0;

    .line 822
    .line 823
    invoke-virtual {v2}, Ll/bog0;->e()J

    .line 824
    .line 825
    .line 826
    move-result-wide v2

    .line 827
    cmp-long v2, v2, v7

    .line 828
    .line 829
    if-eqz v2, :cond_27

    .line 830
    .line 831
    const/4 v7, 0x1

    .line 832
    goto :goto_1b

    .line 833
    :cond_27
    const/4 v7, 0x0

    .line 834
    :goto_1b
    const/16 v2, 0xc8

    .line 835
    .line 836
    if-eq v1, v6, :cond_28

    .line 837
    .line 838
    if-ne v1, v2, :cond_29

    .line 839
    .line 840
    :cond_28
    if-ne v1, v2, :cond_2a

    .line 841
    .line 842
    if-nez v7, :cond_29

    .line 843
    .line 844
    goto :goto_1c

    .line 845
    :cond_29
    new-instance v2, LSudchar/Sudcase;

    .line 846
    .line 847
    iget-object v0, v0, Ll/rqg0;->f:Ll/bog0;

    .line 848
    .line 849
    invoke-virtual {v0}, Ll/bog0;->e()J

    .line 850
    .line 851
    .line 852
    move-result-wide v3

    .line 853
    invoke-direct {v2, v1, v3, v4}, LSudchar/Sudcase;-><init>(IJ)V

    .line 854
    .line 855
    .line 856
    throw v2

    .line 857
    :cond_2a
    :goto_1c
    return-void

    .line 858
    :cond_2b
    sget-object v0, LSudchar/Sudif;->Suddo:LSudchar/Sudif;

    .line 859
    .line 860
    throw v0

    .line 861
    :cond_2c
    :try_start_9
    new-instance v0, Ljava/io/IOException;

    .line 862
    .line 863
    const-string v1, "Please invoke execute first!"

    .line 864
    .line 865
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 866
    .line 867
    .line 868
    throw v0

    .line 869
    :cond_2d
    new-instance v0, Ljava/io/IOException;

    .line 870
    .line 871
    const-string v1, "Please invoke execute first!"

    .line 872
    .line 873
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 877
    :goto_1d
    iput-object v5, v4, Ll/rug0;->c:Ll/x1d0;

    .line 878
    .line 879
    iget-object v1, v4, Ll/rug0;->d:Ll/i5d0;

    .line 880
    .line 881
    if-eqz v1, :cond_2e

    .line 882
    .line 883
    invoke-virtual {v1}, Ll/i5d0;->close()V

    .line 884
    .line 885
    .line 886
    :cond_2e
    iput-object v5, v4, Ll/rug0;->d:Ll/i5d0;

    .line 887
    .line 888
    throw v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "acceptRange["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/rqg0;->a:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "] resumable["

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Ll/rqg0;->b:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "] failedCause["

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/rqg0;->c:I

    .line 29
    .line 30
    invoke-static {v1}, Ll/org0;->a(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, "] instanceLength["

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-wide v1, p0, Ll/rqg0;->d:J

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, "] "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

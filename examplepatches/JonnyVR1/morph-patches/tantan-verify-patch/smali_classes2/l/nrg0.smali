.class public final Ll/nrg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wng0;


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


# virtual methods
.method public final b(Ll/jgg0;)Ll/vkg0;
    .locals 11

    .line 1
    iget-object p0, p1, Ll/jgg0;->c:Ll/bog0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/jgg0;->a()Ll/csg0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Ll/jgg0;->b:Ll/aug0;

    .line 8
    .line 9
    iget-object v2, v1, Ll/aug0;->e:Ljava/util/Map;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-static {v2, v0}, Ll/ytg0;->c(Ljava/util/Map;Ll/csg0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string v3, "User-Agent"

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_2

    .line 25
    .line 26
    :cond_1
    move-object v2, v0

    .line 27
    check-cast v2, Ll/rug0;

    .line 28
    .line 29
    iget-object v2, v2, Ll/rug0;->b:Ll/x1d0$a;

    .line 30
    .line 31
    const-string v4, "OkDownload/1.0.7"

    .line 32
    .line 33
    invoke-virtual {v2, v3, v4}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    :cond_2
    iget v2, p1, Ll/jgg0;->a:I

    .line 37
    .line 38
    iget-object v3, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Ll/akg0;

    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz v3, :cond_15

    .line 48
    .line 49
    new-instance v5, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v6, "bytes="

    .line 52
    .line 53
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-wide v6, v3, Ll/akg0;->a:J

    .line 57
    .line 58
    iget-object v8, v3, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 59
    .line 60
    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 61
    .line 62
    .line 63
    move-result-wide v8

    .line 64
    add-long/2addr v8, v6

    .line 65
    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v6, "-"

    .line 69
    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    new-instance v6, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-wide v7, v3, Ll/akg0;->a:J

    .line 86
    .line 87
    iget-wide v9, v3, Ll/akg0;->b:J

    .line 88
    .line 89
    add-long/2addr v7, v9

    .line 90
    const-wide/16 v9, 0x1

    .line 91
    .line 92
    sub-long/2addr v7, v9

    .line 93
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    check-cast v0, Ll/rug0;

    .line 101
    .line 102
    iget-object v6, v0, Ll/rug0;->b:Ll/x1d0$a;

    .line 103
    .line 104
    const-string v7, "Range"

    .line 105
    .line 106
    invoke-virtual {v6, v7, v5}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 107
    .line 108
    .line 109
    iget-object v5, v3, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 110
    .line 111
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 112
    .line 113
    .line 114
    iget-object v3, v3, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    .line 116
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Ll/bog0;->c:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v3}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-nez v5, :cond_3

    .line 126
    .line 127
    iget-object v5, v0, Ll/rug0;->b:Ll/x1d0$a;

    .line 128
    .line 129
    const-string v6, "If-Match"

    .line 130
    .line 131
    invoke-virtual {v5, v6, v3}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 132
    .line 133
    .line 134
    :cond_3
    iget-object v3, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 135
    .line 136
    invoke-virtual {v3}, Ll/ixg0;->c()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-nez v3, :cond_14

    .line 141
    .line 142
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    iget-object v3, v3, Ll/jwg0;->b:Ll/d0h0;

    .line 147
    .line 148
    iget-object v3, v3, Ll/d0h0;->a:Ll/oyg0;

    .line 149
    .line 150
    iget-object v5, v0, Ll/rug0;->c:Ll/x1d0;

    .line 151
    .line 152
    if-eqz v5, :cond_4

    .line 153
    .line 154
    invoke-virtual {v5}, Ll/x1d0;->e()Ll/e0l;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Ll/e0l;->l()Ljava/util/Map;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    goto :goto_0

    .line 163
    :cond_4
    iget-object v0, v0, Ll/rug0;->b:Ll/x1d0$a;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0}, Ll/x1d0;->e()Ll/e0l;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ll/e0l;->l()Ljava/util/Map;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    :goto_0
    invoke-virtual {v3, v1, v2, v0}, Ll/oyg0;->e(Ll/aug0;ILjava/util/Map;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Ll/jgg0;->c()Ll/vkg0;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iget-object v3, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 185
    .line 186
    invoke-virtual {v3}, Ll/ixg0;->c()Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-nez v3, :cond_13

    .line 191
    .line 192
    check-cast v0, Ll/rug0;

    .line 193
    .line 194
    iget-object v3, v0, Ll/rug0;->d:Ll/i5d0;

    .line 195
    .line 196
    if-nez v3, :cond_5

    .line 197
    .line 198
    move-object v3, v4

    .line 199
    goto :goto_1

    .line 200
    :cond_5
    invoke-virtual {v3}, Ll/i5d0;->F()Ll/e0l;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {v3}, Ll/e0l;->l()Ljava/util/Map;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    :goto_1
    if-nez v3, :cond_6

    .line 209
    .line 210
    new-instance v3, Ljava/util/HashMap;

    .line 211
    .line 212
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 213
    .line 214
    .line 215
    :cond_6
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    iget-object v5, v5, Ll/jwg0;->b:Ll/d0h0;

    .line 220
    .line 221
    iget-object v5, v5, Ll/d0h0;->a:Ll/oyg0;

    .line 222
    .line 223
    iget-object v6, v0, Ll/rug0;->d:Ll/i5d0;

    .line 224
    .line 225
    const-string v7, "Please invoke execute first!"

    .line 226
    .line 227
    if-eqz v6, :cond_12

    .line 228
    .line 229
    invoke-virtual {v6}, Ll/i5d0;->q()I

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    invoke-virtual {v5, v1, v2, v6, v3}, Ll/oyg0;->a(Ll/aug0;IILjava/util/Map;)V

    .line 234
    .line 235
    .line 236
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    iget-object v1, v1, Ll/jwg0;->g:Ll/nmg0;

    .line 241
    .line 242
    iget-object v1, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 243
    .line 244
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    check-cast v1, Ll/akg0;

    .line 249
    .line 250
    iget-object v2, v0, Ll/rug0;->d:Ll/i5d0;

    .line 251
    .line 252
    if-eqz v2, :cond_11

    .line 253
    .line 254
    invoke-virtual {v2}, Ll/i5d0;->q()I

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    const-string v3, "Etag"

    .line 259
    .line 260
    invoke-virtual {v0, v3}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    iget-object v4, v4, Ll/jwg0;->g:Ll/nmg0;

    .line 269
    .line 270
    iget-object v4, v1, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 271
    .line 272
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 273
    .line 274
    .line 275
    move-result-wide v4

    .line 276
    const-wide/16 v6, 0x0

    .line 277
    .line 278
    cmp-long v4, v4, v6

    .line 279
    .line 280
    const/4 v5, 0x0

    .line 281
    const/4 v8, 0x1

    .line 282
    if-eqz v4, :cond_7

    .line 283
    .line 284
    move v4, v8

    .line 285
    goto :goto_2

    .line 286
    :cond_7
    move v4, v5

    .line 287
    :goto_2
    invoke-static {v2, v4, p0, v3}, Ll/nmg0;->a(IZLl/bog0;Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    if-nez p0, :cond_10

    .line 292
    .line 293
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    iget-object p0, p0, Ll/jwg0;->g:Ll/nmg0;

    .line 298
    .line 299
    iget-object p0, v1, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 300
    .line 301
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 302
    .line 303
    .line 304
    move-result-wide v3

    .line 305
    cmp-long p0, v3, v6

    .line 306
    .line 307
    if-eqz p0, :cond_8

    .line 308
    .line 309
    move v5, v8

    .line 310
    :cond_8
    const/16 p0, 0xce

    .line 311
    .line 312
    const/16 v3, 0xc8

    .line 313
    .line 314
    if-eq v2, p0, :cond_9

    .line 315
    .line 316
    if-ne v2, v3, :cond_a

    .line 317
    .line 318
    :cond_9
    if-ne v2, v3, :cond_b

    .line 319
    .line 320
    if-nez v5, :cond_a

    .line 321
    .line 322
    goto :goto_3

    .line 323
    :cond_a
    new-instance p0, LSudchar/Sudcase;

    .line 324
    .line 325
    iget-object p1, v1, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 328
    .line 329
    .line 330
    move-result-wide v0

    .line 331
    invoke-direct {p0, v2, v0, v1}, LSudchar/Sudcase;-><init>(IJ)V

    .line 332
    .line 333
    .line 334
    throw p0

    .line 335
    :cond_b
    :goto_3
    const-string p0, "Content-Length"

    .line 336
    .line 337
    invoke-virtual {v0, p0}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    const-wide/16 v1, -0x1

    .line 342
    .line 343
    if-eqz p0, :cond_d

    .line 344
    .line 345
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 346
    .line 347
    .line 348
    move-result v3

    .line 349
    if-nez v3, :cond_c

    .line 350
    .line 351
    goto :goto_4

    .line 352
    :cond_c
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 353
    .line 354
    .line 355
    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 356
    goto :goto_5

    .line 357
    :cond_d
    :goto_4
    const-string p0, "Content-Range"

    .line 358
    .line 359
    invoke-virtual {v0, p0}, Ll/rug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    if-eqz p0, :cond_f

    .line 364
    .line 365
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    if-nez v3, :cond_e

    .line 370
    .line 371
    goto :goto_5

    .line 372
    :cond_e
    :try_start_1
    const-string v3, "bytes (\\d+)-(\\d+)/\\d+"

    .line 373
    .line 374
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 383
    .line 384
    .line 385
    move-result v3

    .line 386
    if-eqz v3, :cond_f

    .line 387
    .line 388
    invoke-virtual {p0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 393
    .line 394
    .line 395
    move-result-wide v3

    .line 396
    const/4 v5, 0x2

    .line 397
    invoke-virtual {p0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 402
    .line 403
    .line 404
    move-result-wide v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 405
    sub-long/2addr v1, v3

    .line 406
    add-long/2addr v1, v9

    .line 407
    goto :goto_5

    .line 408
    :catch_0
    move-exception p0

    .line 409
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    :catch_1
    :cond_f
    :goto_5
    iput-wide v1, p1, Ll/jgg0;->i:J

    .line 413
    .line 414
    return-object v0

    .line 415
    :cond_10
    new-instance p1, LSudchar/Sudnew;

    .line 416
    .line 417
    invoke-direct {p1, p0}, LSudchar/Sudnew;-><init>(I)V

    .line 418
    .line 419
    .line 420
    throw p1

    .line 421
    :cond_11
    invoke-static {v7}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    return-object v4

    .line 425
    :cond_12
    invoke-static {v7}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    return-object v4

    .line 429
    :cond_13
    sget-object p0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 430
    .line 431
    throw p0

    .line 432
    :cond_14
    sget-object p0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 433
    .line 434
    throw p0

    .line 435
    :cond_15
    const-string p0, "No block-info found on "

    .line 436
    .line 437
    invoke-static {v2, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object p0

    .line 441
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    return-object v4
.end method

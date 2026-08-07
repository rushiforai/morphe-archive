.class public Ll/vwr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvr0;


# instance fields
.field public final a:Ll/uwr0;

.field public final b:Ll/xwr0;

.field public final c:Ll/uwr0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/uwr0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/xwr0;

    .line 2
    .line 3
    const/16 v1, 0x1000

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/xwr0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/vwr0;->a:Ll/uwr0;

    .line 12
    .line 13
    iput-object p1, p0, Ll/vwr0;->c:Ll/uwr0;

    .line 14
    .line 15
    iput-object v0, p0, Ll/vwr0;->b:Ll/xwr0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Ll/jwr0;)Ll/vvr0;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzaqj;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    const-string v2, "Error occurred when closing InputStream"

    .line 4
    .line 5
    const-string v3, "Content-Type"

    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v4

    .line 11
    :goto_0
    const/4 v6, 0x0

    .line 12
    :try_start_0
    invoke-virtual {v1}, Ll/jwr0;->f()Ll/kvr0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :catch_0
    move-exception v0

    .line 22
    move-object/from16 v12, p0

    .line 23
    .line 24
    goto/16 :goto_19

    .line 25
    .line 26
    :cond_0
    new-instance v7, Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v8, v0, Ll/kvr0;->b:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v8, :cond_1

    .line 34
    .line 35
    const-string v9, "If-None-Match"

    .line 36
    .line 37
    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-wide v8, v0, Ll/kvr0;->d:J

    .line 41
    .line 42
    const-wide/16 v10, 0x0

    .line 43
    .line 44
    cmp-long v0, v8, v10

    .line 45
    .line 46
    if-lez v0, :cond_2

    .line 47
    .line 48
    const-string v0, "If-Modified-Since"

    .line 49
    .line 50
    invoke-static {v8, v9}, Ll/dxr0;->c(J)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v8

    .line 54
    invoke-interface {v7, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_2
    move-object v0, v7

    .line 58
    :goto_1
    const-string v7, "application/x-www-form-urlencoded; charset=UTF-8"

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/jwr0;->o()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    new-instance v9, Ljava/util/HashMap;

    .line 65
    .line 66
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v9, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ll/jwr0;->p()Ljava/util/Map;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v9, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 77
    .line 78
    .line 79
    new-instance v0, Ljava/net/URL;

    .line 80
    .line 81
    invoke-direct {v0, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    check-cast v8, Ljava/net/HttpURLConnection;

    .line 89
    .line 90
    invoke-static {}, Ljava/net/HttpURLConnection;->getFollowRedirects()Z

    .line 91
    .line 92
    .line 93
    move-result v10

    .line 94
    invoke-virtual {v8, v10}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ll/jwr0;->a()I

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    invoke-virtual {v8, v10}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v8, v10}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 105
    .line 106
    .line 107
    const/4 v10, 0x0

    .line 108
    invoke-virtual {v8, v10}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 109
    .line 110
    .line 111
    const/4 v11, 0x1

    .line 112
    invoke-virtual {v8, v11}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    const-string v12, "https"

    .line 120
    .line 121
    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .line 123
    .line 124
    :try_start_1
    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 133
    .line 134
    .line 135
    move-result v12

    .line 136
    if-eqz v12, :cond_3

    .line 137
    .line 138
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v12

    .line 142
    check-cast v12, Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v9, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v13

    .line 148
    check-cast v13, Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v8, v12, v13}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :catchall_0
    move-exception v0

    .line 155
    goto :goto_4

    .line 156
    :cond_3
    invoke-virtual {v1}, Ll/jwr0;->zza()I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_5

    .line 161
    .line 162
    const-string v0, "POST"

    .line 163
    .line 164
    invoke-virtual {v8, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v1}, Ll/jwr0;->B()[B

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    if-eqz v0, :cond_6

    .line 172
    .line 173
    invoke-virtual {v8, v11}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v8}, Ljava/net/URLConnection;->getRequestProperties()Ljava/util/Map;

    .line 177
    .line 178
    .line 179
    move-result-object v9

    .line 180
    invoke-interface {v9, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v9

    .line 184
    if-nez v9, :cond_4

    .line 185
    .line 186
    invoke-virtual {v8, v3, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_4
    new-instance v7, Ljava/io/DataOutputStream;

    .line 190
    .line 191
    invoke-virtual {v8}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 192
    .line 193
    .line 194
    move-result-object v9

    .line 195
    invoke-direct {v7, v9}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v7, v0}, Ljava/io/OutputStream;->write([B)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_5
    const-string v0, "GET"

    .line 206
    .line 207
    invoke-virtual {v8, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_6
    :goto_3
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    const/4 v7, -0x1

    .line 215
    if-eq v0, v7, :cond_16

    .line 216
    .line 217
    invoke-virtual {v1}, Ll/jwr0;->zza()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    .line 219
    .line 220
    const/16 v9, 0x64

    .line 221
    .line 222
    const/16 v12, 0x130

    .line 223
    .line 224
    const/16 v13, 0xc8

    .line 225
    .line 226
    if-lt v0, v9, :cond_7

    .line 227
    .line 228
    if-lt v0, v13, :cond_8

    .line 229
    .line 230
    :cond_7
    const/16 v9, 0xcc

    .line 231
    .line 232
    if-eq v0, v9, :cond_8

    .line 233
    .line 234
    if-eq v0, v12, :cond_8

    .line 235
    .line 236
    :try_start_2
    new-instance v9, Ll/exr0;

    .line 237
    .line 238
    invoke-virtual {v8}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 239
    .line 240
    .line 241
    move-result-object v14

    .line 242
    invoke-static {v14}, Ll/txr0;->a(Ljava/util/Map;)Ljava/util/List;

    .line 243
    .line 244
    .line 245
    move-result-object v14

    .line 246
    invoke-virtual {v8}, Ljava/net/URLConnection;->getContentLength()I

    .line 247
    .line 248
    .line 249
    move-result v15

    .line 250
    new-instance v11, Ll/fxr0;

    .line 251
    .line 252
    invoke-direct {v11, v8}, Ll/fxr0;-><init>(Ljava/net/HttpURLConnection;)V

    .line 253
    .line 254
    .line 255
    invoke-direct {v9, v0, v14, v15, v11}, Ll/exr0;-><init>(ILjava/util/List;ILjava/io/InputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 256
    .line 257
    .line 258
    goto :goto_5

    .line 259
    :catchall_1
    move-exception v0

    .line 260
    const/4 v10, 0x1

    .line 261
    :goto_4
    move-object/from16 v12, p0

    .line 262
    .line 263
    goto/16 :goto_17

    .line 264
    .line 265
    :cond_8
    :try_start_3
    new-instance v9, Ll/exr0;

    .line 266
    .line 267
    invoke-virtual {v8}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 268
    .line 269
    .line 270
    move-result-object v11

    .line 271
    invoke-static {v11}, Ll/txr0;->a(Ljava/util/Map;)Ljava/util/List;

    .line 272
    .line 273
    .line 274
    move-result-object v11

    .line 275
    invoke-direct {v9, v0, v11, v7, v6}, Ll/exr0;-><init>(ILjava/util/List;ILjava/io/InputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 276
    .line 277
    .line 278
    :try_start_4
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 279
    .line 280
    .line 281
    :goto_5
    :try_start_5
    invoke-virtual {v9}, Ll/exr0;->b()I

    .line 282
    .line 283
    .line 284
    move-result v15

    .line 285
    invoke-virtual {v9}, Ll/exr0;->d()Ljava/util/List;

    .line 286
    .line 287
    .line 288
    move-result-object v20

    .line 289
    if-ne v15, v12, :cond_f

    .line 290
    .line 291
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 292
    .line 293
    .line 294
    move-result-wide v7

    .line 295
    sub-long v14, v7, v4

    .line 296
    .line 297
    invoke-virtual {v1}, Ll/jwr0;->f()Ll/kvr0;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    if-nez v0, :cond_9

    .line 302
    .line 303
    new-instance v16, Ll/vvr0;

    .line 304
    .line 305
    const/16 v18, 0x0

    .line 306
    .line 307
    const/16 v19, 0x1

    .line 308
    .line 309
    const/16 v17, 0x130

    .line 310
    .line 311
    move-object/from16 v22, v20

    .line 312
    .line 313
    move-wide/from16 v20, v14

    .line 314
    .line 315
    invoke-direct/range {v16 .. v22}, Ll/vvr0;-><init>(I[BZJLjava/util/List;)V

    .line 316
    .line 317
    .line 318
    goto/16 :goto_a

    .line 319
    .line 320
    :catch_1
    move-exception v0

    .line 321
    move-object/from16 v12, p0

    .line 322
    .line 323
    goto/16 :goto_16

    .line 324
    .line 325
    :cond_9
    move-object/from16 v8, v20

    .line 326
    .line 327
    new-instance v7, Ljava/util/TreeSet;

    .line 328
    .line 329
    sget-object v10, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    .line 330
    .line 331
    invoke-direct {v7, v10}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 332
    .line 333
    .line 334
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 335
    .line 336
    .line 337
    move-result v10

    .line 338
    if-nez v10, :cond_a

    .line 339
    .line 340
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 341
    .line 342
    .line 343
    move-result-object v10

    .line 344
    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 345
    .line 346
    .line 347
    move-result v11

    .line 348
    if-eqz v11, :cond_a

    .line 349
    .line 350
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object v11

    .line 354
    check-cast v11, Ll/svr0;

    .line 355
    .line 356
    invoke-virtual {v11}, Ll/svr0;->a()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v11

    .line 360
    invoke-interface {v7, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 361
    .line 362
    .line 363
    goto :goto_6

    .line 364
    :cond_a
    new-instance v10, Ljava/util/ArrayList;

    .line 365
    .line 366
    invoke-direct {v10, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 367
    .line 368
    .line 369
    iget-object v8, v0, Ll/kvr0;->h:Ljava/util/List;

    .line 370
    .line 371
    if-eqz v8, :cond_d

    .line 372
    .line 373
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    .line 374
    .line 375
    .line 376
    move-result v8

    .line 377
    if-nez v8, :cond_c

    .line 378
    .line 379
    iget-object v8, v0, Ll/kvr0;->h:Ljava/util/List;

    .line 380
    .line 381
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 382
    .line 383
    .line 384
    move-result-object v8

    .line 385
    :cond_b
    :goto_7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 386
    .line 387
    .line 388
    move-result v11

    .line 389
    if-eqz v11, :cond_c

    .line 390
    .line 391
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v11

    .line 395
    check-cast v11, Ll/svr0;

    .line 396
    .line 397
    invoke-virtual {v11}, Ll/svr0;->a()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v12

    .line 401
    invoke-interface {v7, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result v12

    .line 405
    if-nez v12, :cond_b

    .line 406
    .line 407
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    goto :goto_7

    .line 411
    :cond_c
    move-object/from16 v16, v10

    .line 412
    .line 413
    goto :goto_9

    .line 414
    :cond_d
    iget-object v8, v0, Ll/kvr0;->g:Ljava/util/Map;

    .line 415
    .line 416
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    .line 417
    .line 418
    .line 419
    move-result v8

    .line 420
    if-nez v8, :cond_c

    .line 421
    .line 422
    iget-object v8, v0, Ll/kvr0;->g:Ljava/util/Map;

    .line 423
    .line 424
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 425
    .line 426
    .line 427
    move-result-object v8

    .line 428
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 429
    .line 430
    .line 431
    move-result-object v8

    .line 432
    :cond_e
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 433
    .line 434
    .line 435
    move-result v11

    .line 436
    if-eqz v11, :cond_c

    .line 437
    .line 438
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v11

    .line 442
    check-cast v11, Ljava/util/Map$Entry;

    .line 443
    .line 444
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v12

    .line 448
    invoke-interface {v7, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 449
    .line 450
    .line 451
    move-result v12

    .line 452
    if-nez v12, :cond_e

    .line 453
    .line 454
    new-instance v12, Ll/svr0;

    .line 455
    .line 456
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v13

    .line 460
    check-cast v13, Ljava/lang/String;

    .line 461
    .line 462
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v11

    .line 466
    check-cast v11, Ljava/lang/String;

    .line 467
    .line 468
    invoke-direct {v12, v13, v11}, Ll/svr0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    goto :goto_8

    .line 475
    :goto_9
    new-instance v10, Ll/vvr0;

    .line 476
    .line 477
    iget-object v12, v0, Ll/kvr0;->a:[B

    .line 478
    .line 479
    const/4 v13, 0x1

    .line 480
    const/16 v11, 0x130

    .line 481
    .line 482
    invoke-direct/range {v10 .. v16}, Ll/vvr0;-><init>(I[BZJLjava/util/List;)V

    .line 483
    .line 484
    .line 485
    move-object/from16 v16, v10

    .line 486
    .line 487
    :goto_a
    return-object v16

    .line 488
    :cond_f
    move-object/from16 v8, v20

    .line 489
    .line 490
    invoke-virtual {v9}, Ll/exr0;->c()Ljava/io/InputStream;

    .line 491
    .line 492
    .line 493
    move-result-object v11

    .line 494
    if-eqz v11, :cond_11

    .line 495
    .line 496
    invoke-virtual {v9}, Ll/exr0;->a()I

    .line 497
    .line 498
    .line 499
    move-result v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 500
    move-object/from16 v12, p0

    .line 501
    .line 502
    :try_start_6
    iget-object v14, v12, Ll/vwr0;->b:Ll/xwr0;

    .line 503
    .line 504
    new-instance v6, Ll/wxr0;

    .line 505
    .line 506
    invoke-direct {v6, v14, v0}, Ll/wxr0;-><init>(Ll/xwr0;I)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 507
    .line 508
    .line 509
    const/16 v0, 0x400

    .line 510
    .line 511
    :try_start_7
    invoke-virtual {v14, v0}, Ll/xwr0;->b(I)[B

    .line 512
    .line 513
    .line 514
    move-result-object v13
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 515
    :goto_b
    :try_start_8
    invoke-virtual {v11, v13}, Ljava/io/InputStream;->read([B)I

    .line 516
    .line 517
    .line 518
    move-result v0

    .line 519
    if-eq v0, v7, :cond_10

    .line 520
    .line 521
    invoke-virtual {v6, v13, v10, v0}, Ll/wxr0;->write([BII)V

    .line 522
    .line 523
    .line 524
    goto :goto_b

    .line 525
    :catchall_2
    move-exception v0

    .line 526
    goto :goto_e

    .line 527
    :cond_10
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 528
    .line 529
    .line 530
    move-result-object v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 531
    :try_start_9
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    .line 532
    .line 533
    .line 534
    goto :goto_c

    .line 535
    :catch_2
    :try_start_a
    new-array v7, v10, [Ljava/lang/Object;

    .line 536
    .line 537
    invoke-static {v2, v7}, Ll/swr0;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 538
    .line 539
    .line 540
    :goto_c
    invoke-virtual {v14, v13}, Ll/xwr0;->a([B)V

    .line 541
    .line 542
    .line 543
    invoke-virtual {v6}, Ll/wxr0;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3

    .line 544
    .line 545
    .line 546
    :goto_d
    move-object v6, v0

    .line 547
    goto :goto_10

    .line 548
    :catch_3
    move-exception v0

    .line 549
    goto/16 :goto_16

    .line 550
    .line 551
    :catchall_3
    move-exception v0

    .line 552
    const/4 v13, 0x0

    .line 553
    :goto_e
    :try_start_b
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4

    .line 554
    .line 555
    .line 556
    goto :goto_f

    .line 557
    :catch_4
    :try_start_c
    new-array v7, v10, [Ljava/lang/Object;

    .line 558
    .line 559
    invoke-static {v2, v7}, Ll/swr0;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 560
    .line 561
    .line 562
    :goto_f
    invoke-virtual {v14, v13}, Ll/xwr0;->a([B)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {v6}, Ll/wxr0;->close()V

    .line 566
    .line 567
    .line 568
    throw v0

    .line 569
    :cond_11
    move-object/from16 v12, p0

    .line 570
    .line 571
    new-array v0, v10, [B
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_3

    .line 572
    .line 573
    goto :goto_d

    .line 574
    :goto_10
    :try_start_d
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 575
    .line 576
    .line 577
    move-result-wide v10

    .line 578
    sub-long/2addr v10, v4

    .line 579
    sget-boolean v0, Ll/swr0;->b:Z

    .line 580
    .line 581
    if-nez v0, :cond_13

    .line 582
    .line 583
    const-wide/16 v13, 0xbb8

    .line 584
    .line 585
    cmp-long v0, v10, v13

    .line 586
    .line 587
    if-lez v0, :cond_12

    .line 588
    .line 589
    goto :goto_12

    .line 590
    :cond_12
    :goto_11
    const/16 v0, 0xc8

    .line 591
    .line 592
    goto :goto_14

    .line 593
    :cond_13
    :goto_12
    const-string v0, "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]"

    .line 594
    .line 595
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 596
    .line 597
    .line 598
    move-result-object v7

    .line 599
    if-eqz v6, :cond_14

    .line 600
    .line 601
    array-length v10, v6

    .line 602
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 603
    .line 604
    .line 605
    move-result-object v10

    .line 606
    goto :goto_13

    .line 607
    :catch_5
    move-exception v0

    .line 608
    move-object/from16 v16, v6

    .line 609
    .line 610
    goto :goto_15

    .line 611
    :cond_14
    const-string v10, "null"

    .line 612
    .line 613
    :goto_13
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 614
    .line 615
    .line 616
    move-result-object v11

    .line 617
    invoke-virtual {v1}, Ll/jwr0;->C()Ll/ovr0;

    .line 618
    .line 619
    .line 620
    move-result-object v13

    .line 621
    invoke-virtual {v13}, Ll/ovr0;->a()I

    .line 622
    .line 623
    .line 624
    move-result v13

    .line 625
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 626
    .line 627
    .line 628
    move-result-object v13

    .line 629
    filled-new-array {v1, v7, v10, v11, v13}, [Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v7

    .line 633
    invoke-static {v0, v7}, Ll/swr0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 634
    .line 635
    .line 636
    goto :goto_11

    .line 637
    :goto_14
    if-lt v15, v0, :cond_15

    .line 638
    .line 639
    const/16 v0, 0x12b

    .line 640
    .line 641
    if-gt v15, v0, :cond_15

    .line 642
    .line 643
    new-instance v14, Ll/vvr0;

    .line 644
    .line 645
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 646
    .line 647
    .line 648
    move-result-wide v10
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_5

    .line 649
    sub-long v18, v10, v4

    .line 650
    .line 651
    const/16 v17, 0x0

    .line 652
    .line 653
    move-object/from16 v16, v6

    .line 654
    .line 655
    move-object/from16 v20, v8

    .line 656
    .line 657
    :try_start_e
    invoke-direct/range {v14 .. v20}, Ll/vvr0;-><init>(I[BZJLjava/util/List;)V

    .line 658
    .line 659
    .line 660
    return-object v14

    .line 661
    :catch_6
    move-exception v0

    .line 662
    goto :goto_15

    .line 663
    :cond_15
    move-object/from16 v16, v6

    .line 664
    .line 665
    new-instance v0, Ljava/io/IOException;

    .line 666
    .line 667
    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    .line 668
    .line 669
    .line 670
    throw v0
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_6

    .line 671
    :goto_15
    move-object/from16 v15, v16

    .line 672
    .line 673
    goto :goto_1a

    .line 674
    :goto_16
    const/4 v15, 0x0

    .line 675
    goto :goto_1a

    .line 676
    :cond_16
    move-object/from16 v12, p0

    .line 677
    .line 678
    :try_start_f
    new-instance v0, Ljava/io/IOException;

    .line 679
    .line 680
    const-string v6, "Could not retrieve response code from HttpUrlConnection."

    .line 681
    .line 682
    invoke-direct {v0, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 683
    .line 684
    .line 685
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 686
    :catchall_4
    move-exception v0

    .line 687
    :goto_17
    if-nez v10, :cond_17

    .line 688
    .line 689
    :try_start_10
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 690
    .line 691
    .line 692
    goto :goto_18

    .line 693
    :catch_7
    move-exception v0

    .line 694
    goto :goto_19

    .line 695
    :cond_17
    :goto_18
    throw v0
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_7

    .line 696
    :goto_19
    const/4 v9, 0x0

    .line 697
    goto :goto_16

    .line 698
    :goto_1a
    instance-of v6, v0, Ljava/net/SocketTimeoutException;

    .line 699
    .line 700
    if-eqz v6, :cond_18

    .line 701
    .line 702
    new-instance v0, Ll/vxr0;

    .line 703
    .line 704
    new-instance v6, Lcom/google/android/gms/internal/ads/zzaqi;

    .line 705
    .line 706
    invoke-direct {v6}, Lcom/google/android/gms/internal/ads/zzaqi;-><init>()V

    .line 707
    .line 708
    .line 709
    const-string v7, "socket"

    .line 710
    .line 711
    const/4 v8, 0x0

    .line 712
    invoke-direct {v0, v7, v6, v8}, Ll/vxr0;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzaqj;Ll/uxr0;)V

    .line 713
    .line 714
    .line 715
    :goto_1b
    move-object v6, v0

    .line 716
    goto :goto_1d

    .line 717
    :cond_18
    instance-of v6, v0, Ljava/net/MalformedURLException;

    .line 718
    .line 719
    if-nez v6, :cond_1e

    .line 720
    .line 721
    if-eqz v9, :cond_1d

    .line 722
    .line 723
    invoke-virtual {v9}, Ll/exr0;->b()I

    .line 724
    .line 725
    .line 726
    move-result v14

    .line 727
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 728
    .line 729
    .line 730
    move-result-object v0

    .line 731
    invoke-virtual {v1}, Ll/jwr0;->o()Ljava/lang/String;

    .line 732
    .line 733
    .line 734
    move-result-object v6

    .line 735
    filled-new-array {v0, v6}, [Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v0

    .line 739
    const-string v6, "Unexpected response code %d for %s"

    .line 740
    .line 741
    invoke-static {v6, v0}, Ll/swr0;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 742
    .line 743
    .line 744
    if-eqz v15, :cond_1c

    .line 745
    .line 746
    invoke-virtual {v9}, Ll/exr0;->d()Ljava/util/List;

    .line 747
    .line 748
    .line 749
    move-result-object v19

    .line 750
    new-instance v13, Ll/vvr0;

    .line 751
    .line 752
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 753
    .line 754
    .line 755
    move-result-wide v6

    .line 756
    sub-long v17, v6, v4

    .line 757
    .line 758
    const/16 v16, 0x0

    .line 759
    .line 760
    invoke-direct/range {v13 .. v19}, Ll/vvr0;-><init>(I[BZJLjava/util/List;)V

    .line 761
    .line 762
    .line 763
    const/16 v0, 0x191

    .line 764
    .line 765
    if-eq v14, v0, :cond_1b

    .line 766
    .line 767
    const/16 v0, 0x193

    .line 768
    .line 769
    if-ne v14, v0, :cond_19

    .line 770
    .line 771
    goto :goto_1c

    .line 772
    :cond_19
    const/16 v0, 0x190

    .line 773
    .line 774
    if-lt v14, v0, :cond_1a

    .line 775
    .line 776
    const/16 v0, 0x1f3

    .line 777
    .line 778
    if-gt v14, v0, :cond_1a

    .line 779
    .line 780
    new-instance v0, Lcom/google/android/gms/internal/ads/zzapn;

    .line 781
    .line 782
    invoke-direct {v0, v13}, Lcom/google/android/gms/internal/ads/zzapn;-><init>(Ll/vvr0;)V

    .line 783
    .line 784
    .line 785
    throw v0

    .line 786
    :cond_1a
    new-instance v0, Lcom/google/android/gms/internal/ads/zzaqh;

    .line 787
    .line 788
    invoke-direct {v0, v13}, Lcom/google/android/gms/internal/ads/zzaqh;-><init>(Ll/vvr0;)V

    .line 789
    .line 790
    .line 791
    throw v0

    .line 792
    :cond_1b
    :goto_1c
    new-instance v0, Ll/vxr0;

    .line 793
    .line 794
    new-instance v6, Lcom/google/android/gms/internal/ads/zzapi;

    .line 795
    .line 796
    invoke-direct {v6, v13}, Lcom/google/android/gms/internal/ads/zzapi;-><init>(Ll/vvr0;)V

    .line 797
    .line 798
    .line 799
    const-string v7, "auth"

    .line 800
    .line 801
    const/4 v8, 0x0

    .line 802
    invoke-direct {v0, v7, v6, v8}, Ll/vxr0;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzaqj;Ll/uxr0;)V

    .line 803
    .line 804
    .line 805
    goto :goto_1b

    .line 806
    :cond_1c
    const/4 v8, 0x0

    .line 807
    new-instance v0, Ll/vxr0;

    .line 808
    .line 809
    new-instance v6, Lcom/google/android/gms/internal/ads/zzapv;

    .line 810
    .line 811
    invoke-direct {v6}, Lcom/google/android/gms/internal/ads/zzapv;-><init>()V

    .line 812
    .line 813
    .line 814
    const-string v7, "network"

    .line 815
    .line 816
    invoke-direct {v0, v7, v6, v8}, Ll/vxr0;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzaqj;Ll/uxr0;)V

    .line 817
    .line 818
    .line 819
    goto :goto_1b

    .line 820
    :goto_1d
    invoke-virtual {v1}, Ll/jwr0;->C()Ll/ovr0;

    .line 821
    .line 822
    .line 823
    move-result-object v0

    .line 824
    invoke-virtual {v1}, Ll/jwr0;->a()I

    .line 825
    .line 826
    .line 827
    move-result v7

    .line 828
    :try_start_11
    invoke-static {v6}, Ll/vxr0;->a(Ll/vxr0;)Lcom/google/android/gms/internal/ads/zzaqj;

    .line 829
    .line 830
    .line 831
    move-result-object v8

    .line 832
    invoke-virtual {v0, v8}, Ll/ovr0;->c(Lcom/google/android/gms/internal/ads/zzaqj;)V
    :try_end_11
    .catch Lcom/google/android/gms/internal/ads/zzaqj; {:try_start_11 .. :try_end_11} :catch_8

    .line 833
    .line 834
    .line 835
    invoke-static {v6}, Ll/vxr0;->b(Ll/vxr0;)Ljava/lang/String;

    .line 836
    .line 837
    .line 838
    move-result-object v0

    .line 839
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 840
    .line 841
    .line 842
    move-result-object v6

    .line 843
    filled-new-array {v0, v6}, [Ljava/lang/Object;

    .line 844
    .line 845
    .line 846
    move-result-object v0

    .line 847
    const-string v6, "%s-retry [timeout=%s]"

    .line 848
    .line 849
    invoke-static {v6, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 850
    .line 851
    .line 852
    move-result-object v0

    .line 853
    invoke-virtual {v1, v0}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 854
    .line 855
    .line 856
    goto/16 :goto_0

    .line 857
    .line 858
    :catch_8
    move-exception v0

    .line 859
    invoke-static {v6}, Ll/vxr0;->b(Ll/vxr0;)Ljava/lang/String;

    .line 860
    .line 861
    .line 862
    move-result-object v2

    .line 863
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 864
    .line 865
    .line 866
    move-result-object v3

    .line 867
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 868
    .line 869
    .line 870
    move-result-object v2

    .line 871
    const-string v3, "%s-timeout-giveup [timeout=%s]"

    .line 872
    .line 873
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 874
    .line 875
    .line 876
    move-result-object v2

    .line 877
    invoke-virtual {v1, v2}, Ll/jwr0;->q(Ljava/lang/String;)V

    .line 878
    .line 879
    .line 880
    throw v0

    .line 881
    :cond_1d
    new-instance v1, Lcom/google/android/gms/internal/ads/zzapx;

    .line 882
    .line 883
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/ads/zzapx;-><init>(Ljava/lang/Throwable;)V

    .line 884
    .line 885
    .line 886
    throw v1

    .line 887
    :cond_1e
    invoke-virtual {v1}, Ll/jwr0;->o()Ljava/lang/String;

    .line 888
    .line 889
    .line 890
    move-result-object v1

    .line 891
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 892
    .line 893
    .line 894
    move-result-object v1

    .line 895
    const-string v2, "Bad URL "

    .line 896
    .line 897
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 898
    .line 899
    .line 900
    move-result-object v1

    .line 901
    invoke-static {v1, v0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 902
    .line 903
    .line 904
    const/16 v21, 0x0

    .line 905
    .line 906
    return-object v21
.end method

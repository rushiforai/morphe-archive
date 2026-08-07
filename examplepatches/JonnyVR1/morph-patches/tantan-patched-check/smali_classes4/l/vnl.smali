.class public Ll/vnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/msl;


# instance fields
.field public a:Ll/u6e;

.field public b:Ll/xul;


# direct methods
.method public constructor <init>(Ll/u6e;Ll/xul;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vnl;->a:Ll/u6e;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vnl;->b:Ll/xul;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/util/HashSet;Z)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_b

    .line 8
    .line 9
    :cond_0
    sget-object v0, Ll/tv5;->a:[Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    move v4, v0

    .line 21
    move v5, v4

    .line 22
    move-object v2, v1

    .line 23
    move-object v3, v2

    .line 24
    :cond_1
    :goto_0
    const/4 v6, 0x2

    .line 25
    if-gt v4, v6, :cond_15

    .line 26
    .line 27
    if-nez v5, :cond_15

    .line 28
    .line 29
    const/4 v6, 0x1

    .line 30
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v8, "https://tm.tantanapp.com/v2/tantantm/httpdns"

    .line 36
    .line 37
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v8, "?domains="

    .line 41
    .line 42
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v9

    .line 53
    if-eqz v9, :cond_2

    .line 54
    .line 55
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    check-cast v9, Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v9, ","

    .line 65
    .line 66
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto/16 :goto_a

    .line 72
    .line 73
    :catch_0
    move-exception v7

    .line 74
    goto/16 :goto_9

    .line 75
    .line 76
    :cond_2
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    sub-int/2addr v8, v6

    .line 81
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v8, "&app_id="

    .line 85
    .line 86
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    sget-object v8, Ll/vml;->g:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    if-eqz p2, :cond_3

    .line 95
    .line 96
    const-string v8, "&health=true"

    .line 97
    .line 98
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    :cond_3
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    new-instance v8, Ljava/net/URL;

    .line 106
    .line 107
    invoke-direct {v8, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    sget-object v9, Ll/tv5;->a:[Ljava/lang/String;

    .line 111
    .line 112
    aget-object v9, v9, v0

    .line 113
    .line 114
    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    invoke-virtual {v7, v10, v9}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    new-instance v9, Ljava/net/URL;

    .line 123
    .line 124
    invoke-direct {v9, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    check-cast v7, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    .line 133
    :try_start_1
    iget-object v3, p0, Ll/vnl;->b:Ll/xul;

    .line 134
    .line 135
    invoke-interface {v3}, Ll/xul;->getHeader()Ljava/util/HashMap;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    if-eqz v3, :cond_5

    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    :cond_4
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 150
    .line 151
    .line 152
    move-result v9

    .line 153
    if-eqz v9, :cond_5

    .line 154
    .line 155
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    check-cast v9, Ljava/util/Map$Entry;

    .line 160
    .line 161
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v10

    .line 165
    check-cast v10, Ljava/lang/String;

    .line 166
    .line 167
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v9

    .line 171
    check-cast v9, Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result v11

    .line 177
    if-nez v11, :cond_4

    .line 178
    .line 179
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 180
    .line 181
    .line 182
    move-result v11

    .line 183
    if-nez v11, :cond_4

    .line 184
    .line 185
    invoke-virtual {v7, v10, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    goto :goto_2

    .line 189
    :catchall_1
    move-exception p0

    .line 190
    :goto_3
    move-object v3, v7

    .line 191
    goto/16 :goto_a

    .line 192
    .line 193
    :catch_1
    move-exception v3

    .line 194
    move-object v12, v7

    .line 195
    move-object v7, v3

    .line 196
    :goto_4
    move-object v3, v12

    .line 197
    goto/16 :goto_9

    .line 198
    .line 199
    :cond_5
    const-string v3, "host"

    .line 200
    .line 201
    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v9

    .line 205
    invoke-virtual {v7, v3, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    new-instance v3, Ll/vnl$a;

    .line 209
    .line 210
    invoke-direct {v3, p0, v7}, Ll/vnl$a;-><init>(Ll/vnl;Ljavax/net/ssl/HttpsURLConnection;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v7, v3}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 214
    .line 215
    .line 216
    const/16 v3, 0x1388

    .line 217
    .line 218
    invoke-virtual {v7, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 219
    .line 220
    .line 221
    const/16 v3, 0x2710

    .line 222
    .line 223
    invoke-virtual {v7, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 224
    .line 225
    .line 226
    const-string v3, "GET"

    .line 227
    .line 228
    invoke-virtual {v7, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v7}, Ljava/net/URLConnection;->connect()V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    const/16 v9, 0xc8

    .line 239
    .line 240
    if-ne v3, v9, :cond_b

    .line 241
    .line 242
    invoke-virtual {v7}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    new-instance v3, Ljava/io/BufferedReader;

    .line 247
    .line 248
    new-instance v9, Ljava/io/InputStreamReader;

    .line 249
    .line 250
    invoke-direct {v9, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 251
    .line 252
    .line 253
    invoke-direct {v3, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 254
    .line 255
    .line 256
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 259
    .line 260
    .line 261
    :goto_5
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v9

    .line 265
    if-eqz v9, :cond_6

    .line 266
    .line 267
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 268
    .line 269
    .line 270
    goto :goto_5

    .line 271
    :catchall_2
    move-exception p0

    .line 272
    move-object v2, v3

    .line 273
    goto :goto_3

    .line 274
    :catch_2
    move-exception v2

    .line 275
    move-object v12, v7

    .line 276
    move-object v7, v2

    .line 277
    move-object v2, v3

    .line 278
    goto :goto_4

    .line 279
    :cond_6
    :try_start_3
    new-instance v5, Lcom/tantanapp/httpdns/model/DataModel;

    .line 280
    .line 281
    invoke-direct {v5}, Lcom/tantanapp/httpdns/model/DataModel;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v9

    .line 288
    invoke-static {v9}, Ll/c6c;->c(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/MetaModel;

    .line 289
    .line 290
    .line 291
    move-result-object v9

    .line 292
    iput-object v9, v5, Lcom/tantanapp/httpdns/model/DataModel;->meta:Lcom/tantanapp/httpdns/model/MetaModel;

    .line 293
    .line 294
    new-instance v9, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    .line 298
    .line 299
    const-string v10, "HttpUrlNetWorkRequest httpdns url:"

    .line 300
    .line 301
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string v8, " request success! result:"

    .line 308
    .line 309
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v8

    .line 316
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v8

    .line 323
    invoke-static {v8}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    iget-object v8, v5, Lcom/tantanapp/httpdns/model/DataModel;->meta:Lcom/tantanapp/httpdns/model/MetaModel;

    .line 327
    .line 328
    if-eqz v8, :cond_9

    .line 329
    .line 330
    iget v8, v8, Lcom/tantanapp/httpdns/model/MetaModel;->retcode:I

    .line 331
    .line 332
    invoke-static {v8}, Ll/v900;->a(I)Z

    .line 333
    .line 334
    .line 335
    move-result v8

    .line 336
    if-nez v8, :cond_9

    .line 337
    .line 338
    invoke-static {}, Ll/vml;->c()Ll/vml;

    .line 339
    .line 340
    .line 341
    move-result-object v2

    .line 342
    invoke-virtual {v2}, Ll/vml;->b()Z

    .line 343
    .line 344
    .line 345
    move-result v2

    .line 346
    if-eqz v2, :cond_7

    .line 347
    .line 348
    iget-object v2, p0, Ll/vnl;->a:Ll/u6e;

    .line 349
    .line 350
    invoke-virtual {v2}, Ll/u6e;->g()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 351
    .line 352
    .line 353
    goto :goto_6

    .line 354
    :catch_3
    move-exception v2

    .line 355
    move-object v5, v7

    .line 356
    move-object v7, v2

    .line 357
    move-object v2, v3

    .line 358
    move-object v3, v5

    .line 359
    move v5, v6

    .line 360
    goto/16 :goto_9

    .line 361
    .line 362
    :cond_7
    :goto_6
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 363
    .line 364
    .line 365
    :catch_4
    if-eqz v1, :cond_8

    .line 366
    .line 367
    :try_start_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 368
    .line 369
    .line 370
    :catch_5
    :cond_8
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 371
    .line 372
    .line 373
    return-void

    .line 374
    :cond_9
    :try_start_6
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    invoke-static {v2}, Ll/c6c;->a(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    iput-object v2, v5, Lcom/tantanapp/httpdns/model/DataModel;->domainModels:Ljava/util/ArrayList;

    .line 383
    .line 384
    if-eqz v2, :cond_a

    .line 385
    .line 386
    iget-object v5, p0, Ll/vnl;->a:Ll/u6e;

    .line 387
    .line 388
    invoke-virtual {v5, v2}, Ll/u6e;->j(Ljava/util/ArrayList;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 389
    .line 390
    .line 391
    :cond_a
    move-object v2, v3

    .line 392
    move v5, v6

    .line 393
    goto :goto_8

    .line 394
    :cond_b
    const/16 v8, 0x1f4

    .line 395
    .line 396
    if-eq v3, v8, :cond_d

    .line 397
    .line 398
    const/16 v8, 0x1f7

    .line 399
    .line 400
    if-ne v3, v8, :cond_c

    .line 401
    .line 402
    goto :goto_7

    .line 403
    :cond_c
    add-int/lit8 v4, v4, 0x3

    .line 404
    .line 405
    :try_start_7
    new-instance v8, Ljava/lang/StringBuilder;

    .line 406
    .line 407
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 408
    .line 409
    .line 410
    const-string v9, "request fail,code: "

    .line 411
    .line 412
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    const-string v3, " ,will not retry!"

    .line 419
    .line 420
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v3

    .line 427
    invoke-static {v3}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    goto :goto_8

    .line 431
    :cond_d
    :goto_7
    add-int/lit8 v4, v4, 0x1

    .line 432
    .line 433
    new-instance v8, Ljava/lang/StringBuilder;

    .line 434
    .line 435
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 436
    .line 437
    .line 438
    const-string v9, "request fail code:"

    .line 439
    .line 440
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    const-string v3, " retry:"

    .line 447
    .line 448
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v3

    .line 458
    invoke-static {v3}, Ll/r6e;->a(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 459
    .line 460
    .line 461
    :goto_8
    if-eqz v2, :cond_e

    .line 462
    .line 463
    :try_start_8
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 464
    .line 465
    .line 466
    :catch_6
    :cond_e
    if-eqz v1, :cond_f

    .line 467
    .line 468
    :try_start_9
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    .line 469
    .line 470
    .line 471
    :catch_7
    :cond_f
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 472
    .line 473
    .line 474
    move-object v3, v7

    .line 475
    goto/16 :goto_0

    .line 476
    .line 477
    :goto_9
    :try_start_a
    new-instance v8, Ljava/lang/StringBuilder;

    .line 478
    .line 479
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v7

    .line 486
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    .line 488
    .line 489
    const-string v7, " exception retry!!!"

    .line 490
    .line 491
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v7

    .line 498
    invoke-static {v7}, Ll/r6e;->a(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 499
    .line 500
    .line 501
    add-int/2addr v4, v6

    .line 502
    if-eqz v2, :cond_10

    .line 503
    .line 504
    :try_start_b
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8

    .line 505
    .line 506
    .line 507
    :catch_8
    :cond_10
    if-eqz v1, :cond_11

    .line 508
    .line 509
    :try_start_c
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_9

    .line 510
    .line 511
    .line 512
    :catch_9
    :cond_11
    if-eqz v3, :cond_1

    .line 513
    .line 514
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 515
    .line 516
    .line 517
    goto/16 :goto_0

    .line 518
    .line 519
    :goto_a
    if-eqz v2, :cond_12

    .line 520
    .line 521
    :try_start_d
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_a

    .line 522
    .line 523
    .line 524
    :catch_a
    :cond_12
    if-eqz v1, :cond_13

    .line 525
    .line 526
    :try_start_e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_b

    .line 527
    .line 528
    .line 529
    :catch_b
    :cond_13
    if-eqz v3, :cond_14

    .line 530
    .line 531
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 532
    .line 533
    .line 534
    :cond_14
    throw p0

    .line 535
    :cond_15
    :goto_b
    return-void
.end method

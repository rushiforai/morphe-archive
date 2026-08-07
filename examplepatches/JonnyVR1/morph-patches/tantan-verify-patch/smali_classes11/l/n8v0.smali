.class public final Ll/n8v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Ll/b5t0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/b5t0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n8v0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/n8v0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/n8v0;->c:Ll/b5t0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/g8v0;)Ll/h8v0;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzead;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "Received error HTTP response code: "

    .line 6
    .line 7
    const-string v3, "AdRequestServiceImpl: Sending request: "

    .line 8
    .line 9
    const-string v4, "SDK version: "

    .line 10
    .line 11
    iget-object v5, v1, Ll/g8v0;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget v12, v1, Ll/g8v0;->b:I

    .line 14
    .line 15
    iget-object v13, v1, Ll/g8v0;->c:Ljava/util/Map;

    .line 16
    .line 17
    iget-object v14, v1, Ll/g8v0;->d:[B

    .line 18
    .line 19
    iget-object v1, v1, Ll/g8v0;->e:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-interface {v6}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v15

    .line 29
    const/4 v6, 0x1

    .line 30
    :try_start_0
    new-instance v7, Ll/h8v0;

    .line 31
    .line 32
    invoke-direct {v7}, Ll/h8v0;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v8, v0, Ll/n8v0;->b:Ljava/lang/String;

    .line 36
    .line 37
    new-instance v9, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {v4}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v3}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v3, Ljava/net/URL;

    .line 68
    .line 69
    invoke-direct {v3, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    new-instance v4, Ljava/util/HashMap;

    .line 73
    .line 74
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 75
    .line 76
    .line 77
    const/4 v5, 0x0

    .line 78
    :goto_0
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    move-object v10, v3

    .line 83
    check-cast v10, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 84
    .line 85
    move v3, v6

    .line 86
    :try_start_1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 87
    .line 88
    .line 89
    move-result-object v6
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    move-object v8, v7

    .line 91
    :try_start_2
    iget-object v7, v0, Ll/n8v0;->a:Landroid/content/Context;
    :try_end_2
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 92
    .line 93
    move-object v9, v8

    .line 94
    :try_start_3
    iget-object v8, v0, Ll/n8v0;->b:Ljava/lang/String;
    :try_end_3
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    .line 96
    move-object v11, v9

    .line 97
    const/4 v9, 0x0

    .line 98
    move-object/from16 v17, v11

    .line 99
    .line 100
    const/4 v11, 0x0

    .line 101
    move/from16 p1, v5

    .line 102
    .line 103
    move v5, v3

    .line 104
    move-object/from16 v3, v17

    .line 105
    .line 106
    :try_start_4
    invoke-virtual/range {v6 .. v12}, Lcom/google/android/gms/ads/internal/util/b;->H(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;ZI)V

    .line 107
    .line 108
    .line 109
    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    if-eqz v7, :cond_0

    .line 122
    .line 123
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    check-cast v7, Ljava/util/Map$Entry;

    .line 128
    .line 129
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v8

    .line 133
    check-cast v8, Ljava/lang/String;

    .line 134
    .line 135
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    check-cast v7, Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v10, v8, v7}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :catchall_0
    move-exception v0

    .line 146
    goto/16 :goto_9

    .line 147
    .line 148
    :catch_0
    move-exception v0

    .line 149
    goto/16 :goto_8

    .line 150
    .line 151
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    if-nez v6, :cond_1

    .line 156
    .line 157
    const-string v6, "Content-Type"

    .line 158
    .line 159
    invoke-virtual {v10, v6, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_1
    array-length v6, v14

    .line 163
    const/4 v7, 0x0

    .line 164
    if-lez v6, :cond_2

    .line 165
    .line 166
    invoke-virtual {v10, v5}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v10, v6}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_4
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 170
    .line 171
    .line 172
    :try_start_5
    new-instance v6, Ljava/io/BufferedOutputStream;

    .line 173
    .line 174
    invoke-virtual {v10}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 175
    .line 176
    .line 177
    move-result-object v8

    .line 178
    invoke-direct {v6, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 179
    .line 180
    .line 181
    :try_start_6
    invoke-virtual {v6, v14}, Ljava/io/OutputStream;->write([B)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 182
    .line 183
    .line 184
    :try_start_7
    invoke-static {v6}, Lcom/google/android/gms/common/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 185
    .line 186
    .line 187
    goto :goto_3

    .line 188
    :catchall_1
    move-exception v0

    .line 189
    move-object v7, v6

    .line 190
    goto :goto_2

    .line 191
    :catchall_2
    move-exception v0

    .line 192
    :goto_2
    invoke-static {v7}, Lcom/google/android/gms/common/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 193
    .line 194
    .line 195
    throw v0

    .line 196
    :cond_2
    :goto_3
    new-instance v6, Ll/cct0;

    .line 197
    .line 198
    invoke-direct {v6, v7}, Ll/cct0;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v6, v10, v14}, Ll/cct0;->c(Ljava/net/HttpURLConnection;[B)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    invoke-virtual {v10}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 209
    .line 210
    .line 211
    move-result-object v9

    .line 212
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 213
    .line 214
    .line 215
    move-result-object v9

    .line 216
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 217
    .line 218
    .line 219
    move-result-object v9

    .line 220
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 221
    .line 222
    .line 223
    move-result v11
    :try_end_7
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 224
    if-eqz v11, :cond_4

    .line 225
    .line 226
    :try_start_8
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v11

    .line 230
    check-cast v11, Ljava/util/Map$Entry;

    .line 231
    .line 232
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v17

    .line 236
    move-object/from16 v7, v17

    .line 237
    .line 238
    check-cast v7, Ljava/lang/String;

    .line 239
    .line 240
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v11

    .line 244
    check-cast v11, Ljava/util/List;

    .line 245
    .line 246
    invoke-interface {v4, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v17
    :try_end_8
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 250
    if-eqz v17, :cond_3

    .line 251
    .line 252
    :try_start_9
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    check-cast v7, Ljava/util/List;

    .line 257
    .line 258
    invoke-interface {v7, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 259
    .line 260
    .line 261
    :goto_5
    const/4 v7, 0x0

    .line 262
    goto :goto_4

    .line 263
    :cond_3
    move/from16 v17, v5

    .line 264
    .line 265
    new-instance v5, Ljava/util/ArrayList;

    .line 266
    .line 267
    invoke-direct {v5, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 268
    .line 269
    .line 270
    invoke-interface {v4, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move/from16 v5, v17

    .line 274
    .line 275
    goto :goto_5

    .line 276
    :catchall_3
    move-exception v0

    .line 277
    move/from16 v17, v5

    .line 278
    .line 279
    goto/16 :goto_9

    .line 280
    .line 281
    :catch_1
    move-exception v0

    .line 282
    move/from16 v17, v5

    .line 283
    .line 284
    goto/16 :goto_8

    .line 285
    .line 286
    :cond_4
    move/from16 v17, v5

    .line 287
    .line 288
    invoke-virtual {v6, v10, v8}, Ll/cct0;->e(Ljava/net/HttpURLConnection;I)V

    .line 289
    .line 290
    .line 291
    iput v8, v3, Ll/h8v0;->a:I

    .line 292
    .line 293
    iput-object v4, v3, Ll/h8v0;->b:Ljava/util/Map;

    .line 294
    .line 295
    const-string v5, ""

    .line 296
    .line 297
    iput-object v5, v3, Ll/h8v0;->c:Ljava/lang/String;
    :try_end_9
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 298
    .line 299
    const/16 v5, 0xc8

    .line 300
    .line 301
    const/16 v7, 0x12c

    .line 302
    .line 303
    if-lt v8, v5, :cond_7

    .line 304
    .line 305
    if-ge v8, v7, :cond_7

    .line 306
    .line 307
    :try_start_a
    new-instance v1, Ljava/io/InputStreamReader;

    .line 308
    .line 309
    invoke-virtual {v10}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 314
    .line 315
    .line 316
    :try_start_b
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 317
    .line 318
    .line 319
    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/b;->m(Ljava/io/InputStreamReader;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 323
    :try_start_c
    invoke-static {v1}, Lcom/google/android/gms/common/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v6, v0}, Ll/cct0;->g(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    iput-object v0, v3, Ll/h8v0;->c:Ljava/lang/String;

    .line 330
    .line 331
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    if-eqz v0, :cond_6

    .line 336
    .line 337
    sget-object v0, Ll/sgs0;->t5:Ll/dgs0;

    .line 338
    .line 339
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    check-cast v0, Ljava/lang/Boolean;

    .line 348
    .line 349
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_5

    .line 354
    .line 355
    goto :goto_6

    .line 356
    :cond_5
    new-instance v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 357
    .line 358
    const/4 v1, 0x3

    .line 359
    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(I)V

    .line 360
    .line 361
    .line 362
    throw v0

    .line 363
    :cond_6
    :goto_6
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 368
    .line 369
    .line 370
    move-result-wide v0

    .line 371
    sub-long/2addr v0, v15

    .line 372
    iput-wide v0, v3, Ll/h8v0;->d:J
    :try_end_c
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 373
    .line 374
    :try_start_d
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_2

    .line 375
    .line 376
    .line 377
    return-object v3

    .line 378
    :catch_2
    move-exception v0

    .line 379
    goto/16 :goto_a

    .line 380
    .line 381
    :catchall_4
    move-exception v0

    .line 382
    move-object v7, v1

    .line 383
    goto :goto_7

    .line 384
    :catchall_5
    move-exception v0

    .line 385
    const/4 v7, 0x0

    .line 386
    :goto_7
    :try_start_e
    invoke-static {v7}, Lcom/google/android/gms/common/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 387
    .line 388
    .line 389
    throw v0

    .line 390
    :cond_7
    if-lt v8, v7, :cond_a

    .line 391
    .line 392
    const/16 v5, 0x190

    .line 393
    .line 394
    if-ge v8, v5, :cond_a

    .line 395
    .line 396
    const-string v5, "Location"

    .line 397
    .line 398
    invoke-virtual {v10, v5}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v5

    .line 402
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 403
    .line 404
    .line 405
    move-result v6

    .line 406
    if-nez v6, :cond_9

    .line 407
    .line 408
    new-instance v6, Ljava/net/URL;

    .line 409
    .line 410
    invoke-direct {v6, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    add-int/lit8 v5, p1, 0x1

    .line 414
    .line 415
    sget-object v7, Ll/sgs0;->T4:Ll/dgs0;

    .line 416
    .line 417
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 418
    .line 419
    .line 420
    move-result-object v8

    .line 421
    invoke-virtual {v8, v7}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v7

    .line 425
    check-cast v7, Ljava/lang/Integer;

    .line 426
    .line 427
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 428
    .line 429
    .line 430
    move-result v7
    :try_end_e
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 431
    if-gt v5, v7, :cond_8

    .line 432
    .line 433
    :try_start_f
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_2

    .line 434
    .line 435
    .line 436
    move-object v7, v3

    .line 437
    move-object v3, v6

    .line 438
    move/from16 v6, v17

    .line 439
    .line 440
    goto/16 :goto_0

    .line 441
    .line 442
    :cond_8
    :try_start_10
    const-string v0, "Too many redirects."

    .line 443
    .line 444
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 445
    .line 446
    .line 447
    new-instance v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 448
    .line 449
    const-string v1, "Too many redirects"

    .line 450
    .line 451
    move/from16 v5, v17

    .line 452
    .line 453
    invoke-direct {v0, v5, v1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(ILjava/lang/String;)V

    .line 454
    .line 455
    .line 456
    throw v0

    .line 457
    :cond_9
    const-string v0, "No location header to follow redirect."

    .line 458
    .line 459
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    new-instance v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 463
    .line 464
    const-string v1, "No location header to follow redirect"

    .line 465
    .line 466
    const/4 v5, 0x1

    .line 467
    invoke-direct {v0, v5, v1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(ILjava/lang/String;)V

    .line 468
    .line 469
    .line 470
    throw v0

    .line 471
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 472
    .line 473
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    new-instance v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 490
    .line 491
    new-instance v1, Ljava/lang/StringBuilder;

    .line 492
    .line 493
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v1

    .line 506
    const/4 v5, 0x1

    .line 507
    invoke-direct {v0, v5, v1}, Lcom/google/android/gms/internal/ads/zzead;-><init>(ILjava/lang/String;)V

    .line 508
    .line 509
    .line 510
    throw v0
    :try_end_10
    .catch Lcom/google/android/gms/internal/ads/zzead; {:try_start_10 .. :try_end_10} :catch_0
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 511
    :catch_3
    move-exception v0

    .line 512
    move-object v3, v9

    .line 513
    goto :goto_8

    .line 514
    :catch_4
    move-exception v0

    .line 515
    move-object v3, v8

    .line 516
    goto :goto_8

    .line 517
    :catch_5
    move-exception v0

    .line 518
    move-object v3, v7

    .line 519
    :goto_8
    :try_start_11
    sget-object v1, Ll/sgs0;->h8:Ll/dgs0;

    .line 520
    .line 521
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 522
    .line 523
    .line 524
    move-result-object v2

    .line 525
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 526
    .line 527
    .line 528
    move-result-object v1

    .line 529
    check-cast v1, Ljava/lang/Boolean;

    .line 530
    .line 531
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 532
    .line 533
    .line 534
    move-result v1

    .line 535
    if-eqz v1, :cond_b

    .line 536
    .line 537
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 542
    .line 543
    .line 544
    move-result-wide v0

    .line 545
    sub-long/2addr v0, v15

    .line 546
    iput-wide v0, v3, Ll/h8v0;->d:J
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 547
    .line 548
    :try_start_12
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_2

    .line 549
    .line 550
    .line 551
    return-object v3

    .line 552
    :cond_b
    :try_start_13
    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 553
    :goto_9
    :try_start_14
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 554
    .line 555
    .line 556
    throw v0
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_2

    .line 557
    :goto_a
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v1

    .line 561
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 562
    .line 563
    .line 564
    move-result-object v1

    .line 565
    const-string v2, "Error while connecting to ad server: "

    .line 566
    .line 567
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    invoke-static {v1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    new-instance v2, Lcom/google/android/gms/internal/ads/zzead;

    .line 575
    .line 576
    const/4 v5, 0x1

    .line 577
    invoke-direct {v2, v5, v1, v0}, Lcom/google/android/gms/internal/ads/zzead;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 578
    .line 579
    .line 580
    throw v2
.end method

.method public final bridge synthetic zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/g8v0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n8v0;->a(Ll/g8v0;)Ll/h8v0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

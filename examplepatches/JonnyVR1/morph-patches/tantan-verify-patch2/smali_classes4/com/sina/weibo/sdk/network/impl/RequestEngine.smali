.class public Lcom/sina/weibo/sdk/network/impl/RequestEngine;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static request(Lcom/sina/weibo/sdk/network/IRequestParam;)Lcom/sina/weibo/sdk/network/base/WbResponse;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sina/weibo/sdk/network/exception/RequestException;
        }
    .end annotation

    .line 1
    const-string v0, "\u8bf7\u6c42\u5f02\u5e38"

    .line 2
    .line 3
    const-string v1, "weibosdk"

    .line 4
    .line 5
    const-string v2, "\u670d\u52a1\u5668\u5f02\u5e38"

    .line 6
    .line 7
    const-string v3, "multipart/form-data;boundary="

    .line 8
    .line 9
    const-string v4, "------------"

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    if-nez v6, :cond_e

    .line 20
    .line 21
    const-string v6, "http"

    .line 22
    .line 23
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    const-string v7, "https"

    .line 28
    .line 29
    if-nez v6, :cond_0

    .line 30
    .line 31
    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-eqz v6, :cond_e

    .line 36
    .line 37
    :cond_0
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getGetBundle()Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    invoke-static {v5, v6}, Lcom/sina/weibo/sdk/network/base/UriUtils;->buildCompleteUri(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-static {}, Lcom/sina/weibo/sdk/net/NetStateManager;->getAPN()Landroid/util/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    if-eqz v6, :cond_1

    .line 50
    .line 51
    new-instance v8, Ljava/net/Proxy;

    .line 52
    .line 53
    sget-object v9, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 54
    .line 55
    new-instance v10, Ljava/net/InetSocketAddress;

    .line 56
    .line 57
    iget-object v11, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v11, Ljava/lang/String;

    .line 60
    .line 61
    iget-object v6, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v6, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    invoke-direct {v10, v11, v6}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    invoke-direct {v8, v9, v10}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 v8, 0x0

    .line 77
    :goto_0
    :try_start_0
    new-instance v6, Ljava/net/URL;

    .line 78
    .line 79
    invoke-direct {v6, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v7, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    if-eqz v5, :cond_3

    .line 87
    .line 88
    if-nez v8, :cond_2

    .line 89
    .line 90
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    check-cast v5, Ljavax/net/ssl/HttpsURLConnection;

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catch_0
    move-exception p0

    .line 98
    goto/16 :goto_5

    .line 99
    .line 100
    :catch_1
    move-exception p0

    .line 101
    goto/16 :goto_6

    .line 102
    .line 103
    :cond_2
    invoke-virtual {v6, v8}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    check-cast v5, Ljavax/net/ssl/HttpsURLConnection;

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_3
    if-nez v8, :cond_4

    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    check-cast v5, Ljava/net/HttpURLConnection;

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_4
    invoke-virtual {v6, v8}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    check-cast v5, Ljava/net/HttpURLConnection;

    .line 124
    .line 125
    :goto_1
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getHeader()Landroid/os/Bundle;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-static {v5, v6}, Lcom/sina/weibo/sdk/network/impl/RequestEngine;->setRequestHeader(Ljava/net/HttpURLConnection;Landroid/os/Bundle;)V

    .line 130
    .line 131
    .line 132
    new-instance v6, Landroid/os/Bundle;

    .line 133
    .line 134
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Lcom/sina/weibo/sdk/network/base/RequestBodyHelper;->getBoundry()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    new-instance v8, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getMethod()Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    sget-object v8, Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;->POST:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 158
    .line 159
    if-ne v7, v8, :cond_7

    .line 160
    .line 161
    const-string v7, "POST"

    .line 162
    .line 163
    invoke-virtual {v5, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    const-string v7, "Connection"

    .line 167
    .line 168
    const-string v8, "Keep-Alive"

    .line 169
    .line 170
    invoke-virtual {v5, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    const-string v7, "Charset"

    .line 174
    .line 175
    const-string v8, "UTF-8"

    .line 176
    .line 177
    invoke-virtual {v5, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const/4 v7, 0x0

    .line 181
    invoke-virtual {v5, v7}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 182
    .line 183
    .line 184
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getPostBundle()Landroid/os/Bundle;

    .line 185
    .line 186
    .line 187
    move-result-object v7

    .line 188
    const-string v8, "body_byte_array"

    .line 189
    .line 190
    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    .line 191
    .line 192
    .line 193
    move-result-object v7
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    const-string v8, "Content-Type"

    .line 195
    .line 196
    if-eqz v7, :cond_5

    .line 197
    .line 198
    :try_start_1
    const-string v3, "application/octet-stream"

    .line 199
    .line 200
    invoke-virtual {v6, v8, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_5
    invoke-static {p0}, Lcom/sina/weibo/sdk/network/base/RequestBodyHelper;->isMultipartRequest(Lcom/sina/weibo/sdk/network/IRequestParam;)Z

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    if-eqz v7, :cond_6

    .line 209
    .line 210
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    invoke-virtual {v6, v8, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_6
    const-string v3, "application/x-www-form-urlencoded"

    .line 219
    .line 220
    invoke-virtual {v6, v8, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    :goto_2
    const/4 v3, 0x1

    .line 224
    invoke-virtual {v5, v3}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v5, v3}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 228
    .line 229
    .line 230
    goto :goto_3

    .line 231
    :cond_7
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getMethod()Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    sget-object v7, Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;->GET:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 236
    .line 237
    if-ne v3, v7, :cond_8

    .line 238
    .line 239
    const-string v3, "GET"

    .line 240
    .line 241
    invoke-virtual {v5, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_8
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getMethod()Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    sget-object v7, Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;->PATCH:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 250
    .line 251
    if-ne v3, v7, :cond_9

    .line 252
    .line 253
    const-string v3, "PATCH"

    .line 254
    .line 255
    invoke-virtual {v5, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    :cond_9
    :goto_3
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getResponseTimeout()I

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    invoke-virtual {v5, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 263
    .line 264
    .line 265
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getRequestTimeout()I

    .line 266
    .line 267
    .line 268
    move-result v3

    .line 269
    invoke-virtual {v5, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 270
    .line 271
    .line 272
    invoke-static {v5, v6}, Lcom/sina/weibo/sdk/network/impl/RequestEngine;->setRequestHeader(Ljava/net/HttpURLConnection;Landroid/os/Bundle;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v5}, Ljava/net/URLConnection;->connect()V

    .line 276
    .line 277
    .line 278
    invoke-interface {p0}, Lcom/sina/weibo/sdk/network/IRequestParam;->getMethod()Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    sget-object v6, Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;->GET:Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;

    .line 283
    .line 284
    if-eq v3, v6, :cond_a

    .line 285
    .line 286
    invoke-static {p0, v5, v4}, Lcom/sina/weibo/sdk/network/base/RequestBodyHelper;->fillRequestBody(Lcom/sina/weibo/sdk/network/IRequestParam;Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    :cond_a
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    const/16 v4, 0xc8

    .line 294
    .line 295
    if-ne v3, v4, :cond_b

    .line 296
    .line 297
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentLength()I

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    int-to-long v2, v2

    .line 306
    new-instance v4, Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 307
    .line 308
    invoke-direct {v4, p0, v2, v3}, Lcom/sina/weibo/sdk/network/base/WbResponseBody;-><init>(Ljava/io/InputStream;J)V

    .line 309
    .line 310
    .line 311
    new-instance p0, Lcom/sina/weibo/sdk/network/base/WbResponse;

    .line 312
    .line 313
    invoke-direct {p0, v4}, Lcom/sina/weibo/sdk/network/base/WbResponse;-><init>(Lcom/sina/weibo/sdk/network/base/WbResponseBody;)V

    .line 314
    .line 315
    .line 316
    return-object p0

    .line 317
    :cond_b
    const/16 v4, 0x12e

    .line 318
    .line 319
    if-eq v3, v4, :cond_d

    .line 320
    .line 321
    const/16 v4, 0x12d

    .line 322
    .line 323
    if-ne v3, v4, :cond_c

    .line 324
    .line 325
    goto :goto_4

    .line 326
    :cond_c
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentLength()I

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    int-to-long v3, v3

    .line 335
    new-instance v5, Lcom/sina/weibo/sdk/network/base/WbResponseBody;

    .line 336
    .line 337
    invoke-direct {v5, p0, v3, v4}, Lcom/sina/weibo/sdk/network/base/WbResponseBody;-><init>(Ljava/io/InputStream;J)V

    .line 338
    .line 339
    .line 340
    new-instance p0, Lcom/sina/weibo/sdk/network/exception/RequestException;

    .line 341
    .line 342
    new-instance v3, Ljava/lang/StringBuilder;

    .line 343
    .line 344
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v5}, Lcom/sina/weibo/sdk/network/base/WbResponseBody;->string()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    invoke-direct {p0, v2}, Lcom/sina/weibo/sdk/network/exception/RequestException;-><init>(Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    throw p0

    .line 362
    :cond_d
    :goto_4
    const-string v2, "Location"

    .line 363
    .line 364
    invoke-virtual {v5, v2}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    invoke-interface {p0, v2}, Lcom/sina/weibo/sdk/network/IRequestParam;->setUrl(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    invoke-static {p0}, Lcom/sina/weibo/sdk/network/impl/RequestEngine;->request(Lcom/sina/weibo/sdk/network/IRequestParam;)Lcom/sina/weibo/sdk/network/base/WbResponse;

    .line 372
    .line 373
    .line 374
    move-result-object p0
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 375
    return-object p0

    .line 376
    :goto_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    invoke-static {v1, v2}, Lcom/sina/weibo/sdk/utils/LogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    new-instance v1, Lcom/sina/weibo/sdk/network/exception/RequestException;

    .line 384
    .line 385
    new-instance v2, Ljava/lang/StringBuilder;

    .line 386
    .line 387
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    invoke-direct {v1, p0}, Lcom/sina/weibo/sdk/network/exception/RequestException;-><init>(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    throw v1

    .line 405
    :goto_6
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v2

    .line 409
    invoke-static {v1, v2}, Lcom/sina/weibo/sdk/utils/LogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    new-instance v1, Lcom/sina/weibo/sdk/network/exception/RequestException;

    .line 413
    .line 414
    new-instance v2, Ljava/lang/StringBuilder;

    .line 415
    .line 416
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p0

    .line 430
    invoke-direct {v1, p0}, Lcom/sina/weibo/sdk/network/exception/RequestException;-><init>(Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    throw v1

    .line 434
    :cond_e
    new-instance p0, Lcom/sina/weibo/sdk/network/exception/RequestException;

    .line 435
    .line 436
    const-string v0, "\u975e\u6cd5\u7684\u8bf7\u6c42\u5730\u5740"

    .line 437
    .line 438
    invoke-direct {p0, v0}, Lcom/sina/weibo/sdk/network/exception/RequestException;-><init>(Ljava/lang/String;)V

    .line 439
    .line 440
    .line 441
    throw p0
.end method

.method private static setRequestHeader(Ljava/net/HttpURLConnection;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {p0, v1, v2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    return-void
.end method

.class Lcom/tencent/liteav/network/g$2;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/g;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/network/g$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:I

.field final synthetic f:Lcom/tencent/liteav/network/g$a;

.field final synthetic g:Lcom/tencent/liteav/network/g;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/tencent/liteav/network/g$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/tencent/liteav/network/g$2;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/liteav/network/g$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/tencent/liteav/network/g$2;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p6, p0, Lcom/tencent/liteav/network/g$2;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput p7, p0, Lcom/tencent/liteav/network/g$2;->e:I

    .line 12
    .line 13
    iput-object p8, p0, Lcom/tencent/liteav/network/g$2;->f:Lcom/tencent/liteav/network/g$a;

    .line 14
    .line 15
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "pull_addr"

    .line 4
    .line 5
    const-string v3, "message"

    .line 6
    .line 7
    const-string v4, "code"

    .line 8
    .line 9
    const-string v5, "TXRTMPAccUrlFetcher"

    .line 10
    .line 11
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->a:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v6, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    move v7, v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v7, v6

    .line 35
    :goto_0
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 36
    .line 37
    iget-object v8, v1, Lcom/tencent/liteav/network/g$2;->a:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v9, v1, Lcom/tencent/liteav/network/g$2;->b:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v10, v1, Lcom/tencent/liteav/network/g$2;->c:Ljava/lang/String;

    .line 42
    .line 43
    const/4 v11, 0x1

    .line 44
    invoke-static {v0, v11, v8, v9, v10}, Lcom/tencent/liteav/network/g;->a(Lcom/tencent/liteav/network/g;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tencent/liteav/network/g;->a(Lcom/tencent/liteav/network/g;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v9

    .line 56
    long-to-int v0, v9

    .line 57
    if-gtz v0, :cond_1

    .line 58
    .line 59
    move v0, v11

    .line 60
    move v9, v0

    .line 61
    goto :goto_2

    .line 62
    :cond_1
    :goto_1
    const/4 v9, 0x2

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    const/4 v0, 0x5

    .line 65
    goto :goto_1

    .line 66
    :goto_2
    add-int/2addr v0, v9

    .line 67
    const/4 v10, -0x1

    .line 68
    const-string v12, ""

    .line 69
    .line 70
    move v13, v10

    .line 71
    move-object v14, v12

    .line 72
    move v10, v0

    .line 73
    :goto_3
    if-lt v10, v11, :cond_15

    .line 74
    .line 75
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 76
    .line 77
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v15, "bizid"

    .line 81
    .line 82
    invoke-virtual {v0, v15, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 83
    .line 84
    .line 85
    const-string v15, "stream_id"

    .line 86
    .line 87
    iget-object v8, v1, Lcom/tencent/liteav/network/g$2;->d:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v15, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    const-string v8, "txSecret"

    .line 93
    .line 94
    iget-object v15, v1, Lcom/tencent/liteav/network/g$2;->c:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v8, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    const-string v8, "txTime"

    .line 100
    .line 101
    iget-object v15, v1, Lcom/tencent/liteav/network/g$2;->b:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v8, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    const-string v8, "type"

    .line 107
    .line 108
    invoke-virtual {v0, v8, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    if-le v10, v9, :cond_3

    .line 116
    .line 117
    const-string v8, "https://livepull.myqcloud.com/getpulladdr"

    .line 118
    .line 119
    goto :goto_5

    .line 120
    :catch_0
    move-exception v0

    .line 121
    move-object/from16 v17, v2

    .line 122
    .line 123
    move-object/from16 v18, v3

    .line 124
    .line 125
    :goto_4
    const/4 v2, 0x2

    .line 126
    goto/16 :goto_11

    .line 127
    .line 128
    :cond_3
    const-string v8, "https://livepullipv6.myqcloud.com/getpulladdr"

    .line 129
    .line 130
    :goto_5
    new-instance v15, Ljava/net/URL;

    .line 131
    .line 132
    invoke-direct {v15, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 136
    .line 137
    .line 138
    move-result-object v8

    .line 139
    check-cast v8, Ljavax/net/ssl/HttpsURLConnection;

    .line 140
    .line 141
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXHttpRequest;->createSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 142
    .line 143
    .line 144
    move-result-object v15

    .line 145
    invoke-virtual {v8, v15}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 146
    .line 147
    .line 148
    sget-object v15, Lcom/tencent/liteav/basic/util/TXHttpRequest$c;->a:Lcom/tencent/liteav/basic/util/TXHttpRequest$c;

    .line 149
    .line 150
    invoke-virtual {v8, v15}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v8, v11}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v8, v11}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v8, v6}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 160
    .line 161
    .line 162
    const/16 v15, 0x1388

    .line 163
    .line 164
    invoke-virtual {v8, v15}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v8, v15}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 168
    .line 169
    .line 170
    const-string v15, "POST"

    .line 171
    .line 172
    invoke-virtual {v8, v15}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    const-string v15, "Charsert"

    .line 176
    .line 177
    const-string v6, "UTF-8"

    .line 178
    .line 179
    invoke-virtual {v8, v15, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    const-string v6, "Content-Type"

    .line 183
    .line 184
    const-string v15, "text/plain;"

    .line 185
    .line 186
    invoke-virtual {v8, v6, v15}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    const-string v6, "Content-Length"

    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 192
    .line 193
    .line 194
    move-result v15

    .line 195
    invoke-static {v15}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v15

    .line 199
    invoke-virtual {v8, v6, v15}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    new-instance v6, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    const-string v15, "getAccelerateStreamPlayUrl: sendHttpRequest[ "

    .line 208
    .line 209
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    const-string v15, "] retryIndex = "

    .line 216
    .line 217
    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v6

    .line 227
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    new-instance v6, Ljava/io/DataOutputStream;

    .line 231
    .line 232
    invoke-virtual {v8}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 233
    .line 234
    .line 235
    move-result-object v15

    .line 236
    invoke-direct {v6, v15}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v6, v0}, Ljava/io/OutputStream;->write([B)V

    .line 244
    .line 245
    .line 246
    new-instance v0, Ljava/io/BufferedReader;

    .line 247
    .line 248
    new-instance v6, Ljava/io/InputStreamReader;

    .line 249
    .line 250
    invoke-virtual {v8}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 251
    .line 252
    .line 253
    move-result-object v8

    .line 254
    invoke-direct {v6, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 255
    .line 256
    .line 257
    invoke-direct {v0, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 258
    .line 259
    .line 260
    move-object v6, v12

    .line 261
    :goto_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v8

    .line 265
    if-eqz v8, :cond_4

    .line 266
    .line 267
    new-instance v15, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v6

    .line 282
    goto :goto_6

    .line 283
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .line 287
    .line 288
    const-string v8, "getAccelerateStreamPlayUrl: receive response, strResponse = "

    .line 289
    .line 290
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    new-instance v0, Lorg/json/JSONTokener;

    .line 304
    .line 305
    invoke-direct {v0, v6}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    check-cast v0, Lorg/json/JSONObject;

    .line 313
    .line 314
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v6

    .line 318
    if-eqz v6, :cond_5

    .line 319
    .line 320
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 321
    .line 322
    .line 323
    move-result v13

    .line 324
    :cond_5
    if-eqz v13, :cond_7

    .line 325
    .line 326
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 327
    .line 328
    .line 329
    move-result v6

    .line 330
    if-eqz v6, :cond_6

    .line 331
    .line 332
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v14

    .line 336
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 339
    .line 340
    .line 341
    const-string v8, "getAccelerateStreamPlayUrl: errorCode = "

    .line 342
    .line 343
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    const-string v8, " errorMessage = "

    .line 350
    .line 351
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v6

    .line 361
    invoke-static {v5, v6}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    :cond_7
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 365
    .line 366
    .line 367
    move-result v6

    .line 368
    if-eqz v6, :cond_13

    .line 369
    .line 370
    new-instance v6, Ljava/util/Vector;

    .line 371
    .line 372
    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 373
    .line 374
    .line 375
    new-instance v8, Ljava/util/Vector;

    .line 376
    .line 377
    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    .line 378
    .line 379
    .line 380
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 381
    .line 382
    .line 383
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    if-eqz v0, :cond_8

    .line 385
    .line 386
    :try_start_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 387
    .line 388
    .line 389
    move-result v15

    .line 390
    if-nez v15, :cond_9

    .line 391
    .line 392
    :cond_8
    move-object/from16 v17, v2

    .line 393
    .line 394
    move-object/from16 v18, v3

    .line 395
    .line 396
    goto/16 :goto_c

    .line 397
    .line 398
    :cond_9
    const/4 v15, 0x0

    .line 399
    :goto_7
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 400
    .line 401
    .line 402
    move-result v11

    .line 403
    if-ge v15, v11, :cond_e

    .line 404
    .line 405
    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v11

    .line 409
    check-cast v11, Lorg/json/JSONObject;

    .line 410
    .line 411
    if-eqz v11, :cond_c

    .line 412
    .line 413
    move-object/from16 v16, v0

    .line 414
    .line 415
    const-string v0, "rtmp_url"

    .line 416
    .line 417
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 421
    move-object/from16 v17, v2

    .line 422
    .line 423
    :try_start_2
    const-string v2, "proto"

    .line 424
    .line 425
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 426
    .line 427
    .line 428
    move-result v2

    .line 429
    const/4 v11, 0x1

    .line 430
    if-ne v2, v11, :cond_a

    .line 431
    .line 432
    const/4 v11, 0x1

    .line 433
    goto :goto_8

    .line 434
    :cond_a
    const/4 v11, 0x0

    .line 435
    :goto_8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 436
    .line 437
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 438
    .line 439
    .line 440
    move-object/from16 v18, v3

    .line 441
    .line 442
    :try_start_3
    const-string v3, "getAccelerateStreamPlayUrl: streamUrl = "

    .line 443
    .line 444
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    const-string v3, " Q channel = "

    .line 451
    .line 452
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v2

    .line 462
    invoke-static {v5, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getStreamIDByStreamUrl(Ljava/lang/String;)Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v2

    .line 469
    if-eqz v2, :cond_d

    .line 470
    .line 471
    iget-object v3, v1, Lcom/tencent/liteav/network/g$2;->d:Ljava/lang/String;

    .line 472
    .line 473
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 474
    .line 475
    .line 476
    move-result v2

    .line 477
    if-eqz v2, :cond_d

    .line 478
    .line 479
    if-eqz v11, :cond_b

    .line 480
    .line 481
    new-instance v2, Lcom/tencent/liteav/network/e;

    .line 482
    .line 483
    invoke-direct {v2, v0, v11}, Lcom/tencent/liteav/network/e;-><init>(Ljava/lang/String;Z)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v6, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 487
    .line 488
    .line 489
    goto :goto_b

    .line 490
    :catch_1
    move-exception v0

    .line 491
    :goto_9
    const/4 v2, 0x2

    .line 492
    const/4 v11, 0x1

    .line 493
    goto/16 :goto_11

    .line 494
    .line 495
    :cond_b
    new-instance v2, Lcom/tencent/liteav/network/e;

    .line 496
    .line 497
    invoke-direct {v2, v0, v11}, Lcom/tencent/liteav/network/e;-><init>(Ljava/lang/String;Z)V

    .line 498
    .line 499
    .line 500
    invoke-virtual {v8, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 501
    .line 502
    .line 503
    goto :goto_b

    .line 504
    :catch_2
    move-exception v0

    .line 505
    :goto_a
    move-object/from16 v18, v3

    .line 506
    .line 507
    goto :goto_9

    .line 508
    :catch_3
    move-exception v0

    .line 509
    move-object/from16 v17, v2

    .line 510
    .line 511
    goto :goto_a

    .line 512
    :cond_c
    move-object/from16 v16, v0

    .line 513
    .line 514
    move-object/from16 v17, v2

    .line 515
    .line 516
    move-object/from16 v18, v3

    .line 517
    .line 518
    :cond_d
    :goto_b
    add-int/lit8 v15, v15, 0x1

    .line 519
    .line 520
    move-object/from16 v0, v16

    .line 521
    .line 522
    move-object/from16 v2, v17

    .line 523
    .line 524
    move-object/from16 v3, v18

    .line 525
    .line 526
    goto :goto_7

    .line 527
    :cond_e
    move-object/from16 v17, v2

    .line 528
    .line 529
    move-object/from16 v18, v3

    .line 530
    .line 531
    goto :goto_d

    .line 532
    :goto_c
    const-string v0, "getAccelerateStreamPlayUrl: no pull_addr"

    .line 533
    .line 534
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    :goto_d
    iget v0, v1, Lcom/tencent/liteav/network/g$2;->e:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 538
    .line 539
    const/4 v11, 0x1

    .line 540
    if-ne v0, v11, :cond_10

    .line 541
    .line 542
    :try_start_4
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    .line 543
    .line 544
    .line 545
    move-result v0

    .line 546
    if-lez v0, :cond_f

    .line 547
    .line 548
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 549
    .line 550
    invoke-static {v0}, Lcom/tencent/liteav/network/g;->b(Lcom/tencent/liteav/network/g;)Landroid/os/Handler;

    .line 551
    .line 552
    .line 553
    move-result-object v0

    .line 554
    new-instance v2, Lcom/tencent/liteav/network/g$2$1;

    .line 555
    .line 556
    invoke-direct {v2, v1, v8}, Lcom/tencent/liteav/network/g$2$1;-><init>(Lcom/tencent/liteav/network/g$2;Ljava/util/Vector;)V

    .line 557
    .line 558
    .line 559
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 560
    .line 561
    .line 562
    goto :goto_10

    .line 563
    :catch_4
    move-exception v0

    .line 564
    goto/16 :goto_4

    .line 565
    .line 566
    :cond_f
    :goto_e
    const/4 v2, 0x2

    .line 567
    goto :goto_12

    .line 568
    :cond_10
    const/4 v2, 0x2

    .line 569
    if-ne v0, v2, :cond_11

    .line 570
    .line 571
    :try_start_5
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    .line 572
    .line 573
    .line 574
    move-result v0

    .line 575
    if-lez v0, :cond_14

    .line 576
    .line 577
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 578
    .line 579
    invoke-static {v0}, Lcom/tencent/liteav/network/g;->b(Lcom/tencent/liteav/network/g;)Landroid/os/Handler;

    .line 580
    .line 581
    .line 582
    move-result-object v0

    .line 583
    new-instance v3, Lcom/tencent/liteav/network/g$2$2;

    .line 584
    .line 585
    invoke-direct {v3, v1, v6}, Lcom/tencent/liteav/network/g$2$2;-><init>(Lcom/tencent/liteav/network/g$2;Ljava/util/Vector;)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 589
    .line 590
    .line 591
    goto :goto_10

    .line 592
    :catch_5
    move-exception v0

    .line 593
    goto :goto_11

    .line 594
    :cond_11
    invoke-virtual {v8}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    .line 595
    .line 596
    .line 597
    move-result-object v0

    .line 598
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 599
    .line 600
    .line 601
    move-result v3

    .line 602
    if-eqz v3, :cond_12

    .line 603
    .line 604
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v3

    .line 608
    check-cast v3, Lcom/tencent/liteav/network/e;

    .line 609
    .line 610
    invoke-virtual {v6, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 611
    .line 612
    .line 613
    goto :goto_f

    .line 614
    :cond_12
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    .line 615
    .line 616
    .line 617
    move-result v0

    .line 618
    if-lez v0, :cond_14

    .line 619
    .line 620
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 621
    .line 622
    invoke-static {v0}, Lcom/tencent/liteav/network/g;->b(Lcom/tencent/liteav/network/g;)Landroid/os/Handler;

    .line 623
    .line 624
    .line 625
    move-result-object v0

    .line 626
    new-instance v3, Lcom/tencent/liteav/network/g$2$3;

    .line 627
    .line 628
    invoke-direct {v3, v1, v6}, Lcom/tencent/liteav/network/g$2$3;-><init>(Lcom/tencent/liteav/network/g$2;Ljava/util/Vector;)V

    .line 629
    .line 630
    .line 631
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 632
    .line 633
    .line 634
    :goto_10
    return-void

    .line 635
    :cond_13
    move-object/from16 v17, v2

    .line 636
    .line 637
    move-object/from16 v18, v3

    .line 638
    .line 639
    goto :goto_e

    .line 640
    :goto_11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 641
    .line 642
    const-string v6, "getAccelerateStreamPlayUrl exception:"

    .line 643
    .line 644
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 645
    .line 646
    .line 647
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 648
    .line 649
    .line 650
    move-result-object v0

    .line 651
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    .line 653
    .line 654
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v0

    .line 658
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    .line 660
    .line 661
    :cond_14
    :goto_12
    const-wide/16 v2, 0x3e8

    .line 662
    .line 663
    const/4 v6, 0x0

    .line 664
    :try_start_6
    invoke-static {v2, v3, v6}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 665
    .line 666
    .line 667
    goto :goto_13

    .line 668
    :catch_6
    const-string v0, "getAccelerateStreamPlayUrl exception sleep"

    .line 669
    .line 670
    invoke-static {v5, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 671
    .line 672
    .line 673
    :goto_13
    add-int/lit8 v10, v10, -0x1

    .line 674
    .line 675
    move-object/from16 v2, v17

    .line 676
    .line 677
    move-object/from16 v3, v18

    .line 678
    .line 679
    goto/16 :goto_3

    .line 680
    .line 681
    :cond_15
    iget-object v0, v1, Lcom/tencent/liteav/network/g$2;->g:Lcom/tencent/liteav/network/g;

    .line 682
    .line 683
    invoke-static {v0}, Lcom/tencent/liteav/network/g;->b(Lcom/tencent/liteav/network/g;)Landroid/os/Handler;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    new-instance v2, Lcom/tencent/liteav/network/g$2$4;

    .line 688
    .line 689
    invoke-direct {v2, v1, v13, v14}, Lcom/tencent/liteav/network/g$2$4;-><init>(Lcom/tencent/liteav/network/g$2;ILjava/lang/String;)V

    .line 690
    .line 691
    .line 692
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 693
    .line 694
    .line 695
    return-void
.end method

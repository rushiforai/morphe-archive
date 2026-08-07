.class public Lcom/tantanapp/media/ttmediautils/download/HttpUtil;
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

.method public static downloadFile(Lcom/tantanapp/media/ttmediautils/download/DownloadTask;)V
    .locals 15

    .line 1
    const-string v0, "httpURLConnection.getResponseCode()="

    .line 2
    .line 3
    if-eqz p0, :cond_1c

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    :try_start_0
    new-instance v3, Ljava/io/File;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getLocalPath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 14
    .line 15
    .line 16
    :try_start_1
    iget-boolean v4, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mIsFirstRun:Z

    .line 17
    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onStart()V

    .line 21
    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mIsFirstRun:Z

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    iput-wide v4, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mUpdateTime:J

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move-object v4, v2

    .line 43
    move-object v5, v4

    .line 44
    move-object v7, v5

    .line 45
    move-object v2, v3

    .line 46
    move-object v3, v7

    .line 47
    goto/16 :goto_e

    .line 48
    .line 49
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isNeedPause()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onPause(Ljava/lang/Boolean;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isNeedResume()Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {p0, v4}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onPause(Ljava/lang/Boolean;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    const-wide/16 v5, 0x0

    .line 77
    .line 78
    if-nez v4, :cond_3

    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 81
    .line 82
    .line 83
    iput-wide v5, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 84
    .line 85
    :cond_3
    new-instance v4, Ljava/net/URL;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getNetPath()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-direct {v4, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .line 100
    :try_start_2
    const-string v7, "Connection"

    .line 101
    .line 102
    const-string v8, "Keep-Alive"

    .line 103
    .line 104
    invoke-virtual {v4, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string v7, "Charset"

    .line 108
    .line 109
    const-string v8, "UTF-8"

    .line 110
    .line 111
    invoke-virtual {v4, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    const-string v7, "Accept-Encoding"

    .line 115
    .line 116
    const-string v8, "identity"

    .line 117
    .line 118
    invoke-virtual {v4, v7, v8}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    const/16 v7, 0x2710

    .line 122
    .line 123
    invoke-virtual {v4, v7}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4, v7}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 127
    .line 128
    .line 129
    iget-wide v7, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 130
    .line 131
    cmp-long v7, v7, v5

    .line 132
    .line 133
    const-string v8, "-"

    .line 134
    .line 135
    const-string v9, "Range"

    .line 136
    .line 137
    const-string v10, "bytes="

    .line 138
    .line 139
    if-lez v7, :cond_4

    .line 140
    .line 141
    :try_start_3
    new-instance v7, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-wide v10, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 147
    .line 148
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-wide v10, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 155
    .line 156
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    invoke-virtual {v4, v9, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :catchall_1
    move-exception v0

    .line 168
    move-object v7, v2

    .line 169
    move-object v5, v4

    .line 170
    move-object v4, v7

    .line 171
    :goto_1
    move-object v2, v3

    .line 172
    move-object v3, v4

    .line 173
    goto/16 :goto_e

    .line 174
    .line 175
    :cond_4
    iget-wide v11, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 176
    .line 177
    cmp-long v7, v11, v5

    .line 178
    .line 179
    if-lez v7, :cond_5

    .line 180
    .line 181
    new-instance v7, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    invoke-direct {v7, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-wide v10, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 187
    .line 188
    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    invoke-virtual {v4, v9, v7}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 199
    .line 200
    .line 201
    :cond_5
    :goto_2
    :try_start_4
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_7
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 202
    .line 203
    .line 204
    :try_start_5
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    const/16 v8, 0xc8

    .line 209
    .line 210
    if-eq v8, v7, :cond_7

    .line 211
    .line 212
    const/16 v8, 0xce

    .line 213
    .line 214
    if-ne v8, v7, :cond_6

    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_6
    new-instance v5, Ljava/lang/Exception;

    .line 218
    .line 219
    new-instance v6, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-direct {v5, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    throw v5

    .line 235
    :cond_7
    :goto_3
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isCancel()Z

    .line 236
    .line 237
    .line 238
    move-result v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 239
    if-eqz v0, :cond_8

    .line 240
    .line 241
    :try_start_6
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :catch_0
    move-exception p0

    .line 246
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_8
    :try_start_7
    iget-wide v7, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 251
    .line 252
    cmp-long v0, v7, v5

    .line 253
    .line 254
    if-gtz v0, :cond_9

    .line 255
    .line 256
    invoke-static {v4}, Lcom/tantanapp/media/ttmediautils/download/HttpUtil;->getFileNameByConnection(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onConnect(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    iget-wide v7, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 264
    .line 265
    invoke-virtual {v4}, Ljava/net/URLConnection;->getContentLength()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    int-to-long v9, v0

    .line 270
    add-long/2addr v7, v9

    .line 271
    iput-wide v7, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 272
    .line 273
    :cond_9
    iget-wide v7, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 274
    .line 275
    cmp-long v0, v7, v5

    .line 276
    .line 277
    if-lez v0, :cond_a

    .line 278
    .line 279
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 280
    .line 281
    const-string v7, "rwd"

    .line 282
    .line 283
    invoke-direct {v0, v3, v7}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 284
    .line 285
    .line 286
    :try_start_8
    iget-wide v7, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 287
    .line 288
    invoke-virtual {v0, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 289
    .line 290
    .line 291
    move-object v7, v0

    .line 292
    move-object v0, v2

    .line 293
    goto :goto_4

    .line 294
    :catchall_2
    move-exception v5

    .line 295
    move-object v7, v0

    .line 296
    move-object v0, v5

    .line 297
    move-object v5, v4

    .line 298
    move-object v4, v2

    .line 299
    goto/16 :goto_1

    .line 300
    .line 301
    :cond_a
    :try_start_9
    new-instance v0, Ljava/io/FileOutputStream;

    .line 302
    .line 303
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getLocalPath()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v7

    .line 307
    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 308
    .line 309
    .line 310
    move-object v7, v2

    .line 311
    :goto_4
    :try_start_a
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->getBufferSize()I

    .line 316
    .line 317
    .line 318
    move-result v8

    .line 319
    new-array v8, v8, [B

    .line 320
    .line 321
    iget-wide v9, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 322
    .line 323
    cmp-long v5, v9, v5

    .line 324
    .line 325
    const/4 v6, -0x1

    .line 326
    if-gtz v5, :cond_b

    .line 327
    .line 328
    invoke-virtual {p0, v6}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onLoading(I)V

    .line 329
    .line 330
    .line 331
    goto :goto_5

    .line 332
    :catchall_3
    move-exception v5

    .line 333
    move-object v14, v4

    .line 334
    move-object v4, v0

    .line 335
    move-object v0, v5

    .line 336
    move-object v5, v14

    .line 337
    move-object v14, v3

    .line 338
    move-object v3, v2

    .line 339
    move-object v2, v14

    .line 340
    goto/16 :goto_e

    .line 341
    .line 342
    :cond_b
    :goto_5
    invoke-virtual {v2, v8}, Ljava/io/InputStream;->read([B)I

    .line 343
    .line 344
    .line 345
    move-result v5

    .line 346
    const/4 v9, 0x0

    .line 347
    if-eq v5, v6, :cond_10

    .line 348
    .line 349
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isCancel()Z

    .line 350
    .line 351
    .line 352
    move-result v10
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 353
    if-eqz v10, :cond_e

    .line 354
    .line 355
    if-eqz v0, :cond_c

    .line 356
    .line 357
    :try_start_b
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_1

    .line 358
    .line 359
    .line 360
    goto :goto_6

    .line 361
    :catch_1
    move-exception p0

    .line 362
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 363
    .line 364
    .line 365
    :cond_c
    :goto_6
    :try_start_c
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_2

    .line 366
    .line 367
    .line 368
    goto :goto_7

    .line 369
    :catch_2
    move-exception p0

    .line 370
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 371
    .line 372
    .line 373
    :goto_7
    if-eqz v7, :cond_d

    .line 374
    .line 375
    :goto_8
    :try_start_d
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_3

    .line 376
    .line 377
    .line 378
    goto :goto_9

    .line 379
    :catch_3
    move-exception p0

    .line 380
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 381
    .line 382
    .line 383
    :cond_d
    :goto_9
    :try_start_e
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4

    .line 384
    .line 385
    .line 386
    goto/16 :goto_18

    .line 387
    .line 388
    :catch_4
    move-exception p0

    .line 389
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 390
    .line 391
    .line 392
    goto/16 :goto_18

    .line 393
    .line 394
    :cond_e
    :try_start_f
    iget-wide v10, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 395
    .line 396
    int-to-long v12, v5

    .line 397
    add-long/2addr v10, v12

    .line 398
    iput-wide v10, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 399
    .line 400
    if-nez v7, :cond_f

    .line 401
    .line 402
    invoke-virtual {v0, v8, v9, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 403
    .line 404
    .line 405
    goto :goto_a

    .line 406
    :cond_f
    invoke-virtual {v7, v8, v9, v5}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 407
    .line 408
    .line 409
    :goto_a
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->updatePercent()V

    .line 410
    .line 411
    .line 412
    invoke-virtual {p0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->isNeedPause()Z

    .line 413
    .line 414
    .line 415
    move-result v5

    .line 416
    if-eqz v5, :cond_b

    .line 417
    .line 418
    iget-wide v9, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mWriteLength:J

    .line 419
    .line 420
    iget-wide v11, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mFileLength:J

    .line 421
    .line 422
    cmp-long v5, v9, v11

    .line 423
    .line 424
    if-gez v5, :cond_b

    .line 425
    .line 426
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 427
    .line 428
    invoke-virtual {p0, v5}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onPause(Ljava/lang/Boolean;)V

    .line 429
    .line 430
    .line 431
    goto :goto_b

    .line 432
    :cond_10
    iput v9, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 433
    .line 434
    invoke-virtual {p0, v3}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onSuccess(Ljava/io/File;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    .line 435
    .line 436
    .line 437
    :goto_b
    if-eqz v0, :cond_11

    .line 438
    .line 439
    :try_start_10
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_5

    .line 440
    .line 441
    .line 442
    goto :goto_c

    .line 443
    :catch_5
    move-exception p0

    .line 444
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 445
    .line 446
    .line 447
    :cond_11
    :goto_c
    :try_start_11
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_6

    .line 448
    .line 449
    .line 450
    goto :goto_d

    .line 451
    :catch_6
    move-exception p0

    .line 452
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 453
    .line 454
    .line 455
    :goto_d
    if-eqz v7, :cond_d

    .line 456
    .line 457
    goto :goto_8

    .line 458
    :catch_7
    move-exception v0

    .line 459
    :try_start_12
    iget v5, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 460
    .line 461
    if-lez v5, :cond_12

    .line 462
    .line 463
    iget v5, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 464
    .line 465
    sub-int/2addr v5, v1

    .line 466
    iput v5, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 467
    .line 468
    :cond_12
    iget v5, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 469
    .line 470
    if-nez v5, :cond_d

    .line 471
    .line 472
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onFail(Ljava/lang/Throwable;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 476
    .line 477
    .line 478
    move-result v0

    .line 479
    if-eqz v0, :cond_d

    .line 480
    .line 481
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 482
    .line 483
    .line 484
    goto :goto_9

    .line 485
    :catchall_4
    move-exception v0

    .line 486
    move-object v3, v2

    .line 487
    move-object v4, v3

    .line 488
    move-object v5, v4

    .line 489
    move-object v7, v5

    .line 490
    :goto_e
    :try_start_13
    iget v6, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 491
    .line 492
    if-lez v6, :cond_13

    .line 493
    .line 494
    sub-int/2addr v6, v1

    .line 495
    iput v6, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 496
    .line 497
    goto :goto_f

    .line 498
    :catchall_5
    move-exception p0

    .line 499
    goto :goto_13

    .line 500
    :cond_13
    :goto_f
    iget v1, p0, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->mRetryTime:I

    .line 501
    .line 502
    if-nez v1, :cond_14

    .line 503
    .line 504
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {p0, v0}, Lcom/tantanapp/media/ttmediautils/download/DownloadTask;->onFail(Ljava/lang/Throwable;)V

    .line 508
    .line 509
    .line 510
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 511
    .line 512
    .line 513
    move-result p0

    .line 514
    if-eqz p0, :cond_14

    .line 515
    .line 516
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 517
    .line 518
    .line 519
    :cond_14
    if-eqz v4, :cond_15

    .line 520
    .line 521
    :try_start_14
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_8

    .line 522
    .line 523
    .line 524
    goto :goto_10

    .line 525
    :catch_8
    move-exception p0

    .line 526
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 527
    .line 528
    .line 529
    :cond_15
    :goto_10
    if-eqz v3, :cond_16

    .line 530
    .line 531
    :try_start_15
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_9

    .line 532
    .line 533
    .line 534
    goto :goto_11

    .line 535
    :catch_9
    move-exception p0

    .line 536
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 537
    .line 538
    .line 539
    :cond_16
    :goto_11
    if-eqz v7, :cond_17

    .line 540
    .line 541
    :try_start_16
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_a

    .line 542
    .line 543
    .line 544
    goto :goto_12

    .line 545
    :catch_a
    move-exception p0

    .line 546
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 547
    .line 548
    .line 549
    :cond_17
    :goto_12
    if-eqz v5, :cond_1c

    .line 550
    .line 551
    :try_start_17
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_4

    .line 552
    .line 553
    .line 554
    goto :goto_18

    .line 555
    :goto_13
    if-eqz v4, :cond_18

    .line 556
    .line 557
    :try_start_18
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_b

    .line 558
    .line 559
    .line 560
    goto :goto_14

    .line 561
    :catch_b
    move-exception v0

    .line 562
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 563
    .line 564
    .line 565
    :cond_18
    :goto_14
    if-eqz v3, :cond_19

    .line 566
    .line 567
    :try_start_19
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_c

    .line 568
    .line 569
    .line 570
    goto :goto_15

    .line 571
    :catch_c
    move-exception v0

    .line 572
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 573
    .line 574
    .line 575
    :cond_19
    :goto_15
    if-eqz v7, :cond_1a

    .line 576
    .line 577
    :try_start_1a
    invoke-virtual {v7}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1a} :catch_d

    .line 578
    .line 579
    .line 580
    goto :goto_16

    .line 581
    :catch_d
    move-exception v0

    .line 582
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 583
    .line 584
    .line 585
    :cond_1a
    :goto_16
    if-eqz v5, :cond_1b

    .line 586
    .line 587
    :try_start_1b
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_e

    .line 588
    .line 589
    .line 590
    goto :goto_17

    .line 591
    :catch_e
    move-exception v0

    .line 592
    invoke-static {v0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 593
    .line 594
    .line 595
    :cond_1b
    :goto_17
    throw p0

    .line 596
    :cond_1c
    :goto_18
    return-void
.end method

.method private static getFileNameByConnection(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0x2f

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    add-int/2addr v1, v2

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v3, ".apk"

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    const-string v3, "UTF-8"

    .line 32
    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    :try_start_1
    const-string v0, "Content-Disposition"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    const-string v0, ";"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    aget-object p0, p0, v2

    .line 50
    .line 51
    const-string v0, "="

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    aget-object p0, p0, v2

    .line 58
    .line 59
    const-string v0, "\""

    .line 60
    .line 61
    const-string v1, ""

    .line 62
    .line 63
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    invoke-static {v0, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception p0

    .line 78
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/log/SLog;->printStackTrace(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    :cond_1
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    const-string p0, "tantan.apk"

    .line 89
    .line 90
    :cond_2
    return-object p0
.end method

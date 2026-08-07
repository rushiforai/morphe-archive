.class public Ll/ynl;
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

.method public static synthetic a(Lcom/p1/mobile/putong/ui/download/DownloadTask;Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "downloadFile waitConnectRetry "

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v0, ", path = "

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v0, ", url = "

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v0, "[common][download]"

    .line 42
    .line 43
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->D(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic b(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "downloadFile failed, path = "

    .line 4
    .line 5
    const-string v3, ", downloadedByteCount = "

    .line 6
    .line 7
    if-eqz v1, :cond_2f

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v4, "downloadFile path = "

    .line 12
    .line 13
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v4, ", url = "

    .line 24
    .line 25
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v5, "[common][download]"

    .line 40
    .line 41
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->r()Lcom/tantanapp/common/network/ApiCallBack;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    const/4 v7, 0x1

    .line 49
    const/4 v9, 0x0

    .line 50
    const-wide/16 v10, 0x0

    .line 51
    .line 52
    :try_start_0
    new-instance v12, Ljava/io/File;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-direct {v12, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_18

    .line 59
    .line 60
    .line 61
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 62
    .line 63
    .line 64
    move-result-wide v13

    .line 65
    iput-wide v13, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->m:J

    .line 66
    .line 67
    iget-boolean v0, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->c:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_17

    .line 68
    .line 69
    if-nez v0, :cond_0

    .line 70
    .line 71
    :try_start_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->O()V

    .line 72
    .line 73
    .line 74
    iput-boolean v7, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->c:Z

    .line 75
    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide v13

    .line 80
    iput-wide v13, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->b:J

    .line 81
    .line 82
    iget-boolean v0, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->d:Z

    .line 83
    .line 84
    if-nez v0, :cond_0

    .line 85
    .line 86
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    invoke-virtual {v12}, Ljava/io/File;->delete()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :catchall_0
    move-exception v0

    .line 97
    move-object v15, v4

    .line 98
    move-object v7, v9

    .line 99
    move-object/from16 v16, v7

    .line 100
    .line 101
    move-object/from16 v17, v16

    .line 102
    .line 103
    move-wide v13, v10

    .line 104
    move-object v11, v2

    .line 105
    move-object v4, v3

    .line 106
    move-object/from16 v10, v17

    .line 107
    .line 108
    goto/16 :goto_29

    .line 109
    .line 110
    :cond_0
    :goto_0
    :try_start_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->B()Z

    .line 111
    .line 112
    .line 113
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_17

    .line 114
    const-string v13, "downloadFile paused, path = "

    .line 115
    .line 116
    if-eqz v0, :cond_1

    .line 117
    .line 118
    :try_start_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q()V

    .line 119
    .line 120
    .line 121
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->N(Ljava/lang/Boolean;)V

    .line 124
    .line 125
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v0, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v13

    .line 135
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 153
    .line 154
    .line 155
    if-eqz v6, :cond_2f

    .line 156
    .line 157
    invoke-interface {v6, v9}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_1
    :try_start_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->C()Z

    .line 162
    .line 163
    .line 164
    move-result v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_17

    .line 165
    if-eqz v0, :cond_2

    .line 166
    .line 167
    :try_start_6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q()V

    .line 168
    .line 169
    .line 170
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 171
    .line 172
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->N(Ljava/lang/Boolean;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 173
    .line 174
    .line 175
    :cond_2
    :try_start_7
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    .line 176
    .line 177
    .line 178
    move-result v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_17

    .line 179
    if-nez v0, :cond_4

    .line 180
    .line 181
    :try_start_8
    invoke-virtual {v12}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    if-eqz v0, :cond_3

    .line 186
    .line 187
    invoke-virtual {v12}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-nez v0, :cond_3

    .line 196
    .line 197
    invoke-virtual {v12}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 202
    .line 203
    .line 204
    :cond_3
    invoke-virtual {v12}, Ljava/io/File;->createNewFile()Z

    .line 205
    .line 206
    .line 207
    iput-wide v10, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 208
    .line 209
    :cond_4
    :try_start_9
    new-instance v0, Ljava/net/URL;

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v14

    .line 215
    invoke-direct {v0, v14}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v14

    .line 222
    iput-object v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->p:Ljava/lang/String;

    .line 223
    .line 224
    new-instance v14, Ll/x1d0$a;

    .line 225
    .line 226
    invoke-direct {v14}, Ll/x1d0$a;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v14, v0}, Ll/x1d0$a;->r(Ljava/net/URL;)Ll/x1d0$a;

    .line 230
    .line 231
    .line 232
    move-result-object v14

    .line 233
    const-string v15, "Connection"

    .line 234
    .line 235
    const-string v7, "Keep-Alive"

    .line 236
    .line 237
    invoke-virtual {v14, v15, v7}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    const-string v14, "Charset"

    .line 242
    .line 243
    const-string v15, "UTF-8"

    .line 244
    .line 245
    invoke-virtual {v7, v14, v15}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 246
    .line 247
    .line 248
    move-result-object v7

    .line 249
    const-string v14, "Accept-Encoding"

    .line 250
    .line 251
    const-string v15, "identity"

    .line 252
    .line 253
    invoke-virtual {v7, v14, v15}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 254
    .line 255
    .line 256
    move-result-object v7

    .line 257
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->u()Ljava/util/Map;

    .line 258
    .line 259
    .line 260
    move-result-object v14
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_17

    .line 261
    if-eqz v14, :cond_5

    .line 262
    .line 263
    :try_start_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->u()Ljava/util/Map;

    .line 264
    .line 265
    .line 266
    move-result-object v14

    .line 267
    invoke-interface {v14}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 268
    .line 269
    .line 270
    move-result-object v14

    .line 271
    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 272
    .line 273
    .line 274
    move-result-object v14

    .line 275
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 276
    .line 277
    .line 278
    move-result v15

    .line 279
    if-eqz v15, :cond_5

    .line 280
    .line 281
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v15

    .line 285
    check-cast v15, Ljava/util/Map$Entry;

    .line 286
    .line 287
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v16

    .line 291
    move-object/from16 v9, v16

    .line 292
    .line 293
    check-cast v9, Ljava/lang/String;

    .line 294
    .line 295
    invoke-interface {v15}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v15

    .line 299
    check-cast v15, Ljava/lang/String;

    .line 300
    .line 301
    invoke-virtual {v7, v9, v15}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 302
    .line 303
    .line 304
    const/4 v9, 0x0

    .line 305
    goto :goto_1

    .line 306
    :catchall_1
    move-exception v0

    .line 307
    move-object v15, v4

    .line 308
    move-wide v13, v10

    .line 309
    const/4 v7, 0x0

    .line 310
    const/4 v9, 0x0

    .line 311
    const/4 v10, 0x0

    .line 312
    const/16 v16, 0x0

    .line 313
    .line 314
    const/16 v17, 0x0

    .line 315
    .line 316
    move-object v11, v2

    .line 317
    :goto_2
    move-object v4, v3

    .line 318
    goto/16 :goto_29

    .line 319
    .line 320
    :cond_5
    :try_start_b
    iget-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_17

    .line 321
    .line 322
    cmp-long v9, v14, v10

    .line 323
    .line 324
    const-string v14, "-"

    .line 325
    .line 326
    const-string v15, "bytes="

    .line 327
    .line 328
    move-wide/from16 v18, v10

    .line 329
    .line 330
    const-string v10, "Range"

    .line 331
    .line 332
    if-lez v9, :cond_6

    .line 333
    .line 334
    :try_start_c
    new-instance v9, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 340
    .line 341
    .line 342
    move-object v11, v2

    .line 343
    move-object/from16 v16, v3

    .line 344
    .line 345
    :try_start_d
    iget-wide v2, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 346
    .line 347
    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    iget-wide v2, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J

    .line 354
    .line 355
    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-virtual {v7, v10, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 363
    .line 364
    .line 365
    goto :goto_8

    .line 366
    :catchall_2
    move-exception v0

    .line 367
    :goto_3
    move-object v15, v4

    .line 368
    move-object/from16 v4, v16

    .line 369
    .line 370
    :goto_4
    move-wide/from16 v13, v18

    .line 371
    .line 372
    const/4 v7, 0x0

    .line 373
    const/4 v9, 0x0

    .line 374
    :goto_5
    const/4 v10, 0x0

    .line 375
    :goto_6
    const/16 v16, 0x0

    .line 376
    .line 377
    :goto_7
    const/16 v17, 0x0

    .line 378
    .line 379
    goto/16 :goto_29

    .line 380
    .line 381
    :catchall_3
    move-exception v0

    .line 382
    move-object v11, v2

    .line 383
    move-object/from16 v16, v3

    .line 384
    .line 385
    goto :goto_3

    .line 386
    :cond_6
    move-object v11, v2

    .line 387
    move-object/from16 v16, v3

    .line 388
    .line 389
    iget-wide v2, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 390
    .line 391
    cmp-long v2, v2, v18

    .line 392
    .line 393
    if-lez v2, :cond_7

    .line 394
    .line 395
    new-instance v2, Ljava/lang/StringBuilder;

    .line 396
    .line 397
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 398
    .line 399
    .line 400
    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    iget-wide v8, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 404
    .line 405
    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    invoke-virtual {v7, v10, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 416
    .line 417
    .line 418
    :cond_7
    :goto_8
    invoke-virtual {v7}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 419
    .line 420
    .line 421
    move-result-object v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 422
    const-string v7, ", path = "

    .line 423
    .line 424
    if-eqz v6, :cond_8

    .line 425
    .line 426
    :try_start_e
    invoke-interface {v6, v2}, Lcom/tantanapp/common/network/ApiCallBack;->beforeCall(Ll/x1d0;)Ll/x1d0;

    .line 427
    .line 428
    .line 429
    move-result-object v2
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 430
    goto :goto_a

    .line 431
    :catchall_4
    move-exception v0

    .line 432
    move-object v9, v2

    .line 433
    move-object v15, v4

    .line 434
    move-object/from16 v4, v16

    .line 435
    .line 436
    :goto_9
    move-wide/from16 v13, v18

    .line 437
    .line 438
    const/4 v7, 0x0

    .line 439
    goto :goto_5

    .line 440
    :catch_0
    move-exception v0

    .line 441
    move-object v15, v4

    .line 442
    move-object/from16 v4, v16

    .line 443
    .line 444
    goto/16 :goto_27

    .line 445
    .line 446
    :cond_8
    :goto_a
    :try_start_f
    iget-object v8, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->a:Ll/rg50;

    .line 447
    .line 448
    invoke-virtual {v8, v2}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 449
    .line 450
    .line 451
    move-result-object v8

    .line 452
    invoke-interface {v8}, Ll/ry3;->execute()Ll/i5d0;

    .line 453
    .line 454
    .line 455
    move-result-object v8
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_15

    .line 456
    :try_start_10
    invoke-virtual {v8}, Ll/i5d0;->q()I

    .line 457
    .line 458
    .line 459
    move-result v9

    .line 460
    iput v9, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->j:I

    .line 461
    .line 462
    new-instance v10, Ljava/lang/StringBuilder;

    .line 463
    .line 464
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 465
    .line 466
    .line 467
    const-string v14, "downloadFile response code = "

    .line 468
    .line 469
    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    .line 471
    .line 472
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v7

    .line 482
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object v7

    .line 489
    invoke-static {v5, v7}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_14

    .line 490
    .line 491
    .line 492
    const/16 v7, 0xc8

    .line 493
    .line 494
    if-eq v7, v9, :cond_b

    .line 495
    .line 496
    const/16 v7, 0xce

    .line 497
    .line 498
    if-ne v7, v9, :cond_9

    .line 499
    .line 500
    goto :goto_e

    .line 501
    :cond_9
    :try_start_11
    iget-boolean v0, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->d:Z

    .line 502
    .line 503
    if-eqz v0, :cond_a

    .line 504
    .line 505
    const/16 v0, 0x1a0

    .line 506
    .line 507
    if-ne v9, v0, :cond_a

    .line 508
    .line 509
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    .line 510
    .line 511
    .line 512
    move-result v0

    .line 513
    if-eqz v0, :cond_a

    .line 514
    .line 515
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 516
    .line 517
    .line 518
    goto :goto_d

    .line 519
    :catchall_5
    move-exception v0

    .line 520
    move-object v9, v2

    .line 521
    move-object v15, v4

    .line 522
    move-object/from16 v4, v16

    .line 523
    .line 524
    move-wide/from16 v13, v18

    .line 525
    .line 526
    const/4 v7, 0x0

    .line 527
    const/4 v10, 0x0

    .line 528
    :goto_b
    const/16 v17, 0x0

    .line 529
    .line 530
    :goto_c
    move-object/from16 v16, v8

    .line 531
    .line 532
    goto/16 :goto_29

    .line 533
    .line 534
    :cond_a
    :goto_d
    new-instance v0, Ljava/lang/Exception;

    .line 535
    .line 536
    new-instance v7, Ljava/lang/StringBuilder;

    .line 537
    .line 538
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 539
    .line 540
    .line 541
    const-string v10, "httpURLConnection.getResponseCode()="

    .line 542
    .line 543
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v7

    .line 553
    invoke-direct {v0, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 554
    .line 555
    .line 556
    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 557
    :cond_b
    :goto_e
    :try_start_12
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 558
    .line 559
    .line 560
    move-result-wide v9

    .line 561
    iput-wide v9, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->n:J

    .line 562
    .line 563
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->z()Z

    .line 564
    .line 565
    .line 566
    move-result v7
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_14

    .line 567
    const-string v9, "downloadFile canceled, path = "

    .line 568
    .line 569
    if-eqz v7, :cond_d

    .line 570
    .line 571
    :try_start_13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 572
    .line 573
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object v7

    .line 583
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    if-eqz v6, :cond_c

    .line 594
    .line 595
    invoke-interface {v6, v2}, Lcom/tantanapp/common/network/ApiCallBack;->requestCancel(Ll/x1d0;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .line 596
    .line 597
    .line 598
    :cond_c
    :try_start_14
    invoke-virtual {v8}, Ll/i5d0;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_1

    .line 599
    .line 600
    .line 601
    goto :goto_f

    .line 602
    :catch_1
    move-exception v0

    .line 603
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 604
    .line 605
    .line 606
    :goto_f
    if-eqz v6, :cond_2f

    .line 607
    .line 608
    :goto_10
    invoke-interface {v6, v2}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 609
    .line 610
    .line 611
    goto/16 :goto_35

    .line 612
    .line 613
    :cond_d
    :try_start_15
    invoke-virtual {v2}, Ll/x1d0;->g()Ljava/lang/String;

    .line 614
    .line 615
    .line 616
    move-result-object v7

    .line 617
    iput-object v7, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->i:Ljava/lang/String;

    .line 618
    .line 619
    invoke-virtual {v8}, Ll/i5d0;->k()Ll/k5d0;

    .line 620
    .line 621
    .line 622
    move-result-object v7
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_14

    .line 623
    if-eqz v7, :cond_e

    .line 624
    .line 625
    :try_start_16
    invoke-virtual {v8}, Ll/i5d0;->k()Ll/k5d0;

    .line 626
    .line 627
    .line 628
    move-result-object v7

    .line 629
    invoke-virtual {v7}, Ll/k5d0;->contentLength()J

    .line 630
    .line 631
    .line 632
    move-result-wide v14

    .line 633
    iput-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->h:J
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_5

    .line 634
    .line 635
    :cond_e
    :try_start_17
    iget-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_14

    .line 636
    .line 637
    cmp-long v7, v14, v18

    .line 638
    .line 639
    if-gtz v7, :cond_f

    .line 640
    .line 641
    :try_start_18
    invoke-static {v0, v2}, Ll/ynl;->d(Ljava/net/URL;Ll/x1d0;)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->J(Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    iget-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 649
    .line 650
    invoke-virtual {v8}, Ll/i5d0;->k()Ll/k5d0;

    .line 651
    .line 652
    .line 653
    move-result-object v0

    .line 654
    invoke-virtual {v0}, Ll/k5d0;->contentLength()J

    .line 655
    .line 656
    .line 657
    move-result-wide v20

    .line 658
    add-long v14, v14, v20

    .line 659
    .line 660
    iput-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_5

    .line 661
    .line 662
    :cond_f
    :try_start_19
    iget-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_14

    .line 663
    .line 664
    cmp-long v0, v14, v18

    .line 665
    .line 666
    if-lez v0, :cond_10

    .line 667
    .line 668
    :try_start_1a
    new-instance v7, Ljava/io/RandomAccessFile;

    .line 669
    .line 670
    const-string v0, "rwd"

    .line 671
    .line 672
    invoke-direct {v7, v12, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_5

    .line 673
    .line 674
    .line 675
    :try_start_1b
    iget-wide v14, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 676
    .line 677
    invoke-virtual {v7, v14, v15}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_6

    .line 678
    .line 679
    .line 680
    move-object v10, v7

    .line 681
    const/4 v7, 0x0

    .line 682
    goto :goto_11

    .line 683
    :catchall_6
    move-exception v0

    .line 684
    move-object v9, v2

    .line 685
    move-object v15, v4

    .line 686
    move-object v10, v7

    .line 687
    move-object/from16 v4, v16

    .line 688
    .line 689
    move-wide/from16 v13, v18

    .line 690
    .line 691
    const/4 v7, 0x0

    .line 692
    goto/16 :goto_b

    .line 693
    .line 694
    :cond_10
    :try_start_1c
    new-instance v0, Ljava/io/FileOutputStream;

    .line 695
    .line 696
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object v7

    .line 700
    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_14

    .line 701
    .line 702
    .line 703
    move-object v7, v0

    .line 704
    const/4 v10, 0x0

    .line 705
    :goto_11
    :try_start_1d
    invoke-virtual {v8}, Ll/i5d0;->k()Ll/k5d0;

    .line 706
    .line 707
    .line 708
    move-result-object v0

    .line 709
    invoke-virtual {v0}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 710
    .line 711
    .line 712
    move-result-object v14
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_13

    .line 713
    :try_start_1e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->s()I

    .line 714
    .line 715
    .line 716
    move-result v0

    .line 717
    new-array v0, v0, [B
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_12

    .line 718
    .line 719
    move-object v15, v4

    .line 720
    :try_start_1f
    iget-wide v3, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_11

    .line 721
    .line 722
    cmp-long v3, v3, v18

    .line 723
    .line 724
    const/4 v4, -0x1

    .line 725
    if-gtz v3, :cond_11

    .line 726
    .line 727
    :try_start_20
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->M(I)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_7

    .line 728
    .line 729
    .line 730
    goto :goto_12

    .line 731
    :catchall_7
    move-exception v0

    .line 732
    move-object v9, v2

    .line 733
    move-object/from16 v17, v14

    .line 734
    .line 735
    move-object/from16 v4, v16

    .line 736
    .line 737
    move-wide/from16 v13, v18

    .line 738
    .line 739
    goto/16 :goto_c

    .line 740
    .line 741
    :cond_11
    :goto_12
    :try_start_21
    invoke-virtual {v14, v0}, Ljava/io/InputStream;->read([B)I

    .line 742
    .line 743
    .line 744
    move-result v3
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_11

    .line 745
    if-eq v3, v4, :cond_19

    .line 746
    .line 747
    move-object/from16 v21, v5

    .line 748
    .line 749
    int-to-long v4, v3

    .line 750
    move-wide/from16 v22, v4

    .line 751
    .line 752
    add-long v4, v18, v22

    .line 753
    .line 754
    :try_start_22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->z()Z

    .line 755
    .line 756
    .line 757
    move-result v18
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_e

    .line 758
    if-eqz v18, :cond_15

    .line 759
    .line 760
    :try_start_23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 761
    .line 762
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 763
    .line 764
    .line 765
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 766
    .line 767
    .line 768
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 769
    .line 770
    .line 771
    move-result-object v3

    .line 772
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 773
    .line 774
    .line 775
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 776
    .line 777
    .line 778
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 779
    .line 780
    .line 781
    move-result-object v3

    .line 782
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_a

    .line 783
    .line 784
    .line 785
    move-object/from16 v3, v16

    .line 786
    .line 787
    :try_start_24
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 788
    .line 789
    .line 790
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 791
    .line 792
    .line 793
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v0
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_9

    .line 797
    move-object/from16 v9, v21

    .line 798
    .line 799
    :try_start_25
    invoke-static {v9, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 800
    .line 801
    .line 802
    if-eqz v6, :cond_12

    .line 803
    .line 804
    invoke-interface {v6, v2}, Lcom/tantanapp/common/network/ApiCallBack;->requestCancel(Ll/x1d0;)V
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_8

    .line 805
    .line 806
    .line 807
    goto :goto_14

    .line 808
    :catchall_8
    move-exception v0

    .line 809
    :goto_13
    move-object/from16 v16, v8

    .line 810
    .line 811
    move-object/from16 v17, v14

    .line 812
    .line 813
    move-wide v13, v4

    .line 814
    move-object v5, v9

    .line 815
    move-object v9, v2

    .line 816
    goto/16 :goto_2

    .line 817
    .line 818
    :cond_12
    :goto_14
    if-eqz v7, :cond_13

    .line 819
    .line 820
    :try_start_26
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_26} :catch_2

    .line 821
    .line 822
    .line 823
    goto :goto_15

    .line 824
    :catch_2
    move-exception v0

    .line 825
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 826
    .line 827
    .line 828
    :cond_13
    :goto_15
    :try_start_27
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_27} :catch_3

    .line 829
    .line 830
    .line 831
    goto :goto_16

    .line 832
    :catch_3
    move-exception v0

    .line 833
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 834
    .line 835
    .line 836
    :goto_16
    if-eqz v10, :cond_14

    .line 837
    .line 838
    :try_start_28
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_28} :catch_4

    .line 839
    .line 840
    .line 841
    goto :goto_17

    .line 842
    :catch_4
    move-exception v0

    .line 843
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 844
    .line 845
    .line 846
    :cond_14
    :goto_17
    :try_start_29
    invoke-virtual {v8}, Ll/i5d0;->close()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_5

    .line 847
    .line 848
    .line 849
    goto :goto_18

    .line 850
    :catch_5
    move-exception v0

    .line 851
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 852
    .line 853
    .line 854
    :goto_18
    if-eqz v6, :cond_2f

    .line 855
    .line 856
    goto/16 :goto_10

    .line 857
    .line 858
    :catchall_9
    move-exception v0

    .line 859
    :goto_19
    move-object/from16 v9, v21

    .line 860
    .line 861
    goto :goto_13

    .line 862
    :catchall_a
    move-exception v0

    .line 863
    move-object/from16 v3, v16

    .line 864
    .line 865
    goto :goto_19

    .line 866
    :cond_15
    move-wide/from16 v18, v4

    .line 867
    .line 868
    move-object/from16 v4, v16

    .line 869
    .line 870
    move-object/from16 v5, v21

    .line 871
    .line 872
    move-object/from16 v16, v8

    .line 873
    .line 874
    move-object/from16 v21, v9

    .line 875
    .line 876
    :try_start_2a
    iget-wide v8, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J

    .line 877
    .line 878
    add-long v8, v8, v22

    .line 879
    .line 880
    iput-wide v8, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_d

    .line 881
    .line 882
    if-nez v10, :cond_16

    .line 883
    .line 884
    const/4 v8, 0x0

    .line 885
    :try_start_2b
    invoke-virtual {v7, v0, v8, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_b

    .line 886
    .line 887
    .line 888
    goto :goto_1b

    .line 889
    :catchall_b
    move-exception v0

    .line 890
    :goto_1a
    move-object v9, v2

    .line 891
    move-object/from16 v17, v14

    .line 892
    .line 893
    move-wide/from16 v13, v18

    .line 894
    .line 895
    goto/16 :goto_29

    .line 896
    .line 897
    :cond_16
    const/4 v8, 0x0

    .line 898
    :try_start_2c
    invoke-virtual {v10, v0, v8, v3}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 899
    .line 900
    .line 901
    :goto_1b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->S()V

    .line 902
    .line 903
    .line 904
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->B()Z

    .line 905
    .line 906
    .line 907
    move-result v8

    .line 908
    if-eqz v8, :cond_17

    .line 909
    .line 910
    iget-wide v8, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->g:J
    :try_end_2c
    .catchall {:try_start_2c .. :try_end_2c} :catchall_d

    .line 911
    .line 912
    move-object/from16 v20, v4

    .line 913
    .line 914
    :try_start_2d
    iget-wide v3, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->f:J
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_c

    .line 915
    .line 916
    cmp-long v3, v8, v3

    .line 917
    .line 918
    if-gez v3, :cond_18

    .line 919
    .line 920
    const/4 v3, 0x1

    .line 921
    :goto_1c
    move-wide/from16 v8, v18

    .line 922
    .line 923
    goto :goto_1e

    .line 924
    :catchall_c
    move-exception v0

    .line 925
    :goto_1d
    move-object v9, v2

    .line 926
    move-object/from16 v17, v14

    .line 927
    .line 928
    move-wide/from16 v13, v18

    .line 929
    .line 930
    move-object/from16 v4, v20

    .line 931
    .line 932
    goto/16 :goto_29

    .line 933
    .line 934
    :catchall_d
    move-exception v0

    .line 935
    move-object/from16 v20, v4

    .line 936
    .line 937
    goto :goto_1a

    .line 938
    :cond_17
    move-object/from16 v20, v4

    .line 939
    .line 940
    :cond_18
    move-object/from16 v8, v16

    .line 941
    .line 942
    move-object/from16 v16, v20

    .line 943
    .line 944
    move-object/from16 v9, v21

    .line 945
    .line 946
    const/4 v4, -0x1

    .line 947
    goto/16 :goto_12

    .line 948
    .line 949
    :catchall_e
    move-exception v0

    .line 950
    move-wide/from16 v18, v4

    .line 951
    .line 952
    move-object/from16 v20, v16

    .line 953
    .line 954
    move-object/from16 v5, v21

    .line 955
    .line 956
    move-object/from16 v16, v8

    .line 957
    .line 958
    goto :goto_1d

    .line 959
    :cond_19
    move-object/from16 v20, v16

    .line 960
    .line 961
    move-object/from16 v16, v8

    .line 962
    .line 963
    const/4 v3, 0x0

    .line 964
    goto :goto_1c

    .line 965
    :goto_1e
    if-eqz v3, :cond_1a

    .line 966
    .line 967
    :try_start_2e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q()V

    .line 968
    .line 969
    .line 970
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 971
    .line 972
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->N(Ljava/lang/Boolean;)V

    .line 973
    .line 974
    .line 975
    new-instance v0, Ljava/lang/StringBuilder;

    .line 976
    .line 977
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 978
    .line 979
    .line 980
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 981
    .line 982
    .line 983
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 984
    .line 985
    .line 986
    move-result-object v3

    .line 987
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 988
    .line 989
    .line 990
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 991
    .line 992
    .line 993
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 994
    .line 995
    .line 996
    move-result-object v3

    .line 997
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_10

    .line 998
    .line 999
    .line 1000
    move-object/from16 v4, v20

    .line 1001
    .line 1002
    :try_start_2f
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1003
    .line 1004
    .line 1005
    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 1006
    .line 1007
    .line 1008
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v0

    .line 1012
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1013
    .line 1014
    .line 1015
    goto :goto_20

    .line 1016
    :catchall_f
    move-exception v0

    .line 1017
    :goto_1f
    move-object/from16 v17, v14

    .line 1018
    .line 1019
    move-wide v13, v8

    .line 1020
    move-object v9, v2

    .line 1021
    goto/16 :goto_29

    .line 1022
    .line 1023
    :catchall_10
    move-exception v0

    .line 1024
    move-object/from16 v4, v20

    .line 1025
    .line 1026
    goto :goto_1f

    .line 1027
    :cond_1a
    move-object/from16 v4, v20

    .line 1028
    .line 1029
    const/4 v3, 0x0

    .line 1030
    iput v3, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_f

    .line 1031
    .line 1032
    :try_start_30
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 1033
    .line 1034
    .line 1035
    move-result-wide v3

    .line 1036
    iput-wide v3, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->o:J

    .line 1037
    .line 1038
    invoke-virtual {v1, v12}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->P(Ljava/io/File;)V

    .line 1039
    .line 1040
    .line 1041
    new-instance v0, Ljava/lang/StringBuilder;

    .line 1042
    .line 1043
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1044
    .line 1045
    .line 1046
    const-string v3, "downloadFile succeed, path = "

    .line 1047
    .line 1048
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1049
    .line 1050
    .line 1051
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 1052
    .line 1053
    .line 1054
    move-result-object v3

    .line 1055
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1056
    .line 1057
    .line 1058
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1059
    .line 1060
    .line 1061
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 1062
    .line 1063
    .line 1064
    move-result-object v3

    .line 1065
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_10

    .line 1066
    .line 1067
    .line 1068
    move-object/from16 v4, v20

    .line 1069
    .line 1070
    :try_start_31
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1071
    .line 1072
    .line 1073
    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 1074
    .line 1075
    .line 1076
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v0

    .line 1080
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_f

    .line 1081
    .line 1082
    .line 1083
    :goto_20
    if-eqz v7, :cond_1b

    .line 1084
    .line 1085
    :try_start_32
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_32} :catch_6

    .line 1086
    .line 1087
    .line 1088
    goto :goto_21

    .line 1089
    :catch_6
    move-exception v0

    .line 1090
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1091
    .line 1092
    .line 1093
    :cond_1b
    :goto_21
    :try_start_33
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_33} :catch_7

    .line 1094
    .line 1095
    .line 1096
    goto :goto_22

    .line 1097
    :catch_7
    move-exception v0

    .line 1098
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1099
    .line 1100
    .line 1101
    :goto_22
    if-eqz v10, :cond_1c

    .line 1102
    .line 1103
    :try_start_34
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_34} :catch_8

    .line 1104
    .line 1105
    .line 1106
    goto :goto_23

    .line 1107
    :catch_8
    move-exception v0

    .line 1108
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1109
    .line 1110
    .line 1111
    :cond_1c
    :goto_23
    :try_start_35
    invoke-virtual/range {v16 .. v16}, Ll/i5d0;->close()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_35} :catch_9

    .line 1112
    .line 1113
    .line 1114
    goto :goto_24

    .line 1115
    :catch_9
    move-exception v0

    .line 1116
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1117
    .line 1118
    .line 1119
    :goto_24
    if-eqz v6, :cond_2f

    .line 1120
    .line 1121
    goto/16 :goto_10

    .line 1122
    .line 1123
    :catchall_11
    move-exception v0

    .line 1124
    :goto_25
    move-object/from16 v4, v16

    .line 1125
    .line 1126
    move-object/from16 v16, v8

    .line 1127
    .line 1128
    goto/16 :goto_1a

    .line 1129
    .line 1130
    :catchall_12
    move-exception v0

    .line 1131
    move-object v15, v4

    .line 1132
    goto :goto_25

    .line 1133
    :catchall_13
    move-exception v0

    .line 1134
    move-object v15, v4

    .line 1135
    move-object/from16 v4, v16

    .line 1136
    .line 1137
    move-object/from16 v16, v8

    .line 1138
    .line 1139
    move-object v9, v2

    .line 1140
    move-wide/from16 v13, v18

    .line 1141
    .line 1142
    goto/16 :goto_7

    .line 1143
    .line 1144
    :catchall_14
    move-exception v0

    .line 1145
    move-object v15, v4

    .line 1146
    move-object/from16 v4, v16

    .line 1147
    .line 1148
    move-object/from16 v16, v8

    .line 1149
    .line 1150
    move-object v9, v2

    .line 1151
    move-wide/from16 v13, v18

    .line 1152
    .line 1153
    const/4 v7, 0x0

    .line 1154
    const/4 v10, 0x0

    .line 1155
    goto/16 :goto_7

    .line 1156
    .line 1157
    :catchall_15
    move-exception v0

    .line 1158
    move-object v15, v4

    .line 1159
    move-object/from16 v4, v16

    .line 1160
    .line 1161
    :goto_26
    move-object v9, v2

    .line 1162
    goto/16 :goto_9

    .line 1163
    .line 1164
    :goto_27
    :try_start_36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 1165
    .line 1166
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 1167
    .line 1168
    .line 1169
    const-string v8, "downloadFile connect error : "

    .line 1170
    .line 1171
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1172
    .line 1173
    .line 1174
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1175
    .line 1176
    .line 1177
    move-result-object v8

    .line 1178
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1179
    .line 1180
    .line 1181
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1182
    .line 1183
    .line 1184
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 1185
    .line 1186
    .line 1187
    move-result-object v7

    .line 1188
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1189
    .line 1190
    .line 1191
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1192
    .line 1193
    .line 1194
    move-result-object v3

    .line 1195
    invoke-static {v5, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1196
    .line 1197
    .line 1198
    if-eqz v6, :cond_1d

    .line 1199
    .line 1200
    invoke-interface {v6, v2, v0}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiError(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 1201
    .line 1202
    .line 1203
    goto :goto_28

    .line 1204
    :catchall_16
    move-exception v0

    .line 1205
    goto :goto_26

    .line 1206
    :cond_1d
    :goto_28
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v3

    .line 1210
    invoke-static {v3}, Ll/ynl;->e(Ljava/lang/String;)Z

    .line 1211
    .line 1212
    .line 1213
    move-result v3

    .line 1214
    if-eqz v3, :cond_1e

    .line 1215
    .line 1216
    const/4 v3, 0x0

    .line 1217
    iput v3, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 1218
    .line 1219
    :cond_1e
    iget v7, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 1220
    .line 1221
    if-lez v7, :cond_1f

    .line 1222
    .line 1223
    invoke-static {v1}, Ll/ynl;->f(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 1224
    .line 1225
    .line 1226
    :cond_1f
    iget v7, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 1227
    .line 1228
    if-nez v7, :cond_20

    .line 1229
    .line 1230
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->L(Ljava/lang/Throwable;)V

    .line 1231
    .line 1232
    .line 1233
    iget-boolean v0, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->d:Z

    .line 1234
    .line 1235
    if-nez v0, :cond_20

    .line 1236
    .line 1237
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    .line 1238
    .line 1239
    .line 1240
    move-result v0

    .line 1241
    if-eqz v0, :cond_20

    .line 1242
    .line 1243
    invoke-virtual {v12}, Ljava/io/File;->delete()Z
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_16

    .line 1244
    .line 1245
    .line 1246
    :cond_20
    if-eqz v6, :cond_2f

    .line 1247
    .line 1248
    goto/16 :goto_10

    .line 1249
    .line 1250
    :catchall_17
    move-exception v0

    .line 1251
    move-object v15, v4

    .line 1252
    move-wide/from16 v18, v10

    .line 1253
    .line 1254
    move-object v11, v2

    .line 1255
    move-object v4, v3

    .line 1256
    goto/16 :goto_4

    .line 1257
    .line 1258
    :catchall_18
    move-exception v0

    .line 1259
    move-object v15, v4

    .line 1260
    move-wide/from16 v18, v10

    .line 1261
    .line 1262
    move-object v11, v2

    .line 1263
    move-object v4, v3

    .line 1264
    move-wide/from16 v13, v18

    .line 1265
    .line 1266
    const/4 v7, 0x0

    .line 1267
    const/4 v9, 0x0

    .line 1268
    const/4 v10, 0x0

    .line 1269
    const/4 v12, 0x0

    .line 1270
    goto/16 :goto_6

    .line 1271
    .line 1272
    :goto_29
    if-eqz v6, :cond_21

    .line 1273
    .line 1274
    :try_start_37
    invoke-interface {v6, v9, v0}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiError(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 1275
    .line 1276
    .line 1277
    goto :goto_2a

    .line 1278
    :catchall_19
    move-exception v0

    .line 1279
    move-object v1, v0

    .line 1280
    goto/16 :goto_30

    .line 1281
    .line 1282
    :cond_21
    :goto_2a
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1283
    .line 1284
    .line 1285
    move-result-object v2

    .line 1286
    iput-object v2, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->l:Ljava/lang/String;

    .line 1287
    .line 1288
    iput-object v0, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->k:Ljava/lang/Throwable;

    .line 1289
    .line 1290
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1291
    .line 1292
    .line 1293
    move-result-object v2

    .line 1294
    invoke-static {v2}, Ll/ynl;->e(Ljava/lang/String;)Z

    .line 1295
    .line 1296
    .line 1297
    move-result v2

    .line 1298
    if-eqz v2, :cond_22

    .line 1299
    .line 1300
    const/4 v3, 0x0

    .line 1301
    iput v3, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 1302
    .line 1303
    :cond_22
    iget v2, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 1304
    .line 1305
    if-lez v2, :cond_23

    .line 1306
    .line 1307
    invoke-static {v1}, Ll/ynl;->f(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 1308
    .line 1309
    .line 1310
    :cond_23
    iget v2, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 1311
    .line 1312
    if-nez v2, :cond_25

    .line 1313
    .line 1314
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1315
    .line 1316
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1317
    .line 1318
    .line 1319
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1320
    .line 1321
    .line 1322
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 1323
    .line 1324
    .line 1325
    move-result-object v3

    .line 1326
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1327
    .line 1328
    .line 1329
    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1330
    .line 1331
    .line 1332
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 1333
    .line 1334
    .line 1335
    move-result-object v3

    .line 1336
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1337
    .line 1338
    .line 1339
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1340
    .line 1341
    .line 1342
    invoke-virtual {v2, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 1343
    .line 1344
    .line 1345
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1346
    .line 1347
    .line 1348
    move-result-object v2

    .line 1349
    invoke-static {v5, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 1350
    .line 1351
    .line 1352
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 1353
    .line 1354
    .line 1355
    move-result-object v2

    .line 1356
    invoke-static {v2}, Ll/ynl;->e(Ljava/lang/String;)Z

    .line 1357
    .line 1358
    .line 1359
    move-result v2

    .line 1360
    if-eqz v2, :cond_24

    .line 1361
    .line 1362
    const/16 v2, 0x32

    .line 1363
    .line 1364
    goto :goto_2b

    .line 1365
    :cond_24
    const/4 v2, 0x1

    .line 1366
    :goto_2b
    new-instance v3, Ljava/lang/Throwable;

    .line 1367
    .line 1368
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1369
    .line 1370
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1371
    .line 1372
    .line 1373
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1374
    .line 1375
    .line 1376
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 1377
    .line 1378
    .line 1379
    move-result-object v5

    .line 1380
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1381
    .line 1382
    .line 1383
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1384
    .line 1385
    .line 1386
    invoke-virtual {v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->w()Ljava/lang/String;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v5

    .line 1390
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1391
    .line 1392
    .line 1393
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1394
    .line 1395
    .line 1396
    move-result-object v4

    .line 1397
    invoke-direct {v3, v4, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1398
    .line 1399
    .line 1400
    invoke-static {v3, v2}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 1401
    .line 1402
    .line 1403
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->L(Ljava/lang/Throwable;)V

    .line 1404
    .line 1405
    .line 1406
    iget-boolean v0, v1, Lcom/p1/mobile/putong/ui/download/DownloadTask;->d:Z

    .line 1407
    .line 1408
    if-nez v0, :cond_25

    .line 1409
    .line 1410
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    .line 1411
    .line 1412
    .line 1413
    move-result v0

    .line 1414
    if-eqz v0, :cond_25

    .line 1415
    .line 1416
    invoke-virtual {v12}, Ljava/io/File;->delete()Z
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_19

    .line 1417
    .line 1418
    .line 1419
    :cond_25
    if-eqz v7, :cond_26

    .line 1420
    .line 1421
    :try_start_38
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_38} :catch_a

    .line 1422
    .line 1423
    .line 1424
    goto :goto_2c

    .line 1425
    :catch_a
    move-exception v0

    .line 1426
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1427
    .line 1428
    .line 1429
    :cond_26
    :goto_2c
    if-eqz v17, :cond_27

    .line 1430
    .line 1431
    :try_start_39
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_39} :catch_b

    .line 1432
    .line 1433
    .line 1434
    goto :goto_2d

    .line 1435
    :catch_b
    move-exception v0

    .line 1436
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1437
    .line 1438
    .line 1439
    :cond_27
    :goto_2d
    if-eqz v10, :cond_28

    .line 1440
    .line 1441
    :try_start_3a
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3a} :catch_c

    .line 1442
    .line 1443
    .line 1444
    goto :goto_2e

    .line 1445
    :catch_c
    move-exception v0

    .line 1446
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1447
    .line 1448
    .line 1449
    :cond_28
    :goto_2e
    if-eqz v16, :cond_29

    .line 1450
    .line 1451
    :try_start_3b
    invoke-virtual/range {v16 .. v16}, Ll/i5d0;->close()V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3b} :catch_d

    .line 1452
    .line 1453
    .line 1454
    goto :goto_2f

    .line 1455
    :catch_d
    move-exception v0

    .line 1456
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1457
    .line 1458
    .line 1459
    :cond_29
    :goto_2f
    if-eqz v6, :cond_2f

    .line 1460
    .line 1461
    invoke-interface {v6, v9}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 1462
    .line 1463
    .line 1464
    goto :goto_35

    .line 1465
    :goto_30
    if-eqz v7, :cond_2a

    .line 1466
    .line 1467
    :try_start_3c
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3c} :catch_e

    .line 1468
    .line 1469
    .line 1470
    goto :goto_31

    .line 1471
    :catch_e
    move-exception v0

    .line 1472
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1473
    .line 1474
    .line 1475
    :cond_2a
    :goto_31
    if-eqz v17, :cond_2b

    .line 1476
    .line 1477
    :try_start_3d
    invoke-virtual/range {v17 .. v17}, Ljava/io/InputStream;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_3d} :catch_f

    .line 1478
    .line 1479
    .line 1480
    goto :goto_32

    .line 1481
    :catch_f
    move-exception v0

    .line 1482
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1483
    .line 1484
    .line 1485
    :cond_2b
    :goto_32
    if-eqz v10, :cond_2c

    .line 1486
    .line 1487
    :try_start_3e
    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_3e} :catch_10

    .line 1488
    .line 1489
    .line 1490
    goto :goto_33

    .line 1491
    :catch_10
    move-exception v0

    .line 1492
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1493
    .line 1494
    .line 1495
    :cond_2c
    :goto_33
    if-eqz v16, :cond_2d

    .line 1496
    .line 1497
    :try_start_3f
    invoke-virtual/range {v16 .. v16}, Ll/i5d0;->close()V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_3f} :catch_11

    .line 1498
    .line 1499
    .line 1500
    goto :goto_34

    .line 1501
    :catch_11
    move-exception v0

    .line 1502
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1503
    .line 1504
    .line 1505
    :cond_2d
    :goto_34
    if-eqz v6, :cond_2e

    .line 1506
    .line 1507
    invoke-interface {v6, v9}, Lcom/tantanapp/common/network/ApiCallBack;->whenApiFinish(Ll/x1d0;)V

    .line 1508
    .line 1509
    .line 1510
    :cond_2e
    throw v1

    .line 1511
    :cond_2f
    :goto_35
    return-void
.end method

.method public static d(Ljava/net/URL;Ll/x1d0;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x2f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    add-int/2addr v0, v1

    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v2, ".apk"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    const-string v2, "UTF-8"

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    :try_start_1
    const-string p0, "Content-Disposition"

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const-string p1, ";"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    aget-object p0, p0, v1

    .line 46
    .line 47
    const-string p1, "="

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    aget-object p0, p0, v1

    .line 54
    .line 55
    const-string p1, "\""

    .line 56
    .line 57
    const-string v0, ""

    .line 58
    .line 59
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    goto :goto_0

    .line 68
    :cond_0
    invoke-static {p0, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    goto :goto_0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    :cond_1
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    const-string p0, "tantan.apk"

    .line 85
    .line 86
    :cond_2
    return-object p0
.end method

.method public static e(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "ENOSPC"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "No space left on device"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static f(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    sub-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/ui/download/DownloadTask;->q:I

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->G()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ll/wnl;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/wnl;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-wide/16 v1, 0xa

    .line 31
    .line 32
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/xnl;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/xnl;-><init>(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

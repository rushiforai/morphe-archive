.class public Lcom/tencent/liteav/basic/license/c;
.super Lcom/tencent/liteav/basic/license/a;
.source "SourceFile"


# instance fields
.field private b:Landroid/content/Context;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Ljava/lang/String;

.field private f:Lcom/tencent/liteav/basic/license/b;

.field private g:J

.field private h:J

.field private i:Z

.field private j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/liteav/basic/license/b;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/basic/license/a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/basic/license/c;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/liteav/basic/license/c;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/liteav/basic/license/c;->d:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/tencent/liteav/basic/license/c;->e:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/tencent/liteav/basic/license/c;->i:Z

    .line 15
    .line 16
    iput-object p7, p0, Lcom/tencent/liteav/basic/license/c;->j:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method private a(Ljava/lang/Exception;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-interface {p2, v0, p1}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/Exception;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object v0, p0, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public run()V
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "http status got exception. code = "

    .line 4
    .line 5
    iget-object v2, v1, Lcom/tencent/liteav/basic/license/c;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/tencent/liteav/basic/util/c;->a(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    if-eqz v2, :cond_1e

    .line 14
    .line 15
    iget-object v2, v1, Lcom/tencent/liteav/basic/license/c;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_1e

    .line 22
    .line 23
    iget-object v2, v1, Lcom/tencent/liteav/basic/license/c;->d:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1e

    .line 30
    .line 31
    iget-object v2, v1, Lcom/tencent/liteav/basic/license/c;->e:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1e

    .line 38
    .line 39
    iget-object v2, v1, Lcom/tencent/liteav/basic/license/c;->c:Ljava/lang/String;

    .line 40
    .line 41
    const-string v5, "http"

    .line 42
    .line 43
    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    move v2, v3

    .line 50
    move-object v10, v4

    .line 51
    goto/16 :goto_12

    .line 52
    .line 53
    :cond_0
    new-instance v2, Ljava/io/File;

    .line 54
    .line 55
    iget-object v5, v1, Lcom/tencent/liteav/basic/license/c;->d:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-nez v5, :cond_1

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-eqz v5, :cond_2

    .line 75
    .line 76
    iget-object v5, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 77
    .line 78
    if-eqz v5, :cond_2

    .line 79
    .line 80
    invoke-interface {v5, v2, v4}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/Exception;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    :goto_0
    new-instance v2, Ljava/io/File;

    .line 85
    .line 86
    new-instance v5, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    iget-object v6, v1, Lcom/tencent/liteav/basic/license/c;->d:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget-object v6, v1, Lcom/tencent/liteav/basic/license/c;->e:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 114
    .line 115
    .line 116
    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 117
    if-eqz v5, :cond_3

    .line 118
    .line 119
    :try_start_1
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :catchall_0
    move-exception v0

    .line 124
    move-object v5, v4

    .line 125
    move-object v10, v5

    .line 126
    goto/16 :goto_f

    .line 127
    .line 128
    :catch_0
    move-exception v0

    .line 129
    move-object v5, v4

    .line 130
    move-object v7, v5

    .line 131
    :goto_1
    move-object v12, v7

    .line 132
    goto/16 :goto_10

    .line 133
    .line 134
    :cond_3
    :goto_2
    :try_start_2
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 135
    .line 136
    .line 137
    new-instance v5, Ljava/net/URL;

    .line 138
    .line 139
    iget-object v6, v1, Lcom/tencent/liteav/basic/license/c;->c:Ljava/lang/String;

    .line 140
    .line 141
    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    check-cast v5, Ljava/net/HttpURLConnection;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 149
    .line 150
    :try_start_3
    iget-object v6, v1, Lcom/tencent/liteav/basic/license/c;->j:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 153
    .line 154
    .line 155
    move-result v6
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 156
    if-nez v6, :cond_4

    .line 157
    .line 158
    :try_start_4
    const-string v6, "If-Modified-Since"

    .line 159
    .line 160
    iget-object v7, v1, Lcom/tencent/liteav/basic/license/c;->j:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v5, v6, v7}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 163
    .line 164
    .line 165
    goto :goto_3

    .line 166
    :catchall_1
    move-exception v0

    .line 167
    move-object v10, v4

    .line 168
    goto/16 :goto_f

    .line 169
    .line 170
    :catch_1
    move-exception v0

    .line 171
    move-object v7, v4

    .line 172
    goto :goto_1

    .line 173
    :cond_4
    :goto_3
    const/16 v6, 0x7530

    .line 174
    .line 175
    :try_start_5
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 179
    .line 180
    .line 181
    const/4 v6, 0x1

    .line 182
    invoke-virtual {v5, v6}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 183
    .line 184
    .line 185
    const-string v7, "GET"

    .line 186
    .line 187
    invoke-virtual {v5, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 191
    .line 192
    .line 193
    move-result v7

    .line 194
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 195
    .line 196
    .line 197
    move-result v8
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 198
    const/16 v9, 0xc8

    .line 199
    .line 200
    if-ne v8, v9, :cond_5

    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_5
    move v6, v3

    .line 204
    :goto_4
    if-eqz v6, :cond_e

    .line 205
    .line 206
    :try_start_6
    const-string v0, "Last-Modified"

    .line 207
    .line 208
    invoke-virtual {v5, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iput-object v0, v1, Lcom/tencent/liteav/basic/license/c;->j:Ljava/lang/String;

    .line 213
    .line 214
    iget-boolean v7, v1, Lcom/tencent/liteav/basic/license/c;->i:Z
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 215
    .line 216
    const-wide/16 v9, 0x0

    .line 217
    .line 218
    if-eqz v7, :cond_9

    .line 219
    .line 220
    :try_start_7
    invoke-virtual {v5}, Ljava/net/URLConnection;->getContentLength()I

    .line 221
    .line 222
    .line 223
    move-result v7

    .line 224
    int-to-long v11, v7

    .line 225
    iput-wide v11, v1, Lcom/tencent/liteav/basic/license/c;->g:J

    .line 226
    .line 227
    cmp-long v7, v11, v9

    .line 228
    .line 229
    if-gtz v7, :cond_7

    .line 230
    .line 231
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 232
    .line 233
    if-eqz v0, :cond_6

    .line 234
    .line 235
    invoke-interface {v0, v2, v4}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/Exception;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 236
    .line 237
    .line 238
    goto :goto_6

    .line 239
    :catch_2
    move-exception v0

    .line 240
    move-object v7, v4

    .line 241
    move-object v12, v7

    .line 242
    :goto_5
    move v3, v6

    .line 243
    goto/16 :goto_10

    .line 244
    .line 245
    :cond_6
    :goto_6
    :try_start_8
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 246
    .line 247
    .line 248
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_b

    .line 249
    .line 250
    if-eqz v0, :cond_1d

    .line 251
    .line 252
    goto :goto_7

    .line 253
    :cond_7
    :try_start_9
    invoke-static {v11, v12}, Lcom/tencent/liteav/basic/util/c;->a(J)Z

    .line 254
    .line 255
    .line 256
    move-result v7

    .line 257
    if-nez v7, :cond_9

    .line 258
    .line 259
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 260
    .line 261
    if-eqz v0, :cond_8

    .line 262
    .line 263
    invoke-interface {v0, v2, v4}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/Exception;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 264
    .line 265
    .line 266
    :cond_8
    :try_start_a
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 267
    .line 268
    .line 269
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 270
    .line 271
    if-eqz v0, :cond_1d

    .line 272
    .line 273
    :goto_7
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/b;->a()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_b

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :cond_9
    :try_start_b
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 278
    .line 279
    .line 280
    move-result-object v7
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 281
    const/16 v11, 0x2000

    .line 282
    .line 283
    :try_start_c
    new-array v11, v11, [B

    .line 284
    .line 285
    new-instance v12, Ljava/io/FileOutputStream;

    .line 286
    .line 287
    invoke-direct {v12, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 288
    .line 289
    .line 290
    :try_start_d
    iput-wide v9, v1, Lcom/tencent/liteav/basic/license/c;->h:J

    .line 291
    .line 292
    :cond_a
    :goto_8
    invoke-virtual {v7, v11}, Ljava/io/InputStream;->read([B)I

    .line 293
    .line 294
    .line 295
    move-result v9

    .line 296
    const/4 v10, -0x1

    .line 297
    if-eq v9, v10, :cond_c

    .line 298
    .line 299
    invoke-virtual {v12, v11, v3, v9}, Ljava/io/FileOutputStream;->write([BII)V

    .line 300
    .line 301
    .line 302
    iget-boolean v10, v1, Lcom/tencent/liteav/basic/license/c;->i:Z

    .line 303
    .line 304
    if-eqz v10, :cond_a

    .line 305
    .line 306
    iget-wide v13, v1, Lcom/tencent/liteav/basic/license/c;->h:J

    .line 307
    .line 308
    const-wide/16 v15, 0x64

    .line 309
    .line 310
    mul-long v17, v13, v15

    .line 311
    .line 312
    iget-wide v3, v1, Lcom/tencent/liteav/basic/license/c;->g:J

    .line 313
    .line 314
    move-object/from16 v19, v11

    .line 315
    .line 316
    div-long v10, v17, v3

    .line 317
    .line 318
    long-to-int v10, v10

    .line 319
    int-to-long v8, v9

    .line 320
    add-long/2addr v13, v8

    .line 321
    iput-wide v13, v1, Lcom/tencent/liteav/basic/license/c;->h:J

    .line 322
    .line 323
    mul-long/2addr v13, v15

    .line 324
    div-long/2addr v13, v3

    .line 325
    long-to-int v3, v13

    .line 326
    if-eq v10, v3, :cond_b

    .line 327
    .line 328
    iget-object v4, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 329
    .line 330
    if-eqz v4, :cond_b

    .line 331
    .line 332
    invoke-interface {v4, v3}, Lcom/tencent/liteav/basic/license/b;->a(I)V

    .line 333
    .line 334
    .line 335
    goto :goto_9

    .line 336
    :catchall_2
    move-exception v0

    .line 337
    move-object v10, v7

    .line 338
    move-object v4, v12

    .line 339
    goto/16 :goto_f

    .line 340
    .line 341
    :catch_3
    move-exception v0

    .line 342
    goto :goto_5

    .line 343
    :cond_b
    :goto_9
    move-object/from16 v11, v19

    .line 344
    .line 345
    const/4 v3, 0x0

    .line 346
    const/4 v4, 0x0

    .line 347
    goto :goto_8

    .line 348
    :cond_c
    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V

    .line 349
    .line 350
    .line 351
    iget-object v3, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 352
    .line 353
    if-eqz v3, :cond_d

    .line 354
    .line 355
    const/16 v11, 0x64

    .line 356
    .line 357
    invoke-interface {v3, v11}, Lcom/tencent/liteav/basic/license/b;->a(I)V

    .line 358
    .line 359
    .line 360
    iget-object v3, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 361
    .line 362
    invoke-interface {v3, v2, v0}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 363
    .line 364
    .line 365
    :cond_d
    :goto_a
    const/16 v20, 0x0

    .line 366
    .line 367
    goto :goto_e

    .line 368
    :catchall_3
    move-exception v0

    .line 369
    move-object v10, v7

    .line 370
    const/4 v4, 0x0

    .line 371
    goto :goto_f

    .line 372
    :catch_4
    move-exception v0

    .line 373
    move v3, v6

    .line 374
    :goto_b
    const/4 v12, 0x0

    .line 375
    goto/16 :goto_10

    .line 376
    .line 377
    :catchall_4
    move-exception v0

    .line 378
    const/4 v4, 0x0

    .line 379
    :goto_c
    const/4 v10, 0x0

    .line 380
    goto :goto_f

    .line 381
    :catch_5
    move-exception v0

    .line 382
    move v3, v6

    .line 383
    :goto_d
    const/4 v7, 0x0

    .line 384
    goto :goto_b

    .line 385
    :cond_e
    const/16 v3, 0x130

    .line 386
    .line 387
    if-ne v7, v3, :cond_10

    .line 388
    .line 389
    :try_start_e
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 390
    .line 391
    if-eqz v0, :cond_f

    .line 392
    .line 393
    const/16 v11, 0x64

    .line 394
    .line 395
    invoke-interface {v0, v11}, Lcom/tencent/liteav/basic/license/b;->a(I)V

    .line 396
    .line 397
    .line 398
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 399
    .line 400
    iget-object v3, v1, Lcom/tencent/liteav/basic/license/c;->j:Ljava/lang/String;

    .line 401
    .line 402
    const/4 v10, 0x0

    .line 403
    invoke-interface {v0, v10, v3}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    :cond_f
    const/4 v7, 0x0

    .line 407
    const/4 v12, 0x0

    .line 408
    goto :goto_a

    .line 409
    :cond_10
    new-instance v3, Lcom/tencent/liteav/basic/license/d;

    .line 410
    .line 411
    new-instance v4, Ljava/lang/StringBuilder;

    .line 412
    .line 413
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-direct {v3, v0}, Lcom/tencent/liteav/basic/license/d;-><init>(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 424
    .line 425
    .line 426
    move-object/from16 v20, v3

    .line 427
    .line 428
    const/4 v7, 0x0

    .line 429
    const/4 v12, 0x0

    .line 430
    :goto_e
    if-eqz v12, :cond_11

    .line 431
    .line 432
    :try_start_f
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 433
    .line 434
    .line 435
    :cond_11
    if-eqz v7, :cond_12

    .line 436
    .line 437
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 438
    .line 439
    .line 440
    :cond_12
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 441
    .line 442
    .line 443
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 444
    .line 445
    if-eqz v0, :cond_1b

    .line 446
    .line 447
    invoke-interface {v0}, Lcom/tencent/liteav/basic/license/b;->a()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_a

    .line 448
    .line 449
    .line 450
    goto :goto_11

    .line 451
    :catch_6
    move-exception v0

    .line 452
    const/4 v3, 0x0

    .line 453
    goto :goto_d

    .line 454
    :catchall_5
    move-exception v0

    .line 455
    const/4 v4, 0x0

    .line 456
    const/4 v5, 0x0

    .line 457
    goto :goto_c

    .line 458
    :catch_7
    move-exception v0

    .line 459
    const/4 v3, 0x0

    .line 460
    const/4 v5, 0x0

    .line 461
    goto :goto_d

    .line 462
    :goto_f
    if-eqz v4, :cond_13

    .line 463
    .line 464
    :try_start_10
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 465
    .line 466
    .line 467
    :cond_13
    if-eqz v10, :cond_14

    .line 468
    .line 469
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 470
    .line 471
    .line 472
    :cond_14
    if-eqz v5, :cond_15

    .line 473
    .line 474
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 475
    .line 476
    .line 477
    :cond_15
    iget-object v1, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 478
    .line 479
    if-eqz v1, :cond_16

    .line 480
    .line 481
    invoke-interface {v1}, Lcom/tencent/liteav/basic/license/b;->a()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_8

    .line 482
    .line 483
    .line 484
    :catch_8
    :cond_16
    throw v0

    .line 485
    :goto_10
    if-eqz v12, :cond_17

    .line 486
    .line 487
    :try_start_11
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V

    .line 488
    .line 489
    .line 490
    :cond_17
    if-eqz v7, :cond_18

    .line 491
    .line 492
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 493
    .line 494
    .line 495
    :cond_18
    if-eqz v5, :cond_19

    .line 496
    .line 497
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 498
    .line 499
    .line 500
    :cond_19
    iget-object v4, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 501
    .line 502
    if-eqz v4, :cond_1a

    .line 503
    .line 504
    invoke-interface {v4}, Lcom/tencent/liteav/basic/license/b;->a()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_9

    .line 505
    .line 506
    .line 507
    :catch_9
    :cond_1a
    move-object/from16 v20, v0

    .line 508
    .line 509
    move v6, v3

    .line 510
    :catch_a
    :cond_1b
    :goto_11
    if-eqz v6, :cond_1c

    .line 511
    .line 512
    if-eqz v20, :cond_1d

    .line 513
    .line 514
    :cond_1c
    iget-object v0, v1, Lcom/tencent/liteav/basic/license/c;->f:Lcom/tencent/liteav/basic/license/b;

    .line 515
    .line 516
    if-eqz v0, :cond_1d

    .line 517
    .line 518
    const/4 v10, 0x0

    .line 519
    invoke-interface {v0, v2, v10}, Lcom/tencent/liteav/basic/license/b;->a(Ljava/io/File;Ljava/lang/Exception;)V

    .line 520
    .line 521
    .line 522
    :catch_b
    :cond_1d
    return-void

    .line 523
    :cond_1e
    move-object v10, v4

    .line 524
    move v2, v3

    .line 525
    :goto_12
    invoke-direct {v1, v10, v2}, Lcom/tencent/liteav/basic/license/c;->a(Ljava/lang/Exception;I)V

    .line 526
    .line 527
    .line 528
    return-void
.end method

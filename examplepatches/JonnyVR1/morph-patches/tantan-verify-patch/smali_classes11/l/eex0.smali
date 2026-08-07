.class public final Ll/eex0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation build Landroidx/annotation/WorkerThread;
.end annotation


# instance fields
.field public final a:Ljava/net/URL;

.field public final b:[B

.field public final c:Ll/ncx0;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic f:Ll/p9x0;


# direct methods
.method public constructor <init>(Ll/p9x0;Ljava/lang/String;Ljava/net/URL;[BLjava/util/Map;Ll/ncx0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/net/URL;",
            "[B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/ncx0;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/eex0;->f:Ll/p9x0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    invoke-static {p6}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iput-object p3, p0, Ll/eex0;->a:Ljava/net/URL;

    .line 16
    .line 17
    iput-object p4, p0, Ll/eex0;->b:[B

    .line 18
    .line 19
    iput-object p6, p0, Ll/eex0;->c:Ll/ncx0;

    .line 20
    .line 21
    iput-object p2, p0, Ll/eex0;->d:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p5, p0, Ll/eex0;->e:Ljava/util/Map;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 15

    .line 1
    const-string v1, "Error closing HTTP compressed POST connection output stream. appId"

    .line 2
    .line 3
    iget-object v0, p0, Ll/eex0;->f:Ll/p9x0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yyx0;->f()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    :try_start_0
    iget-object v0, p0, Ll/eex0;->a:Ljava/net/URL;

    .line 11
    .line 12
    invoke-static {}, Ll/n1u0;->b()Ll/n1u0;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    const-string v5, "client-measurement"

    .line 17
    .line 18
    invoke-virtual {v4, v0, v5}, Ll/n1u0;->a(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v4, v0, Ljava/net/HttpURLConnection;

    .line 23
    .line 24
    if-eqz v4, :cond_2

    .line 25
    .line 26
    move-object v4, v0

    .line 27
    check-cast v4, Ljava/net/HttpURLConnection;

    .line 28
    .line 29
    invoke-virtual {v4, v3}, Ljava/net/URLConnection;->setDefaultUseCaches(Z)V

    .line 30
    .line 31
    .line 32
    const v0, 0xea60

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 36
    .line 37
    .line 38
    const v0, 0xee48

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    invoke-virtual {v4, v0}, Ljava/net/URLConnection;->setDoInput(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 49
    .line 50
    .line 51
    :try_start_1
    iget-object v5, p0, Ll/eex0;->e:Ljava/util/Map;

    .line 52
    .line 53
    if-eqz v5, :cond_0

    .line 54
    .line 55
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    if-eqz v6, :cond_0

    .line 68
    .line 69
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    check-cast v6, Ljava/util/Map$Entry;

    .line 74
    .line 75
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    check-cast v7, Ljava/lang/String;

    .line 80
    .line 81
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    check-cast v6, Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v4, v7, v6}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :catchall_0
    move-exception v0

    .line 92
    move-object v6, v2

    .line 93
    :goto_1
    move-object v13, v6

    .line 94
    :goto_2
    move v10, v3

    .line 95
    :goto_3
    move-object v2, v0

    .line 96
    goto/16 :goto_7

    .line 97
    .line 98
    :catch_0
    move-exception v0

    .line 99
    move-object v8, v0

    .line 100
    move-object v10, v2

    .line 101
    :goto_4
    move v7, v3

    .line 102
    goto/16 :goto_9

    .line 103
    .line 104
    :cond_0
    iget-object v5, p0, Ll/eex0;->b:[B

    .line 105
    .line 106
    if-eqz v5, :cond_1

    .line 107
    .line 108
    iget-object v5, p0, Ll/eex0;->f:Ll/p9x0;

    .line 109
    .line 110
    invoke-virtual {v5}, Ll/qjy0;->i()Ll/vmy0;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    iget-object v6, p0, Ll/eex0;->b:[B

    .line 115
    .line 116
    invoke-virtual {v5, v6}, Ll/vmy0;->b0([B)[B

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    iget-object v6, p0, Ll/eex0;->f:Ll/p9x0;

    .line 121
    .line 122
    invoke-virtual {v6}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    invoke-virtual {v6}, Ll/d6x0;->E()Ll/l8x0;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    const-string v7, "Uploading data. size"

    .line 131
    .line 132
    array-length v8, v5

    .line 133
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v8

    .line 137
    invoke-virtual {v6, v7, v8}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 141
    .line 142
    .line 143
    const-string v0, "Content-Encoding"

    .line 144
    .line 145
    const-string v6, "gzip"

    .line 146
    .line 147
    invoke-virtual {v4, v0, v6}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    array-length v0, v5

    .line 151
    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v4}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 158
    .line 159
    .line 160
    move-result-object v6
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    :try_start_2
    invoke-virtual {v6, v5}, Ljava/io/OutputStream;->write([B)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 165
    .line 166
    .line 167
    goto :goto_5

    .line 168
    :catchall_1
    move-exception v0

    .line 169
    move-object v13, v2

    .line 170
    goto :goto_2

    .line 171
    :catch_1
    move-exception v0

    .line 172
    move-object v8, v0

    .line 173
    move-object v10, v2

    .line 174
    move v7, v3

    .line 175
    move-object v2, v6

    .line 176
    goto/16 :goto_9

    .line 177
    .line 178
    :cond_1
    :goto_5
    :try_start_3
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 179
    .line 180
    .line 181
    move-result v8
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 182
    :try_start_4
    invoke-virtual {v4}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 183
    .line 184
    .line 185
    move-result-object v11
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 186
    :try_start_5
    iget-object v0, p0, Ll/eex0;->f:Ll/p9x0;

    .line 187
    .line 188
    invoke-static {v0, v4}, Ll/p9x0;->v(Ll/p9x0;Ljava/net/HttpURLConnection;)[B

    .line 189
    .line 190
    .line 191
    move-result-object v10
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 192
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 193
    .line 194
    .line 195
    iget-object v0, p0, Ll/eex0;->f:Ll/p9x0;

    .line 196
    .line 197
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    new-instance v5, Ll/qbx0;

    .line 202
    .line 203
    iget-object v6, p0, Ll/eex0;->d:Ljava/lang/String;

    .line 204
    .line 205
    iget-object v7, p0, Ll/eex0;->c:Ll/ncx0;

    .line 206
    .line 207
    const/4 v9, 0x0

    .line 208
    const/4 v12, 0x0

    .line 209
    invoke-direct/range {v5 .. v12}, Ll/qbx0;-><init>(Ljava/lang/String;Ll/ncx0;ILjava/lang/Throwable;[BLjava/util/Map;Ll/jdx0;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v5}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :catchall_2
    move-exception v0

    .line 217
    move-object v6, v2

    .line 218
    move v10, v8

    .line 219
    move-object v13, v11

    .line 220
    goto :goto_3

    .line 221
    :catch_2
    move-exception v0

    .line 222
    move v7, v8

    .line 223
    move-object v10, v11

    .line 224
    :goto_6
    move-object v8, v0

    .line 225
    goto :goto_9

    .line 226
    :catchall_3
    move-exception v0

    .line 227
    move-object v6, v2

    .line 228
    move-object v13, v6

    .line 229
    move v10, v8

    .line 230
    goto/16 :goto_3

    .line 231
    .line 232
    :catch_3
    move-exception v0

    .line 233
    move-object v10, v2

    .line 234
    move v7, v8

    .line 235
    goto :goto_6

    .line 236
    :catchall_4
    move-exception v0

    .line 237
    move-object v4, v2

    .line 238
    move-object v6, v4

    .line 239
    goto/16 :goto_1

    .line 240
    .line 241
    :catch_4
    move-exception v0

    .line 242
    move-object v8, v0

    .line 243
    move-object v4, v2

    .line 244
    move-object v10, v4

    .line 245
    goto/16 :goto_4

    .line 246
    .line 247
    :cond_2
    :try_start_6
    new-instance v0, Ljava/io/IOException;

    .line 248
    .line 249
    const-string v4, "Failed to obtain HTTP connection"

    .line 250
    .line 251
    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 255
    :goto_7
    if-eqz v6, :cond_3

    .line 256
    .line 257
    :try_start_7
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 258
    .line 259
    .line 260
    goto :goto_8

    .line 261
    :catch_5
    move-exception v0

    .line 262
    iget-object v3, p0, Ll/eex0;->f:Ll/p9x0;

    .line 263
    .line 264
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    invoke-virtual {v3}, Ll/d6x0;->A()Ll/l8x0;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    iget-object v5, p0, Ll/eex0;->d:Ljava/lang/String;

    .line 273
    .line 274
    invoke-static {v5}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v5

    .line 278
    invoke-virtual {v3, v1, v5, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    :cond_3
    :goto_8
    if-eqz v4, :cond_4

    .line 282
    .line 283
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 284
    .line 285
    .line 286
    :cond_4
    iget-object v0, p0, Ll/eex0;->f:Ll/p9x0;

    .line 287
    .line 288
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    new-instance v7, Ll/qbx0;

    .line 293
    .line 294
    iget-object v8, p0, Ll/eex0;->d:Ljava/lang/String;

    .line 295
    .line 296
    iget-object v9, p0, Ll/eex0;->c:Ll/ncx0;

    .line 297
    .line 298
    const/4 v12, 0x0

    .line 299
    const/4 v14, 0x0

    .line 300
    const/4 v11, 0x0

    .line 301
    invoke-direct/range {v7 .. v14}, Ll/qbx0;-><init>(Ljava/lang/String;Ll/ncx0;ILjava/lang/Throwable;[BLjava/util/Map;Ll/jdx0;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v7}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 305
    .line 306
    .line 307
    throw v2

    .line 308
    :goto_9
    if-eqz v2, :cond_5

    .line 309
    .line 310
    :try_start_8
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 311
    .line 312
    .line 313
    goto :goto_a

    .line 314
    :catch_6
    move-exception v0

    .line 315
    iget-object v2, p0, Ll/eex0;->f:Ll/p9x0;

    .line 316
    .line 317
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    iget-object v3, p0, Ll/eex0;->d:Ljava/lang/String;

    .line 326
    .line 327
    invoke-static {v3}, Ll/d6x0;->p(Ljava/lang/String;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    invoke-virtual {v2, v1, v3, v0}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    :cond_5
    :goto_a
    if-eqz v4, :cond_6

    .line 335
    .line 336
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 337
    .line 338
    .line 339
    :cond_6
    iget-object v0, p0, Ll/eex0;->f:Ll/p9x0;

    .line 340
    .line 341
    invoke-virtual {v0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    new-instance v4, Ll/qbx0;

    .line 346
    .line 347
    iget-object v5, p0, Ll/eex0;->d:Ljava/lang/String;

    .line 348
    .line 349
    iget-object v6, p0, Ll/eex0;->c:Ll/ncx0;

    .line 350
    .line 351
    const/4 v9, 0x0

    .line 352
    const/4 v11, 0x0

    .line 353
    invoke-direct/range {v4 .. v11}, Ll/qbx0;-><init>(Ljava/lang/String;Ll/ncx0;ILjava/lang/Throwable;[BLjava/util/Map;Ll/jdx0;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v0, v4}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 357
    .line 358
    .line 359
    return-void
.end method

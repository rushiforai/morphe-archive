.class public final Ll/wqx0;
.super Ll/m8x0;
.source "SourceFile"

# interfaces
.implements Ll/jsx0;


# instance fields
.field public final e:Z

.field public final f:I

.field public final g:I

.field public final h:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final i:Ll/esx0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final j:Ll/esx0;

.field public k:Ll/akx0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l:Ljava/net/HttpURLConnection;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m:Ljava/io/InputStream;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:Z

.field public o:I

.field public p:J

.field public q:J


# direct methods
.method public constructor <init>()V
    .locals 8
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x1f40

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v3, v2

    move-object v0, p0

    .line 23
    invoke-direct/range {v0 .. v7}, Ll/wqx0;-><init>(Ljava/lang/String;IIZLl/esx0;Ll/uow0;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZLl/esx0;Ll/uow0;Z)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/esx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/uow0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p6, 0x1

    .line 2
    invoke-direct {p0, p6}, Ll/m8x0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/wqx0;->h:Ljava/lang/String;

    .line 6
    .line 7
    iput p2, p0, Ll/wqx0;->f:I

    .line 8
    .line 9
    iput p3, p0, Ll/wqx0;->g:I

    .line 10
    .line 11
    iput-boolean p4, p0, Ll/wqx0;->e:Z

    .line 12
    .line 13
    iput-object p5, p0, Ll/wqx0;->i:Ll/esx0;

    .line 14
    .line 15
    new-instance p1, Ll/esx0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/esx0;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/wqx0;->j:Ll/esx0;

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IIZLl/esx0;Ll/uow0;ZLl/rqx0;)V
    .locals 0

    const/4 p6, 0x0

    const/4 p7, 0x0

    .line 24
    invoke-direct/range {p0 .. p7}, Ll/wqx0;-><init>(Ljava/lang/String;IIZLl/esx0;Ll/uow0;Z)V

    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    :try_start_0
    iget-wide v0, p0, Ll/wqx0;->p:J

    .line 6
    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    const/4 v3, -0x1

    .line 12
    if-eqz v2, :cond_2

    .line 13
    .line 14
    iget-wide v4, p0, Ll/wqx0;->q:J

    .line 15
    .line 16
    sub-long/2addr v0, v4

    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v2, v0, v4

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    return v3

    .line 24
    :cond_1
    int-to-long v4, p3

    .line 25
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    long-to-int p3, v0

    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 34
    .line 35
    sget v1, Ll/mpw0;->a:I

    .line 36
    .line 37
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-ne p1, v3, :cond_3

    .line 42
    .line 43
    return v3

    .line 44
    :cond_3
    iget-wide p2, p0, Ll/wqx0;->q:J

    .line 45
    .line 46
    int-to-long v0, p1

    .line 47
    add-long/2addr p2, v0

    .line 48
    iput-wide p2, p0, Ll/wqx0;->q:J

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/m8x0;->zzg(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    return p1

    .line 54
    :goto_1
    iget-object p0, p0, Ll/wqx0;->k:Ll/akx0;

    .line 55
    .line 56
    sget p2, Ll/mpw0;->a:I

    .line 57
    .line 58
    const/4 p2, 0x2

    .line 59
    invoke-static {p1, p0, p2}, Lcom/google/android/gms/internal/ads/zzhp;->zza(Ljava/io/IOException;Ll/akx0;I)Lcom/google/android/gms/internal/ads/zzhp;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    throw p0
.end method

.method public final e(Ll/akx0;)J
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v12, p1

    .line 4
    .line 5
    iput-object v12, v1, Ll/wqx0;->k:Ll/akx0;

    .line 6
    .line 7
    const-wide/16 v13, 0x0

    .line 8
    .line 9
    iput-wide v13, v1, Ll/wqx0;->q:J

    .line 10
    .line 11
    iput-wide v13, v1, Ll/wqx0;->p:J

    .line 12
    .line 13
    invoke-virtual/range {p0 .. p1}, Ll/m8x0;->k(Ll/akx0;)V

    .line 14
    .line 15
    .line 16
    const/4 v15, 0x1

    .line 17
    :try_start_0
    new-instance v2, Ljava/net/URL;

    .line 18
    .line 19
    iget-object v0, v12, Ll/akx0;->a:Landroid/net/Uri;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-wide v5, v12, Ll/akx0;->f:J

    .line 29
    .line 30
    iget-wide v7, v12, Ll/akx0;->g:J

    .line 31
    .line 32
    invoke-virtual {v12, v15}, Ll/akx0;->a(I)Z

    .line 33
    .line 34
    .line 35
    move-result v9

    .line 36
    iget-boolean v0, v1, Ll/wqx0;->e:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    :try_start_1
    iget-object v11, v12, Ll/akx0;->d:Ljava/util/Map;

    .line 42
    .line 43
    move v0, v3

    .line 44
    const/4 v3, 0x1

    .line 45
    const/4 v4, 0x0

    .line 46
    const/4 v10, 0x1

    .line 47
    invoke-virtual/range {v1 .. v11}, Ll/wqx0;->m(Ljava/net/URL;I[BJJZZLjava/util/Map;)Ljava/net/HttpURLConnection;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    move-object/from16 v1, p0

    .line 52
    .line 53
    move-wide/from16 v16, v13

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catch_0
    move-exception v0

    .line 57
    move-object/from16 v1, p0

    .line 58
    .line 59
    goto/16 :goto_e

    .line 60
    .line 61
    :cond_0
    move v0, v3

    .line 62
    :goto_0
    add-int/lit8 v1, v3, 0x1

    .line 63
    .line 64
    const/16 v4, 0x14

    .line 65
    .line 66
    if-gt v3, v4, :cond_15

    .line 67
    .line 68
    iget-object v11, v12, Ll/akx0;->d:Ljava/util/Map;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    .line 70
    const/4 v3, 0x1

    .line 71
    const/4 v4, 0x0

    .line 72
    const/4 v10, 0x0

    .line 73
    move-wide/from16 v16, v13

    .line 74
    .line 75
    move v13, v1

    .line 76
    move-object/from16 v1, p0

    .line 77
    .line 78
    :try_start_2
    invoke-virtual/range {v1 .. v11}, Ll/wqx0;->m(Ljava/net/URL;I[BJJZZLjava/util/Map;)Ljava/net/HttpURLConnection;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    const-string v10, "Location"

    .line 87
    .line 88
    invoke-virtual {v3, v10}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    const/16 v11, 0x12c

    .line 93
    .line 94
    if-eq v4, v11, :cond_14

    .line 95
    .line 96
    const/16 v11, 0x12d

    .line 97
    .line 98
    if-eq v4, v11, :cond_14

    .line 99
    .line 100
    const/16 v11, 0x12e

    .line 101
    .line 102
    if-eq v4, v11, :cond_14

    .line 103
    .line 104
    const/16 v11, 0x12f

    .line 105
    .line 106
    if-eq v4, v11, :cond_14

    .line 107
    .line 108
    const/16 v11, 0x133

    .line 109
    .line 110
    if-eq v4, v11, :cond_14

    .line 111
    .line 112
    const/16 v11, 0x134

    .line 113
    .line 114
    if-ne v4, v11, :cond_1

    .line 115
    .line 116
    goto/16 :goto_d

    .line 117
    .line 118
    :cond_1
    move-object v2, v3

    .line 119
    :goto_1
    iput-object v2, v1, Ll/wqx0;->l:Ljava/net/HttpURLConnection;

    .line 120
    .line 121
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    iput v3, v1, Ll/wqx0;->o:I

    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 131
    iget v4, v1, Ll/wqx0;->o:I

    .line 132
    .line 133
    const/16 v5, 0x7d8

    .line 134
    .line 135
    const/4 v6, -0x1

    .line 136
    const/16 v7, 0x1000

    .line 137
    .line 138
    const-string v8, "Content-Range"

    .line 139
    .line 140
    const/16 v9, 0xc8

    .line 141
    .line 142
    const-wide/16 v10, -0x1

    .line 143
    .line 144
    if-lt v4, v9, :cond_e

    .line 145
    .line 146
    const/16 v13, 0x12b

    .line 147
    .line 148
    if-le v4, v13, :cond_2

    .line 149
    .line 150
    goto/16 :goto_8

    .line 151
    .line 152
    :cond_2
    invoke-virtual {v2}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    iget v3, v1, Ll/wqx0;->o:I

    .line 156
    .line 157
    if-ne v3, v9, :cond_3

    .line 158
    .line 159
    iget-wide v3, v12, Ll/akx0;->f:J

    .line 160
    .line 161
    cmp-long v9, v3, v16

    .line 162
    .line 163
    if-nez v9, :cond_4

    .line 164
    .line 165
    :cond_3
    move-wide/from16 v3, v16

    .line 166
    .line 167
    :cond_4
    const-string v9, "Content-Encoding"

    .line 168
    .line 169
    invoke-virtual {v2, v9}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    const-string v13, "gzip"

    .line 174
    .line 175
    invoke-virtual {v13, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v9

    .line 179
    iget-wide v13, v12, Ll/akx0;->g:J

    .line 180
    .line 181
    if-nez v9, :cond_7

    .line 182
    .line 183
    cmp-long v18, v13, v10

    .line 184
    .line 185
    if-eqz v18, :cond_5

    .line 186
    .line 187
    iput-wide v13, v1, Ll/wqx0;->p:J

    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_5
    const-string v13, "Content-Length"

    .line 191
    .line 192
    invoke-virtual {v2, v13}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v13

    .line 196
    invoke-virtual {v2, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v8

    .line 200
    invoke-static {v13, v8}, Ll/nsx0;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 201
    .line 202
    .line 203
    move-result-wide v13

    .line 204
    cmp-long v8, v13, v10

    .line 205
    .line 206
    if-eqz v8, :cond_6

    .line 207
    .line 208
    sub-long v10, v13, v3

    .line 209
    .line 210
    :cond_6
    iput-wide v10, v1, Ll/wqx0;->p:J

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_7
    iput-wide v13, v1, Ll/wqx0;->p:J

    .line 214
    .line 215
    :goto_2
    const/16 v8, 0x7d0

    .line 216
    .line 217
    :try_start_3
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    iput-object v2, v1, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 222
    .line 223
    if-eqz v9, :cond_8

    .line 224
    .line 225
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    .line 226
    .line 227
    iget-object v9, v1, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 228
    .line 229
    invoke-direct {v2, v9}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 230
    .line 231
    .line 232
    iput-object v2, v1, Ll/wqx0;->m:Ljava/io/InputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 233
    .line 234
    goto :goto_3

    .line 235
    :catch_1
    move-exception v0

    .line 236
    goto :goto_7

    .line 237
    :cond_8
    :goto_3
    iput-boolean v15, v1, Ll/wqx0;->n:Z

    .line 238
    .line 239
    invoke-virtual/range {p0 .. p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 240
    .line 241
    .line 242
    cmp-long v2, v3, v16

    .line 243
    .line 244
    if-nez v2, :cond_9

    .line 245
    .line 246
    goto :goto_5

    .line 247
    :cond_9
    :try_start_4
    new-array v2, v7, [B

    .line 248
    .line 249
    :goto_4
    cmp-long v7, v3, v16

    .line 250
    .line 251
    if-lez v7, :cond_c

    .line 252
    .line 253
    const-wide/16 v9, 0x1000

    .line 254
    .line 255
    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->min(JJ)J

    .line 256
    .line 257
    .line 258
    move-result-wide v9

    .line 259
    long-to-int v7, v9

    .line 260
    iget-object v9, v1, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 261
    .line 262
    sget v10, Ll/mpw0;->a:I

    .line 263
    .line 264
    invoke-virtual {v9, v2, v0, v7}, Ljava/io/InputStream;->read([BII)I

    .line 265
    .line 266
    .line 267
    move-result v7

    .line 268
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 269
    .line 270
    .line 271
    move-result-object v9

    .line 272
    invoke-virtual {v9}, Ljava/lang/Thread;->isInterrupted()Z

    .line 273
    .line 274
    .line 275
    move-result v9

    .line 276
    if-nez v9, :cond_b

    .line 277
    .line 278
    if-eq v7, v6, :cond_a

    .line 279
    .line 280
    int-to-long v9, v7

    .line 281
    sub-long/2addr v3, v9

    .line 282
    invoke-virtual {v1, v7}, Ll/m8x0;->zzg(I)V

    .line 283
    .line 284
    .line 285
    goto :goto_4

    .line 286
    :catch_2
    move-exception v0

    .line 287
    goto :goto_6

    .line 288
    :cond_a
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 289
    .line 290
    invoke-direct {v0, v12, v5, v15}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ll/akx0;II)V

    .line 291
    .line 292
    .line 293
    throw v0

    .line 294
    :cond_b
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 295
    .line 296
    new-instance v2, Ljava/io/InterruptedIOException;

    .line 297
    .line 298
    invoke-direct {v2}, Ljava/io/InterruptedIOException;-><init>()V

    .line 299
    .line 300
    .line 301
    invoke-direct {v0, v2, v12, v8, v15}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 302
    .line 303
    .line 304
    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 305
    :cond_c
    :goto_5
    iget-wide v0, v1, Ll/wqx0;->p:J

    .line 306
    .line 307
    return-wide v0

    .line 308
    :goto_6
    invoke-virtual {v1}, Ll/wqx0;->o()V

    .line 309
    .line 310
    .line 311
    instance-of v1, v0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 312
    .line 313
    if-eqz v1, :cond_d

    .line 314
    .line 315
    check-cast v0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 316
    .line 317
    throw v0

    .line 318
    :cond_d
    new-instance v1, Lcom/google/android/gms/internal/ads/zzhp;

    .line 319
    .line 320
    invoke-direct {v1, v0, v12, v8, v15}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 321
    .line 322
    .line 323
    throw v1

    .line 324
    :goto_7
    invoke-virtual {v1}, Ll/wqx0;->o()V

    .line 325
    .line 326
    .line 327
    new-instance v1, Lcom/google/android/gms/internal/ads/zzhp;

    .line 328
    .line 329
    invoke-direct {v1, v0, v12, v8, v15}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 330
    .line 331
    .line 332
    throw v1

    .line 333
    :cond_e
    :goto_8
    invoke-virtual {v2}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    iget v9, v1, Ll/wqx0;->o:I

    .line 338
    .line 339
    const/16 v13, 0x1a0

    .line 340
    .line 341
    if-ne v9, v13, :cond_10

    .line 342
    .line 343
    invoke-virtual {v2, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v8

    .line 347
    invoke-static {v8}, Ll/nsx0;->b(Ljava/lang/String;)J

    .line 348
    .line 349
    .line 350
    move-result-wide v8

    .line 351
    move-wide/from16 v18, v10

    .line 352
    .line 353
    iget-wide v10, v12, Ll/akx0;->f:J

    .line 354
    .line 355
    cmp-long v8, v10, v8

    .line 356
    .line 357
    if-nez v8, :cond_10

    .line 358
    .line 359
    iput-boolean v15, v1, Ll/wqx0;->n:Z

    .line 360
    .line 361
    invoke-virtual/range {p0 .. p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 362
    .line 363
    .line 364
    iget-wide v0, v12, Ll/akx0;->g:J

    .line 365
    .line 366
    cmp-long v2, v0, v18

    .line 367
    .line 368
    if-eqz v2, :cond_f

    .line 369
    .line 370
    return-wide v0

    .line 371
    :cond_f
    return-wide v16

    .line 372
    :cond_10
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    if-eqz v2, :cond_12

    .line 377
    .line 378
    :try_start_5
    sget v8, Ll/mpw0;->a:I

    .line 379
    .line 380
    new-array v7, v7, [B

    .line 381
    .line 382
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    .line 383
    .line 384
    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 385
    .line 386
    .line 387
    :goto_9
    invoke-virtual {v2, v7}, Ljava/io/InputStream;->read([B)I

    .line 388
    .line 389
    .line 390
    move-result v9

    .line 391
    if-eq v9, v6, :cond_11

    .line 392
    .line 393
    invoke-virtual {v8, v7, v0, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 394
    .line 395
    .line 396
    goto :goto_9

    .line 397
    :cond_11
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    :goto_a
    move-object v6, v0

    .line 402
    goto :goto_b

    .line 403
    :cond_12
    sget-object v0, Ll/mpw0;->f:[B
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 404
    .line 405
    goto :goto_a

    .line 406
    :catch_3
    sget-object v0, Ll/mpw0;->f:[B

    .line 407
    .line 408
    goto :goto_a

    .line 409
    :goto_b
    invoke-virtual {v1}, Ll/wqx0;->o()V

    .line 410
    .line 411
    .line 412
    iget v0, v1, Ll/wqx0;->o:I

    .line 413
    .line 414
    if-ne v0, v13, :cond_13

    .line 415
    .line 416
    new-instance v0, Lcom/google/android/gms/internal/ads/zzgx;

    .line 417
    .line 418
    invoke-direct {v0, v5}, Lcom/google/android/gms/internal/ads/zzgx;-><init>(I)V

    .line 419
    .line 420
    .line 421
    goto :goto_c

    .line 422
    :cond_13
    const/4 v0, 0x0

    .line 423
    :goto_c
    new-instance v2, Lcom/google/android/gms/internal/ads/zzhr;

    .line 424
    .line 425
    iget v1, v1, Ll/wqx0;->o:I

    .line 426
    .line 427
    move-object v5, v3

    .line 428
    move-object v3, v0

    .line 429
    move-object v0, v2

    .line 430
    move-object v2, v5

    .line 431
    move-object v5, v12

    .line 432
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/ads/zzhr;-><init>(ILjava/lang/String;Ljava/io/IOException;Ljava/util/Map;Ll/akx0;[B)V

    .line 433
    .line 434
    .line 435
    throw v0

    .line 436
    :catch_4
    move-exception v0

    .line 437
    goto :goto_e

    .line 438
    :cond_14
    :goto_d
    :try_start_6
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 439
    .line 440
    .line 441
    invoke-virtual {v1, v2, v10, v12}, Ll/wqx0;->n(Ljava/net/URL;Ljava/lang/String;Ll/akx0;)Ljava/net/URL;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    move v3, v13

    .line 446
    move-wide/from16 v13, v16

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :cond_15
    move v13, v1

    .line 451
    move-object/from16 v1, p0

    .line 452
    .line 453
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 454
    .line 455
    new-instance v2, Ljava/net/NoRouteToHostException;

    .line 456
    .line 457
    new-instance v3, Ljava/lang/StringBuilder;

    .line 458
    .line 459
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 460
    .line 461
    .line 462
    const-string v4, "Too many redirects: "

    .line 463
    .line 464
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 465
    .line 466
    .line 467
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 468
    .line 469
    .line 470
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v3

    .line 474
    invoke-direct {v2, v3}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    const/16 v3, 0x7d1

    .line 478
    .line 479
    invoke-direct {v0, v2, v12, v3, v15}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 480
    .line 481
    .line 482
    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 483
    :goto_e
    invoke-virtual {v1}, Ll/wqx0;->o()V

    .line 484
    .line 485
    .line 486
    invoke-static {v0, v12, v15}, Lcom/google/android/gms/internal/ads/zzhp;->zza(Ljava/io/IOException;Ll/akx0;I)Lcom/google/android/gms/internal/ads/zzhp;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    throw v0
.end method

.method public final m(Ljava/net/URL;I[BJJZZLjava/util/Map;)Ljava/net/HttpURLConnection;
    .locals 2
    .param p3    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/net/HttpURLConnection;

    .line 6
    .line 7
    iget p2, p0, Ll/wqx0;->f:I

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 10
    .line 11
    .line 12
    iget p2, p0, Ll/wqx0;->g:I

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Ll/wqx0;->i:Ll/esx0;

    .line 23
    .line 24
    invoke-virtual {p3}, Ll/esx0;->a()Ljava/util/Map;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-interface {p2, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    iget-object p3, p0, Ll/wqx0;->j:Ll/esx0;

    .line 32
    .line 33
    invoke-virtual {p3}, Ll/esx0;->a()Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-interface {p2, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p2, p10}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-eqz p3, :cond_0

    .line 56
    .line 57
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    check-cast p3, Ljava/util/Map$Entry;

    .line 62
    .line 63
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p10

    .line 67
    check-cast p10, Ljava/lang/String;

    .line 68
    .line 69
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    check-cast p3, Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, p10, p3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const-wide/16 p2, 0x0

    .line 80
    .line 81
    cmp-long p10, p4, p2

    .line 82
    .line 83
    const-wide/16 v0, -0x1

    .line 84
    .line 85
    if-nez p10, :cond_2

    .line 86
    .line 87
    cmp-long p4, p6, v0

    .line 88
    .line 89
    if-nez p4, :cond_1

    .line 90
    .line 91
    const/4 p2, 0x0

    .line 92
    goto :goto_1

    .line 93
    :cond_1
    move-wide p4, p2

    .line 94
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string p3, "bytes="

    .line 97
    .line 98
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string p3, "-"

    .line 105
    .line 106
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    cmp-long p3, p6, v0

    .line 110
    .line 111
    if-eqz p3, :cond_3

    .line 112
    .line 113
    add-long/2addr p4, p6

    .line 114
    add-long/2addr p4, v0

    .line 115
    invoke-virtual {p2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    :cond_3
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    :goto_1
    if-eqz p2, :cond_4

    .line 123
    .line 124
    const-string p3, "Range"

    .line 125
    .line 126
    invoke-virtual {p1, p3, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_4
    iget-object p0, p0, Ll/wqx0;->h:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz p0, :cond_5

    .line 132
    .line 133
    const-string p2, "User-Agent"

    .line 134
    .line 135
    invoke-virtual {p1, p2, p0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    :cond_5
    const/4 p0, 0x1

    .line 139
    if-eq p0, p8, :cond_6

    .line 140
    .line 141
    const-string p0, "identity"

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_6
    const-string p0, "gzip"

    .line 145
    .line 146
    :goto_2
    const-string p2, "Accept-Encoding"

    .line 147
    .line 148
    invoke-virtual {p1, p2, p0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, p9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 152
    .line 153
    .line 154
    const/4 p0, 0x0

    .line 155
    invoke-virtual {p1, p0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 156
    .line 157
    .line 158
    sget p0, Ll/akx0;->j:I

    .line 159
    .line 160
    const-string p0, "GET"

    .line 161
    .line 162
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Ljava/net/URLConnection;->connect()V

    .line 166
    .line 167
    .line 168
    return-object p1
.end method

.method public final n(Ljava/net/URL;Ljava/lang/String;Ll/akx0;)Ljava/net/URL;
    .locals 4
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/16 v1, 0x7d1

    .line 3
    .line 4
    if-eqz p2, :cond_4

    .line 5
    .line 6
    :try_start_0
    new-instance v2, Ljava/net/URL;

    .line 7
    .line 8
    invoke-direct {v2, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v3, "https"

    .line 16
    .line 17
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    const-string v3, "http"

    .line 24
    .line 25
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Lcom/google/android/gms/internal/ads/zzhp;

    .line 37
    .line 38
    const-string p2, "Unsupported protocol redirect: "

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-direct {p1, p0, p3, v1, v0}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ll/akx0;II)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :cond_1
    :goto_0
    iget-boolean p0, p0, Ll/wqx0;->e:Z

    .line 49
    .line 50
    if-nez p0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v3, "Disallowed cross-protocol redirect ("

    .line 72
    .line 73
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, " to "

    .line 80
    .line 81
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string p1, ")"

    .line 88
    .line 89
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-direct {p0, p1, p3, v1, v0}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ll/akx0;II)V

    .line 97
    .line 98
    .line 99
    throw p0

    .line 100
    :cond_3
    :goto_1
    return-object v2

    .line 101
    :catch_0
    move-exception p0

    .line 102
    new-instance p1, Lcom/google/android/gms/internal/ads/zzhp;

    .line 103
    .line 104
    invoke-direct {p1, p0, p3, v1, v0}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 105
    .line 106
    .line 107
    throw p1

    .line 108
    :cond_4
    new-instance p0, Lcom/google/android/gms/internal/ads/zzhp;

    .line 109
    .line 110
    const-string p1, "Null location redirect"

    .line 111
    .line 112
    invoke-direct {p0, p1, p3, v1, v0}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/lang/String;Ll/akx0;II)V

    .line 113
    .line 114
    .line 115
    throw p0
.end method

.method public final o()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wqx0;->l:Ljava/net/HttpURLConnection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "DefaultHttpDataSource"

    .line 11
    .line 12
    const-string v2, "Unexpected error while disconnecting"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Ll/y4w0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/wqx0;->l:Ljava/net/HttpURLConnection;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wqx0;->l:Ljava/net/HttpURLConnection;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final zzd()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhp;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v2, p0, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 4
    .line 5
    if-eqz v2, :cond_1

    .line 6
    .line 7
    iget-object v3, p0, Ll/wqx0;->l:Ljava/net/HttpURLConnection;

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    sget v3, Ll/mpw0;->a:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v2

    .line 15
    goto :goto_2

    .line 16
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :catch_0
    move-exception v2

    .line 21
    :try_start_2
    new-instance v3, Lcom/google/android/gms/internal/ads/zzhp;

    .line 22
    .line 23
    iget-object v4, p0, Ll/wqx0;->k:Ll/akx0;

    .line 24
    .line 25
    sget v5, Ll/mpw0;->a:I

    .line 26
    .line 27
    const/16 v5, 0x7d0

    .line 28
    .line 29
    const/4 v6, 0x3

    .line 30
    invoke-direct {v3, v2, v4, v5, v6}, Lcom/google/android/gms/internal/ads/zzhp;-><init>(Ljava/io/IOException;Ll/akx0;II)V

    .line 31
    .line 32
    .line 33
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    :cond_1
    :goto_1
    iput-object v1, p0, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wqx0;->o()V

    .line 37
    .line 38
    .line 39
    iget-boolean v1, p0, Ll/wqx0;->n:Z

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iput-boolean v0, p0, Ll/wqx0;->n:Z

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void

    .line 49
    :goto_2
    iput-object v1, p0, Ll/wqx0;->m:Ljava/io/InputStream;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/wqx0;->o()V

    .line 52
    .line 53
    .line 54
    iget-boolean v1, p0, Ll/wqx0;->n:Z

    .line 55
    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    iput-boolean v0, p0, Ll/wqx0;->n:Z

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 61
    .line 62
    .line 63
    :cond_3
    throw v2
.end method

.method public final zze()Ljava/util/Map;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wqx0;->l:Ljava/net/HttpURLConnection;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgad;->zzd()Lcom/google/android/gms/internal/ads/zzgad;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ll/qpx0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Ll/qpx0;-><init>(Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

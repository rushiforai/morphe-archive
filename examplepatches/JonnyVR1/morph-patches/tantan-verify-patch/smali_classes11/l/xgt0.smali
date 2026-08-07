.class public final Ll/xgt0;
.super Ll/ugt0;
.source "SourceFile"


# static fields
.field public static final f:Ljava/util/Set;

.field public static final g:Ljava/text/DecimalFormat;


# instance fields
.field public d:Ljava/io/File;

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/xgt0;->f:Ljava/util/Set;

    .line 11
    .line 12
    new-instance v0, Ljava/text/DecimalFormat;

    .line 13
    .line 14
    const-string v1, "#,###"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/xgt0;->g:Ljava/text/DecimalFormat;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Ll/bft0;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/ugt0;-><init>(Ll/bft0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ugt0;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const-string p0, "Context.getCacheDir() returned null"

    .line 13
    .line 14
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 19
    .line 20
    const-string v1, "admobVideoStreams"

    .line 21
    .line 22
    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v0, 0x0

    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object p1, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v1, "Could not create preload cache directory at "

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p1, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    iget-object p1, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 76
    .line 77
    invoke-virtual {p1, v1, v2}, Ljava/io/File;->setExecutable(ZZ)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    return-void

    .line 85
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string v1, "Could not set cache file permissions at "

    .line 96
    .line 97
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 105
    .line 106
    return-void
.end method


# virtual methods
.method public final g()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/xgt0;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public final u(Ljava/lang/String;)Z
    .locals 28

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    iget-object v0, v1, Ll/xgt0;->d:Ljava/io/File;

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const/4 v8, 0x0

    .line 9
    if-eqz v0, :cond_1c

    .line 10
    .line 11
    :cond_0
    iget-object v0, v1, Ll/xgt0;->d:Ljava/io/File;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    move v5, v7

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    array-length v3, v0

    .line 22
    move v4, v7

    .line 23
    move v5, v4

    .line 24
    :goto_0
    if-ge v4, v3, :cond_3

    .line 25
    .line 26
    aget-object v6, v0, v4

    .line 27
    .line 28
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    const-string v9, ".done"

    .line 33
    .line 34
    invoke-virtual {v6, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-nez v6, :cond_2

    .line 39
    .line 40
    add-int/lit8 v5, v5, 0x1

    .line 41
    .line 42
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    :goto_1
    sget-object v0, Ll/sgs0;->u:Ll/dgs0;

    .line 46
    .line 47
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-le v5, v0, :cond_9

    .line 62
    .line 63
    iget-object v0, v1, Ll/xgt0;->d:Ljava/io/File;

    .line 64
    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    goto :goto_4

    .line 68
    :cond_4
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    array-length v3, v0

    .line 73
    const-wide v4, 0x7fffffffffffffffL

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    move v6, v7

    .line 79
    move-object v9, v8

    .line 80
    :goto_2
    if-ge v6, v3, :cond_6

    .line 81
    .line 82
    aget-object v10, v0, v6

    .line 83
    .line 84
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v11

    .line 88
    const-string v12, ".done"

    .line 89
    .line 90
    invoke-virtual {v11, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v11

    .line 94
    if-nez v11, :cond_5

    .line 95
    .line 96
    invoke-virtual {v10}, Ljava/io/File;->lastModified()J

    .line 97
    .line 98
    .line 99
    move-result-wide v11

    .line 100
    cmp-long v13, v11, v4

    .line 101
    .line 102
    if-gez v13, :cond_5

    .line 103
    .line 104
    move-object v9, v10

    .line 105
    move-wide v4, v11

    .line 106
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_6
    if-eqz v9, :cond_7

    .line 110
    .line 111
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-virtual {v1, v9}, Ll/xgt0;->x(Ljava/io/File;)Ljava/io/File;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    if-eqz v4, :cond_8

    .line 124
    .line 125
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    and-int/2addr v0, v3

    .line 130
    goto :goto_3

    .line 131
    :cond_7
    move v0, v7

    .line 132
    :cond_8
    :goto_3
    if-nez v0, :cond_0

    .line 133
    .line 134
    :goto_4
    const-string v0, "Unable to expire stream cache"

    .line 135
    .line 136
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-string v0, "expireFailed"

    .line 140
    .line 141
    invoke-virtual {v1, v2, v8, v0, v8}, Ll/ugt0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return v7

    .line 145
    :cond_9
    invoke-static {v2}, Ll/obt0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v9, Ljava/io/File;

    .line 150
    .line 151
    iget-object v3, v1, Ll/xgt0;->d:Ljava/io/File;

    .line 152
    .line 153
    invoke-direct {v9, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, v9}, Ll/xgt0;->x(Ljava/io/File;)Ljava/io/File;

    .line 157
    .line 158
    .line 159
    move-result-object v10

    .line 160
    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    const/4 v11, 0x1

    .line 165
    if-eqz v0, :cond_b

    .line 166
    .line 167
    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_a

    .line 172
    .line 173
    goto :goto_5

    .line 174
    :cond_a
    invoke-virtual {v9}, Ljava/io/File;->length()J

    .line 175
    .line 176
    .line 177
    move-result-wide v3

    .line 178
    long-to-int v0, v3

    .line 179
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    const-string v4, "Stream cache hit at "

    .line 184
    .line 185
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-static {v3}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v1, v2, v3, v0}, Ll/ugt0;->j(Ljava/lang/String;Ljava/lang/String;I)V

    .line 197
    .line 198
    .line 199
    return v11

    .line 200
    :cond_b
    :goto_5
    iget-object v0, v1, Ll/xgt0;->d:Ljava/io/File;

    .line 201
    .line 202
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    sget-object v4, Ll/xgt0;->f:Ljava/util/Set;

    .line 215
    .line 216
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v12

    .line 220
    monitor-enter v4

    .line 221
    :try_start_0
    invoke-interface {v4, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_c

    .line 226
    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    .line 231
    .line 232
    const-string v3, "Stream cache already in progress at "

    .line 233
    .line 234
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    const-string v3, "inProgress"

    .line 252
    .line 253
    invoke-virtual {v1, v2, v0, v3, v8}, Ll/ugt0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    monitor-exit v4

    .line 257
    return v7

    .line 258
    :catchall_0
    move-exception v0

    .line 259
    goto/16 :goto_13

    .line 260
    .line 261
    :cond_c
    invoke-interface {v4, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 265
    const-string v13, "error"

    .line 266
    .line 267
    :try_start_1
    invoke-static {}, Ll/ikw0;->k()Ll/pkw0;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    new-instance v3, Ll/wgt0;

    .line 272
    .line 273
    invoke-direct {v3, v2}, Ll/wgt0;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    const/16 v5, 0x109

    .line 277
    .line 278
    const/4 v6, -0x1

    .line 279
    invoke-virtual {v0, v3, v5, v6}, Ll/pkw0;->v(Ll/okw0;II)Ljava/net/HttpURLConnection;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    if-eqz v0, :cond_e

    .line 284
    .line 285
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 286
    .line 287
    .line 288
    move-result v3

    .line 289
    const/16 v5, 0x190

    .line 290
    .line 291
    if-ge v3, v5, :cond_d

    .line 292
    .line 293
    goto :goto_7

    .line 294
    :cond_d
    const-string v13, "badUrl"
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_4

    .line 295
    .line 296
    :try_start_2
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    new-instance v4, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 303
    .line 304
    .line 305
    const-string v5, "HTTP request failed. Code: "

    .line 306
    .line 307
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 317
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    .line 318
    .line 319
    new-instance v5, Ljava/lang/StringBuilder;

    .line 320
    .line 321
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 322
    .line 323
    .line 324
    const-string v6, "HTTP status code "

    .line 325
    .line 326
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    const-string v3, " at "

    .line 333
    .line 334
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    throw v0
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 348
    :catch_0
    move-exception v0

    .line 349
    goto/16 :goto_10

    .line 350
    .line 351
    :catch_1
    move-exception v0

    .line 352
    goto/16 :goto_10

    .line 353
    .line 354
    :catch_2
    move-exception v0

    .line 355
    goto :goto_6

    .line 356
    :catch_3
    move-exception v0

    .line 357
    :goto_6
    move-object v4, v8

    .line 358
    goto/16 :goto_10

    .line 359
    .line 360
    :catch_4
    move-exception v0

    .line 361
    goto/16 :goto_f

    .line 362
    .line 363
    :catch_5
    move-exception v0

    .line 364
    goto/16 :goto_f

    .line 365
    .line 366
    :cond_e
    :goto_7
    :try_start_4
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentLength()I

    .line 367
    .line 368
    .line 369
    move-result v5

    .line 370
    if-gez v5, :cond_f

    .line 371
    .line 372
    new-instance v0, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 375
    .line 376
    .line 377
    const-string v3, "Stream cache aborted, missing content-length header at "

    .line 378
    .line 379
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    const-string v3, "contentLengthMissing"

    .line 397
    .line 398
    invoke-virtual {v1, v2, v0, v3, v8}, Ll/ugt0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    invoke-interface {v4, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    return v7

    .line 405
    :cond_f
    sget-object v3, Ll/xgt0;->g:Ljava/text/DecimalFormat;

    .line 406
    .line 407
    int-to-long v14, v5

    .line 408
    invoke-virtual {v3, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    sget-object v6, Ll/sgs0;->v:Ll/dgs0;

    .line 413
    .line 414
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 415
    .line 416
    .line 417
    move-result-object v14

    .line 418
    invoke-virtual {v14, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 419
    .line 420
    .line 421
    move-result-object v6

    .line 422
    check-cast v6, Ljava/lang/Integer;

    .line 423
    .line 424
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 425
    .line 426
    .line 427
    move-result v14

    .line 428
    if-le v5, v14, :cond_10

    .line 429
    .line 430
    new-instance v0, Ljava/lang/StringBuilder;

    .line 431
    .line 432
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 433
    .line 434
    .line 435
    const-string v5, "Content length "

    .line 436
    .line 437
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    const-string v5, " exceeds limit at "

    .line 444
    .line 445
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 446
    .line 447
    .line 448
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    new-instance v0, Ljava/lang/StringBuilder;

    .line 459
    .line 460
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 461
    .line 462
    .line 463
    const-string v5, "File too big for full file cache. Size: "

    .line 464
    .line 465
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v3

    .line 479
    const-string v5, "sizeExceeded"

    .line 480
    .line 481
    invoke-virtual {v1, v2, v3, v5, v0}, Ll/ugt0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    invoke-interface {v4, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 485
    .line 486
    .line 487
    return v7

    .line 488
    :cond_10
    new-instance v4, Ljava/lang/StringBuilder;

    .line 489
    .line 490
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 491
    .line 492
    .line 493
    const-string v6, "Caching "

    .line 494
    .line 495
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 496
    .line 497
    .line 498
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    const-string v3, " bytes from "

    .line 502
    .line 503
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v3

    .line 513
    invoke-static {v3}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 517
    .line 518
    .line 519
    move-result-object v0

    .line 520
    invoke-static {v0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    .line 521
    .line 522
    .line 523
    move-result-object v15

    .line 524
    new-instance v3, Ljava/io/FileOutputStream;

    .line 525
    .line 526
    invoke-direct {v3, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_4

    .line 527
    .line 528
    .line 529
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    const/high16 v4, 0x100000

    .line 534
    .line 535
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 536
    .line 537
    .line 538
    move-result-object v4

    .line 539
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 540
    .line 541
    .line 542
    move-result-object v16

    .line 543
    invoke-interface/range {v16 .. v16}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 544
    .line 545
    .line 546
    move-result-wide v17

    .line 547
    sget-object v6, Ll/sgs0;->y:Ll/dgs0;

    .line 548
    .line 549
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 550
    .line 551
    .line 552
    move-result-object v8

    .line 553
    invoke-virtual {v8, v6}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    move-result-object v6

    .line 557
    check-cast v6, Ljava/lang/Long;

    .line 558
    .line 559
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 560
    .line 561
    .line 562
    move-result-wide v7

    .line 563
    new-instance v6, Ll/z7t0;

    .line 564
    .line 565
    invoke-direct {v6, v7, v8}, Ll/z7t0;-><init>(J)V

    .line 566
    .line 567
    .line 568
    sget-object v7, Ll/sgs0;->x:Ll/dgs0;

    .line 569
    .line 570
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 571
    .line 572
    .line 573
    move-result-object v8

    .line 574
    invoke-virtual {v8, v7}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 575
    .line 576
    .line 577
    move-result-object v7

    .line 578
    check-cast v7, Ljava/lang/Long;

    .line 579
    .line 580
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 581
    .line 582
    .line 583
    move-result-wide v7

    .line 584
    const/4 v11, 0x0

    .line 585
    :goto_8
    invoke-interface {v15, v4}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    .line 586
    .line 587
    .line 588
    move-result v21

    .line 589
    if-ltz v21, :cond_16

    .line 590
    .line 591
    add-int v11, v11, v21

    .line 592
    .line 593
    if-gt v11, v14, :cond_15

    .line 594
    .line 595
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 596
    .line 597
    .line 598
    :goto_9
    invoke-virtual {v0, v4}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 599
    .line 600
    .line 601
    move-result v21

    .line 602
    if-gtz v21, :cond_14

    .line 603
    .line 604
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 605
    .line 606
    .line 607
    invoke-interface/range {v16 .. v16}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 608
    .line 609
    .line 610
    move-result-wide v21

    .line 611
    sub-long v21, v21, v17

    .line 612
    .line 613
    const-wide/16 v23, 0x3e8

    .line 614
    .line 615
    mul-long v23, v23, v7

    .line 616
    .line 617
    cmp-long v21, v21, v23

    .line 618
    .line 619
    if-gtz v21, :cond_13

    .line 620
    .line 621
    move-object/from16 v21, v0

    .line 622
    .line 623
    iget-boolean v0, v1, Ll/xgt0;->e:Z

    .line 624
    .line 625
    if-nez v0, :cond_12

    .line 626
    .line 627
    invoke-virtual {v6}, Ll/z7t0;->b()Z

    .line 628
    .line 629
    .line 630
    move-result v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_6

    .line 631
    if-eqz v0, :cond_11

    .line 632
    .line 633
    move-object/from16 v22, v3

    .line 634
    .line 635
    :try_start_6
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 636
    .line 637
    .line 638
    move-result-object v3

    .line 639
    sget-object v0, Ll/obt0;->b:Landroid/os/Handler;

    .line 640
    .line 641
    move-object/from16 v23, v0

    .line 642
    .line 643
    new-instance v0, Ll/ogt0;

    .line 644
    .line 645
    move-object/from16 v24, v6

    .line 646
    .line 647
    const/4 v6, 0x0

    .line 648
    move/from16 v25, v11

    .line 649
    .line 650
    move-object v11, v4

    .line 651
    move/from16 v4, v25

    .line 652
    .line 653
    move-wide/from16 v25, v7

    .line 654
    .line 655
    move-object/from16 v7, v23

    .line 656
    .line 657
    invoke-direct/range {v0 .. v6}, Ll/ogt0;-><init>(Ll/ugt0;Ljava/lang/String;Ljava/lang/String;IIZ)V

    .line 658
    .line 659
    .line 660
    invoke-virtual {v7, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 661
    .line 662
    .line 663
    goto :goto_a

    .line 664
    :cond_11
    move/from16 v22, v11

    .line 665
    .line 666
    move-object v11, v4

    .line 667
    move/from16 v4, v22

    .line 668
    .line 669
    move-object/from16 v22, v3

    .line 670
    .line 671
    move-object/from16 v24, v6

    .line 672
    .line 673
    move-wide/from16 v25, v7

    .line 674
    .line 675
    :goto_a
    move-object v0, v11

    .line 676
    move v11, v4

    .line 677
    move-object v4, v0

    .line 678
    move-object/from16 v0, v21

    .line 679
    .line 680
    move-object/from16 v3, v22

    .line 681
    .line 682
    move-object/from16 v6, v24

    .line 683
    .line 684
    move-wide/from16 v7, v25

    .line 685
    .line 686
    goto :goto_8

    .line 687
    :catch_6
    move-exception v0

    .line 688
    :goto_b
    move-object/from16 v22, v3

    .line 689
    .line 690
    goto :goto_c

    .line 691
    :catch_7
    move-exception v0

    .line 692
    goto :goto_b

    .line 693
    :cond_12
    move-object/from16 v22, v3

    .line 694
    .line 695
    const-string v13, "externalAbort"

    .line 696
    .line 697
    new-instance v0, Ljava/io/IOException;

    .line 698
    .line 699
    const-string v3, "abort requested"

    .line 700
    .line 701
    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 702
    .line 703
    .line 704
    throw v0

    .line 705
    :catch_8
    move-exception v0

    .line 706
    goto :goto_c

    .line 707
    :catch_9
    move-exception v0

    .line 708
    :goto_c
    move-object/from16 v8, v22

    .line 709
    .line 710
    const/4 v4, 0x0

    .line 711
    goto/16 :goto_10

    .line 712
    .line 713
    :cond_13
    move-object/from16 v22, v3

    .line 714
    .line 715
    move-wide/from16 v25, v7

    .line 716
    .line 717
    const-string v13, "downloadTimeout"

    .line 718
    .line 719
    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object v0

    .line 723
    new-instance v3, Ljava/lang/StringBuilder;

    .line 724
    .line 725
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 726
    .line 727
    .line 728
    const-string v4, "Timeout exceeded. Limit: "

    .line 729
    .line 730
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 731
    .line 732
    .line 733
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 734
    .line 735
    .line 736
    const-string v0, " sec"

    .line 737
    .line 738
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 739
    .line 740
    .line 741
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 742
    .line 743
    .line 744
    move-result-object v8
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_8

    .line 745
    :try_start_7
    new-instance v0, Ljava/io/IOException;

    .line 746
    .line 747
    const-string v3, "stream cache time limit exceeded"

    .line 748
    .line 749
    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 750
    .line 751
    .line 752
    throw v0
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_b
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_a

    .line 753
    :catch_a
    move-exception v0

    .line 754
    goto :goto_d

    .line 755
    :catch_b
    move-exception v0

    .line 756
    :goto_d
    move-object v4, v8

    .line 757
    move-object/from16 v8, v22

    .line 758
    .line 759
    goto/16 :goto_10

    .line 760
    .line 761
    :cond_14
    move/from16 v27, v11

    .line 762
    .line 763
    move-object v11, v4

    .line 764
    move/from16 v4, v27

    .line 765
    .line 766
    move-object/from16 v27, v11

    .line 767
    .line 768
    move v11, v4

    .line 769
    move-object/from16 v4, v27

    .line 770
    .line 771
    goto/16 :goto_9

    .line 772
    .line 773
    :cond_15
    move-object/from16 v22, v3

    .line 774
    .line 775
    move v4, v11

    .line 776
    :try_start_8
    const-string v13, "sizeExceeded"

    .line 777
    .line 778
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 779
    .line 780
    .line 781
    move-result-object v0

    .line 782
    new-instance v3, Ljava/lang/StringBuilder;

    .line 783
    .line 784
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 785
    .line 786
    .line 787
    const-string v4, "File too big for full file cache. Size: "

    .line 788
    .line 789
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    .line 791
    .line 792
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 793
    .line 794
    .line 795
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object v8
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_8

    .line 799
    :try_start_9
    new-instance v0, Ljava/io/IOException;

    .line 800
    .line 801
    const-string v3, "stream cache file size limit exceeded"

    .line 802
    .line 803
    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 804
    .line 805
    .line 806
    throw v0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_b
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_a

    .line 807
    :cond_16
    move-object/from16 v22, v3

    .line 808
    .line 809
    :try_start_a
    invoke-virtual/range {v22 .. v22}, Ljava/io/FileOutputStream;->close()V

    .line 810
    .line 811
    .line 812
    const/4 v0, 0x3

    .line 813
    invoke-static {v0}, Ll/dct0;->j(I)Z

    .line 814
    .line 815
    .line 816
    move-result v0

    .line 817
    if-eqz v0, :cond_17

    .line 818
    .line 819
    sget-object v0, Ll/xgt0;->g:Ljava/text/DecimalFormat;

    .line 820
    .line 821
    int-to-long v3, v11

    .line 822
    invoke-virtual {v0, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 823
    .line 824
    .line 825
    move-result-object v0

    .line 826
    new-instance v3, Ljava/lang/StringBuilder;

    .line 827
    .line 828
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 829
    .line 830
    .line 831
    const-string v4, "Preloaded "

    .line 832
    .line 833
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 834
    .line 835
    .line 836
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 837
    .line 838
    .line 839
    const-string v0, " bytes from "

    .line 840
    .line 841
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 842
    .line 843
    .line 844
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 845
    .line 846
    .line 847
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object v0

    .line 851
    invoke-static {v0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 852
    .line 853
    .line 854
    :cond_17
    const/4 v0, 0x1

    .line 855
    const/4 v3, 0x0

    .line 856
    invoke-virtual {v9, v0, v3}, Ljava/io/File;->setReadable(ZZ)Z

    .line 857
    .line 858
    .line 859
    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    .line 860
    .line 861
    .line 862
    move-result v0

    .line 863
    if-eqz v0, :cond_18

    .line 864
    .line 865
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 866
    .line 867
    .line 868
    move-result-wide v3

    .line 869
    invoke-virtual {v10, v3, v4}, Ljava/io/File;->setLastModified(J)Z
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_8

    .line 870
    .line 871
    .line 872
    goto :goto_e

    .line 873
    :cond_18
    :try_start_b
    invoke-virtual {v10}, Ljava/io/File;->createNewFile()Z
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_c
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_8

    .line 874
    .line 875
    .line 876
    :catch_c
    :goto_e
    :try_start_c
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 877
    .line 878
    .line 879
    move-result-object v0

    .line 880
    invoke-virtual {v1, v2, v0, v11}, Ll/ugt0;->j(Ljava/lang/String;Ljava/lang/String;I)V

    .line 881
    .line 882
    .line 883
    sget-object v0, Ll/xgt0;->f:Ljava/util/Set;

    .line 884
    .line 885
    invoke-interface {v0, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_8

    .line 886
    .line 887
    .line 888
    const/16 v20, 0x1

    .line 889
    .line 890
    return v20

    .line 891
    :goto_f
    const/4 v4, 0x0

    .line 892
    const/4 v8, 0x0

    .line 893
    :goto_10
    instance-of v3, v0, Ljava/lang/RuntimeException;

    .line 894
    .line 895
    if-eqz v3, :cond_19

    .line 896
    .line 897
    const-string v3, "VideoStreamFullFileCache.preload"

    .line 898
    .line 899
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 900
    .line 901
    .line 902
    move-result-object v5

    .line 903
    invoke-virtual {v5, v0, v3}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 904
    .line 905
    .line 906
    :cond_19
    :try_start_d
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_d
    .catch Ljava/lang/NullPointerException; {:try_start_d .. :try_end_d} :catch_d

    .line 907
    .line 908
    .line 909
    :catch_d
    iget-boolean v3, v1, Ll/xgt0;->e:Z

    .line 910
    .line 911
    if-eqz v3, :cond_1a

    .line 912
    .line 913
    new-instance v0, Ljava/lang/StringBuilder;

    .line 914
    .line 915
    const-string v3, "Preload aborted for URL \""

    .line 916
    .line 917
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 918
    .line 919
    .line 920
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 921
    .line 922
    .line 923
    const-string v3, "\""

    .line 924
    .line 925
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 926
    .line 927
    .line 928
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 929
    .line 930
    .line 931
    move-result-object v0

    .line 932
    invoke-static {v0}, Ll/dct0;->f(Ljava/lang/String;)V

    .line 933
    .line 934
    .line 935
    goto :goto_11

    .line 936
    :cond_1a
    new-instance v3, Ljava/lang/StringBuilder;

    .line 937
    .line 938
    const-string v5, "Preload failed for URL \""

    .line 939
    .line 940
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 941
    .line 942
    .line 943
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 944
    .line 945
    .line 946
    const-string v5, "\""

    .line 947
    .line 948
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 949
    .line 950
    .line 951
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 952
    .line 953
    .line 954
    move-result-object v3

    .line 955
    invoke-static {v3, v0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 956
    .line 957
    .line 958
    :goto_11
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 959
    .line 960
    .line 961
    move-result v0

    .line 962
    if-eqz v0, :cond_1b

    .line 963
    .line 964
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 965
    .line 966
    .line 967
    move-result v0

    .line 968
    if-nez v0, :cond_1b

    .line 969
    .line 970
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 971
    .line 972
    .line 973
    move-result-object v0

    .line 974
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 975
    .line 976
    .line 977
    move-result-object v0

    .line 978
    const-string v3, "Could not delete partial cache file at "

    .line 979
    .line 980
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 981
    .line 982
    .line 983
    move-result-object v0

    .line 984
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 985
    .line 986
    .line 987
    :cond_1b
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 988
    .line 989
    .line 990
    move-result-object v0

    .line 991
    invoke-virtual {v1, v2, v0, v13, v4}, Ll/ugt0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 992
    .line 993
    .line 994
    sget-object v0, Ll/xgt0;->f:Ljava/util/Set;

    .line 995
    .line 996
    invoke-interface {v0, v12}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 997
    .line 998
    .line 999
    :goto_12
    const/16 v19, 0x0

    .line 1000
    .line 1001
    return v19

    .line 1002
    :goto_13
    :try_start_e
    monitor-exit v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 1003
    throw v0

    .line 1004
    :cond_1c
    const-string v0, "noCacheDir"

    .line 1005
    .line 1006
    const/4 v3, 0x0

    .line 1007
    invoke-virtual {v1, v2, v3, v0, v3}, Ll/ugt0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    .line 1009
    .line 1010
    goto :goto_12
.end method

.method public final x(Ljava/io/File;)Ljava/io/File;
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xgt0;->d:Ljava/io/File;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v1, ".done"

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.class public final Ll/osg0;
.super Ll/vog0;
.source "SourceFile"


# static fields
.field public static final h:Ljava/lang/String;


# instance fields
.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Landroid/content/res/AssetManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/osg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/osg0;->h:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/olg0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p2}, Ll/vog0;-><init>(Ll/olg0;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/io/File;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "sud/mgp/utapp"

    .line 11
    .line 12
    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Ll/osg0;->e:Ljava/lang/String;

    .line 20
    .line 21
    new-instance p2, Ljava/io/File;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "sud/mgp/utapp/embed"

    .line 28
    .line 29
    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, p0, Ll/osg0;->f:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/osg0;->g:Landroid/content/res/AssetManager;

    .line 43
    .line 44
    return-void
.end method

.method public static l(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;
    .locals 12

    .line 1
    const-string v0, "__MACOSX"

    .line 2
    .line 3
    sget-object v1, Ll/osg0;->h:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "unzip path = "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v3, " filesize = "

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    new-instance v3, Ljava/io/File;

    .line 21
    .line 22
    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v4, Ll/ing0;->a:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, "/StreamingAssets"

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p1, "/StreamingAssetsCache"

    .line 70
    .line 71
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance v2, Ll/vgg0;

    .line 82
    .line 83
    invoke-direct {v2}, Ll/vgg0;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v3, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v4, "unzipFileAtPath zipFilePath:"

    .line 89
    .line 90
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v4, "  location:"

    .line 97
    .line 98
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    const-string v4, "FileUtils"

    .line 109
    .line 110
    invoke-static {v4, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Ljava/io/File;

    .line 114
    .line 115
    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const/4 v5, -0x1

    .line 119
    const/4 v6, 0x0

    .line 120
    const/4 v7, 0x0

    .line 121
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    if-nez v8, :cond_0

    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :catchall_0
    move-exception p0

    .line 132
    move-object p1, v7

    .line 133
    move-object v8, p1

    .line 134
    goto/16 :goto_13

    .line 135
    .line 136
    :catch_0
    move-exception p0

    .line 137
    goto/16 :goto_a

    .line 138
    .line 139
    :cond_0
    :goto_0
    new-instance v3, Ljava/io/FileInputStream;

    .line 140
    .line 141
    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    .line 143
    .line 144
    :try_start_1
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;

    .line 145
    .line 146
    const-string v8, "UTF-8"

    .line 147
    .line 148
    invoke-direct {p0, v3, v8}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 149
    .line 150
    .line 151
    move-object v8, v7

    .line 152
    :cond_1
    :goto_1
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->getNextEntry()Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;

    .line 153
    .line 154
    .line 155
    move-result-object v9

    .line 156
    if-eqz v9, :cond_5

    .line 157
    .line 158
    invoke-interface {v9}, Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v10

    .line 162
    invoke-virtual {v10, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v11

    .line 166
    if-nez v11, :cond_1

    .line 167
    .line 168
    invoke-interface {v9}, Lorg/apache/commons/sudcompress/archivers/ArchiveEntry;->isDirectory()Z

    .line 169
    .line 170
    .line 171
    move-result v9

    .line 172
    if-eqz v9, :cond_2

    .line 173
    .line 174
    new-instance v9, Ljava/io/File;

    .line 175
    .line 176
    invoke-direct {v9, p1, v10}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :catchall_1
    move-exception p1

    .line 184
    goto/16 :goto_7

    .line 185
    .line 186
    :catch_1
    move-exception v9

    .line 187
    goto/16 :goto_b

    .line 188
    .line 189
    :cond_2
    const/16 v9, 0x2f

    .line 190
    .line 191
    invoke-virtual {v10, v9}, Ljava/lang/String;->indexOf(I)I

    .line 192
    .line 193
    .line 194
    move-result v11

    .line 195
    invoke-virtual {v10, v9}, Ljava/lang/String;->lastIndexOf(I)I

    .line 196
    .line 197
    .line 198
    move-result v9

    .line 199
    if-lez v11, :cond_3

    .line 200
    .line 201
    if-ne v11, v9, :cond_3

    .line 202
    .line 203
    add-int/lit8 v11, v11, 0x1

    .line 204
    .line 205
    invoke-virtual {v10, v6, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v9

    .line 209
    new-instance v11, Ljava/io/File;

    .line 210
    .line 211
    invoke-direct {v11, p1, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 215
    .line 216
    .line 217
    move-result v9

    .line 218
    if-nez v9, :cond_3

    .line 219
    .line 220
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 221
    .line 222
    .line 223
    :cond_3
    new-instance v9, Ljava/io/File;

    .line 224
    .line 225
    invoke-direct {v9, p1, v10}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    const/16 v10, 0x1400

    .line 229
    .line 230
    new-array v10, v10, [B

    .line 231
    .line 232
    new-instance v11, Ljava/io/FileOutputStream;

    .line 233
    .line 234
    invoke-direct {v11, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 235
    .line 236
    .line 237
    :goto_2
    :try_start_3
    invoke-virtual {p0, v10}, Ljava/io/InputStream;->read([B)I

    .line 238
    .line 239
    .line 240
    move-result v8

    .line 241
    if-eq v8, v5, :cond_4

    .line 242
    .line 243
    invoke-virtual {v11, v10, v6, v8}, Ljava/io/OutputStream;->write([BII)V

    .line 244
    .line 245
    .line 246
    goto :goto_2

    .line 247
    :catchall_2
    move-exception p1

    .line 248
    goto :goto_3

    .line 249
    :catch_2
    move-exception v8

    .line 250
    goto :goto_4

    .line 251
    :cond_4
    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 252
    .line 253
    .line 254
    move-object v8, v11

    .line 255
    goto :goto_1

    .line 256
    :goto_3
    move-object v7, v11

    .line 257
    goto/16 :goto_14

    .line 258
    .line 259
    :goto_4
    move-object v9, v8

    .line 260
    move-object v8, v11

    .line 261
    goto :goto_b

    .line 262
    :cond_5
    if-eqz v8, :cond_6

    .line 263
    .line 264
    :try_start_4
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    .line 265
    .line 266
    .line 267
    goto :goto_5

    .line 268
    :catch_3
    move-exception p0

    .line 269
    goto :goto_6

    .line 270
    :cond_6
    :goto_5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->close()V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 274
    .line 275
    .line 276
    goto :goto_e

    .line 277
    :goto_6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 278
    .line 279
    .line 280
    goto :goto_e

    .line 281
    :goto_7
    move-object v7, v8

    .line 282
    goto/16 :goto_14

    .line 283
    .line 284
    :catchall_3
    move-exception p0

    .line 285
    move-object p1, p0

    .line 286
    goto :goto_8

    .line 287
    :catch_4
    move-exception p0

    .line 288
    move-object v8, p0

    .line 289
    goto :goto_9

    .line 290
    :goto_8
    move-object p0, v7

    .line 291
    goto/16 :goto_14

    .line 292
    .line 293
    :goto_9
    move-object p0, v7

    .line 294
    move-object v9, v8

    .line 295
    move-object v8, p0

    .line 296
    goto :goto_b

    .line 297
    :goto_a
    move-object v9, p0

    .line 298
    move-object p0, v7

    .line 299
    move-object v3, p0

    .line 300
    move-object v8, v3

    .line 301
    :goto_b
    :try_start_5
    new-instance v10, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .line 305
    .line 306
    const-string v11, "unzipFileAtPath :"

    .line 307
    .line 308
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-static {v9}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v11

    .line 315
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v10

    .line 322
    invoke-static {v4, v10}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v9}, Ljava/lang/Throwable;->printStackTrace()V

    .line 326
    .line 327
    .line 328
    iput v5, v2, Ll/vgg0;->a:I

    .line 329
    .line 330
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v5

    .line 334
    iput-object v5, v2, Ll/vgg0;->b:Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 335
    .line 336
    if-eqz v8, :cond_7

    .line 337
    .line 338
    :try_start_6
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    .line 339
    .line 340
    .line 341
    goto :goto_c

    .line 342
    :catch_5
    move-exception p0

    .line 343
    goto :goto_d

    .line 344
    :cond_7
    :goto_c
    if-eqz p0, :cond_8

    .line 345
    .line 346
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->close()V

    .line 347
    .line 348
    .line 349
    :cond_8
    if-eqz v3, :cond_9

    .line 350
    .line 351
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 352
    .line 353
    .line 354
    goto :goto_e

    .line 355
    :goto_d
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 356
    .line 357
    .line 358
    :cond_9
    :goto_e
    iget p0, v2, Ll/vgg0;->a:I

    .line 359
    .line 360
    if-nez p0, :cond_11

    .line 361
    .line 362
    new-instance p0, Ljava/io/File;

    .line 363
    .line 364
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 368
    .line 369
    .line 370
    move-result v3

    .line 371
    if-nez v3, :cond_a

    .line 372
    .line 373
    goto :goto_11

    .line 374
    :cond_a
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    if-nez p0, :cond_b

    .line 379
    .line 380
    goto :goto_11

    .line 381
    :cond_b
    array-length v3, p0

    .line 382
    move-object v5, v7

    .line 383
    :goto_f
    if-ge v6, v3, :cond_e

    .line 384
    .line 385
    aget-object v8, p0, v6

    .line 386
    .line 387
    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v9

    .line 391
    invoke-virtual {v9, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 392
    .line 393
    .line 394
    move-result v10

    .line 395
    if-nez v10, :cond_d

    .line 396
    .line 397
    if-nez v5, :cond_f

    .line 398
    .line 399
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    .line 400
    .line 401
    .line 402
    move-result v8

    .line 403
    if-nez v8, :cond_c

    .line 404
    .line 405
    goto :goto_10

    .line 406
    :cond_c
    move-object v5, v9

    .line 407
    :cond_d
    add-int/lit8 v6, v6, 0x1

    .line 408
    .line 409
    goto :goto_f

    .line 410
    :cond_e
    :goto_10
    move-object v7, v5

    .line 411
    :cond_f
    :goto_11
    const-string p0, "  newDir:"

    .line 412
    .line 413
    const-string v0, "  oldDir:"

    .line 414
    .line 415
    if-eqz v7, :cond_10

    .line 416
    .line 417
    new-instance v3, Ljava/io/File;

    .line 418
    .line 419
    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    new-instance v5, Ljava/io/File;

    .line 423
    .line 424
    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    invoke-virtual {v3, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    new-instance v6, Ljava/lang/StringBuilder;

    .line 432
    .line 433
    const-string v7, "unpackZip rootDirectory != null  renameResult:"

    .line 434
    .line 435
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 451
    .line 452
    .line 453
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    invoke-static {v4, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 458
    .line 459
    .line 460
    goto :goto_12

    .line 461
    :cond_10
    new-instance v3, Ljava/io/File;

    .line 462
    .line 463
    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    new-instance v5, Ljava/io/File;

    .line 467
    .line 468
    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {v3, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 472
    .line 473
    .line 474
    move-result v1

    .line 475
    new-instance v6, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    const-string v7, "unpackZip renameResult:"

    .line 478
    .line 479
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 495
    .line 496
    .line 497
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 498
    .line 499
    .line 500
    move-result-object p0

    .line 501
    invoke-static {v4, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 502
    .line 503
    .line 504
    :cond_11
    :goto_12
    invoke-static {p1}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    return-object v2

    .line 508
    :catchall_4
    move-exception p1

    .line 509
    move-object v7, p1

    .line 510
    move-object p1, p0

    .line 511
    move-object p0, v7

    .line 512
    move-object v7, v3

    .line 513
    :goto_13
    move-object v3, p1

    .line 514
    move-object p1, p0

    .line 515
    move-object p0, v3

    .line 516
    move-object v3, v7

    .line 517
    goto/16 :goto_7

    .line 518
    .line 519
    :goto_14
    if-eqz v7, :cond_12

    .line 520
    .line 521
    :try_start_7
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 522
    .line 523
    .line 524
    goto :goto_15

    .line 525
    :catch_6
    move-exception p0

    .line 526
    goto :goto_16

    .line 527
    :cond_12
    :goto_15
    if-eqz p0, :cond_13

    .line 528
    .line 529
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveInputStream;->close()V

    .line 530
    .line 531
    .line 532
    :cond_13
    if-eqz v3, :cond_14

    .line 533
    .line 534
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 535
    .line 536
    .line 537
    goto :goto_17

    .line 538
    :goto_16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 539
    .line 540
    .line 541
    :cond_14
    :goto_17
    throw p1
.end method

.method public static synthetic m(ZLl/uog0;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string p2, "/StreamingAssets"

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-interface {p1, p2, p0, v0}, Ll/uog0;->a(ZLjava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    invoke-interface {p1, v0, p0, v0}, Ll/uog0;->a(ZLjava/lang/String;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final b(Ll/uug0;Ljava/io/File;)Ljava/lang/Object;
    .locals 4

    .line 1
    const-string v0, "processDownloadPackage"

    .line 2
    .line 3
    const-string v1, "UTRealSudGamePackageManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/nlg0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/nlg0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const/16 v2, 0x2f

    .line 18
    .line 19
    invoke-virtual {p2, v2}, Ljava/lang/String;->lastIndexOf(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-virtual {p2, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {p2, v2}, Ll/osg0;->l(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, v0, Ll/nlg0;->a:Ll/vgg0;

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "processDownloadPackage unzipResult:"

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, v0, Ll/nlg0;->a:Ll/vgg0;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, "  path:"

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, v0, Ll/nlg0;->a:Ll/vgg0;

    .line 62
    .line 63
    iget v1, v1, Ll/vgg0;->a:I

    .line 64
    .line 65
    if-nez v1, :cond_0

    .line 66
    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v1

    .line 71
    iput-wide v1, p1, Ll/uug0;->f:J

    .line 72
    .line 73
    iget-object v1, p0, Ll/vog0;->b:Ll/olg0;

    .line 74
    .line 75
    invoke-virtual {v1, p1}, Ll/olg0;->g(Ll/uug0;)V

    .line 76
    .line 77
    .line 78
    iget-wide v1, p1, Ll/uug0;->a:J

    .line 79
    .line 80
    invoke-virtual {p0, v1, v2}, Ll/vog0;->e(J)V

    .line 81
    .line 82
    .line 83
    :cond_0
    invoke-virtual {p0, p2}, Ll/osg0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    iput-object p0, v0, Ll/nlg0;->b:Ljava/lang/String;

    .line 88
    .line 89
    return-object v0
.end method

.method public final c(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 p0, 0x2f

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "/StreamingAssets"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final g(JLjava/lang/String;Ll/uog0;)V
    .locals 7

    .line 1
    sget-object v0, Ll/fkg0;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/fqg0;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-wide v3, p1

    .line 7
    move-object v5, p3

    .line 8
    move-object v6, p4

    .line 9
    invoke-direct/range {v1 .. v6}, Ll/fqg0;-><init>(Ll/osg0;JLjava/lang/String;Ll/uog0;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final h(Ljava/lang/String;Ljava/lang/Object;Ll/bxg0;Ll/klg0;)V
    .locals 2

    .line 1
    instance-of p0, p2, Ll/nlg0;

    .line 2
    .line 3
    const-string v0, "UTRealSudGamePackageManager"

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    check-cast p2, Ll/nlg0;

    .line 8
    .line 9
    iget-object p0, p2, Ll/nlg0;->a:Ll/vgg0;

    .line 10
    .line 11
    iget-object p2, p2, Ll/nlg0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget v1, p0, Ll/vgg0;->a:I

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "onDownloadSuccess path="

    .line 20
    .line 21
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Ll/osg0;->h:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {p4, p2, p3}, Ll/klg0;->b(Ljava/lang/String;Ll/bxg0;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    const-string p1, "unzip error"

    .line 56
    .line 57
    invoke-static {v0, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    sget-object p2, Ll/osg0;->h:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p2, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p2, "unzip error:"

    .line 68
    .line 69
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/vgg0;->b:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/16 p1, -0x2776

    .line 82
    .line 83
    invoke-interface {p4, p1, p0, p3}, Ll/klg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    const-string p0, "extendInfo empty"

    .line 88
    .line 89
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    sget-object p1, Ll/osg0;->h:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p1, p0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const/4 p1, -0x1

    .line 98
    invoke-interface {p4, p1, p0, p3}, Ll/klg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final j(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/osg0;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final k(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/osg0;->e:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final n(JLjava/lang/String;Ll/uog0;)V
    .locals 11

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    new-instance v1, Ljava/io/File;

    .line 4
    .line 5
    iget-object v2, p0, Ll/osg0;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Ljava/io/File;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 30
    .line 31
    .line 32
    :cond_0
    sget-object v2, Ll/wog0;->a:Ll/vug0;

    .line 33
    .line 34
    iget-object v2, v2, Ll/vug0;->a:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ll/plg0;

    .line 45
    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v4, "/StreamingAssets"

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    const/4 v5, 0x1

    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-boolean v2, v2, Ll/plg0;->a:Z

    .line 68
    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    sget-object v2, Ll/ing0;->a:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v2, Ljava/io/File;

    .line 75
    .line 76
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_14

    .line 84
    .line 85
    :goto_0
    const/4 v2, -0x1

    .line 86
    const/4 v3, 0x0

    .line 87
    :try_start_0
    const-string v6, "/"

    .line 88
    .line 89
    invoke-virtual {p3, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-ne v2, v6, :cond_3

    .line 94
    .line 95
    move-object v6, p3

    .line 96
    move-object v7, v0

    .line 97
    goto :goto_1

    .line 98
    :cond_3
    add-int/2addr v6, v5

    .line 99
    invoke-virtual {p3, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    invoke-virtual {p3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    :goto_1
    iget-object v8, p0, Ll/osg0;->g:Landroid/content/res/AssetManager;

    .line 108
    .line 109
    invoke-virtual {v8, v7}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v7

    .line 113
    move v8, v3

    .line 114
    :goto_2
    array-length v9, v7

    .line 115
    if-ge v8, v9, :cond_5

    .line 116
    .line 117
    aget-object v9, v7, v8

    .line 118
    .line 119
    if-eqz v9, :cond_4

    .line 120
    .line 121
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v9
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    if-eqz v9, :cond_4

    .line 126
    .line 127
    move v6, v5

    .line 128
    goto :goto_4

    .line 129
    :catch_0
    move-exception v6

    .line 130
    goto :goto_3

    .line 131
    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :goto_3
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 135
    .line 136
    .line 137
    :cond_5
    move v6, v3

    .line 138
    :goto_4
    if-eqz v6, :cond_c

    .line 139
    .line 140
    const-string v7, "."

    .line 141
    .line 142
    invoke-virtual {p3, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    if-ne v2, v7, :cond_6

    .line 147
    .line 148
    new-instance v2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    goto :goto_5

    .line 173
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v8

    .line 190
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    :goto_5
    sget-object v7, Ll/ing0;->a:Ljava/lang/String;

    .line 205
    .line 206
    new-instance v7, Ljava/io/File;

    .line 207
    .line 208
    invoke-direct {v7, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 212
    .line 213
    .line 214
    move-result v7

    .line 215
    new-instance v8, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    const-string v9, "deleteFile result:"

    .line 218
    .line 219
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    const-string v8, "FileUtils"

    .line 230
    .line 231
    invoke-static {v8, v7}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    const/4 v7, 0x0

    .line 235
    :try_start_1
    iget-object v8, p0, Ll/osg0;->g:Landroid/content/res/AssetManager;

    .line 236
    .line 237
    invoke-virtual {v8, p3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 238
    .line 239
    .line 240
    move-result-object p3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 241
    const/16 v8, 0x400

    .line 242
    .line 243
    :try_start_2
    new-array v8, v8, [B

    .line 244
    .line 245
    new-instance v9, Ljava/io/File;

    .line 246
    .line 247
    invoke-direct {v9, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v9}, Ljava/io/File;->createNewFile()Z

    .line 251
    .line 252
    .line 253
    new-instance v10, Ljava/io/FileOutputStream;

    .line 254
    .line 255
    invoke-direct {v10, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 256
    .line 257
    .line 258
    :goto_6
    :try_start_3
    invoke-virtual {p3, v8}, Ljava/io/InputStream;->read([B)I

    .line 259
    .line 260
    .line 261
    move-result v7

    .line 262
    if-lez v7, :cond_7

    .line 263
    .line 264
    invoke-virtual {v10, v8, v3, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 265
    .line 266
    .line 267
    goto :goto_6

    .line 268
    :catchall_0
    move-exception p0

    .line 269
    goto :goto_e

    .line 270
    :catch_1
    move-exception v7

    .line 271
    goto :goto_9

    .line 272
    :cond_7
    :try_start_4
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 273
    .line 274
    .line 275
    goto :goto_7

    .line 276
    :catch_2
    move-exception p3

    .line 277
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 278
    .line 279
    .line 280
    :goto_7
    :try_start_5
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 281
    .line 282
    .line 283
    goto :goto_c

    .line 284
    :catch_3
    move-exception p3

    .line 285
    goto :goto_b

    .line 286
    :catchall_1
    move-exception p0

    .line 287
    move-object v10, v7

    .line 288
    :goto_8
    move-object v7, p3

    .line 289
    goto :goto_d

    .line 290
    :catch_4
    move-exception v8

    .line 291
    move-object v10, v7

    .line 292
    move-object v7, v8

    .line 293
    goto :goto_9

    .line 294
    :catchall_2
    move-exception p0

    .line 295
    move-object v10, v7

    .line 296
    goto :goto_d

    .line 297
    :catch_5
    move-exception p3

    .line 298
    move-object v10, v7

    .line 299
    move-object v7, p3

    .line 300
    move-object p3, v10

    .line 301
    :goto_9
    :try_start_6
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 302
    .line 303
    .line 304
    if-eqz p3, :cond_8

    .line 305
    .line 306
    :try_start_7
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 307
    .line 308
    .line 309
    goto :goto_a

    .line 310
    :catch_6
    move-exception p3

    .line 311
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 312
    .line 313
    .line 314
    :cond_8
    :goto_a
    if-eqz v10, :cond_9

    .line 315
    .line 316
    :try_start_8
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 317
    .line 318
    .line 319
    goto :goto_c

    .line 320
    :goto_b
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 321
    .line 322
    .line 323
    :cond_9
    :goto_c
    move-object p3, v2

    .line 324
    goto :goto_11

    .line 325
    :catchall_3
    move-exception p0

    .line 326
    goto :goto_8

    .line 327
    :goto_d
    move-object p3, v7

    .line 328
    :goto_e
    if-eqz p3, :cond_a

    .line 329
    .line 330
    :try_start_9
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 331
    .line 332
    .line 333
    goto :goto_f

    .line 334
    :catch_7
    move-exception p1

    .line 335
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 336
    .line 337
    .line 338
    :cond_a
    :goto_f
    if-eqz v10, :cond_b

    .line 339
    .line 340
    :try_start_a
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    .line 341
    .line 342
    .line 343
    goto :goto_10

    .line 344
    :catch_8
    move-exception p1

    .line 345
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 346
    .line 347
    .line 348
    :cond_b
    :goto_10
    throw p0

    .line 349
    :cond_c
    :goto_11
    new-instance v2, Ljava/io/File;

    .line 350
    .line 351
    invoke-direct {v2, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    invoke-static {v2}, Ll/gxg0;->a(Ljava/io/File;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    sget-object v7, Ll/wog0;->a:Ll/vug0;

    .line 359
    .line 360
    iget-object v8, v7, Ll/vug0;->a:Ljava/util/HashMap;

    .line 361
    .line 362
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 363
    .line 364
    .line 365
    move-result-object v9

    .line 366
    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v8

    .line 370
    check-cast v8, Ll/plg0;

    .line 371
    .line 372
    if-nez v8, :cond_d

    .line 373
    .line 374
    new-instance v8, Ll/plg0;

    .line 375
    .line 376
    invoke-direct {v8}, Ll/plg0;-><init>()V

    .line 377
    .line 378
    .line 379
    iput-boolean v3, v8, Ll/plg0;->a:Z

    .line 380
    .line 381
    iput-boolean v6, v8, Ll/plg0;->b:Z

    .line 382
    .line 383
    iget-object v6, v7, Ll/vug0;->a:Ljava/util/HashMap;

    .line 384
    .line 385
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 386
    .line 387
    .line 388
    move-result-object v7

    .line 389
    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    goto :goto_12

    .line 393
    :cond_d
    iput-boolean v3, v8, Ll/plg0;->a:Z

    .line 394
    .line 395
    iput-boolean v6, v8, Ll/plg0;->b:Z

    .line 396
    .line 397
    :goto_12
    iget-object v6, p0, Ll/vog0;->b:Ll/olg0;

    .line 398
    .line 399
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v7

    .line 403
    new-instance v8, Ljava/lang/StringBuilder;

    .line 404
    .line 405
    const-string v9, "ut_embbed_"

    .line 406
    .line 407
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v7

    .line 417
    iget-object v6, v6, Ll/olg0;->a:Landroid/content/SharedPreferences;

    .line 418
    .line 419
    invoke-interface {v6, v7, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-static {v0}, Ll/rlg0;->b(Ljava/lang/String;)Ll/psg0;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    new-instance v6, Ljava/lang/StringBuilder;

    .line 428
    .line 429
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 430
    .line 431
    .line 432
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v4

    .line 442
    if-eqz v0, :cond_11

    .line 443
    .line 444
    iget-object v6, v0, Ll/psg0;->b:Ljava/lang/String;

    .line 445
    .line 446
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 447
    .line 448
    .line 449
    move-result v6

    .line 450
    if-eqz v6, :cond_e

    .line 451
    .line 452
    goto :goto_13

    .line 453
    :cond_e
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 454
    .line 455
    .line 456
    move-result v6

    .line 457
    if-eqz v6, :cond_f

    .line 458
    .line 459
    goto :goto_13

    .line 460
    :cond_f
    iget-object v6, v0, Ll/psg0;->b:Ljava/lang/String;

    .line 461
    .line 462
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result v6

    .line 466
    if-nez v6, :cond_10

    .line 467
    .line 468
    goto :goto_13

    .line 469
    :cond_10
    sget-object v6, Ll/ing0;->a:Ljava/lang/String;

    .line 470
    .line 471
    new-instance v6, Ljava/io/File;

    .line 472
    .line 473
    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 477
    .line 478
    .line 479
    move-result v4

    .line 480
    if-nez v4, :cond_14

    .line 481
    .line 482
    :cond_11
    :goto_13
    invoke-static {p3, v1}, Ll/osg0;->l(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;

    .line 483
    .line 484
    .line 485
    move-result-object p3

    .line 486
    iget p3, p3, Ll/vgg0;->a:I

    .line 487
    .line 488
    if-nez p3, :cond_13

    .line 489
    .line 490
    if-nez v0, :cond_12

    .line 491
    .line 492
    new-instance v0, Ll/psg0;

    .line 493
    .line 494
    invoke-direct {v0}, Ll/psg0;-><init>()V

    .line 495
    .line 496
    .line 497
    :cond_12
    iput-wide p1, v0, Ll/psg0;->a:J

    .line 498
    .line 499
    iput-object v2, v0, Ll/psg0;->b:Ljava/lang/String;

    .line 500
    .line 501
    iget-object p0, p0, Ll/vog0;->b:Ll/olg0;

    .line 502
    .line 503
    invoke-virtual {p0, v0}, Ll/olg0;->f(Ll/psg0;)V

    .line 504
    .line 505
    .line 506
    goto :goto_14

    .line 507
    :cond_13
    move v5, v3

    .line 508
    :cond_14
    :goto_14
    new-instance p0, Ll/iqg0;

    .line 509
    .line 510
    invoke-direct {p0, v5, p4, v1}, Ll/iqg0;-><init>(ZLl/uog0;Ljava/lang/String;)V

    .line 511
    .line 512
    .line 513
    invoke-static {p0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 514
    .line 515
    .line 516
    return-void
.end method

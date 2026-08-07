.class public final Ll/hsg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ll/pug0;

.field public b:Ljava/io/File;

.field public c:Ljava/io/File;


# direct methods
.method public constructor <init>(Ll/pug0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hsg0;->a:Ll/pug0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, ""

    .line 4
    .line 5
    const-string v3, "zipFile2 error:"

    .line 6
    .line 7
    const-string v4, "ReportCLogTask"

    .line 8
    .line 9
    const-string v0, "logcat -d --pid="

    .line 10
    .line 11
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {v5}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    new-instance v6, Ljava/io/File;

    .line 20
    .line 21
    const-string v7, "sud/mgp/clog"

    .line 22
    .line 23
    invoke-direct {v6, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object v6, v1, Ll/hsg0;->b:Ljava/io/File;

    .line 27
    .line 28
    new-instance v6, Ljava/io/File;

    .line 29
    .line 30
    const-string v7, "sud/mgp/clogtemp"

    .line 31
    .line 32
    invoke-direct {v6, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-object v6, v1, Ll/hsg0;->c:Ljava/io/File;

    .line 36
    .line 37
    new-instance v5, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    sget-object v6, Ll/utg0;->e:Ll/i0h0;

    .line 43
    .line 44
    const-wide/32 v7, 0x200000

    .line 45
    .line 46
    .line 47
    if-eqz v6, :cond_0

    .line 48
    .line 49
    iget-object v6, v6, Ll/i0h0;->c:Ll/gvg0;

    .line 50
    .line 51
    if-eqz v6, :cond_0

    .line 52
    .line 53
    iget-object v6, v6, Ll/gvg0;->l:Ll/rng0;

    .line 54
    .line 55
    if-eqz v6, :cond_0

    .line 56
    .line 57
    iget-wide v9, v6, Ll/rng0;->b:J

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move-wide v9, v7

    .line 61
    :goto_0
    const-wide/16 v11, 0x0

    .line 62
    .line 63
    cmp-long v6, v9, v11

    .line 64
    .line 65
    if-gtz v6, :cond_1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const-wide/32 v7, 0x1400000

    .line 69
    .line 70
    .line 71
    cmp-long v6, v9, v7

    .line 72
    .line 73
    if-lez v6, :cond_2

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    move-wide v7, v9

    .line 77
    :goto_1
    const/4 v6, 0x0

    .line 78
    :try_start_0
    iget-object v10, v1, Ll/hsg0;->a:Ll/pug0;

    .line 79
    .line 80
    iget-boolean v10, v10, Ll/pug0;->d:Z

    .line 81
    .line 82
    if-eqz v10, :cond_3

    .line 83
    .line 84
    const-string v0, "logcat -d"

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :catchall_0
    move-exception v0

    .line 88
    const/4 v9, 0x0

    .line 89
    goto/16 :goto_23

    .line 90
    .line 91
    :catch_0
    move-exception v0

    .line 92
    goto/16 :goto_8

    .line 93
    .line 94
    :cond_3
    new-instance v10, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 100
    .line 101
    .line 102
    move-result v13

    .line 103
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v10

    .line 113
    invoke-virtual {v0, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    :goto_2
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 118
    .line 119
    .line 120
    move-result-object v10

    .line 121
    invoke-virtual {v10, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v10, Ljava/io/BufferedReader;

    .line 126
    .line 127
    new-instance v13, Ljava/io/InputStreamReader;

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-direct {v13, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 134
    .line 135
    .line 136
    invoke-direct {v10, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .line 138
    .line 139
    move-wide v13, v11

    .line 140
    move-wide v15, v13

    .line 141
    :goto_3
    const-wide/32 v17, 0x7a120

    .line 142
    .line 143
    .line 144
    cmp-long v0, v13, v17

    .line 145
    .line 146
    if-gez v0, :cond_5

    .line 147
    .line 148
    :try_start_1
    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    if-eqz v0, :cond_5

    .line 153
    .line 154
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 158
    .line 159
    .line 160
    move-result v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 161
    move-object/from16 v18, v10

    .line 162
    .line 163
    int-to-long v9, v0

    .line 164
    add-long/2addr v15, v9

    .line 165
    const-wide/16 v9, 0x1

    .line 166
    .line 167
    add-long/2addr v13, v9

    .line 168
    :goto_4
    cmp-long v0, v15, v7

    .line 169
    .line 170
    if-lez v0, :cond_4

    .line 171
    .line 172
    :try_start_2
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-lez v0, :cond_4

    .line 177
    .line 178
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 185
    .line 186
    .line 187
    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 188
    int-to-long v9, v0

    .line 189
    sub-long/2addr v15, v9

    .line 190
    goto :goto_4

    .line 191
    :catchall_1
    move-exception v0

    .line 192
    goto :goto_5

    .line 193
    :catch_1
    move-exception v0

    .line 194
    goto :goto_6

    .line 195
    :cond_4
    move-object/from16 v10, v18

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :catchall_2
    move-exception v0

    .line 199
    move-object/from16 v18, v10

    .line 200
    .line 201
    goto :goto_5

    .line 202
    :catch_2
    move-exception v0

    .line 203
    move-object/from16 v18, v10

    .line 204
    .line 205
    goto :goto_6

    .line 206
    :cond_5
    move-object/from16 v18, v10

    .line 207
    .line 208
    goto :goto_7

    .line 209
    :goto_5
    move-object/from16 v10, v18

    .line 210
    .line 211
    goto/16 :goto_24

    .line 212
    .line 213
    :goto_6
    move-object/from16 v10, v18

    .line 214
    .line 215
    goto :goto_9

    .line 216
    :goto_7
    invoke-static/range {v18 .. v18}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 217
    .line 218
    .line 219
    goto :goto_a

    .line 220
    :goto_8
    const/4 v10, 0x0

    .line 221
    :goto_9
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 222
    .line 223
    .line 224
    new-instance v7, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    const-string v8, "getCLog error:"

    .line 230
    .line 231
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_8

    .line 246
    .line 247
    .line 248
    invoke-static {v10}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 249
    .line 250
    .line 251
    :goto_a
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 252
    .line 253
    .line 254
    move-result v0

    .line 255
    const-string v7, "TechSudMGPCLog.sp"

    .line 256
    .line 257
    if-nez v0, :cond_6

    .line 258
    .line 259
    goto/16 :goto_18

    .line 260
    .line 261
    :cond_6
    iget-object v0, v1, Ll/hsg0;->c:Ljava/io/File;

    .line 262
    .line 263
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    iget-object v8, v1, Ll/hsg0;->c:Ljava/io/File;

    .line 268
    .line 269
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 270
    .line 271
    .line 272
    move-result v8

    .line 273
    if-eqz v8, :cond_7

    .line 274
    .line 275
    invoke-static {v0}, Ll/ofg0;->c(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    goto :goto_b

    .line 279
    :cond_7
    invoke-static {v0}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 280
    .line 281
    .line 282
    :goto_b
    new-instance v8, Ljava/io/File;

    .line 283
    .line 284
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 285
    .line 286
    .line 287
    move-result-object v9

    .line 288
    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v9

    .line 292
    invoke-static {v9}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v9

    .line 296
    invoke-direct {v8, v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    :try_start_4
    new-instance v9, Ljava/io/BufferedWriter;

    .line 300
    .line 301
    new-instance v0, Ljava/io/FileWriter;

    .line 302
    .line 303
    invoke-direct {v0, v8}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 304
    .line 305
    .line 306
    invoke-direct {v9, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 307
    .line 308
    .line 309
    move v0, v6

    .line 310
    :goto_c
    :try_start_5
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 311
    .line 312
    .line 313
    move-result v10

    .line 314
    if-ge v0, v10, :cond_9

    .line 315
    .line 316
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v10

    .line 320
    check-cast v10, Ljava/lang/String;

    .line 321
    .line 322
    if-lez v0, :cond_8

    .line 323
    .line 324
    invoke-virtual {v9}, Ljava/io/BufferedWriter;->newLine()V

    .line 325
    .line 326
    .line 327
    goto :goto_d

    .line 328
    :catchall_3
    move-exception v0

    .line 329
    goto/16 :goto_22

    .line 330
    .line 331
    :catch_3
    move-exception v0

    .line 332
    goto :goto_e

    .line 333
    :cond_8
    :goto_d
    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 334
    .line 335
    .line 336
    add-int/lit8 v0, v0, 0x1

    .line 337
    .line 338
    goto :goto_c

    .line 339
    :cond_9
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 340
    .line 341
    .line 342
    goto :goto_f

    .line 343
    :catchall_4
    move-exception v0

    .line 344
    const/4 v9, 0x0

    .line 345
    goto/16 :goto_22

    .line 346
    .line 347
    :catch_4
    move-exception v0

    .line 348
    const/4 v9, 0x0

    .line 349
    :goto_e
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 350
    .line 351
    .line 352
    new-instance v5, Ljava/lang/StringBuilder;

    .line 353
    .line 354
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 355
    .line 356
    .line 357
    const-string v8, "writeLogToTempPath error:"

    .line 358
    .line 359
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 374
    .line 375
    .line 376
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 377
    .line 378
    .line 379
    const/4 v8, 0x0

    .line 380
    :goto_f
    if-nez v8, :cond_a

    .line 381
    .line 382
    goto/16 :goto_18

    .line 383
    .line 384
    :cond_a
    new-instance v5, Ljava/io/File;

    .line 385
    .line 386
    iget-object v0, v1, Ll/hsg0;->c:Ljava/io/File;

    .line 387
    .line 388
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 389
    .line 390
    .line 391
    move-result-object v9

    .line 392
    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v9

    .line 396
    invoke-static {v9}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v9

    .line 400
    invoke-direct {v5, v0, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    :try_start_7
    new-instance v9, Ljava/io/FileInputStream;

    .line 404
    .line 405
    invoke-direct {v9, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_8
    .catchall {:try_start_7 .. :try_end_7} :catchall_7

    .line 406
    .line 407
    .line 408
    :try_start_8
    new-instance v0, Ljava/io/FileOutputStream;

    .line 409
    .line 410
    invoke-direct {v0, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 411
    .line 412
    .line 413
    new-instance v10, Ljava/util/zip/ZipOutputStream;

    .line 414
    .line 415
    invoke-direct {v10, v0}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    .line 416
    .line 417
    .line 418
    :try_start_9
    new-instance v0, Ljava/util/zip/ZipEntry;

    .line 419
    .line 420
    iget-object v13, v1, Ll/hsg0;->a:Ll/pug0;

    .line 421
    .line 422
    iget-object v13, v13, Ll/pug0;->c:Ljava/lang/String;

    .line 423
    .line 424
    invoke-direct {v0, v13}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 425
    .line 426
    .line 427
    invoke-virtual {v10, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 428
    .line 429
    .line 430
    const/16 v0, 0x400

    .line 431
    .line 432
    new-array v0, v0, [B

    .line 433
    .line 434
    :goto_10
    invoke-virtual {v9, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 435
    .line 436
    .line 437
    move-result v13

    .line 438
    if-lez v13, :cond_b

    .line 439
    .line 440
    invoke-virtual {v10, v0, v6, v13}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 441
    .line 442
    .line 443
    goto :goto_10

    .line 444
    :cond_b
    :try_start_a
    invoke-virtual {v10}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    .line 445
    .line 446
    .line 447
    goto :goto_11

    .line 448
    :catch_5
    move-exception v0

    .line 449
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 450
    .line 451
    .line 452
    new-instance v13, Ljava/lang/StringBuilder;

    .line 453
    .line 454
    invoke-direct {v13, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 469
    .line 470
    .line 471
    :goto_11
    invoke-static {v10}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 472
    .line 473
    .line 474
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 475
    .line 476
    .line 477
    goto :goto_17

    .line 478
    :catchall_5
    move-exception v0

    .line 479
    goto :goto_12

    .line 480
    :catch_6
    move-exception v0

    .line 481
    goto :goto_15

    .line 482
    :goto_12
    move-object v1, v0

    .line 483
    move-object v2, v9

    .line 484
    move-object v9, v10

    .line 485
    goto/16 :goto_20

    .line 486
    .line 487
    :catchall_6
    move-exception v0

    .line 488
    goto :goto_13

    .line 489
    :catch_7
    move-exception v0

    .line 490
    goto :goto_14

    .line 491
    :goto_13
    move-object v1, v0

    .line 492
    move-object v2, v9

    .line 493
    const/4 v9, 0x0

    .line 494
    goto/16 :goto_20

    .line 495
    .line 496
    :goto_14
    const/4 v10, 0x0

    .line 497
    goto :goto_15

    .line 498
    :catchall_7
    move-exception v0

    .line 499
    const/4 v9, 0x0

    .line 500
    const/4 v10, 0x0

    .line 501
    goto :goto_12

    .line 502
    :catch_8
    move-exception v0

    .line 503
    const/4 v9, 0x0

    .line 504
    goto :goto_14

    .line 505
    :goto_15
    :try_start_b
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 506
    .line 507
    .line 508
    new-instance v5, Ljava/lang/StringBuilder;

    .line 509
    .line 510
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 511
    .line 512
    .line 513
    const-string v13, "zipFile1 error:"

    .line 514
    .line 515
    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    .line 517
    .line 518
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 523
    .line 524
    .line 525
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 530
    .line 531
    .line 532
    if-eqz v10, :cond_c

    .line 533
    .line 534
    :try_start_c
    invoke-virtual {v10}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_9

    .line 535
    .line 536
    .line 537
    goto :goto_16

    .line 538
    :catch_9
    move-exception v0

    .line 539
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 540
    .line 541
    .line 542
    new-instance v5, Ljava/lang/StringBuilder;

    .line 543
    .line 544
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 545
    .line 546
    .line 547
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    .line 553
    .line 554
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 559
    .line 560
    .line 561
    :cond_c
    :goto_16
    invoke-static {v10}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 562
    .line 563
    .line 564
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 565
    .line 566
    .line 567
    const/4 v5, 0x0

    .line 568
    :goto_17
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 569
    .line 570
    .line 571
    if-nez v5, :cond_d

    .line 572
    .line 573
    goto :goto_18

    .line 574
    :cond_d
    new-instance v0, Ljava/io/File;

    .line 575
    .line 576
    iget-object v3, v1, Ll/hsg0;->c:Ljava/io/File;

    .line 577
    .line 578
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 579
    .line 580
    .line 581
    move-result-object v4

    .line 582
    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v4

    .line 586
    invoke-static {v4}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v4

    .line 590
    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    invoke-static {v5, v0}, Ll/ywg0;->a(Ljava/io/File;Ljava/io/File;)Ljava/io/File;

    .line 594
    .line 595
    .line 596
    move-result-object v0

    .line 597
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 598
    .line 599
    .line 600
    if-nez v0, :cond_e

    .line 601
    .line 602
    :goto_18
    const/4 v4, 0x0

    .line 603
    goto/16 :goto_1d

    .line 604
    .line 605
    :cond_e
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 606
    .line 607
    .line 608
    move-result-wide v3

    .line 609
    iget-object v5, v1, Ll/hsg0;->b:Ljava/io/File;

    .line 610
    .line 611
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 612
    .line 613
    .line 614
    move-result-object v5

    .line 615
    if-eqz v5, :cond_12

    .line 616
    .line 617
    array-length v8, v5

    .line 618
    if-nez v8, :cond_f

    .line 619
    .line 620
    goto :goto_1b

    .line 621
    :cond_f
    array-length v8, v5

    .line 622
    move v9, v6

    .line 623
    :goto_19
    if-ge v9, v8, :cond_10

    .line 624
    .line 625
    aget-object v10, v5, v9

    .line 626
    .line 627
    invoke-virtual {v10}, Ljava/io/File;->length()J

    .line 628
    .line 629
    .line 630
    move-result-wide v13

    .line 631
    add-long/2addr v3, v13

    .line 632
    add-int/lit8 v9, v9, 0x1

    .line 633
    .line 634
    goto :goto_19

    .line 635
    :cond_10
    const-wide/32 v8, 0xa00000

    .line 636
    .line 637
    .line 638
    cmp-long v10, v3, v8

    .line 639
    .line 640
    if-gez v10, :cond_11

    .line 641
    .line 642
    goto :goto_1b

    .line 643
    :cond_11
    new-instance v10, Ljava/util/ArrayList;

    .line 644
    .line 645
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 646
    .line 647
    .line 648
    move-result-object v5

    .line 649
    invoke-direct {v10, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 650
    .line 651
    .line 652
    new-instance v5, Ll/clg0;

    .line 653
    .line 654
    invoke-direct {v5}, Ll/clg0;-><init>()V

    .line 655
    .line 656
    .line 657
    invoke-static {v10, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 658
    .line 659
    .line 660
    :goto_1a
    cmp-long v5, v3, v8

    .line 661
    .line 662
    if-ltz v5, :cond_12

    .line 663
    .line 664
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 665
    .line 666
    .line 667
    move-result v5

    .line 668
    if-lez v5, :cond_12

    .line 669
    .line 670
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 671
    .line 672
    .line 673
    move-result-object v5

    .line 674
    check-cast v5, Ljava/io/File;

    .line 675
    .line 676
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object v13

    .line 680
    invoke-virtual {v5}, Ljava/io/File;->length()J

    .line 681
    .line 682
    .line 683
    move-result-wide v14

    .line 684
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 685
    .line 686
    .line 687
    move-result v5

    .line 688
    if-eqz v5, :cond_12

    .line 689
    .line 690
    invoke-static {v7}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 691
    .line 692
    .line 693
    move-result-object v5

    .line 694
    invoke-virtual {v5, v13}, Ll/kjg0;->d(Ljava/lang/String;)V

    .line 695
    .line 696
    .line 697
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    sub-long/2addr v3, v14

    .line 701
    goto :goto_1a

    .line 702
    :cond_12
    :goto_1b
    new-instance v3, Ljava/io/File;

    .line 703
    .line 704
    iget-object v4, v1, Ll/hsg0;->b:Ljava/io/File;

    .line 705
    .line 706
    iget-object v5, v1, Ll/hsg0;->a:Ll/pug0;

    .line 707
    .line 708
    iget-object v5, v5, Ll/pug0;->c:Ljava/lang/String;

    .line 709
    .line 710
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 711
    .line 712
    .line 713
    iget-object v4, v1, Ll/hsg0;->b:Ljava/io/File;

    .line 714
    .line 715
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 716
    .line 717
    .line 718
    move-result-object v4

    .line 719
    invoke-static {v4}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 720
    .line 721
    .line 722
    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 723
    .line 724
    .line 725
    move-result v4

    .line 726
    if-nez v4, :cond_13

    .line 727
    .line 728
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 729
    .line 730
    .line 731
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 732
    .line 733
    .line 734
    goto/16 :goto_18

    .line 735
    .line 736
    :cond_13
    new-instance v4, Ll/oog0;

    .line 737
    .line 738
    invoke-direct {v4}, Ll/oog0;-><init>()V

    .line 739
    .line 740
    .line 741
    iget-object v0, v1, Ll/hsg0;->a:Ll/pug0;

    .line 742
    .line 743
    iget-object v5, v0, Ll/pug0;->c:Ljava/lang/String;

    .line 744
    .line 745
    iput-object v5, v4, Ll/oog0;->c:Ljava/lang/String;

    .line 746
    .line 747
    iget-wide v8, v0, Ll/pug0;->b:J

    .line 748
    .line 749
    iput-wide v8, v4, Ll/oog0;->b:J

    .line 750
    .line 751
    iget-object v0, v0, Ll/pug0;->a:Ljava/lang/String;

    .line 752
    .line 753
    iput-object v0, v4, Ll/oog0;->a:Ljava/lang/String;

    .line 754
    .line 755
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v0

    .line 759
    iput-object v0, v4, Ll/oog0;->d:Ljava/lang/String;

    .line 760
    .line 761
    invoke-static {v7}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 762
    .line 763
    .line 764
    move-result-object v3

    .line 765
    iget-object v5, v4, Ll/oog0;->c:Ljava/lang/String;

    .line 766
    .line 767
    new-instance v8, Lorg/json/JSONObject;

    .line 768
    .line 769
    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 770
    .line 771
    .line 772
    :try_start_d
    const-string v0, "appId"

    .line 773
    .line 774
    iget-object v9, v4, Ll/oog0;->a:Ljava/lang/String;

    .line 775
    .line 776
    invoke-virtual {v8, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 777
    .line 778
    .line 779
    const-string v0, "mgId"

    .line 780
    .line 781
    iget-wide v9, v4, Ll/oog0;->b:J

    .line 782
    .line 783
    invoke-virtual {v8, v0, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 784
    .line 785
    .line 786
    const-string v0, "requestId"

    .line 787
    .line 788
    iget-object v9, v4, Ll/oog0;->c:Ljava/lang/String;

    .line 789
    .line 790
    invoke-virtual {v8, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 791
    .line 792
    .line 793
    const-string v0, "filePath"

    .line 794
    .line 795
    iget-object v9, v4, Ll/oog0;->d:Ljava/lang/String;

    .line 796
    .line 797
    invoke-virtual {v8, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_a

    .line 798
    .line 799
    .line 800
    goto :goto_1c

    .line 801
    :catch_a
    move-exception v0

    .line 802
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 803
    .line 804
    .line 805
    :goto_1c
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 806
    .line 807
    .line 808
    move-result-object v0

    .line 809
    invoke-virtual {v3, v5, v0, v6}, Ll/kjg0;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 810
    .line 811
    .line 812
    :goto_1d
    if-nez v4, :cond_14

    .line 813
    .line 814
    goto :goto_1f

    .line 815
    :cond_14
    iget-object v0, v4, Ll/oog0;->d:Ljava/lang/String;

    .line 816
    .line 817
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 818
    .line 819
    .line 820
    move-result v3

    .line 821
    if-nez v3, :cond_19

    .line 822
    .line 823
    new-instance v3, Ljava/io/File;

    .line 824
    .line 825
    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 826
    .line 827
    .line 828
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 829
    .line 830
    .line 831
    move-result v0

    .line 832
    if-eqz v0, :cond_19

    .line 833
    .line 834
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 835
    .line 836
    .line 837
    move-result-wide v5

    .line 838
    cmp-long v0, v5, v11

    .line 839
    .line 840
    if-gtz v0, :cond_15

    .line 841
    .line 842
    goto :goto_1f

    .line 843
    :cond_15
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 844
    .line 845
    if-eqz v0, :cond_16

    .line 846
    .line 847
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 848
    .line 849
    if-eqz v0, :cond_16

    .line 850
    .line 851
    iget-object v0, v0, Ll/gvg0;->d:Ll/rhg0;

    .line 852
    .line 853
    if-eqz v0, :cond_16

    .line 854
    .line 855
    iget-object v9, v0, Ll/rhg0;->e:Ljava/lang/String;

    .line 856
    .line 857
    goto :goto_1e

    .line 858
    :cond_16
    const/4 v9, 0x0

    .line 859
    :goto_1e
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 860
    .line 861
    .line 862
    move-result v0

    .line 863
    if-eqz v0, :cond_17

    .line 864
    .line 865
    goto :goto_1f

    .line 866
    :cond_17
    iget-object v0, v4, Ll/oog0;->c:Ljava/lang/String;

    .line 867
    .line 868
    iget-object v5, v4, Ll/oog0;->a:Ljava/lang/String;

    .line 869
    .line 870
    new-instance v6, Ljava/lang/StringBuilder;

    .line 871
    .line 872
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 873
    .line 874
    .line 875
    iget-wide v10, v4, Ll/oog0;->b:J

    .line 876
    .line 877
    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 878
    .line 879
    .line 880
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 881
    .line 882
    .line 883
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 884
    .line 885
    .line 886
    move-result-object v2

    .line 887
    invoke-static {v9, v0, v3, v5, v2}, Ll/ywg0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z

    .line 888
    .line 889
    .line 890
    move-result v2

    .line 891
    if-eqz v2, :cond_18

    .line 892
    .line 893
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 894
    .line 895
    .line 896
    invoke-static {v7}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 897
    .line 898
    .line 899
    move-result-object v2

    .line 900
    invoke-virtual {v2, v0}, Ll/kjg0;->d(Ljava/lang/String;)V

    .line 901
    .line 902
    .line 903
    goto :goto_1f

    .line 904
    :cond_18
    const/4 v0, 0x1

    .line 905
    sput-boolean v0, Ll/ywg0;->a:Z

    .line 906
    .line 907
    :cond_19
    :goto_1f
    iget-object v0, v1, Ll/hsg0;->b:Ljava/io/File;

    .line 908
    .line 909
    invoke-static {v0}, Ll/ywg0;->b(Ljava/io/File;)V

    .line 910
    .line 911
    .line 912
    return-void

    .line 913
    :goto_20
    if-eqz v9, :cond_1a

    .line 914
    .line 915
    :try_start_e
    invoke-virtual {v9}, Ljava/util/zip/ZipOutputStream;->closeEntry()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_b

    .line 916
    .line 917
    .line 918
    goto :goto_21

    .line 919
    :catch_b
    move-exception v0

    .line 920
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 921
    .line 922
    .line 923
    new-instance v5, Ljava/lang/StringBuilder;

    .line 924
    .line 925
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 926
    .line 927
    .line 928
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 929
    .line 930
    .line 931
    move-result-object v0

    .line 932
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 933
    .line 934
    .line 935
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 936
    .line 937
    .line 938
    move-result-object v0

    .line 939
    invoke-static {v4, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 940
    .line 941
    .line 942
    :cond_1a
    :goto_21
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 943
    .line 944
    .line 945
    invoke-static {v2}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 946
    .line 947
    .line 948
    throw v1

    .line 949
    :goto_22
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 950
    .line 951
    .line 952
    throw v0

    .line 953
    :catchall_8
    move-exception v0

    .line 954
    move-object v9, v10

    .line 955
    :goto_23
    move-object v10, v9

    .line 956
    :goto_24
    invoke-static {v10}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 957
    .line 958
    .line 959
    throw v0
.end method

.method public final run()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/hsg0;->a:Ll/pug0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/pug0;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, v0, Ll/pug0;->c:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/hsg0;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "ReportConsoleLogTask error:"

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "ReportCLogTask"

    .line 48
    .line 49
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

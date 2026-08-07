.class public final Ll/pzg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Ll/vwg0;

.field public b:Ljava/io/File;

.field public c:Ljava/io/File;


# direct methods
.method public constructor <init>(Ll/vwg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pzg0;->a:Ll/vwg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "logcat -d --pid="

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "startReport logId\uff1a"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v3, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 13
    .line 14
    iget-object v3, v3, Ll/vwg0;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v3, " uploadType:"

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v3, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 25
    .line 26
    iget v3, v3, Ll/vwg0;->e:I

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "ReportSdkLogTask"

    .line 36
    .line 37
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 41
    .line 42
    iget v2, v2, Ll/vwg0;->e:I

    .line 43
    .line 44
    const-string v4, "key_upload_anr_log_id_completed"

    .line 45
    .line 46
    const-string v5, "key_uploaded_log_id"

    .line 47
    .line 48
    const/4 v6, 0x1

    .line 49
    const-string v7, ""

    .line 50
    .line 51
    const-string v8, "TechSudMGPGlobal.sp"

    .line 52
    .line 53
    if-nez v2, :cond_0

    .line 54
    .line 55
    invoke-static {v8}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v2, v2, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 60
    .line 61
    invoke-interface {v2, v5, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    if-ne v2, v6, :cond_19

    .line 67
    .line 68
    invoke-static {v8}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v2, v2, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 73
    .line 74
    invoke-interface {v2, v4, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    :goto_0
    iget-object v9, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 79
    .line 80
    iget-object v9, v9, Ll/vwg0;->c:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    iget-object v9, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 87
    .line 88
    if-eqz v2, :cond_1

    .line 89
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v1, "\u5f53\u524dlogId\u5df2\u4e0a\u62a5\u5b8c\u6210\uff0c\u4e0d\u518d\u91cd\u590d\u4e0a\u62a5\uff1a"

    .line 93
    .line 94
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, v9, Ll/vwg0;->c:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_1
    iget v2, v9, Ll/vwg0;->e:I

    .line 111
    .line 112
    if-ne v2, v6, :cond_2

    .line 113
    .line 114
    const-wide/16 v9, 0x2710

    .line 115
    .line 116
    invoke-static {v9, v10}, Landroid/os/SystemClock;->sleep(J)V

    .line 117
    .line 118
    .line 119
    :cond_2
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    new-instance v9, Ljava/io/File;

    .line 128
    .line 129
    const-string v10, "sud/mgp/rplogtemp"

    .line 130
    .line 131
    invoke-direct {v9, v2, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iput-object v9, v1, Ll/pzg0;->b:Ljava/io/File;

    .line 135
    .line 136
    new-instance v9, Ljava/io/File;

    .line 137
    .line 138
    const-string v10, "sud/mgp/rplogtempzip"

    .line 139
    .line 140
    invoke-direct {v9, v2, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iput-object v9, v1, Ll/pzg0;->c:Ljava/io/File;

    .line 144
    .line 145
    iget-object v2, v1, Ll/pzg0;->b:Ljava/io/File;

    .line 146
    .line 147
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v9

    .line 151
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-eqz v2, :cond_3

    .line 156
    .line 157
    invoke-static {v9}, Ll/ofg0;->c(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_3
    invoke-static {v9}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    :goto_1
    new-instance v2, Ljava/util/ArrayList;

    .line 165
    .line 166
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 167
    .line 168
    .line 169
    sget-object v9, Ll/utg0;->e:Ll/i0h0;

    .line 170
    .line 171
    const-wide/32 v10, 0x200000

    .line 172
    .line 173
    .line 174
    if-eqz v9, :cond_4

    .line 175
    .line 176
    iget-object v9, v9, Ll/i0h0;->c:Ll/gvg0;

    .line 177
    .line 178
    if-eqz v9, :cond_4

    .line 179
    .line 180
    iget-object v9, v9, Ll/gvg0;->l:Ll/rng0;

    .line 181
    .line 182
    if-eqz v9, :cond_4

    .line 183
    .line 184
    iget-wide v12, v9, Ll/rng0;->b:J

    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_4
    move-wide v12, v10

    .line 188
    :goto_2
    const-wide/16 v14, 0x0

    .line 189
    .line 190
    cmp-long v9, v12, v14

    .line 191
    .line 192
    if-gtz v9, :cond_5

    .line 193
    .line 194
    goto :goto_3

    .line 195
    :cond_5
    const-wide/32 v10, 0x1400000

    .line 196
    .line 197
    .line 198
    cmp-long v9, v12, v10

    .line 199
    .line 200
    if-lez v9, :cond_6

    .line 201
    .line 202
    goto :goto_3

    .line 203
    :cond_6
    move-wide v10, v12

    .line 204
    :goto_3
    const/4 v12, 0x0

    .line 205
    :try_start_0
    iget-object v13, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 206
    .line 207
    iget-boolean v13, v13, Ll/vwg0;->d:Z

    .line 208
    .line 209
    if-eqz v13, :cond_7

    .line 210
    .line 211
    const-string v0, "logcat -d"

    .line 212
    .line 213
    goto :goto_4

    .line 214
    :catchall_0
    move-exception v0

    .line 215
    const/4 v9, 0x0

    .line 216
    goto/16 :goto_16

    .line 217
    .line 218
    :catch_0
    move-exception v0

    .line 219
    move-wide/from16 v21, v14

    .line 220
    .line 221
    goto/16 :goto_7

    .line 222
    .line 223
    :cond_7
    new-instance v13, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    .line 227
    .line 228
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 229
    .line 230
    .line 231
    move-result v9

    .line 232
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    invoke-virtual {v0, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    :goto_4
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 247
    .line 248
    .line 249
    move-result-object v9

    .line 250
    invoke-virtual {v9, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    new-instance v9, Ljava/io/BufferedReader;

    .line 255
    .line 256
    new-instance v13, Ljava/io/InputStreamReader;

    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-direct {v13, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 263
    .line 264
    .line 265
    invoke-direct {v9, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 266
    .line 267
    .line 268
    move-wide/from16 v17, v14

    .line 269
    .line 270
    move-wide/from16 v19, v17

    .line 271
    .line 272
    :goto_5
    const-wide/32 v21, 0x7a120

    .line 273
    .line 274
    .line 275
    cmp-long v0, v17, v21

    .line 276
    .line 277
    if-gez v0, :cond_9

    .line 278
    .line 279
    :try_start_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    if-eqz v0, :cond_9

    .line 284
    .line 285
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 289
    .line 290
    .line 291
    move-result v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 292
    move-wide/from16 v21, v14

    .line 293
    .line 294
    int-to-long v14, v0

    .line 295
    add-long v19, v19, v14

    .line 296
    .line 297
    const-wide/16 v13, 0x1

    .line 298
    .line 299
    add-long v17, v17, v13

    .line 300
    .line 301
    :goto_6
    cmp-long v0, v19, v10

    .line 302
    .line 303
    if-lez v0, :cond_8

    .line 304
    .line 305
    :try_start_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-lez v0, :cond_8

    .line 310
    .line 311
    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 318
    .line 319
    .line 320
    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 321
    int-to-long v13, v0

    .line 322
    sub-long v19, v19, v13

    .line 323
    .line 324
    goto :goto_6

    .line 325
    :catchall_1
    move-exception v0

    .line 326
    goto/16 :goto_16

    .line 327
    .line 328
    :catch_1
    move-exception v0

    .line 329
    goto :goto_8

    .line 330
    :cond_8
    move-wide/from16 v14, v21

    .line 331
    .line 332
    goto :goto_5

    .line 333
    :catch_2
    move-exception v0

    .line 334
    move-wide/from16 v21, v14

    .line 335
    .line 336
    goto :goto_8

    .line 337
    :cond_9
    move-wide/from16 v21, v14

    .line 338
    .line 339
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 340
    .line 341
    .line 342
    goto :goto_9

    .line 343
    :goto_7
    const/4 v9, 0x0

    .line 344
    :goto_8
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 345
    .line 346
    .line 347
    new-instance v10, Ljava/lang/StringBuilder;

    .line 348
    .line 349
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 350
    .line 351
    .line 352
    const-string v11, "getCLog error:"

    .line 353
    .line 354
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 369
    .line 370
    .line 371
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 372
    .line 373
    .line 374
    :goto_9
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    if-nez v0, :cond_a

    .line 379
    .line 380
    goto/16 :goto_d

    .line 381
    .line 382
    :cond_a
    iget-object v0, v1, Ll/pzg0;->b:Ljava/io/File;

    .line 383
    .line 384
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    new-instance v9, Ljava/text/SimpleDateFormat;

    .line 389
    .line 390
    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 391
    .line 392
    const-string v11, "yyyy_MM_dd"

    .line 393
    .line 394
    invoke-direct {v9, v11, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 395
    .line 396
    .line 397
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 398
    .line 399
    .line 400
    move-result-wide v10

    .line 401
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 402
    .line 403
    .line 404
    move-result-object v10

    .line 405
    invoke-virtual {v9, v10}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v9

    .line 409
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 410
    .line 411
    .line 412
    move-result-object v10

    .line 413
    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v10

    .line 417
    new-instance v11, Ljava/lang/StringBuilder;

    .line 418
    .line 419
    const-string v13, "Sud_"

    .line 420
    .line 421
    invoke-direct {v11, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v10, "_"

    .line 428
    .line 429
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    const-string v9, "_console.log"

    .line 436
    .line 437
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v9

    .line 444
    new-instance v10, Ljava/io/File;

    .line 445
    .line 446
    invoke-direct {v10, v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    :try_start_4
    new-instance v9, Ljava/io/BufferedWriter;

    .line 450
    .line 451
    new-instance v0, Ljava/io/FileWriter;

    .line 452
    .line 453
    invoke-direct {v0, v10}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 454
    .line 455
    .line 456
    invoke-direct {v9, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 457
    .line 458
    .line 459
    move v0, v12

    .line 460
    :goto_a
    :try_start_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 461
    .line 462
    .line 463
    move-result v10

    .line 464
    if-ge v0, v10, :cond_c

    .line 465
    .line 466
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    move-result-object v10

    .line 470
    check-cast v10, Ljava/lang/String;

    .line 471
    .line 472
    if-lez v0, :cond_b

    .line 473
    .line 474
    invoke-virtual {v9}, Ljava/io/BufferedWriter;->newLine()V

    .line 475
    .line 476
    .line 477
    goto :goto_b

    .line 478
    :catchall_2
    move-exception v0

    .line 479
    goto/16 :goto_15

    .line 480
    .line 481
    :catch_3
    move-exception v0

    .line 482
    goto :goto_c

    .line 483
    :cond_b
    :goto_b
    invoke-virtual {v9, v10}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 484
    .line 485
    .line 486
    add-int/lit8 v0, v0, 0x1

    .line 487
    .line 488
    goto :goto_a

    .line 489
    :cond_c
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 490
    .line 491
    .line 492
    goto :goto_d

    .line 493
    :catchall_3
    move-exception v0

    .line 494
    const/4 v9, 0x0

    .line 495
    goto/16 :goto_15

    .line 496
    .line 497
    :catch_4
    move-exception v0

    .line 498
    const/4 v9, 0x0

    .line 499
    :goto_c
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 500
    .line 501
    .line 502
    new-instance v2, Ljava/lang/StringBuilder;

    .line 503
    .line 504
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 505
    .line 506
    .line 507
    const-string v10, "writeLogToTempPath error:"

    .line 508
    .line 509
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    .line 518
    .line 519
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 524
    .line 525
    .line 526
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 527
    .line 528
    .line 529
    :goto_d
    invoke-static {}, Ltech/sud/logger/LogUtils;->getLogFiles()Ljava/util/List;

    .line 530
    .line 531
    .line 532
    move-result-object v0

    .line 533
    if-nez v0, :cond_d

    .line 534
    .line 535
    goto :goto_f

    .line 536
    :cond_d
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 541
    .line 542
    .line 543
    move-result v2

    .line 544
    if-eqz v2, :cond_10

    .line 545
    .line 546
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    move-result-object v2

    .line 550
    check-cast v2, Ljava/io/File;

    .line 551
    .line 552
    if-eqz v2, :cond_e

    .line 553
    .line 554
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 555
    .line 556
    .line 557
    move-result v9

    .line 558
    if-nez v9, :cond_f

    .line 559
    .line 560
    goto :goto_e

    .line 561
    :cond_f
    new-instance v9, Ljava/io/File;

    .line 562
    .line 563
    iget-object v10, v1, Ll/pzg0;->b:Ljava/io/File;

    .line 564
    .line 565
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v11

    .line 569
    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 570
    .line 571
    .line 572
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object v2

    .line 576
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v9

    .line 580
    invoke-static {v2, v9}, Ll/rsg0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;

    .line 581
    .line 582
    .line 583
    goto :goto_e

    .line 584
    :cond_10
    :goto_f
    iget-object v0, v1, Ll/pzg0;->c:Ljava/io/File;

    .line 585
    .line 586
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 591
    .line 592
    .line 593
    move-result v0

    .line 594
    if-eqz v0, :cond_11

    .line 595
    .line 596
    invoke-static {v2}, Ll/ofg0;->c(Ljava/lang/String;)V

    .line 597
    .line 598
    .line 599
    goto :goto_10

    .line 600
    :cond_11
    invoke-static {v2}, Ll/ofg0;->a(Ljava/lang/String;)Z

    .line 601
    .line 602
    .line 603
    :goto_10
    new-instance v0, Ljava/io/File;

    .line 604
    .line 605
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 606
    .line 607
    .line 608
    move-result-object v9

    .line 609
    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object v9

    .line 613
    invoke-static {v9}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 614
    .line 615
    .line 616
    move-result-object v9

    .line 617
    invoke-direct {v0, v2, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 618
    .line 619
    .line 620
    iget-object v2, v1, Ll/pzg0;->b:Ljava/io/File;

    .line 621
    .line 622
    invoke-static {v2, v0}, Ltech/sud/base/utils/SudZipUtils;->zipDirectory(Ljava/io/File;Ljava/io/File;)V

    .line 623
    .line 624
    .line 625
    iget-object v2, v1, Ll/pzg0;->b:Ljava/io/File;

    .line 626
    .line 627
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v2

    .line 631
    invoke-static {v2}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 632
    .line 633
    .line 634
    new-instance v2, Ljava/io/File;

    .line 635
    .line 636
    iget-object v9, v1, Ll/pzg0;->c:Ljava/io/File;

    .line 637
    .line 638
    iget-object v10, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 639
    .line 640
    iget-object v10, v10, Ll/vwg0;->c:Ljava/lang/String;

    .line 641
    .line 642
    invoke-direct {v2, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    invoke-static {v0, v2}, Ll/ywg0;->a(Ljava/io/File;Ljava/io/File;)Ljava/io/File;

    .line 646
    .line 647
    .line 648
    move-result-object v2

    .line 649
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 650
    .line 651
    .line 652
    if-nez v2, :cond_12

    .line 653
    .line 654
    goto/16 :goto_17

    .line 655
    .line 656
    :cond_12
    iget-object v0, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 657
    .line 658
    iget-object v9, v0, Ll/vwg0;->a:Ljava/lang/String;

    .line 659
    .line 660
    iget-wide v10, v0, Ll/vwg0;->b:J

    .line 661
    .line 662
    iget-object v0, v0, Ll/vwg0;->c:Ljava/lang/String;

    .line 663
    .line 664
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object v13

    .line 668
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 669
    .line 670
    .line 671
    move-result v14

    .line 672
    if-nez v14, :cond_16

    .line 673
    .line 674
    new-instance v14, Ljava/io/File;

    .line 675
    .line 676
    invoke-direct {v14, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    .line 680
    .line 681
    .line 682
    move-result v15

    .line 683
    if-eqz v15, :cond_16

    .line 684
    .line 685
    invoke-virtual {v14}, Ljava/io/File;->length()J

    .line 686
    .line 687
    .line 688
    move-result-wide v17

    .line 689
    cmp-long v15, v17, v21

    .line 690
    .line 691
    if-gtz v15, :cond_13

    .line 692
    .line 693
    goto :goto_12

    .line 694
    :cond_13
    sget-object v15, Ll/utg0;->e:Ll/i0h0;

    .line 695
    .line 696
    if-eqz v15, :cond_14

    .line 697
    .line 698
    iget-object v15, v15, Ll/i0h0;->c:Ll/gvg0;

    .line 699
    .line 700
    if-eqz v15, :cond_14

    .line 701
    .line 702
    iget-object v15, v15, Ll/gvg0;->d:Ll/rhg0;

    .line 703
    .line 704
    if-eqz v15, :cond_14

    .line 705
    .line 706
    iget-object v15, v15, Ll/rhg0;->e:Ljava/lang/String;

    .line 707
    .line 708
    goto :goto_11

    .line 709
    :cond_14
    const/4 v15, 0x0

    .line 710
    :goto_11
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 711
    .line 712
    .line 713
    move-result v16

    .line 714
    if-eqz v16, :cond_15

    .line 715
    .line 716
    goto :goto_12

    .line 717
    :cond_15
    new-instance v6, Ljava/lang/StringBuilder;

    .line 718
    .line 719
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 720
    .line 721
    .line 722
    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 723
    .line 724
    .line 725
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 726
    .line 727
    .line 728
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 729
    .line 730
    .line 731
    move-result-object v6

    .line 732
    invoke-static {v15, v0, v14, v9, v6}, Ll/ywg0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z

    .line 733
    .line 734
    .line 735
    move-result v6

    .line 736
    goto :goto_13

    .line 737
    :cond_16
    :goto_12
    move v6, v12

    .line 738
    :goto_13
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 739
    .line 740
    .line 741
    new-instance v7, Ljava/lang/StringBuilder;

    .line 742
    .line 743
    const-string v9, "\u4e0a\u4f20\u6587\u4ef6 requestId:"

    .line 744
    .line 745
    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 746
    .line 747
    .line 748
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 749
    .line 750
    .line 751
    const-string v0, " \u7ed3\u679c\uff1a"

    .line 752
    .line 753
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 754
    .line 755
    .line 756
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 757
    .line 758
    .line 759
    const-string v0, " \u5927\u5c0f\uff1a"

    .line 760
    .line 761
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 762
    .line 763
    .line 764
    invoke-virtual {v2}, Ljava/io/File;->length()J

    .line 765
    .line 766
    .line 767
    move-result-wide v9

    .line 768
    invoke-virtual {v7, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 769
    .line 770
    .line 771
    const-string v0, " \u8def\u5f84\uff1a"

    .line 772
    .line 773
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 774
    .line 775
    .line 776
    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 777
    .line 778
    .line 779
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 780
    .line 781
    .line 782
    move-result-object v0

    .line 783
    invoke-static {v3, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 784
    .line 785
    .line 786
    if-eqz v6, :cond_18

    .line 787
    .line 788
    iget-object v0, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 789
    .line 790
    iget v0, v0, Ll/vwg0;->e:I

    .line 791
    .line 792
    if-nez v0, :cond_17

    .line 793
    .line 794
    invoke-static {v8}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 795
    .line 796
    .line 797
    move-result-object v0

    .line 798
    iget-object v2, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 799
    .line 800
    iget-object v2, v2, Ll/vwg0;->c:Ljava/lang/String;

    .line 801
    .line 802
    invoke-virtual {v0, v5, v2, v12}, Ll/kjg0;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 803
    .line 804
    .line 805
    goto :goto_14

    .line 806
    :cond_17
    const/4 v2, 0x1

    .line 807
    if-ne v0, v2, :cond_18

    .line 808
    .line 809
    invoke-static {v8}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 810
    .line 811
    .line 812
    move-result-object v0

    .line 813
    iget-object v2, v1, Ll/pzg0;->a:Ll/vwg0;

    .line 814
    .line 815
    iget-object v2, v2, Ll/vwg0;->c:Ljava/lang/String;

    .line 816
    .line 817
    invoke-virtual {v0, v4, v2, v12}, Ll/kjg0;->c(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 818
    .line 819
    .line 820
    invoke-static {v8}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 821
    .line 822
    .line 823
    move-result-object v0

    .line 824
    const-string v2, "key_upload_anr_log_info"

    .line 825
    .line 826
    invoke-virtual {v0, v2}, Ll/kjg0;->d(Ljava/lang/String;)V

    .line 827
    .line 828
    .line 829
    :cond_18
    :goto_14
    iget-object v0, v1, Ll/pzg0;->c:Ljava/io/File;

    .line 830
    .line 831
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 832
    .line 833
    .line 834
    move-result-object v0

    .line 835
    invoke-static {v0}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 836
    .line 837
    .line 838
    return-void

    .line 839
    :goto_15
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 840
    .line 841
    .line 842
    throw v0

    .line 843
    :goto_16
    invoke-static {v9}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 844
    .line 845
    .line 846
    throw v0

    .line 847
    :cond_19
    :goto_17
    return-void
.end method

.method public final run()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pzg0;->a:Ll/vwg0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/vwg0;->a:Ljava/lang/String;

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
    iget-object v0, v0, Ll/vwg0;->c:Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/pzg0;->a()V
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
    const-string v0, "ReportSdkLogTask"

    .line 48
    .line 49
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

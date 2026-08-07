.class public Ll/syv$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/syv;->m(Ljava/util/Date;Ljava/lang/String;JLl/b3k0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/Date;

.field public final synthetic b:Ll/b3k0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J

.field public final synthetic e:Ll/syv;


# direct methods
.method public constructor <init>(Ll/syv;Ljava/util/Date;Ll/b3k0;Ljava/lang/String;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/syv$b;->e:Ll/syv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/syv$b;->a:Ljava/util/Date;

    .line 4
    .line 5
    iput-object p3, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 6
    .line 7
    iput-object p4, p0, Ll/syv$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-wide p5, p0, Ll/syv$b;->d:J

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/syv$b;->a:Ljava/util/Date;

    .line 2
    .line 3
    invoke-static {v0}, Ll/p8c;->a(Ljava/util/Date;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "[LOG] sendLog date:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    new-array v3, v2, [Ljava/lang/Object;

    .line 23
    .line 24
    invoke-static {v1, v3}, Ll/f610;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/p8c;->c()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    const-string v1, "[LOG] flush data!!!"

    .line 38
    .line 39
    new-array v3, v2, [Ljava/lang/Object;

    .line 40
    .line 41
    invoke-static {v1, v3}, Ll/f610;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/syv$b;->e:Ll/syv;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/syv;->i()V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v1, p0, Ll/syv$b;->e:Ll/syv;

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/syv;->b(Ll/syv;Ljava/lang/String;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_1

    .line 60
    .line 61
    new-instance v3, Ljava/io/File;

    .line 62
    .line 63
    iget-object v4, p0, Ll/syv$b;->e:Ll/syv;

    .line 64
    .line 65
    invoke-static {v4}, Ll/syv;->c(Ll/syv;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-direct {v3, v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v3, "[LOG] there is no file in %s "

    .line 81
    .line 82
    invoke-static {v3, v0}, Ll/f610;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 86
    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    iget-object v3, p0, Ll/syv$b;->e:Ll/syv;

    .line 90
    .line 91
    invoke-static {v3, v0}, Ll/syv;->d(Ll/syv;Ll/b3k0;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    iget-object v0, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 96
    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    iput v2, v0, Ll/b3k0;->currentProgress:I

    .line 100
    .line 101
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    mul-int/lit8 v3, v3, 0x2

    .line 106
    .line 107
    iput v3, v0, Ll/b3k0;->totalProgress:I

    .line 108
    .line 109
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_a

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Ljava/io/File;

    .line 124
    .line 125
    iget-object v3, p0, Ll/syv$b;->c:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_3

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    goto :goto_2

    .line 138
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    iget-object v4, p0, Ll/syv$b;->c:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v4, "_"

    .line 149
    .line 150
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    :goto_2
    new-instance v4, Ljava/io/File;

    .line 165
    .line 166
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    invoke-virtual {v5}, Ll/cjk0;->e()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    new-instance v6, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    const-string v7, "log"

    .line 177
    .line 178
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v7, ".xlog"

    .line 187
    .line 188
    const-string v8, ""

    .line 189
    .line 190
    invoke-virtual {v3, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v7

    .line 194
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v6

    .line 201
    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-static {v1, v4, v3}, Ll/nki;->c(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    if-eqz v4, :cond_4

    .line 213
    .line 214
    iget-object v0, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 215
    .line 216
    if-eqz v0, :cond_a

    .line 217
    .line 218
    iget-object p0, p0, Ll/syv$b;->e:Ll/syv;

    .line 219
    .line 220
    new-instance v1, Ljava/lang/RuntimeException;

    .line 221
    .line 222
    const-string v2, "prepare log failed!"

    .line 223
    .line 224
    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-static {p0, v0, v1}, Ll/syv;->e(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_4
    :try_start_0
    invoke-static {v3}, Ll/nki;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    const-string v5, "[LOG] zip success,contains file: %s "

    .line 236
    .line 237
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-static {v5, v1}, Ll/f610;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    new-instance v1, Ljava/io/File;

    .line 249
    .line 250
    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    const-wide/32 v5, 0xa00000

    .line 254
    .line 255
    .line 256
    invoke-static {v1, v5, v6}, Ll/nki;->n(Ljava/io/File;J)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-eqz v1, :cond_5

    .line 261
    .line 262
    const-string v0, "[LOG] zipFile is not valid!!!"

    .line 263
    .line 264
    new-array v1, v2, [Ljava/lang/Object;

    .line 265
    .line 266
    invoke-static {v0, v1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    new-instance v0, Ljava/io/File;

    .line 270
    .line 271
    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-static {v0}, Ll/nki;->f(Ljava/io/File;)Z

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 278
    .line 279
    if-eqz v0, :cond_a

    .line 280
    .line 281
    iget-object v1, p0, Ll/syv$b;->e:Ll/syv;

    .line 282
    .line 283
    new-instance v4, Ljava/lang/RuntimeException;

    .line 284
    .line 285
    const-string v5, "zipFile size is too large"

    .line 286
    .line 287
    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    invoke-static {v1, v0, v4}, Ll/syv;->e(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :catchall_0
    move-exception v0

    .line 295
    goto/16 :goto_3

    .line 296
    .line 297
    :cond_5
    iget-object v1, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 298
    .line 299
    if-eqz v1, :cond_6

    .line 300
    .line 301
    iget-object v5, p0, Ll/syv$b;->e:Ll/syv;

    .line 302
    .line 303
    iget v6, v1, Ll/b3k0;->currentProgress:I

    .line 304
    .line 305
    add-int/lit8 v7, v6, 0x1

    .line 306
    .line 307
    iput v7, v1, Ll/b3k0;->currentProgress:I

    .line 308
    .line 309
    iget v7, v1, Ll/b3k0;->totalProgress:I

    .line 310
    .line 311
    invoke-static {v5, v1, v6, v7}, Ll/syv;->f(Ll/syv;Ll/b3k0;II)V

    .line 312
    .line 313
    .line 314
    :cond_6
    new-instance v1, Ljava/io/File;

    .line 315
    .line 316
    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    new-instance v5, Ll/tyv;

    .line 320
    .line 321
    invoke-static {}, Ll/vc60;->f()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v6

    .line 325
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 330
    .line 331
    .line 332
    move-result-object v8

    .line 333
    invoke-virtual {v8}, Ll/cjk0;->d()Ll/r4f;

    .line 334
    .line 335
    .line 336
    move-result-object v8

    .line 337
    invoke-interface {v8}, Ll/r4f;->getUserInfo()Lcom/tantanapp/beatles/v2/data/User;

    .line 338
    .line 339
    .line 340
    move-result-object v8

    .line 341
    invoke-virtual {v8}, Lcom/tantanapp/beatles/v2/data/User;->getUserId()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v8

    .line 345
    iget-wide v9, p0, Ll/syv$b;->d:J

    .line 346
    .line 347
    iget-object v11, p0, Ll/syv$b;->a:Ljava/util/Date;

    .line 348
    .line 349
    invoke-direct/range {v5 .. v11}, Ll/tyv;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Date;)V

    .line 350
    .line 351
    .line 352
    invoke-static {}, Ll/du2;->o()Ll/q3k0;

    .line 353
    .line 354
    .line 355
    move-result-object v6

    .line 356
    invoke-virtual {v6, v5}, Ll/q3k0;->t(Ll/tyv;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 357
    .line 358
    .line 359
    move-result-object v5

    .line 360
    sget-object v6, Lcom/tantanapp/beatles/v2/upload/UploadStatus;->SUCCESS:Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 361
    .line 362
    if-ne v5, v6, :cond_8

    .line 363
    .line 364
    new-instance v5, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 367
    .line 368
    .line 369
    const-string v6, "[LOG] upload success:"

    .line 370
    .line 371
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v4

    .line 381
    new-array v5, v2, [Ljava/lang/Object;

    .line 382
    .line 383
    invoke-static {v4, v5}, Ll/f610;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 384
    .line 385
    .line 386
    iget-object v4, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 387
    .line 388
    if-eqz v4, :cond_7

    .line 389
    .line 390
    iget-object v5, p0, Ll/syv$b;->e:Ll/syv;

    .line 391
    .line 392
    iget v6, v4, Ll/b3k0;->currentProgress:I

    .line 393
    .line 394
    add-int/lit8 v7, v6, 0x1

    .line 395
    .line 396
    iput v7, v4, Ll/b3k0;->currentProgress:I

    .line 397
    .line 398
    iget v7, v4, Ll/b3k0;->totalProgress:I

    .line 399
    .line 400
    invoke-static {v5, v4, v6, v7}, Ll/syv;->f(Ll/syv;Ll/b3k0;II)V

    .line 401
    .line 402
    .line 403
    iget-object v4, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 404
    .line 405
    iget v5, v4, Ll/b3k0;->currentProgress:I

    .line 406
    .line 407
    iget v6, v4, Ll/b3k0;->totalProgress:I

    .line 408
    .line 409
    if-ne v5, v6, :cond_7

    .line 410
    .line 411
    iget-object v5, p0, Ll/syv$b;->e:Ll/syv;

    .line 412
    .line 413
    invoke-static {v5, v4}, Ll/syv;->d(Ll/syv;Ll/b3k0;)V

    .line 414
    .line 415
    .line 416
    :cond_7
    invoke-static {v1}, Ll/nki;->f(Ljava/io/File;)Z

    .line 417
    .line 418
    .line 419
    goto/16 :goto_1

    .line 420
    .line 421
    :cond_8
    iget-object v0, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 422
    .line 423
    if-eqz v0, :cond_9

    .line 424
    .line 425
    iget-object v4, p0, Ll/syv$b;->e:Ll/syv;

    .line 426
    .line 427
    new-instance v5, Ljava/lang/RuntimeException;

    .line 428
    .line 429
    const-string v6, "upload fail!"

    .line 430
    .line 431
    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 432
    .line 433
    .line 434
    invoke-static {v4, v0, v5}, Ll/syv;->e(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V

    .line 435
    .line 436
    .line 437
    :cond_9
    const-string v0, "[LOG] upload failed!!!"

    .line 438
    .line 439
    new-array v4, v2, [Ljava/lang/Object;

    .line 440
    .line 441
    invoke-static {v0, v4}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 442
    .line 443
    .line 444
    invoke-static {v1}, Ll/nki;->f(Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    .line 446
    .line 447
    return-void

    .line 448
    :goto_3
    new-instance v1, Ljava/io/File;

    .line 449
    .line 450
    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    invoke-static {v1}, Ll/nki;->f(Ljava/io/File;)Z

    .line 454
    .line 455
    .line 456
    new-instance v1, Ljava/lang/StringBuilder;

    .line 457
    .line 458
    const-string v3, "[LOG] upload exception:"

    .line 459
    .line 460
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object v3

    .line 467
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    .line 469
    .line 470
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v1

    .line 474
    new-array v2, v2, [Ljava/lang/Object;

    .line 475
    .line 476
    invoke-static {v1, v2}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 477
    .line 478
    .line 479
    iget-object v1, p0, Ll/syv$b;->b:Ll/b3k0;

    .line 480
    .line 481
    if-eqz v1, :cond_a

    .line 482
    .line 483
    iget-object p0, p0, Ll/syv$b;->e:Ll/syv;

    .line 484
    .line 485
    invoke-static {p0, v1, v0}, Ll/syv;->e(Ll/syv;Ll/b3k0;Ljava/lang/Throwable;)V

    .line 486
    .line 487
    .line 488
    :cond_a
    return-void
.end method

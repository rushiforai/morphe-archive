.class public final Ll/ryg0;
.super Ll/eog0;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ll/sgg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eog0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ll/aug0;ILjava/lang/Exception;)V
    .locals 9

    .line 1
    iget-object p0, p0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/sgg0;

    .line 8
    .line 9
    if-eqz p0, :cond_a

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "taskEnd:"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "  :mgId:"

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v3, p0, Ll/sgg0;->b:J

    .line 29
    .line 30
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v3, "  cause:"

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-static {p2}, Ll/ekg0;->a(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v4, "  cancelCause:"

    .line 46
    .line 47
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget v5, p0, Ll/sgg0;->f:I

    .line 51
    .line 52
    invoke-static {v5}, Ll/bjg0;->a(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v5, "  realCause:"

    .line 60
    .line 61
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-static {p3}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v5, "SudDownloadTask"

    .line 76
    .line 77
    invoke-static {v5, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    sget-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 81
    .line 82
    new-instance v6, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 88
    .line 89
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-wide v7, p0, Ll/sgg0;->b:J

    .line 96
    .line 97
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-static {p2}, Ll/ekg0;->a(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v1, p0, Ll/sgg0;->f:I

    .line 114
    .line 115
    invoke-static {v1}, Ll/bjg0;->a(I)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    if-eqz p3, :cond_0

    .line 130
    .line 131
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 132
    .line 133
    .line 134
    :cond_0
    if-eqz p3, :cond_1

    .line 135
    .line 136
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    goto :goto_0

    .line 141
    :cond_1
    const/4 v1, 0x0

    .line 142
    :goto_0
    const/4 v3, 0x3

    .line 143
    if-nez v1, :cond_3

    .line 144
    .line 145
    if-ne p2, v3, :cond_2

    .line 146
    .line 147
    const-string v1, "user cancel"

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_2
    invoke-static {p2}, Ll/ekg0;->a(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    const-string v4, "EndCause:"

    .line 155
    .line 156
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    :cond_3
    :goto_1
    const/4 v4, 0x1

    .line 161
    if-ne p2, v4, :cond_4

    .line 162
    .line 163
    sget-object p2, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 164
    .line 165
    iput-object p2, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 166
    .line 167
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 168
    .line 169
    .line 170
    move-result-wide v3

    .line 171
    iput-wide v3, p0, Ll/sgg0;->r:J

    .line 172
    .line 173
    invoke-virtual {p0, p2}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 174
    .line 175
    .line 176
    new-instance p2, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    const-string p3, "checkMd5:"

    .line 179
    .line 180
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 184
    .line 185
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-wide v3, p0, Ll/sgg0;->b:J

    .line 192
    .line 193
    invoke-virtual {p2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p2

    .line 200
    invoke-static {v5, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    new-instance p2, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object p3, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 209
    .line 210
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-wide v1, p0, Ll/sgg0;->b:J

    .line 217
    .line 218
    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    invoke-static {v0, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {p1}, Ll/aug0;->j()Ljava/io/File;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iget-object p2, p0, Ll/sgg0;->g:Ll/oqg0;

    .line 233
    .line 234
    iget-object p2, p2, Ll/oqg0;->f:Ljava/lang/String;

    .line 235
    .line 236
    new-instance p3, Ll/pvg0;

    .line 237
    .line 238
    invoke-direct {p3, p0}, Ll/pvg0;-><init>(Ll/sgg0;)V

    .line 239
    .line 240
    .line 241
    invoke-static {p1, p2, p3}, Ll/gwg0;->b(Ljava/io/File;Ljava/lang/String;Ll/pvg0;)V

    .line 242
    .line 243
    .line 244
    goto/16 :goto_2

    .line 245
    .line 246
    :cond_4
    if-ne p2, v3, :cond_9

    .line 247
    .line 248
    iget p1, p0, Ll/sgg0;->f:I

    .line 249
    .line 250
    invoke-static {p1}, Ll/pxg0;->a(I)I

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    if-eqz p1, :cond_7

    .line 255
    .line 256
    const/4 p2, 0x2

    .line 257
    if-eq p1, p2, :cond_6

    .line 258
    .line 259
    if-eq p1, v3, :cond_5

    .line 260
    .line 261
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CANCELED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 262
    .line 263
    iput-object p1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 264
    .line 265
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 266
    .line 267
    .line 268
    move-result-wide p2

    .line 269
    iput-wide p2, p0, Ll/sgg0;->r:J

    .line 270
    .line 271
    invoke-virtual {p0, p1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p0}, Ll/sgg0;->a()V

    .line 275
    .line 276
    .line 277
    goto/16 :goto_2

    .line 278
    .line 279
    :cond_5
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 280
    .line 281
    iput-object p1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 282
    .line 283
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 284
    .line 285
    .line 286
    move-result-wide p2

    .line 287
    iput-wide p2, p0, Ll/sgg0;->r:J

    .line 288
    .line 289
    invoke-virtual {p0, p1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 290
    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_6
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_PAUSE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 294
    .line 295
    iput-object p1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 296
    .line 297
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 298
    .line 299
    .line 300
    move-result-wide p2

    .line 301
    iput-wide p2, p0, Ll/sgg0;->r:J

    .line 302
    .line 303
    invoke-virtual {p0, p1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 304
    .line 305
    .line 306
    goto :goto_2

    .line 307
    :cond_7
    iget p1, p0, Ll/sgg0;->s:I

    .line 308
    .line 309
    add-int/2addr p1, v4

    .line 310
    iput p1, p0, Ll/sgg0;->s:I

    .line 311
    .line 312
    new-instance p1, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    const-string p2, "unknown cancel:"

    .line 315
    .line 316
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    iget p3, p0, Ll/sgg0;->s:I

    .line 320
    .line 321
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-static {v5, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 329
    .line 330
    .line 331
    new-instance p1, Ljava/lang/StringBuilder;

    .line 332
    .line 333
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    iget p2, p0, Ll/sgg0;->s:I

    .line 337
    .line 338
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    iget p1, p0, Ll/sgg0;->s:I

    .line 349
    .line 350
    iget p2, p0, Ll/sgg0;->t:I

    .line 351
    .line 352
    if-lt p1, p2, :cond_8

    .line 353
    .line 354
    const-string p1, "unknown cancel callback fail"

    .line 355
    .line 356
    invoke-static {v5, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    const/16 p1, -0x2775

    .line 363
    .line 364
    const-string p2, "retry download fail. unknown cancel"

    .line 365
    .line 366
    invoke-virtual {p0, p1, p2}, Ll/sgg0;->b(ILjava/lang/String;)V

    .line 367
    .line 368
    .line 369
    goto :goto_2

    .line 370
    :cond_8
    const-string p1, "unknown cancel retry download"

    .line 371
    .line 372
    invoke-static {v5, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 373
    .line 374
    .line 375
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_WAITING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 379
    .line 380
    iput-object p1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 381
    .line 382
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 383
    .line 384
    .line 385
    move-result-wide p2

    .line 386
    iput-wide p2, p0, Ll/sgg0;->r:J

    .line 387
    .line 388
    invoke-virtual {p0, p1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 389
    .line 390
    .line 391
    goto :goto_2

    .line 392
    :cond_9
    invoke-static {p3}, Ll/oeg0;->a(Ljava/lang/Throwable;)I

    .line 393
    .line 394
    .line 395
    move-result p1

    .line 396
    invoke-virtual {p0, p1, v1}, Ll/sgg0;->b(ILjava/lang/String;)V

    .line 397
    .line 398
    .line 399
    :goto_2
    iget-object p0, p0, Ll/sgg0;->k:Ljava/lang/ref/WeakReference;

    .line 400
    .line 401
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    check-cast p0, Ll/keg0;

    .line 406
    .line 407
    if-eqz p0, :cond_a

    .line 408
    .line 409
    check-cast p0, Ll/dzg0;

    .line 410
    .line 411
    iget-object p0, p0, Ll/dzg0;->a:Ll/bhg0;

    .line 412
    .line 413
    invoke-virtual {p0}, Ll/bhg0;->c()V

    .line 414
    .line 415
    .line 416
    :cond_a
    return-void
.end method

.method public final b(Ll/bog0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bog0;->c()J

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/sgg0;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/bog0;->c()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/sgg0;->p:J

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bog0;->e()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Ll/sgg0;->q:J

    .line 25
    .line 26
    sget-object p1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 27
    .line 28
    iput-object p1, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 29
    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iput-wide v0, p0, Ll/sgg0;->r:J

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 37
    .line 38
    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v0, "infoReady mgId:"

    .line 42
    .line 43
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-wide v0, p0, Ll/sgg0;->b:J

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "SudDownloadTask"

    .line 56
    .line 57
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final c(Ll/aug0;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/sgg0;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    if-ge v1, v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    check-cast v2, Ll/wfg0;

    .line 27
    .line 28
    invoke-interface {v2}, Ll/wfg0;->a()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v0, "taskStart mgId:"

    .line 35
    .line 36
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-wide v0, p0, Ll/sgg0;->b:J

    .line 40
    .line 41
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "SudDownloadTask"

    .line 49
    .line 50
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final d(J)V
    .locals 7

    .line 1
    iget-object p0, p0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/sgg0;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iput-wide p1, p0, Ll/sgg0;->q:J

    .line 12
    .line 13
    iget-wide v0, p0, Ll/sgg0;->p:J

    .line 14
    .line 15
    iget-object v2, p0, Ll/sgg0;->l:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/4 v4, 0x0

    .line 22
    :goto_0
    if-ge v4, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    check-cast v5, Ll/wfg0;

    .line 31
    .line 32
    invoke-interface {v5, p1, p2, v0, v1}, Ll/wfg0;->d(JJ)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v0, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 37
    .line 38
    iput-object v0, p0, Ll/sgg0;->h:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    iput-wide v1, p0, Ll/sgg0;->r:J

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/sgg0;->d(Ltech/sud/gip/core/PkgDownloadStatus;)V

    .line 47
    .line 48
    .line 49
    sget-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 50
    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "progress mgId:"

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-wide v3, p0, Ll/sgg0;->b:J

    .line 59
    .line 60
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v3, " \u8fdb\u5ea6\uff1a"

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v4, "/"

    .line 72
    .line 73
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-wide v5, p0, Ll/sgg0;->p:J

    .line 77
    .line 78
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-wide v1, p0, Ll/sgg0;->b:J

    .line 94
    .line 95
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-wide p0, p0, Ll/sgg0;->p:J

    .line 108
    .line 109
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const-string p1, "SudDownloadTask"

    .line 117
    .line 118
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    return-void
.end method

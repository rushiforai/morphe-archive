.class public final Ll/xzg0;
.super Ll/erg0;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# static fields
.field public static final j:Ljava/util/concurrent/ThreadPoolExecutor;


# instance fields
.field public final b:Ll/aug0;

.field public final c:Z

.field public final d:Ljava/util/ArrayList;

.field public volatile e:Ll/ixg0;

.field public volatile f:Z

.field public volatile g:Z

.field public volatile h:Ljava/lang/Thread;

.field public final i:Ll/ehg0;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    .line 4
    .line 5
    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v7, Ll/vng0;

    .line 9
    .line 10
    const-string v1, "OkDownload Block"

    .line 11
    .line 12
    invoke-direct {v7, v1}, Ll/vng0;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const v2, 0x7fffffff

    .line 16
    .line 17
    .line 18
    const-wide/16 v3, 0x3c

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/xzg0;->j:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Ll/aug0;Ll/ehg0;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "download call: "

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v2, p1, Ll/aug0;->b:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {p0, v1}, Ll/erg0;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/xzg0;->b:Ll/aug0;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Ll/xzg0;->c:Z

    .line 29
    .line 30
    iput-object v0, p0, Ll/xzg0;->d:Ljava/util/ArrayList;

    .line 31
    .line 32
    iput-object p2, p0, Ll/xzg0;->i:Ll/ehg0;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, v1, Ll/xzg0;->h:Ljava/lang/Thread;

    .line 8
    .line 9
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, v0, Ll/jwg0;->f:Ll/qhg0;

    .line 14
    .line 15
    iget-object v3, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 16
    .line 17
    iget-object v4, v1, Ll/xzg0;->b:Ll/aug0;

    .line 18
    .line 19
    iget v4, v4, Ll/aug0;->b:I

    .line 20
    .line 21
    invoke-interface {v3}, Ll/ehg0;->a()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v3, v3, Ll/jwg0;->b:Ll/d0h0;

    .line 29
    .line 30
    iget-object v3, v3, Ll/d0h0;->a:Ll/oyg0;

    .line 31
    .line 32
    iget-object v4, v1, Ll/xzg0;->b:Ll/aug0;

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ll/oyg0;->c(Ll/aug0;)V

    .line 35
    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    :cond_0
    iget-object v5, v1, Ll/xzg0;->b:Ll/aug0;

    .line 39
    .line 40
    iget-object v5, v5, Ll/aug0;->c:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-gtz v5, :cond_1

    .line 47
    .line 48
    new-instance v0, Ll/ntg0;

    .line 49
    .line 50
    new-instance v2, Ljava/io/IOException;

    .line 51
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v4, "unexpected url: "

    .line 55
    .line 56
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v4, v1, Ll/xzg0;->b:Ll/aug0;

    .line 60
    .line 61
    iget-object v4, v4, Ll/aug0;->c:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-direct {v0, v2}, Ll/ntg0;-><init>(Ljava/io/IOException;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, v1, Ll/xzg0;->e:Ll/ixg0;

    .line 77
    .line 78
    :goto_0
    const/4 v5, 0x1

    .line 79
    goto/16 :goto_14

    .line 80
    .line 81
    :cond_1
    iget-boolean v5, v1, Ll/xzg0;->f:Z

    .line 82
    .line 83
    if-eqz v5, :cond_2

    .line 84
    .line 85
    :goto_1
    goto :goto_0

    .line 86
    :cond_2
    :try_start_0
    iget-object v5, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 87
    .line 88
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 89
    .line 90
    iget v9, v9, Ll/aug0;->b:I

    .line 91
    .line 92
    invoke-interface {v5, v9}, Ll/ehg0;->get(I)Ll/bog0;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    if-nez v5, :cond_3

    .line 97
    .line 98
    iget-object v5, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 99
    .line 100
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 101
    .line 102
    invoke-interface {v5, v9}, Ll/ehg0;->c(Ll/aug0;)Ll/bog0;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    :cond_3
    move-object v12, v5

    .line 107
    goto :goto_2

    .line 108
    :catch_0
    move-exception v0

    .line 109
    goto/16 :goto_13

    .line 110
    .line 111
    :goto_2
    iget-object v5, v1, Ll/xzg0;->b:Ll/aug0;

    .line 112
    .line 113
    iput-object v12, v5, Ll/aug0;->f:Ll/bog0;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    iget-boolean v5, v1, Ll/xzg0;->f:Z

    .line 116
    .line 117
    if-eqz v5, :cond_4

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_4
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    iget-object v5, v5, Ll/jwg0;->f:Ll/qhg0;

    .line 125
    .line 126
    iget-object v5, v1, Ll/xzg0;->b:Ll/aug0;

    .line 127
    .line 128
    iget-object v9, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 129
    .line 130
    new-instance v10, Ll/vfg0;

    .line 131
    .line 132
    invoke-direct {v10, v5, v12, v9}, Ll/vfg0;-><init>(Ll/aug0;Ll/bog0;Ll/ehg0;)V

    .line 133
    .line 134
    .line 135
    new-instance v13, Ll/ixg0;

    .line 136
    .line 137
    invoke-direct {v13, v10}, Ll/ixg0;-><init>(Ll/vfg0;)V

    .line 138
    .line 139
    .line 140
    iput-object v13, v1, Ll/xzg0;->e:Ll/ixg0;

    .line 141
    .line 142
    new-instance v5, Ll/rqg0;

    .line 143
    .line 144
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 145
    .line 146
    invoke-direct {v5, v9, v12}, Ll/rqg0;-><init>(Ll/aug0;Ll/bog0;)V

    .line 147
    .line 148
    .line 149
    :try_start_1
    invoke-virtual {v5}, Ll/rqg0;->a()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 150
    .line 151
    .line 152
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 153
    .line 154
    iget-object v10, v9, Ll/aug0;->w:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v10, v13, Ll/ixg0;->a:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v10, v2, Ll/qhg0;->a:Ll/ttg0;

    .line 159
    .line 160
    invoke-virtual {v9}, Ll/aug0;->j()Ljava/io/File;

    .line 161
    .line 162
    .line 163
    move-result-object v9

    .line 164
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v9

    .line 168
    invoke-virtual {v10, v9}, Ll/ttg0;->b(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 172
    .line 173
    .line 174
    move-result-object v9

    .line 175
    iget-object v9, v9, Ll/jwg0;->g:Ll/nmg0;

    .line 176
    .line 177
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 178
    .line 179
    iget-wide v10, v5, Ll/rqg0;->d:J

    .line 180
    .line 181
    iget-boolean v14, v9, Ll/aug0;->r:Z

    .line 182
    .line 183
    if-nez v14, :cond_5

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_5
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 187
    .line 188
    .line 189
    move-result-object v14

    .line 190
    iget-object v14, v14, Ll/jwg0;->c:Ll/agg0;

    .line 191
    .line 192
    iget-object v15, v14, Ll/agg0;->b:Ll/izg0;

    .line 193
    .line 194
    invoke-virtual {v15, v9, v12}, Ll/izg0;->h(Ll/aug0;Ll/bog0;)Ll/bog0;

    .line 195
    .line 196
    .line 197
    move-result-object v9

    .line 198
    if-nez v9, :cond_6

    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_6
    iget v15, v9, Ll/bog0;->a:I

    .line 202
    .line 203
    invoke-virtual {v14, v15}, Ll/agg0;->remove(I)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v9}, Ll/bog0;->e()J

    .line 207
    .line 208
    .line 209
    move-result-wide v14

    .line 210
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    iget-object v3, v3, Ll/jwg0;->g:Ll/nmg0;

    .line 215
    .line 216
    const-wide/16 v16, 0x2800

    .line 217
    .line 218
    cmp-long v3, v14, v16

    .line 219
    .line 220
    if-gtz v3, :cond_7

    .line 221
    .line 222
    goto :goto_3

    .line 223
    :cond_7
    iget-object v3, v9, Ll/bog0;->c:Ljava/lang/String;

    .line 224
    .line 225
    if-eqz v3, :cond_8

    .line 226
    .line 227
    iget-object v14, v12, Ll/bog0;->c:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    if-nez v3, :cond_8

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_8
    invoke-virtual {v9}, Ll/bog0;->c()J

    .line 237
    .line 238
    .line 239
    move-result-wide v14

    .line 240
    cmp-long v3, v14, v10

    .line 241
    .line 242
    if-eqz v3, :cond_9

    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_9
    invoke-virtual {v9}, Ll/bog0;->d()Ljava/io/File;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    if-eqz v3, :cond_b

    .line 250
    .line 251
    invoke-virtual {v9}, Ll/bog0;->d()Ljava/io/File;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    if-nez v3, :cond_a

    .line 260
    .line 261
    goto :goto_3

    .line 262
    :cond_a
    iget-object v3, v12, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 263
    .line 264
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 265
    .line 266
    .line 267
    iget-object v3, v12, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 268
    .line 269
    iget-object v9, v9, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 270
    .line 271
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 272
    .line 273
    .line 274
    invoke-virtual {v12}, Ll/bog0;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    :cond_b
    :goto_3
    :try_start_2
    iget-boolean v3, v5, Ll/rqg0;->b:Z

    .line 278
    .line 279
    if-eqz v3, :cond_14

    .line 280
    .line 281
    iget-wide v9, v5, Ll/rqg0;->d:J

    .line 282
    .line 283
    new-instance v3, Ll/fjg0;

    .line 284
    .line 285
    iget-object v11, v1, Ll/xzg0;->b:Ll/aug0;

    .line 286
    .line 287
    invoke-direct {v3, v11, v12, v9, v10}, Ll/fjg0;-><init>(Ll/aug0;Ll/bog0;J)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v3}, Ll/fjg0;->a()V

    .line 291
    .line 292
    .line 293
    iget-boolean v9, v3, Ll/fjg0;->a:Z

    .line 294
    .line 295
    if-eqz v9, :cond_12

    .line 296
    .line 297
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 298
    .line 299
    iget v9, v9, Ll/aug0;->b:I

    .line 300
    .line 301
    invoke-virtual {v3}, Ll/fjg0;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    iget-object v9, v1, Ll/xzg0;->b:Ll/aug0;

    .line 305
    .line 306
    invoke-virtual {v9}, Ll/aug0;->j()Ljava/io/File;

    .line 307
    .line 308
    .line 309
    move-result-object v9

    .line 310
    if-nez v9, :cond_c

    .line 311
    .line 312
    goto :goto_4

    .line 313
    :cond_c
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 314
    .line 315
    .line 316
    move-result v10

    .line 317
    if-eqz v10, :cond_e

    .line 318
    .line 319
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 320
    .line 321
    .line 322
    move-result v9

    .line 323
    if-eqz v9, :cond_d

    .line 324
    .line 325
    goto :goto_4

    .line 326
    :cond_d
    new-instance v0, Ljava/io/IOException;

    .line 327
    .line 328
    const-string v2, "Delete file failed!"

    .line 329
    .line 330
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    throw v0

    .line 334
    :catch_1
    move-exception v0

    .line 335
    const/4 v5, 0x1

    .line 336
    goto/16 :goto_12

    .line 337
    .line 338
    :cond_e
    :goto_4
    iget-boolean v9, v3, Ll/fjg0;->c:Z

    .line 339
    .line 340
    if-nez v9, :cond_f

    .line 341
    .line 342
    const/4 v3, 0x1

    .line 343
    goto :goto_5

    .line 344
    :cond_f
    iget-boolean v9, v3, Ll/fjg0;->b:Z

    .line 345
    .line 346
    if-nez v9, :cond_10

    .line 347
    .line 348
    const/4 v3, 0x2

    .line 349
    goto :goto_5

    .line 350
    :cond_10
    iget-boolean v9, v3, Ll/fjg0;->d:Z

    .line 351
    .line 352
    if-nez v9, :cond_11

    .line 353
    .line 354
    const/4 v3, 0x3

    .line 355
    :goto_5
    invoke-virtual {v1, v12, v5, v3}, Ll/xzg0;->f(Ll/bog0;Ll/rqg0;I)V

    .line 356
    .line 357
    .line 358
    goto :goto_7

    .line 359
    :cond_11
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 360
    .line 361
    new-instance v2, Ljava/lang/StringBuilder;

    .line 362
    .line 363
    const-string v4, "No cause find with dirty: "

    .line 364
    .line 365
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    iget-boolean v3, v3, Ll/fjg0;->a:Z

    .line 369
    .line 370
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    throw v0

    .line 381
    :cond_12
    iget-object v3, v0, Ll/jwg0;->b:Ll/d0h0;

    .line 382
    .line 383
    iget-object v3, v3, Ll/d0h0;->a:Ll/oyg0;

    .line 384
    .line 385
    iget-object v5, v1, Ll/xzg0;->b:Ll/aug0;

    .line 386
    .line 387
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 388
    .line 389
    .line 390
    iget v9, v5, Ll/aug0;->b:I

    .line 391
    .line 392
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 393
    .line 394
    .line 395
    move-result-object v9

    .line 396
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 397
    .line 398
    .line 399
    iget-boolean v9, v5, Ll/aug0;->n:Z

    .line 400
    .line 401
    if-eqz v9, :cond_13

    .line 402
    .line 403
    iget-object v3, v3, Ll/oyg0;->a:Landroid/os/Handler;

    .line 404
    .line 405
    new-instance v9, Ll/igg0;

    .line 406
    .line 407
    invoke-direct {v9, v5, v12}, Ll/igg0;-><init>(Ll/aug0;Ll/bog0;)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v3, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 411
    .line 412
    .line 413
    goto :goto_7

    .line 414
    :cond_13
    iget-object v3, v5, Ll/aug0;->p:Ll/eog0;

    .line 415
    .line 416
    invoke-virtual {v3, v5, v12}, Ll/rkg0;->f(Ll/aug0;Ll/bog0;)V

    .line 417
    .line 418
    .line 419
    goto :goto_7

    .line 420
    :cond_14
    iget-object v3, v1, Ll/xzg0;->b:Ll/aug0;

    .line 421
    .line 422
    iget v3, v3, Ll/aug0;->b:I

    .line 423
    .line 424
    invoke-virtual {v5}, Ll/rqg0;->toString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    iget-object v3, v1, Ll/xzg0;->b:Ll/aug0;

    .line 428
    .line 429
    invoke-virtual {v3}, Ll/aug0;->j()Ljava/io/File;

    .line 430
    .line 431
    .line 432
    move-result-object v3

    .line 433
    if-nez v3, :cond_15

    .line 434
    .line 435
    goto :goto_6

    .line 436
    :cond_15
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 437
    .line 438
    .line 439
    move-result v9

    .line 440
    if-eqz v9, :cond_17

    .line 441
    .line 442
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 443
    .line 444
    .line 445
    move-result v3

    .line 446
    if-eqz v3, :cond_16

    .line 447
    .line 448
    goto :goto_6

    .line 449
    :cond_16
    new-instance v0, Ljava/io/IOException;

    .line 450
    .line 451
    const-string v2, "Delete file failed!"

    .line 452
    .line 453
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    throw v0

    .line 457
    :cond_17
    :goto_6
    iget v3, v5, Ll/rqg0;->c:I

    .line 458
    .line 459
    if-eqz v3, :cond_24

    .line 460
    .line 461
    invoke-virtual {v1, v12, v5, v3}, Ll/xzg0;->f(Ll/bog0;Ll/rqg0;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 462
    .line 463
    .line 464
    :goto_7
    iget-object v3, v12, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 465
    .line 466
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 467
    .line 468
    .line 469
    move-result v3

    .line 470
    new-instance v5, Ljava/util/ArrayList;

    .line 471
    .line 472
    iget-object v9, v12, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 473
    .line 474
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 475
    .line 476
    .line 477
    move-result v9

    .line 478
    invoke-direct {v5, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 479
    .line 480
    .line 481
    new-instance v15, Ljava/util/ArrayList;

    .line 482
    .line 483
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 484
    .line 485
    .line 486
    const/4 v10, 0x0

    .line 487
    :goto_8
    if-ge v10, v3, :cond_1b

    .line 488
    .line 489
    iget-object v9, v12, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 490
    .line 491
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v9

    .line 495
    check-cast v9, Ll/akg0;

    .line 496
    .line 497
    iget-object v11, v9, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 498
    .line 499
    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 500
    .line 501
    .line 502
    move-result-wide v16

    .line 503
    iget-wide v6, v9, Ll/akg0;->b:J

    .line 504
    .line 505
    cmp-long v6, v16, v6

    .line 506
    .line 507
    if-nez v6, :cond_18

    .line 508
    .line 509
    goto :goto_a

    .line 510
    :cond_18
    iget-object v6, v9, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 511
    .line 512
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 513
    .line 514
    .line 515
    move-result-wide v6

    .line 516
    move-object v11, v9

    .line 517
    const-wide/16 v8, 0x0

    .line 518
    .line 519
    cmp-long v6, v6, v8

    .line 520
    .line 521
    if-gez v6, :cond_19

    .line 522
    .line 523
    goto :goto_9

    .line 524
    :cond_19
    iget-object v6, v11, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 525
    .line 526
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 527
    .line 528
    .line 529
    move-result-wide v6

    .line 530
    iget-wide v8, v11, Ll/akg0;->b:J

    .line 531
    .line 532
    cmp-long v6, v6, v8

    .line 533
    .line 534
    if-lez v6, :cond_1a

    .line 535
    .line 536
    :goto_9
    invoke-virtual {v11}, Ll/akg0;->toString()Ljava/lang/String;

    .line 537
    .line 538
    .line 539
    iget-object v6, v11, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 540
    .line 541
    const-wide/16 v7, 0x0

    .line 542
    .line 543
    invoke-virtual {v6, v7, v8}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 544
    .line 545
    .line 546
    :cond_1a
    iget-object v11, v1, Ll/xzg0;->b:Ll/aug0;

    .line 547
    .line 548
    iget-object v14, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 549
    .line 550
    new-instance v9, Ll/jgg0;

    .line 551
    .line 552
    invoke-direct/range {v9 .. v14}, Ll/jgg0;-><init>(ILl/aug0;Ll/bog0;Ll/ixg0;Ll/ehg0;)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    iget v6, v9, Ll/jgg0;->a:I

    .line 559
    .line 560
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 561
    .line 562
    .line 563
    move-result-object v6

    .line 564
    invoke-virtual {v15, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    :goto_a
    add-int/lit8 v10, v10, 0x1

    .line 568
    .line 569
    goto :goto_8

    .line 570
    :cond_1b
    iget-boolean v3, v1, Ll/xzg0;->f:Z

    .line 571
    .line 572
    if-eqz v3, :cond_1c

    .line 573
    .line 574
    goto :goto_d

    .line 575
    :cond_1c
    invoke-virtual {v13}, Ll/ixg0;->a()Ll/vfg0;

    .line 576
    .line 577
    .line 578
    move-result-object v3

    .line 579
    iput-object v15, v3, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 580
    .line 581
    new-instance v3, Ljava/util/ArrayList;

    .line 582
    .line 583
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 584
    .line 585
    .line 586
    move-result v6

    .line 587
    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 588
    .line 589
    .line 590
    :try_start_3
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 591
    .line 592
    .line 593
    move-result v6

    .line 594
    const/4 v7, 0x0

    .line 595
    :goto_b
    if-ge v7, v6, :cond_1d

    .line 596
    .line 597
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 598
    .line 599
    .line 600
    move-result-object v8

    .line 601
    add-int/lit8 v7, v7, 0x1

    .line 602
    .line 603
    check-cast v8, Ll/jgg0;

    .line 604
    .line 605
    sget-object v9, Ll/xzg0;->j:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 606
    .line 607
    invoke-interface {v9, v8}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 608
    .line 609
    .line 610
    move-result-object v8

    .line 611
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 612
    .line 613
    .line 614
    goto :goto_b

    .line 615
    :catchall_0
    move-exception v0

    .line 616
    goto :goto_f

    .line 617
    :cond_1d
    iget-object v6, v1, Ll/xzg0;->d:Ljava/util/ArrayList;

    .line 618
    .line 619
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 620
    .line 621
    .line 622
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 623
    .line 624
    .line 625
    move-result v6

    .line 626
    const/4 v7, 0x0

    .line 627
    :catch_2
    :cond_1e
    :goto_c
    if-ge v7, v6, :cond_1f

    .line 628
    .line 629
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 630
    .line 631
    .line 632
    move-result-object v8

    .line 633
    add-int/lit8 v7, v7, 0x1

    .line 634
    .line 635
    check-cast v8, Ljava/util/concurrent/Future;

    .line 636
    .line 637
    invoke-interface {v8}, Ljava/util/concurrent/Future;->isDone()Z

    .line 638
    .line 639
    .line 640
    move-result v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 641
    if-nez v9, :cond_1e

    .line 642
    .line 643
    :try_start_4
    invoke-interface {v8}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_4
    .catch Ljava/util/concurrent/CancellationException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 644
    .line 645
    .line 646
    goto :goto_c

    .line 647
    :cond_1f
    iget-object v3, v1, Ll/xzg0;->d:Ljava/util/ArrayList;

    .line 648
    .line 649
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 650
    .line 651
    .line 652
    :goto_d
    iget-boolean v3, v1, Ll/xzg0;->f:Z

    .line 653
    .line 654
    if-eqz v3, :cond_20

    .line 655
    .line 656
    goto/16 :goto_1

    .line 657
    .line 658
    :cond_20
    iget-boolean v3, v13, Ll/ixg0;->c:Z

    .line 659
    .line 660
    if-eqz v3, :cond_22

    .line 661
    .line 662
    add-int/lit8 v3, v4, 0x1

    .line 663
    .line 664
    const/4 v5, 0x1

    .line 665
    if-ge v4, v5, :cond_21

    .line 666
    .line 667
    iget-object v4, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 668
    .line 669
    iget-object v5, v1, Ll/xzg0;->b:Ll/aug0;

    .line 670
    .line 671
    iget v5, v5, Ll/aug0;->b:I

    .line 672
    .line 673
    invoke-interface {v4, v5}, Ll/ehg0;->remove(I)V

    .line 674
    .line 675
    .line 676
    move v4, v3

    .line 677
    const/4 v3, 0x1

    .line 678
    goto :goto_e

    .line 679
    :cond_21
    move v4, v3

    .line 680
    :cond_22
    const/4 v3, 0x0

    .line 681
    :goto_e
    if-nez v3, :cond_0

    .line 682
    .line 683
    goto/16 :goto_1

    .line 684
    .line 685
    :goto_f
    :try_start_5
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 686
    .line 687
    .line 688
    move-result v2

    .line 689
    const/4 v4, 0x0

    .line 690
    :goto_10
    if-ge v4, v2, :cond_23

    .line 691
    .line 692
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 693
    .line 694
    .line 695
    move-result-object v6

    .line 696
    add-int/lit8 v4, v4, 0x1

    .line 697
    .line 698
    check-cast v6, Ljava/util/concurrent/Future;

    .line 699
    .line 700
    const/4 v7, 0x1

    .line 701
    invoke-interface {v6, v7}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 702
    .line 703
    .line 704
    goto :goto_10

    .line 705
    :catchall_1
    move-exception v0

    .line 706
    goto :goto_11

    .line 707
    :cond_23
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 708
    :goto_11
    iget-object v1, v1, Ll/xzg0;->d:Ljava/util/ArrayList;

    .line 709
    .line 710
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 711
    .line 712
    .line 713
    throw v0

    .line 714
    :cond_24
    :try_start_6
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 715
    .line 716
    new-instance v2, Ljava/lang/StringBuilder;

    .line 717
    .line 718
    const-string v3, "No cause find with resumable: "

    .line 719
    .line 720
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 721
    .line 722
    .line 723
    iget-boolean v3, v5, Ll/rqg0;->b:Z

    .line 724
    .line 725
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 726
    .line 727
    .line 728
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 729
    .line 730
    .line 731
    move-result-object v2

    .line 732
    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 733
    .line 734
    .line 735
    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 736
    :goto_12
    iput-boolean v5, v13, Ll/ixg0;->f:Z

    .line 737
    .line 738
    iput-object v0, v13, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 739
    .line 740
    goto/16 :goto_0

    .line 741
    .line 742
    :catch_3
    move-exception v0

    .line 743
    invoke-virtual {v13, v0}, Ll/ixg0;->b(Ljava/lang/Exception;)V

    .line 744
    .line 745
    .line 746
    goto/16 :goto_0

    .line 747
    .line 748
    :goto_13
    new-instance v2, Ll/ntg0;

    .line 749
    .line 750
    invoke-direct {v2, v0}, Ll/ntg0;-><init>(Ljava/io/IOException;)V

    .line 751
    .line 752
    .line 753
    iput-object v2, v1, Ll/xzg0;->e:Ll/ixg0;

    .line 754
    .line 755
    goto/16 :goto_0

    .line 756
    .line 757
    :goto_14
    iput-boolean v5, v1, Ll/xzg0;->g:Z

    .line 758
    .line 759
    iget-object v0, v1, Ll/xzg0;->d:Ljava/util/ArrayList;

    .line 760
    .line 761
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 762
    .line 763
    .line 764
    iget-object v0, v1, Ll/xzg0;->e:Ll/ixg0;

    .line 765
    .line 766
    iget-boolean v2, v1, Ll/xzg0;->f:Z

    .line 767
    .line 768
    if-nez v2, :cond_2d

    .line 769
    .line 770
    if-nez v0, :cond_25

    .line 771
    .line 772
    goto/16 :goto_19

    .line 773
    .line 774
    :cond_25
    iget-boolean v2, v0, Ll/ixg0;->e:Z

    .line 775
    .line 776
    if-nez v2, :cond_29

    .line 777
    .line 778
    iget-boolean v2, v0, Ll/ixg0;->f:Z

    .line 779
    .line 780
    if-nez v2, :cond_29

    .line 781
    .line 782
    iget-boolean v2, v0, Ll/ixg0;->c:Z

    .line 783
    .line 784
    if-eqz v2, :cond_26

    .line 785
    .line 786
    goto :goto_16

    .line 787
    :cond_26
    iget-boolean v2, v0, Ll/ixg0;->g:Z

    .line 788
    .line 789
    const/4 v3, 0x0

    .line 790
    if-eqz v2, :cond_27

    .line 791
    .line 792
    const/4 v7, 0x4

    .line 793
    :goto_15
    const/4 v2, 0x3

    .line 794
    goto :goto_17

    .line 795
    :cond_27
    iget-boolean v2, v0, Ll/ixg0;->h:Z

    .line 796
    .line 797
    if-eqz v2, :cond_28

    .line 798
    .line 799
    iget-object v3, v0, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 800
    .line 801
    const/4 v7, 0x6

    .line 802
    goto :goto_15

    .line 803
    :cond_28
    const/4 v2, 0x3

    .line 804
    const/4 v7, 0x1

    .line 805
    goto :goto_17

    .line 806
    :cond_29
    :goto_16
    iget-object v3, v0, Ll/ixg0;->i:Ljava/lang/Exception;

    .line 807
    .line 808
    const/4 v2, 0x3

    .line 809
    const/4 v7, 0x2

    .line 810
    :goto_17
    if-eq v7, v2, :cond_2c

    .line 811
    .line 812
    monitor-enter p0

    .line 813
    :try_start_7
    iget-boolean v2, v1, Ll/xzg0;->f:Z

    .line 814
    .line 815
    if-eqz v2, :cond_2a

    .line 816
    .line 817
    monitor-exit p0

    .line 818
    goto :goto_19

    .line 819
    :catchall_2
    move-exception v0

    .line 820
    goto :goto_18

    .line 821
    :cond_2a
    const/4 v5, 0x1

    .line 822
    iput-boolean v5, v1, Ll/xzg0;->g:Z

    .line 823
    .line 824
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 825
    iget-object v2, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 826
    .line 827
    iget-object v4, v1, Ll/xzg0;->b:Ll/aug0;

    .line 828
    .line 829
    iget v4, v4, Ll/aug0;->b:I

    .line 830
    .line 831
    invoke-interface {v2, v4, v7}, Ll/ehg0;->e(II)V

    .line 832
    .line 833
    .line 834
    if-ne v7, v5, :cond_2b

    .line 835
    .line 836
    iget-object v2, v1, Ll/xzg0;->i:Ll/ehg0;

    .line 837
    .line 838
    iget-object v4, v1, Ll/xzg0;->b:Ll/aug0;

    .line 839
    .line 840
    iget v4, v4, Ll/aug0;->b:I

    .line 841
    .line 842
    invoke-interface {v2, v4}, Ll/ehg0;->d(I)Z

    .line 843
    .line 844
    .line 845
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 846
    .line 847
    .line 848
    move-result-object v2

    .line 849
    iget-object v2, v2, Ll/jwg0;->f:Ll/qhg0;

    .line 850
    .line 851
    invoke-virtual {v0}, Ll/ixg0;->a()Ll/vfg0;

    .line 852
    .line 853
    .line 854
    :cond_2b
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 855
    .line 856
    .line 857
    move-result-object v0

    .line 858
    iget-object v0, v0, Ll/jwg0;->b:Ll/d0h0;

    .line 859
    .line 860
    iget-object v0, v0, Ll/d0h0;->a:Ll/oyg0;

    .line 861
    .line 862
    iget-object v1, v1, Ll/xzg0;->b:Ll/aug0;

    .line 863
    .line 864
    invoke-virtual {v0, v1, v7, v3}, Ll/oyg0;->d(Ll/aug0;ILjava/lang/Exception;)V

    .line 865
    .line 866
    .line 867
    goto :goto_19

    .line 868
    :goto_18
    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 869
    throw v0

    .line 870
    :cond_2c
    new-instance v0, Ljava/lang/IllegalAccessError;

    .line 871
    .line 872
    const-string v1, "can\'t recognize cancelled on here"

    .line 873
    .line 874
    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    .line 875
    .line 876
    .line 877
    throw v0

    .line 878
    :cond_2d
    :goto_19
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/jwg0;->a:Ll/ieg0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-boolean v1, p0, Ll/xzg0;->c:Z

    .line 9
    .line 10
    iget-object v2, v0, Ll/ieg0;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v2, v0, Ll/ieg0;->e:Ljava/util/ArrayList;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_2

    .line 23
    :cond_0
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v2, v0, Ll/ieg0;->c:Ljava/util/ArrayList;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v2, v0, Ll/ieg0;->d:Ljava/util/ArrayList;

    .line 29
    .line 30
    :goto_0
    invoke-interface {v2, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_4

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    iget-boolean v2, p0, Ll/xzg0;->f:Z

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    iget-object v2, v0, Ll/ieg0;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 45
    .line 46
    .line 47
    :cond_2
    if-eqz v1, :cond_3

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/ieg0;->h()V

    .line 50
    .line 51
    .line 52
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    goto :goto_1

    .line 54
    :cond_3
    monitor-exit v0

    .line 55
    :goto_1
    iget-object p0, p0, Ll/xzg0;->b:Ll/aug0;

    .line 56
    .line 57
    iget p0, p0, Ll/aug0;->b:I

    .line 58
    .line 59
    return-void

    .line 60
    :cond_4
    :try_start_1
    new-instance p0, Ljava/lang/AssertionError;

    .line 61
    .line 62
    const-string v1, "Call wasn\'t in-flight!"

    .line 63
    .line 64
    invoke-direct {p0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    :goto_2
    monitor-exit v0

    .line 69
    throw p0
.end method

.method public final compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/xzg0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/xzg0;->b:Ll/aug0;

    .line 4
    .line 5
    iget p1, p1, Ll/aug0;->g:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/xzg0;->b:Ll/aug0;

    .line 8
    .line 9
    iget p0, p0, Ll/aug0;->g:I

    .line 10
    .line 11
    sub-int/2addr p1, p0

    .line 12
    return p1
.end method

.method public final f(Ll/bog0;Ll/rqg0;I)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Ll/xzg0;->b:Ll/aug0;

    .line 8
    .line 9
    iget-wide v4, v2, Ll/rqg0;->d:J

    .line 10
    .line 11
    iget-boolean v2, v2, Ll/rqg0;->a:Z

    .line 12
    .line 13
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    iget-object v6, v6, Ll/jwg0;->g:Ll/nmg0;

    .line 18
    .line 19
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    iget-object v6, v6, Ll/jwg0;->e:Ll/zqg0;

    .line 24
    .line 25
    if-eqz v2, :cond_5

    .line 26
    .line 27
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v2, v2, Ll/jwg0;->g:Ll/nmg0;

    .line 32
    .line 33
    iget-object v2, v3, Ll/aug0;->l:Ljava/lang/Integer;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    const-wide/32 v2, 0x100000

    .line 43
    .line 44
    .line 45
    cmp-long v2, v4, v2

    .line 46
    .line 47
    if-gez v2, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-wide/32 v2, 0x500000

    .line 51
    .line 52
    .line 53
    cmp-long v2, v4, v2

    .line 54
    .line 55
    if-gez v2, :cond_2

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    goto :goto_1

    .line 59
    :cond_2
    const-wide/32 v2, 0x3200000

    .line 60
    .line 61
    .line 62
    cmp-long v2, v4, v2

    .line 63
    .line 64
    if-gez v2, :cond_3

    .line 65
    .line 66
    const/4 v2, 0x3

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    const-wide/32 v2, 0x6400000

    .line 69
    .line 70
    .line 71
    cmp-long v2, v4, v2

    .line 72
    .line 73
    if-gez v2, :cond_4

    .line 74
    .line 75
    const/4 v2, 0x4

    .line 76
    goto :goto_1

    .line 77
    :cond_4
    const/4 v2, 0x5

    .line 78
    goto :goto_1

    .line 79
    :cond_5
    :goto_0
    const/4 v2, 0x1

    .line 80
    :goto_1
    iget-object v3, v1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 83
    .line 84
    .line 85
    int-to-long v6, v2

    .line 86
    div-long v8, v4, v6

    .line 87
    .line 88
    const-wide/16 v10, 0x0

    .line 89
    .line 90
    const/4 v3, 0x0

    .line 91
    move-wide v12, v10

    .line 92
    :goto_2
    if-ge v3, v2, :cond_7

    .line 93
    .line 94
    add-long v15, v10, v12

    .line 95
    .line 96
    if-nez v3, :cond_6

    .line 97
    .line 98
    rem-long v10, v4, v6

    .line 99
    .line 100
    add-long/2addr v10, v8

    .line 101
    move-wide/from16 v17, v10

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_6
    move-wide/from16 v17, v8

    .line 105
    .line 106
    :goto_3
    new-instance v14, Ll/akg0;

    .line 107
    .line 108
    const-wide/16 v19, 0x0

    .line 109
    .line 110
    invoke-direct/range {v14 .. v20}, Ll/akg0;-><init>(JJJ)V

    .line 111
    .line 112
    .line 113
    iget-object v10, v1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    add-int/lit8 v3, v3, 0x1

    .line 119
    .line 120
    move-wide v10, v15

    .line 121
    move-wide/from16 v12, v17

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_7
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget-object v2, v2, Ll/jwg0;->b:Ll/d0h0;

    .line 129
    .line 130
    iget-object v2, v2, Ll/d0h0;->a:Ll/oyg0;

    .line 131
    .line 132
    iget-object v0, v0, Ll/xzg0;->b:Ll/aug0;

    .line 133
    .line 134
    move/from16 v3, p3

    .line 135
    .line 136
    invoke-virtual {v2, v0, v1, v3}, Ll/oyg0;->g(Ll/aug0;Ll/bog0;I)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final g()Z
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/xzg0;->f:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto/16 :goto_3

    .line 11
    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/xzg0;->g:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return v1

    .line 18
    :cond_1
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/xzg0;->f:Z

    .line 20
    .line 21
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v2, v2, Ll/jwg0;->a:Ll/ieg0;

    .line 30
    .line 31
    invoke-virtual {v2, p0}, Ll/ieg0;->e(Ll/xzg0;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Ll/xzg0;->e:Ll/ixg0;

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iput-boolean v0, v2, Ll/ixg0;->d:Z

    .line 39
    .line 40
    :cond_2
    iget-object v3, p0, Ll/xzg0;->d:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    if-eqz v3, :cond_6

    .line 47
    .line 48
    array-length v4, v3

    .line 49
    if-nez v4, :cond_3

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_3
    array-length v4, v3

    .line 53
    :goto_0
    if-ge v1, v4, :cond_7

    .line 54
    .line 55
    aget-object v5, v3, v1

    .line 56
    .line 57
    instance-of v6, v5, Ll/jgg0;

    .line 58
    .line 59
    if-eqz v6, :cond_5

    .line 60
    .line 61
    check-cast v5, Ll/jgg0;

    .line 62
    .line 63
    iget-object v6, v5, Ll/jgg0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 64
    .line 65
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    if-nez v6, :cond_5

    .line 70
    .line 71
    iget-object v6, v5, Ll/jgg0;->l:Ljava/lang/Thread;

    .line 72
    .line 73
    if-nez v6, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    iget-object v5, v5, Ll/jgg0;->l:Ljava/lang/Thread;

    .line 77
    .line 78
    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    .line 79
    .line 80
    .line 81
    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    :goto_2
    iget-object v1, p0, Ll/xzg0;->h:Ljava/lang/Thread;

    .line 85
    .line 86
    if-eqz v1, :cond_7

    .line 87
    .line 88
    iget-object v1, p0, Ll/xzg0;->b:Ll/aug0;

    .line 89
    .line 90
    iget v1, v1, Ll/aug0;->b:I

    .line 91
    .line 92
    iget-object v1, p0, Ll/xzg0;->h:Ljava/lang/Thread;

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 95
    .line 96
    .line 97
    :cond_7
    if-eqz v2, :cond_8

    .line 98
    .line 99
    invoke-virtual {v2}, Ll/ixg0;->a()Ll/vfg0;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    .line 105
    .line 106
    sget-object v2, Ll/vfg0;->y:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 107
    .line 108
    new-instance v3, Ll/czg0;

    .line 109
    .line 110
    invoke-direct {v3, v1}, Ll/czg0;-><init>(Ll/vfg0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 114
    .line 115
    .line 116
    :cond_8
    iget-object p0, p0, Ll/xzg0;->b:Ll/aug0;

    .line 117
    .line 118
    iget p0, p0, Ll/aug0;->b:I

    .line 119
    .line 120
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 121
    .line 122
    .line 123
    return v0

    .line 124
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    throw v0
.end method

.class public final Ll/sry0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:J

.field public B:J

.field public C:J

.field public D:Z

.field public E:J

.field public F:J

.field public G:Z

.field public H:J

.field public I:Ll/mfv0;

.field public final a:Ll/qry0;

.field public final b:[J

.field public c:Landroid/media/AudioTrack;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:I

.field public e:Ll/ory0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:I

.field public g:Z

.field public h:J

.field public i:F

.field public j:Z

.field public k:J

.field public l:J

.field public m:Ljava/lang/reflect/Method;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public n:J

.field public o:Z

.field public p:Z

.field public q:J

.field public r:J

.field public s:J

.field public t:J

.field public u:J

.field public v:I

.field public w:I

.field public x:J

.field public y:J

.field public z:J


# direct methods
.method public constructor <init>(Ll/qry0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sry0;->a:Ll/qry0;

    .line 5
    .line 6
    sget p1, Ll/mpw0;->a:I

    .line 7
    .line 8
    :try_start_0
    const-class p1, Landroid/media/AudioTrack;

    .line 9
    .line 10
    const-string v0, "getLatency"

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/sry0;->m:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    const/16 p1, 0xa

    .line 20
    .line 21
    new-array p1, p1, [J

    .line 22
    .line 23
    iput-object p1, p0, Ll/sry0;->b:[J

    .line 24
    .line 25
    sget-object p1, Ll/mfv0;->a:Ll/mfv0;

    .line 26
    .line 27
    iput-object p1, p0, Ll/sry0;->I:Ll/mfv0;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a(Z)J
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/media/AudioTrack;->getPlayState()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x3

    .line 13
    const/4 v3, 0x1

    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    const-wide/16 v6, 0x3e8

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    div-long/2addr v1, v6

    .line 25
    iget-wide v8, v0, Ll/sry0;->l:J

    .line 26
    .line 27
    sub-long v8, v1, v8

    .line 28
    .line 29
    const-wide/16 v10, 0x7530

    .line 30
    .line 31
    cmp-long v8, v8, v10

    .line 32
    .line 33
    if-ltz v8, :cond_3

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/sry0;->m()J

    .line 36
    .line 37
    .line 38
    move-result-wide v8

    .line 39
    cmp-long v10, v8, v4

    .line 40
    .line 41
    if-nez v10, :cond_1

    .line 42
    .line 43
    :cond_0
    move-wide/from16 v19, v6

    .line 44
    .line 45
    goto/16 :goto_4

    .line 46
    .line 47
    :cond_1
    iget-object v10, v0, Ll/sry0;->b:[J

    .line 48
    .line 49
    iget v11, v0, Ll/sry0;->v:I

    .line 50
    .line 51
    iget v12, v0, Ll/sry0;->i:F

    .line 52
    .line 53
    invoke-static {v8, v9, v12}, Ll/mpw0;->E(JF)J

    .line 54
    .line 55
    .line 56
    move-result-wide v8

    .line 57
    sub-long/2addr v8, v1

    .line 58
    aput-wide v8, v10, v11

    .line 59
    .line 60
    iget v8, v0, Ll/sry0;->v:I

    .line 61
    .line 62
    add-int/2addr v8, v3

    .line 63
    const/16 v9, 0xa

    .line 64
    .line 65
    rem-int/2addr v8, v9

    .line 66
    iput v8, v0, Ll/sry0;->v:I

    .line 67
    .line 68
    iget v8, v0, Ll/sry0;->w:I

    .line 69
    .line 70
    if-ge v8, v9, :cond_2

    .line 71
    .line 72
    add-int/2addr v8, v3

    .line 73
    iput v8, v0, Ll/sry0;->w:I

    .line 74
    .line 75
    :cond_2
    iput-wide v1, v0, Ll/sry0;->l:J

    .line 76
    .line 77
    iput-wide v4, v0, Ll/sry0;->k:J

    .line 78
    .line 79
    const/4 v8, 0x0

    .line 80
    :goto_0
    iget v9, v0, Ll/sry0;->w:I

    .line 81
    .line 82
    if-ge v8, v9, :cond_3

    .line 83
    .line 84
    iget-wide v10, v0, Ll/sry0;->k:J

    .line 85
    .line 86
    iget-object v12, v0, Ll/sry0;->b:[J

    .line 87
    .line 88
    int-to-long v13, v9

    .line 89
    aget-wide v15, v12, v8

    .line 90
    .line 91
    div-long/2addr v15, v13

    .line 92
    add-long/2addr v10, v15

    .line 93
    iput-wide v10, v0, Ll/sry0;->k:J

    .line 94
    .line 95
    add-int/lit8 v8, v8, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    iget-boolean v8, v0, Ll/sry0;->g:Z

    .line 99
    .line 100
    if-nez v8, :cond_0

    .line 101
    .line 102
    iget-object v8, v0, Ll/sry0;->e:Ll/ory0;

    .line 103
    .line 104
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v8, v1, v2}, Ll/ory0;->g(J)Z

    .line 108
    .line 109
    .line 110
    move-result v9

    .line 111
    const-string v10, "DefaultAudioSink"

    .line 112
    .line 113
    if-nez v9, :cond_4

    .line 114
    .line 115
    move-wide/from16 v19, v6

    .line 116
    .line 117
    const-wide/32 v17, 0x4c4b40

    .line 118
    .line 119
    .line 120
    goto/16 :goto_2

    .line 121
    .line 122
    :cond_4
    invoke-virtual {v8}, Ll/ory0;->b()J

    .line 123
    .line 124
    .line 125
    move-result-wide v13

    .line 126
    move-wide v15, v6

    .line 127
    invoke-virtual {v8}, Ll/ory0;->a()J

    .line 128
    .line 129
    .line 130
    move-result-wide v6

    .line 131
    const-wide/32 v17, 0x4c4b40

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0}, Ll/sry0;->m()J

    .line 135
    .line 136
    .line 137
    move-result-wide v11

    .line 138
    sub-long v19, v13, v1

    .line 139
    .line 140
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(J)J

    .line 141
    .line 142
    .line 143
    move-result-wide v19

    .line 144
    cmp-long v9, v19, v17

    .line 145
    .line 146
    move-wide/from16 v19, v15

    .line 147
    .line 148
    const-string v15, ", "

    .line 149
    .line 150
    if-lez v9, :cond_5

    .line 151
    .line 152
    iget-object v9, v0, Ll/sry0;->a:Ll/qry0;

    .line 153
    .line 154
    check-cast v9, Ll/msy0;

    .line 155
    .line 156
    iget-object v9, v9, Ll/msy0;->a:Ll/jty0;

    .line 157
    .line 158
    invoke-static {v9}, Ll/jty0;->s(Ll/jty0;)J

    .line 159
    .line 160
    .line 161
    move-result-wide v3

    .line 162
    move-object v5, v8

    .line 163
    invoke-static {v9}, Ll/jty0;->t(Ll/jty0;)J

    .line 164
    .line 165
    .line 166
    move-result-wide v8

    .line 167
    move-object/from16 v21, v5

    .line 168
    .line 169
    new-instance v5, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v0, "Spurious audio timestamp (system clock mismatch): "

    .line 172
    .line 173
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v5, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v5, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {v10, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual/range {v21 .. v21}, Ll/ory0;->d()V

    .line 217
    .line 218
    .line 219
    :goto_1
    move-object/from16 v0, p0

    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_5
    move-object/from16 v21, v8

    .line 223
    .line 224
    iget v3, v0, Ll/sry0;->f:I

    .line 225
    .line 226
    invoke-static {v6, v7, v3}, Ll/mpw0;->G(JI)J

    .line 227
    .line 228
    .line 229
    move-result-wide v3

    .line 230
    sub-long/2addr v3, v11

    .line 231
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    .line 232
    .line 233
    .line 234
    move-result-wide v3

    .line 235
    cmp-long v3, v3, v17

    .line 236
    .line 237
    if-lez v3, :cond_6

    .line 238
    .line 239
    iget-object v3, v0, Ll/sry0;->a:Ll/qry0;

    .line 240
    .line 241
    check-cast v3, Ll/msy0;

    .line 242
    .line 243
    iget-object v3, v3, Ll/msy0;->a:Ll/jty0;

    .line 244
    .line 245
    invoke-static {v3}, Ll/jty0;->s(Ll/jty0;)J

    .line 246
    .line 247
    .line 248
    move-result-wide v4

    .line 249
    invoke-static {v3}, Ll/jty0;->t(Ll/jty0;)J

    .line 250
    .line 251
    .line 252
    move-result-wide v8

    .line 253
    new-instance v3, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v0, "Spurious audio timestamp (frame position mismatch): "

    .line 256
    .line 257
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v3, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v3, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-static {v10, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual/range {v21 .. v21}, Ll/ory0;->d()V

    .line 301
    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_6
    invoke-virtual/range {v21 .. v21}, Ll/ory0;->c()V

    .line 305
    .line 306
    .line 307
    goto :goto_1

    .line 308
    :goto_2
    iget-boolean v3, v0, Ll/sry0;->p:Z

    .line 309
    .line 310
    if-eqz v3, :cond_9

    .line 311
    .line 312
    iget-object v3, v0, Ll/sry0;->m:Ljava/lang/reflect/Method;

    .line 313
    .line 314
    if-eqz v3, :cond_9

    .line 315
    .line 316
    iget-wide v4, v0, Ll/sry0;->q:J

    .line 317
    .line 318
    sub-long v4, v1, v4

    .line 319
    .line 320
    const-wide/32 v6, 0x7a120

    .line 321
    .line 322
    .line 323
    cmp-long v4, v4, v6

    .line 324
    .line 325
    if-ltz v4, :cond_9

    .line 326
    .line 327
    const/4 v4, 0x0

    .line 328
    :try_start_0
    iget-object v5, v0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 329
    .line 330
    if-eqz v5, :cond_7

    .line 331
    .line 332
    invoke-virtual {v3, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    check-cast v3, Ljava/lang/Integer;

    .line 337
    .line 338
    sget v5, Ll/mpw0;->a:I

    .line 339
    .line 340
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    int-to-long v5, v3

    .line 345
    mul-long v5, v5, v19

    .line 346
    .line 347
    iget-wide v7, v0, Ll/sry0;->h:J

    .line 348
    .line 349
    sub-long/2addr v5, v7

    .line 350
    iput-wide v5, v0, Ll/sry0;->n:J

    .line 351
    .line 352
    const-wide/16 v7, 0x0

    .line 353
    .line 354
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 355
    .line 356
    .line 357
    move-result-wide v5

    .line 358
    iput-wide v5, v0, Ll/sry0;->n:J

    .line 359
    .line 360
    cmp-long v3, v5, v17

    .line 361
    .line 362
    if-lez v3, :cond_8

    .line 363
    .line 364
    new-instance v3, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 367
    .line 368
    .line 369
    const-string v7, "Ignoring impossibly large audio latency: "

    .line 370
    .line 371
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v3

    .line 381
    invoke-static {v10, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    const-wide/16 v7, 0x0

    .line 385
    .line 386
    iput-wide v7, v0, Ll/sry0;->n:J

    .line 387
    .line 388
    goto :goto_3

    .line 389
    :cond_7
    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    :catch_0
    iput-object v4, v0, Ll/sry0;->m:Ljava/lang/reflect/Method;

    .line 391
    .line 392
    :cond_8
    :goto_3
    iput-wide v1, v0, Ll/sry0;->q:J

    .line 393
    .line 394
    :cond_9
    :goto_4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 395
    .line 396
    .line 397
    move-result-wide v1

    .line 398
    div-long v1, v1, v19

    .line 399
    .line 400
    iget-object v3, v0, Ll/sry0;->e:Ll/ory0;

    .line 401
    .line 402
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v3}, Ll/ory0;->f()Z

    .line 406
    .line 407
    .line 408
    move-result v4

    .line 409
    if-eqz v4, :cond_a

    .line 410
    .line 411
    invoke-virtual {v3}, Ll/ory0;->a()J

    .line 412
    .line 413
    .line 414
    move-result-wide v5

    .line 415
    iget v7, v0, Ll/sry0;->f:I

    .line 416
    .line 417
    invoke-static {v5, v6, v7}, Ll/mpw0;->G(JI)J

    .line 418
    .line 419
    .line 420
    move-result-wide v5

    .line 421
    invoke-virtual {v3}, Ll/ory0;->b()J

    .line 422
    .line 423
    .line 424
    move-result-wide v7

    .line 425
    sub-long v7, v1, v7

    .line 426
    .line 427
    iget v3, v0, Ll/sry0;->i:F

    .line 428
    .line 429
    invoke-static {v7, v8, v3}, Ll/mpw0;->D(JF)J

    .line 430
    .line 431
    .line 432
    move-result-wide v7

    .line 433
    add-long/2addr v5, v7

    .line 434
    goto :goto_6

    .line 435
    :cond_a
    iget v3, v0, Ll/sry0;->w:I

    .line 436
    .line 437
    if-nez v3, :cond_b

    .line 438
    .line 439
    invoke-virtual {v0}, Ll/sry0;->m()J

    .line 440
    .line 441
    .line 442
    move-result-wide v5

    .line 443
    goto :goto_5

    .line 444
    :cond_b
    iget-wide v5, v0, Ll/sry0;->k:J

    .line 445
    .line 446
    add-long/2addr v5, v1

    .line 447
    iget v3, v0, Ll/sry0;->i:F

    .line 448
    .line 449
    invoke-static {v5, v6, v3}, Ll/mpw0;->D(JF)J

    .line 450
    .line 451
    .line 452
    move-result-wide v5

    .line 453
    :goto_5
    if-nez p1, :cond_c

    .line 454
    .line 455
    iget-wide v7, v0, Ll/sry0;->n:J

    .line 456
    .line 457
    sub-long/2addr v5, v7

    .line 458
    const-wide/16 v7, 0x0

    .line 459
    .line 460
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 461
    .line 462
    .line 463
    move-result-wide v5

    .line 464
    :cond_c
    :goto_6
    iget-boolean v3, v0, Ll/sry0;->D:Z

    .line 465
    .line 466
    if-eq v3, v4, :cond_d

    .line 467
    .line 468
    iget-wide v7, v0, Ll/sry0;->C:J

    .line 469
    .line 470
    iput-wide v7, v0, Ll/sry0;->F:J

    .line 471
    .line 472
    iget-wide v7, v0, Ll/sry0;->B:J

    .line 473
    .line 474
    iput-wide v7, v0, Ll/sry0;->E:J

    .line 475
    .line 476
    :cond_d
    iget-wide v7, v0, Ll/sry0;->F:J

    .line 477
    .line 478
    sub-long v7, v1, v7

    .line 479
    .line 480
    const-wide/32 v9, 0xf4240

    .line 481
    .line 482
    .line 483
    cmp-long v3, v7, v9

    .line 484
    .line 485
    if-gez v3, :cond_e

    .line 486
    .line 487
    iget-wide v11, v0, Ll/sry0;->E:J

    .line 488
    .line 489
    iget v3, v0, Ll/sry0;->i:F

    .line 490
    .line 491
    invoke-static {v7, v8, v3}, Ll/mpw0;->D(JF)J

    .line 492
    .line 493
    .line 494
    move-result-wide v13

    .line 495
    add-long/2addr v11, v13

    .line 496
    mul-long v7, v7, v19

    .line 497
    .line 498
    div-long/2addr v7, v9

    .line 499
    mul-long/2addr v5, v7

    .line 500
    sub-long v7, v19, v7

    .line 501
    .line 502
    mul-long/2addr v7, v11

    .line 503
    add-long/2addr v5, v7

    .line 504
    div-long v5, v5, v19

    .line 505
    .line 506
    :cond_e
    iget-boolean v3, v0, Ll/sry0;->j:Z

    .line 507
    .line 508
    if-nez v3, :cond_f

    .line 509
    .line 510
    iget-wide v7, v0, Ll/sry0;->B:J

    .line 511
    .line 512
    cmp-long v3, v5, v7

    .line 513
    .line 514
    if-lez v3, :cond_f

    .line 515
    .line 516
    const/4 v3, 0x1

    .line 517
    iput-boolean v3, v0, Ll/sry0;->j:Z

    .line 518
    .line 519
    sub-long v7, v5, v7

    .line 520
    .line 521
    sget v3, Ll/mpw0;->a:I

    .line 522
    .line 523
    iget v3, v0, Ll/sry0;->i:F

    .line 524
    .line 525
    invoke-static {v7, v8}, Ll/mpw0;->I(J)J

    .line 526
    .line 527
    .line 528
    move-result-wide v7

    .line 529
    invoke-static {v7, v8, v3}, Ll/mpw0;->E(JF)J

    .line 530
    .line 531
    .line 532
    move-result-wide v7

    .line 533
    invoke-static {v7, v8}, Ll/mpw0;->I(J)J

    .line 534
    .line 535
    .line 536
    move-result-wide v7

    .line 537
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 538
    .line 539
    .line 540
    move-result-wide v9

    .line 541
    sub-long/2addr v9, v7

    .line 542
    iget-object v3, v0, Ll/sry0;->a:Ll/qry0;

    .line 543
    .line 544
    check-cast v3, Ll/msy0;

    .line 545
    .line 546
    iget-object v3, v3, Ll/msy0;->a:Ll/jty0;

    .line 547
    .line 548
    invoke-static {v3}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 549
    .line 550
    .line 551
    move-result-object v7

    .line 552
    if-eqz v7, :cond_f

    .line 553
    .line 554
    invoke-static {v3}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 555
    .line 556
    .line 557
    move-result-object v3

    .line 558
    check-cast v3, Ll/oty0;

    .line 559
    .line 560
    iget-object v3, v3, Ll/oty0;->a:Ll/pty0;

    .line 561
    .line 562
    invoke-static {v3}, Ll/pty0;->U0(Ll/pty0;)Ll/fqy0;

    .line 563
    .line 564
    .line 565
    move-result-object v3

    .line 566
    invoke-virtual {v3, v9, v10}, Ll/fqy0;->v(J)V

    .line 567
    .line 568
    .line 569
    :cond_f
    iput-wide v1, v0, Ll/sry0;->C:J

    .line 570
    .line 571
    iput-wide v5, v0, Ll/sry0;->B:J

    .line 572
    .line 573
    iput-boolean v4, v0, Ll/sry0;->D:Z

    .line 574
    .line 575
    return-wide v5
.end method

.method public final b(J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/sry0;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/sry0;->z:J

    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Ll/sry0;->x:J

    .line 16
    .line 17
    iput-wide p1, p0, Ll/sry0;->A:J

    .line 18
    .line 19
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/sry0;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 6
    .line 7
    iput-object v0, p0, Ll/sry0;->e:Ll/ory0;

    .line 8
    .line 9
    return-void
.end method

.method public final d(Landroid/media/AudioTrack;ZIII)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    iput p5, p0, Ll/sry0;->d:I

    .line 4
    .line 5
    new-instance v0, Ll/ory0;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/ory0;-><init>(Landroid/media/AudioTrack;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/sry0;->e:Ll/ory0;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getSampleRate()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Ll/sry0;->f:I

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    sget p2, Ll/mpw0;->a:I

    .line 22
    .line 23
    const/16 v0, 0x17

    .line 24
    .line 25
    if-ge p2, v0, :cond_0

    .line 26
    .line 27
    const/4 p2, 0x5

    .line 28
    const/4 v0, 0x1

    .line 29
    if-eq p3, p2, :cond_1

    .line 30
    .line 31
    const/4 p2, 0x6

    .line 32
    if-ne p3, p2, :cond_0

    .line 33
    .line 34
    move p3, p2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v0, p1

    .line 37
    :cond_1
    :goto_0
    iput-boolean v0, p0, Ll/sry0;->g:Z

    .line 38
    .line 39
    invoke-static {p3}, Ll/mpw0;->h(I)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iput-boolean p2, p0, Ll/sry0;->p:Z

    .line 44
    .line 45
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    if-eqz p2, :cond_2

    .line 51
    .line 52
    div-int/2addr p5, p4

    .line 53
    int-to-long p2, p5

    .line 54
    iget p4, p0, Ll/sry0;->f:I

    .line 55
    .line 56
    invoke-static {p2, p3, p4}, Ll/mpw0;->G(JI)J

    .line 57
    .line 58
    .line 59
    move-result-wide p2

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    move-wide p2, v0

    .line 62
    :goto_1
    iput-wide p2, p0, Ll/sry0;->h:J

    .line 63
    .line 64
    const-wide/16 p2, 0x0

    .line 65
    .line 66
    iput-wide p2, p0, Ll/sry0;->s:J

    .line 67
    .line 68
    iput-wide p2, p0, Ll/sry0;->t:J

    .line 69
    .line 70
    iput-boolean p1, p0, Ll/sry0;->G:Z

    .line 71
    .line 72
    iput-wide p2, p0, Ll/sry0;->H:J

    .line 73
    .line 74
    iput-wide p2, p0, Ll/sry0;->u:J

    .line 75
    .line 76
    iput-boolean p1, p0, Ll/sry0;->o:Z

    .line 77
    .line 78
    iput-wide v0, p0, Ll/sry0;->x:J

    .line 79
    .line 80
    iput-wide v0, p0, Ll/sry0;->y:J

    .line 81
    .line 82
    iput-wide p2, p0, Ll/sry0;->q:J

    .line 83
    .line 84
    iput-wide p2, p0, Ll/sry0;->n:J

    .line 85
    .line 86
    const/high16 p1, 0x3f800000    # 1.0f

    .line 87
    .line 88
    iput p1, p0, Ll/sry0;->i:F

    .line 89
    .line 90
    return-void
.end method

.method public final e(Ll/mfv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sry0;->I:Ll/mfv0;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/sry0;->x:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    iput-wide v0, p0, Ll/sry0;->x:J

    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/sry0;->e:Ll/ory0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ory0;->e()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final g(J)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/sry0;->a(Z)J

    .line 3
    .line 4
    .line 5
    move-result-wide v1

    .line 6
    iget v3, p0, Ll/sry0;->f:I

    .line 7
    .line 8
    invoke-static {v1, v2, v3}, Ll/mpw0;->C(JI)J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    cmp-long p1, p1, v1

    .line 13
    .line 14
    if-gtz p1, :cond_1

    .line 15
    .line 16
    iget-boolean p1, p0, Ll/sry0;->g:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getPlayState()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 p2, 0x2

    .line 30
    if-ne p1, p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/sry0;->l()J

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    const-wide/16 v1, 0x0

    .line 37
    .line 38
    cmp-long p0, p0, v1

    .line 39
    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return v0

    .line 44
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, 0x3

    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final i(J)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/sry0;->y:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    cmp-long p1, p1, v0

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    iget-wide v0, p0, Ll/sry0;->y:J

    .line 23
    .line 24
    sub-long/2addr p1, v0

    .line 25
    const-wide/16 v0, 0xc8

    .line 26
    .line 27
    cmp-long p0, p1, v0

    .line 28
    .line 29
    if-ltz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final j(J)Z
    .locals 9

    .line 1
    iget-object v0, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-boolean v1, p0, Ll/sry0;->g:Z

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    const/4 v3, 0x0

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    iput-boolean v3, p0, Ll/sry0;->o:Z

    .line 20
    .line 21
    return v3

    .line 22
    :cond_0
    if-ne v0, v2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/sry0;->l()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    cmp-long v0, v0, v4

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    move v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return v3

    .line 37
    :cond_2
    :goto_0
    iget-boolean v1, p0, Ll/sry0;->o:Z

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Ll/sry0;->g(J)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput-boolean p1, p0, Ll/sry0;->o:Z

    .line 44
    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    if-eq v0, v2, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Ll/sry0;->a:Ll/qry0;

    .line 52
    .line 53
    iget v4, p0, Ll/sry0;->d:I

    .line 54
    .line 55
    iget-wide v0, p0, Ll/sry0;->h:J

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/mpw0;->I(J)J

    .line 58
    .line 59
    .line 60
    move-result-wide v5

    .line 61
    check-cast p1, Ll/msy0;

    .line 62
    .line 63
    iget-object p0, p1, Ll/msy0;->a:Ll/jty0;

    .line 64
    .line 65
    invoke-static {p0}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    invoke-static {p0}, Ll/jty0;->q(Ll/jty0;)J

    .line 76
    .line 77
    .line 78
    move-result-wide v7

    .line 79
    sub-long v7, v0, v7

    .line 80
    .line 81
    iget-object p0, p1, Ll/msy0;->a:Ll/jty0;

    .line 82
    .line 83
    invoke-static {p0}, Ll/jty0;->v(Ll/jty0;)Ll/nqy0;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Ll/oty0;

    .line 88
    .line 89
    iget-object p0, p0, Ll/oty0;->a:Ll/pty0;

    .line 90
    .line 91
    invoke-static {p0}, Ll/pty0;->U0(Ll/pty0;)Ll/fqy0;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual/range {v3 .. v8}, Ll/fqy0;->x(IJJ)V

    .line 96
    .line 97
    .line 98
    :cond_3
    return v2
.end method

.method public final k()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/sry0;->n()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Ll/sry0;->x:J

    .line 5
    .line 6
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/sry0;->e:Ll/ory0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ory0;->e()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/sry0;->l()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p0, Ll/sry0;->z:J

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public final l()J
    .locals 13

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/sry0;->x:J

    .line 6
    .line 7
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v2, v2, v4

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ne v2, v3, :cond_0

    .line 27
    .line 28
    iget-wide v0, p0, Ll/sry0;->z:J

    .line 29
    .line 30
    return-wide v0

    .line 31
    :cond_0
    invoke-static {v0, v1}, Ll/mpw0;->F(J)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    iget-wide v2, p0, Ll/sry0;->x:J

    .line 36
    .line 37
    sub-long/2addr v0, v2

    .line 38
    iget v2, p0, Ll/sry0;->i:F

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Ll/mpw0;->D(JF)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iget v2, p0, Ll/sry0;->f:I

    .line 45
    .line 46
    invoke-static {v0, v1, v2}, Ll/mpw0;->C(JI)J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    iget-wide v2, p0, Ll/sry0;->A:J

    .line 51
    .line 52
    iget-wide v4, p0, Ll/sry0;->z:J

    .line 53
    .line 54
    add-long/2addr v4, v0

    .line 55
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    return-wide v0

    .line 60
    :cond_1
    iget-wide v6, p0, Ll/sry0;->r:J

    .line 61
    .line 62
    sub-long v6, v0, v6

    .line 63
    .line 64
    const-wide/16 v8, 0x5

    .line 65
    .line 66
    cmp-long v2, v6, v8

    .line 67
    .line 68
    if-ltz v2, :cond_b

    .line 69
    .line 70
    iget-object v2, p0, Ll/sry0;->c:Landroid/media/AudioTrack;

    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    const/4 v7, 0x1

    .line 80
    if-ne v6, v7, :cond_2

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlaybackHeadPosition()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    int-to-long v7, v2

    .line 88
    iget-boolean v2, p0, Ll/sry0;->g:Z

    .line 89
    .line 90
    const-wide v9, 0xffffffffL

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    and-long/2addr v7, v9

    .line 96
    const-wide/16 v9, 0x0

    .line 97
    .line 98
    if-eqz v2, :cond_5

    .line 99
    .line 100
    if-ne v6, v3, :cond_3

    .line 101
    .line 102
    cmp-long v2, v7, v9

    .line 103
    .line 104
    if-nez v2, :cond_4

    .line 105
    .line 106
    iget-wide v11, p0, Ll/sry0;->s:J

    .line 107
    .line 108
    iput-wide v11, p0, Ll/sry0;->u:J

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    move v3, v6

    .line 112
    :cond_4
    :goto_0
    iget-wide v11, p0, Ll/sry0;->u:J

    .line 113
    .line 114
    add-long/2addr v7, v11

    .line 115
    move v6, v3

    .line 116
    :cond_5
    sget v2, Ll/mpw0;->a:I

    .line 117
    .line 118
    const/16 v3, 0x1d

    .line 119
    .line 120
    if-gt v2, v3, :cond_8

    .line 121
    .line 122
    cmp-long v2, v7, v9

    .line 123
    .line 124
    if-nez v2, :cond_6

    .line 125
    .line 126
    iget-wide v2, p0, Ll/sry0;->s:J

    .line 127
    .line 128
    cmp-long v2, v2, v9

    .line 129
    .line 130
    if-lez v2, :cond_7

    .line 131
    .line 132
    const/4 v2, 0x3

    .line 133
    if-ne v6, v2, :cond_7

    .line 134
    .line 135
    iget-wide v2, p0, Ll/sry0;->y:J

    .line 136
    .line 137
    cmp-long v2, v2, v4

    .line 138
    .line 139
    if-nez v2, :cond_a

    .line 140
    .line 141
    iput-wide v0, p0, Ll/sry0;->y:J

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_6
    move-wide v9, v7

    .line 145
    :cond_7
    iput-wide v4, p0, Ll/sry0;->y:J

    .line 146
    .line 147
    move-wide v7, v9

    .line 148
    :cond_8
    iget-wide v2, p0, Ll/sry0;->s:J

    .line 149
    .line 150
    cmp-long v2, v2, v7

    .line 151
    .line 152
    if-lez v2, :cond_9

    .line 153
    .line 154
    iget-wide v2, p0, Ll/sry0;->t:J

    .line 155
    .line 156
    const-wide/16 v4, 0x1

    .line 157
    .line 158
    add-long/2addr v2, v4

    .line 159
    iput-wide v2, p0, Ll/sry0;->t:J

    .line 160
    .line 161
    :cond_9
    iput-wide v7, p0, Ll/sry0;->s:J

    .line 162
    .line 163
    :cond_a
    :goto_1
    iput-wide v0, p0, Ll/sry0;->r:J

    .line 164
    .line 165
    :cond_b
    iget-wide v0, p0, Ll/sry0;->s:J

    .line 166
    .line 167
    iget-wide v2, p0, Ll/sry0;->H:J

    .line 168
    .line 169
    add-long/2addr v0, v2

    .line 170
    iget-wide v2, p0, Ll/sry0;->t:J

    .line 171
    .line 172
    const/16 p0, 0x20

    .line 173
    .line 174
    shl-long/2addr v2, p0

    .line 175
    add-long/2addr v0, v2

    .line 176
    return-wide v0
.end method

.method public final m()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/sry0;->l()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget p0, p0, Ll/sry0;->f:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/mpw0;->G(JI)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final n()V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/sry0;->k:J

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, p0, Ll/sry0;->w:I

    .line 7
    .line 8
    iput v2, p0, Ll/sry0;->v:I

    .line 9
    .line 10
    iput-wide v0, p0, Ll/sry0;->l:J

    .line 11
    .line 12
    iput-wide v0, p0, Ll/sry0;->C:J

    .line 13
    .line 14
    iput-wide v0, p0, Ll/sry0;->F:J

    .line 15
    .line 16
    iput-boolean v2, p0, Ll/sry0;->j:Z

    .line 17
    .line 18
    return-void
.end method

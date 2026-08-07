.class Ll/s410$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s410;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:J

.field final synthetic h:Ll/s410;


# direct methods
.method public constructor <init>(Ll/s410;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/s410$d;->a:I

    .line 8
    .line 9
    iput p1, p0, Ll/s410$d;->b:I

    .line 10
    .line 11
    iput p1, p0, Ll/s410$d;->c:I

    .line 12
    .line 13
    iput p1, p0, Ll/s410$d;->d:I

    .line 14
    .line 15
    iput p1, p0, Ll/s410$d;->e:I

    .line 16
    .line 17
    iput p1, p0, Ll/s410$d;->f:I

    .line 18
    .line 19
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    iput-wide v0, p0, Ll/s410$d;->g:J

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Ll/s410$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s410$d;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/s410$d;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/s410$d;->c:I

    .line 2
    .line 3
    return p0
.end method

.method private declared-synchronized e(I)V
    .locals 8

    .line 1
    const-string v0, "jzheng \u7f51\u7edc\u62e5\u585e\u89e3\u9664\u3002"

    .line 2
    .line 3
    const-string v1, "jzheng init current level "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 7
    .line 8
    invoke-static {v2}, Ll/s410;->q3(Ll/s410;)Ll/uow;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-boolean v2, v2, Ll/uow;->M0:Z

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 17
    .line 18
    invoke-static {v2}, Ll/s410;->l3(Ll/s410;)Z

    .line 19
    .line 20
    .line 21
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto/16 :goto_3

    .line 28
    .line 29
    :cond_0
    :try_start_1
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 30
    .line 31
    invoke-static {v2}, Ll/s410;->r3(Ll/s410;)Ll/uow;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget v2, v2, Ll/uow;->N0:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    if-gtz v2, :cond_1

    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :cond_1
    :try_start_2
    iget v2, p0, Ll/s410$d;->a:I

    .line 42
    .line 43
    const/4 v3, -0x1

    .line 44
    const/4 v4, 0x0

    .line 45
    const/4 v5, 0x1

    .line 46
    if-ne v2, v3, :cond_7

    .line 47
    .line 48
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 49
    .line 50
    invoke-static {v2}, Ll/s410;->s3(Ll/s410;)Ll/uow;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget v2, v2, Ll/tow;->m:I

    .line 55
    .line 56
    const/16 v3, 0x210

    .line 57
    .line 58
    if-ne v2, v3, :cond_2

    .line 59
    .line 60
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 61
    .line 62
    invoke-static {v2}, Ll/s410;->u3(Ll/s410;)Ll/uow;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget v2, v2, Ll/tow;->n:I

    .line 67
    .line 68
    const/16 v3, 0x3c0

    .line 69
    .line 70
    if-ne v2, v3, :cond_2

    .line 71
    .line 72
    const/4 v2, 0x2

    .line 73
    iput v2, p0, Ll/s410$d;->a:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 77
    .line 78
    invoke-static {v2}, Ll/s410;->v3(Ll/s410;)Ll/uow;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget v2, v2, Ll/tow;->m:I

    .line 83
    .line 84
    const/16 v3, 0x280

    .line 85
    .line 86
    const/16 v6, 0x160

    .line 87
    .line 88
    if-ne v2, v6, :cond_4

    .line 89
    .line 90
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 91
    .line 92
    invoke-static {v2}, Ll/s410;->w3(Ll/s410;)Ll/uow;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iget v2, v2, Ll/tow;->n:I

    .line 97
    .line 98
    if-ne v2, v3, :cond_4

    .line 99
    .line 100
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 101
    .line 102
    invoke-static {v2}, Ll/s410;->x3(Ll/s410;)Ll/uow;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget v2, v2, Ll/tow;->H:I

    .line 107
    .line 108
    const v7, 0xb71b0

    .line 109
    .line 110
    .line 111
    if-eq v2, v7, :cond_3

    .line 112
    .line 113
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 114
    .line 115
    invoke-static {v2}, Ll/s410;->y3(Ll/s410;)Ll/uow;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iget v2, v2, Ll/tow;->H:I

    .line 120
    .line 121
    const v7, 0xbb800

    .line 122
    .line 123
    .line 124
    if-ne v2, v7, :cond_4

    .line 125
    .line 126
    :cond_3
    iput v5, p0, Ll/s410$d;->a:I

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_4
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 130
    .line 131
    invoke-static {v2}, Ll/s410;->z3(Ll/s410;)Ll/uow;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iget v2, v2, Ll/tow;->m:I

    .line 136
    .line 137
    if-ne v2, v6, :cond_6

    .line 138
    .line 139
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 140
    .line 141
    invoke-static {v2}, Ll/s410;->A3(Ll/s410;)Ll/uow;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iget v2, v2, Ll/tow;->n:I

    .line 146
    .line 147
    if-ne v2, v3, :cond_6

    .line 148
    .line 149
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 150
    .line 151
    invoke-static {v2}, Ll/s410;->B3(Ll/s410;)Ll/uow;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    iget v2, v2, Ll/tow;->H:I

    .line 156
    .line 157
    const v3, 0x7a120

    .line 158
    .line 159
    .line 160
    if-eq v2, v3, :cond_5

    .line 161
    .line 162
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 163
    .line 164
    invoke-static {v2}, Ll/s410;->C3(Ll/s410;)Ll/uow;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iget v2, v2, Ll/tow;->H:I

    .line 169
    .line 170
    const v3, 0x7d000

    .line 171
    .line 172
    .line 173
    if-ne v2, v3, :cond_6

    .line 174
    .line 175
    :cond_5
    iput v4, p0, Ll/s410$d;->a:I

    .line 176
    .line 177
    :cond_6
    :goto_0
    iget v2, p0, Ll/s410$d;->a:I

    .line 178
    .line 179
    iput v2, p0, Ll/s410$d;->b:I

    .line 180
    .line 181
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    const-string v3, "Pipeline_Flow_pip->MOMO"

    .line 186
    .line 187
    new-instance v6, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget v1, p0, Ll/s410$d;->b:I

    .line 193
    .line 194
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v1, " "

    .line 198
    .line 199
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Ll/s410$d;->h:Ll/s410;

    .line 203
    .line 204
    invoke-static {v1}, Ll/s410;->E3(Ll/s410;)Ll/uow;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    iget v1, v1, Ll/tow;->H:I

    .line 209
    .line 210
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v1, " "

    .line 214
    .line 215
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Ll/s410$d;->h:Ll/s410;

    .line 219
    .line 220
    invoke-static {v1}, Ll/s410;->F3(Ll/s410;)Ll/uow;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    iget v1, v1, Ll/tow;->m:I

    .line 225
    .line 226
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-virtual {v2, v3, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_7
    if-nez p1, :cond_8

    .line 237
    .line 238
    iget p1, p0, Ll/s410$d;->a:I

    .line 239
    .line 240
    iget v1, p0, Ll/s410$d;->b:I

    .line 241
    .line 242
    if-eq p1, v1, :cond_a

    .line 243
    .line 244
    add-int/2addr v1, v5

    .line 245
    if-gt v1, p1, :cond_a

    .line 246
    .line 247
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    const-string v1, "Pipeline_Flow_pip->MOMO"

    .line 252
    .line 253
    new-instance v2, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 259
    .line 260
    invoke-static {v0}, Ll/s410;->e3(Ll/s410;)J

    .line 261
    .line 262
    .line 263
    move-result-wide v6

    .line 264
    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {p1, v1, v0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget p1, p0, Ll/s410$d;->b:I

    .line 275
    .line 276
    add-int/2addr p1, v5

    .line 277
    iput p1, p0, Ll/s410$d;->b:I

    .line 278
    .line 279
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 280
    .line 281
    invoke-static {p1}, Ll/s410;->G3(Ll/s410;)Ll/uow;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    iget v0, v0, Ll/tow;->H:I

    .line 286
    .line 287
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 291
    .line 292
    invoke-static {p1}, Ll/s410;->H3(Ll/s410;)Ll/uow;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    iget v0, p0, Ll/s410$d;->b:I

    .line 297
    .line 298
    invoke-static {p1, v0}, Ll/jq70;->a(Ll/uow;I)Ll/uow;

    .line 299
    .line 300
    .line 301
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 302
    .line 303
    invoke-static {p1, v4, v4}, Ll/s410;->U3(Ll/s410;II)V

    .line 304
    .line 305
    .line 306
    goto :goto_1

    .line 307
    :cond_8
    if-ne p1, v5, :cond_a

    .line 308
    .line 309
    iget p1, p0, Ll/s410$d;->a:I

    .line 310
    .line 311
    if-eqz p1, :cond_a

    .line 312
    .line 313
    iget p1, p0, Ll/s410$d;->b:I

    .line 314
    .line 315
    sub-int/2addr p1, v5

    .line 316
    if-ltz p1, :cond_a

    .line 317
    .line 318
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    const-string v0, "Pipeline_Flow_pip->MOMO"

    .line 323
    .line 324
    const-string v1, "jzheng \u8fdb\u5165\u62e5\u585e\u3002"

    .line 325
    .line 326
    invoke-virtual {p1, v0, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    iget p1, p0, Ll/s410$d;->b:I

    .line 330
    .line 331
    sub-int/2addr p1, v5

    .line 332
    iput p1, p0, Ll/s410$d;->b:I

    .line 333
    .line 334
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 335
    .line 336
    invoke-static {p1}, Ll/s410;->I3(Ll/s410;)Ll/uow;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    iget v0, v0, Ll/tow;->H:I

    .line 341
    .line 342
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 343
    .line 344
    .line 345
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 346
    .line 347
    invoke-static {p1}, Ll/s410;->J3(Ll/s410;)Ll/uow;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    iget v0, p0, Ll/s410$d;->b:I

    .line 352
    .line 353
    invoke-static {p1, v0}, Ll/jq70;->a(Ll/uow;I)Ll/uow;

    .line 354
    .line 355
    .line 356
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 357
    .line 358
    invoke-static {p1, v5, v4}, Ll/s410;->U3(Ll/s410;II)V

    .line 359
    .line 360
    .line 361
    :goto_1
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 362
    .line 363
    invoke-static {p1}, Ll/s410;->K3(Ll/s410;)Ll/uow;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    iget v0, v0, Ll/tow;->m:I

    .line 368
    .line 369
    invoke-static {p1, v0}, Ll/s410;->V2(Ll/s410;I)I

    .line 370
    .line 371
    .line 372
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 373
    .line 374
    invoke-static {p1}, Ll/s410;->L3(Ll/s410;)Ll/uow;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    iget v0, v0, Ll/tow;->n:I

    .line 379
    .line 380
    invoke-static {p1, v0}, Ll/s410;->W2(Ll/s410;I)I

    .line 381
    .line 382
    .line 383
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 384
    .line 385
    const-wide/16 v0, 0x0

    .line 386
    .line 387
    invoke-static {p1, v0, v1}, Ll/s410;->g3(Ll/s410;J)J

    .line 388
    .line 389
    .line 390
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 391
    .line 392
    invoke-static {p1}, Ll/s410;->k3(Ll/s410;)J

    .line 393
    .line 394
    .line 395
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 396
    .line 397
    invoke-static {p1}, Ll/s410;->M3(Ll/s410;)Ll/uow;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-virtual {p1}, Ll/uow;->b()I

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 406
    .line 407
    invoke-static {v0}, Ll/s410;->l3(Ll/s410;)Z

    .line 408
    .line 409
    .line 410
    move-result v0

    .line 411
    if-eqz v0, :cond_9

    .line 412
    .line 413
    goto :goto_2

    .line 414
    :cond_9
    move v5, p1

    .line 415
    :goto_2
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 416
    .line 417
    invoke-static {p1}, Ll/s410;->i3(Ll/s410;)J

    .line 418
    .line 419
    .line 420
    move-result-wide v0

    .line 421
    int-to-long v2, v5

    .line 422
    cmp-long p1, v0, v2

    .line 423
    .line 424
    if-lez p1, :cond_a

    .line 425
    .line 426
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 427
    .line 428
    invoke-static {p1, v2, v3}, Ll/s410;->j3(Ll/s410;J)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 429
    .line 430
    .line 431
    :cond_a
    monitor-exit p0

    .line 432
    return-void

    .line 433
    :goto_3
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 434
    throw p1
.end method

.method private declared-synchronized f(I)V
    .locals 7

    .line 1
    const-string v0, "NOT PUSH_LEVEL_CHANGE_UP origBitrate:"

    .line 2
    .line 3
    const-string v1, "jzheng init  "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 7
    .line 8
    invoke-static {v2}, Ll/s410;->X2(Ll/s410;)Ll/wvx;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-wide v2, v2, Ll/wvx;->s:J

    .line 13
    .line 14
    const-wide/16 v4, 0x6f

    .line 15
    .line 16
    cmp-long v2, v2, v4

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 21
    .line 22
    invoke-static {v2}, Ll/s410;->Y2(Ll/s410;)Ll/uow;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-boolean v2, v2, Ll/uow;->X0:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto/16 :goto_5

    .line 34
    .line 35
    :cond_0
    :try_start_1
    iget v2, p0, Ll/s410$d;->c:I

    .line 36
    .line 37
    const/4 v3, -0x1

    .line 38
    if-ne v2, v3, :cond_1

    .line 39
    .line 40
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget v2, v2, Ll/tow;->H:I

    .line 47
    .line 48
    iput v2, p0, Ll/s410$d;->c:I

    .line 49
    .line 50
    iput v2, p0, Ll/s410$d;->d:I

    .line 51
    .line 52
    const-string v2, "newBitrate"

    .line 53
    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget v1, p0, Ll/s410$d;->d:I

    .line 60
    .line 61
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, " "

    .line 65
    .line 66
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Ll/s410$d;->h:Ll/s410;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget v1, v1, Ll/tow;->H:I

    .line 76
    .line 77
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v1, " "

    .line 81
    .line 82
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ll/s410$d;->h:Ll/s410;

    .line 86
    .line 87
    invoke-static {v1}, Ll/s410;->Z2(Ll/s410;)Ll/uow;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget v1, v1, Ll/tow;->m:I

    .line 92
    .line 93
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {v2, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    :cond_1
    const/4 v1, 0x0

    .line 104
    const/4 v2, 0x1

    .line 105
    if-nez p1, :cond_4

    .line 106
    .line 107
    iget p1, p0, Ll/s410$d;->c:I

    .line 108
    .line 109
    iget v3, p0, Ll/s410$d;->d:I

    .line 110
    .line 111
    if-eq p1, v3, :cond_3

    .line 112
    .line 113
    if-ge v3, p1, :cond_3

    .line 114
    .line 115
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Ll/csx;->Q()I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    add-int/2addr v3, p1

    .line 124
    iput v3, p0, Ll/s410$d;->d:I

    .line 125
    .line 126
    iget p1, p0, Ll/s410$d;->c:I

    .line 127
    .line 128
    if-le v3, p1, :cond_2

    .line 129
    .line 130
    iput p1, p0, Ll/s410$d;->d:I

    .line 131
    .line 132
    :cond_2
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget v0, v0, Ll/tow;->H:I

    .line 139
    .line 140
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 144
    .line 145
    invoke-static {p1}, Ll/s410;->a3(Ll/s410;)Ll/uow;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iget v0, p0, Ll/s410$d;->d:I

    .line 150
    .line 151
    invoke-static {p1, v0}, Ll/jq70;->c(Ll/uow;I)Ll/uow;

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 155
    .line 156
    invoke-static {p1, v1, v1}, Ll/s410;->U3(Ll/s410;II)V

    .line 157
    .line 158
    .line 159
    goto/16 :goto_2

    .line 160
    .line 161
    :cond_3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    new-instance v1, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget v0, p0, Ll/s410$d;->c:I

    .line 171
    .line 172
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v0, ", currBitrate:"

    .line 176
    .line 177
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget v0, p0, Ll/s410$d;->d:I

    .line 181
    .line 182
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v0, ",audioBufCheckCount:"

    .line 186
    .line 187
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 191
    .line 192
    invoke-static {v0}, Ll/s410;->e3(Ll/s410;)J

    .line 193
    .line 194
    .line 195
    move-result-wide v2

    .line 196
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {p1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 208
    .line 209
    .line 210
    goto/16 :goto_4

    .line 211
    .line 212
    :cond_4
    if-ne p1, v2, :cond_a

    .line 213
    .line 214
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 215
    .line 216
    invoke-static {p1}, Ll/s410;->b3(Ll/s410;)[I

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    if-eqz p1, :cond_6

    .line 221
    .line 222
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 223
    .line 224
    invoke-static {p1}, Ll/s410;->b3(Ll/s410;)[I

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    array-length p1, p1

    .line 229
    if-lez p1, :cond_6

    .line 230
    .line 231
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 232
    .line 233
    invoke-static {p1}, Ll/s410;->b3(Ll/s410;)[I

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    array-length v0, p1

    .line 238
    move v3, v1

    .line 239
    move v4, v3

    .line 240
    :goto_0
    if-ge v3, v0, :cond_5

    .line 241
    .line 242
    aget v5, p1, v3

    .line 243
    .line 244
    add-int/2addr v4, v5

    .line 245
    add-int/lit8 v3, v3, 0x1

    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_5
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 249
    .line 250
    invoke-static {p1}, Ll/s410;->b3(Ll/s410;)[I

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    array-length p1, p1

    .line 255
    div-int/2addr v4, p1

    .line 256
    int-to-double v3, v4

    .line 257
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p1}, Ll/csx;->i()D

    .line 262
    .line 263
    .line 264
    move-result-wide v5

    .line 265
    mul-double/2addr v3, v5

    .line 266
    double-to-int p1, v3

    .line 267
    goto :goto_1

    .line 268
    :cond_6
    move p1, v1

    .line 269
    :goto_1
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 270
    .line 271
    invoke-static {v0}, Ll/s410;->c3(Ll/s410;)Ll/uow;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-static {v0, v3}, Ll/s410;->d3(Ll/s410;Ll/uow;)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    iget v3, p0, Ll/s410$d;->c:I

    .line 280
    .line 281
    if-eqz v3, :cond_7

    .line 282
    .line 283
    if-lez p1, :cond_7

    .line 284
    .line 285
    if-lt p1, v0, :cond_7

    .line 286
    .line 287
    iget v3, p0, Ll/s410$d;->d:I

    .line 288
    .line 289
    if-ge p1, v3, :cond_7

    .line 290
    .line 291
    iput p1, p0, Ll/s410$d;->d:I

    .line 292
    .line 293
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 294
    .line 295
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    iget v0, v0, Ll/tow;->H:I

    .line 300
    .line 301
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 305
    .line 306
    invoke-static {p1}, Ll/s410;->f3(Ll/s410;)Ll/uow;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    iget v0, p0, Ll/s410$d;->d:I

    .line 311
    .line 312
    invoke-static {p1, v0}, Ll/jq70;->c(Ll/uow;I)Ll/uow;

    .line 313
    .line 314
    .line 315
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 316
    .line 317
    invoke-static {p1, v2, v1}, Ll/s410;->U3(Ll/s410;II)V

    .line 318
    .line 319
    .line 320
    goto :goto_2

    .line 321
    :cond_7
    if-ltz p1, :cond_9

    .line 322
    .line 323
    if-ge p1, v0, :cond_9

    .line 324
    .line 325
    iget p1, p0, Ll/s410$d;->d:I

    .line 326
    .line 327
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    iput p1, p0, Ll/s410$d;->d:I

    .line 332
    .line 333
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 334
    .line 335
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    iget v0, v0, Ll/tow;->H:I

    .line 340
    .line 341
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 342
    .line 343
    .line 344
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 345
    .line 346
    invoke-static {p1}, Ll/s410;->h3(Ll/s410;)Ll/uow;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    iget v0, p0, Ll/s410$d;->d:I

    .line 351
    .line 352
    invoke-static {p1, v0}, Ll/jq70;->c(Ll/uow;I)Ll/uow;

    .line 353
    .line 354
    .line 355
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 356
    .line 357
    invoke-static {p1, v2, v2}, Ll/s410;->U3(Ll/s410;II)V

    .line 358
    .line 359
    .line 360
    :goto_2
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 361
    .line 362
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    iget v0, v0, Ll/tow;->m:I

    .line 367
    .line 368
    invoke-static {p1, v0}, Ll/s410;->V2(Ll/s410;I)I

    .line 369
    .line 370
    .line 371
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 372
    .line 373
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    iget v0, v0, Ll/tow;->n:I

    .line 378
    .line 379
    invoke-static {p1, v0}, Ll/s410;->W2(Ll/s410;I)I

    .line 380
    .line 381
    .line 382
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 383
    .line 384
    const-wide/16 v0, 0x0

    .line 385
    .line 386
    invoke-static {p1, v0, v1}, Ll/s410;->g3(Ll/s410;J)J

    .line 387
    .line 388
    .line 389
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 390
    .line 391
    invoke-static {p1}, Ll/s410;->k3(Ll/s410;)J

    .line 392
    .line 393
    .line 394
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 395
    .line 396
    invoke-static {p1}, Ll/s410;->l3(Ll/s410;)Z

    .line 397
    .line 398
    .line 399
    move-result p1

    .line 400
    if-eqz p1, :cond_8

    .line 401
    .line 402
    goto :goto_3

    .line 403
    :cond_8
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 404
    .line 405
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 406
    .line 407
    .line 408
    move-result-object p1

    .line 409
    invoke-virtual {p1}, Ll/uow;->b()I

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    :goto_3
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 414
    .line 415
    invoke-static {p1}, Ll/s410;->i3(Ll/s410;)J

    .line 416
    .line 417
    .line 418
    move-result-wide v0

    .line 419
    int-to-long v2, v2

    .line 420
    cmp-long p1, v0, v2

    .line 421
    .line 422
    if-lez p1, :cond_a

    .line 423
    .line 424
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 425
    .line 426
    invoke-static {p1, v2, v3}, Ll/s410;->j3(Ll/s410;J)J

    .line 427
    .line 428
    .line 429
    goto :goto_4

    .line 430
    :cond_9
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 431
    .line 432
    .line 433
    move-result-object v1

    .line 434
    new-instance v2, Ljava/lang/StringBuilder;

    .line 435
    .line 436
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 437
    .line 438
    .line 439
    const-string v3, "videoDynamicScaling_2 newbitrate:"

    .line 440
    .line 441
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    const-string p1, ",curr_min_bit:"

    .line 448
    .line 449
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    const-string p1, ",currbit:"

    .line 456
    .line 457
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .line 459
    .line 460
    iget p1, p0, Ll/s410$d;->d:I

    .line 461
    .line 462
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    move-result-object p1

    .line 473
    invoke-virtual {v1, p1}, Ll/b7y;->g([Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 474
    .line 475
    .line 476
    :cond_a
    :goto_4
    monitor-exit p0

    .line 477
    return-void

    .line 478
    :goto_5
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 479
    throw p1
.end method

.method private declared-synchronized g()V
    .locals 9

    .line 1
    const-string v0, "jzheng \u7f51\u7edc\u62e5\u585e\u89e3\u9664\u3002"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-wide v1, p0, Ll/s410$d;->g:J

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    add-long/2addr v1, v3

    .line 9
    iput-wide v1, p0, Ll/s410$d;->g:J

    .line 10
    .line 11
    const-wide/16 v5, 0x2

    .line 12
    .line 13
    rem-long/2addr v1, v5

    .line 14
    const-wide/16 v5, 0x0

    .line 15
    .line 16
    cmp-long v7, v1, v5

    .line 17
    .line 18
    const/4 v8, 0x0

    .line 19
    if-nez v7, :cond_0

    .line 20
    .line 21
    const-string v1, "newBitrate"

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 29
    .line 30
    invoke-static {v0}, Ll/s410;->e3(Ll/s410;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget v1, v1, Ll/tow;->H:I

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/s410;->t3(Ll/s410;I)I

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 56
    .line 57
    invoke-static {v0}, Ll/s410;->D3(Ll/s410;)Ll/uow;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/16 v1, 0x210

    .line 62
    .line 63
    iput v1, v0, Ll/tow;->m:I

    .line 64
    .line 65
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 66
    .line 67
    invoke-static {v0}, Ll/s410;->N3(Ll/s410;)Ll/uow;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v1, 0x3c0

    .line 72
    .line 73
    iput v1, v0, Ll/tow;->n:I

    .line 74
    .line 75
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 76
    .line 77
    invoke-static {v0}, Ll/s410;->T3(Ll/s410;)Ll/uow;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const v1, 0xfa000

    .line 82
    .line 83
    .line 84
    iput v1, v0, Ll/tow;->H:I

    .line 85
    .line 86
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 87
    .line 88
    invoke-static {v0, v8, v8}, Ll/s410;->U3(Ll/s410;II)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catchall_0
    move-exception v0

    .line 93
    goto :goto_1

    .line 94
    :cond_0
    cmp-long v0, v1, v3

    .line 95
    .line 96
    if-nez v0, :cond_1

    .line 97
    .line 98
    const-string v0, "newBitrate"

    .line 99
    .line 100
    const-string v1, "jzheng \u8fdb\u5165\u62e5\u585e\u3002"

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iget v1, v1, Ll/tow;->H:I

    .line 112
    .line 113
    invoke-static {v0, v1}, Ll/s410;->t3(Ll/s410;I)I

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 117
    .line 118
    invoke-static {v0}, Ll/s410;->V3(Ll/s410;)Ll/uow;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const/16 v1, 0x160

    .line 123
    .line 124
    iput v1, v0, Ll/tow;->m:I

    .line 125
    .line 126
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 127
    .line 128
    invoke-static {v0}, Ll/s410;->W3(Ll/s410;)Ll/uow;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const/16 v1, 0x280

    .line 133
    .line 134
    iput v1, v0, Ll/tow;->n:I

    .line 135
    .line 136
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 137
    .line 138
    invoke-static {v0}, Ll/s410;->U2(Ll/s410;)Ll/uow;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const v1, 0xb71b0

    .line 143
    .line 144
    .line 145
    iput v1, v0, Ll/tow;->H:I

    .line 146
    .line 147
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 148
    .line 149
    const/4 v1, 0x1

    .line 150
    invoke-static {v0, v1, v8}, Ll/s410;->U3(Ll/s410;II)V

    .line 151
    .line 152
    .line 153
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget v1, v1, Ll/tow;->m:I

    .line 160
    .line 161
    invoke-static {v0, v1}, Ll/s410;->V2(Ll/s410;I)I

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget v1, v1, Ll/tow;->n:I

    .line 171
    .line 172
    invoke-static {v0, v1}, Ll/s410;->W2(Ll/s410;I)I

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/s410$d;->h:Ll/s410;

    .line 176
    .line 177
    invoke-static {v0, v5, v6}, Ll/s410;->g3(Ll/s410;J)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    .line 179
    .line 180
    monitor-exit p0

    .line 181
    return-void

    .line 182
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 183
    throw v0
.end method

.method private declared-synchronized h(I)V
    .locals 8

    .line 1
    const-string v0, "down\uff1a,origBitrate="

    .line 2
    .line 3
    const-string v1, "up\uff1a,origBitrate="

    .line 4
    .line 5
    const-string v2, "jzheng fps  "

    .line 6
    .line 7
    const-string v3, "jzheng init  "

    .line 8
    .line 9
    monitor-enter p0

    .line 10
    :try_start_0
    iget-object v4, p0, Ll/s410$d;->h:Ll/s410;

    .line 11
    .line 12
    invoke-virtual {v4}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    iget-boolean v4, v4, Ll/uow;->M0:Z

    .line 17
    .line 18
    if-eqz v4, :cond_8

    .line 19
    .line 20
    iget-object v4, p0, Ll/s410$d;->h:Ll/s410;

    .line 21
    .line 22
    invoke-static {v4}, Ll/s410;->m3(Ll/s410;)Ll/wvx;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget-wide v4, v4, Ll/wvx;->s:J

    .line 27
    .line 28
    const-wide/16 v6, 0x6f

    .line 29
    .line 30
    cmp-long v4, v4, v6

    .line 31
    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    goto/16 :goto_3

    .line 35
    .line 36
    :cond_0
    iget v4, p0, Ll/s410$d;->c:I

    .line 37
    .line 38
    const/4 v5, -0x1

    .line 39
    if-ne v4, v5, :cond_1

    .line 40
    .line 41
    iget-object v4, p0, Ll/s410$d;->h:Ll/s410;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    iget v4, v4, Ll/tow;->H:I

    .line 48
    .line 49
    iput v4, p0, Ll/s410$d;->c:I

    .line 50
    .line 51
    const-string v4, "newBitrate"

    .line 52
    .line 53
    new-instance v6, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget v3, p0, Ll/s410$d;->d:I

    .line 59
    .line 60
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v3, " "

    .line 64
    .line 65
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v3, p0, Ll/s410$d;->h:Ll/s410;

    .line 69
    .line 70
    invoke-virtual {v3}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget v3, v3, Ll/tow;->H:I

    .line 75
    .line 76
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v3, " "

    .line 80
    .line 81
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v3, p0, Ll/s410$d;->h:Ll/s410;

    .line 85
    .line 86
    invoke-static {v3}, Ll/s410;->n3(Ll/s410;)Ll/uow;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget v3, v3, Ll/tow;->m:I

    .line 91
    .line 92
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-static {v4, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :catchall_0
    move-exception p1

    .line 104
    goto/16 :goto_4

    .line 105
    .line 106
    :cond_1
    :goto_0
    iget v3, p0, Ll/s410$d;->e:I

    .line 107
    .line 108
    if-ne v3, v5, :cond_2

    .line 109
    .line 110
    iget-object v3, p0, Ll/s410$d;->h:Ll/s410;

    .line 111
    .line 112
    invoke-virtual {v3}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    iget v3, v3, Ll/tow;->F:I

    .line 117
    .line 118
    iput v3, p0, Ll/s410$d;->e:I

    .line 119
    .line 120
    iput v3, p0, Ll/s410$d;->f:I

    .line 121
    .line 122
    const-string v3, "newBitrate"

    .line 123
    .line 124
    new-instance v4, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget v2, p0, Ll/s410$d;->f:I

    .line 130
    .line 131
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v2, " "

    .line 135
    .line 136
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object v2, p0, Ll/s410$d;->h:Ll/s410;

    .line 140
    .line 141
    invoke-virtual {v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iget v2, v2, Ll/tow;->F:I

    .line 146
    .line 147
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {v3, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    :cond_2
    const/4 v2, 0x0

    .line 158
    const/4 v3, 0x1

    .line 159
    if-nez p1, :cond_4

    .line 160
    .line 161
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    const-string v0, "Pipeline_Flow_pip->MOMO"

    .line 166
    .line 167
    new-instance v4, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget v1, p0, Ll/s410$d;->c:I

    .line 173
    .line 174
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v1, ",currBitrate="

    .line 178
    .line 179
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget v1, p0, Ll/s410$d;->d:I

    .line 183
    .line 184
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {p1, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    iget p1, p0, Ll/s410$d;->c:I

    .line 195
    .line 196
    iget v0, p0, Ll/s410$d;->d:I

    .line 197
    .line 198
    if-eq p1, v0, :cond_7

    .line 199
    .line 200
    if-ge v0, p1, :cond_7

    .line 201
    .line 202
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    const-string v0, "Pipeline_Flow_pip->MOMO"

    .line 207
    .line 208
    const-string v1, "\u7f51\u7edc\u62e5\u585e\u89e3\u9664:----up"

    .line 209
    .line 210
    invoke-virtual {p1, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    iget p1, p0, Ll/s410$d;->f:I

    .line 214
    .line 215
    add-int/lit8 v0, p1, 0x1

    .line 216
    .line 217
    iget v1, p0, Ll/s410$d;->e:I

    .line 218
    .line 219
    if-gt v0, v1, :cond_3

    .line 220
    .line 221
    add-int/2addr p1, v3

    .line 222
    iput p1, p0, Ll/s410$d;->f:I

    .line 223
    .line 224
    :cond_3
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iget v0, v0, Ll/tow;->H:I

    .line 231
    .line 232
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 236
    .line 237
    invoke-static {p1}, Ll/s410;->o3(Ll/s410;)Ll/uow;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    iget v0, p0, Ll/s410$d;->d:I

    .line 242
    .line 243
    iget v1, p0, Ll/s410$d;->f:I

    .line 244
    .line 245
    invoke-static {p1, v0, v1}, Ll/jq70;->b(Ll/uow;II)Ll/uow;

    .line 246
    .line 247
    .line 248
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 249
    .line 250
    invoke-static {p1, v2, v2}, Ll/s410;->U3(Ll/s410;II)V

    .line 251
    .line 252
    .line 253
    goto/16 :goto_1

    .line 254
    .line 255
    :cond_4
    if-ne p1, v3, :cond_7

    .line 256
    .line 257
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    const-string v1, "Pipeline_Flow_pip->MOMO"

    .line 262
    .line 263
    new-instance v4, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget v0, p0, Ll/s410$d;->c:I

    .line 269
    .line 270
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const-string v0, ",currBitrate="

    .line 274
    .line 275
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget v0, p0, Ll/s410$d;->d:I

    .line 279
    .line 280
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v0, ",getAdapt_br_min()="

    .line 284
    .line 285
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {v0}, Ll/csx;->l()I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    iget p1, p0, Ll/s410$d;->c:I

    .line 307
    .line 308
    if-eqz p1, :cond_7

    .line 309
    .line 310
    iget p1, p0, Ll/s410$d;->d:I

    .line 311
    .line 312
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {v0}, Ll/csx;->l()I

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    if-lt p1, v0, :cond_7

    .line 321
    .line 322
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    const-string v0, "Pipeline_Flow_pip->MOMO"

    .line 327
    .line 328
    const-string v1, "\u8fdb\u5165\u62e5\u585e: down"

    .line 329
    .line 330
    invoke-virtual {p1, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    iget p1, p0, Ll/s410$d;->f:I

    .line 334
    .line 335
    sub-int/2addr p1, v3

    .line 336
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-virtual {v0}, Ll/csx;->n()I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-lt p1, v0, :cond_5

    .line 345
    .line 346
    iget p1, p0, Ll/s410$d;->f:I

    .line 347
    .line 348
    sub-int/2addr p1, v3

    .line 349
    iput p1, p0, Ll/s410$d;->f:I

    .line 350
    .line 351
    :cond_5
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 352
    .line 353
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    iget v0, v0, Ll/tow;->H:I

    .line 358
    .line 359
    invoke-static {p1, v0}, Ll/s410;->t3(Ll/s410;I)I

    .line 360
    .line 361
    .line 362
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 363
    .line 364
    invoke-static {p1}, Ll/s410;->p3(Ll/s410;)Ll/uow;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    iget v0, p0, Ll/s410$d;->d:I

    .line 369
    .line 370
    iget v1, p0, Ll/s410$d;->f:I

    .line 371
    .line 372
    invoke-static {p1, v0, v1}, Ll/jq70;->b(Ll/uow;II)Ll/uow;

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 376
    .line 377
    invoke-static {p1, v3, v2}, Ll/s410;->U3(Ll/s410;II)V

    .line 378
    .line 379
    .line 380
    :goto_1
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 381
    .line 382
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    iget v0, v0, Ll/tow;->m:I

    .line 387
    .line 388
    invoke-static {p1, v0}, Ll/s410;->V2(Ll/s410;I)I

    .line 389
    .line 390
    .line 391
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 392
    .line 393
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    iget v0, v0, Ll/tow;->n:I

    .line 398
    .line 399
    invoke-static {p1, v0}, Ll/s410;->W2(Ll/s410;I)I

    .line 400
    .line 401
    .line 402
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 403
    .line 404
    const-wide/16 v0, 0x0

    .line 405
    .line 406
    invoke-static {p1, v0, v1}, Ll/s410;->g3(Ll/s410;J)J

    .line 407
    .line 408
    .line 409
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 410
    .line 411
    invoke-static {p1}, Ll/s410;->k3(Ll/s410;)J

    .line 412
    .line 413
    .line 414
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 415
    .line 416
    invoke-static {p1}, Ll/s410;->l3(Ll/s410;)Z

    .line 417
    .line 418
    .line 419
    move-result p1

    .line 420
    if-eqz p1, :cond_6

    .line 421
    .line 422
    goto :goto_2

    .line 423
    :cond_6
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 424
    .line 425
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    invoke-virtual {p1}, Ll/uow;->b()I

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    :goto_2
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 434
    .line 435
    invoke-static {p1}, Ll/s410;->i3(Ll/s410;)J

    .line 436
    .line 437
    .line 438
    move-result-wide v0

    .line 439
    int-to-long v2, v3

    .line 440
    cmp-long p1, v0, v2

    .line 441
    .line 442
    if-lez p1, :cond_7

    .line 443
    .line 444
    iget-object p1, p0, Ll/s410$d;->h:Ll/s410;

    .line 445
    .line 446
    invoke-static {p1, v2, v3}, Ll/s410;->j3(Ll/s410;J)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 447
    .line 448
    .line 449
    :cond_7
    monitor-exit p0

    .line 450
    return-void

    .line 451
    :cond_8
    :goto_3
    monitor-exit p0

    .line 452
    return-void

    .line 453
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 454
    throw p1
.end method


# virtual methods
.method public c(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ll/csx;->M0()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ll/s410$d;->h(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ll/csx;->f0()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-direct {p0, p1}, Ll/s410$d;->f(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    invoke-direct {p0, p1}, Ll/s410$d;->e(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/s410$d;->c:I

    .line 3
    .line 4
    return-void
.end method

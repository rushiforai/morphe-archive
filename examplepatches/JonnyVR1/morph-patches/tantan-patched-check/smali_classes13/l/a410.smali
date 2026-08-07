.class public Ll/a410;
.super Ll/q210;
.source "SourceFile"


# instance fields
.field private final k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q210;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "Pipeline_Normal_pip->PIPLINE"

    .line 5
    .line 6
    iput-object p1, p0, Ll/a410;->k:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    and-int/lit16 v1, v0, 0xf00

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lez v1, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Ll/q210;->a:Ljava/util/Set;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_c

    .line 15
    .line 16
    iget-object v0, p0, Ll/q210;->a:Ljava/util/Set;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    iget-object v1, p0, Ll/q210;->a:Ljava/util/Set;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ll/q210$b;

    .line 36
    .line 37
    iget v4, p1, Landroid/os/Message;->what:I

    .line 38
    .line 39
    invoke-static {v4}, Ll/p210;->b(I)Z

    .line 40
    .line 41
    .line 42
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    iget v5, p1, Landroid/os/Message;->what:I

    .line 44
    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    :try_start_1
    iget v4, p1, Landroid/os/Message;->arg1:I

    .line 48
    .line 49
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 50
    .line 51
    invoke-interface {v3, v5, v4, v6}, Ll/q210$b;->q0(IILjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-static {v5}, Ll/p210;->a(I)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_0

    .line 62
    .line 63
    iget v4, p1, Landroid/os/Message;->what:I

    .line 64
    .line 65
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 66
    .line 67
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 68
    .line 69
    invoke-interface {v3, v4, v5, v6}, Ll/q210$b;->w0(IILjava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    monitor-exit v0

    .line 74
    goto/16 :goto_9

    .line 75
    .line 76
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    throw p0

    .line 78
    :cond_3
    and-int/lit16 v0, v0, 0xff

    .line 79
    .line 80
    if-eqz v0, :cond_a

    .line 81
    .line 82
    const/4 v1, 0x1

    .line 83
    if-eq v0, v1, :cond_5

    .line 84
    .line 85
    iget-object v0, p0, Ll/q210;->b:Ljava/util/Set;

    .line 86
    .line 87
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_c

    .line 92
    .line 93
    iget-object v0, p0, Ll/q210;->b:Ljava/util/Set;

    .line 94
    .line 95
    monitor-enter v0

    .line 96
    :try_start_2
    iget-object v1, p0, Ll/q210;->b:Ljava/util/Set;

    .line 97
    .line 98
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    if-eqz v3, :cond_4

    .line 107
    .line 108
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Ll/q210$c;

    .line 113
    .line 114
    iget v4, p1, Landroid/os/Message;->what:I

    .line 115
    .line 116
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 117
    .line 118
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 119
    .line 120
    invoke-interface {v3, v4, v5, v6}, Ll/q210$c;->a(IILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :catchall_1
    move-exception p0

    .line 125
    goto :goto_3

    .line 126
    :cond_4
    monitor-exit v0

    .line 127
    goto/16 :goto_9

    .line 128
    .line 129
    :goto_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 130
    throw p0

    .line 131
    :cond_5
    iget-object v0, p0, Ll/q210;->c:Ljava/util/Set;

    .line 132
    .line 133
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_c

    .line 138
    .line 139
    iget-object v0, p0, Ll/q210;->c:Ljava/util/Set;

    .line 140
    .line 141
    monitor-enter v0

    .line 142
    :try_start_3
    iget-object v1, p0, Ll/q210;->c:Ljava/util/Set;

    .line 143
    .line 144
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    move v3, v2

    .line 149
    :cond_6
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-eqz v4, :cond_7

    .line 154
    .line 155
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    check-cast v4, Ll/q210$d;

    .line 160
    .line 161
    instance-of v5, v4, Ll/wzl;

    .line 162
    .line 163
    if-eqz v5, :cond_6

    .line 164
    .line 165
    const-string v5, "jzheng"

    .line 166
    .line 167
    new-instance v6, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    const-string v7, " STOP onRecordStateListener["

    .line 173
    .line 174
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    add-int/lit8 v7, v3, 0x1

    .line 178
    .line 179
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v3, "] "

    .line 183
    .line 184
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string v3, " / "

    .line 191
    .line 192
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 196
    .line 197
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-static {v5, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 208
    .line 209
    invoke-interface {v4, v3}, Ll/q210$d;->j0(Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    move v3, v7

    .line 213
    goto :goto_4

    .line 214
    :catchall_2
    move-exception p0

    .line 215
    goto :goto_6

    .line 216
    :cond_7
    iget-object v1, p0, Ll/q210;->c:Ljava/util/Set;

    .line 217
    .line 218
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    :cond_8
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-eqz v4, :cond_9

    .line 227
    .line 228
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    check-cast v4, Ll/q210$d;

    .line 233
    .line 234
    instance-of v5, v4, Ll/wzl;

    .line 235
    .line 236
    if-nez v5, :cond_8

    .line 237
    .line 238
    const-string v5, "jzheng"

    .line 239
    .line 240
    new-instance v6, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 243
    .line 244
    .line 245
    const-string v7, " STOP onRecordStateListener["

    .line 246
    .line 247
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    add-int/lit8 v7, v3, 0x1

    .line 251
    .line 252
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    const-string v3, "] "

    .line 256
    .line 257
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v3, " / "

    .line 264
    .line 265
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 269
    .line 270
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-static {v5, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    .line 279
    .line 280
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 281
    .line 282
    invoke-interface {v4, v3}, Ll/q210$d;->j0(Ljava/lang/Object;)V

    .line 283
    .line 284
    .line 285
    move v3, v7

    .line 286
    goto :goto_5

    .line 287
    :cond_9
    monitor-exit v0

    .line 288
    goto :goto_9

    .line 289
    :goto_6
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 290
    throw p0

    .line 291
    :cond_a
    iget-object v0, p0, Ll/q210;->c:Ljava/util/Set;

    .line 292
    .line 293
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_c

    .line 298
    .line 299
    iget-object v0, p0, Ll/q210;->c:Ljava/util/Set;

    .line 300
    .line 301
    monitor-enter v0

    .line 302
    :try_start_4
    iget-object v1, p0, Ll/q210;->c:Ljava/util/Set;

    .line 303
    .line 304
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    move v3, v2

    .line 309
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    if-eqz v4, :cond_b

    .line 314
    .line 315
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    check-cast v4, Ll/q210$d;

    .line 320
    .line 321
    const-string v5, "jzheng"

    .line 322
    .line 323
    new-instance v6, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    const-string v7, " START onRecordStateListener["

    .line 329
    .line 330
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    add-int/lit8 v7, v3, 0x1

    .line 334
    .line 335
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    const-string v3, "] "

    .line 339
    .line 340
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    const-string v3, " "

    .line 347
    .line 348
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 352
    .line 353
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v3

    .line 360
    invoke-static {v5, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    .line 362
    .line 363
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 364
    .line 365
    invoke-interface {v4, v3}, Ll/q210$d;->d0(Ljava/lang/Object;)V

    .line 366
    .line 367
    .line 368
    move v3, v7

    .line 369
    goto :goto_7

    .line 370
    :catchall_3
    move-exception p0

    .line 371
    goto :goto_8

    .line 372
    :cond_b
    monitor-exit v0

    .line 373
    goto :goto_9

    .line 374
    :goto_8
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 375
    throw p0

    .line 376
    :cond_c
    :goto_9
    iget-object p1, p0, Ll/q210;->e:Ljava/util/Set;

    .line 377
    .line 378
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 379
    .line 380
    .line 381
    move-result p1

    .line 382
    if-nez p1, :cond_e

    .line 383
    .line 384
    iget-object p1, p0, Ll/q210;->e:Ljava/util/Set;

    .line 385
    .line 386
    monitor-enter p1

    .line 387
    :try_start_5
    iget-object v0, p0, Ll/q210;->e:Ljava/util/Set;

    .line 388
    .line 389
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    if-eqz v1, :cond_d

    .line 398
    .line 399
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    check-cast v1, Ll/q210$c;

    .line 404
    .line 405
    iget-object v3, p0, Ll/q210;->b:Ljava/util/Set;

    .line 406
    .line 407
    invoke-interface {v3, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    goto :goto_a

    .line 411
    :catchall_4
    move-exception p0

    .line 412
    goto :goto_b

    .line 413
    :cond_d
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 414
    iget-object p1, p0, Ll/q210;->e:Ljava/util/Set;

    .line 415
    .line 416
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 417
    .line 418
    .line 419
    goto :goto_c

    .line 420
    :goto_b
    :try_start_6
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 421
    throw p0

    .line 422
    :cond_e
    :goto_c
    iget-object p1, p0, Ll/q210;->d:Ljava/util/Set;

    .line 423
    .line 424
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 425
    .line 426
    .line 427
    move-result p1

    .line 428
    if-nez p1, :cond_10

    .line 429
    .line 430
    iget-object p1, p0, Ll/q210;->d:Ljava/util/Set;

    .line 431
    .line 432
    monitor-enter p1

    .line 433
    :try_start_7
    iget-object v0, p0, Ll/q210;->d:Ljava/util/Set;

    .line 434
    .line 435
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    if-eqz v1, :cond_f

    .line 444
    .line 445
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v1

    .line 449
    check-cast v1, Ll/q210$b;

    .line 450
    .line 451
    iget-object v3, p0, Ll/q210;->a:Ljava/util/Set;

    .line 452
    .line 453
    invoke-interface {v3, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 454
    .line 455
    .line 456
    goto :goto_d

    .line 457
    :catchall_5
    move-exception p0

    .line 458
    goto :goto_e

    .line 459
    :cond_f
    monitor-exit p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 460
    iget-object p1, p0, Ll/q210;->d:Ljava/util/Set;

    .line 461
    .line 462
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 463
    .line 464
    .line 465
    goto :goto_f

    .line 466
    :goto_e
    :try_start_8
    monitor-exit p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 467
    throw p0

    .line 468
    :cond_10
    :goto_f
    iget-object p1, p0, Ll/q210;->f:Ljava/util/Set;

    .line 469
    .line 470
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 471
    .line 472
    .line 473
    move-result p1

    .line 474
    if-nez p1, :cond_12

    .line 475
    .line 476
    iget-object p1, p0, Ll/q210;->f:Ljava/util/Set;

    .line 477
    .line 478
    monitor-enter p1

    .line 479
    :try_start_9
    iget-object v0, p0, Ll/q210;->f:Ljava/util/Set;

    .line 480
    .line 481
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 486
    .line 487
    .line 488
    move-result v1

    .line 489
    if-eqz v1, :cond_11

    .line 490
    .line 491
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v1

    .line 495
    check-cast v1, Ll/q210$d;

    .line 496
    .line 497
    iget-object v3, p0, Ll/q210;->c:Ljava/util/Set;

    .line 498
    .line 499
    invoke-interface {v3, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 500
    .line 501
    .line 502
    goto :goto_10

    .line 503
    :catchall_6
    move-exception p0

    .line 504
    goto :goto_11

    .line 505
    :cond_11
    monitor-exit p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 506
    iget-object p1, p0, Ll/q210;->f:Ljava/util/Set;

    .line 507
    .line 508
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 509
    .line 510
    .line 511
    goto :goto_12

    .line 512
    :goto_11
    :try_start_a
    monitor-exit p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 513
    throw p0

    .line 514
    :cond_12
    :goto_12
    iget-boolean p1, p0, Ll/q210;->h:Z

    .line 515
    .line 516
    if-eqz p1, :cond_13

    .line 517
    .line 518
    iget-object p1, p0, Ll/q210;->e:Ljava/util/Set;

    .line 519
    .line 520
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 521
    .line 522
    .line 523
    iget-object p1, p0, Ll/q210;->b:Ljava/util/Set;

    .line 524
    .line 525
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 526
    .line 527
    .line 528
    iput-boolean v2, p0, Ll/q210;->h:Z

    .line 529
    .line 530
    :cond_13
    iget-boolean p1, p0, Ll/q210;->i:Z

    .line 531
    .line 532
    if-eqz p1, :cond_14

    .line 533
    .line 534
    iget-object p1, p0, Ll/q210;->c:Ljava/util/Set;

    .line 535
    .line 536
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 537
    .line 538
    .line 539
    iget-object p1, p0, Ll/q210;->f:Ljava/util/Set;

    .line 540
    .line 541
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 542
    .line 543
    .line 544
    :cond_14
    iget-boolean p1, p0, Ll/q210;->g:Z

    .line 545
    .line 546
    if-eqz p1, :cond_15

    .line 547
    .line 548
    iget-object p1, p0, Ll/q210;->d:Ljava/util/Set;

    .line 549
    .line 550
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 551
    .line 552
    .line 553
    iget-object p0, p0, Ll/q210;->a:Ljava/util/Set;

    .line 554
    .line 555
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 556
    .line 557
    .line 558
    :cond_15
    return-void
.end method

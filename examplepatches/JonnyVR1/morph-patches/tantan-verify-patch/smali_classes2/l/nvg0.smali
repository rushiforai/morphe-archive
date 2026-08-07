.class public final Ll/nvg0;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public final a:Ll/jeg0;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Ll/jeg0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    :pswitch_0
    sget-object p0, Ll/feg0;->i:Ll/txg0;

    .line 10
    .line 11
    new-instance v0, Ll/rpg0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/rpg0;-><init>(Landroid/os/Message;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 21
    .line 22
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 23
    .line 24
    iget-object v0, p0, Ll/jeg0;->g:Ljava/util/LinkedHashSet;

    .line 25
    .line 26
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    goto/16 :goto_9

    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/jeg0;->f:Ljava/util/WeakHashMap;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Ll/wqg0;

    .line 55
    .line 56
    iget-object v3, v2, Ll/wqg0;->f:Ll/wqg0;

    .line 57
    .line 58
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_1

    .line 63
    .line 64
    if-nez v1, :cond_2

    .line 65
    .line 66
    new-instance v1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    :cond_2
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    if-eqz v1, :cond_17

    .line 79
    .line 80
    iget-object p0, p0, Ll/jeg0;->i:Landroid/os/Handler;

    .line 81
    .line 82
    const/16 p1, 0xd

    .line 83
    .line 84
    invoke-virtual {p0, p1, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 93
    .line 94
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 95
    .line 96
    iget-object v0, p0, Ll/jeg0;->g:Ljava/util/LinkedHashSet;

    .line 97
    .line 98
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    goto/16 :goto_9

    .line 105
    .line 106
    :cond_4
    iget-object v0, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    :cond_5
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_17

    .line 121
    .line 122
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Ll/teg0;

    .line 127
    .line 128
    iget-object v4, v1, Ll/teg0;->b:Ll/feg0;

    .line 129
    .line 130
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    .line 132
    .line 133
    iget-object v4, v1, Ll/teg0;->k:Ll/wqg0;

    .line 134
    .line 135
    iget-object v5, v1, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 136
    .line 137
    if-eqz v5, :cond_6

    .line 138
    .line 139
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-nez v6, :cond_6

    .line 144
    .line 145
    move v6, v3

    .line 146
    goto :goto_2

    .line 147
    :cond_6
    move v6, v2

    .line 148
    :goto_2
    if-nez v4, :cond_7

    .line 149
    .line 150
    if-nez v6, :cond_7

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_7
    if-eqz v4, :cond_8

    .line 154
    .line 155
    iget-object v7, v4, Ll/wqg0;->f:Ll/wqg0;

    .line 156
    .line 157
    invoke-virtual {v7, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v7

    .line 161
    if-eqz v7, :cond_8

    .line 162
    .line 163
    invoke-virtual {v1, v4}, Ll/teg0;->c(Ll/wqg0;)V

    .line 164
    .line 165
    .line 166
    iget-object v7, p0, Ll/jeg0;->f:Ljava/util/WeakHashMap;

    .line 167
    .line 168
    invoke-virtual {v4}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    invoke-virtual {v7, v8, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    :cond_8
    if-eqz v6, :cond_a

    .line 176
    .line 177
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    sub-int/2addr v4, v3

    .line 182
    :goto_3
    if-ltz v4, :cond_a

    .line 183
    .line 184
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    check-cast v6, Ll/wqg0;

    .line 189
    .line 190
    iget-object v7, v6, Ll/wqg0;->f:Ll/wqg0;

    .line 191
    .line 192
    invoke-virtual {v7, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    if-nez v7, :cond_9

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_9
    invoke-virtual {v1, v6}, Ll/teg0;->c(Ll/wqg0;)V

    .line 200
    .line 201
    .line 202
    iget-object v7, p0, Ll/jeg0;->f:Ljava/util/WeakHashMap;

    .line 203
    .line 204
    invoke-virtual {v6}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v8

    .line 208
    invoke-virtual {v7, v8, v6}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    :goto_4
    add-int/lit8 v4, v4, -0x1

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_a
    iget-object v4, v1, Ll/teg0;->k:Ll/wqg0;

    .line 215
    .line 216
    if-nez v4, :cond_5

    .line 217
    .line 218
    iget-object v4, v1, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 219
    .line 220
    if-eqz v4, :cond_b

    .line 221
    .line 222
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-eqz v4, :cond_5

    .line 227
    .line 228
    :cond_b
    iget-object v1, v1, Ll/teg0;->n:Ljava/util/concurrent/Future;

    .line 229
    .line 230
    if-eqz v1, :cond_5

    .line 231
    .line 232
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-eqz v1, :cond_5

    .line 237
    .line 238
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 239
    .line 240
    .line 241
    goto :goto_1

    .line 242
    :pswitch_3
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 243
    .line 244
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 249
    .line 250
    check-cast p1, Landroid/net/NetworkInfo;

    .line 251
    .line 252
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 253
    .line 254
    iget-object v0, p0, Ll/jeg0;->b:Ll/ang0;

    .line 255
    .line 256
    if-eqz v0, :cond_c

    .line 257
    .line 258
    invoke-virtual {v0, p1}, Ll/ang0;->b(Landroid/net/NetworkInfo;)V

    .line 259
    .line 260
    .line 261
    :cond_c
    if-eqz p1, :cond_17

    .line 262
    .line 263
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-eqz p1, :cond_17

    .line 268
    .line 269
    iget-object p1, p0, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 270
    .line 271
    invoke-virtual {p1}, Ljava/util/WeakHashMap;->isEmpty()Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-nez p1, :cond_17

    .line 276
    .line 277
    iget-object p1, p0, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 278
    .line 279
    invoke-virtual {p1}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-eqz v0, :cond_17

    .line 292
    .line 293
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    check-cast v0, Ll/wqg0;

    .line 298
    .line 299
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 300
    .line 301
    .line 302
    iget-object v1, v0, Ll/wqg0;->a:Ll/feg0;

    .line 303
    .line 304
    invoke-virtual {p0, v0, v2}, Ll/jeg0;->b(Ll/wqg0;Z)V

    .line 305
    .line 306
    .line 307
    goto :goto_5

    .line 308
    :pswitch_5
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 309
    .line 310
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 311
    .line 312
    .line 313
    new-instance p1, Ljava/util/ArrayList;

    .line 314
    .line 315
    iget-object v0, p0, Ll/jeg0;->l:Ljava/util/ArrayList;

    .line 316
    .line 317
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Ll/jeg0;->l:Ljava/util/ArrayList;

    .line 321
    .line 322
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 323
    .line 324
    .line 325
    iget-object p0, p0, Ll/jeg0;->i:Landroid/os/Handler;

    .line 326
    .line 327
    const/16 v0, 0x8

    .line 328
    .line 329
    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 334
    .line 335
    .line 336
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    if-eqz p0, :cond_d

    .line 341
    .line 342
    goto/16 :goto_9

    .line 343
    .line 344
    :cond_d
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    check-cast p0, Ll/teg0;

    .line 349
    .line 350
    iget-object p0, p0, Ll/teg0;->b:Ll/feg0;

    .line 351
    .line 352
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    .line 354
    .line 355
    return-void

    .line 356
    :pswitch_6
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 357
    .line 358
    check-cast p1, Ll/teg0;

    .line 359
    .line 360
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 361
    .line 362
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 363
    .line 364
    .line 365
    iget-object v0, p1, Ll/teg0;->b:Ll/feg0;

    .line 366
    .line 367
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 368
    .line 369
    .line 370
    iget-object v0, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 371
    .line 372
    iget-object v1, p1, Ll/teg0;->f:Ljava/lang/String;

    .line 373
    .line 374
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    invoke-virtual {p0, p1}, Ll/jeg0;->a(Ll/teg0;)V

    .line 378
    .line 379
    .line 380
    return-void

    .line 381
    :pswitch_7
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 382
    .line 383
    check-cast p1, Ll/teg0;

    .line 384
    .line 385
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 386
    .line 387
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 388
    .line 389
    .line 390
    iget-object v0, p1, Ll/teg0;->n:Ljava/util/concurrent/Future;

    .line 391
    .line 392
    if-eqz v0, :cond_e

    .line 393
    .line 394
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    if-eqz v0, :cond_e

    .line 399
    .line 400
    goto/16 :goto_9

    .line 401
    .line 402
    :cond_e
    iget-object v0, p0, Ll/jeg0;->b:Ll/ang0;

    .line 403
    .line 404
    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->isShutdown()Z

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    if-eqz v0, :cond_f

    .line 409
    .line 410
    iget-object v0, p1, Ll/teg0;->b:Ll/feg0;

    .line 411
    .line 412
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 413
    .line 414
    .line 415
    iget-object v0, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 416
    .line 417
    iget-object v1, p1, Ll/teg0;->f:Ljava/lang/String;

    .line 418
    .line 419
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0, p1}, Ll/jeg0;->a(Ll/teg0;)V

    .line 423
    .line 424
    .line 425
    return-void

    .line 426
    :cond_f
    iget-boolean v0, p0, Ll/jeg0;->m:Z

    .line 427
    .line 428
    if-eqz v0, :cond_10

    .line 429
    .line 430
    iget-object v0, p0, Ll/jeg0;->a:Landroid/content/Context;

    .line 431
    .line 432
    sget-object v1, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    .line 433
    .line 434
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    const-string v1, "connectivity"

    .line 439
    .line 440
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 445
    .line 446
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 447
    .line 448
    .line 449
    move-result-object v1

    .line 450
    :cond_10
    iget v0, p1, Ll/teg0;->r:I

    .line 451
    .line 452
    if-lez v0, :cond_11

    .line 453
    .line 454
    sub-int/2addr v0, v3

    .line 455
    iput v0, p1, Ll/teg0;->r:I

    .line 456
    .line 457
    iget-object v0, p1, Ll/teg0;->j:Ll/uxg0;

    .line 458
    .line 459
    invoke-virtual {v0, v1}, Ll/uxg0;->c(Landroid/net/NetworkInfo;)Z

    .line 460
    .line 461
    .line 462
    move-result v0

    .line 463
    goto :goto_6

    .line 464
    :cond_11
    move v0, v2

    .line 465
    :goto_6
    if-eqz v0, :cond_13

    .line 466
    .line 467
    iget-object v0, p1, Ll/teg0;->b:Ll/feg0;

    .line 468
    .line 469
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 470
    .line 471
    .line 472
    iget-object v0, p1, Ll/teg0;->p:Ljava/lang/Exception;

    .line 473
    .line 474
    instance-of v0, v0, LSuddo/Sudwhile;

    .line 475
    .line 476
    if-eqz v0, :cond_12

    .line 477
    .line 478
    iget v0, p1, Ll/teg0;->i:I

    .line 479
    .line 480
    or-int/2addr v0, v3

    .line 481
    iput v0, p1, Ll/teg0;->i:I

    .line 482
    .line 483
    :cond_12
    iget-object p0, p0, Ll/jeg0;->b:Ll/ang0;

    .line 484
    .line 485
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 486
    .line 487
    .line 488
    new-instance v0, Ll/tmg0;

    .line 489
    .line 490
    invoke-direct {v0, p1}, Ll/tmg0;-><init>(Ll/teg0;)V

    .line 491
    .line 492
    .line 493
    invoke-virtual {p0, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 494
    .line 495
    .line 496
    iput-object v0, p1, Ll/teg0;->n:Ljava/util/concurrent/Future;

    .line 497
    .line 498
    return-void

    .line 499
    :cond_13
    iget-boolean v0, p0, Ll/jeg0;->m:Z

    .line 500
    .line 501
    if-eqz v0, :cond_14

    .line 502
    .line 503
    iget-object v0, p1, Ll/teg0;->j:Ll/uxg0;

    .line 504
    .line 505
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 506
    .line 507
    .line 508
    instance-of v0, v0, Ll/tvg0;

    .line 509
    .line 510
    if-eqz v0, :cond_14

    .line 511
    .line 512
    move v0, v3

    .line 513
    goto :goto_7

    .line 514
    :cond_14
    move v0, v2

    .line 515
    :goto_7
    iget-object v1, p1, Ll/teg0;->b:Ll/feg0;

    .line 516
    .line 517
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 518
    .line 519
    .line 520
    iget-object v1, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 521
    .line 522
    iget-object v4, p1, Ll/teg0;->f:Ljava/lang/String;

    .line 523
    .line 524
    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    invoke-virtual {p0, p1}, Ll/jeg0;->a(Ll/teg0;)V

    .line 528
    .line 529
    .line 530
    if-eqz v0, :cond_17

    .line 531
    .line 532
    iget-object v0, p1, Ll/teg0;->k:Ll/wqg0;

    .line 533
    .line 534
    if-eqz v0, :cond_15

    .line 535
    .line 536
    invoke-virtual {v0}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v1

    .line 540
    if-eqz v1, :cond_15

    .line 541
    .line 542
    iput-boolean v3, v0, Ll/wqg0;->g:Z

    .line 543
    .line 544
    iget-object v4, p0, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 545
    .line 546
    invoke-virtual {v4, v1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    :cond_15
    iget-object p1, p1, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 550
    .line 551
    if-eqz p1, :cond_17

    .line 552
    .line 553
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 554
    .line 555
    .line 556
    move-result v0

    .line 557
    :goto_8
    if-ge v2, v0, :cond_17

    .line 558
    .line 559
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object v1

    .line 563
    check-cast v1, Ll/wqg0;

    .line 564
    .line 565
    invoke-virtual {v1}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 566
    .line 567
    .line 568
    move-result-object v4

    .line 569
    if-eqz v4, :cond_16

    .line 570
    .line 571
    iput-boolean v3, v1, Ll/wqg0;->g:Z

    .line 572
    .line 573
    iget-object v5, p0, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 574
    .line 575
    invoke-virtual {v5, v4, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    .line 577
    .line 578
    :cond_16
    add-int/lit8 v2, v2, 0x1

    .line 579
    .line 580
    goto :goto_8

    .line 581
    :cond_17
    :goto_9
    return-void

    .line 582
    :pswitch_8
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 583
    .line 584
    check-cast p1, Ll/teg0;

    .line 585
    .line 586
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 587
    .line 588
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 589
    .line 590
    .line 591
    iget v0, p1, Ll/teg0;->h:I

    .line 592
    .line 593
    and-int/lit8 v0, v0, 0x2

    .line 594
    .line 595
    if-nez v0, :cond_18

    .line 596
    .line 597
    iget-object v0, p0, Ll/jeg0;->j:Ll/cng0;

    .line 598
    .line 599
    iget-object v1, p1, Ll/teg0;->f:Ljava/lang/String;

    .line 600
    .line 601
    iget-object v2, p1, Ll/teg0;->m:Landroid/graphics/Bitmap;

    .line 602
    .line 603
    invoke-virtual {v0, v1, v2}, Ll/cng0;->c(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 604
    .line 605
    .line 606
    :cond_18
    iget-object v0, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 607
    .line 608
    iget-object v1, p1, Ll/teg0;->f:Ljava/lang/String;

    .line 609
    .line 610
    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    invoke-virtual {p0, p1}, Ll/jeg0;->a(Ll/teg0;)V

    .line 614
    .line 615
    .line 616
    iget-object p0, p1, Ll/teg0;->b:Ll/feg0;

    .line 617
    .line 618
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 619
    .line 620
    .line 621
    return-void

    .line 622
    :pswitch_9
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 623
    .line 624
    check-cast p1, Ll/wqg0;

    .line 625
    .line 626
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 627
    .line 628
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 629
    .line 630
    .line 631
    iget-object v0, p1, Ll/wqg0;->e:Ljava/lang/String;

    .line 632
    .line 633
    iget-object v1, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 634
    .line 635
    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v1

    .line 639
    check-cast v1, Ll/teg0;

    .line 640
    .line 641
    if-eqz v1, :cond_1b

    .line 642
    .line 643
    invoke-virtual {v1, p1}, Ll/teg0;->c(Ll/wqg0;)V

    .line 644
    .line 645
    .line 646
    iget-object v4, v1, Ll/teg0;->k:Ll/wqg0;

    .line 647
    .line 648
    if-nez v4, :cond_1a

    .line 649
    .line 650
    iget-object v4, v1, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 651
    .line 652
    if-eqz v4, :cond_19

    .line 653
    .line 654
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 655
    .line 656
    .line 657
    move-result v4

    .line 658
    if-eqz v4, :cond_1a

    .line 659
    .line 660
    :cond_19
    iget-object v1, v1, Ll/teg0;->n:Ljava/util/concurrent/Future;

    .line 661
    .line 662
    if-eqz v1, :cond_1a

    .line 663
    .line 664
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 665
    .line 666
    .line 667
    move-result v1

    .line 668
    if-eqz v1, :cond_1a

    .line 669
    .line 670
    move v2, v3

    .line 671
    :cond_1a
    if-eqz v2, :cond_1b

    .line 672
    .line 673
    iget-object v1, p0, Ll/jeg0;->d:Ljava/util/LinkedHashMap;

    .line 674
    .line 675
    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    .line 677
    .line 678
    :cond_1b
    iget-object v0, p0, Ll/jeg0;->g:Ljava/util/LinkedHashSet;

    .line 679
    .line 680
    iget-object v1, p1, Ll/wqg0;->f:Ll/wqg0;

    .line 681
    .line 682
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 683
    .line 684
    .line 685
    move-result v0

    .line 686
    if-eqz v0, :cond_1c

    .line 687
    .line 688
    iget-object v0, p0, Ll/jeg0;->f:Ljava/util/WeakHashMap;

    .line 689
    .line 690
    invoke-virtual {p1}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v1

    .line 694
    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    .line 696
    .line 697
    :cond_1c
    iget-object p0, p0, Ll/jeg0;->e:Ljava/util/WeakHashMap;

    .line 698
    .line 699
    invoke-virtual {p1}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 700
    .line 701
    .line 702
    move-result-object p1

    .line 703
    invoke-virtual {p0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    .line 705
    .line 706
    move-result-object p0

    .line 707
    check-cast p0, Ll/wqg0;

    .line 708
    .line 709
    return-void

    .line 710
    :pswitch_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 711
    .line 712
    check-cast p1, Ll/wqg0;

    .line 713
    .line 714
    iget-object p0, p0, Ll/nvg0;->a:Ll/jeg0;

    .line 715
    .line 716
    invoke-virtual {p0, p1, v3}, Ll/jeg0;->b(Ll/wqg0;Z)V

    .line 717
    .line 718
    .line 719
    return-void

    .line 720
    nop

    .line 721
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

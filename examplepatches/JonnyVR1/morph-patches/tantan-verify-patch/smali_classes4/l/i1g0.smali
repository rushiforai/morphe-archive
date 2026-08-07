.class public Ll/i1g0;
.super Ll/kmq0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kmq0<",
        "Ll/g1g0;",
        ">;"
    }
.end annotation


# instance fields
.field private c:Z


# direct methods
.method public constructor <init>(Ll/g1g0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kmq0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/i1g0;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 8
    .line 9
    return-void
.end method

.method private b()Ll/ho0;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/i1g0;->c:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/g1g0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/ho0$a;->b()Ll/ho0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    check-cast p0, Ll/g1g0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/p60;->g()Ll/c53;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/ho0$a;->b()Ll/ho0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;[Ljava/lang/String;Z)V
    .locals 5

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x2

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    if-eqz p3, :cond_4

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    sparse-switch p2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :sswitch_0
    const-string p2, "actor"

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :sswitch_1
    const-string p2, "bone"

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move v0, v2

    .line 39
    goto :goto_0

    .line 40
    :sswitch_2
    const-string p2, "anim"

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move v0, v3

    .line 50
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 51
    .line 52
    .line 53
    goto/16 :goto_2

    .line 54
    .line 55
    :pswitch_0
    iput-boolean v2, p0, Ll/i1g0;->c:Z

    .line 56
    .line 57
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 58
    .line 59
    move-object p1, p0

    .line 60
    check-cast p1, Ll/g1g0;

    .line 61
    .line 62
    iget-object p1, p1, Ll/g1g0;->A:Ljava/util/List;

    .line 63
    .line 64
    new-instance p2, Ll/p60;

    .line 65
    .line 66
    check-cast p0, Ll/g1g0;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/p60;-><init>(Ll/g1g0;)V

    .line 69
    .line 70
    .line 71
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :pswitch_1
    iput-boolean v3, p0, Ll/i1g0;->c:Z

    .line 76
    .line 77
    iget-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 78
    .line 79
    check-cast p1, Ll/g1g0;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/g1g0;->k()Ll/p60;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object p1, p1, Ll/p60;->g:Ljava/util/List;

    .line 86
    .line 87
    new-instance p2, Ll/c53;

    .line 88
    .line 89
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 90
    .line 91
    check-cast p0, Ll/g1g0;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-direct {p2, p0}, Ll/c53;-><init>(Ll/p60;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :pswitch_2
    iget-boolean p1, p0, Ll/i1g0;->c:Z

    .line 105
    .line 106
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 107
    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    check-cast p0, Ll/g1g0;

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iget-object p1, p0, Ll/ho0$a;->e:Ljava/util/List;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/p60;->d()Ll/ho0;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_3
    check-cast p0, Ll/g1g0;

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Ll/p60;->g()Ll/c53;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    iget-object p1, p0, Ll/ho0$a;->e:Ljava/util/List;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/c53;->d()Ll/ho0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result p3

    .line 153
    const/4 v4, 0x3

    .line 154
    sparse-switch p3, :sswitch_data_1

    .line 155
    .line 156
    .line 157
    goto/16 :goto_1

    .line 158
    .line 159
    :sswitch_3
    const-string p3, "layout_type"

    .line 160
    .line 161
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_5

    .line 166
    .line 167
    goto/16 :goto_1

    .line 168
    .line 169
    :cond_5
    const/16 v0, 0xf

    .line 170
    .line 171
    goto/16 :goto_1

    .line 172
    .line 173
    :sswitch_4
    const-string p3, "alpha_interpolator"

    .line 174
    .line 175
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-nez p1, :cond_6

    .line 180
    .line 181
    goto/16 :goto_1

    .line 182
    .line 183
    :cond_6
    const/16 v0, 0xe

    .line 184
    .line 185
    goto/16 :goto_1

    .line 186
    .line 187
    :sswitch_5
    const-string p3, "scale"

    .line 188
    .line 189
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-nez p1, :cond_7

    .line 194
    .line 195
    goto/16 :goto_1

    .line 196
    .line 197
    :cond_7
    const/16 v0, 0xd

    .line 198
    .line 199
    goto/16 :goto_1

    .line 200
    .line 201
    :sswitch_6
    const-string p3, "range"

    .line 202
    .line 203
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_8

    .line 208
    .line 209
    goto/16 :goto_1

    .line 210
    .line 211
    :cond_8
    const/16 v0, 0xc

    .line 212
    .line 213
    goto/16 :goto_1

    .line 214
    .line 215
    :sswitch_7
    const-string p3, "alpha"

    .line 216
    .line 217
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    if-nez p1, :cond_9

    .line 222
    .line 223
    goto/16 :goto_1

    .line 224
    .line 225
    :cond_9
    const/16 v0, 0xb

    .line 226
    .line 227
    goto/16 :goto_1

    .line 228
    .line 229
    :sswitch_8
    const-string p3, "name"

    .line 230
    .line 231
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-nez p1, :cond_a

    .line 236
    .line 237
    goto/16 :goto_1

    .line 238
    .line 239
    :cond_a
    const/16 v0, 0xa

    .line 240
    .line 241
    goto/16 :goto_1

    .line 242
    .line 243
    :sswitch_9
    const-string p3, "move"

    .line 244
    .line 245
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-nez p1, :cond_b

    .line 250
    .line 251
    goto/16 :goto_1

    .line 252
    .line 253
    :cond_b
    const/16 v0, 0x9

    .line 254
    .line 255
    goto/16 :goto_1

    .line 256
    .line 257
    :sswitch_a
    const-string p3, "scale_interpolator"

    .line 258
    .line 259
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    if-nez p1, :cond_c

    .line 264
    .line 265
    goto/16 :goto_1

    .line 266
    .line 267
    :cond_c
    const/16 v0, 0x8

    .line 268
    .line 269
    goto/16 :goto_1

    .line 270
    .line 271
    :sswitch_b
    const-string p3, "src_id_wh"

    .line 272
    .line 273
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    if-nez p1, :cond_d

    .line 278
    .line 279
    goto :goto_1

    .line 280
    :cond_d
    const/4 v0, 0x7

    .line 281
    goto :goto_1

    .line 282
    :sswitch_c
    const-string p3, "src_ltwh"

    .line 283
    .line 284
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    if-nez p1, :cond_e

    .line 289
    .line 290
    goto :goto_1

    .line 291
    :cond_e
    const/4 v0, 0x6

    .line 292
    goto :goto_1

    .line 293
    :sswitch_d
    const-string p3, "width_height"

    .line 294
    .line 295
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-nez p1, :cond_f

    .line 300
    .line 301
    goto :goto_1

    .line 302
    :cond_f
    const/4 v0, 0x5

    .line 303
    goto :goto_1

    .line 304
    :sswitch_e
    const-string p3, "rotate"

    .line 305
    .line 306
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    if-nez p1, :cond_10

    .line 311
    .line 312
    goto :goto_1

    .line 313
    :cond_10
    const/4 v0, 0x4

    .line 314
    goto :goto_1

    .line 315
    :sswitch_f
    const-string p3, "move_interpolator"

    .line 316
    .line 317
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    if-nez p1, :cond_11

    .line 322
    .line 323
    goto :goto_1

    .line 324
    :cond_11
    move v0, v4

    .line 325
    goto :goto_1

    .line 326
    :sswitch_10
    const-string p3, "rotate_interpolator"

    .line 327
    .line 328
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    if-nez p1, :cond_12

    .line 333
    .line 334
    goto :goto_1

    .line 335
    :cond_12
    move v0, v1

    .line 336
    goto :goto_1

    .line 337
    :sswitch_11
    const-string p3, "extend_y"

    .line 338
    .line 339
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    if-nez p1, :cond_13

    .line 344
    .line 345
    goto :goto_1

    .line 346
    :cond_13
    move v0, v2

    .line 347
    goto :goto_1

    .line 348
    :sswitch_12
    const-string p3, "duration"

    .line 349
    .line 350
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result p1

    .line 354
    if-nez p1, :cond_14

    .line 355
    .line 356
    goto :goto_1

    .line 357
    :cond_14
    move v0, v3

    .line 358
    :goto_1
    packed-switch v0, :pswitch_data_1

    .line 359
    .line 360
    .line 361
    goto/16 :goto_2

    .line 362
    .line 363
    :pswitch_3
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 364
    .line 365
    check-cast p0, Ll/g1g0;

    .line 366
    .line 367
    aget-object p1, p2, v3

    .line 368
    .line 369
    iput-object p1, p0, Lcom/sunshine/engine/base/a;->k:Ljava/lang/String;

    .line 370
    .line 371
    return-void

    .line 372
    :pswitch_4
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    iget-object p0, p0, Ll/ho0;->i:Ll/lk90;

    .line 377
    .line 378
    aget-object p1, p2, v3

    .line 379
    .line 380
    invoke-virtual {p0, p1}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 381
    .line 382
    .line 383
    return-void

    .line 384
    :pswitch_5
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    iget-object p1, p0, Ll/ho0;->e:Ll/kk90;

    .line 389
    .line 390
    aget-object p3, p2, v3

    .line 391
    .line 392
    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 393
    .line 394
    .line 395
    move-result p3

    .line 396
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 397
    .line 398
    .line 399
    move-result-object p3

    .line 400
    aget-object v0, p2, v1

    .line 401
    .line 402
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    invoke-virtual {p1, p3, v0}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 411
    .line 412
    .line 413
    iget-object p0, p0, Ll/ho0;->f:Ll/kk90;

    .line 414
    .line 415
    aget-object p1, p2, v2

    .line 416
    .line 417
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 418
    .line 419
    .line 420
    move-result p1

    .line 421
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 422
    .line 423
    .line 424
    move-result-object p1

    .line 425
    aget-object p2, p2, v4

    .line 426
    .line 427
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 428
    .line 429
    .line 430
    move-result p2

    .line 431
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 432
    .line 433
    .line 434
    move-result-object p2

    .line 435
    invoke-virtual {p0, p1, p2}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 436
    .line 437
    .line 438
    return-void

    .line 439
    :pswitch_6
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 440
    .line 441
    .line 442
    move-result-object p0

    .line 443
    iget-object p0, p0, Ll/ho0;->a:Ll/tfe;

    .line 444
    .line 445
    aget-object p1, p2, v3

    .line 446
    .line 447
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 448
    .line 449
    .line 450
    move-result p1

    .line 451
    aget-object p2, p2, v2

    .line 452
    .line 453
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 454
    .line 455
    .line 456
    move-result p2

    .line 457
    invoke-virtual {p0, p1, p2}, Ll/tfe;->e(FF)V

    .line 458
    .line 459
    .line 460
    return-void

    .line 461
    :pswitch_7
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    iget-object p0, p0, Ll/ho0;->i:Ll/lk90;

    .line 466
    .line 467
    aget-object p1, p2, v3

    .line 468
    .line 469
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 470
    .line 471
    .line 472
    move-result p1

    .line 473
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    aget-object p2, p2, v2

    .line 478
    .line 479
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 480
    .line 481
    .line 482
    move-result p2

    .line 483
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 484
    .line 485
    .line 486
    move-result-object p2

    .line 487
    invoke-virtual {p0, p1, p2}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 488
    .line 489
    .line 490
    return-void

    .line 491
    :pswitch_8
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 492
    .line 493
    check-cast p0, Ll/g1g0;

    .line 494
    .line 495
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 496
    .line 497
    .line 498
    move-result-object p0

    .line 499
    invoke-virtual {p0}, Ll/p60;->g()Ll/c53;

    .line 500
    .line 501
    .line 502
    move-result-object p0

    .line 503
    aget-object p1, p2, v3

    .line 504
    .line 505
    iput-object p1, p0, Ll/mrf0;->d:Ljava/lang/String;

    .line 506
    .line 507
    return-void

    .line 508
    :pswitch_9
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 509
    .line 510
    .line 511
    move-result-object p0

    .line 512
    iget-object p1, p0, Ll/ho0;->b:Ll/kk90;

    .line 513
    .line 514
    aget-object p3, p2, v3

    .line 515
    .line 516
    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 517
    .line 518
    .line 519
    move-result p3

    .line 520
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 521
    .line 522
    .line 523
    move-result-object p3

    .line 524
    aget-object v0, p2, v1

    .line 525
    .line 526
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    invoke-virtual {p1, p3, v0}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 535
    .line 536
    .line 537
    iget-object p0, p0, Ll/ho0;->c:Ll/kk90;

    .line 538
    .line 539
    aget-object p1, p2, v2

    .line 540
    .line 541
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 542
    .line 543
    .line 544
    move-result p1

    .line 545
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 546
    .line 547
    .line 548
    move-result-object p1

    .line 549
    aget-object p2, p2, v4

    .line 550
    .line 551
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 552
    .line 553
    .line 554
    move-result p2

    .line 555
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 556
    .line 557
    .line 558
    move-result-object p2

    .line 559
    invoke-virtual {p0, p1, p2}, Ll/kk90;->m(Ljava/lang/Float;Ljava/lang/Float;)Ll/kk90;

    .line 560
    .line 561
    .line 562
    return-void

    .line 563
    :pswitch_a
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 564
    .line 565
    .line 566
    move-result-object p0

    .line 567
    iget-object p1, p0, Ll/ho0;->e:Ll/kk90;

    .line 568
    .line 569
    aget-object p3, p2, v3

    .line 570
    .line 571
    invoke-virtual {p1, p3}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 572
    .line 573
    .line 574
    iget-object p0, p0, Ll/ho0;->f:Ll/kk90;

    .line 575
    .line 576
    aget-object p1, p2, v2

    .line 577
    .line 578
    invoke-virtual {p0, p1}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 579
    .line 580
    .line 581
    return-void

    .line 582
    :pswitch_b
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 583
    .line 584
    check-cast p0, Ll/g1g0;

    .line 585
    .line 586
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 587
    .line 588
    .line 589
    move-result-object p0

    .line 590
    invoke-virtual {p0}, Ll/p60;->g()Ll/c53;

    .line 591
    .line 592
    .line 593
    move-result-object p0

    .line 594
    aget-object p1, p2, v3

    .line 595
    .line 596
    iput-object p1, p0, Ll/c53;->g:Ljava/lang/String;

    .line 597
    .line 598
    iget-object p0, p0, Ll/c53;->f:Ljava/util/List;

    .line 599
    .line 600
    new-instance p1, Landroid/graphics/Rect;

    .line 601
    .line 602
    aget-object p3, p2, v2

    .line 603
    .line 604
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 605
    .line 606
    .line 607
    move-result p3

    .line 608
    aget-object p2, p2, v1

    .line 609
    .line 610
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 611
    .line 612
    .line 613
    move-result p2

    .line 614
    invoke-direct {p1, v3, v3, p3, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 615
    .line 616
    .line 617
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 618
    .line 619
    .line 620
    return-void

    .line 621
    :pswitch_c
    iget-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 622
    .line 623
    check-cast p1, Ll/g1g0;

    .line 624
    .line 625
    invoke-virtual {p1}, Ll/g1g0;->k()Ll/p60;

    .line 626
    .line 627
    .line 628
    move-result-object p1

    .line 629
    invoke-virtual {p1}, Ll/p60;->g()Ll/c53;

    .line 630
    .line 631
    .line 632
    move-result-object p1

    .line 633
    aget-object p3, p2, v3

    .line 634
    .line 635
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 636
    .line 637
    .line 638
    move-result p3

    .line 639
    aget-object v0, p2, v2

    .line 640
    .line 641
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 642
    .line 643
    .line 644
    move-result v0

    .line 645
    aget-object v1, p2, v1

    .line 646
    .line 647
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 648
    .line 649
    .line 650
    move-result v1

    .line 651
    add-int/2addr v1, p3

    .line 652
    aget-object p2, p2, v4

    .line 653
    .line 654
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 655
    .line 656
    .line 657
    move-result p2

    .line 658
    add-int/2addr p2, v0

    .line 659
    new-instance v2, Landroid/graphics/Rect;

    .line 660
    .line 661
    invoke-direct {v2, p3, v0, v1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 662
    .line 663
    .line 664
    iget-object p2, p1, Ll/c53;->f:Ljava/util/List;

    .line 665
    .line 666
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    .line 668
    .line 669
    iget-object p1, p1, Ll/mrf0;->d:Ljava/lang/String;

    .line 670
    .line 671
    if-eqz p1, :cond_15

    .line 672
    .line 673
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 674
    .line 675
    check-cast p0, Ll/g1g0;

    .line 676
    .line 677
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->y:Ljava/util/Map;

    .line 678
    .line 679
    invoke-interface {p0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    .line 681
    .line 682
    return-void

    .line 683
    :pswitch_d
    iget-object p1, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 684
    .line 685
    check-cast p1, Ll/g1g0;

    .line 686
    .line 687
    iget-object p1, p1, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 688
    .line 689
    aget-object p3, p2, v3

    .line 690
    .line 691
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 692
    .line 693
    .line 694
    move-result p3

    .line 695
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 696
    .line 697
    .line 698
    move-result-object p3

    .line 699
    iput-object p3, p1, Ll/drf0;->a:Ljava/lang/Object;

    .line 700
    .line 701
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 702
    .line 703
    check-cast p0, Ll/g1g0;

    .line 704
    .line 705
    iget-object p0, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 706
    .line 707
    aget-object p1, p2, v2

    .line 708
    .line 709
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 710
    .line 711
    .line 712
    move-result p1

    .line 713
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 714
    .line 715
    .line 716
    move-result-object p1

    .line 717
    iput-object p1, p0, Ll/drf0;->b:Ljava/lang/Object;

    .line 718
    .line 719
    return-void

    .line 720
    :pswitch_e
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 721
    .line 722
    .line 723
    move-result-object p0

    .line 724
    iget-object p1, p0, Ll/ho0;->h:Ll/lk90;

    .line 725
    .line 726
    aget-object p3, p2, v3

    .line 727
    .line 728
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 729
    .line 730
    .line 731
    move-result p3

    .line 732
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 733
    .line 734
    .line 735
    move-result-object p3

    .line 736
    aget-object v0, p2, v2

    .line 737
    .line 738
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 739
    .line 740
    .line 741
    move-result v0

    .line 742
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 743
    .line 744
    .line 745
    move-result-object v0

    .line 746
    invoke-virtual {p1, p3, v0}, Ll/lk90;->m(Ljava/lang/Integer;Ljava/lang/Integer;)Ll/lk90;

    .line 747
    .line 748
    .line 749
    iget-object p0, p0, Ll/ho0;->g:Ll/li80;

    .line 750
    .line 751
    aget-object p1, p2, v1

    .line 752
    .line 753
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 754
    .line 755
    .line 756
    move-result p1

    .line 757
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 758
    .line 759
    .line 760
    move-result-object p1

    .line 761
    aget-object p2, p2, v4

    .line 762
    .line 763
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 764
    .line 765
    .line 766
    move-result p2

    .line 767
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 768
    .line 769
    .line 770
    move-result-object p2

    .line 771
    invoke-virtual {p0, p1, p2}, Ll/li80;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 772
    .line 773
    .line 774
    return-void

    .line 775
    :pswitch_f
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 776
    .line 777
    .line 778
    move-result-object p0

    .line 779
    iget-object p1, p0, Ll/ho0;->b:Ll/kk90;

    .line 780
    .line 781
    aget-object p3, p2, v3

    .line 782
    .line 783
    invoke-virtual {p1, p3}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 784
    .line 785
    .line 786
    iget-object p0, p0, Ll/ho0;->c:Ll/kk90;

    .line 787
    .line 788
    aget-object p1, p2, v2

    .line 789
    .line 790
    invoke-virtual {p0, p1}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 791
    .line 792
    .line 793
    return-void

    .line 794
    :pswitch_10
    invoke-direct {p0}, Ll/i1g0;->b()Ll/ho0;

    .line 795
    .line 796
    .line 797
    move-result-object p0

    .line 798
    iget-object p0, p0, Ll/ho0;->h:Ll/lk90;

    .line 799
    .line 800
    aget-object p1, p2, v3

    .line 801
    .line 802
    invoke-virtual {p0, p1}, Ll/ok90;->k(Ljava/lang/String;)Ll/ok90;

    .line 803
    .line 804
    .line 805
    return-void

    .line 806
    :pswitch_11
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 807
    .line 808
    check-cast p0, Ll/g1g0;

    .line 809
    .line 810
    invoke-virtual {p0}, Ll/g1g0;->k()Ll/p60;

    .line 811
    .line 812
    .line 813
    move-result-object p0

    .line 814
    invoke-virtual {p0}, Ll/p60;->g()Ll/c53;

    .line 815
    .line 816
    .line 817
    move-result-object p0

    .line 818
    aget-object p1, p2, v3

    .line 819
    .line 820
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 821
    .line 822
    .line 823
    move-result p1

    .line 824
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 825
    .line 826
    .line 827
    move-result-object p1

    .line 828
    iput-object p1, p0, Ll/c53;->i:Ljava/lang/Integer;

    .line 829
    .line 830
    return-void

    .line 831
    :pswitch_12
    iget-object p0, p0, Ll/kmq0;->b:Lcom/sunshine/engine/base/a;

    .line 832
    .line 833
    move-object p1, p0

    .line 834
    check-cast p1, Ll/g1g0;

    .line 835
    .line 836
    iget-boolean p1, p1, Lcom/sunshine/engine/base/a;->l:Z

    .line 837
    .line 838
    if-eqz p1, :cond_15

    .line 839
    .line 840
    check-cast p0, Ll/g1g0;

    .line 841
    .line 842
    aget-object p1, p2, v3

    .line 843
    .line 844
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 845
    .line 846
    .line 847
    move-result p1

    .line 848
    iput p1, p0, Lcom/sunshine/engine/base/a;->m:I

    .line 849
    .line 850
    :cond_15
    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        0x2dc211 -> :sswitch_2
        0x2e3ac4 -> :sswitch_1
        0x585a9f5 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        -0x76bbb26c -> :sswitch_12
        -0x6c88936c -> :sswitch_11
        -0x56235ed5 -> :sswitch_10
        -0x52380d8b -> :sswitch_f
        -0x372522a5 -> :sswitch_e
        -0x32c98a40 -> :sswitch_d
        -0x18f51c2c -> :sswitch_c
        -0x5e04da6 -> :sswitch_b
        -0x3de6e64 -> :sswitch_a
        0x333bd1 -> :sswitch_9
        0x337a8b -> :sswitch_8
        0x589b15e -> :sswitch_7
        0x674393d -> :sswitch_6
        0x683094a -> :sswitch_5
        0x487faa08 -> :sswitch_4
        0x77e6b72f -> :sswitch_3
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

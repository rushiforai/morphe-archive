.class public Ll/d0p;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p0}, Ll/d0p;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
    .locals 6

    .line 1
    sget-object v0, Ll/d0p$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    const-string v2, "https://auto.tancdn.com/v1/raw/f6c163cb-aa67-455d-b289-5953e6d9b54411.webp"

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :pswitch_0
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S5:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->S5:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->R5:I

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :pswitch_1
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->Y5:I

    .line 65
    .line 66
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->X5:I

    .line 67
    .line 68
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ilk1S1dXSlBVMjJTRVZBNUtVQkhNVEs0VUs2NVpEUzE0IiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5MTE4OTg4NDA2MTk0MjExOTB9.png"

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0, v0}, Ll/b690;->f(I)Ll/b690;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_0

    .line 104
    .line 105
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->W5:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->V5:I

    .line 109
    .line 110
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W5:I

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->V5:I

    .line 120
    .line 121
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->U5:I

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_2
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->T5:I

    .line 131
    .line 132
    :goto_2
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVFNk01MlNIM0hXTFQ2NUdaWDdDU1JUQVNLUjJZRzE0IiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDI0MzQ4MTI4NTA5NTY5NTY2fQ.png"

    .line 141
    .line 142
    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0, v1}, Ll/b690;->f(I)Ll/b690;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0

    .line 163
    :pswitch_3
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-eqz p0, :cond_3

    .line 168
    .line 169
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZYNVRDT002NkdJNEJCR0w1U0EzUUVHTkFDVlpWSjE0IiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NjMyMzI1Mzc0MzY3ODcwNzQ4fQ.png"

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_3
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFEVE82RjRQMlQ3RzJONEpLUFdWQ081SkdPN0FHNDE0IiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDkyNzM5ODg3OTcwMjY2NjM4fQ.png"

    .line 173
    .line 174
    :goto_3
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_4

    .line 179
    .line 180
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e6:I

    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_4
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->d6:I

    .line 184
    .line 185
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-eqz v1, :cond_5

    .line 190
    .line 191
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->e6:I

    .line 192
    .line 193
    goto :goto_5

    .line 194
    :cond_5
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->d6:I

    .line 195
    .line 196
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eqz v2, :cond_6

    .line 201
    .line 202
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->c6:I

    .line 203
    .line 204
    goto :goto_6

    .line 205
    :cond_6
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->b6:I

    .line 206
    .line 207
    :goto_6
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v3, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-virtual {p0, v1}, Ll/b690;->l(I)Ll/b690;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-virtual {p0, v2}, Ll/b690;->f(I)Ll/b690;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    return-object p0

    .line 236
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 237
    .line 238
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 239
    .line 240
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_8

    .line 249
    .line 250
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-nez v0, :cond_7

    .line 255
    .line 256
    goto :goto_7

    .line 257
    :cond_7
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m3:I

    .line 258
    .line 259
    goto :goto_8

    .line 260
    :cond_8
    :goto_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->G7()Z

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    if-eqz v0, :cond_9

    .line 273
    .line 274
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l3:I

    .line 275
    .line 276
    goto :goto_8

    .line 277
    :cond_9
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->n3:I

    .line 278
    .line 279
    :goto_8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-eqz v1, :cond_b

    .line 284
    .line 285
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    if-nez p0, :cond_a

    .line 290
    .line 291
    goto :goto_9

    .line 292
    :cond_a
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->j3:I

    .line 293
    .line 294
    goto :goto_a

    .line 295
    :cond_b
    :goto_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->G7()Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-eqz p0, :cond_c

    .line 308
    .line 309
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->i3:I

    .line 310
    .line 311
    goto :goto_a

    .line 312
    :cond_c
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->k3:I

    .line 313
    .line 314
    :goto_a
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    sget v1, Ll/jbc0;->f8:I

    .line 323
    .line 324
    invoke-virtual {p1, v1}, Ll/b690;->i(I)Ll/b690;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    return-object p0

    .line 345
    :pswitch_5
    invoke-static {}, Ll/c17;->u0()Z

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    if-eqz p0, :cond_d

    .line 358
    .line 359
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->V0:I

    .line 360
    .line 361
    goto :goto_b

    .line 362
    :cond_d
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U0:I

    .line 363
    .line 364
    :goto_b
    invoke-virtual {p1, v0}, Ll/b690;->n(I)Ll/b690;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    if-eqz p0, :cond_e

    .line 369
    .line 370
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T0:I

    .line 371
    .line 372
    goto :goto_c

    .line 373
    :cond_e
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->S0:I

    .line 374
    .line 375
    :goto_c
    invoke-virtual {p1, v0}, Ll/b690;->l(I)Ll/b690;

    .line 376
    .line 377
    .line 378
    move-result-object p1

    .line 379
    if-eqz p0, :cond_f

    .line 380
    .line 381
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->T0:I

    .line 382
    .line 383
    goto :goto_d

    .line 384
    :cond_f
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->S0:I

    .line 385
    .line 386
    :goto_d
    invoke-virtual {p1, p0}, Ll/b690;->f(I)Ll/b690;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fo()I

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    invoke-virtual {p0, p1}, Ll/b690;->i(I)Ll/b690;

    .line 403
    .line 404
    .line 405
    move-result-object p0

    .line 406
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    return-object p0

    .line 411
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 412
    .line 413
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->l6:I

    .line 414
    .line 415
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 420
    .line 421
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->k6:I

    .line 422
    .line 423
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    const-string v1, "https://auto.tancdn.com/v1/raw/1e055c6e-1294-4455-b39b-25165fc3c4a112.webp"

    .line 436
    .line 437
    invoke-virtual {p1, v1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 438
    .line 439
    .line 440
    move-result-object p1

    .line 441
    invoke-virtual {p1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 442
    .line 443
    .line 444
    move-result-object p0

    .line 445
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 446
    .line 447
    .line 448
    move-result-object p0

    .line 449
    invoke-virtual {p0, v0}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 450
    .line 451
    .line 452
    move-result-object p0

    .line 453
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    return-object p0

    .line 458
    :pswitch_7
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    invoke-virtual {p0, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 467
    .line 468
    .line 469
    move-result-object p0

    .line 470
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->B4:I

    .line 471
    .line 472
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    invoke-virtual {p0, v1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 477
    .line 478
    .line 479
    move-result-object p0

    .line 480
    invoke-virtual {p0, v1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 481
    .line 482
    .line 483
    move-result-object p0

    .line 484
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    return-object p0

    .line 489
    :pswitch_8
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 494
    .line 495
    .line 496
    move-result-object p0

    .line 497
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 498
    .line 499
    .line 500
    move-result-object p1

    .line 501
    invoke-virtual {p1}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 502
    .line 503
    .line 504
    move-result-object p1

    .line 505
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Bs()Z

    .line 506
    .line 507
    .line 508
    move-result p1

    .line 509
    if-eqz p1, :cond_10

    .line 510
    .line 511
    const-string p1, "https://auto.tancdn.com/v1/raw/85663437-d130-4bc7-bba1-5821f0b7943c12.webp"

    .line 512
    .line 513
    goto :goto_e

    .line 514
    :cond_10
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkZPVFE3SVBPRVJWSE1FQ1JSNklUUjdSUkk1M1pXVTEzIiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTE3NzE0NjExMDk3MjM5NzMxOH0.png"

    .line 515
    .line 516
    :goto_e
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 517
    .line 518
    .line 519
    move-result-object p0

    .line 520
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 521
    .line 522
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->D4:I

    .line 523
    .line 524
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object p1

    .line 528
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 529
    .line 530
    .line 531
    move-result-object p0

    .line 532
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 533
    .line 534
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->A4:I

    .line 535
    .line 536
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 537
    .line 538
    .line 539
    move-result-object p1

    .line 540
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 541
    .line 542
    .line 543
    move-result-object p0

    .line 544
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 545
    .line 546
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r4:I

    .line 547
    .line 548
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object p1

    .line 552
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 553
    .line 554
    .line 555
    move-result-object p0

    .line 556
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 557
    .line 558
    .line 559
    move-result-object p0

    .line 560
    return-object p0

    .line 561
    :pswitch_9
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->G4:I

    .line 562
    .line 563
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->z4:I

    .line 564
    .line 565
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->q4:I

    .line 566
    .line 567
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 568
    .line 569
    .line 570
    move-result-object v2

    .line 571
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 572
    .line 573
    .line 574
    move-result-object p1

    .line 575
    const-string v2, "https://auto.tancdn.com/v1/raw/1ed2b13c-d582-4afa-8c09-32d9fc4f2f9a10.webp"

    .line 576
    .line 577
    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 578
    .line 579
    .line 580
    move-result-object p1

    .line 581
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 582
    .line 583
    .line 584
    move-result-object p0

    .line 585
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    .line 586
    .line 587
    .line 588
    move-result-object p0

    .line 589
    invoke-virtual {p0, v1}, Ll/b690;->f(I)Ll/b690;

    .line 590
    .line 591
    .line 592
    move-result-object p0

    .line 593
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 594
    .line 595
    .line 596
    move-result-object p0

    .line 597
    return-object p0

    .line 598
    :pswitch_a
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    .line 599
    .line 600
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 601
    .line 602
    .line 603
    move-result v0

    .line 604
    if-eqz v0, :cond_11

    .line 605
    .line 606
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->C4:I

    .line 607
    .line 608
    :cond_11
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->y4:I

    .line 609
    .line 610
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->p4:I

    .line 611
    .line 612
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 613
    .line 614
    .line 615
    move-result-object v2

    .line 616
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 617
    .line 618
    .line 619
    move-result-object p1

    .line 620
    const-string v2, "https://auto.tancdn.com/v1/raw/11c58ba4-4e09-4b06-907e-46899bf7117611.webp"

    .line 621
    .line 622
    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 623
    .line 624
    .line 625
    move-result-object p1

    .line 626
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 627
    .line 628
    .line 629
    move-result-object p0

    .line 630
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    .line 631
    .line 632
    .line 633
    move-result-object p0

    .line 634
    invoke-virtual {p0, v1}, Ll/b690;->f(I)Ll/b690;

    .line 635
    .line 636
    .line 637
    move-result-object p0

    .line 638
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 639
    .line 640
    .line 641
    move-result-object p0

    .line 642
    return-object p0

    .line 643
    :pswitch_b
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 644
    .line 645
    .line 646
    move-result-object p0

    .line 647
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 648
    .line 649
    .line 650
    move-result-object p0

    .line 651
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 652
    .line 653
    .line 654
    move-result p1

    .line 655
    if-eqz p1, :cond_12

    .line 656
    .line 657
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IktXQkVFRzZHMkZGQU8yRzdXTzNTN01SUlhDREhPSzEzIiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjg5MzQ4ODQ5NzcyNzI5MTM5fQ.png"

    .line 658
    .line 659
    goto :goto_f

    .line 660
    :cond_12
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNXNTNKU0ZKVFdNSk5HNU5YNDJGSkZJUlhRVldFUTE0IiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTkxNzY2MzgxNzc2MjgxMzk0fQ.png"

    .line 661
    .line 662
    :goto_f
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 663
    .line 664
    .line 665
    move-result-object p0

    .line 666
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 667
    .line 668
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->M4:I

    .line 669
    .line 670
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 671
    .line 672
    .line 673
    move-result-object p1

    .line 674
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 675
    .line 676
    .line 677
    move-result-object p0

    .line 678
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 679
    .line 680
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->x4:I

    .line 681
    .line 682
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object p1

    .line 686
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 687
    .line 688
    .line 689
    move-result-object p0

    .line 690
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 691
    .line 692
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o4:I

    .line 693
    .line 694
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object p1

    .line 698
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 699
    .line 700
    .line 701
    move-result-object p0

    .line 702
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 703
    .line 704
    .line 705
    move-result-object p0

    .line 706
    return-object p0

    .line 707
    :pswitch_c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 708
    .line 709
    .line 710
    move-result-object p0

    .line 711
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 712
    .line 713
    .line 714
    move-result-object p0

    .line 715
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IjY5NTcwM0Y2MjE1MTQ1NjI4QUExNTU0QjNCMjBERTVFIiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njc1MTI1MzU3OTIwOTQ3MzQsInB0IjoyMDI2MDIwMzE3fQ.png"

    .line 716
    .line 717
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 718
    .line 719
    .line 720
    move-result-object p0

    .line 721
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 722
    .line 723
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r2:I

    .line 724
    .line 725
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 726
    .line 727
    .line 728
    move-result-object p1

    .line 729
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 730
    .line 731
    .line 732
    move-result-object p0

    .line 733
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 734
    .line 735
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e3:I

    .line 736
    .line 737
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 738
    .line 739
    .line 740
    move-result-object p1

    .line 741
    invoke-static {}, Ll/joa;->s3()I

    .line 742
    .line 743
    .line 744
    move-result v0

    .line 745
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 746
    .line 747
    .line 748
    move-result-object v0

    .line 749
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 750
    .line 751
    .line 752
    move-result-object v0

    .line 753
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 754
    .line 755
    .line 756
    move-result-object p1

    .line 757
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 758
    .line 759
    .line 760
    move-result-object p0

    .line 761
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 762
    .line 763
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->d3:I

    .line 764
    .line 765
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 766
    .line 767
    .line 768
    move-result-object p1

    .line 769
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 770
    .line 771
    .line 772
    move-result-object p0

    .line 773
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 774
    .line 775
    .line 776
    move-result-object p0

    .line 777
    return-object p0

    .line 778
    :pswitch_d
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 779
    .line 780
    .line 781
    move-result-object p0

    .line 782
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 783
    .line 784
    .line 785
    move-result-object p0

    .line 786
    const-string p1, "https://auto.tancdn.com/v1/raw/7e034371-9f6f-4254-95c6-16b0937f6d2b13.webp"

    .line 787
    .line 788
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 789
    .line 790
    .line 791
    move-result-object p0

    .line 792
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 793
    .line 794
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->E4:I

    .line 795
    .line 796
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 797
    .line 798
    .line 799
    move-result-object p1

    .line 800
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 801
    .line 802
    .line 803
    move-result-object p0

    .line 804
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 805
    .line 806
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->w4:I

    .line 807
    .line 808
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 809
    .line 810
    .line 811
    move-result-object p1

    .line 812
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 813
    .line 814
    .line 815
    move-result-object p0

    .line 816
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 817
    .line 818
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->w6:I

    .line 819
    .line 820
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 821
    .line 822
    .line 823
    move-result-object p1

    .line 824
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 825
    .line 826
    .line 827
    move-result-object p0

    .line 828
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 829
    .line 830
    .line 831
    move-result-object p0

    .line 832
    return-object p0

    .line 833
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 834
    .line 835
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->F4:I

    .line 836
    .line 837
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 838
    .line 839
    .line 840
    move-result-object p0

    .line 841
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 842
    .line 843
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->v4:I

    .line 844
    .line 845
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 846
    .line 847
    .line 848
    move-result-object v0

    .line 849
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 850
    .line 851
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->n4:I

    .line 852
    .line 853
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 854
    .line 855
    .line 856
    move-result-object v1

    .line 857
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 858
    .line 859
    .line 860
    move-result-object v2

    .line 861
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 862
    .line 863
    .line 864
    move-result-object p1

    .line 865
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IjZEWklIQ0dUN0FKSUZSNU5WQ0lZNlRXN0I0NlFEWjE0IiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njg2Mzg0MzU2OTg5MzczNTh9.png"

    .line 866
    .line 867
    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 868
    .line 869
    .line 870
    move-result-object p1

    .line 871
    invoke-virtual {p1, p0}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 872
    .line 873
    .line 874
    move-result-object p0

    .line 875
    invoke-virtual {p0, v0}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 876
    .line 877
    .line 878
    move-result-object p0

    .line 879
    invoke-virtual {p0, v1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 880
    .line 881
    .line 882
    move-result-object p0

    .line 883
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 884
    .line 885
    .line 886
    move-result-object p0

    .line 887
    return-object p0

    .line 888
    :pswitch_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 889
    .line 890
    if-ne p0, v0, :cond_13

    .line 891
    .line 892
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVTVzVLVktJSDdKTUI2Mk1BSkdaMlZOVE1QRUk0MzE0IiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5ODM5Mzg4NzcxNjYwNzEzMDJ9.png"

    .line 893
    .line 894
    goto :goto_10

    .line 895
    :cond_13
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFFM0hMVTQ3M0haWklWVUk0MkdOSzRBQUxPRlQyRDE0IiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4Njg2NDcyMTQ2MTIwOTAzODJ9.png"

    .line 896
    .line 897
    :goto_10
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 898
    .line 899
    .line 900
    move-result-object v0

    .line 901
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 902
    .line 903
    .line 904
    move-result-object p1

    .line 905
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 906
    .line 907
    .line 908
    move-result-object p0

    .line 909
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 910
    .line 911
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->N4:I

    .line 912
    .line 913
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 914
    .line 915
    .line 916
    move-result-object p1

    .line 917
    invoke-virtual {p0, p1}, Ll/b690;->o(Ljava/lang/CharSequence;)Ll/b690;

    .line 918
    .line 919
    .line 920
    move-result-object p0

    .line 921
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 922
    .line 923
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u4:I

    .line 924
    .line 925
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 926
    .line 927
    .line 928
    move-result-object p1

    .line 929
    invoke-virtual {p0, p1}, Ll/b690;->m(Ljava/lang/CharSequence;)Ll/b690;

    .line 930
    .line 931
    .line 932
    move-result-object p0

    .line 933
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 934
    .line 935
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->m4:I

    .line 936
    .line 937
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 938
    .line 939
    .line 940
    move-result-object p1

    .line 941
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 942
    .line 943
    .line 944
    move-result-object p0

    .line 945
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 946
    .line 947
    .line 948
    move-result-object p0

    .line 949
    return-object p0

    .line 950
    :pswitch_10
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->J4:I

    .line 951
    .line 952
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 953
    .line 954
    .line 955
    move-result v0

    .line 956
    if-eqz v0, :cond_14

    .line 957
    .line 958
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t4:I

    .line 959
    .line 960
    goto :goto_11

    .line 961
    :cond_14
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s4:I

    .line 962
    .line 963
    :goto_11
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 964
    .line 965
    .line 966
    move-result v1

    .line 967
    if-eqz v1, :cond_15

    .line 968
    .line 969
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->l4:I

    .line 970
    .line 971
    goto :goto_12

    .line 972
    :cond_15
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->k4:I

    .line 973
    .line 974
    :goto_12
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 975
    .line 976
    .line 977
    move-result-object v2

    .line 978
    invoke-virtual {v2, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 979
    .line 980
    .line 981
    move-result-object p1

    .line 982
    const-string v2, "https://auto.tancdn.com/v1/raw/9a4c7c22-b275-44ab-8ebb-aeebc7e0a84210.webp"

    .line 983
    .line 984
    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 985
    .line 986
    .line 987
    move-result-object p1

    .line 988
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 989
    .line 990
    .line 991
    move-result-object p0

    .line 992
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    .line 993
    .line 994
    .line 995
    move-result-object p0

    .line 996
    invoke-virtual {p0, v1}, Ll/b690;->f(I)Ll/b690;

    .line 997
    .line 998
    .line 999
    move-result-object p0

    .line 1000
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1001
    .line 1002
    .line 1003
    move-result-object p0

    .line 1004
    return-object p0

    .line 1005
    :pswitch_11
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1006
    .line 1007
    if-ne p0, v0, :cond_16

    .line 1008
    .line 1009
    const-string p0, "https://auto.tancdn.com/v1/raw/be3eb17b-9d4e-48dc-b971-7d84414e73c811.webp"

    .line 1010
    .line 1011
    goto :goto_13

    .line 1012
    :cond_16
    const-string p0, "https://auto.tancdn.com/v1/raw/45513e7b-3754-4ca0-85f8-96f11d94b80710.webp"

    .line 1013
    .line 1014
    :goto_13
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v0

    .line 1018
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1019
    .line 1020
    .line 1021
    move-result-object p1

    .line 1022
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1023
    .line 1024
    .line 1025
    move-result-object p0

    .line 1026
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->v5:I

    .line 1027
    .line 1028
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1029
    .line 1030
    .line 1031
    move-result-object p0

    .line 1032
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->s5:I

    .line 1033
    .line 1034
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1035
    .line 1036
    .line 1037
    move-result-object p0

    .line 1038
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->f5:I

    .line 1039
    .line 1040
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1041
    .line 1042
    .line 1043
    move-result-object p0

    .line 1044
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1045
    .line 1046
    .line 1047
    move-result-object p0

    .line 1048
    return-object p0

    .line 1049
    :pswitch_12
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u5:I

    .line 1050
    .line 1051
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->r5:I

    .line 1052
    .line 1053
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->e5:I

    .line 1054
    .line 1055
    sget-object v5, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1056
    .line 1057
    if-ne v5, p0, :cond_17

    .line 1058
    .line 1059
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->B4:I

    .line 1060
    .line 1061
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T6:I

    .line 1062
    .line 1063
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1064
    .line 1065
    .line 1066
    move-result-object v3

    .line 1067
    invoke-virtual {v3, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1068
    .line 1069
    .line 1070
    move-result-object p1

    .line 1071
    invoke-virtual {p1, v2}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1072
    .line 1073
    .line 1074
    move-result-object p1

    .line 1075
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 1076
    .line 1077
    .line 1078
    move-result-object p0

    .line 1079
    invoke-virtual {p0, v0}, Ll/b690;->l(I)Ll/b690;

    .line 1080
    .line 1081
    .line 1082
    move-result-object p0

    .line 1083
    invoke-virtual {p0, v1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 1084
    .line 1085
    .line 1086
    move-result-object p0

    .line 1087
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1088
    .line 1089
    .line 1090
    move-result-object p0

    .line 1091
    return-object p0

    .line 1092
    :cond_17
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1093
    .line 1094
    .line 1095
    move-result-object p0

    .line 1096
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1097
    .line 1098
    .line 1099
    move-result-object p0

    .line 1100
    const-string p1, "https://auto.tancdn.com/v1/raw/471883b1-4132-4349-a95a-5806d9df838510.webp"

    .line 1101
    .line 1102
    invoke-virtual {p0, p1}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1103
    .line 1104
    .line 1105
    move-result-object p0

    .line 1106
    invoke-virtual {p0, v0}, Ll/b690;->n(I)Ll/b690;

    .line 1107
    .line 1108
    .line 1109
    move-result-object p0

    .line 1110
    invoke-virtual {p0, v3}, Ll/b690;->l(I)Ll/b690;

    .line 1111
    .line 1112
    .line 1113
    move-result-object p0

    .line 1114
    invoke-virtual {p0, v4}, Ll/b690;->f(I)Ll/b690;

    .line 1115
    .line 1116
    .line 1117
    move-result-object p0

    .line 1118
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1119
    .line 1120
    .line 1121
    move-result-object p0

    .line 1122
    return-object p0

    .line 1123
    :pswitch_13
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1124
    .line 1125
    if-ne p0, v0, :cond_18

    .line 1126
    .line 1127
    const-string p0, "https://auto.tancdn.com/v1/raw/7e9d55ce-e487-41fe-8dd2-7a0147470ef110.webp"

    .line 1128
    .line 1129
    goto :goto_14

    .line 1130
    :cond_18
    const-string p0, "https://auto.tancdn.com/v1/raw/55c2177d-65e6-4c75-801a-499403525f5e10.webp"

    .line 1131
    .line 1132
    :goto_14
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1133
    .line 1134
    .line 1135
    move-result-object v0

    .line 1136
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1137
    .line 1138
    .line 1139
    move-result-object p1

    .line 1140
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1141
    .line 1142
    .line 1143
    move-result-object p0

    .line 1144
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->z5:I

    .line 1145
    .line 1146
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1147
    .line 1148
    .line 1149
    move-result-object p0

    .line 1150
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->q5:I

    .line 1151
    .line 1152
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1153
    .line 1154
    .line 1155
    move-result-object p0

    .line 1156
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->d5:I

    .line 1157
    .line 1158
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1159
    .line 1160
    .line 1161
    move-result-object p0

    .line 1162
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1163
    .line 1164
    .line 1165
    move-result-object p0

    .line 1166
    return-object p0

    .line 1167
    :pswitch_14
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1168
    .line 1169
    if-ne p0, v0, :cond_19

    .line 1170
    .line 1171
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhTU0dQRTZPTkRBRFpCSkdQQTJORExPVkc2Q0Y0RjEwIiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDIyODk1NTIzMzkwOTUwOTM0fQ.png"

    .line 1172
    .line 1173
    goto :goto_15

    .line 1174
    :cond_19
    const-string p0, "https://auto.tancdn.com/v1/raw/7b981e39-f2fa-4441-9cd3-7908c69650ab10.webp"

    .line 1175
    .line 1176
    :goto_15
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1177
    .line 1178
    .line 1179
    move-result-object v0

    .line 1180
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1181
    .line 1182
    .line 1183
    move-result-object p1

    .line 1184
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1185
    .line 1186
    .line 1187
    move-result-object p0

    .line 1188
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->A5:I

    .line 1189
    .line 1190
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1191
    .line 1192
    .line 1193
    move-result-object p0

    .line 1194
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->p5:I

    .line 1195
    .line 1196
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1197
    .line 1198
    .line 1199
    move-result-object p0

    .line 1200
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->c5:I

    .line 1201
    .line 1202
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1203
    .line 1204
    .line 1205
    move-result-object p0

    .line 1206
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1207
    .line 1208
    .line 1209
    move-result-object p0

    .line 1210
    return-object p0

    .line 1211
    :pswitch_15
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1212
    .line 1213
    if-ne p0, v0, :cond_1a

    .line 1214
    .line 1215
    const-string p0, "https://auto.tancdn.com/v1/raw/d4b2a799-22f7-4973-ac67-1b2084a0ea5310.webp"

    .line 1216
    .line 1217
    goto :goto_16

    .line 1218
    :cond_1a
    const-string p0, "https://auto.tancdn.com/v1/raw/8a5d2dc5-4f66-4903-b7f7-eec6197d5b1711.webp"

    .line 1219
    .line 1220
    :goto_16
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v0

    .line 1224
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1225
    .line 1226
    .line 1227
    move-result-object p1

    .line 1228
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1229
    .line 1230
    .line 1231
    move-result-object p0

    .line 1232
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->x5:I

    .line 1233
    .line 1234
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1235
    .line 1236
    .line 1237
    move-result-object p0

    .line 1238
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->o5:I

    .line 1239
    .line 1240
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1241
    .line 1242
    .line 1243
    move-result-object p0

    .line 1244
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->b5:I

    .line 1245
    .line 1246
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1247
    .line 1248
    .line 1249
    move-result-object p0

    .line 1250
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1251
    .line 1252
    .line 1253
    move-result-object p0

    .line 1254
    return-object p0

    .line 1255
    :pswitch_16
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1256
    .line 1257
    if-ne p0, v0, :cond_1b

    .line 1258
    .line 1259
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IloyWFdESVVWRkNLUFhZNUFYNFZZRFBTTFRZUkhHRTEwIiwidyI6NDc0LCJoIjoyNTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMTc2OTQyOTIzMjkwOTA4MTc0fQ.png"

    .line 1260
    .line 1261
    goto :goto_17

    .line 1262
    :cond_1b
    const-string p0, "https://auto.tancdn.com/v1/raw/6375caf8-5b50-4426-be1f-a3b88a12fe6e11.webp"

    .line 1263
    .line 1264
    :goto_17
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v0

    .line 1268
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1269
    .line 1270
    .line 1271
    move-result-object p1

    .line 1272
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1273
    .line 1274
    .line 1275
    move-result-object p0

    .line 1276
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->D5:I

    .line 1277
    .line 1278
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1279
    .line 1280
    .line 1281
    move-result-object p0

    .line 1282
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->n5:I

    .line 1283
    .line 1284
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1285
    .line 1286
    .line 1287
    move-result-object p0

    .line 1288
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->a5:I

    .line 1289
    .line 1290
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1291
    .line 1292
    .line 1293
    move-result-object p0

    .line 1294
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1295
    .line 1296
    .line 1297
    move-result-object p0

    .line 1298
    return-object p0

    .line 1299
    :pswitch_17
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1300
    .line 1301
    if-ne p0, v0, :cond_1c

    .line 1302
    .line 1303
    const-string p0, "https://auto.tancdn.com/v1/raw/fad6222d-a1b8-4505-8537-48f54a09580111.webp"

    .line 1304
    .line 1305
    goto :goto_18

    .line 1306
    :cond_1c
    const-string p0, "https://auto.tancdn.com/v1/raw/30a18977-468d-4e52-a7ff-c69087efcfa411.webp"

    .line 1307
    .line 1308
    :goto_18
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1309
    .line 1310
    .line 1311
    move-result-object v0

    .line 1312
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1313
    .line 1314
    .line 1315
    move-result-object p1

    .line 1316
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1317
    .line 1318
    .line 1319
    move-result-object p0

    .line 1320
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->w5:I

    .line 1321
    .line 1322
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1323
    .line 1324
    .line 1325
    move-result-object p0

    .line 1326
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->m5:I

    .line 1327
    .line 1328
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1329
    .line 1330
    .line 1331
    move-result-object p0

    .line 1332
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Z4:I

    .line 1333
    .line 1334
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1335
    .line 1336
    .line 1337
    move-result-object p0

    .line 1338
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1339
    .line 1340
    .line 1341
    move-result-object p0

    .line 1342
    return-object p0

    .line 1343
    :pswitch_18
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1344
    .line 1345
    .line 1346
    move-result v0

    .line 1347
    if-eqz v0, :cond_1d

    .line 1348
    .line 1349
    const-string v0, "https://auto.tancdn.com/v1/raw/1c363bb1-527a-4e73-bf75-af3337532e8711.webp"

    .line 1350
    .line 1351
    goto :goto_19

    .line 1352
    :cond_1d
    const-string v0, "https://auto.tancdn.com/v1/raw/efbb251e-8a64-450e-80e4-af960390eabd11.webp"

    .line 1353
    .line 1354
    :goto_19
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1355
    .line 1356
    if-ne p0, v1, :cond_1f

    .line 1357
    .line 1358
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1359
    .line 1360
    .line 1361
    move-result v0

    .line 1362
    if-eqz v0, :cond_1e

    .line 1363
    .line 1364
    const-string v0, "https://auto.tancdn.com/v1/raw/8e0c607c-ba1e-4754-8b7a-9ec6ceef9dfd11.webp"

    .line 1365
    .line 1366
    goto :goto_1a

    .line 1367
    :cond_1e
    const-string v0, "https://auto.tancdn.com/v1/raw/3e3a2ee9-7170-4b5b-92f7-d4f4dfca3dc311.webp"

    .line 1368
    .line 1369
    :cond_1f
    :goto_1a
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1370
    .line 1371
    .line 1372
    move-result v2

    .line 1373
    if-eqz v2, :cond_20

    .line 1374
    .line 1375
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->C5:I

    .line 1376
    .line 1377
    goto :goto_1b

    .line 1378
    :cond_20
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->B5:I

    .line 1379
    .line 1380
    :goto_1b
    if-ne p0, v1, :cond_22

    .line 1381
    .line 1382
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1383
    .line 1384
    .line 1385
    move-result p0

    .line 1386
    if-eqz p0, :cond_21

    .line 1387
    .line 1388
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->I4:I

    .line 1389
    .line 1390
    :goto_1c
    move v2, p0

    .line 1391
    goto :goto_1d

    .line 1392
    :cond_21
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->H4:I

    .line 1393
    .line 1394
    goto :goto_1c

    .line 1395
    :cond_22
    :goto_1d
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1396
    .line 1397
    .line 1398
    move-result p0

    .line 1399
    if-eqz p0, :cond_23

    .line 1400
    .line 1401
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->l5:I

    .line 1402
    .line 1403
    goto :goto_1e

    .line 1404
    :cond_23
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->k5:I

    .line 1405
    .line 1406
    :goto_1e
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1407
    .line 1408
    .line 1409
    move-result-object v1

    .line 1410
    invoke-virtual {v1, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1411
    .line 1412
    .line 1413
    move-result-object p1

    .line 1414
    invoke-virtual {p1, v0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1415
    .line 1416
    .line 1417
    move-result-object p1

    .line 1418
    invoke-virtual {p1, v2}, Ll/b690;->n(I)Ll/b690;

    .line 1419
    .line 1420
    .line 1421
    move-result-object p1

    .line 1422
    invoke-virtual {p1, p0}, Ll/b690;->l(I)Ll/b690;

    .line 1423
    .line 1424
    .line 1425
    move-result-object p0

    .line 1426
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1427
    .line 1428
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Y4:I

    .line 1429
    .line 1430
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1431
    .line 1432
    .line 1433
    move-result-object p1

    .line 1434
    invoke-virtual {p0, p1}, Ll/b690;->g(Ljava/lang/CharSequence;)Ll/b690;

    .line 1435
    .line 1436
    .line 1437
    invoke-virtual {v1}, Ll/b690;->a()Ll/a690;

    .line 1438
    .line 1439
    .line 1440
    move-result-object p0

    .line 1441
    return-object p0

    .line 1442
    :pswitch_19
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1443
    .line 1444
    .line 1445
    move-result v0

    .line 1446
    if-eqz v0, :cond_24

    .line 1447
    .line 1448
    const-string v0, "https://auto.tancdn.com/v1/raw/4ad5dbbb-6860-4461-b45f-9a6209d7df6f11.webp"

    .line 1449
    .line 1450
    goto :goto_1f

    .line 1451
    :cond_24
    const-string v0, "https://auto.tancdn.com/v1/raw/d81da4e9-8ed7-4917-a1fd-05a5446adab710.webp"

    .line 1452
    .line 1453
    :goto_1f
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1454
    .line 1455
    if-ne p0, v1, :cond_26

    .line 1456
    .line 1457
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1458
    .line 1459
    .line 1460
    move-result v0

    .line 1461
    if-eqz v0, :cond_25

    .line 1462
    .line 1463
    const-string v0, "https://auto.tancdn.com/v1/raw/b8927b15-478d-4a2b-b514-2da53e084ae010.webp"

    .line 1464
    .line 1465
    goto :goto_20

    .line 1466
    :cond_25
    const-string v0, "https://auto.tancdn.com/v1/raw/0750872a-d3b6-4b59-afec-3ed32fbb5e5511.webp"

    .line 1467
    .line 1468
    :cond_26
    :goto_20
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1469
    .line 1470
    .line 1471
    move-result v2

    .line 1472
    if-eqz v2, :cond_27

    .line 1473
    .line 1474
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->F5:I

    .line 1475
    .line 1476
    goto :goto_21

    .line 1477
    :cond_27
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->E5:I

    .line 1478
    .line 1479
    :goto_21
    if-ne p0, v1, :cond_29

    .line 1480
    .line 1481
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1482
    .line 1483
    .line 1484
    move-result v2

    .line 1485
    if-eqz v2, :cond_28

    .line 1486
    .line 1487
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->L4:I

    .line 1488
    .line 1489
    goto :goto_22

    .line 1490
    :cond_28
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->K4:I

    .line 1491
    .line 1492
    :cond_29
    :goto_22
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1493
    .line 1494
    .line 1495
    move-result v3

    .line 1496
    if-eqz v3, :cond_2a

    .line 1497
    .line 1498
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->j5:I

    .line 1499
    .line 1500
    goto :goto_23

    .line 1501
    :cond_2a
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->i5:I

    .line 1502
    .line 1503
    :goto_23
    if-ne p0, v1, :cond_2b

    .line 1504
    .line 1505
    const/4 p0, 0x1

    .line 1506
    goto :goto_24

    .line 1507
    :cond_2b
    const/4 p0, 0x0

    .line 1508
    :goto_24
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 1509
    .line 1510
    .line 1511
    move-result-object v1

    .line 1512
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 1513
    .line 1514
    .line 1515
    move-result-object v1

    .line 1516
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 1517
    .line 1518
    .line 1519
    move-result v1

    .line 1520
    if-eqz p0, :cond_2d

    .line 1521
    .line 1522
    if-eqz v1, :cond_2d

    .line 1523
    .line 1524
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1525
    .line 1526
    .line 1527
    move-result p0

    .line 1528
    if-eqz p0, :cond_2c

    .line 1529
    .line 1530
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->h3:I

    .line 1531
    .line 1532
    :goto_25
    move v3, p0

    .line 1533
    goto :goto_26

    .line 1534
    :cond_2c
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->g3:I

    .line 1535
    .line 1536
    goto :goto_25

    .line 1537
    :cond_2d
    :goto_26
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1538
    .line 1539
    .line 1540
    move-result-object p0

    .line 1541
    invoke-virtual {p0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1542
    .line 1543
    .line 1544
    move-result-object p1

    .line 1545
    invoke-virtual {p1, v0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1546
    .line 1547
    .line 1548
    move-result-object p1

    .line 1549
    invoke-virtual {p1, v2}, Ll/b690;->n(I)Ll/b690;

    .line 1550
    .line 1551
    .line 1552
    move-result-object p1

    .line 1553
    invoke-virtual {p1, v3}, Ll/b690;->l(I)Ll/b690;

    .line 1554
    .line 1555
    .line 1556
    move-result-object p1

    .line 1557
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->X4:I

    .line 1558
    .line 1559
    invoke-virtual {p1, v0}, Ll/b690;->f(I)Ll/b690;

    .line 1560
    .line 1561
    .line 1562
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1563
    .line 1564
    .line 1565
    move-result-object p0

    .line 1566
    return-object p0

    .line 1567
    :pswitch_1a
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1568
    .line 1569
    .line 1570
    move-result-object v0

    .line 1571
    invoke-virtual {v0, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1572
    .line 1573
    .line 1574
    move-result-object p1

    .line 1575
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1576
    .line 1577
    if-ne p0, v0, :cond_2e

    .line 1578
    .line 1579
    const-string p0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjRDQzE3REQxNTdBNjRGRkNBNUFGRTg1Nzg5QUVENDM5IiwidyI6NzExLCJoIjozNzgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyOTE2MjEzOTkwOTY1OTU5ODIsInB0IjoyMDI1MDYxNzE1fQ.webp"

    .line 1580
    .line 1581
    goto :goto_27

    .line 1582
    :cond_2e
    const-string p0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ijc4NzFCRkFDMUZFQzQzMDc5RDMzMTFDQUMxMDY5MDJCIiwidyI6NzExLCJoIjozODEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjY5MzIwNDEyNDEwMzU5Mzg4LCJwdCI6MjAyNTA2MTcxNX0.webp"

    .line 1583
    .line 1584
    :goto_27
    invoke-virtual {p1, p0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1585
    .line 1586
    .line 1587
    move-result-object p0

    .line 1588
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->u6:I

    .line 1589
    .line 1590
    invoke-virtual {p0, p1}, Ll/b690;->n(I)Ll/b690;

    .line 1591
    .line 1592
    .line 1593
    move-result-object p0

    .line 1594
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->u6:I

    .line 1595
    .line 1596
    invoke-virtual {p0, p1}, Ll/b690;->l(I)Ll/b690;

    .line 1597
    .line 1598
    .line 1599
    move-result-object p0

    .line 1600
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->t6:I

    .line 1601
    .line 1602
    invoke-virtual {p0, p1}, Ll/b690;->f(I)Ll/b690;

    .line 1603
    .line 1604
    .line 1605
    move-result-object p0

    .line 1606
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1607
    .line 1608
    .line 1609
    move-result-object p0

    .line 1610
    return-object p0

    .line 1611
    :pswitch_1b
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1612
    .line 1613
    .line 1614
    move-result v0

    .line 1615
    if-eqz v0, :cond_2f

    .line 1616
    .line 1617
    const-string v0, "https://auto.tancdn.com/v1/raw/1216f433-f408-44a2-add9-e3a9969270c611.webp"

    .line 1618
    .line 1619
    goto :goto_28

    .line 1620
    :cond_2f
    const-string v0, "https://auto.tancdn.com/v1/raw/9e7625c5-4002-421b-bf5c-fb6ed0ea90ee11.webp"

    .line 1621
    .line 1622
    :goto_28
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 1623
    .line 1624
    if-ne p0, v1, :cond_31

    .line 1625
    .line 1626
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1627
    .line 1628
    .line 1629
    move-result p0

    .line 1630
    if-eqz p0, :cond_30

    .line 1631
    .line 1632
    const-string p0, "https://auto.tancdn.com/v1/raw/8a46ab26-dd56-484a-bd09-43ee42fd5e1311.webp"

    .line 1633
    .line 1634
    :goto_29
    move-object v0, p0

    .line 1635
    goto :goto_2a

    .line 1636
    :cond_30
    const-string p0, "https://auto.tancdn.com/v1/raw/406c7711-a037-4e25-8acf-db68636ebce010.webp"

    .line 1637
    .line 1638
    goto :goto_29

    .line 1639
    :cond_31
    :goto_2a
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->y5:I

    .line 1640
    .line 1641
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1642
    .line 1643
    .line 1644
    move-result v1

    .line 1645
    if-eqz v1, :cond_32

    .line 1646
    .line 1647
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->t5:I

    .line 1648
    .line 1649
    goto :goto_2b

    .line 1650
    :cond_32
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->h5:I

    .line 1651
    .line 1652
    :goto_2b
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 1653
    .line 1654
    .line 1655
    move-result v2

    .line 1656
    if-eqz v2, :cond_33

    .line 1657
    .line 1658
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->g5:I

    .line 1659
    .line 1660
    goto :goto_2c

    .line 1661
    :cond_33
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->W4:I

    .line 1662
    .line 1663
    :goto_2c
    invoke-static {}, Ll/b690;->b()Ll/b690;

    .line 1664
    .line 1665
    .line 1666
    move-result-object v3

    .line 1667
    invoke-virtual {v3, p1}, Ll/b690;->k(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/b690;

    .line 1668
    .line 1669
    .line 1670
    move-result-object p1

    .line 1671
    invoke-virtual {p1, v0}, Ll/b690;->j(Ljava/lang/String;)Ll/b690;

    .line 1672
    .line 1673
    .line 1674
    move-result-object p1

    .line 1675
    invoke-virtual {p1, p0}, Ll/b690;->n(I)Ll/b690;

    .line 1676
    .line 1677
    .line 1678
    move-result-object p0

    .line 1679
    invoke-virtual {p0, v1}, Ll/b690;->l(I)Ll/b690;

    .line 1680
    .line 1681
    .line 1682
    move-result-object p0

    .line 1683
    invoke-virtual {p0, v2}, Ll/b690;->f(I)Ll/b690;

    .line 1684
    .line 1685
    .line 1686
    move-result-object p0

    .line 1687
    invoke-virtual {p0}, Ll/b690;->a()Ll/a690;

    .line 1688
    .line 1689
    .line 1690
    move-result-object p0

    .line 1691
    return-object p0

    .line 1692
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static c()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->full_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->unlimit_free_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->ultra_premium_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method public static d()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Df(Lcom/p1/mobile/putong/data/User;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 26
    .line 27
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 30
    .line 31
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 32
    .line 33
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    sget-object v9, Lcom/p1/mobile/putong/core/data/Privilege;->vip_message_block_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    filled-new-array/range {v1 .. v9}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 53
    .line 54
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->vip_undo:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 55
    .line 56
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_location:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_search_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_active_time_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 63
    .line 64
    sget-object v8, Lcom/p1/mobile/putong/core/data/Privilege;->vip_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 65
    .line 66
    filled-new-array/range {v1 .. v8}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_1

    .line 79
    .line 80
    const/4 v1, 0x7

    .line 81
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 82
    .line 83
    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_2
    return-object v0
.end method

.method public static e()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->premium_compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ir()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->intl_visitor:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->picksMembership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->intl_advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->F6()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_2

    .line 84
    .line 85
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->message_read_state:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Rk()Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_4

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-eqz v3, :cond_4

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    const/4 v1, -0x1

    .line 123
    if-ne v3, v1, :cond_3

    .line 124
    .line 125
    const/4 v3, 0x2

    .line 126
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->svip_greet:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 127
    .line 128
    invoke-virtual {v0, v3, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_5

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    :cond_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->R8()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_6

    .line 161
    .line 162
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->loveBuzz:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    :cond_6
    return-object v0
.end method

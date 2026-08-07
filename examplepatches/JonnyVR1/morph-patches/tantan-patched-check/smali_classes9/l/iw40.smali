.class public Ll/iw40;
.super Ll/sz90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/u3m;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/sz90;-><init>(Ll/u3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/on2<",
            "Ll/t3m;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 4
    .line 5
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;-><init>(Ll/q3m;Ll/ner;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    new-instance v0, Ll/rm90;

    .line 34
    .line 35
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 36
    .line 37
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 38
    .line 39
    invoke-direct {v0, v1, v2}, Ll/rm90;-><init>(Ll/t3m;Ll/ner;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    new-instance v0, Ll/ap90;

    .line 46
    .line 47
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 48
    .line 49
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 50
    .line 51
    invoke-direct {v0, v1, v2}, Ll/ap90;-><init>(Ll/t3m;Ll/ner;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 58
    .line 59
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "push_like"

    .line 64
    .line 65
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    new-instance v0, Ll/xya0;

    .line 72
    .line 73
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 74
    .line 75
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 76
    .line 77
    invoke-direct {v0, v1, v2}, Ll/xya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 78
    .line 79
    .line 80
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :cond_1
    new-instance v0, Ll/du90;

    .line 84
    .line 85
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 86
    .line 87
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 88
    .line 89
    invoke-direct {v0, v1, v2}, Ll/du90;-><init>(Ll/t3m;Ll/ner;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    new-instance v0, Ll/d4b0;

    .line 96
    .line 97
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 98
    .line 99
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 100
    .line 101
    invoke-direct {v0, v1, v2}, Ll/d4b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 102
    .line 103
    .line 104
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    new-instance v0, Ll/s1b0;

    .line 108
    .line 109
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 110
    .line 111
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 112
    .line 113
    invoke-direct {v0, v1, v2}, Ll/s1b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 114
    .line 115
    .line 116
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/mya0;

    .line 120
    .line 121
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 122
    .line 123
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 124
    .line 125
    invoke-direct {v0, v1, v2}, Ll/mya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    new-instance v0, Ll/fs90;

    .line 132
    .line 133
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 134
    .line 135
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 136
    .line 137
    invoke-direct {v0, v1, v2}, Ll/fs90;-><init>(Ll/t3m;Ll/ner;)V

    .line 138
    .line 139
    .line 140
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    new-instance v0, Ll/axa0;

    .line 144
    .line 145
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 146
    .line 147
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 148
    .line 149
    invoke-direct {v0, v1, v2}, Ll/axa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 150
    .line 151
    .line 152
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    new-instance v0, Ll/oma0;

    .line 156
    .line 157
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 158
    .line 159
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 160
    .line 161
    invoke-direct {v0, v1, v2}, Ll/oma0;-><init>(Ll/t3m;Ll/ner;)V

    .line 162
    .line 163
    .line 164
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    new-instance v0, Ll/m2b0;

    .line 168
    .line 169
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 170
    .line 171
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 172
    .line 173
    invoke-direct {v0, v1, v2}, Ll/m2b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 174
    .line 175
    .line 176
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 180
    .line 181
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v0}, Ll/tnt;->b(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_2

    .line 190
    .line 191
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 192
    .line 193
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    const-string v1, "p_tantanx_card"

    .line 198
    .line 199
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_2

    .line 204
    .line 205
    new-instance v0, Ll/qya0;

    .line 206
    .line 207
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 208
    .line 209
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 210
    .line 211
    invoke-direct {v0, v1, v2}, Ll/qya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 212
    .line 213
    .line 214
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    :cond_2
    new-instance v0, Ll/n1b0;

    .line 218
    .line 219
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 220
    .line 221
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 222
    .line 223
    invoke-direct {v0, v1, v2}, Ll/n1b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 224
    .line 225
    .line 226
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    new-instance v0, Ll/pxa0;

    .line 230
    .line 231
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 232
    .line 233
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 234
    .line 235
    invoke-direct {v0, v1, v2}, Ll/pxa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 236
    .line 237
    .line 238
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    new-instance v0, Ll/fwa0;

    .line 242
    .line 243
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 244
    .line 245
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 246
    .line 247
    invoke-direct {v0, v1, v2}, Ll/fwa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 248
    .line 249
    .line 250
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    new-instance v0, Ll/qq90;

    .line 254
    .line 255
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 256
    .line 257
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 258
    .line 259
    invoke-direct {v0, v1, v2}, Ll/qq90;-><init>(Ll/t3m;Ll/ner;)V

    .line 260
    .line 261
    .line 262
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    new-instance v0, Ll/mm90;

    .line 266
    .line 267
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 268
    .line 269
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 270
    .line 271
    invoke-direct {v0, v1, v2}, Ll/mm90;-><init>(Ll/t3m;Ll/ner;)V

    .line 272
    .line 273
    .line 274
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    new-instance v0, Ll/oz90;

    .line 278
    .line 279
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 280
    .line 281
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 282
    .line 283
    invoke-direct {v0, v1, v2}, Ll/oz90;-><init>(Ll/t3m;Ll/ner;)V

    .line 284
    .line 285
    .line 286
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    new-instance v0, Ll/fy90;

    .line 290
    .line 291
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 292
    .line 293
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 294
    .line 295
    invoke-direct {v0, v1, v2}, Ll/fy90;-><init>(Ll/t3m;Ll/ner;)V

    .line 296
    .line 297
    .line 298
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->yc()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-nez v0, :cond_3

    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d9()Z

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    if-eqz v0, :cond_4

    .line 328
    .line 329
    :cond_3
    new-instance v0, Ll/zz90;

    .line 330
    .line 331
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 332
    .line 333
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 334
    .line 335
    invoke-direct {v0, v1, v2}, Ll/zz90;-><init>(Ll/t3m;Ll/ner;)V

    .line 336
    .line 337
    .line 338
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    :cond_4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;

    .line 342
    .line 343
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 344
    .line 345
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 346
    .line 347
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;-><init>(Ll/t3m;Ll/ner;)V

    .line 348
    .line 349
    .line 350
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    new-instance v0, Ll/y1b0;

    .line 354
    .line 355
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 356
    .line 357
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 358
    .line 359
    invoke-direct {v0, v1, v2}, Ll/y1b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 360
    .line 361
    .line 362
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    new-instance v0, Ll/xwa0;

    .line 366
    .line 367
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 368
    .line 369
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 370
    .line 371
    invoke-direct {v0, v1, v2}, Ll/xwa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 372
    .line 373
    .line 374
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    .line 376
    .line 377
    new-instance v0, Ll/jz90;

    .line 378
    .line 379
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 380
    .line 381
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 382
    .line 383
    invoke-direct {v0, v1, v2}, Ll/jz90;-><init>(Ll/t3m;Ll/ner;)V

    .line 384
    .line 385
    .line 386
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    .line 388
    .line 389
    new-instance v0, Ll/cza0;

    .line 390
    .line 391
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 392
    .line 393
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 394
    .line 395
    invoke-direct {v0, v1, v2}, Ll/cza0;-><init>(Ll/t3m;Ll/ner;)V

    .line 396
    .line 397
    .line 398
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    new-instance v0, Ll/p0a0;

    .line 402
    .line 403
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 404
    .line 405
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 406
    .line 407
    invoke-direct {v0, v1, v2}, Ll/p0a0;-><init>(Ll/t3m;Ll/ner;)V

    .line 408
    .line 409
    .line 410
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    new-instance v0, Ll/vya0;

    .line 414
    .line 415
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 416
    .line 417
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 418
    .line 419
    invoke-direct {v0, v1, v2}, Ll/vya0;-><init>(Ll/t3m;Ll/ner;)V

    .line 420
    .line 421
    .line 422
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 423
    .line 424
    .line 425
    new-instance v0, Ll/k1b0;

    .line 426
    .line 427
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 428
    .line 429
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 430
    .line 431
    invoke-direct {v0, v1, v2}, Ll/k1b0;-><init>(Ll/t3m;Ll/ner;)V

    .line 432
    .line 433
    .line 434
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    .line 436
    .line 437
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 438
    .line 439
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    const-string v1, "-11005"

    .line 444
    .line 445
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v0

    .line 449
    if-nez v0, :cond_5

    .line 450
    .line 451
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 452
    .line 453
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v0

    .line 457
    const-string v1, "from_guess_liker_result"

    .line 458
    .line 459
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    move-result v0

    .line 463
    if-nez v0, :cond_5

    .line 464
    .line 465
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;

    .line 466
    .line 467
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 468
    .line 469
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 470
    .line 471
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileReportItemHolder;-><init>(Ll/t3m;Ll/ner;)V

    .line 472
    .line 473
    .line 474
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 475
    .line 476
    .line 477
    :cond_5
    iget-object v0, p0, Ll/sz90;->a:Ll/u3m;

    .line 478
    .line 479
    invoke-interface {v0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v1

    .line 491
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 492
    .line 493
    .line 494
    move-result v0

    .line 495
    if-nez v0, :cond_6

    .line 496
    .line 497
    new-instance v0, Ll/b43;

    .line 498
    .line 499
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 500
    .line 501
    iget-object v2, p0, Ll/sz90;->b:Ll/ner;

    .line 502
    .line 503
    invoke-direct {v0, v1, v2}, Ll/b43;-><init>(Ll/t3m;Ll/ner;)V

    .line 504
    .line 505
    .line 506
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 507
    .line 508
    .line 509
    :cond_6
    new-instance v0, Ll/b43;

    .line 510
    .line 511
    iget-object v1, p0, Ll/sz90;->a:Ll/u3m;

    .line 512
    .line 513
    iget-object p0, p0, Ll/sz90;->b:Ll/ner;

    .line 514
    .line 515
    invoke-direct {v0, v1, p0}, Ll/b43;-><init>(Ll/t3m;Ll/ner;)V

    .line 516
    .line 517
    .line 518
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 519
    .line 520
    .line 521
    return-void
.end method

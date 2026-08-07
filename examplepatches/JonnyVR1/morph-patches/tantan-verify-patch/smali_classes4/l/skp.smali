.class public Ll/skp;
.super Ll/ufp;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ufp;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/skp;->i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/rfh0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/skp;->j(Ll/rfh0$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 14

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x1

    .line 8
    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 14
    .line 15
    invoke-virtual {v4}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v8

    .line 19
    iget-object v4, p1, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 20
    .line 21
    sget-object v5, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    const/4 v13, 0x0

    .line 24
    const/4 v6, 0x1

    .line 25
    if-ne v4, v5, :cond_0

    .line 26
    .line 27
    move v7, v6

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move v7, v13

    .line 30
    :goto_0
    new-instance v9, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v4, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v10, "tribe-"

    .line 38
    .line 39
    invoke-direct {v4, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v10, p1, Ll/rfh0$a;->b:Ll/pkp;

    .line 43
    .line 44
    iget-object v10, v10, Ll/pkp;->U:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    const-string v10, "sourcepage"

    .line 54
    .line 55
    invoke-interface {v9, v10, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    iget-boolean v4, p1, Ll/rfh0$a;->e:Z

    .line 59
    .line 60
    if-eqz v4, :cond_1

    .line 61
    .line 62
    sget-object v4, Ll/hjp;->I:Ljava/lang/String;

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    sget-object v4, Ll/hjp;->J:Ljava/lang/String;

    .line 66
    .line 67
    :goto_1
    const-string v10, "actiontype"

    .line 68
    .line 69
    invoke-interface {v9, v10, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    iget-object v4, p1, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 73
    .line 74
    if-ne v4, v5, :cond_2

    .line 75
    .line 76
    const-string v4, "superlike"

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    sget-object v5, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 80
    .line 81
    if-ne v4, v5, :cond_3

    .line 82
    .line 83
    const-string v4, "like"

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    sget-object v5, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 87
    .line 88
    if-ne v4, v5, :cond_4

    .line 89
    .line 90
    const-string v4, "dislike"

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_4
    const-string v4, ""

    .line 94
    .line 95
    :goto_2
    iget-object v5, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 96
    .line 97
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-eqz v5, :cond_5

    .line 102
    .line 103
    iget-object v5, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 104
    .line 105
    invoke-virtual {v5}, Ll/ik4;->b()Ll/ik4$a;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-eqz v5, :cond_5

    .line 114
    .line 115
    iget-object v5, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 116
    .line 117
    invoke-virtual {v5}, Ll/ik4;->b()Ll/ik4$a;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    iget-object v5, v5, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 122
    .line 123
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-eqz v5, :cond_5

    .line 128
    .line 129
    iget-object v5, p1, Ll/rfh0$a;->c:Ll/ik4;

    .line 130
    .line 131
    invoke-virtual {v5}, Ll/ik4;->b()Ll/ik4$a;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    iget-object v5, v5, Ll/ik4$a;->a:Lrx/subjects/a;

    .line 136
    .line 137
    invoke-virtual {v5}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    check-cast v5, Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    xor-int/2addr v6, v5

    .line 148
    :cond_5
    iget-boolean v5, p1, Ll/rfh0$a;->e:Z

    .line 149
    .line 150
    if-eqz v5, :cond_6

    .line 151
    .line 152
    sget-object v5, Ll/hjp;->I:Ljava/lang/String;

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_6
    sget-object v5, Ll/hjp;->J:Ljava/lang/String;

    .line 156
    .line 157
    :goto_3
    invoke-static {v10, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    const-string v10, "actionname"

    .line 162
    .line 163
    invoke-static {v10, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    const-string v10, "IsWhiteBlock"

    .line 168
    .line 169
    invoke-static {v10, v6}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    filled-new-array {v5, v4, v6}, [Ll/sfj0$a;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    const-string v5, "e_swipeaction"

    .line 178
    .line 179
    const-string v6, "p_activity_momentcard_view"

    .line 180
    .line 181
    invoke-static {v5, v6, v4}, Ll/sfj0;->n(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 182
    .line 183
    .line 184
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 185
    .line 186
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 187
    .line 188
    iget-object v4, v4, Ll/dkb;->O0:Ll/byd0;

    .line 189
    .line 190
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    check-cast v4, Ljava/lang/Long;

    .line 195
    .line 196
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 197
    .line 198
    .line 199
    move-result-wide v4

    .line 200
    invoke-static {v4, v5}, Ll/pzi0;->D(J)Z

    .line 201
    .line 202
    .line 203
    move-result v4

    .line 204
    if-eqz v4, :cond_7

    .line 205
    .line 206
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 207
    .line 208
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 209
    .line 210
    iget-object v4, v4, Ll/dkb;->P0:Ll/byd0;

    .line 211
    .line 212
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    check-cast v5, Ljava/lang/Long;

    .line 217
    .line 218
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 219
    .line 220
    .line 221
    move-result-wide v5

    .line 222
    add-long/2addr v5, v1

    .line 223
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    invoke-virtual {v4, v5}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    goto :goto_4

    .line 231
    :cond_7
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 232
    .line 233
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 234
    .line 235
    iget-object v4, v4, Ll/dkb;->O0:Ll/byd0;

    .line 236
    .line 237
    invoke-static {}, Ll/pzi0;->o()J

    .line 238
    .line 239
    .line 240
    move-result-wide v5

    .line 241
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    invoke-virtual {v4, v5}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 249
    .line 250
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 251
    .line 252
    iget-object v4, v4, Ll/dkb;->P0:Ll/byd0;

    .line 253
    .line 254
    invoke-virtual {v4, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 258
    .line 259
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 260
    .line 261
    iget-object v4, v4, Ll/dkb;->Q0:Ll/byd0;

    .line 262
    .line 263
    invoke-virtual {v4, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    :goto_4
    iget-object v4, p1, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 267
    .line 268
    sget-object v5, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 269
    .line 270
    if-ne v4, v5, :cond_8

    .line 271
    .line 272
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 273
    .line 274
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 275
    .line 276
    iget-object v4, v4, Ll/dkb;->Q0:Ll/byd0;

    .line 277
    .line 278
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v6

    .line 282
    check-cast v6, Ljava/lang/Long;

    .line 283
    .line 284
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 285
    .line 286
    .line 287
    move-result-wide v10

    .line 288
    add-long/2addr v10, v1

    .line 289
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 290
    .line 291
    .line 292
    move-result-object v6

    .line 293
    invoke-virtual {v4, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    :cond_8
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 297
    .line 298
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 299
    .line 300
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/n;->R:Ll/byd0;

    .line 301
    .line 302
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v4

    .line 306
    check-cast v4, Ljava/lang/Long;

    .line 307
    .line 308
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 309
    .line 310
    .line 311
    move-result-wide v10

    .line 312
    invoke-static {v10, v11}, Ll/pzi0;->D(J)Z

    .line 313
    .line 314
    .line 315
    move-result v4

    .line 316
    if-eqz v4, :cond_9

    .line 317
    .line 318
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 319
    .line 320
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 321
    .line 322
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/n;->S:Ll/byd0;

    .line 323
    .line 324
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    check-cast v3, Ljava/lang/Long;

    .line 329
    .line 330
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 331
    .line 332
    .line 333
    move-result-wide v3

    .line 334
    add-long/2addr v3, v1

    .line 335
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    invoke-virtual {v0, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    goto :goto_5

    .line 343
    :cond_9
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 344
    .line 345
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 346
    .line 347
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/n;->R:Ll/byd0;

    .line 348
    .line 349
    invoke-static {}, Ll/pzi0;->o()J

    .line 350
    .line 351
    .line 352
    move-result-wide v10

    .line 353
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 354
    .line 355
    .line 356
    move-result-object v6

    .line 357
    invoke-virtual {v4, v6}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 361
    .line 362
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 363
    .line 364
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/n;->S:Ll/byd0;

    .line 365
    .line 366
    invoke-virtual {v4, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 370
    .line 371
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 372
    .line 373
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/n;->T:Ll/byd0;

    .line 374
    .line 375
    invoke-virtual {v3, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    :goto_5
    iget-object v0, p1, Ll/rfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 379
    .line 380
    if-ne v0, v5, :cond_a

    .line 381
    .line 382
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 383
    .line 384
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 385
    .line 386
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/n;->T:Ll/byd0;

    .line 387
    .line 388
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v3

    .line 392
    check-cast v3, Ljava/lang/Long;

    .line 393
    .line 394
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 395
    .line 396
    .line 397
    move-result-wide v3

    .line 398
    add-long/2addr v3, v1

    .line 399
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    :cond_a
    invoke-virtual {p0, p1}, Ll/ufp;->g(Ll/rfh0$a;)Z

    .line 407
    .line 408
    .line 409
    move-result v6

    .line 410
    iget-boolean v10, p1, Ll/rfh0$a;->e:Z

    .line 411
    .line 412
    iget-object v0, p1, Ll/rfh0$a;->a:Ll/hjp;

    .line 413
    .line 414
    iget-boolean v11, v0, Ll/hjp;->i:Z

    .line 415
    .line 416
    move-object v5, p0

    .line 417
    move-object v12, p1

    .line 418
    invoke-virtual/range {v5 .. v12}, Ll/ufp;->f(ZZLcom/p1/mobile/putong/data/User;Ljava/util/Map;ZZLl/rfh0$a;)V

    .line 419
    .line 420
    .line 421
    iget-object p0, v12, Ll/rfh0$a;->a:Ll/hjp;

    .line 422
    .line 423
    invoke-virtual {p0, v13}, Ll/hjp;->C2(Z)V

    .line 424
    .line 425
    .line 426
    iget-object p0, v12, Ll/rfh0$a;->a:Ll/hjp;

    .line 427
    .line 428
    invoke-virtual {p0, v13}, Ll/hjp;->B2(Z)V

    .line 429
    .line 430
    .line 431
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 432
    .line 433
    return-object p0
.end method

.method public j(Ll/rfh0$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.class public Ll/xbu;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/r6s;Ll/r6s;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/r6s;->localRowIndex:I

    .line 2
    .line 3
    iget p1, p1, Ll/r6s;->localRowIndex:I

    .line 4
    .line 5
    sub-int/2addr p0, p1

    .line 6
    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)Ll/xwr$a;
    .locals 3

    .line 1
    new-instance v0, Ll/xwr$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xwr$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->bannerMedia:Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabImage;->bannerUrl:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/xwr$a;->f(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->title:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/xwr$a;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;-><init>()V

    .line 21
    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setType(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->jumpUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->setGoData(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/xwr$a;->e(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public static c(Ll/p5u;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p5u;",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/p5u;->d:Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    move v1, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v2

    .line 21
    :goto_0
    move v4, v2

    .line 22
    :goto_1
    iget-object v5, p0, Ll/ubu;->a:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    const/4 v6, 0x3

    .line 29
    if-ge v4, v5, :cond_4

    .line 30
    .line 31
    iget-object v5, p0, Ll/ubu;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 38
    .line 39
    const/4 v7, 0x4

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    move v8, v7

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    move v8, v3

    .line 45
    :goto_2
    add-int/2addr v8, v4

    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v9

    .line 50
    const-string v10, "p_live_nearby"

    .line 51
    .line 52
    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    if-eqz v9, :cond_2

    .line 57
    .line 58
    const/16 v7, 0x3ec

    .line 59
    .line 60
    invoke-static {v7}, Ll/ybu;->a(I)Ll/r6s;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    new-instance v9, Ll/byu;

    .line 65
    .line 66
    invoke-direct {v9}, Ll/byu;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v5, v9, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-static {v6, v9, v5}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-static {v9, v8, v5}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v7, v9}, Ll/r6s;->v(Ll/byu;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_2
    iget-object v9, v5, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 93
    .line 94
    const-string v10, "videoChat"

    .line 95
    .line 96
    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_3

    .line 101
    .line 102
    const/16 v6, 0x3eb

    .line 103
    .line 104
    invoke-static {v6}, Ll/ybu;->a(I)Ll/r6s;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    new-instance v9, Ll/byu;

    .line 109
    .line 110
    invoke-direct {v9}, Ll/byu;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v5, v9, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    invoke-static {v7, v9, v5}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-static {v9, v8, v5}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v6, v9}, Ll/r6s;->v(Ll/byu;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_3
    const/16 v7, 0x3ea

    .line 137
    .line 138
    invoke-static {v7}, Ll/ybu;->a(I)Ll/r6s;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    new-instance v9, Ll/byu;

    .line 143
    .line 144
    invoke-direct {v9}, Ll/byu;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object v5, v9, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-static {v6, v9, v5}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    invoke-static {v9, v8, v5}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v7, v9}, Ll/r6s;->v(Ll/byu;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 170
    .line 171
    goto/16 :goto_1

    .line 172
    .line 173
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    .line 174
    .line 175
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 176
    .line 177
    .line 178
    const/4 v5, 0x2

    .line 179
    if-eqz v1, :cond_8

    .line 180
    .line 181
    const/16 v1, 0x3e9

    .line 182
    .line 183
    invoke-static {v1}, Ll/ybu;->a(I)Ll/r6s;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    new-instance v7, Ll/efu;

    .line 188
    .line 189
    invoke-direct {v7}, Ll/efu;-><init>()V

    .line 190
    .line 191
    .line 192
    iget-object v8, p0, Ll/p5u;->d:Ljava/util/List;

    .line 193
    .line 194
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 195
    .line 196
    .line 197
    move-result v9

    .line 198
    if-lez v9, :cond_5

    .line 199
    .line 200
    new-instance v9, Ll/byu;

    .line 201
    .line 202
    invoke-direct {v9}, Ll/byu;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v10

    .line 209
    check-cast v10, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 210
    .line 211
    iput-object v10, v9, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v10

    .line 217
    invoke-static {v6, v9, v10}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v10

    .line 224
    invoke-static {v9, v3, v10}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v9}, Ll/byu;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 228
    .line 229
    .line 230
    move-result-object v10

    .line 231
    const-string v11, "window_type"

    .line 232
    .line 233
    const-string v12, "big_tv"

    .line 234
    .line 235
    invoke-virtual {v10, v11, v12}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v7, v9}, Ll/efu;->d(Ll/byu;)V

    .line 239
    .line 240
    .line 241
    :cond_5
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 242
    .line 243
    .line 244
    move-result v9

    .line 245
    if-le v9, v3, :cond_6

    .line 246
    .line 247
    new-instance v9, Ll/byu;

    .line 248
    .line 249
    invoke-direct {v9}, Ll/byu;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v10

    .line 256
    check-cast v10, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 257
    .line 258
    iput-object v10, v9, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 259
    .line 260
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v10

    .line 264
    invoke-static {v6, v9, v10}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v10

    .line 271
    invoke-static {v9, v5, v10}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v7, v9}, Ll/efu;->e(Ll/byu;)V

    .line 275
    .line 276
    .line 277
    :cond_6
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 278
    .line 279
    .line 280
    move-result v9

    .line 281
    if-le v9, v5, :cond_7

    .line 282
    .line 283
    new-instance v9, Ll/byu;

    .line 284
    .line 285
    invoke-direct {v9}, Ll/byu;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v8

    .line 292
    check-cast v8, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 293
    .line 294
    iput-object v8, v9, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 295
    .line 296
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v8

    .line 300
    invoke-static {v6, v9, v8}, Ll/ybu;->b(ILl/byu;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-static {v9, v6, p1}, Ll/ybu;->c(Ll/byu;ILjava/lang/String;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v7, v9}, Ll/efu;->f(Ll/byu;)V

    .line 311
    .line 312
    .line 313
    :cond_7
    invoke-virtual {v1, v7}, Ll/r6s;->u(Ll/efu;)V

    .line 314
    .line 315
    .line 316
    iput v3, v1, Ll/r6s;->localRowIndex:I

    .line 317
    .line 318
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    :cond_8
    iget-object p0, p0, Ll/p5u;->c:Ljava/util/List;

    .line 322
    .line 323
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    if-eqz p1, :cond_b

    .line 332
    .line 333
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    check-cast p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;

    .line 338
    .line 339
    iget-object v1, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 340
    .line 341
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    if-eqz v1, :cond_9

    .line 346
    .line 347
    goto :goto_4

    .line 348
    :cond_9
    invoke-static {v3}, Ll/ybu;->a(I)Ll/r6s;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    new-instance v6, Ll/xwr;

    .line 353
    .line 354
    invoke-direct {v6}, Ll/xwr;-><init>()V

    .line 355
    .line 356
    .line 357
    iget-object v7, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->tabs:Ljava/util/List;

    .line 358
    .line 359
    new-instance v8, Ll/vbu;

    .line 360
    .line 361
    invoke-direct {v8}, Ll/vbu;-><init>()V

    .line 362
    .line 363
    .line 364
    invoke-static {v7, v8}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 365
    .line 366
    .line 367
    move-result-object v7

    .line 368
    invoke-virtual {v6, v7}, Ll/xwr;->e(Ljava/util/List;)V

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1, v6}, Ll/r6s;->q(Ll/xwr;)V

    .line 372
    .line 373
    .line 374
    iget p1, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannerBean;->rowIndex:I

    .line 375
    .line 376
    if-nez p1, :cond_a

    .line 377
    .line 378
    move p1, v3

    .line 379
    :cond_a
    iput p1, v1, Ll/r6s;->localRowIndex:I

    .line 380
    .line 381
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    goto :goto_4

    .line 385
    :cond_b
    new-instance p0, Ll/wbu;

    .line 386
    .line 387
    invoke-direct {p0}, Ll/wbu;-><init>()V

    .line 388
    .line 389
    .line 390
    invoke-static {v4, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 391
    .line 392
    .line 393
    move p0, v2

    .line 394
    move p1, p0

    .line 395
    :goto_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-ge p0, v1, :cond_e

    .line 400
    .line 401
    invoke-virtual {v4, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    check-cast v1, Ll/r6s;

    .line 406
    .line 407
    iget v6, v1, Ll/r6s;->localRowIndex:I

    .line 408
    .line 409
    sub-int/2addr v6, v3

    .line 410
    mul-int/2addr v6, v5

    .line 411
    sub-int/2addr v6, p1

    .line 412
    if-gez v6, :cond_c

    .line 413
    .line 414
    move v6, v2

    .line 415
    :cond_c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 416
    .line 417
    .line 418
    move-result v7

    .line 419
    if-lt v6, v7, :cond_d

    .line 420
    .line 421
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    goto :goto_6

    .line 425
    :cond_d
    invoke-virtual {v0, v6, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 426
    .line 427
    .line 428
    :goto_6
    add-int/lit8 p1, p1, 0x1

    .line 429
    .line 430
    add-int/lit8 p0, p0, 0x1

    .line 431
    .line 432
    goto :goto_5

    .line 433
    :cond_e
    return-object v0
.end method

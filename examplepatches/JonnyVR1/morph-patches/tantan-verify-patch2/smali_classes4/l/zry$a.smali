.class public Ll/zry$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jzl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


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

.method public static synthetic b(IZZLcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget v0, p3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    move p0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p0, v1

    .line 10
    :goto_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    :goto_1
    if-eqz p2, :cond_2

    .line 22
    .line 23
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    goto :goto_2

    .line 28
    :cond_2
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    :goto_2
    if-eqz p0, :cond_3

    .line 33
    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    if-eqz p2, :cond_3

    .line 37
    .line 38
    move v1, v2

    .line 39
    :cond_3
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v3, p3

    .line 2
    .line 3
    move-object/from16 v8, p4

    .line 4
    .line 5
    new-instance v9, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v8}, Ll/zry;->g(Ljava/util/List;)Z

    .line 11
    .line 12
    .line 13
    move-result v6

    .line 14
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, v3}, Ll/tab0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v10

    .line 22
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v3}, Ll/tab0;->m(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v11

    .line 30
    const-string v0, "tttVip"

    .line 31
    .line 32
    invoke-static {v0}, Ll/zry;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v12

    .line 36
    const-string v0, "tttSeeWhoLikedMe"

    .line 37
    .line 38
    invoke-static {v0}, Ll/zry;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v13

    .line 42
    const-string v0, "svip"

    .line 43
    .line 44
    invoke-static {v0}, Ll/zry;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 45
    .line 46
    .line 47
    move-result-object v14

    .line 48
    const/4 v15, 0x0

    .line 49
    move v2, v15

    .line 50
    move/from16 v16, v2

    .line 51
    .line 52
    :goto_0
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v4, 0x1

    .line 57
    if-ge v2, v0, :cond_14

    .line 58
    .line 59
    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/String;

    .line 64
    .line 65
    const-string v5, "-"

    .line 66
    .line 67
    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    move-object/from16 p0, v5

    .line 72
    .line 73
    const-string v5, "w"

    .line 74
    .line 75
    if-eqz v7, :cond_1

    .line 76
    .line 77
    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    if-eqz v7, :cond_0

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    sub-int/2addr v7, v4

    .line 92
    invoke-virtual {v0, v15, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    move v7, v4

    .line 101
    goto :goto_1

    .line 102
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    move v7, v15

    .line 107
    :goto_1
    move v1, v4

    .line 108
    goto :goto_2

    .line 109
    :cond_1
    invoke-virtual {v0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    if-eqz v7, :cond_2

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    sub-int/2addr v7, v4

    .line 120
    invoke-virtual {v0, v15, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    move v7, v4

    .line 129
    move v1, v15

    .line 130
    goto :goto_2

    .line 131
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    move v1, v15

    .line 136
    move v7, v1

    .line 137
    :goto_2
    new-instance v4, Ll/xry;

    .line 138
    .line 139
    invoke-direct {v4, v0, v1, v7}, Ll/xry;-><init>(IZZ)V

    .line 140
    .line 141
    .line 142
    invoke-static {v8, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    move-object v4, v0

    .line 147
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 148
    .line 149
    const-string v0, "tttUltraPremium"

    .line 150
    .line 151
    invoke-static {v3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_4

    .line 156
    .line 157
    invoke-static/range {p2 .. p2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_3

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_3
    move v0, v15

    .line 165
    goto :goto_4

    .line 166
    :cond_4
    :goto_3
    const/4 v0, 0x1

    .line 167
    :goto_4
    if-eqz v7, :cond_6

    .line 168
    .line 169
    if-eqz v0, :cond_6

    .line 170
    .line 171
    invoke-static {}, Ll/joa;->D3()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_6

    .line 180
    .line 181
    if-eqz v0, :cond_6

    .line 182
    .line 183
    :cond_5
    move-object/from16 v0, p1

    .line 184
    .line 185
    move-object/from16 v1, p2

    .line 186
    .line 187
    move-object/from16 v17, v10

    .line 188
    .line 189
    goto/16 :goto_9

    .line 190
    .line 191
    :cond_6
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_5

    .line 196
    .line 197
    move-object v0, v5

    .line 198
    const/4 v5, 0x0

    .line 199
    const/4 v7, 0x0

    .line 200
    move-object/from16 v18, p0

    .line 201
    .line 202
    move-object/from16 v1, p2

    .line 203
    .line 204
    move-object/from16 v19, v0

    .line 205
    .line 206
    move-object/from16 v17, v10

    .line 207
    .line 208
    const/4 v10, 0x0

    .line 209
    move-object/from16 v0, p1

    .line 210
    .line 211
    invoke-static/range {v0 .. v7}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    if-eqz v3, :cond_13

    .line 220
    .line 221
    invoke-static {v5, v10, v15}, Lcom/p1/mobile/putong/core/ui/purchase/d;->a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-static {v4}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->t(Z)V

    .line 230
    .line 231
    .line 232
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 233
    .line 234
    .line 235
    move-result v5

    .line 236
    if-nez v5, :cond_a

    .line 237
    .line 238
    move-object/from16 v5, v18

    .line 239
    .line 240
    invoke-virtual {v11, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    if-eqz v5, :cond_8

    .line 245
    .line 246
    const/4 v5, 0x1

    .line 247
    invoke-virtual {v11, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v7

    .line 251
    move-object/from16 v10, v19

    .line 252
    .line 253
    invoke-virtual {v7, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 254
    .line 255
    .line 256
    move-result v10

    .line 257
    if-eqz v10, :cond_7

    .line 258
    .line 259
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 260
    .line 261
    .line 262
    move-result v10

    .line 263
    sub-int/2addr v10, v5

    .line 264
    invoke-virtual {v7, v15, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v7

    .line 268
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 269
    .line 270
    .line 271
    move-result v7

    .line 272
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 273
    .line 274
    .line 275
    move-result v10

    .line 276
    if-eqz v10, :cond_b

    .line 277
    .line 278
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 279
    .line 280
    .line 281
    move-result v10

    .line 282
    if-eqz v10, :cond_b

    .line 283
    .line 284
    iget v10, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 285
    .line 286
    if-ne v10, v7, :cond_b

    .line 287
    .line 288
    :goto_5
    move v7, v5

    .line 289
    goto :goto_6

    .line 290
    :cond_7
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    move-result v7

    .line 294
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 295
    .line 296
    .line 297
    move-result v10

    .line 298
    if-eqz v10, :cond_b

    .line 299
    .line 300
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 301
    .line 302
    .line 303
    move-result v10

    .line 304
    if-eqz v10, :cond_b

    .line 305
    .line 306
    iget v10, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 307
    .line 308
    if-ne v10, v7, :cond_b

    .line 309
    .line 310
    goto :goto_5

    .line 311
    :cond_8
    move-object/from16 v10, v19

    .line 312
    .line 313
    const/4 v5, 0x1

    .line 314
    invoke-virtual {v11, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v7

    .line 318
    if-eqz v7, :cond_9

    .line 319
    .line 320
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 321
    .line 322
    .line 323
    move-result v7

    .line 324
    sub-int/2addr v7, v5

    .line 325
    invoke-virtual {v11, v15, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 330
    .line 331
    .line 332
    move-result v7

    .line 333
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 334
    .line 335
    .line 336
    move-result v10

    .line 337
    if-eqz v10, :cond_b

    .line 338
    .line 339
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 340
    .line 341
    .line 342
    move-result v10

    .line 343
    if-eqz v10, :cond_b

    .line 344
    .line 345
    iget v10, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 346
    .line 347
    if-ne v10, v7, :cond_b

    .line 348
    .line 349
    goto :goto_5

    .line 350
    :cond_9
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 351
    .line 352
    .line 353
    move-result v7

    .line 354
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 355
    .line 356
    .line 357
    move-result v10

    .line 358
    if-eqz v10, :cond_b

    .line 359
    .line 360
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 361
    .line 362
    .line 363
    move-result v10

    .line 364
    if-eqz v10, :cond_b

    .line 365
    .line 366
    iget v10, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 367
    .line 368
    if-ne v10, v7, :cond_b

    .line 369
    .line 370
    goto :goto_5

    .line 371
    :cond_a
    const/4 v5, 0x1

    .line 372
    :cond_b
    move v7, v15

    .line 373
    :goto_6
    invoke-virtual {v3, v7}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 377
    .line 378
    .line 379
    move-result v10

    .line 380
    invoke-virtual {v3, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 381
    .line 382
    .line 383
    if-eqz v7, :cond_c

    .line 384
    .line 385
    move/from16 v16, v5

    .line 386
    .line 387
    :cond_c
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 388
    .line 389
    .line 390
    move-result-object v7

    .line 391
    invoke-interface {v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 392
    .line 393
    .line 394
    move-result-object v7

    .line 395
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 396
    .line 397
    .line 398
    move-result v7

    .line 399
    if-nez v7, :cond_d

    .line 400
    .line 401
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 402
    .line 403
    .line 404
    move-result-object v7

    .line 405
    invoke-virtual {v7}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 406
    .line 407
    .line 408
    move-result-object v7

    .line 409
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 410
    .line 411
    .line 412
    move-result v7

    .line 413
    if-nez v7, :cond_f

    .line 414
    .line 415
    :cond_d
    sget-object v7, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 416
    .line 417
    if-ne v1, v7, :cond_f

    .line 418
    .line 419
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    .line 420
    .line 421
    .line 422
    move-result v7

    .line 423
    if-eqz v7, :cond_e

    .line 424
    .line 425
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 426
    .line 427
    .line 428
    move-result v7

    .line 429
    if-nez v7, :cond_f

    .line 430
    .line 431
    :cond_e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 432
    .line 433
    .line 434
    move-result-object v7

    .line 435
    invoke-interface {v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 436
    .line 437
    .line 438
    move-result-object v7

    .line 439
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 440
    .line 441
    .line 442
    move-result v7

    .line 443
    if-eqz v7, :cond_12

    .line 444
    .line 445
    invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z

    .line 446
    .line 447
    .line 448
    move-result v7

    .line 449
    if-eqz v7, :cond_12

    .line 450
    .line 451
    :cond_f
    invoke-static {v1, v0}, Ll/zry;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 452
    .line 453
    .line 454
    move-result v7

    .line 455
    if-eqz v7, :cond_12

    .line 456
    .line 457
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 458
    .line 459
    invoke-static {v1, v0}, Ll/zry;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 460
    .line 461
    .line 462
    move-result v7

    .line 463
    if-eqz v7, :cond_10

    .line 464
    .line 465
    const/16 v7, 0xc

    .line 466
    .line 467
    goto :goto_7

    .line 468
    :cond_10
    move v7, v5

    .line 469
    :goto_7
    if-ne v4, v7, :cond_11

    .line 470
    .line 471
    move v4, v5

    .line 472
    goto :goto_8

    .line 473
    :cond_11
    move v4, v15

    .line 474
    :goto_8
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 478
    .line 479
    .line 480
    move-result v4

    .line 481
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 482
    .line 483
    .line 484
    :cond_12
    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 485
    .line 486
    .line 487
    :cond_13
    :goto_9
    add-int/lit8 v2, v2, 0x1

    .line 488
    .line 489
    move-object/from16 v3, p3

    .line 490
    .line 491
    move-object/from16 v10, v17

    .line 492
    .line 493
    goto/16 :goto_0

    .line 494
    .line 495
    :cond_14
    move-object/from16 v0, p1

    .line 496
    .line 497
    move-object/from16 v1, p2

    .line 498
    .line 499
    move v5, v4

    .line 500
    const/4 v10, 0x0

    .line 501
    if-nez v16, :cond_16

    .line 502
    .line 503
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    .line 504
    .line 505
    .line 506
    move-result v2

    .line 507
    if-nez v2, :cond_16

    .line 508
    .line 509
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    if-le v2, v5, :cond_15

    .line 514
    .line 515
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v2

    .line 519
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 520
    .line 521
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 522
    .line 523
    .line 524
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    move-result-object v2

    .line 528
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 529
    .line 530
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 531
    .line 532
    .line 533
    goto :goto_a

    .line 534
    :cond_15
    invoke-interface {v9, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v2

    .line 538
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 539
    .line 540
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 541
    .line 542
    .line 543
    invoke-interface {v9, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 544
    .line 545
    .line 546
    move-result-object v2

    .line 547
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 548
    .line 549
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 550
    .line 551
    .line 552
    :cond_16
    :goto_a
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 553
    .line 554
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 555
    .line 556
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->T4()Z

    .line 557
    .line 558
    .line 559
    move-result v2

    .line 560
    if-eqz v2, :cond_18

    .line 561
    .line 562
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 563
    .line 564
    .line 565
    move-result-object v2

    .line 566
    :cond_17
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 567
    .line 568
    .line 569
    move-result v3

    .line 570
    if-eqz v3, :cond_18

    .line 571
    .line 572
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v3

    .line 576
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 577
    .line 578
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 579
    .line 580
    .line 581
    move-result-object v4

    .line 582
    invoke-static {v4}, Ll/zry;->l(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 583
    .line 584
    .line 585
    move-result v4

    .line 586
    if-eqz v4, :cond_17

    .line 587
    .line 588
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 589
    .line 590
    .line 591
    move-result-object v4

    .line 592
    invoke-static {v4}, Ll/zry;->l(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 593
    .line 594
    .line 595
    move-result v4

    .line 596
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 597
    .line 598
    .line 599
    goto :goto_b

    .line 600
    :cond_18
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 601
    .line 602
    if-ne v1, v2, :cond_1a

    .line 603
    .line 604
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 605
    .line 606
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 607
    .line 608
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->P3()Z

    .line 609
    .line 610
    .line 611
    move-result v2

    .line 612
    if-eqz v2, :cond_1a

    .line 613
    .line 614
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 615
    .line 616
    .line 617
    move-result-object v2

    .line 618
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 619
    .line 620
    .line 621
    move-result v3

    .line 622
    if-eqz v3, :cond_1a

    .line 623
    .line 624
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 625
    .line 626
    .line 627
    move-result-object v3

    .line 628
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 629
    .line 630
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 631
    .line 632
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 633
    .line 634
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 635
    .line 636
    .line 637
    move-result-object v6

    .line 638
    invoke-virtual {v4, v6}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m4(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 639
    .line 640
    .line 641
    move-result v4

    .line 642
    if-eqz v4, :cond_19

    .line 643
    .line 644
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 645
    .line 646
    .line 647
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 648
    .line 649
    .line 650
    goto :goto_c

    .line 651
    :cond_19
    invoke-virtual {v3, v15}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 652
    .line 653
    .line 654
    goto :goto_c

    .line 655
    :cond_1a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 656
    .line 657
    .line 658
    move-result-object v2

    .line 659
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 660
    .line 661
    .line 662
    move-result-object v2

    .line 663
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 664
    .line 665
    .line 666
    move-result v2

    .line 667
    if-eqz v2, :cond_1b

    .line 668
    .line 669
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 670
    .line 671
    if-ne v1, v2, :cond_1b

    .line 672
    .line 673
    invoke-static {v0, v8}, Ll/zry;->i(Landroid/content/Context;Ljava/util/List;)V

    .line 674
    .line 675
    .line 676
    :cond_1b
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 677
    .line 678
    .line 679
    move-result-object v2

    .line 680
    const/4 v3, -0x1

    .line 681
    :cond_1c
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 682
    .line 683
    .line 684
    move-result v4

    .line 685
    if-eqz v4, :cond_20

    .line 686
    .line 687
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 688
    .line 689
    .line 690
    move-result-object v4

    .line 691
    check-cast v4, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 692
    .line 693
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 694
    .line 695
    .line 696
    move-result-object v6

    .line 697
    if-eqz v6, :cond_1d

    .line 698
    .line 699
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 700
    .line 701
    .line 702
    move-result-object v4

    .line 703
    goto :goto_e

    .line 704
    :cond_1d
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 705
    .line 706
    .line 707
    move-result-object v4

    .line 708
    :goto_e
    if-nez v4, :cond_1e

    .line 709
    .line 710
    goto :goto_d

    .line 711
    :cond_1e
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 712
    .line 713
    .line 714
    move-result-object v6

    .line 715
    if-eqz v6, :cond_1c

    .line 716
    .line 717
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 718
    .line 719
    .line 720
    move-result v7

    .line 721
    if-eqz v7, :cond_1f

    .line 722
    .line 723
    goto :goto_d

    .line 724
    :cond_1f
    iget v6, v6, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 725
    .line 726
    if-le v6, v3, :cond_1c

    .line 727
    .line 728
    move-object v10, v4

    .line 729
    move v3, v6

    .line 730
    goto :goto_d

    .line 731
    :cond_20
    if-eqz v10, :cond_21

    .line 732
    .line 733
    invoke-virtual {v10, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->L(Z)V

    .line 734
    .line 735
    .line 736
    :cond_21
    new-instance v2, Ll/yry;

    .line 737
    .line 738
    invoke-direct {v2}, Ll/yry;-><init>()V

    .line 739
    .line 740
    .line 741
    invoke-static {v8, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 742
    .line 743
    .line 744
    move-result-object v2

    .line 745
    check-cast v2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 746
    .line 747
    if-eqz v2, :cond_29

    .line 748
    .line 749
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 750
    .line 751
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 752
    .line 753
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 754
    .line 755
    const-wide/16 v4, 0x0

    .line 756
    .line 757
    cmpl-double v4, v2, v4

    .line 758
    .line 759
    if-lez v4, :cond_29

    .line 760
    .line 761
    invoke-static {}, Ll/zry;->e()Ljava/text/NumberFormat;

    .line 762
    .line 763
    .line 764
    move-result-object v4

    .line 765
    const/4 v5, 0x2

    .line 766
    invoke-virtual {v4, v5}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 767
    .line 768
    .line 769
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 770
    .line 771
    .line 772
    move-result-object v4

    .line 773
    :cond_22
    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 774
    .line 775
    .line 776
    move-result v5

    .line 777
    if-eqz v5, :cond_29

    .line 778
    .line 779
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 780
    .line 781
    .line 782
    move-result-object v5

    .line 783
    check-cast v5, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 784
    .line 785
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 786
    .line 787
    .line 788
    move-result-object v6

    .line 789
    if-eqz v6, :cond_23

    .line 790
    .line 791
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 792
    .line 793
    .line 794
    move-result-object v5

    .line 795
    goto :goto_10

    .line 796
    :cond_23
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 797
    .line 798
    .line 799
    move-result-object v5

    .line 800
    :goto_10
    if-nez v5, :cond_24

    .line 801
    .line 802
    goto :goto_f

    .line 803
    :cond_24
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 804
    .line 805
    .line 806
    move-result-object v6

    .line 807
    if-eqz v6, :cond_22

    .line 808
    .line 809
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 810
    .line 811
    .line 812
    move-result v7

    .line 813
    if-eqz v7, :cond_25

    .line 814
    .line 815
    goto :goto_f

    .line 816
    :cond_25
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 817
    .line 818
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 819
    .line 820
    iget-wide v7, v7, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 821
    .line 822
    const-wide/high16 v10, 0x4028000000000000L    # 12.0

    .line 823
    .line 824
    mul-double/2addr v7, v10

    .line 825
    iget v10, v6, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 826
    .line 827
    int-to-double v10, v10

    .line 828
    const-wide/high16 v12, 0x404a000000000000L    # 52.0

    .line 829
    .line 830
    mul-double/2addr v10, v12

    .line 831
    div-double/2addr v7, v10

    .line 832
    div-double v10, v7, v2

    .line 833
    .line 834
    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    .line 835
    .line 836
    sub-double/2addr v12, v10

    .line 837
    const-wide/high16 v14, 0x4059000000000000L    # 100.0

    .line 838
    .line 839
    mul-double/2addr v12, v14

    .line 840
    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    .line 841
    .line 842
    .line 843
    move-result-wide v12

    .line 844
    double-to-int v12, v12

    .line 845
    invoke-static {v0, v1, v6}, Ll/zry;->k(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 846
    .line 847
    .line 848
    move-result v13

    .line 849
    if-nez v13, :cond_28

    .line 850
    .line 851
    if-lez v12, :cond_27

    .line 852
    .line 853
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->u()Z

    .line 854
    .line 855
    .line 856
    move-result v13

    .line 857
    if-eqz v13, :cond_26

    .line 858
    .line 859
    mul-double/2addr v10, v14

    .line 860
    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    .line 861
    .line 862
    .line 863
    move-result-wide v10

    .line 864
    double-to-int v10, v10

    .line 865
    sget v11, Lcom/p1/mobile/putong/core/pay/R$string;->d9:I

    .line 866
    .line 867
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 868
    .line 869
    .line 870
    move-result-object v10

    .line 871
    filled-new-array {v10}, [Ljava/lang/Object;

    .line 872
    .line 873
    .line 874
    move-result-object v10

    .line 875
    invoke-virtual {v0, v11, v10}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 876
    .line 877
    .line 878
    move-result-object v10

    .line 879
    goto :goto_11

    .line 880
    :cond_26
    sget v10, Lcom/p1/mobile/putong/core/pay/R$string;->c9:I

    .line 881
    .line 882
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 883
    .line 884
    .line 885
    move-result-object v11

    .line 886
    filled-new-array {v11}, [Ljava/lang/Object;

    .line 887
    .line 888
    .line 889
    move-result-object v11

    .line 890
    invoke-virtual {v0, v10, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 891
    .line 892
    .line 893
    move-result-object v10

    .line 894
    :goto_11
    invoke-virtual {v5, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e0(Ljava/lang/String;)V

    .line 895
    .line 896
    .line 897
    goto :goto_12

    .line 898
    :cond_27
    const-string v10, ""

    .line 899
    .line 900
    invoke-virtual {v5, v10}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e0(Ljava/lang/String;)V

    .line 901
    .line 902
    .line 903
    :cond_28
    :goto_12
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 904
    .line 905
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 906
    .line 907
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 908
    .line 909
    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 910
    .line 911
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 912
    .line 913
    .line 914
    move-result-object v7

    .line 915
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 916
    .line 917
    .line 918
    move-result-object v7

    .line 919
    const-string v8, "%.2f"

    .line 920
    .line 921
    invoke-static {v10, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 922
    .line 923
    .line 924
    move-result-object v7

    .line 925
    sget v8, Lcom/p1/mobile/putong/core/pay/R$string;->A6:I

    .line 926
    .line 927
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    .line 928
    .line 929
    .line 930
    move-result-object v6

    .line 931
    invoke-virtual {v0, v8, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 932
    .line 933
    .line 934
    move-result-object v6

    .line 935
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 936
    .line 937
    .line 938
    goto/16 :goto_f

    .line 939
    .line 940
    :cond_29
    return-object v9
.end method

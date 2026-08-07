.class public Ll/zry$f;
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
    name = "f"
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

.method public static synthetic b(Ljava/lang/Integer;Ljava/lang/Integer;)I
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(ILcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic d(ILcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Integer;Ljava/lang/Integer;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
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
    move-object/from16 v8, p4

    .line 2
    .line 3
    invoke-static {v8}, Ll/zry;->g(Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    new-instance v9, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v10, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 32
    .line 33
    iget v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 34
    .line 35
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v10, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-static {}, Ll/t7a;->i()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    new-instance v0, Ll/lsy;

    .line 62
    .line 63
    invoke-direct {v0}, Ll/lsy;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v10, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    new-instance v0, Ll/msy;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/msy;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v10, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 76
    .line 77
    .line 78
    :goto_1
    const-string v0, "tttVip"

    .line 79
    .line 80
    invoke-static {v0}, Ll/zry;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    const-string v0, "tttSeeWhoLikedMe"

    .line 85
    .line 86
    invoke-static {v0}, Ll/zry;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object v12

    .line 90
    const-string v0, "svip"

    .line 91
    .line 92
    invoke-static {v0}, Ll/zry;->j(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 93
    .line 94
    .line 95
    move-result-object v13

    .line 96
    const/4 v15, 0x0

    .line 97
    const/16 v16, 0x0

    .line 98
    .line 99
    :goto_2
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    const/16 v17, 0x2

    .line 104
    .line 105
    const/4 v1, 0x1

    .line 106
    if-ge v15, v0, :cond_16

    .line 107
    .line 108
    invoke-interface {v10, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    new-instance v2, Ll/nsy;

    .line 119
    .line 120
    invoke-direct {v2, v0}, Ll/nsy;-><init>(I)V

    .line 121
    .line 122
    .line 123
    invoke-static {v8, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    move-object v4, v2

    .line 128
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 129
    .line 130
    const/4 v5, 0x0

    .line 131
    const/4 v7, 0x0

    .line 132
    const/4 v2, 0x1

    .line 133
    move-object/from16 v3, p3

    .line 134
    .line 135
    move v14, v0

    .line 136
    move/from16 v18, v1

    .line 137
    .line 138
    move-object/from16 v0, p1

    .line 139
    .line 140
    move-object/from16 v1, p2

    .line 141
    .line 142
    invoke-static/range {v0 .. v7}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    move-object/from16 v19, v4

    .line 147
    .line 148
    new-instance v0, Ll/osy;

    .line 149
    .line 150
    invoke-direct {v0, v14}, Ll/osy;-><init>(I)V

    .line 151
    .line 152
    .line 153
    invoke-static {v8, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    move-object v4, v0

    .line 158
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 159
    .line 160
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/lit8 v0, v0, -0x1

    .line 165
    .line 166
    sub-int/2addr v0, v15

    .line 167
    move-object v14, v2

    .line 168
    move v2, v0

    .line 169
    move-object/from16 v0, p1

    .line 170
    .line 171
    invoke-static/range {v0 .. v7}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-static {v14}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-nez v3, :cond_3

    .line 180
    .line 181
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    if-eqz v3, :cond_15

    .line 186
    .line 187
    :cond_3
    move/from16 v3, v18

    .line 188
    .line 189
    invoke-static {v14, v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-static {v4}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->s(Z)V

    .line 198
    .line 199
    .line 200
    invoke-static/range {v19 .. v19}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->t(Z)V

    .line 205
    .line 206
    .line 207
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    if-nez v3, :cond_4

    .line 220
    .line 221
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    if-nez v3, :cond_5

    .line 234
    .line 235
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 236
    .line 237
    if-eq v1, v3, :cond_9

    .line 238
    .line 239
    :cond_5
    invoke-static {v1, v0}, Ll/zry;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    if-eqz v3, :cond_7

    .line 244
    .line 245
    invoke-static {v1, v0}, Ll/zry;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    if-eqz v3, :cond_6

    .line 250
    .line 251
    const/4 v3, 0x0

    .line 252
    goto :goto_3

    .line 253
    :cond_6
    move/from16 v3, v17

    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_7
    const/4 v3, 0x1

    .line 257
    :goto_3
    if-ne v15, v3, :cond_8

    .line 258
    .line 259
    const/4 v3, 0x1

    .line 260
    goto :goto_4

    .line 261
    :cond_8
    const/4 v3, 0x0

    .line 262
    :goto_4
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 266
    .line 267
    .line 268
    move-result v3

    .line 269
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 270
    .line 271
    .line 272
    goto :goto_7

    .line 273
    :cond_9
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    if-eqz v3, :cond_a

    .line 278
    .line 279
    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    if-nez v3, :cond_b

    .line 284
    .line 285
    :cond_a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    if-eqz v3, :cond_f

    .line 298
    .line 299
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 300
    .line 301
    .line 302
    move-result v3

    .line 303
    if-eqz v3, :cond_f

    .line 304
    .line 305
    :cond_b
    invoke-static {v1, v0}, Ll/zry;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 306
    .line 307
    .line 308
    move-result v3

    .line 309
    if-eqz v3, :cond_d

    .line 310
    .line 311
    invoke-static {v1, v0}, Ll/zry;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Landroid/content/Context;)Z

    .line 312
    .line 313
    .line 314
    move-result v3

    .line 315
    if-eqz v3, :cond_c

    .line 316
    .line 317
    const/4 v3, 0x0

    .line 318
    goto :goto_5

    .line 319
    :cond_c
    move/from16 v3, v17

    .line 320
    .line 321
    goto :goto_5

    .line 322
    :cond_d
    const/4 v3, 0x1

    .line 323
    :goto_5
    if-ne v15, v3, :cond_e

    .line 324
    .line 325
    const/4 v3, 0x1

    .line 326
    goto :goto_6

    .line 327
    :cond_e
    const/4 v3, 0x0

    .line 328
    :goto_6
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 332
    .line 333
    .line 334
    move-result v3

    .line 335
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 336
    .line 337
    .line 338
    :cond_f
    :goto_7
    invoke-static {v1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 339
    .line 340
    .line 341
    move-result v3

    .line 342
    if-eqz v3, :cond_11

    .line 343
    .line 344
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 345
    .line 346
    .line 347
    move-result v3

    .line 348
    const/4 v4, 0x3

    .line 349
    if-ge v3, v4, :cond_11

    .line 350
    .line 351
    if-nez v15, :cond_10

    .line 352
    .line 353
    const/4 v3, 0x1

    .line 354
    goto :goto_8

    .line 355
    :cond_10
    const/4 v3, 0x0

    .line 356
    :goto_8
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 357
    .line 358
    .line 359
    :cond_11
    invoke-static {}, Ll/t7a;->i()Z

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    if-eqz v3, :cond_13

    .line 364
    .line 365
    if-nez v15, :cond_12

    .line 366
    .line 367
    const/4 v3, 0x1

    .line 368
    goto :goto_9

    .line 369
    :cond_12
    const/4 v3, 0x0

    .line 370
    :goto_9
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 371
    .line 372
    .line 373
    :cond_13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    if-eqz v3, :cond_14

    .line 378
    .line 379
    const/16 v16, 0x1

    .line 380
    .line 381
    :cond_14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 382
    .line 383
    .line 384
    move-result v3

    .line 385
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 386
    .line 387
    .line 388
    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    :cond_15
    add-int/lit8 v15, v15, 0x1

    .line 392
    .line 393
    goto/16 :goto_2

    .line 394
    .line 395
    :cond_16
    move-object/from16 v0, p1

    .line 396
    .line 397
    move-object/from16 v1, p2

    .line 398
    .line 399
    if-nez v16, :cond_17

    .line 400
    .line 401
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    div-int/lit8 v2, v2, 0x2

    .line 406
    .line 407
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    if-ge v2, v3, :cond_17

    .line 412
    .line 413
    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 418
    .line 419
    const/4 v4, 0x1

    .line 420
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 421
    .line 422
    .line 423
    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 428
    .line 429
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 430
    .line 431
    .line 432
    :cond_17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 433
    .line 434
    .line 435
    move-result-object v2

    .line 436
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 441
    .line 442
    .line 443
    move-result v2

    .line 444
    if-eqz v2, :cond_18

    .line 445
    .line 446
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 447
    .line 448
    if-ne v1, v2, :cond_18

    .line 449
    .line 450
    invoke-static {v0, v8}, Ll/zry;->i(Landroid/content/Context;Ljava/util/List;)V

    .line 451
    .line 452
    .line 453
    :cond_18
    return-object v9
.end method

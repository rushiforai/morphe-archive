.class public final Ll/iry;
.super Ll/cry;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/iry;",
        "Ll/cry;",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "type",
        "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
        "detail",
        "",
        "g",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cry;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/iry;->g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 16
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/purchase/d$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-super/range {p0 .. p3}, Ll/cry;->g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->F()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-eqz v5, :cond_0

    .line 41
    .line 42
    invoke-static {v2}, Ll/v5b0;->b(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 v5, 0x0

    .line 48
    :goto_0
    const-wide/high16 v6, 0x403e000000000000L    # 30.0

    .line 49
    .line 50
    const/4 v8, 0x0

    .line 51
    const-string v9, "%1$s %2$s"

    .line 52
    .line 53
    const/4 v10, 0x2

    .line 54
    if-eqz v3, :cond_5

    .line 55
    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    goto/16 :goto_4

    .line 59
    .line 60
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_2

    .line 65
    .line 66
    sget-object v2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 67
    .line 68
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v2, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {v9, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    goto :goto_3

    .line 89
    :cond_2
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->aa:I

    .line 90
    .line 91
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-eqz v4, :cond_3

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    :goto_1
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->f9:I

    .line 119
    .line 120
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 125
    .line 126
    .line 127
    move-result v8

    .line 128
    if-eqz v8, :cond_4

    .line 129
    .line 130
    invoke-virtual/range {p0 .. p0}, Ll/cry;->e()D

    .line 131
    .line 132
    .line 133
    move-result-wide v8

    .line 134
    goto :goto_2

    .line 135
    :cond_4
    invoke-virtual/range {p0 .. p0}, Ll/cry;->f()D

    .line 136
    .line 137
    .line 138
    move-result-wide v8

    .line 139
    :goto_2
    div-double/2addr v8, v6

    .line 140
    invoke-static {v8, v9}, Ll/a9g0;->e(D)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    filled-new-array {v4, v6}, [Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-virtual {v1, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v8

    .line 152
    :goto_3
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 153
    .line 154
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v6

    .line 162
    filled-new-array {v4, v6}, [Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v1, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->M(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->S(Z)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_5
    :goto_4
    if-eqz v5, :cond_8

    .line 184
    .line 185
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-eqz v3, :cond_6

    .line 190
    .line 191
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    iget v9, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 196
    .line 197
    invoke-virtual {v3, v2, v9}, Ll/tab0;->t(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    sget-object v9, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 202
    .line 203
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v9

    .line 207
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v11

    .line 211
    new-instance v12, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v9

    .line 226
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v11

    .line 230
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v12

    .line 234
    new-instance v13, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v11

    .line 249
    filled-new-array {v9, v11}, [Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object v9

    .line 253
    invoke-static {v9, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v9

    .line 257
    const-string v10, "%1$s /%2$s"

    .line 258
    .line 259
    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v9

    .line 263
    goto/16 :goto_5

    .line 264
    .line 265
    :cond_6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 266
    .line 267
    .line 268
    move-result v3

    .line 269
    if-eqz v3, :cond_7

    .line 270
    .line 271
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 276
    .line 277
    .line 278
    move-result v3

    .line 279
    if-nez v3, :cond_7

    .line 280
    .line 281
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 282
    .line 283
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v11

    .line 287
    invoke-virtual/range {p0 .. p0}, Ll/cry;->e()D

    .line 288
    .line 289
    .line 290
    move-result-wide v12

    .line 291
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 292
    .line 293
    .line 294
    move-result v14

    .line 295
    int-to-double v14, v14

    .line 296
    div-double/2addr v12, v14

    .line 297
    invoke-static {v12, v13}, Ll/a9g0;->e(D)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v12

    .line 301
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object v11

    .line 305
    invoke-virtual {v1, v3, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v3

    .line 309
    sget-object v11, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 310
    .line 311
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v11

    .line 315
    invoke-virtual/range {p0 .. p0}, Ll/cry;->e()D

    .line 316
    .line 317
    .line 318
    move-result-wide v12

    .line 319
    double-to-int v12, v12

    .line 320
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 321
    .line 322
    .line 323
    move-result-object v12

    .line 324
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v11

    .line 328
    invoke-static {v11, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v10

    .line 332
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v9

    .line 336
    goto/16 :goto_5

    .line 337
    .line 338
    :cond_7
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 339
    .line 340
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v11

    .line 344
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v12

    .line 348
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v11

    .line 352
    invoke-virtual {v1, v3, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v3

    .line 356
    sget-object v11, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 357
    .line 358
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v11

    .line 362
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v12

    .line 366
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v11

    .line 370
    invoke-static {v11, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v10

    .line 374
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v9

    .line 378
    goto :goto_5

    .line 379
    :cond_8
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 380
    .line 381
    .line 382
    move-result v3

    .line 383
    if-eqz v3, :cond_9

    .line 384
    .line 385
    sget-object v3, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 386
    .line 387
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v11

    .line 395
    filled-new-array {v3, v11}, [Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v3

    .line 399
    invoke-static {v3, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v3

    .line 403
    const-string v11, "%1$s %2$s /\u5468"

    .line 404
    .line 405
    invoke-static {v11, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v3

    .line 409
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v11

    .line 413
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v12

    .line 417
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    move-result-object v11

    .line 421
    invoke-static {v11, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v10

    .line 425
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v9

    .line 429
    goto :goto_5

    .line 430
    :cond_9
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 431
    .line 432
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v11

    .line 436
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v12

    .line 440
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object v11

    .line 444
    invoke-virtual {v1, v3, v11}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v3

    .line 448
    sget-object v11, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 449
    .line 450
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v11

    .line 454
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v12

    .line 458
    filled-new-array {v11, v12}, [Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v11

    .line 462
    invoke-static {v11, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v10

    .line 466
    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v9

    .line 470
    :goto_5
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 471
    .line 472
    .line 473
    move-result v2

    .line 474
    if-eqz v2, :cond_b

    .line 475
    .line 476
    if-nez v4, :cond_b

    .line 477
    .line 478
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->f9:I

    .line 479
    .line 480
    invoke-virtual/range {p0 .. p0}, Ll/cry;->b()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v4

    .line 484
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 485
    .line 486
    .line 487
    move-result v8

    .line 488
    if-eqz v8, :cond_a

    .line 489
    .line 490
    invoke-virtual/range {p0 .. p0}, Ll/cry;->e()D

    .line 491
    .line 492
    .line 493
    move-result-wide v10

    .line 494
    goto :goto_6

    .line 495
    :cond_a
    invoke-virtual/range {p0 .. p0}, Ll/cry;->f()D

    .line 496
    .line 497
    .line 498
    move-result-wide v10

    .line 499
    :goto_6
    div-double/2addr v10, v6

    .line 500
    invoke-static {v10, v11}, Ll/a9g0;->e(D)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v6

    .line 504
    filled-new-array {v4, v6}, [Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    invoke-virtual {v1, v2, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v8

    .line 512
    :cond_b
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    invoke-virtual {v0, v9}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->M(Ljava/lang/String;)V

    .line 519
    .line 520
    .line 521
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->S(Z)V

    .line 522
    .line 523
    .line 524
    return-void
.end method

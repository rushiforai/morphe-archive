.class public final Ll/mry;
.super Ll/cry;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\'\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/mry;",
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
    invoke-virtual {p0, p1, p2, p3}, Ll/mry;->g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 10
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
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1, p2, p3}, Ll/cry;->g(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->F()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    invoke-static {v1}, Ll/v5b0;->b(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 v3, 0x0

    .line 51
    :goto_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    const-string v6, "%1$s /%2$s"

    .line 60
    .line 61
    const-string v7, "tttVip"

    .line 62
    .line 63
    const-string v8, "%1$s %2$s"

    .line 64
    .line 65
    const/4 v9, 0x2

    .line 66
    sparse-switch v5, :sswitch_data_0

    .line 67
    .line 68
    .line 69
    goto/16 :goto_5

    .line 70
    .line 71
    :sswitch_0
    const-string v2, "picksMembership"

    .line 72
    .line 73
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_1

    .line 78
    .line 79
    goto/16 :goto_5

    .line 80
    .line 81
    :sswitch_1
    const-string v0, "undoMembership"

    .line 82
    .line 83
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_7

    .line 88
    .line 89
    goto/16 :goto_6

    .line 90
    .line 91
    :sswitch_2
    const-string v0, "roaming"

    .line 92
    .line 93
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_8

    .line 98
    .line 99
    goto/16 :goto_5

    .line 100
    .line 101
    :sswitch_3
    const-string v0, "quickchatMembership"

    .line 102
    .line 103
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_8

    .line 108
    .line 109
    goto/16 :goto_5

    .line 110
    .line 111
    :sswitch_4
    const-string v2, "svipPicksMembership"

    .line 112
    .line 113
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-nez v2, :cond_1

    .line 118
    .line 119
    goto/16 :goto_5

    .line 120
    .line 121
    :cond_1
    if-eqz p2, :cond_5

    .line 122
    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    if-eqz p2, :cond_3

    .line 131
    .line 132
    sget-object p2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    filled-new-array {p2, v0}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {p2, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    invoke-static {v8, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    goto :goto_2

    .line 155
    :cond_3
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->aa:I

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_4

    .line 166
    .line 167
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    goto :goto_1

    .line 172
    :cond_4
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    :goto_1
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    .line 186
    .line 187
    :goto_2
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 188
    .line 189
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p1, v0, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->S(Z)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_5
    :goto_3
    if-eqz v3, :cond_6

    .line 219
    .line 220
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget p2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 225
    .line 226
    invoke-virtual {p1, v1, p2}, Ll/tab0;->t(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 231
    .line 232
    .line 233
    sget-object p2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 234
    .line 235
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    new-instance v1, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p2

    .line 258
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    new-instance v1, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {p0, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-static {v6, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    goto :goto_4

    .line 294
    :cond_6
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 295
    .line 296
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 313
    .line 314
    .line 315
    sget-object p2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 316
    .line 317
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-static {p0, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    invoke-static {v8, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    :goto_4
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->S(Z)V

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :sswitch_5
    const-string v0, "unlimitedSwipes"

    .line 348
    .line 349
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-nez v0, :cond_8

    .line 354
    .line 355
    goto :goto_5

    .line 356
    :sswitch_6
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    if-nez v0, :cond_8

    .line 361
    .line 362
    goto :goto_5

    .line 363
    :sswitch_7
    const-string v0, "superLikeMembership"

    .line 364
    .line 365
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-nez v0, :cond_8

    .line 370
    .line 371
    :cond_7
    :goto_5
    return-void

    .line 372
    :cond_8
    :goto_6
    if-eqz p2, :cond_c

    .line 373
    .line 374
    if-eqz p2, :cond_9

    .line 375
    .line 376
    invoke-static {v2, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    if-eqz v0, :cond_9

    .line 381
    .line 382
    goto :goto_9

    .line 383
    :cond_9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 384
    .line 385
    .line 386
    move-result p2

    .line 387
    if-eqz p2, :cond_a

    .line 388
    .line 389
    sget-object p2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 390
    .line 391
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p2

    .line 395
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    filled-new-array {p2, v0}, [Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object p2

    .line 403
    invoke-static {p2, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object p2

    .line 407
    invoke-static {v8, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object p2

    .line 411
    goto :goto_8

    .line 412
    :cond_a
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->aa:I

    .line 413
    .line 414
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    if-eqz v1, :cond_b

    .line 423
    .line 424
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    goto :goto_7

    .line 429
    :cond_b
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    :goto_7
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object p2

    .line 441
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 442
    .line 443
    .line 444
    :goto_8
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 445
    .line 446
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 455
    .line 456
    .line 457
    move-result-object p0

    .line 458
    invoke-virtual {p1, v0, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 463
    .line 464
    .line 465
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->S(Z)V

    .line 472
    .line 473
    .line 474
    return-void

    .line 475
    :cond_c
    :goto_9
    if-eqz v3, :cond_d

    .line 476
    .line 477
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 478
    .line 479
    .line 480
    move-result-object p1

    .line 481
    iget p2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 482
    .line 483
    invoke-virtual {p1, v1, p2}, Ll/tab0;->t(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object p1

    .line 487
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 488
    .line 489
    .line 490
    goto :goto_a

    .line 491
    :cond_d
    if-eqz p2, :cond_e

    .line 492
    .line 493
    invoke-static {v2, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 494
    .line 495
    .line 496
    move-result p2

    .line 497
    if-eqz p2, :cond_e

    .line 498
    .line 499
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 500
    .line 501
    .line 502
    move-result p2

    .line 503
    if-eqz p2, :cond_e

    .line 504
    .line 505
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 506
    .line 507
    .line 508
    move-result p2

    .line 509
    if-eqz p2, :cond_e

    .line 510
    .line 511
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 512
    .line 513
    .line 514
    move-result p2

    .line 515
    if-eqz p2, :cond_e

    .line 516
    .line 517
    sget-object p1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 518
    .line 519
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object p1

    .line 523
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 524
    .line 525
    .line 526
    move-result-object p2

    .line 527
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 528
    .line 529
    .line 530
    move-result-object p1

    .line 531
    invoke-static {p1, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object p1

    .line 535
    invoke-static {v8, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object p1

    .line 539
    goto :goto_a

    .line 540
    :cond_e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 541
    .line 542
    .line 543
    move-result p2

    .line 544
    if-eqz p2, :cond_f

    .line 545
    .line 546
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->A6:I

    .line 547
    .line 548
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 549
    .line 550
    .line 551
    move-result-object v0

    .line 552
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 557
    .line 558
    .line 559
    move-result-object v0

    .line 560
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p1

    .line 564
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 565
    .line 566
    .line 567
    goto :goto_a

    .line 568
    :cond_f
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->v9:I

    .line 569
    .line 570
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object v0

    .line 574
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->m()Ljava/lang/String;

    .line 575
    .line 576
    .line 577
    move-result-object v1

    .line 578
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 587
    .line 588
    .line 589
    :goto_a
    if-eqz v3, :cond_10

    .line 590
    .line 591
    sget-object p2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 592
    .line 593
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 594
    .line 595
    .line 596
    move-result-object p2

    .line 597
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    new-instance v1, Ljava/lang/StringBuilder;

    .line 602
    .line 603
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 604
    .line 605
    .line 606
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 610
    .line 611
    .line 612
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 613
    .line 614
    .line 615
    move-result-object p2

    .line 616
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object p0

    .line 620
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v0

    .line 624
    new-instance v1, Ljava/lang/StringBuilder;

    .line 625
    .line 626
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 627
    .line 628
    .line 629
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 633
    .line 634
    .line 635
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 636
    .line 637
    .line 638
    move-result-object p0

    .line 639
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 640
    .line 641
    .line 642
    move-result-object p0

    .line 643
    invoke-static {p0, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 644
    .line 645
    .line 646
    move-result-object p0

    .line 647
    invoke-static {v6, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 648
    .line 649
    .line 650
    move-result-object p0

    .line 651
    goto :goto_b

    .line 652
    :cond_10
    sget-object p2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 653
    .line 654
    invoke-virtual {p0}, Ll/cry;->b()Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object p0

    .line 658
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object p2

    .line 662
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 663
    .line 664
    .line 665
    move-result-object p0

    .line 666
    invoke-static {p0, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    move-result-object p0

    .line 670
    invoke-static {v8, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 671
    .line 672
    .line 673
    move-result-object p0

    .line 674
    :goto_b
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 675
    .line 676
    .line 677
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 678
    .line 679
    .line 680
    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->S(Z)V

    .line 681
    .line 682
    .line 683
    return-void

    .line 684
    nop

    .line 685
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_7
        -0x33752677 -> :sswitch_6
        -0x199fff46 -> :sswitch_5
        -0x59a8242 -> :sswitch_4
        0x458b6c7b -> :sswitch_3
        0x517a5c19 -> :sswitch_2
        0x6e276fda -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch
.end method

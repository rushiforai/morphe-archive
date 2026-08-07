.class public Ll/aop$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/aop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/aop;


# direct methods
.method public constructor <init>(Ll/aop;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop$a;->a:Ll/aop;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 19
    .line 20
    invoke-static {v0}, Ll/aop;->A(Ll/aop;)Lv/VText;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 28
    .line 29
    invoke-static {v0}, Ll/aop;->B(Ll/aop;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 37
    .line 38
    invoke-static {v0}, Ll/aop;->G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v0, v1}, Ll/aop;->S(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 47
    .line 48
    invoke-static {v2}, Ll/aop;->G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {v2, v3}, Ll/aop;->T(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 57
    .line 58
    invoke-static {p0}, Ll/aop;->G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {p0, v3}, Ll/aop;->U(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v0, v1, v2, p0}, Ll/aop;->Z(Ll/aop;ILjava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->q(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 79
    .line 80
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->w(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v4, p0, Ll/aop$a;->a:Ll/aop;

    .line 89
    .line 90
    invoke-static {v4}, Ll/aop;->G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-static {v4, v5}, Ll/aop;->S(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    iget-object v5, p0, Ll/aop$a;->a:Ll/aop;

    .line 99
    .line 100
    invoke-static {v5}, Ll/aop;->G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-static {v5, v6}, Ll/aop;->T(Ll/aop;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    iget-object v6, p0, Ll/aop$a;->a:Ll/aop;

    .line 109
    .line 110
    invoke-static {v6}, Ll/aop;->V(Ll/aop;)Z

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    iget-object v7, p0, Ll/aop$a;->a:Ll/aop;

    .line 115
    .line 116
    invoke-static {v7}, Ll/aop;->c0(Ll/aop;)V

    .line 117
    .line 118
    .line 119
    iget-object v7, p0, Ll/aop$a;->a:Ll/aop;

    .line 120
    .line 121
    invoke-static {v7}, Ll/aop;->B(Ll/aop;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    invoke-static {v7, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object v7, p0, Ll/aop$a;->a:Ll/aop;

    .line 129
    .line 130
    invoke-static {v7}, Ll/aop;->A(Ll/aop;)Lv/VText;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    invoke-static {v7, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 138
    .line 139
    invoke-static {v2}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    sget-object v2, Ll/aop$e;->a:[I

    .line 147
    .line 148
    iget-object v7, p0, Ll/aop$a;->a:Ll/aop;

    .line 149
    .line 150
    invoke-static {v7}, Ll/aop;->G(Ll/aop;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 151
    .line 152
    .line 153
    move-result-object v7

    .line 154
    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    aget v2, v2, v7

    .line 159
    .line 160
    const-string v7, " "

    .line 161
    .line 162
    if-eq v2, v3, :cond_c

    .line 163
    .line 164
    const/4 v8, 0x2

    .line 165
    if-eq v2, v8, :cond_9

    .line 166
    .line 167
    const/4 v6, 0x3

    .line 168
    if-eq v2, v6, :cond_5

    .line 169
    .line 170
    const/4 v6, 0x4

    .line 171
    if-eq v2, v6, :cond_1

    .line 172
    .line 173
    return-void

    .line 174
    :cond_1
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 175
    .line 176
    invoke-static {v2, v4, v5}, Ll/aop;->Y(Ll/aop;ILjava/lang/String;)V

    .line 177
    .line 178
    .line 179
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 180
    .line 181
    const-string v4, "#80F9E7FF"

    .line 182
    .line 183
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    invoke-static {v2, v1, v4}, Ll/aop;->X(Ll/aop;Ljava/lang/String;I)V

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 191
    .line 192
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    if-eqz v1, :cond_3

    .line 197
    .line 198
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 199
    .line 200
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    const-string v2, "tttPremiumUpgradeToUltra"

    .line 209
    .line 210
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-nez v1, :cond_2

    .line 215
    .line 216
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 217
    .line 218
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const-string v2, "Promo_premiumUpgradeToUltra"

    .line 227
    .line 228
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-eqz v1, :cond_3

    .line 233
    .line 234
    :cond_2
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 235
    .line 236
    invoke-static {v0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 241
    .line 242
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ah:I

    .line 247
    .line 248
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 253
    .line 254
    invoke-static {v2}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 274
    .line 275
    invoke-static {v0}, Ll/aop;->B(Ll/aop;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 283
    .line 284
    invoke-static {p0}, Ll/aop;->b0(Ll/aop;)V

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    :cond_3
    invoke-static {}, Ll/joa;->l4()Z

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 293
    .line 294
    if-eqz v1, :cond_4

    .line 295
    .line 296
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    new-instance v1, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 312
    .line 313
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Jg:I

    .line 314
    .line 315
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 327
    .line 328
    .line 329
    return-void

    .line 330
    :cond_4
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    new-instance v1, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 346
    .line 347
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ig:I

    .line 348
    .line 349
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    .line 362
    .line 363
    return-void

    .line 364
    :cond_5
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 365
    .line 366
    invoke-static {v2, v4, v5}, Ll/aop;->Y(Ll/aop;ILjava/lang/String;)V

    .line 367
    .line 368
    .line 369
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 370
    .line 371
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 372
    .line 373
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 374
    .line 375
    .line 376
    move-result v2

    .line 377
    if-eqz v2, :cond_6

    .line 378
    .line 379
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 380
    .line 381
    invoke-static {v2}, Ll/aop;->V(Ll/aop;)Z

    .line 382
    .line 383
    .line 384
    move-result v2

    .line 385
    if-eqz v2, :cond_6

    .line 386
    .line 387
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 388
    .line 389
    invoke-static {p0}, Ll/aop;->E(Ll/aop;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-virtual {p0, v0}, Ll/aop;->W0(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    return-void

    .line 397
    :cond_6
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 398
    .line 399
    invoke-static {v2, v1}, Ll/aop;->W(Ll/aop;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 403
    .line 404
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    if-eqz v1, :cond_8

    .line 409
    .line 410
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 411
    .line 412
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    const-string v2, "tttVipUpgradeToPremium"

    .line 421
    .line 422
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    if-nez v1, :cond_7

    .line 427
    .line 428
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 429
    .line 430
    invoke-static {v1}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 431
    .line 432
    .line 433
    move-result-object v1

    .line 434
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    const-string v2, "tttSeeUpgradeToPremium"

    .line 439
    .line 440
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    if-eqz v1, :cond_8

    .line 445
    .line 446
    :cond_7
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 447
    .line 448
    invoke-static {v0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    iget-object v1, p0, Ll/aop$a;->a:Ll/aop;

    .line 453
    .line 454
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ah:I

    .line 459
    .line 460
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v1

    .line 464
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 465
    .line 466
    invoke-static {v2}, Ll/aop;->H(Ll/aop;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v2

    .line 474
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 483
    .line 484
    .line 485
    iget-object v0, p0, Ll/aop$a;->a:Ll/aop;

    .line 486
    .line 487
    invoke-static {v0}, Ll/aop;->B(Ll/aop;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 492
    .line 493
    .line 494
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 495
    .line 496
    invoke-static {p0}, Ll/aop;->b0(Ll/aop;)V

    .line 497
    .line 498
    .line 499
    return-void

    .line 500
    :cond_8
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 501
    .line 502
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 503
    .line 504
    .line 505
    move-result-object p0

    .line 506
    new-instance v1, Ljava/lang/StringBuilder;

    .line 507
    .line 508
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 509
    .line 510
    .line 511
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 512
    .line 513
    .line 514
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 515
    .line 516
    .line 517
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 518
    .line 519
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bc:I

    .line 520
    .line 521
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 526
    .line 527
    .line 528
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object v0

    .line 532
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 533
    .line 534
    .line 535
    return-void

    .line 536
    :cond_9
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 537
    .line 538
    invoke-static {v2, v4, v5}, Ll/aop;->Y(Ll/aop;ILjava/lang/String;)V

    .line 539
    .line 540
    .line 541
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 542
    .line 543
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 544
    .line 545
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    if-eqz v2, :cond_a

    .line 550
    .line 551
    if-eqz v6, :cond_a

    .line 552
    .line 553
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 554
    .line 555
    invoke-static {p0}, Ll/aop;->E(Ll/aop;)Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    invoke-virtual {p0, v0}, Ll/aop;->W0(Ljava/lang/String;)V

    .line 560
    .line 561
    .line 562
    return-void

    .line 563
    :cond_a
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 564
    .line 565
    invoke-static {v2, v1}, Ll/aop;->W(Ll/aop;Ljava/lang/String;)V

    .line 566
    .line 567
    .line 568
    invoke-static {}, Ll/rbb0;->g()J

    .line 569
    .line 570
    .line 571
    move-result-wide v1

    .line 572
    const-wide/16 v3, 0x0

    .line 573
    .line 574
    cmp-long v1, v1, v3

    .line 575
    .line 576
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 577
    .line 578
    if-eqz v1, :cond_b

    .line 579
    .line 580
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 581
    .line 582
    .line 583
    move-result-object p0

    .line 584
    new-instance v1, Ljava/lang/StringBuilder;

    .line 585
    .line 586
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 587
    .line 588
    .line 589
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 596
    .line 597
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ys:I

    .line 598
    .line 599
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 611
    .line 612
    .line 613
    return-void

    .line 614
    :cond_b
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 615
    .line 616
    .line 617
    move-result-object p0

    .line 618
    new-instance v1, Ljava/lang/StringBuilder;

    .line 619
    .line 620
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 621
    .line 622
    .line 623
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 624
    .line 625
    .line 626
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    .line 628
    .line 629
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 630
    .line 631
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ss:I

    .line 632
    .line 633
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 634
    .line 635
    .line 636
    move-result-object v0

    .line 637
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 641
    .line 642
    .line 643
    move-result-object v0

    .line 644
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 645
    .line 646
    .line 647
    return-void

    .line 648
    :cond_c
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 649
    .line 650
    invoke-static {v2, v4, v5}, Ll/aop;->Y(Ll/aop;ILjava/lang/String;)V

    .line 651
    .line 652
    .line 653
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 654
    .line 655
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 656
    .line 657
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 658
    .line 659
    .line 660
    move-result-object v2

    .line 661
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 662
    .line 663
    .line 664
    move-result v2

    .line 665
    if-nez v2, :cond_d

    .line 666
    .line 667
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 668
    .line 669
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 670
    .line 671
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 672
    .line 673
    .line 674
    move-result v2

    .line 675
    if-eqz v2, :cond_d

    .line 676
    .line 677
    if-eqz v6, :cond_d

    .line 678
    .line 679
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 680
    .line 681
    invoke-static {p0}, Ll/aop;->E(Ll/aop;)Ljava/lang/String;

    .line 682
    .line 683
    .line 684
    move-result-object v0

    .line 685
    invoke-virtual {p0, v0}, Ll/aop;->W0(Ljava/lang/String;)V

    .line 686
    .line 687
    .line 688
    return-void

    .line 689
    :cond_d
    iget-object v2, p0, Ll/aop$a;->a:Ll/aop;

    .line 690
    .line 691
    invoke-static {v2, v1}, Ll/aop;->W(Ll/aop;Ljava/lang/String;)V

    .line 692
    .line 693
    .line 694
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 695
    .line 696
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 697
    .line 698
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 703
    .line 704
    .line 705
    move-result v1

    .line 706
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 707
    .line 708
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 709
    .line 710
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 711
    .line 712
    .line 713
    move-result-object v2

    .line 714
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 715
    .line 716
    .line 717
    move-result v2

    .line 718
    if-nez v1, :cond_f

    .line 719
    .line 720
    if-eqz v2, :cond_e

    .line 721
    .line 722
    goto :goto_0

    .line 723
    :cond_e
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 724
    .line 725
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 726
    .line 727
    .line 728
    move-result-object p0

    .line 729
    new-instance v1, Ljava/lang/StringBuilder;

    .line 730
    .line 731
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 732
    .line 733
    .line 734
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 735
    .line 736
    .line 737
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 738
    .line 739
    .line 740
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 741
    .line 742
    sget v2, Lcom/p1/mobile/putong/core/R$string;->dt:I

    .line 743
    .line 744
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 745
    .line 746
    .line 747
    move-result-object v0

    .line 748
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 749
    .line 750
    .line 751
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 752
    .line 753
    .line 754
    move-result-object v0

    .line 755
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 756
    .line 757
    .line 758
    return-void

    .line 759
    :cond_f
    :goto_0
    iget-object p0, p0, Ll/aop$a;->a:Ll/aop;

    .line 760
    .line 761
    invoke-static {p0}, Ll/aop;->y(Ll/aop;)Lv/VText;

    .line 762
    .line 763
    .line 764
    move-result-object p0

    .line 765
    new-instance v1, Ljava/lang/StringBuilder;

    .line 766
    .line 767
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 768
    .line 769
    .line 770
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 771
    .line 772
    .line 773
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 774
    .line 775
    .line 776
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 777
    .line 778
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ft:I

    .line 779
    .line 780
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 781
    .line 782
    .line 783
    move-result-object v0

    .line 784
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 785
    .line 786
    .line 787
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 788
    .line 789
    .line 790
    move-result-object v0

    .line 791
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 792
    .line 793
    .line 794
    return-void
.end method

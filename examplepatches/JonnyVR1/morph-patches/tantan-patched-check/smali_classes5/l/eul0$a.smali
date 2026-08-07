.class public Ll/eul0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/eul0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/eul0;


# direct methods
.method public constructor <init>(Ll/eul0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0$a;->a:Ll/eul0;

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
    .locals 7

    .line 1
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->q(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 12
    .line 13
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->w(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 22
    .line 23
    invoke-static {v2}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "#CC000000"

    .line 28
    .line 29
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 37
    .line 38
    invoke-static {v2}, Ll/eul0;->A(Ll/eul0;)Lv/VText;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "#66000000"

    .line 43
    .line 44
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 52
    .line 53
    invoke-static {v2}, Ll/eul0;->V(Ll/eul0;)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 57
    .line 58
    invoke-static {v2}, Ll/eul0;->B(Ll/eul0;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const/4 v3, 0x0

    .line 63
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    sget-object v2, Ll/eul0$e;->a:[I

    .line 67
    .line 68
    iget-object v3, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 69
    .line 70
    invoke-static {v3}, Ll/eul0;->G(Ll/eul0;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    aget v2, v2, v3

    .line 79
    .line 80
    const/4 v3, 0x1

    .line 81
    if-eq v2, v3, :cond_b

    .line 82
    .line 83
    const/4 v4, 0x2

    .line 84
    if-eq v2, v4, :cond_8

    .line 85
    .line 86
    const/4 v4, 0x3

    .line 87
    if-eq v2, v4, :cond_4

    .line 88
    .line 89
    const/4 v4, 0x4

    .line 90
    if-eq v2, v4, :cond_0

    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 94
    .line 95
    invoke-static {v2}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 103
    .line 104
    invoke-static {v2, v1}, Ll/eul0;->S(Ll/eul0;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 108
    .line 109
    invoke-static {v1}, Ll/eul0;->z(Ll/eul0;)Landroid/widget/FrameLayout;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    sget v2, Ll/dbc0;->kb:I

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 119
    .line 120
    invoke-static {v1}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const-string v2, "#F9E7FF"

    .line 125
    .line 126
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 134
    .line 135
    invoke-static {v1}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 147
    .line 148
    invoke-static {v1}, Ll/eul0;->A(Ll/eul0;)Lv/VText;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    const-string v2, "#80F9E7FF"

    .line 153
    .line 154
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 159
    .line 160
    .line 161
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 162
    .line 163
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    if-eqz v1, :cond_2

    .line 168
    .line 169
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 170
    .line 171
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const-string v2, "tttPremiumUpgradeToUltra"

    .line 180
    .line 181
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-nez v1, :cond_1

    .line 186
    .line 187
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 188
    .line 189
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    const-string v2, "Promo_premiumUpgradeToUltra"

    .line 198
    .line 199
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_2

    .line 204
    .line 205
    :cond_1
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 206
    .line 207
    invoke-static {v0}, Ll/eul0;->B(Ll/eul0;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 215
    .line 216
    invoke-static {v0}, Ll/eul0;->U(Ll/eul0;)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 220
    .line 221
    invoke-static {v0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 226
    .line 227
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->i6:I

    .line 232
    .line 233
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 238
    .line 239
    invoke-static {p0}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_2
    invoke-static {}, Ll/joa;->l4()Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 264
    .line 265
    if-eqz v1, :cond_3

    .line 266
    .line 267
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    new-instance v1, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 280
    .line 281
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Jg:I

    .line 282
    .line 283
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 295
    .line 296
    .line 297
    return-void

    .line 298
    :cond_3
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    new-instance v1, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 311
    .line 312
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ig:I

    .line 313
    .line 314
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    .line 327
    .line 328
    return-void

    .line 329
    :cond_4
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 330
    .line 331
    invoke-static {v2}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 336
    .line 337
    .line 338
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 339
    .line 340
    invoke-static {v2}, Ll/eul0;->z(Ll/eul0;)Landroid/widget/FrameLayout;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    sget v4, Ll/dbc0;->La:I

    .line 345
    .line 346
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 347
    .line 348
    .line 349
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 350
    .line 351
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 352
    .line 353
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 354
    .line 355
    .line 356
    move-result v2

    .line 357
    if-eqz v2, :cond_5

    .line 358
    .line 359
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 360
    .line 361
    invoke-static {v2}, Ll/eul0;->R(Ll/eul0;)Z

    .line 362
    .line 363
    .line 364
    move-result v2

    .line 365
    if-eqz v2, :cond_5

    .line 366
    .line 367
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 368
    .line 369
    invoke-static {p0}, Ll/eul0;->E(Ll/eul0;)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {p0, v0}, Ll/eul0;->L0(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    return-void

    .line 377
    :cond_5
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 378
    .line 379
    invoke-static {v2, v1}, Ll/eul0;->S(Ll/eul0;Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 383
    .line 384
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    if-eqz v1, :cond_7

    .line 389
    .line 390
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 391
    .line 392
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 397
    .line 398
    .line 399
    move-result-object v1

    .line 400
    const-string v2, "tttVipUpgradeToPremium"

    .line 401
    .line 402
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 403
    .line 404
    .line 405
    move-result v1

    .line 406
    if-nez v1, :cond_6

    .line 407
    .line 408
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 409
    .line 410
    invoke-static {v1}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    const-string v2, "tttSeeUpgradeToPremium"

    .line 419
    .line 420
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 421
    .line 422
    .line 423
    move-result v1

    .line 424
    if-eqz v1, :cond_7

    .line 425
    .line 426
    :cond_6
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 427
    .line 428
    invoke-static {v0}, Ll/eul0;->B(Ll/eul0;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 433
    .line 434
    .line 435
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 436
    .line 437
    invoke-static {v0}, Ll/eul0;->U(Ll/eul0;)V

    .line 438
    .line 439
    .line 440
    iget-object v0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 441
    .line 442
    invoke-static {v0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    iget-object v1, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 447
    .line 448
    invoke-interface {v1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->i6:I

    .line 453
    .line 454
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 459
    .line 460
    invoke-static {p0}, Ll/eul0;->H(Ll/eul0;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 461
    .line 462
    .line 463
    move-result-object p0

    .line 464
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object p0

    .line 472
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 477
    .line 478
    .line 479
    return-void

    .line 480
    :cond_7
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 481
    .line 482
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    new-instance v1, Ljava/lang/StringBuilder;

    .line 487
    .line 488
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 489
    .line 490
    .line 491
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 495
    .line 496
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bc:I

    .line 497
    .line 498
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 510
    .line 511
    .line 512
    return-void

    .line 513
    :cond_8
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 514
    .line 515
    invoke-static {v2}, Ll/eul0;->z(Ll/eul0;)Landroid/widget/FrameLayout;

    .line 516
    .line 517
    .line 518
    move-result-object v2

    .line 519
    sget v4, Ll/dbc0;->bb:I

    .line 520
    .line 521
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 522
    .line 523
    .line 524
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 525
    .line 526
    invoke-static {v2}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 527
    .line 528
    .line 529
    move-result-object v2

    .line 530
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 531
    .line 532
    .line 533
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 534
    .line 535
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 536
    .line 537
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 538
    .line 539
    .line 540
    move-result v2

    .line 541
    if-eqz v2, :cond_9

    .line 542
    .line 543
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 544
    .line 545
    invoke-static {v2}, Ll/eul0;->R(Ll/eul0;)Z

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    if-eqz v2, :cond_9

    .line 550
    .line 551
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 552
    .line 553
    invoke-static {p0}, Ll/eul0;->E(Ll/eul0;)Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    invoke-virtual {p0, v0}, Ll/eul0;->L0(Ljava/lang/String;)V

    .line 558
    .line 559
    .line 560
    return-void

    .line 561
    :cond_9
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 562
    .line 563
    invoke-static {v2, v1}, Ll/eul0;->S(Ll/eul0;Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ys:I

    .line 567
    .line 568
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ss:I

    .line 569
    .line 570
    invoke-static {}, Ll/rbb0;->g()J

    .line 571
    .line 572
    .line 573
    move-result-wide v3

    .line 574
    const-wide/16 v5, 0x0

    .line 575
    .line 576
    cmp-long v3, v3, v5

    .line 577
    .line 578
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 579
    .line 580
    if-eqz v3, :cond_a

    .line 581
    .line 582
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 583
    .line 584
    .line 585
    move-result-object p0

    .line 586
    new-instance v2, Ljava/lang/StringBuilder;

    .line 587
    .line 588
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 589
    .line 590
    .line 591
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 595
    .line 596
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 597
    .line 598
    .line 599
    move-result-object v0

    .line 600
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 608
    .line 609
    .line 610
    return-void

    .line 611
    :cond_a
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    new-instance v1, Ljava/lang/StringBuilder;

    .line 616
    .line 617
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 618
    .line 619
    .line 620
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 624
    .line 625
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 637
    .line 638
    .line 639
    return-void

    .line 640
    :cond_b
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 641
    .line 642
    invoke-static {v2}, Ll/eul0;->z(Ll/eul0;)Landroid/widget/FrameLayout;

    .line 643
    .line 644
    .line 645
    move-result-object v2

    .line 646
    sget v4, Ll/dbc0;->vb:I

    .line 647
    .line 648
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 649
    .line 650
    .line 651
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 652
    .line 653
    invoke-static {v2}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 654
    .line 655
    .line 656
    move-result-object v2

    .line 657
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 658
    .line 659
    .line 660
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 661
    .line 662
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 663
    .line 664
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 665
    .line 666
    .line 667
    move-result-object v2

    .line 668
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 669
    .line 670
    .line 671
    move-result v2

    .line 672
    if-nez v2, :cond_c

    .line 673
    .line 674
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 675
    .line 676
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 677
    .line 678
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 679
    .line 680
    .line 681
    move-result v2

    .line 682
    if-eqz v2, :cond_c

    .line 683
    .line 684
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 685
    .line 686
    invoke-static {v2}, Ll/eul0;->R(Ll/eul0;)Z

    .line 687
    .line 688
    .line 689
    move-result v2

    .line 690
    if-eqz v2, :cond_c

    .line 691
    .line 692
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 693
    .line 694
    invoke-static {p0}, Ll/eul0;->E(Ll/eul0;)Ljava/lang/String;

    .line 695
    .line 696
    .line 697
    move-result-object v0

    .line 698
    invoke-virtual {p0, v0}, Ll/eul0;->L0(Ljava/lang/String;)V

    .line 699
    .line 700
    .line 701
    return-void

    .line 702
    :cond_c
    iget-object v2, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 703
    .line 704
    invoke-static {v2, v1}, Ll/eul0;->S(Ll/eul0;Ljava/lang/String;)V

    .line 705
    .line 706
    .line 707
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 708
    .line 709
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 710
    .line 711
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 712
    .line 713
    .line 714
    move-result-object v1

    .line 715
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 716
    .line 717
    .line 718
    move-result v1

    .line 719
    if-nez v1, :cond_e

    .line 720
    .line 721
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 722
    .line 723
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 724
    .line 725
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 726
    .line 727
    .line 728
    move-result-object v1

    .line 729
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 730
    .line 731
    .line 732
    move-result v1

    .line 733
    if-eqz v1, :cond_d

    .line 734
    .line 735
    goto :goto_0

    .line 736
    :cond_d
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 737
    .line 738
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 739
    .line 740
    .line 741
    move-result-object p0

    .line 742
    new-instance v1, Ljava/lang/StringBuilder;

    .line 743
    .line 744
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 745
    .line 746
    .line 747
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 748
    .line 749
    .line 750
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 751
    .line 752
    sget v2, Lcom/p1/mobile/putong/core/R$string;->dt:I

    .line 753
    .line 754
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 759
    .line 760
    .line 761
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 762
    .line 763
    .line 764
    move-result-object v0

    .line 765
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 766
    .line 767
    .line 768
    return-void

    .line 769
    :cond_e
    :goto_0
    iget-object p0, p0, Ll/eul0$a;->a:Ll/eul0;

    .line 770
    .line 771
    invoke-static {p0}, Ll/eul0;->y(Ll/eul0;)Lv/VText;

    .line 772
    .line 773
    .line 774
    move-result-object p0

    .line 775
    new-instance v1, Ljava/lang/StringBuilder;

    .line 776
    .line 777
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 778
    .line 779
    .line 780
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 781
    .line 782
    .line 783
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 784
    .line 785
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ft:I

    .line 786
    .line 787
    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 788
    .line 789
    .line 790
    move-result-object v0

    .line 791
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 792
    .line 793
    .line 794
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 795
    .line 796
    .line 797
    move-result-object v0

    .line 798
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 799
    .line 800
    .line 801
    return-void
.end method

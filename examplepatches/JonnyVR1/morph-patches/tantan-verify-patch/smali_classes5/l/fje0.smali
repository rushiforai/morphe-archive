.class public Ll/fje0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ll/a690;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:I

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/AutoVDraweeView;

.field public j:Lv/AutoVDraweeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/a690;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    iput v0, p0, Ll/fje0;->e:I

    .line 7
    .line 8
    const-string v0, "#4d4d4d"

    .line 9
    .line 10
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/fje0;->f:I

    .line 15
    .line 16
    iput-object p1, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    iput-object p2, p0, Ll/fje0;->c:Ll/a690;

    .line 19
    .line 20
    iput-object p3, p0, Ll/fje0;->d:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12

    .line 1
    invoke-static {}, Ll/vnb;->q1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x41000000    # 8.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    new-instance v2, Landroid/widget/LinearLayout;

    .line 12
    .line 13
    iget-object v3, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 20
    .line 21
    .line 22
    new-instance v4, Landroid/widget/TextView;

    .line 23
    .line 24
    iget-object v5, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-direct {v4, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    iget-object v5, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->t7:I

    .line 32
    .line 33
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    const-string v5, "#f2c669"

    .line 41
    .line 42
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 50
    .line 51
    sget v6, Ll/jbc0;->h3:I

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-static {v4, v5}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    const/high16 v5, 0x41200000    # 10.0f

    .line 61
    .line 62
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 67
    .line 68
    .line 69
    const/high16 v5, 0x41900000    # 18.0f

    .line 70
    .line 71
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 75
    .line 76
    .line 77
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 78
    .line 79
    const/4 v5, -0x2

    .line 80
    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 81
    .line 82
    .line 83
    const/16 v6, 0x11

    .line 84
    .line 85
    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 86
    .line 87
    invoke-virtual {v2, v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .line 89
    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    mul-int/lit8 v3, v1, 0x10

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    mul-int/lit8 v3, v1, 0x15

    .line 96
    .line 97
    :goto_0
    iget-object v7, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    invoke-virtual {v7}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    sget v8, Ll/rec0;->M2:I

    .line 104
    .line 105
    const/4 v9, 0x0

    .line 106
    invoke-virtual {v7, v8, p1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    check-cast v7, Landroid/widget/FrameLayout;

    .line 111
    .line 112
    iput-object v7, p0, Ll/fje0;->g:Landroid/widget/FrameLayout;

    .line 113
    .line 114
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    .line 115
    .line 116
    const/4 v8, -0x1

    .line 117
    invoke-direct {v7, v8, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 118
    .line 119
    .line 120
    sget v3, Ll/fdc0;->J0:I

    .line 121
    .line 122
    iget-object v10, p0, Ll/fje0;->g:Landroid/widget/FrameLayout;

    .line 123
    .line 124
    invoke-virtual {v2, v3, v10}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object v3, p0, Ll/fje0;->g:Landroid/widget/FrameLayout;

    .line 128
    .line 129
    invoke-virtual {v2, v3, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    .line 131
    .line 132
    iget-object v3, p0, Ll/fje0;->g:Landroid/widget/FrameLayout;

    .line 133
    .line 134
    sget v7, Ll/fdc0;->s:I

    .line 135
    .line 136
    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Landroid/widget/FrameLayout;

    .line 141
    .line 142
    iput-object v3, p0, Ll/fje0;->h:Landroid/widget/FrameLayout;

    .line 143
    .line 144
    iget-object v3, p0, Ll/fje0;->g:Landroid/widget/FrameLayout;

    .line 145
    .line 146
    sget v7, Ll/fdc0;->i:I

    .line 147
    .line 148
    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    check-cast v3, Lv/AutoVDraweeView;

    .line 153
    .line 154
    iput-object v3, p0, Ll/fje0;->i:Lv/AutoVDraweeView;

    .line 155
    .line 156
    iget-object v3, p0, Ll/fje0;->g:Landroid/widget/FrameLayout;

    .line 157
    .line 158
    sget v7, Ll/fdc0;->g:I

    .line 159
    .line 160
    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    check-cast v3, Lv/AutoVDraweeView;

    .line 165
    .line 166
    iput-object v3, p0, Ll/fje0;->j:Lv/AutoVDraweeView;

    .line 167
    .line 168
    iget-object v3, p0, Ll/fje0;->i:Lv/AutoVDraweeView;

    .line 169
    .line 170
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 171
    .line 172
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 173
    .line 174
    invoke-virtual {v7}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 179
    .line 180
    .line 181
    move-result-object v7

    .line 182
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v3, v7}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    new-instance v3, Lv/VText;

    .line 188
    .line 189
    iget-object v7, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 190
    .line 191
    invoke-direct {v3, v7}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 192
    .line 193
    .line 194
    iput-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 195
    .line 196
    sget v7, Ll/fdc0;->P0:I

    .line 197
    .line 198
    invoke-virtual {v3, v7}, Landroid/view/View;->setId(I)V

    .line 199
    .line 200
    .line 201
    iget-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 202
    .line 203
    iget v7, p0, Ll/fje0;->e:I

    .line 204
    .line 205
    int-to-float v7, v7

    .line 206
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 207
    .line 208
    .line 209
    iget-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 210
    .line 211
    iget v7, p0, Ll/fje0;->f:I

    .line 212
    .line 213
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 214
    .line 215
    .line 216
    iget-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 217
    .line 218
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 219
    .line 220
    .line 221
    iget-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 222
    .line 223
    const/4 v6, 0x4

    .line 224
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 225
    .line 226
    .line 227
    iget-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 228
    .line 229
    sget v6, Ll/qa00;->j:I

    .line 230
    .line 231
    invoke-virtual {v3, v6, v9, v6, v9}, Landroid/view/View;->setPadding(IIII)V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Ll/fje0;->a:Lv/VText;

    .line 235
    .line 236
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 237
    .line 238
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 239
    .line 240
    .line 241
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 242
    .line 243
    sget v6, Ll/qa00;->x:I

    .line 244
    .line 245
    invoke-direct {v3, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 246
    .line 247
    .line 248
    if-eqz v0, :cond_1

    .line 249
    .line 250
    goto :goto_1

    .line 251
    :cond_1
    const-wide/high16 v7, 0x3ff8000000000000L    # 1.5

    .line 252
    .line 253
    int-to-double v0, v1

    .line 254
    mul-double/2addr v0, v7

    .line 255
    double-to-int v1, v0

    .line 256
    :goto_1
    iput v1, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 257
    .line 258
    iput v9, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 259
    .line 260
    iget-object v0, p0, Ll/fje0;->a:Lv/VText;

    .line 261
    .line 262
    invoke-virtual {v2, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 263
    .line 264
    .line 265
    const/high16 v0, 0x41c00000    # 24.0f

    .line 266
    .line 267
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    iget-object v1, p0, Ll/fje0;->a:Lv/VText;

    .line 272
    .line 273
    invoke-static {v1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 274
    .line 275
    .line 276
    iget-object v1, p0, Ll/fje0;->a:Lv/VText;

    .line 277
    .line 278
    invoke-static {v1, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 279
    .line 280
    .line 281
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    check-cast v0, Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-nez v0, :cond_3

    .line 304
    .line 305
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 306
    .line 307
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 308
    .line 309
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    check-cast v1, Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 332
    .line 333
    iget-object v7, p0, Ll/fje0;->j:Lv/AutoVDraweeView;

    .line 334
    .line 335
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 336
    .line 337
    .line 338
    move-result-object v8

    .line 339
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 340
    .line 341
    .line 342
    move-result-object v8

    .line 343
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v8

    .line 347
    const/4 v10, 0x7

    .line 348
    const/16 v11, 0x14

    .line 349
    .line 350
    invoke-virtual {v1, v7, v8, v10, v11}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 354
    .line 355
    .line 356
    move-result v1

    .line 357
    iget-object v7, p0, Ll/fje0;->a:Lv/VText;

    .line 358
    .line 359
    if-eqz v1, :cond_2

    .line 360
    .line 361
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->s:I

    .line 370
    .line 371
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 372
    .line 373
    invoke-virtual {p0, v0}, Ll/fje0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    .line 387
    .line 388
    goto :goto_2

    .line 389
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 394
    .line 395
    .line 396
    move-result-object p1

    .line 397
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->t:I

    .line 398
    .line 399
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 400
    .line 401
    invoke-virtual {p0, v0}, Ll/fje0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    invoke-virtual {p1, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object p1

    .line 413
    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 414
    .line 415
    .line 416
    :goto_2
    iget-object p1, p0, Ll/fje0;->b:Lcom/p1/mobile/android/app/Act;

    .line 417
    .line 418
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->u7:I

    .line 419
    .line 420
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 425
    .line 426
    .line 427
    goto :goto_3

    .line 428
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 429
    .line 430
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 431
    .line 432
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 433
    .line 434
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 435
    .line 436
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 441
    .line 442
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 443
    .line 444
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 449
    .line 450
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 451
    .line 452
    invoke-virtual {v1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    iget-object v1, p0, Ll/fje0;->j:Lv/AutoVDraweeView;

    .line 457
    .line 458
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 463
    .line 464
    invoke-virtual {v1, v4}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 465
    .line 466
    .line 467
    iget-object v1, p0, Ll/fje0;->a:Lv/VText;

    .line 468
    .line 469
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 470
    .line 471
    .line 472
    move-result-object p1

    .line 473
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->j2:I

    .line 478
    .line 479
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 480
    .line 481
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    invoke-virtual {p1, v4, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object p1

    .line 489
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 490
    .line 491
    .line 492
    :goto_3
    iput v9, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 493
    .line 494
    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 495
    .line 496
    iget-object p0, p0, Ll/fje0;->a:Lv/VText;

    .line 497
    .line 498
    invoke-virtual {p0, v6}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 499
    .line 500
    .line 501
    return-object v2
.end method

.method public final b(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    array-length v0, p1

    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, v1

    .line 18
    :goto_0
    if-ge v1, v0, :cond_4

    .line 19
    .line 20
    aget-char v3, p1, v1

    .line 21
    .line 22
    const/16 v4, 0x4e00

    .line 23
    .line 24
    const-string v5, "..."

    .line 25
    .line 26
    if-lt v3, v4, :cond_2

    .line 27
    .line 28
    const v4, 0x9fa5

    .line 29
    .line 30
    .line 31
    if-gt v3, v4, :cond_2

    .line 32
    .line 33
    const/16 v4, 0xf

    .line 34
    .line 35
    if-ne v2, v4, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    add-int/lit8 v2, v2, 0x2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    :goto_1
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const/16 v3, 0x10

    .line 50
    .line 51
    if-lt v2, v3, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    :goto_2
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

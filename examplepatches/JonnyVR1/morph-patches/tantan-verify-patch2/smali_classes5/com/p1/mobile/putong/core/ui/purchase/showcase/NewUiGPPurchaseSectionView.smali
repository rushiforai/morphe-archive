.class public Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;
.super Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;
.source "SourceFile"


# instance fields
.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText_AutoFit;

.field public f:Landroid/view/View;

.field public g:Lv/VText_AutoFit;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public a(ZZLcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->e:Lv/VText_AutoFit;

    .line 4
    .line 5
    invoke-virtual {v1}, Lv/VText_AutoFit;->p()V

    .line 6
    .line 7
    .line 8
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 9
    .line 10
    invoke-virtual {v1}, Lv/VText_AutoFit;->p()V

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    const-string v3, "tttSeeWhoLikedMe"

    .line 21
    .line 22
    const-string v4, "tttVip"

    .line 23
    .line 24
    const/4 v5, -0x1

    .line 25
    const-string v6, "tttUltraPremium"

    .line 26
    .line 27
    const-string v7, "tttSvipGoogleplay"

    .line 28
    .line 29
    const-string v8, "#69edd7a3"

    .line 30
    .line 31
    const/4 v9, 0x1

    .line 32
    const-string v10, "form_sub"

    .line 33
    .line 34
    if-eqz p1, :cond_9

    .line 35
    .line 36
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 37
    .line 38
    .line 39
    move-result v11

    .line 40
    if-eq v11, v9, :cond_0

    .line 41
    .line 42
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 43
    .line 44
    invoke-static {v11, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v11

    .line 51
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v11

    .line 55
    if-nez v11, :cond_1

    .line 56
    .line 57
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 58
    .line 59
    .line 60
    move-result v11

    .line 61
    if-ne v11, v9, :cond_1

    .line 62
    .line 63
    sget-object v11, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v11, v11, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 66
    .line 67
    invoke-virtual {v11}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q4()Z

    .line 68
    .line 69
    .line 70
    move-result v11

    .line 71
    if-eqz v11, :cond_1

    .line 72
    .line 73
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 74
    .line 75
    invoke-static {v11, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v11

    .line 86
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v11}, Ljava/lang/String;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result v12

    .line 93
    sparse-switch v12, :sswitch_data_0

    .line 94
    .line 95
    .line 96
    :goto_0
    move v11, v5

    .line 97
    goto :goto_1

    .line 98
    :sswitch_0
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v11

    .line 102
    if-nez v11, :cond_2

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    move v11, v1

    .line 106
    goto :goto_1

    .line 107
    :sswitch_1
    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v11

    .line 111
    if-nez v11, :cond_3

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    move v11, v9

    .line 115
    goto :goto_1

    .line 116
    :sswitch_2
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v11

    .line 120
    if-nez v11, :cond_4

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    move v11, v2

    .line 124
    :goto_1
    const-string v12, "#cc000000"

    .line 125
    .line 126
    packed-switch v11, :pswitch_data_0

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 130
    .line 131
    .line 132
    move-result v11

    .line 133
    if-eqz v11, :cond_5

    .line 134
    .line 135
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v11, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v11

    .line 141
    if-eqz v11, :cond_5

    .line 142
    .line 143
    const-string v8, "#FF000000"

    .line 144
    .line 145
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v11

    .line 149
    const-string v12, "#DFB43A"

    .line 150
    .line 151
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v12

    .line 155
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v13

    .line 159
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    goto/16 :goto_3

    .line 164
    .line 165
    :cond_5
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v11

    .line 169
    const-string v12, "#edd7a3"

    .line 170
    .line 171
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    move-result v13

    .line 175
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v12

    .line 179
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    move-result v8

    .line 183
    move/from16 v16, v13

    .line 184
    .line 185
    move v13, v12

    .line 186
    move/from16 v12, v16

    .line 187
    .line 188
    goto/16 :goto_3

    .line 189
    .line 190
    :pswitch_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 191
    .line 192
    .line 193
    move-result v8

    .line 194
    if-eqz v8, :cond_6

    .line 195
    .line 196
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {v8, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-eqz v8, :cond_6

    .line 203
    .line 204
    const-string v8, "#CCFFFFFF"

    .line 205
    .line 206
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result v11

    .line 210
    const-string v8, "#FF932B"

    .line 211
    .line 212
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v12

    .line 216
    const-string v8, "#CC000000"

    .line 217
    .line 218
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    move-result v13

    .line 222
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    goto :goto_3

    .line 227
    :cond_6
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v11

    .line 231
    const-string v8, "#ff932b"

    .line 232
    .line 233
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v12

    .line 237
    :goto_2
    move v8, v11

    .line 238
    move v13, v8

    .line 239
    goto :goto_3

    .line 240
    :pswitch_1
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 241
    .line 242
    invoke-static {v8, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result v8

    .line 246
    const-string v11, "#F9E7FF"

    .line 247
    .line 248
    if-eqz v8, :cond_7

    .line 249
    .line 250
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    move-result v11

    .line 254
    const-string v8, "#3D2747"

    .line 255
    .line 256
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    move-result v12

    .line 260
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    move-result v13

    .line 264
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 265
    .line 266
    .line 267
    move-result v8

    .line 268
    goto :goto_3

    .line 269
    :cond_7
    const-string v8, "#432053"

    .line 270
    .line 271
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 272
    .line 273
    .line 274
    move-result v8

    .line 275
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 276
    .line 277
    .line 278
    move-result v12

    .line 279
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 280
    .line 281
    .line 282
    move-result v13

    .line 283
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    move-result v11

    .line 287
    move/from16 v16, v11

    .line 288
    .line 289
    move v11, v8

    .line 290
    move/from16 v8, v16

    .line 291
    .line 292
    goto :goto_3

    .line 293
    :pswitch_2
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 294
    .line 295
    .line 296
    move-result v11

    .line 297
    const-string v8, "#dfb43a"

    .line 298
    .line 299
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    move-result v12

    .line 303
    goto :goto_2

    .line 304
    :goto_3
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 305
    .line 306
    const/high16 v15, 0x41700000    # 15.0f

    .line 307
    .line 308
    invoke-static {v15}, Ll/qa00;->d(F)I

    .line 309
    .line 310
    .line 311
    move-result v15

    .line 312
    invoke-static {v14, v15}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 313
    .line 314
    .line 315
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 316
    .line 317
    const/high16 v15, 0x42000000    # 32.0f

    .line 318
    .line 319
    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTextSize(F)V

    .line 320
    .line 321
    .line 322
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 323
    .line 324
    invoke-virtual {v14, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 328
    .line 329
    .line 330
    move-result v13

    .line 331
    if-eqz v13, :cond_8

    .line 332
    .line 333
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 334
    .line 335
    invoke-static {v13, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 336
    .line 337
    .line 338
    move-result v13

    .line 339
    if-eqz v13, :cond_8

    .line 340
    .line 341
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 342
    .line 343
    invoke-virtual {v13}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 344
    .line 345
    .line 346
    move-result-object v14

    .line 347
    invoke-virtual {v13, v14, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 348
    .line 349
    .line 350
    goto :goto_4

    .line 351
    :cond_8
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 352
    .line 353
    invoke-virtual {v13}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 354
    .line 355
    .line 356
    move-result-object v14

    .line 357
    invoke-virtual {v13, v14, v9}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 358
    .line 359
    .line 360
    :goto_4
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d:Lv/VText;

    .line 361
    .line 362
    invoke-virtual {v13, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 363
    .line 364
    .line 365
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->e:Lv/VText_AutoFit;

    .line 366
    .line 367
    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 368
    .line 369
    .line 370
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 371
    .line 372
    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 373
    .line 374
    .line 375
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 376
    .line 377
    const/16 v12, 0x11

    .line 378
    .line 379
    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 380
    .line 381
    .line 382
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 383
    .line 384
    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 385
    .line 386
    .line 387
    goto/16 :goto_7

    .line 388
    .line 389
    :cond_9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 390
    .line 391
    .line 392
    move-result v11

    .line 393
    if-eqz v11, :cond_a

    .line 394
    .line 395
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 396
    .line 397
    invoke-static {v11, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 398
    .line 399
    .line 400
    move-result v11

    .line 401
    if-eqz v11, :cond_a

    .line 402
    .line 403
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 404
    .line 405
    .line 406
    move-result-object v11

    .line 407
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v11

    .line 411
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result v11

    .line 415
    if-eqz v11, :cond_a

    .line 416
    .line 417
    const-string v8, "#66000000"

    .line 418
    .line 419
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 420
    .line 421
    .line 422
    move-result v8

    .line 423
    goto :goto_5

    .line 424
    :cond_a
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 425
    .line 426
    .line 427
    move-result-object v11

    .line 428
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v11

    .line 432
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    move-result v11

    .line 436
    if-eqz v11, :cond_b

    .line 437
    .line 438
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 439
    .line 440
    .line 441
    move-result v8

    .line 442
    goto :goto_5

    .line 443
    :cond_b
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 444
    .line 445
    .line 446
    move-result-object v8

    .line 447
    sget v11, Ll/h9c0;->q:I

    .line 448
    .line 449
    invoke-virtual {v8, v11}, Landroid/content/res/Resources;->getColor(I)I

    .line 450
    .line 451
    .line 452
    move-result v8

    .line 453
    :goto_5
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 454
    .line 455
    .line 456
    move-result-object v11

    .line 457
    invoke-virtual {v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v11

    .line 461
    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result v11

    .line 465
    if-eqz v11, :cond_d

    .line 466
    .line 467
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 468
    .line 469
    invoke-static {v8, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 470
    .line 471
    .line 472
    move-result v8

    .line 473
    if-eqz v8, :cond_c

    .line 474
    .line 475
    const-string v8, "#663D2747"

    .line 476
    .line 477
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 478
    .line 479
    .line 480
    move-result v8

    .line 481
    goto :goto_6

    .line 482
    :cond_c
    const-string v8, "#66F9E7FF"

    .line 483
    .line 484
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 485
    .line 486
    .line 487
    move-result v8

    .line 488
    :cond_d
    :goto_6
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 489
    .line 490
    const/high16 v12, 0x41880000    # 17.0f

    .line 491
    .line 492
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 493
    .line 494
    .line 495
    move-result v12

    .line 496
    invoke-static {v11, v12}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 497
    .line 498
    .line 499
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 500
    .line 501
    const/high16 v12, 0x41f00000    # 30.0f

    .line 502
    .line 503
    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextSize(F)V

    .line 504
    .line 505
    .line 506
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 507
    .line 508
    invoke-virtual {v11}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 509
    .line 510
    .line 511
    move-result-object v12

    .line 512
    invoke-virtual {v11, v12, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 513
    .line 514
    .line 515
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 516
    .line 517
    invoke-virtual {v11, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 518
    .line 519
    .line 520
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d:Lv/VText;

    .line 521
    .line 522
    invoke-virtual {v11, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 523
    .line 524
    .line 525
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->e:Lv/VText_AutoFit;

    .line 526
    .line 527
    invoke-virtual {v11, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 528
    .line 529
    .line 530
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 531
    .line 532
    invoke-virtual {v11, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 533
    .line 534
    .line 535
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 536
    .line 537
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 538
    .line 539
    .line 540
    :goto_7
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 541
    .line 542
    .line 543
    move-result-object v8

    .line 544
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v8

    .line 548
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 549
    .line 550
    .line 551
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    .line 552
    .line 553
    .line 554
    move-result v11

    .line 555
    sparse-switch v11, :sswitch_data_1

    .line 556
    .line 557
    .line 558
    :goto_8
    move v1, v5

    .line 559
    goto :goto_9

    .line 560
    :sswitch_3
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    if-nez v1, :cond_e

    .line 565
    .line 566
    goto :goto_8

    .line 567
    :cond_e
    const/4 v1, 0x3

    .line 568
    goto :goto_9

    .line 569
    :sswitch_4
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    move-result v3

    .line 573
    if-nez v3, :cond_11

    .line 574
    .line 575
    goto :goto_8

    .line 576
    :sswitch_5
    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 577
    .line 578
    .line 579
    move-result v1

    .line 580
    if-nez v1, :cond_f

    .line 581
    .line 582
    goto :goto_8

    .line 583
    :cond_f
    move v1, v9

    .line 584
    goto :goto_9

    .line 585
    :sswitch_6
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result v1

    .line 589
    if-nez v1, :cond_10

    .line 590
    .line 591
    goto :goto_8

    .line 592
    :cond_10
    move v1, v2

    .line 593
    :cond_11
    :goto_9
    packed-switch v1, :pswitch_data_1

    .line 594
    .line 595
    .line 596
    move v1, v2

    .line 597
    move v3, v1

    .line 598
    goto :goto_b

    .line 599
    :pswitch_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 600
    .line 601
    .line 602
    move-result v1

    .line 603
    if-eqz v1, :cond_12

    .line 604
    .line 605
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 606
    .line 607
    invoke-static {v1, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 608
    .line 609
    .line 610
    move-result v1

    .line 611
    if-eqz v1, :cond_12

    .line 612
    .line 613
    sget v2, Ll/jbc0;->b2:I

    .line 614
    .line 615
    sget v1, Ll/jbc0;->J1:I

    .line 616
    .line 617
    sget v3, Ll/jbc0;->R1:I

    .line 618
    .line 619
    :goto_a
    move/from16 v16, v2

    .line 620
    .line 621
    move v2, v1

    .line 622
    move/from16 v1, v16

    .line 623
    .line 624
    goto :goto_b

    .line 625
    :cond_12
    sget v2, Ll/jbc0;->a2:I

    .line 626
    .line 627
    sget v1, Ll/jbc0;->I1:I

    .line 628
    .line 629
    sget v3, Ll/jbc0;->Q1:I

    .line 630
    .line 631
    goto :goto_a

    .line 632
    :pswitch_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 633
    .line 634
    .line 635
    move-result v1

    .line 636
    if-eqz v1, :cond_13

    .line 637
    .line 638
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 639
    .line 640
    invoke-static {v1, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 641
    .line 642
    .line 643
    move-result v1

    .line 644
    if-eqz v1, :cond_13

    .line 645
    .line 646
    sget v2, Ll/jbc0;->d2:I

    .line 647
    .line 648
    sget v1, Ll/jbc0;->L1:I

    .line 649
    .line 650
    sget v3, Ll/jbc0;->T1:I

    .line 651
    .line 652
    goto :goto_a

    .line 653
    :cond_13
    sget v2, Ll/jbc0;->c2:I

    .line 654
    .line 655
    sget v1, Ll/jbc0;->K1:I

    .line 656
    .line 657
    sget v3, Ll/jbc0;->S1:I

    .line 658
    .line 659
    goto :goto_a

    .line 660
    :pswitch_5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 661
    .line 662
    invoke-static {v1, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 663
    .line 664
    .line 665
    move-result v1

    .line 666
    if-eqz v1, :cond_14

    .line 667
    .line 668
    sget v2, Ll/jbc0;->f2:I

    .line 669
    .line 670
    sget v1, Ll/jbc0;->N1:I

    .line 671
    .line 672
    sget v3, Ll/jbc0;->W1:I

    .line 673
    .line 674
    goto :goto_a

    .line 675
    :cond_14
    sget v2, Ll/jbc0;->e2:I

    .line 676
    .line 677
    sget v1, Ll/jbc0;->M1:I

    .line 678
    .line 679
    sget v3, Ll/jbc0;->V1:I

    .line 680
    .line 681
    goto :goto_a

    .line 682
    :pswitch_6
    sget v2, Ll/jbc0;->g2:I

    .line 683
    .line 684
    sget v1, Ll/jbc0;->O1:I

    .line 685
    .line 686
    sget v3, Ll/jbc0;->X1:I

    .line 687
    .line 688
    goto :goto_a

    .line 689
    :goto_b
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 690
    .line 691
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 692
    .line 693
    .line 694
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 695
    .line 696
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 697
    .line 698
    .line 699
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 700
    .line 701
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 702
    .line 703
    .line 704
    move-result-object v2

    .line 705
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 706
    .line 707
    .line 708
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 709
    .line 710
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 711
    .line 712
    .line 713
    move-result v2

    .line 714
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 715
    .line 716
    .line 717
    move-result-object v2

    .line 718
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 719
    .line 720
    .line 721
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d:Lv/VText;

    .line 722
    .line 723
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 724
    .line 725
    .line 726
    move-result-object v2

    .line 727
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 728
    .line 729
    .line 730
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->e:Lv/VText_AutoFit;

    .line 731
    .line 732
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 733
    .line 734
    .line 735
    move-result-object v2

    .line 736
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 737
    .line 738
    .line 739
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 740
    .line 741
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 742
    .line 743
    .line 744
    move-result-object v2

    .line 745
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 746
    .line 747
    .line 748
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->f:Landroid/view/View;

    .line 749
    .line 750
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 751
    .line 752
    .line 753
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 754
    .line 755
    .line 756
    move-result v1

    .line 757
    if-eqz v1, :cond_16

    .line 758
    .line 759
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->a:Ljava/lang/String;

    .line 760
    .line 761
    invoke-static {v1, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 762
    .line 763
    .line 764
    move-result v1

    .line 765
    if-eqz v1, :cond_16

    .line 766
    .line 767
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 768
    .line 769
    if-eqz p1, :cond_15

    .line 770
    .line 771
    sget v1, Ll/qa00;->h:I

    .line 772
    .line 773
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 774
    .line 775
    .line 776
    return-void

    .line 777
    :cond_15
    const/high16 v1, 0x41300000    # 11.0f

    .line 778
    .line 779
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 780
    .line 781
    .line 782
    move-result v1

    .line 783
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 784
    .line 785
    .line 786
    :cond_16
    return-void

    .line 787
    :sswitch_data_0
    .sparse-switch
        -0x33752677 -> :sswitch_2
        -0x19ee22e1 -> :sswitch_1
        0x1ace97a6 -> :sswitch_0
    .end sparse-switch

    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    :sswitch_data_1
    .sparse-switch
        -0x33752677 -> :sswitch_6
        -0x19ee22e1 -> :sswitch_5
        0xd13ae6b -> :sswitch_4
        0x1ace97a6 -> :sswitch_3
    .end sparse-switch

    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ll40;->a(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qq()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getAnimBackgroundList()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->h:Lv/VText;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->f:Landroid/view/View;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    new-array v2, v2, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    aput-object v0, v2, v3

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v2, v0

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    aput-object p0, v2, v0

    .line 18
    .line 19
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->setFrom(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "form_sub"

    .line 11
    .line 12
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->e:Lv/VText_AutoFit;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0, v1}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d:Lv/VText;

    .line 44
    .line 45
    const/high16 v0, 0x41500000    # 13.0f

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->e:Lv/VText_AutoFit;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->f:Landroid/view/View;

    .line 56
    .line 57
    const/high16 v0, 0x421c0000    # 39.0f

    .line 58
    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {p1, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->g:Lv/VText_AutoFit;

    .line 67
    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->c:Lv/VText;

    .line 76
    .line 77
    const/high16 v0, 0x41980000    # 19.0f

    .line 78
    .line 79
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;->d:Lv/VText;

    .line 87
    .line 88
    const/high16 v0, 0x40400000    # 3.0f

    .line 89
    .line 90
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

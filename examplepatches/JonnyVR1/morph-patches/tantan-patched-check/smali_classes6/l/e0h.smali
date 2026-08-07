.class public Ll/e0h;
.super Landroid/widget/PopupWindow;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lv/VImage;Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ll/y20;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VImage;",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/FeedSelectParams;",
            ">;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    const/4 v4, -0x2

    .line 10
    invoke-direct {v0, v4, v4}, Landroid/widget/PopupWindow;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    const/4 v5, 0x1

    .line 18
    invoke-interface {v4, v1, v5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mm(Lv/VImage;Z)V

    .line 19
    .line 20
    .line 21
    invoke-static/range {p2 .. p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    sget v6, Ll/tec0;->e3:I

    .line 26
    .line 27
    const/4 v7, 0x0

    .line 28
    invoke-virtual {v4, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    sget v6, Ll/hdc0;->B1:I

    .line 36
    .line 37
    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    check-cast v6, Landroid/widget/FrameLayout;

    .line 42
    .line 43
    sget v8, Ll/hdc0;->V:I

    .line 44
    .line 45
    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    check-cast v8, Landroid/widget/FrameLayout;

    .line 50
    .line 51
    sget v9, Ll/hdc0;->z:I

    .line 52
    .line 53
    invoke-virtual {v4, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Landroid/widget/LinearLayout;

    .line 58
    .line 59
    new-instance v9, Ll/b0h;

    .line 60
    .line 61
    invoke-direct {v9, v0}, Ll/b0h;-><init>(Ll/e0h;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v8, v9}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ll/e0h;->d(Ljava/util/List;)I

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    const/4 v10, 0x0

    .line 72
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v11

    .line 76
    if-ge v10, v11, :cond_4

    .line 77
    .line 78
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    check-cast v11, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 83
    .line 84
    iget-object v11, v11, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->name:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static/range {p2 .. p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 87
    .line 88
    .line 89
    move-result-object v12

    .line 90
    sget v13, Ll/tec0;->d3:I

    .line 91
    .line 92
    invoke-virtual {v12, v13, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v12

    .line 96
    sget v13, Ll/hdc0;->T0:I

    .line 97
    .line 98
    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v13

    .line 102
    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 103
    .line 104
    sget v14, Ll/hdc0;->U0:I

    .line 105
    .line 106
    invoke-virtual {v12, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v14

    .line 110
    check-cast v14, Lv/VText;

    .line 111
    .line 112
    sget v15, Ll/hdc0;->S0:I

    .line 113
    .line 114
    invoke-virtual {v12, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v15

    .line 118
    check-cast v15, Lv/VImage;

    .line 119
    .line 120
    sget v7, Ll/hdc0;->t0:I

    .line 121
    .line 122
    invoke-virtual {v12, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    check-cast v7, Landroid/widget/FrameLayout;

    .line 127
    .line 128
    if-ne v8, v10, :cond_2

    .line 129
    .line 130
    invoke-virtual {v14}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    invoke-virtual {v7, v11}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 135
    .line 136
    .line 137
    move-result v7

    .line 138
    const/high16 v16, 0x42e00000    # 112.0f

    .line 139
    .line 140
    const/16 v17, 0x0

    .line 141
    .line 142
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    int-to-float v9, v9

    .line 147
    cmpl-float v9, v7, v9

    .line 148
    .line 149
    if-lez v9, :cond_0

    .line 150
    .line 151
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 152
    .line 153
    .line 154
    move-result v7

    .line 155
    int-to-float v7, v7

    .line 156
    :cond_0
    const/high16 v9, 0x43210000    # 161.0f

    .line 157
    .line 158
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result v9

    .line 162
    const/high16 v16, 0x41a00000    # 20.0f

    .line 163
    .line 164
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    int-to-float v5, v5

    .line 169
    add-float/2addr v5, v7

    .line 170
    const/high16 v16, 0x41400000    # 12.0f

    .line 171
    .line 172
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result v7

    .line 176
    int-to-float v7, v7

    .line 177
    add-float/2addr v5, v7

    .line 178
    const/high16 v7, 0x41800000    # 16.0f

    .line 179
    .line 180
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    int-to-float v7, v7

    .line 185
    add-float/2addr v5, v7

    .line 186
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 187
    .line 188
    .line 189
    move-result v7

    .line 190
    int-to-float v7, v7

    .line 191
    add-float/2addr v5, v7

    .line 192
    float-to-int v5, v5

    .line 193
    if-le v9, v5, :cond_1

    .line 194
    .line 195
    invoke-virtual {v6}, Landroid/view/View;->getPaddingRight()I

    .line 196
    .line 197
    .line 198
    move-result v7

    .line 199
    const/high16 v9, 0x41200000    # 10.0f

    .line 200
    .line 201
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 202
    .line 203
    .line 204
    move-result v16

    .line 205
    add-int v7, v7, v16

    .line 206
    .line 207
    invoke-static {v6, v7}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 208
    .line 209
    .line 210
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 211
    .line 212
    .line 213
    move-result v7

    .line 214
    add-int/2addr v5, v7

    .line 215
    :cond_1
    const/4 v7, 0x1

    .line 216
    new-array v9, v7, [Landroid/view/View;

    .line 217
    .line 218
    aput-object v6, v9, v17

    .line 219
    .line 220
    invoke-static {v5, v9}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_2
    const/16 v17, 0x0

    .line 225
    .line 226
    :goto_1
    invoke-virtual {v14}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v7

    .line 234
    check-cast v7, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 235
    .line 236
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->param:Ljava/lang/String;

    .line 237
    .line 238
    invoke-static {v3, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 239
    .line 240
    .line 241
    move-result v7

    .line 242
    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v14, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    check-cast v5, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 253
    .line 254
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->param:Ljava/lang/String;

    .line 255
    .line 256
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 257
    .line 258
    .line 259
    move-result v5

    .line 260
    if-eqz v5, :cond_3

    .line 261
    .line 262
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    sget v7, Ll/k9c0;->n:I

    .line 267
    .line 268
    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    goto :goto_2

    .line 273
    :cond_3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 274
    .line 275
    .line 276
    move-result-object v5

    .line 277
    sget v7, Ll/k9c0;->e:I

    .line 278
    .line 279
    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 280
    .line 281
    .line 282
    move-result v5

    .line 283
    :goto_2
    invoke-virtual {v14, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 284
    .line 285
    .line 286
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    check-cast v5, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 291
    .line 292
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->param:Ljava/lang/String;

    .line 293
    .line 294
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 295
    .line 296
    .line 297
    move-result v5

    .line 298
    invoke-static {v15, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 299
    .line 300
    .line 301
    new-instance v5, Ll/c0h;

    .line 302
    .line 303
    move-object/from16 v7, p5

    .line 304
    .line 305
    invoke-direct {v5, v0, v2, v10, v7}, Ll/c0h;-><init>(Ll/e0h;Ljava/util/List;ILl/y20;)V

    .line 306
    .line 307
    .line 308
    invoke-static {v13, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v4, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 312
    .line 313
    .line 314
    add-int/lit8 v10, v10, 0x1

    .line 315
    .line 316
    const/4 v5, 0x1

    .line 317
    const/4 v7, 0x0

    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_4
    new-instance v2, Ll/d0h;

    .line 321
    .line 322
    invoke-direct {v2, v1}, Ll/d0h;-><init>(Lv/VImage;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 326
    .line 327
    .line 328
    const/4 v7, 0x1

    .line 329
    invoke-virtual {v0, v7}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0, v7}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0, v7}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 336
    .line 337
    .line 338
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    sget v2, Ll/lbc0;->I6:I

    .line 343
    .line 344
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 349
    .line 350
    .line 351
    return-void
.end method

.method public static synthetic a(Ll/e0h;Ljava/util/List;ILl/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/e0h;->g(Ljava/util/List;ILl/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/e0h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e0h;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lv/VImage;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->mm(Lv/VImage;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public d(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/FeedSelectParams;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-ge p0, v2, :cond_1

    .line 9
    .line 10
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->name:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-le v3, v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    move v1, v0

    .line 29
    move v0, p0

    .line 30
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return v0
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_discover_dating"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g(Ljava/util/List;ILl/y20;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/e0h;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->param:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "selectchoice"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_select"

    .line 24
    .line 25
    invoke-static {v1, p4, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedSelectParams;->param:Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

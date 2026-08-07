.class public Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Ljava/text/NumberFormat;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    .line 9
    .line 10
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

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 14
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 16
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    return-void
.end method

.method public static synthetic a(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/emp;->a(Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/purchase/d;ILl/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Z)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    sget v2, Ll/jbc0;->D2:I

    .line 19
    .line 20
    sget-object v3, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView$a;->a:[I

    .line 21
    .line 22
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Enum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    aget v4, v3, v4

    .line 27
    .line 28
    const/4 v5, 0x2

    .line 29
    const/4 v6, 0x1

    .line 30
    if-eq v4, v6, :cond_5

    .line 31
    .line 32
    if-eq v4, v5, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    if-eqz p5, :cond_3

    .line 36
    .line 37
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    sget v2, Ll/jbc0;->M2:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    sget v2, Ll/jbc0;->N2:I

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    sget v2, Ll/jbc0;->K2:I

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    sget v2, Ll/jbc0;->L2:I

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_5
    if-eqz p5, :cond_7

    .line 62
    .line 63
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_6

    .line 68
    .line 69
    sget v2, Ll/jbc0;->F2:I

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_6
    sget v2, Ll/jbc0;->G2:I

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_8

    .line 80
    .line 81
    sget v2, Ll/jbc0;->D2:I

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_8
    sget v2, Ll/jbc0;->E2:I

    .line 85
    .line 86
    :goto_1
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 87
    .line 88
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 89
    .line 90
    .line 91
    const-string v2, "#F9E7FF"

    .line 92
    .line 93
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    const-string v8, "#4DF9E7FF"

    .line 102
    .line 103
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    const-string v10, "#000000"

    .line 108
    .line 109
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v11

    .line 113
    sget v12, Ll/jbc0;->z:I

    .line 114
    .line 115
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 116
    .line 117
    .line 118
    move-result v13

    .line 119
    const-string v14, "#4DFFE7AA"

    .line 120
    .line 121
    const-string v15, "#4D000000"

    .line 122
    .line 123
    const-string v16, "#3D2747"

    .line 124
    .line 125
    if-eqz v13, :cond_d

    .line 126
    .line 127
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Enum;->ordinal()I

    .line 128
    .line 129
    .line 130
    move-result v13

    .line 131
    aget v3, v3, v13

    .line 132
    .line 133
    if-eq v3, v6, :cond_b

    .line 134
    .line 135
    if-eq v3, v5, :cond_9

    .line 136
    .line 137
    goto/16 :goto_2

    .line 138
    .line 139
    :cond_9
    if-eqz p5, :cond_a

    .line 140
    .line 141
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v7

    .line 149
    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v9

    .line 153
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result v11

    .line 157
    sget v12, Ll/jbc0;->F:I

    .line 158
    .line 159
    goto/16 :goto_2

    .line 160
    .line 161
    :cond_a
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result v9

    .line 173
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v11

    .line 177
    sget v12, Ll/jbc0;->H:I

    .line 178
    .line 179
    goto/16 :goto_2

    .line 180
    .line 181
    :cond_b
    if-eqz p5, :cond_c

    .line 182
    .line 183
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v9

    .line 195
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v11

    .line 199
    sget v12, Ll/jbc0;->B:I

    .line 200
    .line 201
    goto/16 :goto_2

    .line 202
    .line 203
    :cond_c
    const-string v2, "#FFE7AA"

    .line 204
    .line 205
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    move-result v9

    .line 213
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v11

    .line 221
    sget v12, Ll/jbc0;->D:I

    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_d
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Enum;->ordinal()I

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    aget v2, v3, v2

    .line 229
    .line 230
    if-eq v2, v6, :cond_10

    .line 231
    .line 232
    if-eq v2, v5, :cond_e

    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_e
    if-eqz p5, :cond_f

    .line 236
    .line 237
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v4

    .line 241
    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    move-result v7

    .line 245
    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    move-result v9

    .line 249
    const-string v2, "#663D2747"

    .line 250
    .line 251
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 252
    .line 253
    .line 254
    move-result v11

    .line 255
    sget v12, Ll/jbc0;->G:I

    .line 256
    .line 257
    goto :goto_2

    .line 258
    :cond_f
    const-string v2, "#80F9E7FF"

    .line 259
    .line 260
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 265
    .line 266
    .line 267
    move-result v9

    .line 268
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 269
    .line 270
    .line 271
    move-result v7

    .line 272
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    move-result v11

    .line 276
    sget v12, Ll/jbc0;->I:I

    .line 277
    .line 278
    goto :goto_2

    .line 279
    :cond_10
    if-eqz p5, :cond_11

    .line 280
    .line 281
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 282
    .line 283
    .line 284
    move-result v4

    .line 285
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    move-result v7

    .line 289
    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    move-result v9

    .line 293
    const-string v2, "#66000000"

    .line 294
    .line 295
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    move-result v11

    .line 299
    sget v12, Ll/jbc0;->C:I

    .line 300
    .line 301
    goto :goto_2

    .line 302
    :cond_11
    const-string v2, "#80FFE7AA"

    .line 303
    .line 304
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 309
    .line 310
    .line 311
    move-result v9

    .line 312
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 313
    .line 314
    .line 315
    move-result v7

    .line 316
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 317
    .line 318
    .line 319
    move-result v11

    .line 320
    sget v12, Ll/jbc0;->E:I

    .line 321
    .line 322
    :goto_2
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->c:Lv/VText;

    .line 323
    .line 324
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 325
    .line 326
    .line 327
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->b:Lv/VText;

    .line 328
    .line 329
    invoke-virtual {v2, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 330
    .line 331
    .line 332
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->d:Lv/VText;

    .line 333
    .line 334
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 335
    .line 336
    .line 337
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->e:Lv/VText;

    .line 338
    .line 339
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 340
    .line 341
    .line 342
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->b:Lv/VText;

    .line 343
    .line 344
    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 345
    .line 346
    .line 347
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->c:Lv/VText;

    .line 348
    .line 349
    const/4 v3, 0x3

    .line 350
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 351
    .line 352
    .line 353
    move-result-object v3

    .line 354
    const/4 v4, 0x0

    .line 355
    invoke-virtual {v2, v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 356
    .line 357
    .line 358
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->d:Lv/VText;

    .line 359
    .line 360
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v3

    .line 364
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    .line 366
    .line 367
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->c:Lv/VText;

    .line 368
    .line 369
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 370
    .line 371
    .line 372
    move-result v3

    .line 373
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 374
    .line 375
    .line 376
    move-result-object v3

    .line 377
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v7

    .line 381
    filled-new-array {v3, v7}, [Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    const-string v7, "%d %s"

    .line 386
    .line 387
    invoke-static {v7, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 392
    .line 393
    .line 394
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    .line 395
    .line 396
    invoke-virtual {v2, v5}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v2

    .line 403
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 404
    .line 405
    .line 406
    move-result-wide v2

    .line 407
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 408
    .line 409
    .line 410
    move-result v5

    .line 411
    int-to-double v7, v5

    .line 412
    mul-double/2addr v2, v7

    .line 413
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->e:Lv/VText;

    .line 414
    .line 415
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v7

    .line 419
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    .line 420
    .line 421
    invoke-virtual {v8, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v8

    .line 425
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object v7

    .line 429
    const-string v8, "%s %s"

    .line 430
    .line 431
    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v7

    .line 435
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 436
    .line 437
    .line 438
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->e:Lv/VText;

    .line 439
    .line 440
    invoke-virtual {v5}, Landroid/widget/TextView;->getPaintFlags()I

    .line 441
    .line 442
    .line 443
    move-result v7

    .line 444
    or-int/lit8 v7, v7, 0x10

    .line 445
    .line 446
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 447
    .line 448
    .line 449
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->t()D

    .line 450
    .line 451
    .line 452
    move-result-wide v7

    .line 453
    sub-double/2addr v2, v7

    .line 454
    new-instance v5, Ljava/lang/StringBuilder;

    .line 455
    .line 456
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->f:Ljava/text/NumberFormat;

    .line 467
    .line 468
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object v1

    .line 472
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->b:Lv/VText;

    .line 480
    .line 481
    const-wide/16 v7, 0x0

    .line 482
    .line 483
    cmpl-double v2, v2, v7

    .line 484
    .line 485
    if-lez v2, :cond_12

    .line 486
    .line 487
    goto :goto_3

    .line 488
    :cond_12
    move v6, v4

    .line 489
    :goto_3
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 490
    .line 491
    .line 492
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->b:Lv/VText;

    .line 493
    .line 494
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 495
    .line 496
    .line 497
    move-result-object v3

    .line 498
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->f6:I

    .line 499
    .line 500
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v3

    .line 504
    const-string v4, " "

    .line 505
    .line 506
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v1

    .line 510
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 519
    .line 520
    .line 521
    new-instance v1, Ll/dmp;

    .line 522
    .line 523
    move-object/from16 v2, p1

    .line 524
    .line 525
    move-object/from16 v3, p3

    .line 526
    .line 527
    invoke-direct {v1, v3, v2}, Ll/dmp;-><init>(Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 531
    .line 532
    .line 533
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/intlUpgrade/IntlUpgradePurchaseSheetItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

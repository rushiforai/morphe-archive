.class public Lv/VMenuBar;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Landroidx/constraintlayout/widget/ConstraintLayout;"
    }
.end annotation


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VIcon;

.field public h:Lv/VIcon;

.field public i:Lv/VIcon;

.field public j:Lv/VLine;

.field public k:Landroid/view/ViewStub;

.field public l:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lv/VMenuBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lv/VMenuBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lv/VMenuBar;->h0(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private h0(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/gec0;->o:I

    .line 8
    .line 9
    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    sget v1, Ll/abc0;->w:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    sget v1, Ll/vcc0;->d0:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lv/VText;

    .line 24
    .line 25
    iput-object v1, v0, Lv/VMenuBar;->d:Lv/VText;

    .line 26
    .line 27
    sget v1, Ll/vcc0;->G0:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lv/VText;

    .line 34
    .line 35
    iput-object v1, v0, Lv/VMenuBar;->e:Lv/VText;

    .line 36
    .line 37
    sget v1, Ll/vcc0;->r:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lv/VText;

    .line 44
    .line 45
    iput-object v1, v0, Lv/VMenuBar;->f:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const/4 v3, 0x1

    .line 52
    invoke-virtual {v1, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 53
    .line 54
    .line 55
    sget v1, Ll/vcc0;->b0:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lv/VIcon;

    .line 62
    .line 63
    iput-object v1, v0, Lv/VMenuBar;->g:Lv/VIcon;

    .line 64
    .line 65
    sget v1, Ll/vcc0;->E0:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Lv/VIcon;

    .line 72
    .line 73
    iput-object v1, v0, Lv/VMenuBar;->h:Lv/VIcon;

    .line 74
    .line 75
    sget v1, Ll/vcc0;->q:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lv/VIcon;

    .line 82
    .line 83
    iput-object v1, v0, Lv/VMenuBar;->i:Lv/VIcon;

    .line 84
    .line 85
    sget v1, Ll/vcc0;->j:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Lv/VLine;

    .line 92
    .line 93
    iput-object v1, v0, Lv/VMenuBar;->j:Lv/VLine;

    .line 94
    .line 95
    sget v1, Ll/vcc0;->s:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Landroid/view/ViewStub;

    .line 102
    .line 103
    iput-object v1, v0, Lv/VMenuBar;->k:Landroid/view/ViewStub;

    .line 104
    .line 105
    sget-object v1, Ll/hhc0;->y0:[I

    .line 106
    .line 107
    move-object/from16 v2, p1

    .line 108
    .line 109
    move-object/from16 v4, p2

    .line 110
    .line 111
    invoke-virtual {v2, v4, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sget v2, Ll/hhc0;->G0:I

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    sget v4, Ll/hhc0;->I0:I

    .line 122
    .line 123
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    sget v5, Ll/hhc0;->E0:I

    .line 128
    .line 129
    invoke-virtual {v1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    sget v6, Ll/hhc0;->C0:I

    .line 134
    .line 135
    const/4 v7, -0x1

    .line 136
    invoke-virtual {v1, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    sget v8, Ll/hhc0;->D0:I

    .line 141
    .line 142
    invoke-virtual {v1, v8, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    sget v9, Ll/hhc0;->B0:I

    .line 147
    .line 148
    invoke-virtual {v1, v9, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    sget v10, Ll/hhc0;->z0:I

    .line 153
    .line 154
    invoke-virtual {v1, v10, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    sget v10, Ll/hhc0;->A0:I

    .line 159
    .line 160
    invoke-virtual {v1, v10, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    sget v11, Ll/hhc0;->H0:I

    .line 165
    .line 166
    invoke-virtual {v1, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 167
    .line 168
    .line 169
    move-result-object v11

    .line 170
    sget v12, Ll/hhc0;->J0:I

    .line 171
    .line 172
    invoke-virtual {v1, v12}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 173
    .line 174
    .line 175
    move-result-object v12

    .line 176
    sget v13, Ll/hhc0;->F0:I

    .line 177
    .line 178
    invoke-virtual {v1, v13}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 179
    .line 180
    .line 181
    move-result-object v13

    .line 182
    sget v14, Ll/hhc0;->H0:I

    .line 183
    .line 184
    const v15, 0x7fffffff

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1, v14, v15}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 188
    .line 189
    .line 190
    move-result v14

    .line 191
    sget v7, Ll/hhc0;->J0:I

    .line 192
    .line 193
    invoke-virtual {v1, v7, v15}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    move/from16 p2, v3

    .line 198
    .line 199
    sget v3, Ll/hhc0;->F0:I

    .line 200
    .line 201
    invoke-virtual {v1, v3, v15}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 206
    .line 207
    .line 208
    iget-object v1, v0, Lv/VMenuBar;->d:Lv/VText;

    .line 209
    .line 210
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    .line 212
    .line 213
    if-eq v14, v15, :cond_0

    .line 214
    .line 215
    iget-object v1, v0, Lv/VMenuBar;->d:Lv/VText;

    .line 216
    .line 217
    invoke-virtual {v1, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 218
    .line 219
    .line 220
    :cond_0
    if-eqz v11, :cond_1

    .line 221
    .line 222
    iget-object v1, v0, Lv/VMenuBar;->d:Lv/VText;

    .line 223
    .line 224
    invoke-virtual {v1, v11}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 225
    .line 226
    .line 227
    :cond_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    iget-object v2, v0, Lv/VMenuBar;->d:Lv/VText;

    .line 232
    .line 233
    const/4 v11, 0x0

    .line 234
    const/16 v14, 0x8

    .line 235
    .line 236
    if-eqz v1, :cond_2

    .line 237
    .line 238
    invoke-virtual {v2, v14}, Landroid/view/View;->setVisibility(I)V

    .line 239
    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_2
    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    .line 243
    .line 244
    .line 245
    :goto_0
    iget-object v1, v0, Lv/VMenuBar;->e:Lv/VText;

    .line 246
    .line 247
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 248
    .line 249
    .line 250
    if-eq v7, v15, :cond_3

    .line 251
    .line 252
    iget-object v1, v0, Lv/VMenuBar;->e:Lv/VText;

    .line 253
    .line 254
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 255
    .line 256
    .line 257
    :cond_3
    if-eqz v12, :cond_4

    .line 258
    .line 259
    iget-object v1, v0, Lv/VMenuBar;->e:Lv/VText;

    .line 260
    .line 261
    invoke-virtual {v1, v12}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 262
    .line 263
    .line 264
    :cond_4
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    iget-object v2, v0, Lv/VMenuBar;->e:Lv/VText;

    .line 269
    .line 270
    if-eqz v1, :cond_5

    .line 271
    .line 272
    invoke-virtual {v2, v14}, Landroid/view/View;->setVisibility(I)V

    .line 273
    .line 274
    .line 275
    goto :goto_1

    .line 276
    :cond_5
    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    .line 277
    .line 278
    .line 279
    :goto_1
    iget-object v1, v0, Lv/VMenuBar;->f:Lv/VText;

    .line 280
    .line 281
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    .line 283
    .line 284
    if-eq v3, v15, :cond_6

    .line 285
    .line 286
    iget-object v1, v0, Lv/VMenuBar;->f:Lv/VText;

    .line 287
    .line 288
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 289
    .line 290
    .line 291
    :cond_6
    if-eqz v13, :cond_7

    .line 292
    .line 293
    iget-object v1, v0, Lv/VMenuBar;->f:Lv/VText;

    .line 294
    .line 295
    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 296
    .line 297
    .line 298
    :cond_7
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    iget-object v2, v0, Lv/VMenuBar;->f:Lv/VText;

    .line 303
    .line 304
    if-eqz v1, :cond_8

    .line 305
    .line 306
    invoke-virtual {v2, v14}, Landroid/view/View;->setVisibility(I)V

    .line 307
    .line 308
    .line 309
    goto :goto_2

    .line 310
    :cond_8
    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    .line 311
    .line 312
    .line 313
    :goto_2
    iget-object v1, v0, Lv/VMenuBar;->g:Lv/VIcon;

    .line 314
    .line 315
    const/4 v2, -0x1

    .line 316
    if-eq v6, v2, :cond_9

    .line 317
    .line 318
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 319
    .line 320
    .line 321
    iget-object v1, v0, Lv/VMenuBar;->g:Lv/VIcon;

    .line 322
    .line 323
    invoke-virtual {v1, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 324
    .line 325
    .line 326
    goto :goto_3

    .line 327
    :cond_9
    invoke-virtual {v1, v14}, Landroid/view/View;->setVisibility(I)V

    .line 328
    .line 329
    .line 330
    :goto_3
    iget-object v1, v0, Lv/VMenuBar;->h:Lv/VIcon;

    .line 331
    .line 332
    if-eq v8, v2, :cond_a

    .line 333
    .line 334
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 335
    .line 336
    .line 337
    iget-object v1, v0, Lv/VMenuBar;->h:Lv/VIcon;

    .line 338
    .line 339
    invoke-virtual {v1, v8}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 340
    .line 341
    .line 342
    goto :goto_4

    .line 343
    :cond_a
    invoke-virtual {v1, v14}, Landroid/view/View;->setVisibility(I)V

    .line 344
    .line 345
    .line 346
    :goto_4
    iget-object v1, v0, Lv/VMenuBar;->i:Lv/VIcon;

    .line 347
    .line 348
    if-eq v9, v2, :cond_b

    .line 349
    .line 350
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 351
    .line 352
    .line 353
    iget-object v1, v0, Lv/VMenuBar;->i:Lv/VIcon;

    .line 354
    .line 355
    invoke-virtual {v1, v9}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 356
    .line 357
    .line 358
    goto :goto_5

    .line 359
    :cond_b
    invoke-virtual {v1, v14}, Landroid/view/View;->setVisibility(I)V

    .line 360
    .line 361
    .line 362
    :goto_5
    iget-object v1, v0, Lv/VMenuBar;->j:Lv/VLine;

    .line 363
    .line 364
    if-eqz p2, :cond_c

    .line 365
    .line 366
    goto :goto_6

    .line 367
    :cond_c
    move v11, v14

    .line 368
    :goto_6
    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    .line 369
    .line 370
    .line 371
    const/4 v2, -0x1

    .line 372
    if-eq v10, v2, :cond_d

    .line 373
    .line 374
    iget-object v1, v0, Lv/VMenuBar;->k:Landroid/view/ViewStub;

    .line 375
    .line 376
    invoke-virtual {v1, v10}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 377
    .line 378
    .line 379
    iget-object v1, v0, Lv/VMenuBar;->k:Landroid/view/ViewStub;

    .line 380
    .line 381
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    iput-object v1, v0, Lv/VMenuBar;->l:Landroid/view/View;

    .line 386
    .line 387
    :cond_d
    return-void
.end method


# virtual methods
.method public getCenterCustomView()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lv/VMenuBar;->l:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VMenuBar;->j:Lv/VLine;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/16 p1, 0x8

    .line 8
    .line 9
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    const/high16 p2, 0x42780000    # 62.0f

    .line 2
    .line 3
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/high16 v0, 0x40000000    # 2.0f

    .line 8
    .line 9
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setCenterCustomLayoutRes(I)V
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lv/VMenuBar;->k:Landroid/view/ViewStub;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lv/VMenuBar;->k:Landroid/view/ViewStub;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lv/VMenuBar;->l:Landroid/view/View;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setCenterCustomView(Landroid/view/View;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(TV;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Landroidx/constraintlayout/widget/Constraints$a;

    .line 4
    .line 5
    const/4 v1, -0x2

    .line 6
    invoke-direct {v0, v1, v1}, Landroidx/constraintlayout/widget/Constraints$a;-><init>(II)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k:I

    .line 11
    .line 12
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->q:I

    .line 13
    .line 14
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 15
    .line 16
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->s:I

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lv/VMenuBar;->l:Landroid/view/View;

    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public setCenterImage(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/VMenuBar;->i:Lv/VIcon;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq p1, v1, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lv/VMenuBar;->i:Lv/VIcon;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/16 p0, 0x8

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setCenterRegionClick(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VMenuBar;->i:Lv/VIcon;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lv/VMenuBar;->f:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setCenterTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lv/VMenuBar;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCenterTextView(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VMenuBar;->f:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lv/VMenuBar;->f:Lv/VText;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public setCenterTextView(Ljava/lang/CharSequence;)V
    .locals 1

    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 28
    iget-object v0, p0, Lv/VMenuBar;->f:Lv/VText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    iget-object p0, p0, Lv/VMenuBar;->f:Lv/VText;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public setLeftImage(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/VMenuBar;->g:Lv/VIcon;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq p1, v1, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lv/VMenuBar;->g:Lv/VIcon;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/16 p0, 0x8

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setLeftRegionClick(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VMenuBar;->g:Lv/VIcon;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lv/VMenuBar;->d:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setLeftTextView(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VMenuBar;->d:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lv/VMenuBar;->d:Lv/VText;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public setLeftTextView(Ljava/lang/CharSequence;)V
    .locals 1

    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 28
    iget-object v0, p0, Lv/VMenuBar;->d:Lv/VText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    iget-object p0, p0, Lv/VMenuBar;->d:Lv/VText;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public setRightImage(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/VMenuBar;->h:Lv/VIcon;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq p1, v1, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lv/VMenuBar;->h:Lv/VIcon;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/16 p0, 0x8

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setRightRegionClick(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VMenuBar;->h:Lv/VIcon;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lv/VMenuBar;->e:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setRightTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lv/VMenuBar;->e:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRightTextMarginEnd(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VMenuBar;->e:Lv/VText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRightTextSize(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VMenuBar;->e:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRightTextView(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lv/VMenuBar;->e:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lv/VMenuBar;->e:Lv/VText;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public setRightTextView(Ljava/lang/CharSequence;)V
    .locals 1

    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 28
    iget-object v0, p0, Lv/VMenuBar;->e:Lv/VText;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    iget-object p0, p0, Lv/VMenuBar;->e:Lv/VText;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

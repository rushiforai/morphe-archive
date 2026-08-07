.class public Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public final d:[I

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:F

.field public h:Landroid/animation/ValueAnimator;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    filled-new-array {p1, p2, v0, v1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 25
    .line 26
    new-instance p1, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->l0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->n0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->o0(Z)V

    return-void
.end method

.method private setSize(Z)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x6

    .line 8
    const/4 v2, 0x7

    .line 9
    const/4 v3, 0x4

    .line 10
    const/4 v4, 0x3

    .line 11
    const/4 v5, 0x0

    .line 12
    const/4 v6, 0x1

    .line 13
    if-ne v0, v6, :cond_0

    .line 14
    .line 15
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 16
    .line 17
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 21
    .line 22
    aget v6, v6, v5

    .line 23
    .line 24
    invoke-virtual {v0, v6, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 28
    .line 29
    aget v1, v1, v5

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 35
    .line 36
    aget v1, v1, v5

    .line 37
    .line 38
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 42
    .line 43
    aget v1, v1, v5

    .line 44
    .line 45
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 49
    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/high16 v7, 0x3f000000    # 0.5f

    .line 60
    .line 61
    const/4 v8, 0x2

    .line 62
    if-ne v0, v8, :cond_1

    .line 63
    .line 64
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 65
    .line 66
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 70
    .line 71
    aget v9, v9, v5

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    div-int/2addr v10, v8

    .line 78
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v11

    .line 82
    sub-int/2addr v10, v11

    .line 83
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 84
    .line 85
    .line 86
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 87
    .line 88
    aget v9, v9, v5

    .line 89
    .line 90
    invoke-virtual {v0, v9, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 94
    .line 95
    aget v1, v1, v5

    .line 96
    .line 97
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 101
    .line 102
    aget v1, v1, v5

    .line 103
    .line 104
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 108
    .line 109
    aget v1, v1, v6

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 112
    .line 113
    .line 114
    move-result v9

    .line 115
    div-int/2addr v9, v8

    .line 116
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    sub-int/2addr v9, v7

    .line 121
    invoke-virtual {v0, v1, v9}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 125
    .line 126
    aget v1, v1, v6

    .line 127
    .line 128
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 132
    .line 133
    aget v1, v1, v6

    .line 134
    .line 135
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 139
    .line 140
    aget v1, v1, v6

    .line 141
    .line 142
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-ne v0, v4, :cond_2

    .line 157
    .line 158
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 159
    .line 160
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 161
    .line 162
    .line 163
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 164
    .line 165
    aget v9, v9, v5

    .line 166
    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 168
    .line 169
    .line 170
    move-result v10

    .line 171
    div-int/2addr v10, v8

    .line 172
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result v11

    .line 176
    sub-int/2addr v10, v11

    .line 177
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 178
    .line 179
    .line 180
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 181
    .line 182
    aget v9, v9, v5

    .line 183
    .line 184
    invoke-virtual {v0, v9, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 185
    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 188
    .line 189
    aget v1, v1, v5

    .line 190
    .line 191
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 192
    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 195
    .line 196
    aget v1, v1, v5

    .line 197
    .line 198
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 199
    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 202
    .line 203
    aget v1, v1, v6

    .line 204
    .line 205
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 206
    .line 207
    .line 208
    move-result v9

    .line 209
    div-int/2addr v9, v8

    .line 210
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 211
    .line 212
    .line 213
    move-result v10

    .line 214
    sub-int/2addr v9, v10

    .line 215
    invoke-virtual {v0, v1, v9}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 219
    .line 220
    aget v1, v1, v6

    .line 221
    .line 222
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 223
    .line 224
    .line 225
    move-result v9

    .line 226
    div-int/2addr v9, v8

    .line 227
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 228
    .line 229
    .line 230
    move-result v10

    .line 231
    sub-int/2addr v9, v10

    .line 232
    invoke-virtual {v0, v1, v9}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 233
    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 236
    .line 237
    aget v1, v1, v6

    .line 238
    .line 239
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 240
    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 243
    .line 244
    aget v1, v1, v6

    .line 245
    .line 246
    invoke-virtual {v0, v1, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 247
    .line 248
    .line 249
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 250
    .line 251
    aget v1, v1, v8

    .line 252
    .line 253
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    div-int/2addr v4, v8

    .line 258
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 259
    .line 260
    .line 261
    move-result v6

    .line 262
    sub-int/2addr v4, v6

    .line 263
    invoke-virtual {v0, v1, v4}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 264
    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 267
    .line 268
    aget v1, v1, v8

    .line 269
    .line 270
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 271
    .line 272
    .line 273
    move-result v4

    .line 274
    div-int/2addr v4, v8

    .line 275
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 276
    .line 277
    .line 278
    move-result v6

    .line 279
    sub-int/2addr v4, v6

    .line 280
    invoke-virtual {v0, v1, v4}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 281
    .line 282
    .line 283
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 284
    .line 285
    aget v1, v1, v8

    .line 286
    .line 287
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 288
    .line 289
    .line 290
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 291
    .line 292
    aget v1, v1, v8

    .line 293
    .line 294
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 298
    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 303
    .line 304
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-ne v0, v3, :cond_3

    .line 309
    .line 310
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 311
    .line 312
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 313
    .line 314
    .line 315
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 316
    .line 317
    aget v9, v9, v5

    .line 318
    .line 319
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 320
    .line 321
    .line 322
    move-result v10

    .line 323
    div-int/2addr v10, v8

    .line 324
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 325
    .line 326
    .line 327
    move-result v11

    .line 328
    sub-int/2addr v10, v11

    .line 329
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 330
    .line 331
    .line 332
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 333
    .line 334
    aget v9, v9, v5

    .line 335
    .line 336
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 337
    .line 338
    .line 339
    move-result v10

    .line 340
    div-int/2addr v10, v8

    .line 341
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 342
    .line 343
    .line 344
    move-result v11

    .line 345
    sub-int/2addr v10, v11

    .line 346
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 347
    .line 348
    .line 349
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 350
    .line 351
    aget v9, v9, v5

    .line 352
    .line 353
    invoke-virtual {v0, v9, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 354
    .line 355
    .line 356
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 357
    .line 358
    aget v9, v9, v5

    .line 359
    .line 360
    invoke-virtual {v0, v9, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 361
    .line 362
    .line 363
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 364
    .line 365
    aget v9, v9, v6

    .line 366
    .line 367
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 368
    .line 369
    .line 370
    move-result v10

    .line 371
    div-int/2addr v10, v8

    .line 372
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 373
    .line 374
    .line 375
    move-result v11

    .line 376
    sub-int/2addr v10, v11

    .line 377
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 378
    .line 379
    .line 380
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 381
    .line 382
    aget v9, v9, v6

    .line 383
    .line 384
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 385
    .line 386
    .line 387
    move-result v10

    .line 388
    div-int/2addr v10, v8

    .line 389
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 390
    .line 391
    .line 392
    move-result v11

    .line 393
    sub-int/2addr v10, v11

    .line 394
    invoke-virtual {v0, v9, v10}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 395
    .line 396
    .line 397
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 398
    .line 399
    aget v9, v9, v6

    .line 400
    .line 401
    invoke-virtual {v0, v9, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 402
    .line 403
    .line 404
    iget-object v9, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 405
    .line 406
    aget v6, v9, v6

    .line 407
    .line 408
    invoke-virtual {v0, v6, v4, v5, v4}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 409
    .line 410
    .line 411
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 412
    .line 413
    aget v6, v6, v8

    .line 414
    .line 415
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 416
    .line 417
    .line 418
    move-result v9

    .line 419
    div-int/2addr v9, v8

    .line 420
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 421
    .line 422
    .line 423
    move-result v10

    .line 424
    sub-int/2addr v9, v10

    .line 425
    invoke-virtual {v0, v6, v9}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 426
    .line 427
    .line 428
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 429
    .line 430
    aget v6, v6, v8

    .line 431
    .line 432
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 433
    .line 434
    .line 435
    move-result v9

    .line 436
    div-int/2addr v9, v8

    .line 437
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 438
    .line 439
    .line 440
    move-result v10

    .line 441
    sub-int/2addr v9, v10

    .line 442
    invoke-virtual {v0, v6, v9}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 443
    .line 444
    .line 445
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 446
    .line 447
    aget v6, v6, v8

    .line 448
    .line 449
    invoke-virtual {v0, v6, v1, v5, v1}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 450
    .line 451
    .line 452
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 453
    .line 454
    aget v1, v1, v8

    .line 455
    .line 456
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 457
    .line 458
    .line 459
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 460
    .line 461
    aget v1, v1, v4

    .line 462
    .line 463
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 464
    .line 465
    .line 466
    move-result v6

    .line 467
    div-int/2addr v6, v8

    .line 468
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 469
    .line 470
    .line 471
    move-result v9

    .line 472
    sub-int/2addr v6, v9

    .line 473
    invoke-virtual {v0, v1, v6}, Landroidx/constraintlayout/widget/a;->i(II)V

    .line 474
    .line 475
    .line 476
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 477
    .line 478
    aget v1, v1, v4

    .line 479
    .line 480
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 481
    .line 482
    .line 483
    move-result v6

    .line 484
    div-int/2addr v6, v8

    .line 485
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 486
    .line 487
    .line 488
    move-result v7

    .line 489
    sub-int/2addr v6, v7

    .line 490
    invoke-virtual {v0, v1, v6}, Landroidx/constraintlayout/widget/a;->h(II)V

    .line 491
    .line 492
    .line 493
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 494
    .line 495
    aget v1, v1, v4

    .line 496
    .line 497
    invoke-virtual {v0, v1, v2, v5, v2}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 498
    .line 499
    .line 500
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 501
    .line 502
    aget v1, v1, v4

    .line 503
    .line 504
    invoke-virtual {v0, v1, v3, v5, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 508
    .line 509
    .line 510
    :cond_3
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->m0(Z)V

    .line 511
    .line 512
    .line 513
    return-void
.end method


# virtual methods
.method public final k0(Landroid/content/Context;II)Lv/VDraweeView;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :cond_0
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x0

    .line 16
    if-ne p2, v1, :cond_2

    .line 17
    .line 18
    if-nez p3, :cond_1

    .line 19
    .line 20
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    .line 22
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 23
    .line 24
    .line 25
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 26
    .line 27
    invoke-virtual {p2, p3, v2, v2, p3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 28
    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_1
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 33
    .line 34
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 35
    .line 36
    .line 37
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 38
    .line 39
    invoke-virtual {p2, v2, p3, p3, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const/4 v3, 0x3

    .line 44
    if-ne p2, v3, :cond_5

    .line 45
    .line 46
    if-nez p3, :cond_3

    .line 47
    .line 48
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 49
    .line 50
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 51
    .line 52
    .line 53
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 54
    .line 55
    invoke-virtual {p2, p3, v2, v2, p3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    if-ne p3, v0, :cond_4

    .line 60
    .line 61
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 62
    .line 63
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 64
    .line 65
    .line 66
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 67
    .line 68
    invoke-virtual {p2, v2, p3, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 73
    .line 74
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 75
    .line 76
    .line 77
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 78
    .line 79
    invoke-virtual {p2, v2, v2, p3, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v3, 0x4

    .line 84
    if-ne p2, v3, :cond_9

    .line 85
    .line 86
    if-nez p3, :cond_6

    .line 87
    .line 88
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 89
    .line 90
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 91
    .line 92
    .line 93
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 94
    .line 95
    invoke-virtual {p2, p3, v2, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    if-ne p3, v0, :cond_7

    .line 100
    .line 101
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 102
    .line 103
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 104
    .line 105
    .line 106
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 107
    .line 108
    invoke-virtual {p2, v2, p3, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_7
    if-ne p3, v1, :cond_8

    .line 113
    .line 114
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 115
    .line 116
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 117
    .line 118
    .line 119
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 120
    .line 121
    invoke-virtual {p2, v2, v2, v2, p3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_8
    new-instance p2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 126
    .line 127
    invoke-direct {p2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 128
    .line 129
    .line 130
    iget p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 131
    .line 132
    invoke-virtual {p2, v2, v2, p3, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_9
    const/4 p2, 0x0

    .line 137
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-static {p0}, Ll/xlj;->u(Landroid/content/res/Resources;)Ll/xlj;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    sget-object p3, Ll/h1e0;->i:Ll/h1e0;

    .line 146
    .line 147
    invoke-virtual {p0, p3}, Ll/xlj;->v(Ll/h1e0;)Ll/xlj;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    const/4 p3, 0x0

    .line 152
    invoke-virtual {p0, p3}, Ll/xlj;->y(I)Ll/xlj;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, p2}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-virtual {p0}, Ll/xlj;->a()Ll/wlj;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    new-instance p2, Lv/VDraweeView;

    .line 165
    .line 166
    invoke-direct {p2, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p2, p0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 170
    .line 171
    .line 172
    return-object p2
.end method

.method public final l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    shr-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotX(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    shr-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    int-to-float v0, v0

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    new-array v1, v0, [F

    .line 33
    .line 34
    fill-array-data v1, :array_0

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v2, Ll/ou10;

    .line 44
    .line 45
    invoke-direct {v2, p0}, Ll/ou10;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    const/4 v2, -0x1

    .line 54
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    const-wide/16 v1, 0x320

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
    .end array-data
.end method

.method public final m0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/nu10;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/nu10;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const/high16 p1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final synthetic n0(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Float;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic o0(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->setSize(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->h:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 p2, 0x0

    .line 13
    :goto_0
    if-ge p2, p1, :cond_1

    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 16
    .line 17
    aget p3, p3, p2

    .line 18
    .line 19
    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    check-cast p3, Lv/VDraweeView;

    .line 24
    .line 25
    if-eqz p3, :cond_0

    .line 26
    .line 27
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->f:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    check-cast p4, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const-string v2, "context_common"

    .line 44
    .line 45
    invoke-static {v2, p3, p4, v0, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 46
    .line 47
    .line 48
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-void
.end method

.method public p0(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/ty6;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/ty6;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1, v1}, Ll/jyb;->l(Ljava/util/Collection;Ljava/util/Collection;Ll/rcj;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->i:Z

    .line 17
    .line 18
    if-ne v0, p2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->m0(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->i:Z

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->f:Ljava/util/List;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 34
    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-lez v0, :cond_2

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    move v1, v0

    .line 46
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-ge v1, v2, :cond_2

    .line 51
    .line 52
    const/4 v2, 0x4

    .line 53
    if-ge v1, v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {p0, v2, v3, v1}, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->k0(Landroid/content/Context;II)Lv/VDraweeView;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->d:[I

    .line 68
    .line 69
    aget v3, v3, v1

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->e:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    new-instance v3, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 80
    .line 81
    invoke-direct {v3, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    new-instance p1, Ll/pu10;

    .line 91
    .line 92
    invoke-direct {p1, p0, p2}, Ll/pu10;-><init>(Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;Z)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public setRadius(F)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 v0, 0x3f000000    # 0.5f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sub-int/2addr p1, v0

    .line 12
    int-to-float p1, p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroomnew/view/MultipleAvatarView;->g:F

    .line 14
    .line 15
    return-void
.end method

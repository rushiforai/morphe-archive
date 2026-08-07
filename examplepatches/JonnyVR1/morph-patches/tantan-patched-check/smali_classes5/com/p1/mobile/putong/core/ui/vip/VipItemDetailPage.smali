.class public Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public e:Landroid/widget/ImageView;

.field public f:Landroidx/legacy/widget/Space;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroidx/legacy/widget/Space;

.field public k:Lv/VButton;

.field public l:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/x20;Ll/x20;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sp(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic c(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zql0;->a(Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->h(Lcom/p1/mobile/android/app/Act;Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 9

    .line 1
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_not_match_guide:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    const/high16 v2, 0x41000000    # 8.0f

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/16 v4, 0x8

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 20
    .line 21
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 25
    .line 26
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v5, Ll/pec0;->m2:I

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    invoke-virtual {v0, v5, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/DynamicAvatarRoundView;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v5}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Yi()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/vip/DynamicAvatarRoundView;->s(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 58
    .line 59
    const/4 v6, -0x2

    .line 60
    invoke-direct {v5, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 61
    .line 62
    .line 63
    const/16 v6, 0x11

    .line 64
    .line 65
    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 66
    .line 67
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->a:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    invoke-virtual {v6, v0, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v5}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Y4()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-static {v5}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    invoke-static {v5}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    add-int/2addr v5, v6

    .line 109
    new-instance v7, Landroid/text/SpannableString;

    .line 110
    .line 111
    invoke-direct {v7, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 115
    .line 116
    sget v8, Ll/f9c0;->l:I

    .line 117
    .line 118
    invoke-virtual {p1, v8}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 119
    .line 120
    .line 121
    move-result v8

    .line 122
    invoke-direct {v0, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 123
    .line 124
    .line 125
    const/16 v8, 0x21

    .line 126
    .line 127
    invoke-interface {v7, v0, v6, v5, v8}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->g:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_0
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_1

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 148
    .line 149
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 158
    .line 159
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 160
    .line 161
    .line 162
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 163
    .line 164
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 165
    .line 166
    invoke-virtual {p2}, Ll/a690;->k()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v6

    .line 170
    invoke-virtual {v0, v5, v6}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_1
    invoke-virtual {p2}, Ll/a690;->f()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_3

    .line 180
    .line 181
    invoke-virtual {p2}, Ll/a690;->e()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_3

    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 188
    .line 189
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 198
    .line 199
    invoke-virtual {p2}, Ll/a690;->f()I

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 211
    .line 212
    invoke-virtual {p2}, Ll/a690;->e()I

    .line 213
    .line 214
    .line 215
    move-result v5

    .line 216
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 228
    .line 229
    if-eqz v0, :cond_2

    .line 230
    .line 231
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 235
    .line 236
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 245
    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_2
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 249
    .line 250
    .line 251
    goto :goto_0

    .line 252
    :cond_3
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-eqz v0, :cond_6

    .line 257
    .line 258
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    sget v5, Ll/gbc0;->p6:I

    .line 263
    .line 264
    if-ne v0, v5, :cond_4

    .line 265
    .line 266
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 267
    .line 268
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 273
    .line 274
    .line 275
    move-result v6

    .line 276
    invoke-virtual {v0, v3, v5, v3, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 277
    .line 278
    .line 279
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 280
    .line 281
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 282
    .line 283
    .line 284
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 285
    .line 286
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 287
    .line 288
    .line 289
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 290
    .line 291
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 292
    .line 293
    invoke-virtual {p2}, Ll/a690;->j()I

    .line 294
    .line 295
    .line 296
    move-result v6

    .line 297
    invoke-virtual {v0, v5, v6}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 305
    .line 306
    if-eqz v0, :cond_5

    .line 307
    .line 308
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 309
    .line 310
    .line 311
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 312
    .line 313
    invoke-virtual {p2}, Ll/a690;->c()I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 318
    .line 319
    .line 320
    move-result-object v5

    .line 321
    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 322
    .line 323
    .line 324
    goto :goto_0

    .line 325
    :cond_5
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 326
    .line 327
    .line 328
    goto :goto_0

    .line 329
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->b:Lv/VDraweeView;

    .line 330
    .line 331
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 332
    .line 333
    .line 334
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->d:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 335
    .line 336
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->e:Landroid/widget/ImageView;

    .line 340
    .line 341
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 342
    .line 343
    .line 344
    :goto_0
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->g:Lv/VText;

    .line 353
    .line 354
    if-nez v0, :cond_8

    .line 355
    .line 356
    invoke-virtual {p2}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    .line 362
    .line 363
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->g:Lv/VText;

    .line 364
    .line 365
    invoke-virtual {p2}, Ll/a690;->u()I

    .line 366
    .line 367
    .line 368
    move-result v5

    .line 369
    if-eqz v5, :cond_7

    .line 370
    .line 371
    invoke-virtual {p2}, Ll/a690;->u()I

    .line 372
    .line 373
    .line 374
    move-result v5

    .line 375
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 376
    .line 377
    .line 378
    move-result v5

    .line 379
    goto :goto_1

    .line 380
    :cond_7
    sget v5, Ll/f9c0;->i:I

    .line 381
    .line 382
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 383
    .line 384
    .line 385
    move-result v5

    .line 386
    :goto_1
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 387
    .line 388
    .line 389
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->g:Lv/VText;

    .line 390
    .line 391
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 392
    .line 393
    .line 394
    goto :goto_2

    .line 395
    :cond_8
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    .line 396
    .line 397
    .line 398
    :goto_2
    invoke-virtual {p2}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->h:Lv/VText;

    .line 407
    .line 408
    if-nez v0, :cond_a

    .line 409
    .line 410
    invoke-virtual {p2}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 415
    .line 416
    .line 417
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->h:Lv/VText;

    .line 418
    .line 419
    invoke-virtual {p2}, Ll/a690;->r()I

    .line 420
    .line 421
    .line 422
    move-result v5

    .line 423
    if-lez v5, :cond_9

    .line 424
    .line 425
    invoke-virtual {p2}, Ll/a690;->r()I

    .line 426
    .line 427
    .line 428
    move-result v5

    .line 429
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 430
    .line 431
    .line 432
    move-result v5

    .line 433
    goto :goto_3

    .line 434
    :cond_9
    sget v5, Ll/f9c0;->j:I

    .line 435
    .line 436
    invoke-virtual {p1, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    :goto_3
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 441
    .line 442
    .line 443
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->h:Lv/VText;

    .line 444
    .line 445
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 446
    .line 447
    .line 448
    goto :goto_4

    .line 449
    :cond_a
    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 450
    .line 451
    .line 452
    :goto_4
    invoke-virtual {p2}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    if-nez v0, :cond_b

    .line 461
    .line 462
    invoke-virtual {p2}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-virtual {p2}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 467
    .line 468
    .line 469
    move-result-object v5

    .line 470
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    if-nez v0, :cond_b

    .line 475
    .line 476
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->i:Lv/VText;

    .line 477
    .line 478
    invoke-virtual {p2}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 479
    .line 480
    .line 481
    move-result-object v2

    .line 482
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 483
    .line 484
    .line 485
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->j:Landroidx/legacy/widget/Space;

    .line 486
    .line 487
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    const/high16 v2, 0x41b00000    # 22.0f

    .line 492
    .line 493
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 494
    .line 495
    .line 496
    move-result v2

    .line 497
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 498
    .line 499
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->f:Landroidx/legacy/widget/Space;

    .line 500
    .line 501
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    const/high16 v2, 0x41980000    # 19.0f

    .line 506
    .line 507
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 508
    .line 509
    .line 510
    move-result v2

    .line 511
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 512
    .line 513
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->i:Lv/VText;

    .line 514
    .line 515
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 516
    .line 517
    .line 518
    goto :goto_5

    .line 519
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->j:Landroidx/legacy/widget/Space;

    .line 520
    .line 521
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    const/high16 v5, 0x42200000    # 40.0f

    .line 526
    .line 527
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 528
    .line 529
    .line 530
    move-result v5

    .line 531
    iput v5, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 532
    .line 533
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->f:Landroidx/legacy/widget/Space;

    .line 534
    .line 535
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 536
    .line 537
    .line 538
    move-result-object v0

    .line 539
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 540
    .line 541
    .line 542
    move-result v2

    .line 543
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 544
    .line 545
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->i:Lv/VText;

    .line 546
    .line 547
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 548
    .line 549
    .line 550
    :goto_5
    invoke-virtual {p2}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 551
    .line 552
    .line 553
    move-result-object v0

    .line 554
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 555
    .line 556
    if-ne v0, v1, :cond_c

    .line 557
    .line 558
    sget v0, Ll/gbc0;->m6:I

    .line 559
    .line 560
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 561
    .line 562
    .line 563
    goto :goto_6

    .line 564
    :cond_c
    sget v0, Ll/gbc0;->n6:I

    .line 565
    .line 566
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 567
    .line 568
    .line 569
    :goto_6
    invoke-virtual {p2}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 570
    .line 571
    .line 572
    move-result-object v0

    .line 573
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 574
    .line 575
    .line 576
    move-result v0

    .line 577
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 578
    .line 579
    if-nez v0, :cond_d

    .line 580
    .line 581
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->H1:I

    .line 582
    .line 583
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 584
    .line 585
    .line 586
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->l:Lv/VText;

    .line 587
    .line 588
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->G1:I

    .line 589
    .line 590
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 591
    .line 592
    .line 593
    goto :goto_7

    .line 594
    :cond_d
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->F1:I

    .line 595
    .line 596
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 597
    .line 598
    .line 599
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->l:Lv/VText;

    .line 600
    .line 601
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->d:I

    .line 602
    .line 603
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 604
    .line 605
    .line 606
    :goto_7
    invoke-virtual {p2}, Ll/a690;->i()I

    .line 607
    .line 608
    .line 609
    move-result v0

    .line 610
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->c:Lv/VImage;

    .line 611
    .line 612
    if-eqz v0, :cond_e

    .line 613
    .line 614
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 615
    .line 616
    .line 617
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->c:Lv/VImage;

    .line 618
    .line 619
    invoke-virtual {p2}, Ll/a690;->i()I

    .line 620
    .line 621
    .line 622
    move-result p2

    .line 623
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 624
    .line 625
    .line 626
    goto :goto_8

    .line 627
    :cond_e
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 628
    .line 629
    .line 630
    :goto_8
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 631
    .line 632
    .line 633
    move-result p2

    .line 634
    if-eqz p2, :cond_f

    .line 635
    .line 636
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 637
    .line 638
    new-instance p2, Ll/uql0;

    .line 639
    .line 640
    invoke-direct {p2, p4}, Ll/uql0;-><init>(Ll/x20;)V

    .line 641
    .line 642
    .line 643
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 644
    .line 645
    .line 646
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->l:Lv/VText;

    .line 647
    .line 648
    new-instance p1, Ll/vql0;

    .line 649
    .line 650
    invoke-direct {p1, p5}, Ll/vql0;-><init>(Ll/x20;)V

    .line 651
    .line 652
    .line 653
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 654
    .line 655
    .line 656
    return-void

    .line 657
    :cond_f
    invoke-static {p3}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 658
    .line 659
    .line 660
    move-result p2

    .line 661
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->l:Lv/VText;

    .line 662
    .line 663
    if-eqz p2, :cond_10

    .line 664
    .line 665
    const/4 p2, 0x1

    .line 666
    invoke-static {p3, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 667
    .line 668
    .line 669
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->l:Lv/VText;

    .line 670
    .line 671
    new-instance p3, Ll/wql0;

    .line 672
    .line 673
    invoke-direct {p3, p5}, Ll/wql0;-><init>(Ll/x20;)V

    .line 674
    .line 675
    .line 676
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 677
    .line 678
    .line 679
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 680
    .line 681
    sget p3, Lcom/p1/mobile/putong/core/member/R$string;->v1:I

    .line 682
    .line 683
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 684
    .line 685
    .line 686
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 687
    .line 688
    new-instance p3, Ll/xql0;

    .line 689
    .line 690
    invoke-direct {p3, p6, p5, p1}, Ll/xql0;-><init>(Ll/x20;Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 694
    .line 695
    .line 696
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->g:Lv/VText;

    .line 697
    .line 698
    sget p2, Lcom/p1/mobile/putong/core/member/R$string;->j:I

    .line 699
    .line 700
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object p1

    .line 704
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    .line 706
    .line 707
    return-void

    .line 708
    :cond_10
    invoke-static {p3, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 709
    .line 710
    .line 711
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 712
    .line 713
    sget p2, Lcom/p1/mobile/putong/core/member/R$string;->d:I

    .line 714
    .line 715
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 716
    .line 717
    .line 718
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 719
    .line 720
    new-instance p1, Ll/yql0;

    .line 721
    .line 722
    invoke-direct {p1, p5}, Ll/yql0;-><init>(Ll/x20;)V

    .line 723
    .line 724
    .line 725
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 726
    .line 727
    .line 728
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Xa()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-gtz p0, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    xor-int/2addr p0, v0

    .line 44
    return p0

    .line 45
    :cond_2
    invoke-static {p1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s6()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_5

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_4

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    return v0

    .line 94
    :cond_5
    :goto_0
    invoke-static {p1}, Ll/joa;->b4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    return p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setGetBackgroundResource(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->k:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VCheckBox;

.field public g:Lv/VText;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->h:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->h:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->h:I

    return-void
.end method

.method public static synthetic a(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->b1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->O0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->a1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->J0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->Q0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->L0(Z)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic g(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->Q1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fd5;->a(Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final i()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const-string v0, "#c267fa"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    const/4 v3, 0x0

    .line 14
    packed-switch p1, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    move p1, v1

    .line 18
    move v0, v2

    .line 19
    move-object v4, v3

    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :pswitch_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/lqb;->l4()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Ll/a5i0;->R1()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 39
    .line 40
    const-string v5, "\u8bed\u97f3\u95ea\u804a"

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 46
    .line 47
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    sget v5, Ll/qa00;->z:I

    .line 52
    .line 53
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 54
    .line 55
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 56
    .line 57
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 62
    .line 63
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 64
    .line 65
    sget v5, Ll/jbc0;->z0:I

    .line 66
    .line 67
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 77
    .line 78
    .line 79
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 80
    .line 81
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {v4, v0}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 86
    .line 87
    .line 88
    new-instance v0, Ll/ed5;

    .line 89
    .line 90
    invoke-direct {v0}, Ll/ed5;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v4, "\u8bed\u97f3\u95ea\u804a\u7528\u5b8c\u4e86\uff0c\u53ef\u4ee5\u7528\u63a2\u63a2\u5e01\u8d2d\u4e70\u66f4\u591a"

    .line 94
    .line 95
    :goto_0
    move-object v7, v4

    .line 96
    move-object v4, v0

    .line 97
    move v0, v3

    .line 98
    move-object v3, v7

    .line 99
    goto/16 :goto_1

    .line 100
    .line 101
    :pswitch_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/lqb;->X4()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Ll/a5i0;->t0()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 118
    .line 119
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->M0:I

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 122
    .line 123
    .line 124
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->e:Lv/VText;

    .line 125
    .line 126
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->L2:I

    .line 127
    .line 128
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 129
    .line 130
    .line 131
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 132
    .line 133
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    sget v5, Ll/qa00;->z:I

    .line 138
    .line 139
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 140
    .line 141
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 142
    .line 143
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 144
    .line 145
    .line 146
    move-result-object v4

    .line 147
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 148
    .line 149
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 150
    .line 151
    sget v5, Ll/jbc0;->ua:I

    .line 152
    .line 153
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 154
    .line 155
    .line 156
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 157
    .line 158
    const-string v5, "#ffa067"

    .line 159
    .line 160
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 165
    .line 166
    .line 167
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 168
    .line 169
    const-string v5, "#ff3f45"

    .line 170
    .line 171
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 176
    .line 177
    .line 178
    new-instance v4, Ll/dd5;

    .line 179
    .line 180
    invoke-direct {v4}, Ll/dd5;-><init>()V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_1

    .line 184
    .line 185
    :pswitch_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 188
    .line 189
    invoke-virtual {p1}, Ll/lqb;->X4()I

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {v0}, Ll/a5i0;->z0()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 202
    .line 203
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->M0:I

    .line 204
    .line 205
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 206
    .line 207
    .line 208
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->e:Lv/VText;

    .line 209
    .line 210
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->K2:I

    .line 211
    .line 212
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 213
    .line 214
    .line 215
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 216
    .line 217
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    sget v5, Ll/qa00;->z:I

    .line 222
    .line 223
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 224
    .line 225
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 226
    .line 227
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 232
    .line 233
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 240
    .line 241
    .line 242
    move-result-object v5

    .line 243
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->z6()I

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 248
    .line 249
    .line 250
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 251
    .line 252
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    sget v6, Ll/h9c0;->Y:I

    .line 257
    .line 258
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 259
    .line 260
    .line 261
    move-result v5

    .line 262
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 263
    .line 264
    .line 265
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 266
    .line 267
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    sget v6, Ll/h9c0;->X:I

    .line 272
    .line 273
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 274
    .line 275
    .line 276
    move-result v5

    .line 277
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 278
    .line 279
    .line 280
    new-instance v4, Ll/cd5;

    .line 281
    .line 282
    invoke-direct {v4}, Ll/cd5;-><init>()V

    .line 283
    .line 284
    .line 285
    goto/16 :goto_1

    .line 286
    .line 287
    :pswitch_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 288
    .line 289
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 290
    .line 291
    invoke-virtual {p1}, Ll/lqb;->X4()I

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {v0}, Ll/a5i0;->A0()Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 304
    .line 305
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->M0:I

    .line 306
    .line 307
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 308
    .line 309
    .line 310
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 311
    .line 312
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    sget v5, Ll/qa00;->z:I

    .line 317
    .line 318
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 319
    .line 320
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 321
    .line 322
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 323
    .line 324
    .line 325
    move-result-object v4

    .line 326
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 327
    .line 328
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 329
    .line 330
    sget v5, Ll/jbc0;->p8:I

    .line 331
    .line 332
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 333
    .line 334
    .line 335
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 336
    .line 337
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 338
    .line 339
    .line 340
    move-result-object v5

    .line 341
    sget v6, Ll/h9c0;->Y:I

    .line 342
    .line 343
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 344
    .line 345
    .line 346
    move-result v5

    .line 347
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 348
    .line 349
    .line 350
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 351
    .line 352
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    sget v6, Ll/h9c0;->X:I

    .line 357
    .line 358
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 359
    .line 360
    .line 361
    move-result v5

    .line 362
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 363
    .line 364
    .line 365
    new-instance v4, Ll/bd5;

    .line 366
    .line 367
    invoke-direct {v4}, Ll/bd5;-><init>()V

    .line 368
    .line 369
    .line 370
    goto/16 :goto_1

    .line 371
    .line 372
    :pswitch_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 373
    .line 374
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 375
    .line 376
    invoke-virtual {p1}, Ll/lqb;->f5()I

    .line 377
    .line 378
    .line 379
    move-result p1

    .line 380
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 381
    .line 382
    .line 383
    move-result-object v3

    .line 384
    invoke-virtual {v3}, Ll/a5i0;->D0()Z

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 389
    .line 390
    .line 391
    move-result-object v4

    .line 392
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->w:I

    .line 393
    .line 394
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 399
    .line 400
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->a7:I

    .line 401
    .line 402
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 403
    .line 404
    .line 405
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 406
    .line 407
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 408
    .line 409
    .line 410
    move-result-object v5

    .line 411
    sget v6, Ll/qa00;->z:I

    .line 412
    .line 413
    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 414
    .line 415
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 416
    .line 417
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 418
    .line 419
    .line 420
    move-result-object v5

    .line 421
    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 422
    .line 423
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 424
    .line 425
    sget v6, Ll/jbc0;->z0:I

    .line 426
    .line 427
    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 428
    .line 429
    .line 430
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 431
    .line 432
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 433
    .line 434
    .line 435
    move-result v6

    .line 436
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 437
    .line 438
    .line 439
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 440
    .line 441
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 442
    .line 443
    .line 444
    move-result v0

    .line 445
    invoke-virtual {v5, v0}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 446
    .line 447
    .line 448
    new-instance v0, Ll/ad5;

    .line 449
    .line 450
    invoke-direct {v0}, Ll/ad5;-><init>()V

    .line 451
    .line 452
    .line 453
    goto/16 :goto_0

    .line 454
    .line 455
    :pswitch_5
    invoke-static {}, Ll/m27;->z3()I

    .line 456
    .line 457
    .line 458
    move-result p1

    .line 459
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    invoke-virtual {v0}, Ll/a5i0;->u()Z

    .line 464
    .line 465
    .line 466
    move-result v0

    .line 467
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 468
    .line 469
    .line 470
    move-result-object v4

    .line 471
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    .line 472
    .line 473
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 474
    .line 475
    .line 476
    move-result-object v4

    .line 477
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 478
    .line 479
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 480
    .line 481
    .line 482
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 483
    .line 484
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 485
    .line 486
    .line 487
    move-result-object v5

    .line 488
    sget v6, Ll/jbc0;->l:I

    .line 489
    .line 490
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 491
    .line 492
    .line 493
    move-result-object v5

    .line 494
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 495
    .line 496
    .line 497
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 498
    .line 499
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 500
    .line 501
    .line 502
    move-result-object v5

    .line 503
    sget v6, Ll/h9c0;->b:I

    .line 504
    .line 505
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 506
    .line 507
    .line 508
    move-result v5

    .line 509
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 510
    .line 511
    .line 512
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 513
    .line 514
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 515
    .line 516
    .line 517
    move-result-object v5

    .line 518
    sget v6, Ll/h9c0;->a:I

    .line 519
    .line 520
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 521
    .line 522
    .line 523
    move-result v5

    .line 524
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 525
    .line 526
    .line 527
    new-instance v4, Ll/zc5;

    .line 528
    .line 529
    invoke-direct {v4}, Ll/zc5;-><init>()V

    .line 530
    .line 531
    .line 532
    goto :goto_1

    .line 533
    :pswitch_6
    invoke-static {}, Ll/a5i0;->u0()I

    .line 534
    .line 535
    .line 536
    move-result p1

    .line 537
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    invoke-virtual {v0}, Ll/a5i0;->K1()Z

    .line 542
    .line 543
    .line 544
    move-result v3

    .line 545
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    invoke-static {}, Ll/l9n;->f()I

    .line 550
    .line 551
    .line 552
    move-result v4

    .line 553
    invoke-virtual {v0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object v0

    .line 557
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->c:Lv/VText;

    .line 558
    .line 559
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->d:I

    .line 560
    .line 561
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 562
    .line 563
    .line 564
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->b:Landroid/widget/ImageView;

    .line 565
    .line 566
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 567
    .line 568
    .line 569
    move-result-object v5

    .line 570
    sget v6, Ll/jbc0;->u9:I

    .line 571
    .line 572
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 573
    .line 574
    .line 575
    move-result-object v5

    .line 576
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 577
    .line 578
    .line 579
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 580
    .line 581
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 582
    .line 583
    .line 584
    move-result-object v5

    .line 585
    sget v6, Ll/h9c0;->p0:I

    .line 586
    .line 587
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 588
    .line 589
    .line 590
    move-result v5

    .line 591
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 592
    .line 593
    .line 594
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 595
    .line 596
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 597
    .line 598
    .line 599
    move-result-object v5

    .line 600
    sget v6, Ll/h9c0;->o0:I

    .line 601
    .line 602
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 603
    .line 604
    .line 605
    move-result v5

    .line 606
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 607
    .line 608
    .line 609
    new-instance v4, Ll/yc5;

    .line 610
    .line 611
    invoke-direct {v4}, Ll/yc5;-><init>()V

    .line 612
    .line 613
    .line 614
    move v7, v3

    .line 615
    move-object v3, v0

    .line 616
    move v0, v7

    .line 617
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->a:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 618
    .line 619
    const/16 v6, 0x5a

    .line 620
    .line 621
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorAngle(I)V

    .line 622
    .line 623
    .line 624
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 625
    .line 626
    .line 627
    move-result v5

    .line 628
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->e:Lv/VText;

    .line 629
    .line 630
    if-eqz v5, :cond_0

    .line 631
    .line 632
    invoke-static {v6, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 633
    .line 634
    .line 635
    goto :goto_2

    .line 636
    :cond_0
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 637
    .line 638
    .line 639
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->e:Lv/VText;

    .line 640
    .line 641
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 642
    .line 643
    .line 644
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->i()Lcom/p1/mobile/android/app/Act;

    .line 645
    .line 646
    .line 647
    move-result-object v1

    .line 648
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->S7:I

    .line 649
    .line 650
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->h:I

    .line 651
    .line 652
    mul-int/2addr p1, v3

    .line 653
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 654
    .line 655
    .line 656
    move-result-object p1

    .line 657
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 658
    .line 659
    .line 660
    move-result-object p1

    .line 661
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 662
    .line 663
    .line 664
    move-result-object p1

    .line 665
    const-string v1, "#ff5435"

    .line 666
    .line 667
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 668
    .line 669
    .line 670
    move-result v1

    .line 671
    const/4 v2, 0x2

    .line 672
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 673
    .line 674
    .line 675
    move-result-object v2

    .line 676
    invoke-static {p1, v1, v2}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 677
    .line 678
    .line 679
    move-result-object p1

    .line 680
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->d:Lv/VText;

    .line 681
    .line 682
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 683
    .line 684
    .line 685
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->g:Lv/VText;

    .line 686
    .line 687
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->O1:I

    .line 688
    .line 689
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 690
    .line 691
    .line 692
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->f:Lv/VCheckBox;

    .line 693
    .line 694
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 695
    .line 696
    .line 697
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->f:Lv/VCheckBox;

    .line 698
    .line 699
    invoke-virtual {p0, v4}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 700
    .line 701
    .line 702
    return-void

    .line 703
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onFinishInflate()V
    .locals 0

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setPayCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/CoinGuideView;->h:I

    .line 2
    .line 3
    return-void
.end method

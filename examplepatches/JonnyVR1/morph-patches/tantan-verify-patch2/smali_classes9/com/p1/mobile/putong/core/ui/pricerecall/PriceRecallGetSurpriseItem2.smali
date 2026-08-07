.class public Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText_AutoFit;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/RelativeLayout;

.field public i:Lv/VText;

.field public j:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cu80;->a(Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/core/data/Merchandise;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->j0(Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->e:Lv/VText_AutoFit;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v0, v2}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->i:Lv/VText;

    .line 12
    .line 13
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 23
    .line 24
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    sub-double/2addr v0, v2

    .line 31
    new-instance v2, Ljava/text/DecimalFormat;

    .line 32
    .line 33
    const-string v3, "#.#"

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object v3, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v0, v1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->i:Lv/VText;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v3, "\u00a5"

    .line 52
    .line 53
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 67
    .line 68
    const-string v1, "tttVip"

    .line 69
    .line 70
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->j:Landroid/widget/TextView;

    .line 75
    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 79
    .line 80
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->n0:I

    .line 81
    .line 82
    const-string v3, "VIP"

    .line 83
    .line 84
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->h:Landroid/widget/RelativeLayout;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 102
    .line 103
    const-string v1, "#19fe7e1d"

    .line 104
    .line 105
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->i:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    sget v3, Ll/h9c0;->l:I

    .line 119
    .line 120
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->j:Landroid/widget/TextView;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    sget v3, Ll/h9c0;->l:I

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->h:Landroid/widget/RelativeLayout;

    .line 143
    .line 144
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 149
    .line 150
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->n0:I

    .line 151
    .line 152
    const-string v3, "SVIP"

    .line 153
    .line 154
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->h:Landroid/widget/RelativeLayout;

    .line 166
    .line 167
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 172
    .line 173
    const-string v1, "#ffedca"

    .line 174
    .line 175
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->i:Lv/VText;

    .line 183
    .line 184
    const-string v2, "#efb134"

    .line 185
    .line 186
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 191
    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->j:Landroid/widget/TextView;

    .line 194
    .line 195
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->h:Landroid/widget/RelativeLayout;

    .line 203
    .line 204
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 205
    .line 206
    .line 207
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-eqz v0, :cond_1

    .line 212
    .line 213
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 214
    .line 215
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->D:I

    .line 216
    .line 217
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    goto :goto_1

    .line 221
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_2

    .line 226
    .line 227
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 228
    .line 229
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->E:I

    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-eqz v0, :cond_3

    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    if-eqz v0, :cond_4

    .line 247
    .line 248
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 249
    .line 250
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->F:I

    .line 251
    .line 252
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    :cond_4
    :goto_1
    if-eqz p2, :cond_6

    .line 256
    .line 257
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->f:Lv/VText;

    .line 258
    .line 259
    const/4 v0, 0x1

    .line 260
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 261
    .line 262
    .line 263
    if-eqz p3, :cond_5

    .line 264
    .line 265
    const-string p1, "2"

    .line 266
    .line 267
    goto :goto_2

    .line 268
    :cond_5
    invoke-static {p1}, Ll/du80;->f(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    :goto_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 273
    .line 274
    sget p3, Lcom/p1/mobile/putong/core/pay/R$string;->r0:I

    .line 275
    .line 276
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s0:I

    .line 277
    .line 278
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    invoke-virtual {p2, p3, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->f:Lv/VText;

    .line 295
    .line 296
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    .line 298
    .line 299
    :cond_6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurpriseItem2;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;
.super Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;
.source "SourceFile"


# instance fields
.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText_AutoFit;

.field public e:Lv/VText_AutoFit;

.field public f:Lv/VText;

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:I

.field public k:Landroid/text/SpannableStringBuilder;

.field public l:Landroid/text/SpannableStringBuilder;

.field public m:Z

.field public n:Z


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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->n:Z

    .line 14
    .line 15
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

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h:Z

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->n:Z

    return-void
.end method

.method private f(ZLcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    const-string v1, "oDiamond"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/s7a;->o()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/h9c0;->L:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    const-string v0, "#88000000"

    .line 37
    .line 38
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->l(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    :goto_0
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 50
    .line 51
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, "\u5361"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    invoke-direct {p1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    new-instance p2, Lv/text/CustomTypefaceSpan;

    .line 78
    .line 79
    const/4 v1, 0x3

    .line 80
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    sget v2, Ll/qa00;->q:I

    .line 85
    .line 86
    const-string v3, "sans-serif"

    .line 87
    .line 88
    invoke-direct {p2, v3, v1, v0, v2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 89
    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    invoke-virtual {p2, v0}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    const/16 v1, 0x21

    .line 100
    .line 101
    invoke-virtual {p1, p2, v0, p0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 102
    .line 103
    .line 104
    return-object p1
.end method

.method private p(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x3

    .line 8
    if-eqz p2, :cond_3

    .line 9
    .line 10
    const v3, 0x3f8923a3    # 1.0714f

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 22
    .line 23
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v0, v4}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 31
    .line 32
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const v0, 0x3f9b6e2f    # 1.2143f

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v0}, Landroid/view/View;->setScaleX(F)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Landroid/view/View;->setScaleY(F)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setScaleX(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 74
    .line 75
    const-string v2, "oDiamond"

    .line 76
    .line 77
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-static {}, Ll/s7a;->o()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    sget v3, Ll/h9c0;->N:I

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    sget v3, Ll/h9c0;->N:I

    .line 111
    .line 112
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 121
    .line 122
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 128
    .line 129
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 132
    .line 133
    .line 134
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 135
    .line 136
    const/high16 v2, 0x3f880000    # 1.0625f

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 144
    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_3
    const/high16 v3, 0x3f800000    # 1.0f

    .line 148
    .line 149
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c:Lv/VText;

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 158
    .line 159
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v0, v2, v1}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 164
    .line 165
    .line 166
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 167
    .line 168
    if-nez v0, :cond_5

    .line 169
    .line 170
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 171
    .line 172
    if-eqz v0, :cond_4

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->l(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 190
    .line 191
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 192
    .line 193
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 197
    .line 198
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 202
    .line 203
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 204
    .line 205
    .line 206
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 207
    .line 208
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->l(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 220
    .line 221
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 225
    .line 226
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 230
    .line 231
    const/4 v2, 0x2

    .line 232
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-virtual {v0, v2, v1}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 237
    .line 238
    .line 239
    :goto_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->k(ZLcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->b:Landroid/widget/LinearLayout;

    .line 248
    .line 249
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 250
    .line 251
    .line 252
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 253
    .line 254
    const/4 v2, 0x1

    .line 255
    if-nez v0, :cond_7

    .line 256
    .line 257
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 258
    .line 259
    if-nez v0, :cond_7

    .line 260
    .line 261
    if-eqz p2, :cond_6

    .line 262
    .line 263
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_7

    .line 272
    .line 273
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_8

    .line 278
    .line 279
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_8

    .line 288
    .line 289
    :cond_7
    move v1, v2

    .line 290
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->f:Lv/VText;

    .line 291
    .line 292
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->f:Lv/VText;

    .line 300
    .line 301
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 302
    .line 303
    .line 304
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->f:Lv/VText;

    .line 305
    .line 306
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I

    .line 307
    .line 308
    .line 309
    move-result v1

    .line 310
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 311
    .line 312
    .line 313
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->f:Lv/VText;

    .line 314
    .line 315
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 320
    .line 321
    .line 322
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 323
    .line 324
    if-eqz v0, :cond_9

    .line 325
    .line 326
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    const-string v1, "lowPrice3Month"

    .line 331
    .line 332
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    if-eqz v0, :cond_9

    .line 337
    .line 338
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c:Lv/VText;

    .line 339
    .line 340
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 341
    .line 342
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d(ZI)Landroid/text/SpannableStringBuilder;

    .line 343
    .line 344
    .line 345
    move-result-object p2

    .line 346
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    .line 348
    .line 349
    goto :goto_6

    .line 350
    :cond_9
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-eqz v0, :cond_a

    .line 359
    .line 360
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    if-eqz v0, :cond_a

    .line 369
    .line 370
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c:Lv/VText;

    .line 371
    .line 372
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-direct {p0, p2, v1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->f(ZLcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;

    .line 377
    .line 378
    .line 379
    move-result-object p2

    .line 380
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    .line 382
    .line 383
    goto :goto_6

    .line 384
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c:Lv/VText;

    .line 385
    .line 386
    if-eqz p2, :cond_b

    .line 387
    .line 388
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->k:Landroid/text/SpannableStringBuilder;

    .line 389
    .line 390
    goto :goto_5

    .line 391
    :cond_b
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->l:Landroid/text/SpannableStringBuilder;

    .line 392
    .line 393
    :goto_5
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    .line 395
    .line 396
    :goto_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 397
    .line 398
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 403
    .line 404
    .line 405
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 406
    .line 407
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 408
    .line 409
    if-eqz p2, :cond_c

    .line 410
    .line 411
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 416
    .line 417
    .line 418
    move-result-object p1

    .line 419
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 420
    .line 421
    .line 422
    goto :goto_7

    .line 423
    :cond_c
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 428
    .line 429
    .line 430
    :goto_7
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 431
    .line 432
    if-eqz p1, :cond_d

    .line 433
    .line 434
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h:Z

    .line 435
    .line 436
    if-nez p1, :cond_d

    .line 437
    .line 438
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 439
    .line 440
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    const/16 p1, 0x11

    .line 445
    .line 446
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 447
    .line 448
    .line 449
    return-void

    .line 450
    :cond_d
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 451
    .line 452
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 453
    .line 454
    .line 455
    move-result-object p0

    .line 456
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setFlags(I)V

    .line 457
    .line 458
    .line 459
    return-void
.end method


# virtual methods
.method public a(ZZLcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->p(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x350;->a(Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(ZI)Landroid/text/SpannableStringBuilder;
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget p2, Ll/h9c0;->i:I

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    :goto_0
    const/high16 p0, 0x41500000    # 13.0f

    .line 15
    .line 16
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 21
    .line 22
    const-string v1, "\u524d3\u6708"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x2

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    const/4 v3, 0x3

    .line 35
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    :goto_1
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 45
    .line 46
    const-string v5, "sans-serif"

    .line 47
    .line 48
    sget v6, Ll/qa00;->s:I

    .line 49
    .line 50
    invoke-direct {v4, v5, v3, p2, v6}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 51
    .line 52
    .line 53
    new-instance v3, Landroid/text/style/AbsoluteSizeSpan;

    .line 54
    .line 55
    invoke-direct {v3, p0}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 56
    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    const/4 v6, 0x1

    .line 60
    const/16 v7, 0x21

    .line 61
    .line 62
    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 66
    .line 67
    invoke-direct {v3, p1}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 71
    .line 72
    .line 73
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 74
    .line 75
    invoke-direct {v3, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v3, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v4, v6, v2, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 82
    .line 83
    .line 84
    new-instance v3, Landroid/text/style/AbsoluteSizeSpan;

    .line 85
    .line 86
    invoke-direct {v3, p0}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v3, v2, v1, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 90
    .line 91
    .line 92
    new-instance p0, Landroid/text/style/StyleSpan;

    .line 93
    .line 94
    invoke-direct {p0, p1}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, p0, v2, v1, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 98
    .line 99
    .line 100
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 101
    .line 102
    invoke-direct {p0, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p0, v2, v1, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 106
    .line 107
    .line 108
    return-object v0
.end method

.method public final e(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 7

    .line 1
    const-string v0, "/"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    array-length v2, v1

    .line 14
    const/4 v3, 0x2

    .line 15
    if-ne v2, v3, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    aget-object v0, v1, p1

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    aget-object v1, v1, v2

    .line 22
    .line 23
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-direct {v2, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v1, v0

    .line 52
    new-instance v4, Landroid/text/style/AbsoluteSizeSpan;

    .line 53
    .line 54
    const/16 v5, 0x10

    .line 55
    .line 56
    invoke-static {v5}, Ll/qa00;->f(I)I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    invoke-direct {v4, v5}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v5, v0, -0x1

    .line 64
    .line 65
    const/16 v6, 0x21

    .line 66
    .line 67
    invoke-virtual {v2, v4, p1, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Landroid/text/style/AbsoluteSizeSpan;

    .line 71
    .line 72
    const/16 v4, 0xa

    .line 73
    .line 74
    invoke-static {v4}, Ll/qa00;->f(I)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-direct {p1, v4}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, p1, v5, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 82
    .line 83
    .line 84
    new-instance p1, Landroid/text/style/StrikethroughSpan;

    .line 85
    .line 86
    invoke-direct {p1}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, p1, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 90
    .line 91
    .line 92
    new-instance p1, Lv/text/CustomTypefaceSpan;

    .line 93
    .line 94
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    sget v4, Ll/h9c0;->k:I

    .line 103
    .line 104
    invoke-virtual {p0, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    const/16 v4, 0xc

    .line 109
    .line 110
    invoke-static {v4}, Ll/qa00;->f(I)I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    const-string v5, "sans-serif"

    .line 115
    .line 116
    invoke-direct {p1, v5, v3, p0, v4}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2, p1, v0, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 120
    .line 121
    .line 122
    return-object v2

    .line 123
    :cond_0
    const-string p0, ""

    .line 124
    .line 125
    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_1
    return-object p1
.end method

.method public final g(ZILjava/lang/String;ILcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p5, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    const-string v1, "oDiamond"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/s7a;->o()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p5, Ll/h9c0;->L:I

    .line 26
    .line 27
    invoke-virtual {p0, p5}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 37
    .line 38
    .line 39
    move-result-object p5

    .line 40
    invoke-virtual {p5}, Ll/tab0;->z()Z

    .line 41
    .line 42
    .line 43
    move-result p5

    .line 44
    if-eqz p5, :cond_1

    .line 45
    .line 46
    const-string p0, "#88000000"

    .line 47
    .line 48
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget p5, Ll/h9c0;->W:I

    .line 58
    .line 59
    invoke-virtual {p0, p5}, Landroid/content/res/Resources;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->l(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    :goto_0
    if-eqz p1, :cond_3

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    move p4, p0

    .line 72
    :goto_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const/4 p2, 0x2

    .line 77
    if-eqz p1, :cond_4

    .line 78
    .line 79
    const/4 p1, 0x3

    .line 80
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    goto :goto_2

    .line 85
    :cond_4
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    :goto_2
    new-instance p5, Landroid/text/SpannableStringBuilder;

    .line 90
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-direct {p5, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 110
    .line 111
    sget v1, Ll/qa00;->s:I

    .line 112
    .line 113
    const-string v2, "sans-serif"

    .line 114
    .line 115
    invoke-direct {v0, v2, p1, p4, v1}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 116
    .line 117
    .line 118
    const/4 p1, 0x0

    .line 119
    invoke-virtual {v0, p1}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    const/16 v3, 0x21

    .line 127
    .line 128
    invoke-virtual {p5, v0, p1, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 129
    .line 130
    .line 131
    new-instance p1, Lv/text/CustomTypefaceSpan;

    .line 132
    .line 133
    invoke-static {p2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    const/high16 v0, 0x41500000    # 13.0f

    .line 138
    .line 139
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-direct {p1, v2, p2, p4, v0}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 155
    .line 156
    .line 157
    move-result p3

    .line 158
    add-int/2addr p0, p3

    .line 159
    invoke-virtual {p5, p1, p2, p0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 160
    .line 161
    .line 162
    return-object p5
.end method

.method public getAnimBackgroundList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->f:Lv/VText;

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v1, v1, [Landroid/view/View;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput-object v0, v1, v2

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput-object p0, v1, v0

    .line 13
    .line 14
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "oDiamond"

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_2

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/s7a;->o()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    sget p0, Ll/jbc0;->I5:I

    .line 34
    .line 35
    return p0

    .line 36
    :cond_0
    sget p0, Ll/jbc0;->i5:I

    .line 37
    .line 38
    return p0

    .line 39
    :cond_1
    sget p0, Ll/jbc0;->X4:I

    .line 40
    .line 41
    return p0

    .line 42
    :cond_2
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 43
    .line 44
    if-eqz p0, :cond_4

    .line 45
    .line 46
    invoke-static {}, Ll/s7a;->o()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 57
    .line 58
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    sget p0, Ll/jbc0;->H5:I

    .line 65
    .line 66
    return p0

    .line 67
    :cond_3
    sget p0, Ll/jbc0;->h5:I

    .line 68
    .line 69
    return p0

    .line 70
    :cond_4
    sget p0, Ll/jbc0;->W4:I

    .line 71
    .line 72
    return p0
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I
    .locals 2
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "oDiamond"

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    if-nez p2, :cond_2

    .line 10
    .line 11
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 12
    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/s7a;->o()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget p1, Ll/h9c0;->M:I

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_0
    const-string p0, "#808C5B1A"

    .line 45
    .line 46
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_1
    const-string p0, "#CC000000"

    .line 52
    .line 53
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_2
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 59
    .line 60
    if-eqz p2, :cond_4

    .line 61
    .line 62
    invoke-static {}, Ll/s7a;->o()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 73
    .line 74
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_3

    .line 79
    .line 80
    const-string p0, "#261406"

    .line 81
    .line 82
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0

    .line 87
    :cond_3
    const/4 p0, -0x1

    .line 88
    return p0

    .line 89
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget p1, Ll/h9c0;->b0:I

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/s7a;->o()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    const-string v0, "oDiamond"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p1, Ll/h9c0;->P:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const-string p0, "#8C5B1A"

    .line 33
    .line 34
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    const-string p0, "#ffffdea2"

    .line 40
    .line 41
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public k(ZLcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget p0, Ll/jbc0;->f7:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    sget p0, Ll/jbc0;->g7:I

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 14
    .line 15
    if-eqz p0, :cond_5

    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    const-string p2, "oDiamond"

    .line 20
    .line 21
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_3

    .line 26
    .line 27
    invoke-static {}, Ll/s7a;->o()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    sget p0, Ll/jbc0;->F5:I

    .line 36
    .line 37
    return p0

    .line 38
    :cond_2
    sget p0, Ll/jbc0;->G5:I

    .line 39
    .line 40
    return p0

    .line 41
    :cond_3
    if-eqz p1, :cond_4

    .line 42
    .line 43
    sget p0, Ll/jbc0;->f5:I

    .line 44
    .line 45
    return p0

    .line 46
    :cond_4
    sget p0, Ll/jbc0;->g5:I

    .line 47
    .line 48
    return p0

    .line 49
    :cond_5
    if-eqz p1, :cond_6

    .line 50
    .line 51
    sget p0, Ll/jbc0;->U4:I

    .line 52
    .line 53
    return p0

    .line 54
    :cond_6
    sget p0, Ll/jbc0;->V4:I

    .line 55
    .line 56
    return p0
.end method

.method public l(Lcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/s7a;->o()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    const-string v0, "oDiamond"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p1, Ll/h9c0;->K:I

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const-string p0, "#66000000"

    .line 33
    .line 34
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    const-string p0, "#66ffdea2"

    .line 40
    .line 41
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public final m(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->i()Ll/t6c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Ll/il40;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    check-cast v0, Ll/il40;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/il40;->a()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/il40;->b()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h:Z

    .line 28
    .line 29
    :cond_0
    if-eqz p2, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_1

    .line 40
    .line 41
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h:Z

    .line 42
    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    const/4 p2, 0x1

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 p2, 0x0

    .line 48
    :goto_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    const/4 v1, 0x1

    .line 75
    move-object v0, p0

    .line 76
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g(ZILjava/lang/String;ILcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->k:Landroid/text/SpannableStringBuilder;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->j:I

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    const/4 v1, 0x0

    .line 97
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g(ZILjava/lang/String;ILcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    iput-object p0, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->l:Landroid/text/SpannableStringBuilder;

    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->n:Z

    .line 2
    .line 3
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->C()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->u()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->d:Lv/VText_AutoFit;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->i:Z

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :goto_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->g:Z

    .line 64
    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->h:Z

    .line 68
    .line 69
    if-nez p1, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/16 p1, 0x11

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->e:Lv/VText_AutoFit;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const/4 p1, 0x1

    .line 90
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFlags(I)V

    .line 91
    .line 92
    .line 93
    :cond_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setInVipFrag(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->m:Z

    .line 2
    .line 3
    return-void
.end method

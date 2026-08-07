.class public Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;
.super Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;
.source "SourceFile"


# instance fields
.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText_AutoFit;

.field public e:Lv/VText_AutoFit;

.field public f:Landroid/text/SpannableStringBuilder;

.field public g:Landroid/text/SpannableStringBuilder;


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
    .locals 5

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->f(Ljava/lang/String;Z)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->c:Lv/VText;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const v2, 0x3f8923a3    # 1.0714f

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->c:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 45
    .line 46
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 50
    .line 51
    const/high16 v2, 0x3f880000    # 1.0625f

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 62
    .line 63
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {v0, v1, v2}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 72
    .line 73
    const/4 v1, 0x3

    .line 74
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-virtual {v0, v1, v2}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/high16 v2, 0x3f800000    # 1.0f

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->c:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    sget v4, Ll/h9c0;->S:I

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 119
    .line 120
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v0, v3}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 128
    .line 129
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 143
    .line 144
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, v1}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 149
    .line 150
    .line 151
    :goto_0
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->g(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->b:Landroid/widget/LinearLayout;

    .line 156
    .line 157
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->c:Lv/VText;

    .line 161
    .line 162
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {p0, p1, v1, v2, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e(ZLjava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d:Lv/VText_AutoFit;

    .line 182
    .line 183
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->e:Lv/VText_AutoFit;

    .line 191
    .line 192
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hl40;->a(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(ZLjava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;
    .locals 5

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
    sget p4, Ll/h9c0;->p:I

    .line 9
    .line 10
    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    :goto_0
    const/4 p0, 0x2

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x3

    .line 18
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Lv/text/CustomTypefaceSpan;

    .line 48
    .line 49
    sget v2, Ll/qa00;->s:I

    .line 50
    .line 51
    const-string v3, "sans-serif"

    .line 52
    .line 53
    invoke-direct {v1, v3, p1, p4, v2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-virtual {v1, p1}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const/16 v4, 0x21

    .line 65
    .line 66
    invoke-virtual {v0, v1, p1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Lv/text/CustomTypefaceSpan;

    .line 70
    .line 71
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const/high16 v1, 0x41500000    # 13.0f

    .line 76
    .line 77
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-direct {p1, v3, p0, p4, v1}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    add-int/2addr p2, p3

    .line 97
    invoke-virtual {v0, p1, p0, p2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 98
    .line 99
    .line 100
    return-object v0
.end method

.method public final e(ZLjava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->f:Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d(ZLjava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->f:Landroid/text/SpannableStringBuilder;

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->f:Landroid/text/SpannableStringBuilder;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->g:Landroid/text/SpannableStringBuilder;

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    :cond_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->d(ZLjava/lang/String;Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->g:Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->g:Landroid/text/SpannableStringBuilder;

    .line 77
    .line 78
    return-object p0
.end method

.method public f(Ljava/lang/String;Z)I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    const/4 v0, -0x1

    .line 9
    sparse-switch p2, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string p2, "picksMembership"

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x7

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string p2, "undoMembership"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v0, 0x6

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string p2, "roaming"

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v0, 0x5

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string p2, "svip"

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v0, 0x4

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string p2, "svipPicksMembership"

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const/4 v0, 0x3

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string p2, "unlimitedSwipes"

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    const/4 v0, 0x2

    .line 79
    goto :goto_0

    .line 80
    :sswitch_6
    const-string p2, "tttVip"

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_6

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    const/4 v0, 0x1

    .line 90
    goto :goto_0

    .line 91
    :sswitch_7
    const-string p2, "superLikeMembership"

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_7

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_7
    const/4 v0, 0x0

    .line 101
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget p1, Ll/h9c0;->D:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    return p0

    .line 115
    :pswitch_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget p1, Ll/h9c0;->U:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    return p0

    .line 126
    :pswitch_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget p1, Ll/h9c0;->V:I

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    return p0

    .line 137
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_7
        -0x33752677 -> :sswitch_6
        -0x199fff46 -> :sswitch_5
        -0x59a8242 -> :sswitch_4
        0x360eca -> :sswitch_3
        0x517a5c19 -> :sswitch_2
        0x6e276fda -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public g(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I
    .locals 3
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, -0x1

    .line 18
    sparse-switch v0, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v0, "picksMembership"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v2, 0x7

    .line 33
    goto :goto_0

    .line 34
    :sswitch_1
    const-string v0, "undoMembership"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 v2, 0x6

    .line 44
    goto :goto_0

    .line 45
    :sswitch_2
    const-string v0, "roaming"

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/4 v2, 0x5

    .line 55
    goto :goto_0

    .line 56
    :sswitch_3
    const-string v0, "svip"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    const/4 v2, 0x4

    .line 66
    goto :goto_0

    .line 67
    :sswitch_4
    const-string v0, "svipPicksMembership"

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    const/4 v2, 0x3

    .line 77
    goto :goto_0

    .line 78
    :sswitch_5
    const-string v0, "unlimitedSwipes"

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    const/4 v2, 0x2

    .line 88
    goto :goto_0

    .line 89
    :sswitch_6
    const-string v0, "tttVip"

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_6

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    const/4 v2, 0x1

    .line 99
    goto :goto_0

    .line 100
    :sswitch_7
    const-string v0, "superLikeMembership"

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_7

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    move v2, v1

    .line 110
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 111
    .line 112
    .line 113
    return v1

    .line 114
    :pswitch_0
    if-eqz p2, :cond_8

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_8

    .line 121
    .line 122
    sget p0, Ll/jbc0;->S3:I

    .line 123
    .line 124
    return p0

    .line 125
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_9

    .line 130
    .line 131
    sget p0, Ll/jbc0;->P3:I

    .line 132
    .line 133
    return p0

    .line 134
    :cond_9
    sget p0, Ll/jbc0;->J3:I

    .line 135
    .line 136
    return p0

    .line 137
    :pswitch_1
    if-eqz p2, :cond_a

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_a

    .line 144
    .line 145
    sget p0, Ll/jbc0;->U3:I

    .line 146
    .line 147
    return p0

    .line 148
    :cond_a
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-eqz p0, :cond_b

    .line 153
    .line 154
    sget p0, Ll/jbc0;->P3:I

    .line 155
    .line 156
    return p0

    .line 157
    :cond_b
    sget p0, Ll/jbc0;->L3:I

    .line 158
    .line 159
    return p0

    .line 160
    nop

    .line 161
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_7
        -0x33752677 -> :sswitch_6
        -0x199fff46 -> :sswitch_5
        -0x59a8242 -> :sswitch_4
        0x360eca -> :sswitch_3
        0x517a5c19 -> :sswitch_2
        0x6e276fda -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAnimBackgroundList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    new-array v0, v0, [Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aput-object p0, v0, v1

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

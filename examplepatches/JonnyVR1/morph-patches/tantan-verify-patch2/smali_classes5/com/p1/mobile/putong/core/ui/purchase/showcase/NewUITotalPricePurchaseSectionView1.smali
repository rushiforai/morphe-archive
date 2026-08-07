.class public Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;
.super Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;
.source "SourceFile"


# instance fields
.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VText_AutoFit;

.field public f:Lv/VText_AutoFit;

.field public g:Lv/VText_AutoFit;

.field public h:Lv/VText;

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:Ll/eud0;

.field public m:I

.field public n:Landroid/text/SpannableStringBuilder;

.field public o:Landroid/text/SpannableStringBuilder;

.field public p:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->k:Z

    .line 10
    .line 11
    new-instance v0, Ll/eud0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/eud0;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 17
    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 19
    .line 20
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

    .line 21
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i:Z

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j:Z

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->k:Z

    .line 25
    new-instance p2, Ll/eud0;

    invoke-direct {p2, p1}, Ll/eud0;-><init>(I)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    return-void
.end method

.method private g(ZILjava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/h9c0;->i:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    const/4 v1, 0x2

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :goto_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 30
    .line 31
    if-eqz v3, :cond_3

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget v0, Ll/h9c0;->g:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    :goto_2
    move v0, p0

    .line 46
    goto :goto_3

    .line 47
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget v0, Ll/h9c0;->j:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    goto :goto_2

    .line 58
    :goto_3
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    :cond_3
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance p2, Landroid/text/SpannableStringBuilder;

    .line 67
    .line 68
    new-instance v3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-direct {p2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    new-instance v3, Lv/text/CustomTypefaceSpan;

    .line 87
    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    sget p1, Ll/qa00;->t:I

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_4
    sget p1, Ll/qa00;->s:I

    .line 94
    .line 95
    :goto_4
    const-string v4, "sans-serif"

    .line 96
    .line 97
    invoke-direct {v3, v4, v2, v0, p1}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 98
    .line 99
    .line 100
    const/4 p1, 0x0

    .line 101
    invoke-virtual {v3, p1}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    const/16 v5, 0x21

    .line 109
    .line 110
    invoke-virtual {p2, v3, p1, v2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 111
    .line 112
    .line 113
    new-instance p1, Lv/text/CustomTypefaceSpan;

    .line 114
    .line 115
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const/high16 v2, 0x41500000    # 13.0f

    .line 120
    .line 121
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-direct {p1, v4, v1, v0, v2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 137
    .line 138
    .line 139
    move-result p3

    .line 140
    add-int/2addr p0, p3

    .line 141
    invoke-virtual {p2, p1, v0, p0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 142
    .line 143
    .line 144
    return-object p2
.end method

.method private n(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->i()Ll/t6c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Ll/il40;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Ll/il40;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/il40;->a()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i:Z

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/il40;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j:Z

    .line 22
    .line 23
    invoke-static {p1}, Ll/pta;->m(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ll/eud0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 28
    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    const/4 v1, 0x1

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_1

    .line 42
    .line 43
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j:Z

    .line 44
    .line 45
    if-eqz p2, :cond_1

    .line 46
    .line 47
    move p2, v1

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move p2, v0

    .line 50
    :goto_0
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->k:Z

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->k(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 65
    .line 66
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 67
    .line 68
    iget-boolean p2, p2, Ll/eud0;->a:Z

    .line 69
    .line 70
    if-eqz p2, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h(Z)Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->n:Landroid/text/SpannableStringBuilder;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h(Z)Landroid/text/SpannableStringBuilder;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->o:Landroid/text/SpannableStringBuilder;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-direct {p0, v1, p2, v2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g(ZILjava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->n:Landroid/text/SpannableStringBuilder;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-direct {p0, v0, p2, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g(ZILjava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->o:Landroid/text/SpannableStringBuilder;

    .line 112
    .line 113
    return-void
.end method

.method private q(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V
    .locals 9

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->b:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move v0, v2

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    move v0, v1

    .line 42
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 43
    .line 44
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 70
    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->c()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Ll/ueh0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {p0, v4, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->d(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/CharSequence;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_3
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v3}, Ll/tab0;->z()Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_4

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-eqz v3, :cond_4

    .line 131
    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {p0, p2, v4}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f(ZLcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_4
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->k:Z

    .line 147
    .line 148
    if-eqz v3, :cond_5

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    const-string v4, "lowPrice3Month"

    .line 155
    .line 156
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-eqz v3, :cond_5

    .line 161
    .line 162
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 163
    .line 164
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e(Z)Landroid/text/SpannableStringBuilder;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_5
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 173
    .line 174
    if-eqz p2, :cond_6

    .line 175
    .line 176
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->n:Landroid/text/SpannableStringBuilder;

    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->o:Landroid/text/SpannableStringBuilder;

    .line 180
    .line 181
    :goto_3
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    :goto_4
    if-eqz v0, :cond_7

    .line 185
    .line 186
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 187
    .line 188
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 192
    .line 193
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 194
    .line 195
    .line 196
    goto :goto_5

    .line 197
    :cond_7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 198
    .line 199
    iget-boolean v3, v3, Ll/eud0;->a:Z

    .line 200
    .line 201
    if-nez v3, :cond_a

    .line 202
    .line 203
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i:Z

    .line 204
    .line 205
    if-nez v3, :cond_8

    .line 206
    .line 207
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j:Z

    .line 208
    .line 209
    if-eqz v3, :cond_a

    .line 210
    .line 211
    :cond_8
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->B()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    sget-object v3, Ll/e3e;->INSTANCE:Ll/e3e;

    .line 221
    .line 222
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-virtual {v3, v4}, Ll/e3e;->g(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 231
    .line 232
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 236
    .line 237
    if-eqz p2, :cond_9

    .line 238
    .line 239
    invoke-static {v3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 240
    .line 241
    .line 242
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 243
    .line 244
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 245
    .line 246
    .line 247
    goto :goto_5

    .line 248
    :cond_9
    invoke-static {v3, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 249
    .line 250
    .line 251
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 252
    .line 253
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 254
    .line 255
    .line 256
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 257
    .line 258
    invoke-virtual {p2}, Landroid/view/View;->requestLayout()V

    .line 259
    .line 260
    .line 261
    goto :goto_5

    .line 262
    :cond_a
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 263
    .line 264
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 265
    .line 266
    .line 267
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 268
    .line 269
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 270
    .line 271
    .line 272
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 273
    .line 274
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->B()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 279
    .line 280
    .line 281
    :goto_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 282
    .line 283
    .line 284
    move-result p2

    .line 285
    if-eqz p2, :cond_b

    .line 286
    .line 287
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 288
    .line 289
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->r()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 294
    .line 295
    .line 296
    :cond_b
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 297
    .line 298
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaintFlags()I

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    and-int/lit8 v3, v3, -0x11

    .line 303
    .line 304
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 308
    .line 309
    .line 310
    move-result-object p2

    .line 311
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 312
    .line 313
    const-string v3, "femaleVip"

    .line 314
    .line 315
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 316
    .line 317
    .line 318
    move-result p2

    .line 319
    const-string v4, "youthVip"

    .line 320
    .line 321
    const-string v5, "%s%s"

    .line 322
    .line 323
    const/16 v6, 0x11

    .line 324
    .line 325
    if-eqz p2, :cond_e

    .line 326
    .line 327
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 328
    .line 329
    .line 330
    move-result-object p2

    .line 331
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 332
    .line 333
    .line 334
    move-result p2

    .line 335
    if-nez p2, :cond_c

    .line 336
    .line 337
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 338
    .line 339
    .line 340
    move-result p2

    .line 341
    if-eqz p2, :cond_e

    .line 342
    .line 343
    :cond_c
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->I()Z

    .line 344
    .line 345
    .line 346
    move-result p2

    .line 347
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 348
    .line 349
    if-eqz p2, :cond_d

    .line 350
    .line 351
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p2

    .line 355
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v8

    .line 359
    filled-new-array {p2, v8}, [Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object p2

    .line 363
    invoke-static {v5, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p2

    .line 367
    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    .line 369
    .line 370
    goto :goto_6

    .line 371
    :cond_d
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->A()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p2

    .line 375
    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 376
    .line 377
    .line 378
    :goto_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 379
    .line 380
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 381
    .line 382
    .line 383
    move-result-object p2

    .line 384
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setFlags(I)V

    .line 385
    .line 386
    .line 387
    goto :goto_7

    .line 388
    :cond_e
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 389
    .line 390
    .line 391
    move-result-object p2

    .line 392
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 393
    .line 394
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 395
    .line 396
    .line 397
    move-result p2

    .line 398
    if-eqz p2, :cond_f

    .line 399
    .line 400
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 401
    .line 402
    .line 403
    move-result-object p2

    .line 404
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 405
    .line 406
    .line 407
    move-result p2

    .line 408
    if-eqz p2, :cond_f

    .line 409
    .line 410
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 411
    .line 412
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->A()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v5

    .line 416
    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    .line 418
    .line 419
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 420
    .line 421
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 422
    .line 423
    .line 424
    move-result-object p2

    .line 425
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setFlags(I)V

    .line 426
    .line 427
    .line 428
    goto :goto_7

    .line 429
    :cond_f
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 430
    .line 431
    .line 432
    move-result-object p2

    .line 433
    invoke-static {p2}, Ll/ueh0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 434
    .line 435
    .line 436
    move-result p2

    .line 437
    if-eqz p2, :cond_10

    .line 438
    .line 439
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 440
    .line 441
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 442
    .line 443
    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 444
    .line 445
    .line 446
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 447
    .line 448
    const-string v5, "1\u5143\u79d2\u6740"

    .line 449
    .line 450
    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 451
    .line 452
    .line 453
    goto :goto_7

    .line 454
    :cond_10
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 455
    .line 456
    iget-boolean p2, p2, Ll/eud0;->a:Z

    .line 457
    .line 458
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 459
    .line 460
    if-eqz p2, :cond_11

    .line 461
    .line 462
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object p2

    .line 466
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v8

    .line 470
    filled-new-array {p2, v8}, [Ljava/lang/Object;

    .line 471
    .line 472
    .line 473
    move-result-object p2

    .line 474
    invoke-static {v5, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object p2

    .line 478
    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 479
    .line 480
    .line 481
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 482
    .line 483
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 484
    .line 485
    .line 486
    move-result-object p2

    .line 487
    invoke-virtual {p2, v6}, Landroid/graphics/Paint;->setFlags(I)V

    .line 488
    .line 489
    .line 490
    goto :goto_7

    .line 491
    :cond_11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->A()Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object p2

    .line 495
    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 496
    .line 497
    .line 498
    :goto_7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 499
    .line 500
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 501
    .line 502
    .line 503
    move-result-object p2

    .line 504
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 505
    .line 506
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 507
    .line 508
    .line 509
    move-result-object v5

    .line 510
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 511
    .line 512
    .line 513
    move-result v5

    .line 514
    if-eqz v5, :cond_12

    .line 515
    .line 516
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 517
    .line 518
    .line 519
    move-result-object v5

    .line 520
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 521
    .line 522
    .line 523
    move-result v5

    .line 524
    if-eqz v5, :cond_12

    .line 525
    .line 526
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 527
    .line 528
    .line 529
    move-result-object v5

    .line 530
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 531
    .line 532
    invoke-static {v5, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 533
    .line 534
    .line 535
    move-result v3

    .line 536
    if-nez v3, :cond_12

    .line 537
    .line 538
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 539
    .line 540
    .line 541
    move-result-object p1

    .line 542
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 543
    .line 544
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 545
    .line 546
    .line 547
    move-result p1

    .line 548
    if-nez p1, :cond_12

    .line 549
    .line 550
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->d:Landroid/widget/FrameLayout;

    .line 551
    .line 552
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 553
    .line 554
    .line 555
    sget p1, Ll/qa00;->v:I

    .line 556
    .line 557
    iput p1, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 558
    .line 559
    goto :goto_8

    .line 560
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->d:Landroid/widget/FrameLayout;

    .line 561
    .line 562
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 563
    .line 564
    .line 565
    if-eqz v0, :cond_13

    .line 566
    .line 567
    const/high16 p1, 0x42000000    # 32.0f

    .line 568
    .line 569
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 570
    .line 571
    .line 572
    move-result p1

    .line 573
    iput p1, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 574
    .line 575
    goto :goto_8

    .line 576
    :cond_13
    iget p1, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 577
    .line 578
    sget v0, Ll/qa00;->o:I

    .line 579
    .line 580
    if-eq p1, v0, :cond_14

    .line 581
    .line 582
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 583
    .line 584
    :cond_14
    :goto_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 585
    .line 586
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 587
    .line 588
    .line 589
    return-void
.end method


# virtual methods
.method public a(ZZLcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->n(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p(ZLcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->q(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p3, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->r(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jl40;->a(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/Merchandise;Z)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    const-string v0, "tttVip"

    .line 6
    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p1, "#DE9551"

    .line 14
    .line 15
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "#F27310"

    .line 21
    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p1, "#66000000"

    .line 28
    .line 29
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    if-eqz p2, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget p1, Ll/h9c0;->g:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    :goto_1
    move p1, p0

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget p1, Ll/h9c0;->j:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    goto :goto_1

    .line 62
    :cond_3
    :goto_2
    const/4 p0, 0x3

    .line 63
    invoke-static {p0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const/4 v0, 0x2

    .line 68
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 73
    .line 74
    const-string v3, "7\u5929"

    .line 75
    .line 76
    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    new-instance v3, Lv/text/CustomTypefaceSpan;

    .line 80
    .line 81
    if-eqz p2, :cond_4

    .line 82
    .line 83
    sget p2, Ll/qa00;->t:I

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_4
    sget p2, Ll/qa00;->s:I

    .line 87
    .line 88
    :goto_3
    const-string v4, "sans-serif"

    .line 89
    .line 90
    invoke-direct {v3, v4, p0, p1, p2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x0

    .line 94
    invoke-virtual {v3, p0}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 95
    .line 96
    .line 97
    const/4 p2, 0x1

    .line 98
    const/16 v5, 0x21

    .line 99
    .line 100
    invoke-virtual {v2, v3, p0, p2, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 101
    .line 102
    .line 103
    new-instance p0, Lv/text/CustomTypefaceSpan;

    .line 104
    .line 105
    const/high16 v3, 0x41500000    # 13.0f

    .line 106
    .line 107
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-direct {p0, v4, v1, p1, v3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2, p0, p2, v0, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 115
    .line 116
    .line 117
    return-object v2
.end method

.method public final e(Z)Landroid/text/SpannableStringBuilder;
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/high16 v0, -0x1000000

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/h9c0;->i:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    const/4 v1, 0x2

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :goto_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 30
    .line 31
    if-eqz v3, :cond_3

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget v0, Ll/h9c0;->g:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    :goto_2
    move v0, p0

    .line 46
    goto :goto_3

    .line 47
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget v0, Ll/h9c0;->j:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    goto :goto_2

    .line 58
    :goto_3
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    :cond_3
    const/high16 p0, 0x41500000    # 13.0f

    .line 63
    .line 64
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 69
    .line 70
    const-string v4, "\u524d3\u6708"

    .line 71
    .line 72
    invoke-direct {v3, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    new-instance v5, Lv/text/CustomTypefaceSpan;

    .line 80
    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    sget p1, Ll/qa00;->t:I

    .line 84
    .line 85
    goto :goto_4

    .line 86
    :cond_4
    sget p1, Ll/qa00;->s:I

    .line 87
    .line 88
    :goto_4
    const-string v6, "sans-serif"

    .line 89
    .line 90
    invoke-direct {v5, v6, v2, v0, p1}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 91
    .line 92
    .line 93
    new-instance p1, Landroid/text/style/AbsoluteSizeSpan;

    .line 94
    .line 95
    invoke-direct {p1, p0}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 96
    .line 97
    .line 98
    const/4 v2, 0x0

    .line 99
    const/4 v6, 0x1

    .line 100
    const/16 v7, 0x21

    .line 101
    .line 102
    invoke-virtual {v3, p1, v2, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 106
    .line 107
    invoke-direct {p1, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3, p1, v2, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 111
    .line 112
    .line 113
    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    .line 114
    .line 115
    invoke-direct {p1, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3, p1, v2, v6, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3, v5, v6, v1, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Landroid/text/style/AbsoluteSizeSpan;

    .line 125
    .line 126
    invoke-direct {p1, p0}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v3, p1, v1, v4, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 130
    .line 131
    .line 132
    new-instance p0, Landroid/text/style/StyleSpan;

    .line 133
    .line 134
    invoke-direct {p0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3, p0, v1, v4, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 138
    .line 139
    .line 140
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 141
    .line 142
    invoke-direct {p0, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3, p0, v1, v4, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 146
    .line 147
    .line 148
    return-object v3
.end method

.method public final f(ZLcom/p1/mobile/putong/core/data/Merchandise;)Landroid/text/SpannableStringBuilder;
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/h9c0;->i:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget v0, Ll/h9c0;->g:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    :goto_1
    move v0, p1

    .line 33
    goto :goto_2

    .line 34
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget v0, Ll/h9c0;->j:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p2, "\u5361"

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Landroid/text/SpannableStringBuilder;

    .line 67
    .line 68
    invoke-direct {p2, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 72
    .line 73
    const-string v1, "sans-serif"

    .line 74
    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    new-instance p0, Lv/text/CustomTypefaceSpan;

    .line 78
    .line 79
    const/4 v2, 0x2

    .line 80
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget v3, Ll/qa00;->q:I

    .line 85
    .line 86
    invoke-direct {p0, v1, v2, v0, v3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 87
    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_3
    new-instance p0, Lv/text/CustomTypefaceSpan;

    .line 91
    .line 92
    const/4 v2, 0x3

    .line 93
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    sget v3, Ll/qa00;->q:I

    .line 98
    .line 99
    invoke-direct {p0, v1, v2, v0, v3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 100
    .line 101
    .line 102
    :goto_3
    const/4 v0, 0x0

    .line 103
    invoke-virtual {p0, v0}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    const/16 v1, 0x21

    .line 111
    .line 112
    invoke-virtual {p2, p0, v0, p1, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 113
    .line 114
    .line 115
    return-object p2
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

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

.method public final h(Z)Landroid/text/SpannableStringBuilder;
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Ll/h9c0;->i:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    const/4 v1, 0x2

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :goto_1
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 30
    .line 31
    if-eqz v3, :cond_3

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v2, Ll/h9c0;->g:I

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v2, Ll/h9c0;->j:I

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    :goto_2
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/eud0;->b()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    const-string p0, "\u99963\u6708"

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_4
    const-string p0, "\u99966\u6708"

    .line 72
    .line 73
    :goto_3
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 74
    .line 75
    invoke-direct {v3, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 79
    .line 80
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    const/high16 v6, 0x41500000    # 13.0f

    .line 85
    .line 86
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    const-string v7, "sans-serif"

    .line 91
    .line 92
    invoke-direct {v4, v7, v5, v0, v6}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 93
    .line 94
    .line 95
    const/4 v5, 0x0

    .line 96
    invoke-virtual {v4, v5}, Lv/text/CustomTypefaceSpan;->b(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    const/16 v6, 0x21

    .line 104
    .line 105
    invoke-virtual {v3, v4, v5, p0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Lv/text/CustomTypefaceSpan;

    .line 109
    .line 110
    if-eqz p1, :cond_5

    .line 111
    .line 112
    sget p1, Ll/qa00;->t:I

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_5
    sget p1, Ll/qa00;->s:I

    .line 116
    .line 117
    :goto_4
    invoke-direct {p0, v7, v2, v0, p1}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 118
    .line 119
    .line 120
    const/4 p1, 0x1

    .line 121
    invoke-virtual {v3, p0, p1, v1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 122
    .line 123
    .line 124
    return-object v3
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I
    .locals 4
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, -0x1

    .line 18
    sparse-switch v1, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v1, "picksMembership"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    const/16 v3, 0xa

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_1
    const-string v1, "platinum"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_1
    const/16 v3, 0x9

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_2
    const-string v1, "undoMembership"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_2
    const/16 v3, 0x8

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_3
    const-string v1, "roaming"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const/4 v3, 0x7

    .line 75
    goto :goto_0

    .line 76
    :sswitch_4
    const-string v1, "femaleVip"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    const/4 v3, 0x6

    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    const-string v1, "svip"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_5

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    const/4 v3, 0x5

    .line 97
    goto :goto_0

    .line 98
    :sswitch_6
    const-string v1, "svipPicksMembership"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_6

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    const/4 v3, 0x4

    .line 108
    goto :goto_0

    .line 109
    :sswitch_7
    const-string v1, "unlimitedSwipes"

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    const/4 v3, 0x3

    .line 119
    goto :goto_0

    .line 120
    :sswitch_8
    const-string v1, "youthVip"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_8

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_8
    const/4 v3, 0x2

    .line 130
    goto :goto_0

    .line 131
    :sswitch_9
    const-string v1, "tttVip"

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_9

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_9
    const/4 v3, 0x1

    .line 141
    goto :goto_0

    .line 142
    :sswitch_a
    const-string v1, "superLikeMembership"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_a

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_a
    move v3, v2

    .line 152
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 153
    .line 154
    .line 155
    return v2

    .line 156
    :pswitch_0
    if-eqz p2, :cond_b

    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_b

    .line 163
    .line 164
    sget p0, Ll/jbc0;->X3:I

    .line 165
    .line 166
    return p0

    .line 167
    :cond_b
    sget p0, Ll/jbc0;->a4:I

    .line 168
    .line 169
    return p0

    .line 170
    :pswitch_1
    if-eqz p2, :cond_c

    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_c

    .line 177
    .line 178
    sget p0, Ll/jbc0;->W3:I

    .line 179
    .line 180
    return p0

    .line 181
    :cond_c
    sget p0, Ll/jbc0;->Z3:I

    .line 182
    .line 183
    return p0

    .line 184
    :pswitch_2
    if-eqz p2, :cond_e

    .line 185
    .line 186
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_e

    .line 191
    .line 192
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 193
    .line 194
    if-eqz p0, :cond_d

    .line 195
    .line 196
    sget p0, Ll/jbc0;->d7:I

    .line 197
    .line 198
    return p0

    .line 199
    :cond_d
    sget p0, Ll/jbc0;->Y3:I

    .line 200
    .line 201
    return p0

    .line 202
    :cond_e
    sget p0, Ll/jbc0;->b4:I

    .line 203
    .line 204
    return p0

    .line 205
    :pswitch_3
    if-eqz p2, :cond_f

    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-eqz p0, :cond_f

    .line 212
    .line 213
    sget p0, Ll/jbc0;->d4:I

    .line 214
    .line 215
    return p0

    .line 216
    :cond_f
    sget p0, Ll/jbc0;->c4:I

    .line 217
    .line 218
    return p0

    .line 219
    :pswitch_4
    if-eqz p2, :cond_11

    .line 220
    .line 221
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-eqz p1, :cond_11

    .line 226
    .line 227
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 228
    .line 229
    if-eqz p0, :cond_10

    .line 230
    .line 231
    sget p0, Ll/jbc0;->e7:I

    .line 232
    .line 233
    return p0

    .line 234
    :cond_10
    sget p0, Ll/jbc0;->O3:I

    .line 235
    .line 236
    return p0

    .line 237
    :cond_11
    sget p0, Ll/jbc0;->N3:I

    .line 238
    .line 239
    return p0

    .line 240
    nop

    .line 241
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_a
        -0x33752677 -> :sswitch_9
        -0x2883dbb6 -> :sswitch_8
        -0x199fff46 -> :sswitch_7
        -0x59a8242 -> :sswitch_6
        0x360eca -> :sswitch_5
        0x40c96131 -> :sswitch_4
        0x517a5c19 -> :sswitch_3
        0x6e276fda -> :sswitch_2
        0x6fbec22c -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch

    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I
    .locals 0
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    sparse-switch p1, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_2

    .line 21
    :sswitch_0
    const-string p1, "picksMembership"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :sswitch_1
    const-string p1, "platinum"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const-string p0, "#66656F7B"

    .line 39
    .line 40
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :sswitch_2
    const-string p1, "undoMembership"

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    goto :goto_2

    .line 52
    :sswitch_3
    const-string p1, "roaming"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :sswitch_4
    const-string p1, "femaleVip"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    const-string p0, "#CCF6B7DD"

    .line 64
    .line 65
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    return p0

    .line 70
    :sswitch_5
    const-string p1, "svip"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :sswitch_6
    const-string p1, "svipPicksMembership"

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    :goto_1
    const-string p0, "#66F27310"

    .line 88
    .line 89
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0

    .line 94
    :sswitch_7
    const-string p1, "unlimitedSwipes"

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_8
    const-string p1, "youthVip"

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_1

    .line 104
    .line 105
    const-string p0, "#80AFDA86"

    .line 106
    .line 107
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    return p0

    .line 112
    :sswitch_9
    const-string p1, "tttVip"

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_a
    const-string p1, "superLikeMembership"

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    :goto_2
    const-string p0, "#66DE9551"

    .line 119
    .line 120
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    return p0

    .line 125
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_a
        -0x33752677 -> :sswitch_9
        -0x2883dbb6 -> :sswitch_8
        -0x199fff46 -> :sswitch_7
        -0x59a8242 -> :sswitch_6
        0x360eca -> :sswitch_5
        0x40c96131 -> :sswitch_4
        0x517a5c19 -> :sswitch_3
        0x6e276fda -> :sswitch_2
        0x6fbec22c -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch
.end method

.method public k(Ljava/lang/String;)I
    .locals 2
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
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "picksMembership"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0xa

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "platinum"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v1, 0x9

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_2
    const-string v0, "undoMembership"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_2
    const/16 v1, 0x8

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :sswitch_3
    const-string v0, "roaming"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    const/4 v1, 0x7

    .line 66
    goto :goto_0

    .line 67
    :sswitch_4
    const-string v0, "femaleVip"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    const/4 v1, 0x6

    .line 77
    goto :goto_0

    .line 78
    :sswitch_5
    const-string v0, "svip"

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_5

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    const/4 v1, 0x5

    .line 88
    goto :goto_0

    .line 89
    :sswitch_6
    const-string v0, "svipPicksMembership"

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-nez p1, :cond_6

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    const/4 v1, 0x4

    .line 99
    goto :goto_0

    .line 100
    :sswitch_7
    const-string v0, "unlimitedSwipes"

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_7
    const/4 v1, 0x3

    .line 110
    goto :goto_0

    .line 111
    :sswitch_8
    const-string v0, "youthVip"

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_8

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_8
    const/4 v1, 0x2

    .line 121
    goto :goto_0

    .line 122
    :sswitch_9
    const-string v0, "tttVip"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_9

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    const/4 v1, 0x1

    .line 132
    goto :goto_0

    .line 133
    :sswitch_a
    const-string v0, "superLikeMembership"

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-nez p1, :cond_a

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_a
    const/4 v1, 0x0

    .line 143
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    sget p1, Ll/h9c0;->D:I

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    return p0

    .line 157
    :pswitch_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    sget p1, Ll/h9c0;->T:I

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    return p0

    .line 168
    :pswitch_1
    const-string p0, "#FFE25FB8"

    .line 169
    .line 170
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    return p0

    .line 175
    :pswitch_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    sget p1, Ll/h9c0;->U:I

    .line 180
    .line 181
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    return p0

    .line 186
    :pswitch_3
    const-string p0, "#FF6AA631"

    .line 187
    .line 188
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    return p0

    .line 193
    :pswitch_4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 194
    .line 195
    if-eqz p1, :cond_b

    .line 196
    .line 197
    const-string p0, "#FD8B06"

    .line 198
    .line 199
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    return p0

    .line 204
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    sget p1, Ll/h9c0;->V:I

    .line 209
    .line 210
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    return p0

    .line 215
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_a
        -0x33752677 -> :sswitch_9
        -0x2883dbb6 -> :sswitch_8
        -0x199fff46 -> :sswitch_7
        -0x59a8242 -> :sswitch_6
        0x360eca -> :sswitch_5
        0x40c96131 -> :sswitch_4
        0x517a5c19 -> :sswitch_3
        0x6e276fda -> :sswitch_2
        0x6fbec22c -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch

    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public l(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)I
    .locals 4
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, -0x1

    .line 18
    sparse-switch v1, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v1, "picksMembership"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    const/16 v3, 0xa

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_1
    const-string v1, "platinum"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_1
    const/16 v3, 0x9

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_2
    const-string v1, "undoMembership"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_2
    const/16 v3, 0x8

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_3
    const-string v1, "roaming"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const/4 v3, 0x7

    .line 75
    goto :goto_0

    .line 76
    :sswitch_4
    const-string v1, "femaleVip"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_4

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    const/4 v3, 0x6

    .line 86
    goto :goto_0

    .line 87
    :sswitch_5
    const-string v1, "svip"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_5

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    const/4 v3, 0x5

    .line 97
    goto :goto_0

    .line 98
    :sswitch_6
    const-string v1, "svipPicksMembership"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_6

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_6
    const/4 v3, 0x4

    .line 108
    goto :goto_0

    .line 109
    :sswitch_7
    const-string v1, "unlimitedSwipes"

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_7

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_7
    const/4 v3, 0x3

    .line 119
    goto :goto_0

    .line 120
    :sswitch_8
    const-string v1, "youthVip"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_8

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_8
    const/4 v3, 0x2

    .line 130
    goto :goto_0

    .line 131
    :sswitch_9
    const-string v1, "tttVip"

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_9

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_9
    const/4 v3, 0x1

    .line 141
    goto :goto_0

    .line 142
    :sswitch_a
    const-string v1, "superLikeMembership"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_a

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_a
    move v3, v2

    .line 152
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 153
    .line 154
    .line 155
    return v2

    .line 156
    :pswitch_0
    if-eqz p2, :cond_b

    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_b

    .line 163
    .line 164
    sget p0, Ll/jbc0;->R3:I

    .line 165
    .line 166
    return p0

    .line 167
    :cond_b
    sget p0, Ll/jbc0;->I3:I

    .line 168
    .line 169
    return p0

    .line 170
    :pswitch_1
    if-eqz p2, :cond_d

    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_d

    .line 177
    .line 178
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 179
    .line 180
    if-eqz p0, :cond_c

    .line 181
    .line 182
    sget p0, Ll/jbc0;->b7:I

    .line 183
    .line 184
    return p0

    .line 185
    :cond_c
    sget p0, Ll/jbc0;->I7:I

    .line 186
    .line 187
    return p0

    .line 188
    :cond_d
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 189
    .line 190
    if-eqz p0, :cond_e

    .line 191
    .line 192
    sget p0, Ll/jbc0;->c7:I

    .line 193
    .line 194
    return p0

    .line 195
    :cond_e
    sget p0, Ll/jbc0;->J7:I

    .line 196
    .line 197
    return p0

    .line 198
    :pswitch_2
    if-eqz p2, :cond_10

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-eqz p1, :cond_10

    .line 205
    .line 206
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 207
    .line 208
    if-eqz p0, :cond_f

    .line 209
    .line 210
    sget p0, Ll/jbc0;->h7:I

    .line 211
    .line 212
    return p0

    .line 213
    :cond_f
    sget p0, Ll/jbc0;->T3:I

    .line 214
    .line 215
    return p0

    .line 216
    :cond_10
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 217
    .line 218
    if-eqz p0, :cond_11

    .line 219
    .line 220
    sget p0, Ll/jbc0;->i7:I

    .line 221
    .line 222
    return p0

    .line 223
    :cond_11
    sget p0, Ll/jbc0;->K3:I

    .line 224
    .line 225
    return p0

    .line 226
    :pswitch_3
    if-eqz p2, :cond_13

    .line 227
    .line 228
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-eqz p1, :cond_13

    .line 233
    .line 234
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 235
    .line 236
    if-eqz p0, :cond_12

    .line 237
    .line 238
    sget p0, Ll/jbc0;->l7:I

    .line 239
    .line 240
    return p0

    .line 241
    :cond_12
    sget p0, Ll/jbc0;->K7:I

    .line 242
    .line 243
    return p0

    .line 244
    :cond_13
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 245
    .line 246
    if-eqz p0, :cond_14

    .line 247
    .line 248
    sget p0, Ll/jbc0;->m7:I

    .line 249
    .line 250
    return p0

    .line 251
    :cond_14
    sget p0, Ll/jbc0;->L7:I

    .line 252
    .line 253
    return p0

    .line 254
    :pswitch_4
    if-eqz p2, :cond_16

    .line 255
    .line 256
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-eqz p1, :cond_16

    .line 261
    .line 262
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 263
    .line 264
    if-eqz p0, :cond_15

    .line 265
    .line 266
    sget p0, Ll/jbc0;->j7:I

    .line 267
    .line 268
    return p0

    .line 269
    :cond_15
    sget p0, Ll/jbc0;->V3:I

    .line 270
    .line 271
    return p0

    .line 272
    :cond_16
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 273
    .line 274
    if-eqz p0, :cond_17

    .line 275
    .line 276
    sget p0, Ll/jbc0;->k7:I

    .line 277
    .line 278
    return p0

    .line 279
    :cond_17
    sget p0, Ll/jbc0;->M3:I

    .line 280
    .line 281
    return p0

    .line 282
    nop

    .line 283
    :sswitch_data_0
    .sparse-switch
        -0x7b3734d8 -> :sswitch_a
        -0x33752677 -> :sswitch_9
        -0x2883dbb6 -> :sswitch_8
        -0x199fff46 -> :sswitch_7
        -0x59a8242 -> :sswitch_6
        0x360eca -> :sswitch_5
        0x40c96131 -> :sswitch_4
        0x517a5c19 -> :sswitch_3
        0x6e276fda -> :sswitch_2
        0x6fbec22c -> :sswitch_1
        0x718d81e8 -> :sswitch_0
    .end sparse-switch

    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public final m(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "oDiamond"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(ZLcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 12
    .line 13
    const/high16 v2, 0x41400000    # 12.0f

    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 22
    .line 23
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v4, 0x1

    .line 28
    invoke-virtual {v0, v2, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 32
    .line 33
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/4 v5, 0x0

    .line 38
    invoke-virtual {v0, v2, v5}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 42
    .line 43
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2, v5}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 51
    .line 52
    iget-boolean v0, v0, Ll/eud0;->a:Z

    .line 53
    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 57
    .line 58
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v2, v4}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 66
    .line 67
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->h:Lv/VText;

    .line 77
    .line 78
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 86
    .line 87
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v2}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 95
    .line 96
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v0, v2}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 104
    .line 105
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 106
    .line 107
    const/16 v3, 0x70

    .line 108
    .line 109
    invoke-static {v2, v3}, Ll/gf5;->o(II)I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    .line 115
    .line 116
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 117
    .line 118
    iget-boolean v0, v0, Ll/eud0;->a:Z

    .line 119
    .line 120
    const/16 v2, 0x80

    .line 121
    .line 122
    if-nez v0, :cond_4

    .line 123
    .line 124
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i:Z

    .line 125
    .line 126
    if-nez v0, :cond_2

    .line 127
    .line 128
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->j:Z

    .line 129
    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 133
    .line 134
    if-eqz p1, :cond_3

    .line 135
    .line 136
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 137
    .line 138
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 142
    .line 143
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 144
    .line 145
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_2

    .line 149
    .line 150
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 151
    .line 152
    invoke-static {p1, v2}, Ll/gf5;->o(II)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 160
    .line 161
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 162
    .line 163
    invoke-static {p2, v2}, Ll/gf5;->o(II)I

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 168
    .line 169
    .line 170
    goto/16 :goto_2

    .line 171
    .line 172
    :cond_4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->p:Z

    .line 173
    .line 174
    if-eqz v0, :cond_9

    .line 175
    .line 176
    if-eqz p1, :cond_5

    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 179
    .line 180
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 181
    .line 182
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 183
    .line 184
    .line 185
    goto :goto_2

    .line 186
    :cond_5
    const-string p1, "#99DE9551"

    .line 187
    .line 188
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    const-string v0, "youthVip"

    .line 193
    .line 194
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_6

    .line 207
    .line 208
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 209
    .line 210
    invoke-static {p1, v2}, Ll/gf5;->o(II)I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    goto :goto_1

    .line 215
    :cond_6
    const-string v0, "femaleVip"

    .line 216
    .line 217
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_7

    .line 230
    .line 231
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 232
    .line 233
    invoke-static {p1, v2}, Ll/gf5;->o(II)I

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    goto :goto_1

    .line 238
    :cond_7
    const-string v0, "svip"

    .line 239
    .line 240
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 245
    .line 246
    .line 247
    move-result-object p2

    .line 248
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    if-eqz p2, :cond_8

    .line 253
    .line 254
    const-string p1, "#99F27310"

    .line 255
    .line 256
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    :cond_8
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 261
    .line 262
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 263
    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 267
    .line 268
    if-eqz p1, :cond_a

    .line 269
    .line 270
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->m:I

    .line 271
    .line 272
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 273
    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    sget v0, Ll/h9c0;->i:I

    .line 281
    .line 282
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 283
    .line 284
    .line 285
    move-result p1

    .line 286
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 287
    .line 288
    .line 289
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 290
    .line 291
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    invoke-virtual {p0, p1}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 296
    .line 297
    .line 298
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Ll/tab0;->z()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const v0, 0x3f8923a3    # 1.0714f

    .line 12
    .line 13
    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->l:Ll/eud0;

    .line 37
    .line 38
    iget-boolean p1, p1, Ll/eud0;->a:Z

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->i:Z

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 47
    .line 48
    const p2, 0x3f9b6e2f    # 1.2143f

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 88
    .line 89
    .line 90
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 91
    .line 92
    const/high16 p2, 0x3f880000    # 1.0625f

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 98
    .line 99
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleY(F)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 104
    .line 105
    const/high16 p2, 0x3f800000    # 1.0f

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->c:Lv/VText;

    .line 111
    .line 112
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 116
    .line 117
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->e:Lv/VText_AutoFit;

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->f:Lv/VText_AutoFit;

    .line 131
    .line 132
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->g:Lv/VText_AutoFit;

    .line 141
    .line 142
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleY(F)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field private bottomImage:Lv/VDraweeView;

.field private bottomTextView:Lv/VText;

.field private cornerTextView:Lv/VText;

.field private leftImage:Lv/VDraweeView;

.field private midTextView:Lv/VText;

.field private topTextView:Lv/VText;


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public h0(Ljava/lang/CharSequence;I)I
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-ge v1, v2, :cond_3

    .line 15
    .line 16
    if-gt v1, p2, :cond_2

    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->j0(C)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    add-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    return v0
.end method

.method public i0(Ljava/lang/String;Ljava/lang/String;)Ll/kus;
    .locals 3

    .line 1
    new-instance p0, Ll/kus;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kus;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, ""

    .line 13
    .line 14
    iput-object p1, p0, Ll/kus;->result:Ljava/lang/CharSequence;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-ltz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    add-int/2addr p2, p1

    .line 33
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 34
    .line 35
    const-string v2, "#FE7E1D"

    .line 36
    .line 37
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 42
    .line 43
    .line 44
    const/16 v2, 0x21

    .line 45
    .line 46
    invoke-virtual {v0, v1, p1, p2, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 47
    .line 48
    .line 49
    iput p1, p0, Ll/kus;->start:I

    .line 50
    .line 51
    iput p2, p0, Ll/kus;->end:I

    .line 52
    .line 53
    :cond_1
    iput-object v0, p0, Ll/kus;->result:Ljava/lang/CharSequence;

    .line 54
    .line 55
    return-object p0
.end method

.method public j0(C)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    const/16 p0, 0x7f

    if-gt p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public k0(Ll/zfs;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->leftImage:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Ll/zfs;->leftImageUrl:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "context_square"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomImage:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v1, p1, Ll/zfs;->bottomImageUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p1, Ll/zfs;->highLightText:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->topTextView:Lv/VText;

    .line 26
    .line 27
    iget-object v1, p1, Ll/zfs;->topText:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/vl4;->d(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->topTextView:Lv/VText;

    .line 33
    .line 34
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->midTextView:Lv/VText;

    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v3, p1, Ll/zfs;->midTextPrefix:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v3, p1, Ll/zfs;->midText:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v0, v2}, Ll/vl4;->d(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomTextView:Lv/VText;

    .line 64
    .line 65
    iget-object v2, p1, Ll/zfs;->bottomText:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0, v2}, Ll/vl4;->d(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomTextView:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object v0, p1, Ll/zfs;->topText:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p1, Ll/zfs;->highLightText:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->i0(Ljava/lang/String;Ljava/lang/String;)Ll/kus;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->topTextView:Lv/VText;

    .line 85
    .line 86
    iget-object v2, v0, Ll/kus;->result:Ljava/lang/CharSequence;

    .line 87
    .line 88
    invoke-static {v1, v2}, Ll/vl4;->c(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->topTextView:Lv/VText;

    .line 92
    .line 93
    const/16 v2, 0x18

    .line 94
    .line 95
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->l0(Landroid/widget/TextView;Ll/kus;I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p1, Ll/zfs;->midText:Ljava/lang/String;

    .line 99
    .line 100
    iget-object v1, p1, Ll/zfs;->highLightText:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->i0(Ljava/lang/String;Ljava/lang/String;)Ll/kus;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget-object v0, v0, Ll/kus;->result:Ljava/lang/CharSequence;

    .line 107
    .line 108
    iget-object v1, p1, Ll/zfs;->midTextPrefix:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_1

    .line 115
    .line 116
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 117
    .line 118
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    iget-object v2, p1, Ll/zfs;->midTextPrefix:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->midTextView:Lv/VText;

    .line 132
    .line 133
    invoke-static {v1, v0}, Ll/vl4;->c(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p1, Ll/zfs;->bottomText:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v1, p1, Ll/zfs;->highLightText:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->i0(Ljava/lang/String;Ljava/lang/String;)Ll/kus;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomTextView:Lv/VText;

    .line 145
    .line 146
    iget-object v2, v0, Ll/kus;->result:Ljava/lang/CharSequence;

    .line 147
    .line 148
    invoke-static {v1, v2}, Ll/vl4;->c(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomTextView:Lv/VText;

    .line 152
    .line 153
    const/16 v2, 0xc

    .line 154
    .line 155
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->l0(Landroid/widget/TextView;Ll/kus;I)V

    .line 156
    .line 157
    .line 158
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->cornerTextView:Lv/VText;

    .line 159
    .line 160
    iget-object p1, p1, Ll/zfs;->cornerText:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {p0, p1}, Ll/vl4;->d(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public l0(Landroid/widget/TextView;Ll/kus;I)V
    .locals 2

    .line 1
    iget v0, p2, Ll/kus;->end:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v1, p2, Ll/kus;->start:I

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p2, p2, Ll/kus;->result:Ljava/lang/CharSequence;

    .line 16
    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->h0(Ljava/lang/CharSequence;I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-le p0, p3, :cond_1

    .line 24
    .line 25
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, -0x1

    .line 31
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->i:I

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/jdc0;->Z:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/VDraweeView;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->leftImage:Lv/VDraweeView;

    .line 18
    .line 19
    sget v0, Ll/jdc0;->b1:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lv/VText;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->topTextView:Lv/VText;

    .line 28
    .line 29
    sget v0, Ll/jdc0;->n0:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VText;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->midTextView:Lv/VText;

    .line 38
    .line 39
    sget v0, Ll/jdc0;->t:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VDraweeView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomImage:Lv/VDraweeView;

    .line 48
    .line 49
    sget v0, Ll/jdc0;->u:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VText;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->bottomTextView:Lv/VText;

    .line 58
    .line 59
    sget v0, Ll/jdc0;->C:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lv/VText;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveFullLineFeedCardView;->cornerTextView:Lv/VText;

    .line 68
    .line 69
    return-void
.end method

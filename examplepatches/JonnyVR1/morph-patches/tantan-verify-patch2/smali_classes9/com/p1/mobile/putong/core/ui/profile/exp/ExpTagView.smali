.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b()V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b()V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b()V

    return-void
.end method

.method private b()V
    .locals 5

    .line 1
    const/high16 v0, 0x41200000    # 10.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroidx/cardview/widget/CardView;->setCardBackgroundColor(I)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setElevation(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Lv/AutoVDraweeView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-direct {v0, v1}, Lv/AutoVDraweeView;-><init>(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->a:Lv/AutoVDraweeView;

    .line 46
    .line 47
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 48
    .line 49
    sget v1, Ll/qa00;->o:I

    .line 50
    .line 51
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    sget v1, Ll/qa00;->f:I

    .line 55
    .line 56
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 57
    .line 58
    const/16 v1, 0x10

    .line 59
    .line 60
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->a:Lv/AutoVDraweeView;

    .line 65
    .line 66
    invoke-virtual {v1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 79
    .line 80
    const/4 v1, 0x3

    .line 81
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const/4 v2, 0x1

    .line 86
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 90
    .line 91
    const/16 v1, 0x11

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 97
    .line 98
    const/high16 v3, 0x41600000    # 14.0f

    .line 99
    .line 100
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 104
    .line 105
    const/high16 v3, -0x1000000

    .line 106
    .line 107
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 116
    .line 117
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 128
    .line 129
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 130
    .line 131
    sget v3, Ll/bnl0;->f:I

    .line 132
    .line 133
    sget v4, Ll/bnl0;->e:I

    .line 134
    .line 135
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 139
    .line 140
    sget v2, Ll/bnl0;->f:I

    .line 141
    .line 142
    const/16 v3, 0x2c

    .line 143
    .line 144
    invoke-static {v3}, Ll/qa00;->f(I)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 149
    .line 150
    .line 151
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 154
    .line 155
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method


# virtual methods
.method public e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->f()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->a:Lv/AutoVDraweeView;

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->i()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 25
    .line 26
    const p1, -0x80809

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;->b(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 2
    .line 3
    sget v1, Ll/qa00;->j:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    sget v3, Ll/qa00;->m:I

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->a:Lv/AutoVDraweeView;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h(Ljava/lang/String;IZ)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->a:Lv/AutoVDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->f()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->i()V

    .line 13
    .line 14
    .line 15
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 21
    .line 22
    if-eqz p3, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;->c()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    const/16 p1, -0x111f

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;->b(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->c:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagBgView;

    .line 2
    .line 3
    sget v1, Ll/qa00;->m:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->a:Lv/AutoVDraweeView;

    .line 10
    .line 11
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

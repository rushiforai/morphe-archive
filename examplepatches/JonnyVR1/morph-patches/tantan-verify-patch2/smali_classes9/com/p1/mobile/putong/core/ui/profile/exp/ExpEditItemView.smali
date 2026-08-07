.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b()V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b()V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final b()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    sget v1, Ll/qa00;->q:I

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0, v1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x10

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Lv/VImage;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-direct {v2, v3}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->a:Lv/VImage;

    .line 25
    .line 26
    sget v3, Ll/qa00;->o:I

    .line 27
    .line 28
    invoke-virtual {p0, v2, v3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-direct {v2, v4}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 41
    .line 42
    const/4 v4, 0x1

    .line 43
    const/high16 v5, 0x41800000    # 16.0f

    .line 44
    .line 45
    invoke-virtual {v2, v4, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/widget/TextView;->setSingleLine()V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    sget v7, Ll/c9c0;->x:I

    .line 70
    .line 71
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    .line 77
    .line 78
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .line 80
    sget v6, Ll/bnl0;->e:I

    .line 81
    .line 82
    invoke-direct {v2, v0, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 83
    .line 84
    .line 85
    const/high16 v6, 0x3f800000    # 1.0f

    .line 86
    .line 87
    iput v6, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 88
    .line 89
    sget v6, Ll/qa00;->g:I

    .line 90
    .line 91
    iput v6, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 92
    .line 93
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {p0, v6, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    new-instance v2, Lv/VText;

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-direct {v2, v6}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 105
    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 108
    .line 109
    invoke-virtual {v2, v4, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 118
    .line 119
    sget v2, Ll/qa00;->V:I

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 125
    .line 126
    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 130
    .line 131
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 135
    .line 136
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 137
    .line 138
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 142
    .line 143
    sget v2, Ll/qa00;->w:I

    .line 144
    .line 145
    sget v4, Ll/qa00;->e:I

    .line 146
    .line 147
    invoke-virtual {v1, v2, v0, v4, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 151
    .line 152
    sget v1, Ll/bnl0;->f:I

    .line 153
    .line 154
    sget v2, Ll/bnl0;->e:I

    .line 155
    .line 156
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 157
    .line 158
    .line 159
    new-instance v0, Lv/VImage;

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 166
    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d:Lv/VImage;

    .line 169
    .line 170
    sget v1, Ll/dbc0;->Ys:I

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d:Lv/VImage;

    .line 176
    .line 177
    invoke-virtual {p0, v0, v3, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public c(Ljava/lang/String;I)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/c9c0;->y:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v0, 0x1

    .line 32
    if-ne p2, v0, :cond_1

    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 35
    .line 36
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget v1, Ll/c9c0;->z:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->c:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public d(Ljava/lang/String;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->a:Lv/VImage;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getBlankTip()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getDividerView()Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->e:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->e:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->e:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditDividerView;

    .line 17
    .line 18
    return-object p0
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 p2, 0x40000000    # 2.0f

    .line 6
    .line 7
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    sget v0, Ll/qa00;->A:I

    .line 12
    .line 13
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setRightIconRes(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d:Lv/VImage;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditItemView;->d:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

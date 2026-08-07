.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/TextView;

.field public d:Lv/AutoVDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Landroid/view/View;


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


# virtual methods
.method public a(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->h:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->g:Landroid/view/View;

    .line 13
    .line 14
    sget v2, Ll/qa00;->q:I

    .line 15
    .line 16
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->g:Landroid/view/View;

    .line 20
    .line 21
    sget v3, Ll/c9c0;->W:I

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->h:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->h:Landroid/view/View;

    .line 32
    .line 33
    sget v3, Ll/c9c0;->W:I

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->i:Landroid/view/View;

    .line 39
    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->i:Landroid/view/View;

    .line 44
    .line 45
    sget v3, Ll/c9c0;->W:I

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a:Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->b:Landroid/view/View;

    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a:Landroid/widget/TextView;

    .line 66
    .line 67
    const-string v2, "\uff08  \u4f60\u7684\u60c5\u4e66\u72b6\u6001  \uff09"

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a:Landroid/widget/TextView;

    .line 73
    .line 74
    const/high16 v2, 0x41800000    # 16.0f

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a:Landroid/widget/TextView;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    sget v4, Ll/c9c0;->q0:I

    .line 86
    .line 87
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->c:Landroid/widget/TextView;

    .line 95
    .line 96
    const-string v3, "\u60c5\u4e66\u5df2\u53d1\u9001\u7ed9"

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->c:Landroid/widget/TextView;

    .line 102
    .line 103
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->c:Landroid/widget/TextView;

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    sget v4, Ll/c9c0;->q0:I

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->d:Lv/AutoVDraweeView;

    .line 122
    .line 123
    invoke-virtual {v0, p3}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->e:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->e:Landroid/widget/TextView;

    .line 132
    .line 133
    invoke-virtual {p1, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->e:Landroid/widget/TextView;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    sget v0, Ll/c9c0;->q0:I

    .line 143
    .line 144
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 145
    .line 146
    .line 147
    move-result p3

    .line 148
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 149
    .line 150
    .line 151
    const-string p1, "replied"

    .line 152
    .line 153
    invoke-static {p4, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_1

    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 160
    .line 161
    if-eqz p2, :cond_0

    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    sget p3, Ll/c9c0;->q0:I

    .line 168
    .line 169
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 177
    .line 178
    const-string p2, "\u5979\u5df2\u56de\u590d\u4f60\u7684\u60c5\u4e66"

    .line 179
    .line 180
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_0
    const-string p2, "\u4ed6\u5df2\u56de\u590d\u4f60\u7684\u60c5\u4e66"

    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 191
    .line 192
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 193
    .line 194
    .line 195
    move-result-object p3

    .line 196
    sget p4, Ll/c9c0;->W:I

    .line 197
    .line 198
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getColor(I)I

    .line 199
    .line 200
    .line 201
    move-result p3

    .line 202
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 206
    .line 207
    if-eqz p2, :cond_2

    .line 208
    .line 209
    const-string p2, "\u5979\u8fd8\u672a\u56de\u590d\u4f60\u7684\u60c5\u4e66"

    .line 210
    .line 211
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_2
    const-string p2, "\u4ed6\u8fd8\u672a\u56de\u590d\u4f60\u7684\u60c5\u4e66"

    .line 216
    .line 217
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 221
    .line 222
    invoke-virtual {p0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\uff08  "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "  \uff09"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 26
    .line 27
    const-string v3, "#FE5F1D"

    .line 28
    .line 29
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    add-int/2addr p1, v0

    .line 45
    const/16 v3, 0x21

    .line 46
    .line 47
    invoke-virtual {v1, v2, v0, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a:Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 56
    .line 57
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->Td:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    const/high16 v1, 0x3f000000    # 0.5f

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/adc0;->M6:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->b:Landroid/view/View;

    .line 26
    .line 27
    sget v0, Ll/adc0;->Sd:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->c:Landroid/widget/TextView;

    .line 36
    .line 37
    sget v0, Ll/adc0;->O:I

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lv/AutoVDraweeView;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->d:Lv/AutoVDraweeView;

    .line 46
    .line 47
    sget v0, Ll/adc0;->K8:I

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/TextView;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->e:Landroid/widget/TextView;

    .line 56
    .line 57
    sget v0, Ll/adc0;->Ud:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Landroid/widget/TextView;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->f:Landroid/widget/TextView;

    .line 66
    .line 67
    sget v0, Ll/adc0;->a7:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->g:Landroid/view/View;

    .line 74
    .line 75
    sget v0, Ll/adc0;->b7:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->h:Landroid/view/View;

    .line 82
    .line 83
    sget v0, Ll/adc0;->c7:I

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterCenterTextLayout;->i:Landroid/view/View;

    .line 90
    .line 91
    return-void
.end method

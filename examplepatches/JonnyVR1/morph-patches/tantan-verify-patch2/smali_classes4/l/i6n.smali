.class public Ll/i6n;
.super Ll/h4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h4;-><init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public h()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/rql;->m0()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget-object v0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 16
    .line 17
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 18
    .line 19
    if-eqz v2, :cond_7

    .line 20
    .line 21
    sget-object v2, Ll/qap;->Companion:Ll/qap$a;

    .line 22
    .line 23
    iget-object v3, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-virtual {v2, v0, v3}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v3, 0x3

    .line 30
    const/4 v4, 0x1

    .line 31
    if-nez v0, :cond_5

    .line 32
    .line 33
    iget-object v0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Ll/qap$a;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/rql;->n0()Landroid/widget/TextView;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 51
    .line 52
    invoke-interface {v0}, Ll/rql;->n0()Landroid/widget/TextView;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 60
    .line 61
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 69
    .line 70
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 82
    .line 83
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v1, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isNonBinary()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    iget-object v1, p0, Ll/h4;->c:Ll/rql;

    .line 96
    .line 97
    invoke-interface {v1}, Ll/rql;->getCardView()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Rf:I

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    goto :goto_0

    .line 112
    :cond_3
    iget-object v1, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    iget-object v2, p0, Ll/h4;->c:Ll/rql;

    .line 119
    .line 120
    if-eqz v1, :cond_4

    .line 121
    .line 122
    invoke-interface {v2}, Ll/rql;->getCardView()Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ld:I

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    goto :goto_0

    .line 137
    :cond_4
    invoke-interface {v2}, Ll/rql;->getCardView()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget v2, Lcom/p1/mobile/putong/core/R$string;->kd:I

    .line 146
    .line 147
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_5
    :goto_1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 156
    .line 157
    invoke-interface {v0}, Ll/rql;->n0()Landroid/widget/TextView;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    if-nez v0, :cond_6

    .line 162
    .line 163
    return v1

    .line 164
    :cond_6
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 165
    .line 166
    invoke-interface {v0}, Ll/rql;->n0()Landroid/widget/TextView;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 174
    .line 175
    invoke-interface {v0}, Ll/rql;->n0()Landroid/widget/TextView;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v0, v1, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 184
    .line 185
    .line 186
    :goto_2
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 187
    .line 188
    invoke-interface {p0}, Ll/rql;->i0()V

    .line 189
    .line 190
    .line 191
    return v4

    .line 192
    :cond_7
    return v1
.end method

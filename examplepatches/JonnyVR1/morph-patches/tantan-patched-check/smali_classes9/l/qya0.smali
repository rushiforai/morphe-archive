.class public Ll/qya0;
.super Ll/ewa0;
.source "SourceFile"


# instance fields
.field public U:Landroid/widget/TextView;

.field public V:Landroid/widget/FrameLayout;

.field public W:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ewa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/t3m;->from()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/ewa0;->u0(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ewa0;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ewa0;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public r0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qya0;->U:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Fl:I

    .line 9
    .line 10
    invoke-static {v1}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/qya0;->U:Landroid/widget/TextView;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    sget v1, Ll/dbc0;->ss:I

    .line 22
    .line 23
    invoke-static {v1}, Ll/k3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->l(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 33
    .line 34
    .line 35
    :goto_1
    iget-object v0, p0, Ll/qya0;->V:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    xor-int/lit8 v1, p1, 0x1

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/ewa0;->v:Lv/VLinear;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    sget p1, Ll/qa00;->q:I

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_2
    sget p1, Ll/qa00;->j:I

    .line 50
    .line 51
    :goto_2
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->Aa:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/qya0;->y0(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-object p1
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ewa0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qya0;->z0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final y0(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/adc0;->w8:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ewa0;->u:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    sget v0, Ll/adc0;->u8:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VLinear;

    .line 18
    .line 19
    iput-object v0, p0, Ll/ewa0;->v:Lv/VLinear;

    .line 20
    .line 21
    sget v0, Ll/adc0;->x8:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VText;

    .line 28
    .line 29
    iput-object v0, p0, Ll/ewa0;->w:Lv/VText;

    .line 30
    .line 31
    sget v0, Ll/adc0;->Da:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VRelative;

    .line 38
    .line 39
    iput-object v0, p0, Ll/ewa0;->E:Lv/VRelative;

    .line 40
    .line 41
    sget v0, Ll/adc0;->Fa:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VDraweeView;

    .line 48
    .line 49
    iput-object v0, p0, Ll/ewa0;->F:Lv/VDraweeView;

    .line 50
    .line 51
    sget v0, Ll/adc0;->Ca:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VText;

    .line 58
    .line 59
    iput-object v0, p0, Ll/ewa0;->G:Lv/VText;

    .line 60
    .line 61
    sget v0, Ll/adc0;->Ea:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VLinear;

    .line 68
    .line 69
    iput-object v0, p0, Ll/ewa0;->H:Lv/VLinear;

    .line 70
    .line 71
    sget v0, Ll/adc0;->Ha:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VText;

    .line 78
    .line 79
    iput-object v0, p0, Ll/ewa0;->I:Lv/VText;

    .line 80
    .line 81
    sget v0, Ll/adc0;->Ga:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lv/VText;

    .line 88
    .line 89
    iput-object v0, p0, Ll/ewa0;->J:Lv/VText;

    .line 90
    .line 91
    sget v0, Ll/adc0;->T5:I

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lv/VDraweeView;

    .line 98
    .line 99
    iput-object v0, p0, Ll/ewa0;->x:Lv/VDraweeView;

    .line 100
    .line 101
    sget v1, Ll/adc0;->N5:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lv/VDraweeView;

    .line 108
    .line 109
    iput-object v0, p0, Ll/ewa0;->y:Lv/VDraweeView;

    .line 110
    .line 111
    sget v0, Ll/adc0;->U5:I

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lv/VDraweeView;

    .line 118
    .line 119
    iput-object v0, p0, Ll/ewa0;->z:Lv/VDraweeView;

    .line 120
    .line 121
    sget v1, Ll/adc0;->N5:I

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lv/VDraweeView;

    .line 128
    .line 129
    iput-object v0, p0, Ll/ewa0;->A:Lv/VDraweeView;

    .line 130
    .line 131
    sget v0, Ll/adc0;->V5:I

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lv/VDraweeView;

    .line 138
    .line 139
    iput-object v0, p0, Ll/ewa0;->B:Lv/VDraweeView;

    .line 140
    .line 141
    sget v1, Ll/adc0;->N5:I

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Lv/VDraweeView;

    .line 148
    .line 149
    iput-object v0, p0, Ll/ewa0;->C:Lv/VDraweeView;

    .line 150
    .line 151
    sget v0, Ll/adc0;->j4:I

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 158
    .line 159
    iput-object v0, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 160
    .line 161
    sget v0, Ll/adc0;->U1:I

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Landroid/widget/FrameLayout;

    .line 168
    .line 169
    iput-object v0, p0, Ll/qya0;->V:Landroid/widget/FrameLayout;

    .line 170
    .line 171
    sget v0, Ll/adc0;->V1:I

    .line 172
    .line 173
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iput-object v0, p0, Ll/qya0;->W:Landroid/view/View;

    .line 178
    .line 179
    sget v0, Ll/adc0;->M:I

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iput-object v0, p0, Ll/ewa0;->K:Landroid/view/View;

    .line 186
    .line 187
    sget v0, Ll/adc0;->Fb:I

    .line 188
    .line 189
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Landroid/widget/TextView;

    .line 194
    .line 195
    iput-object v0, p0, Ll/qya0;->U:Landroid/widget/TextView;

    .line 196
    .line 197
    invoke-virtual {p0}, Ll/ewa0;->O()Ll/t3m;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-interface {v0}, Ll/t3m;->from()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    const-string v1, "from_guess_liker_result"

    .line 206
    .line 207
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-eqz v0, :cond_0

    .line 212
    .line 213
    iget-object v0, p0, Ll/qya0;->U:Landroid/widget/TextView;

    .line 214
    .line 215
    const/4 v1, 0x0

    .line 216
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    :cond_0
    sget v0, Ll/adc0;->v8:I

    .line 220
    .line 221
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    check-cast p1, Lv/VLinear;

    .line 226
    .line 227
    iput-object p1, p0, Ll/ewa0;->T:Lv/VLinear;

    .line 228
    .line 229
    return-void
.end method

.method public final z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ewa0;->w:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v1, v1, [Landroid/widget/TextView;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput-object v0, v1, v2

    .line 8
    .line 9
    invoke-static {v1}, Ll/qza0;->a([Landroid/widget/TextView;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/qya0;->U:Landroid/widget/TextView;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    sget v1, Ll/qa00;->e:I

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/xra;->o()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/ewa0;->D:Landroid/widget/RelativeLayout;

    .line 33
    .line 34
    sget v0, Ll/qa00;->j:I

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

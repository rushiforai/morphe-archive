.class public Ll/fy90;
.super Ll/dy90;
.source "SourceFile"


# instance fields
.field public S:Ll/wxa0;

.field public T:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dy90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wxa0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/wxa0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public f0(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dy90;->f0(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/wxa0;->H:Lv/VText;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/core/R$string;->fl:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public g0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dy90;->C:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/wxa0;->E:Lv/VText;

    .line 9
    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ml:I

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ll:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->il:I

    .line 23
    .line 24
    if-ne p1, v0, :cond_1

    .line 25
    .line 26
    sget p1, Lcom/p1/mobile/putong/core/R$string;->hl:I

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->nl:I

    .line 33
    .line 34
    if-ne p1, v0, :cond_2

    .line 35
    .line 36
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ol:I

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method public h0(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dy90;->h0(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/wxa0;->N:Lv/VText;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/core/R$string;->rl:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public i0(Lv/VText;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/dy90;->i0(Lv/VText;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final varargs j0([Landroid/view/View;)V
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_1

    .line 4
    .line 5
    aget-object v1, p1, v0

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 15
    .line 16
    const/16 v3, 0x10

    .line 17
    .line 18
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-void
.end method

.method public k0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/fy90;->U:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/s7m;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "risk_userid"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "e_to_other_profile_drainage_risk_notice"

    .line 22
    .line 23
    const-string v0, "p_suggest_user_profile_info_view"

    .line 24
    .line 25
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public l()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 12
    .line 13
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    xor-int/lit8 v1, v0, 0x1

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iput-boolean v1, p0, Ll/dy90;->R:Z

    .line 27
    .line 28
    return v2

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    iput-boolean v2, p0, Ll/dy90;->R:Z

    .line 46
    .line 47
    return v2

    .line 48
    :cond_1
    invoke-super {p0}, Ll/dy90;->l()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 14
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

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
    sget v1, Ll/kec0;->Fa:I

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
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/wxa0;->a(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 22
    .line 23
    iget-object v1, v0, Ll/wxa0;->a:Lv/VLinear_Dividers;

    .line 24
    .line 25
    iput-object v1, p0, Ll/dy90;->u:Lv/VLinear_Dividers;

    .line 26
    .line 27
    iget-object v1, v0, Ll/wxa0;->b:Lv/VText;

    .line 28
    .line 29
    iput-object v1, p0, Ll/dy90;->v:Lv/VText;

    .line 30
    .line 31
    iget-object v1, v0, Ll/wxa0;->t:Lv/VText;

    .line 32
    .line 33
    iput-object v1, p0, Ll/dy90;->y:Lv/VText;

    .line 34
    .line 35
    iget-object v3, v0, Ll/wxa0;->w:Lv/VText;

    .line 36
    .line 37
    iput-object v3, p0, Ll/dy90;->z:Lv/VText;

    .line 38
    .line 39
    iget-object v3, v0, Ll/wxa0;->z:Lv/VText;

    .line 40
    .line 41
    iput-object v3, p0, Ll/dy90;->A:Lv/VText;

    .line 42
    .line 43
    iget-object v3, v0, Ll/wxa0;->C:Lv/VText;

    .line 44
    .line 45
    iput-object v3, p0, Ll/dy90;->B:Lv/VText;

    .line 46
    .line 47
    iget-object v3, v0, Ll/wxa0;->F:Lv/VText;

    .line 48
    .line 49
    iput-object v3, p0, Ll/dy90;->C:Lv/VText;

    .line 50
    .line 51
    iget-object v3, v0, Ll/wxa0;->I:Lv/VText;

    .line 52
    .line 53
    iput-object v3, p0, Ll/dy90;->D:Lv/VText;

    .line 54
    .line 55
    iget-object v3, v0, Ll/wxa0;->O:Lv/VText;

    .line 56
    .line 57
    iput-object v3, p0, Ll/dy90;->G:Lv/VText;

    .line 58
    .line 59
    iget-object v4, v0, Ll/wxa0;->U:Lv/VText;

    .line 60
    .line 61
    iput-object v4, p0, Ll/dy90;->I:Lv/VText;

    .line 62
    .line 63
    iget-object v4, v0, Ll/wxa0;->a0:Lv/VText;

    .line 64
    .line 65
    iput-object v4, p0, Ll/dy90;->K:Lv/VText;

    .line 66
    .line 67
    iget-object v4, v0, Ll/wxa0;->X:Lv/VText;

    .line 68
    .line 69
    iput-object v4, p0, Ll/dy90;->J:Lv/VText;

    .line 70
    .line 71
    iget-object v4, v0, Ll/wxa0;->R:Lv/VText;

    .line 72
    .line 73
    iput-object v4, p0, Ll/dy90;->H:Lv/VText;

    .line 74
    .line 75
    iget-object v4, v0, Ll/wxa0;->h0:Lv/VText;

    .line 76
    .line 77
    iput-object v4, p0, Ll/dy90;->L:Lv/VText;

    .line 78
    .line 79
    iget-object v4, v0, Ll/wxa0;->k0:Lv/VText;

    .line 80
    .line 81
    iput-object v4, p0, Ll/dy90;->M:Lv/VText;

    .line 82
    .line 83
    iget-object v4, v0, Ll/wxa0;->n0:Lv/VText;

    .line 84
    .line 85
    iput-object v4, p0, Ll/dy90;->N:Lv/VText;

    .line 86
    .line 87
    iget-object v4, v0, Ll/wxa0;->q0:Lv/VText;

    .line 88
    .line 89
    iput-object v4, p0, Ll/dy90;->O:Lv/VText;

    .line 90
    .line 91
    iget-object v4, v0, Ll/wxa0;->t0:Lv/VText;

    .line 92
    .line 93
    iput-object v4, p0, Ll/dy90;->P:Lv/VText;

    .line 94
    .line 95
    iget-object v4, v0, Ll/wxa0;->w0:Lv/VText;

    .line 96
    .line 97
    iput-object v4, p0, Ll/dy90;->Q:Lv/VText;

    .line 98
    .line 99
    iget-object v4, v0, Ll/wxa0;->k:Lv/VText;

    .line 100
    .line 101
    iput-object v4, p0, Ll/dy90;->w:Lv/VText;

    .line 102
    .line 103
    iget-object v4, v0, Ll/wxa0;->n:Lv/VText;

    .line 104
    .line 105
    iput-object v4, p0, Ll/dy90;->x:Lv/VText;

    .line 106
    .line 107
    iget-object v4, v0, Ll/wxa0;->L:Lv/VText;

    .line 108
    .line 109
    iput-object v4, p0, Ll/dy90;->E:Lv/VText;

    .line 110
    .line 111
    iput-object v3, p0, Ll/dy90;->F:Lv/VText;

    .line 112
    .line 113
    iget-object v0, v0, Ll/wxa0;->r:Landroid/widget/LinearLayout;

    .line 114
    .line 115
    invoke-virtual {p0, v1, v0}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/dy90;->z:Lv/VText;

    .line 119
    .line 120
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 121
    .line 122
    iget-object v1, v1, Ll/wxa0;->u:Landroid/widget/LinearLayout;

    .line 123
    .line 124
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/dy90;->A:Lv/VText;

    .line 128
    .line 129
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 130
    .line 131
    iget-object v1, v1, Ll/wxa0;->x:Landroid/widget/LinearLayout;

    .line 132
    .line 133
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/dy90;->B:Lv/VText;

    .line 137
    .line 138
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 139
    .line 140
    iget-object v1, v1, Ll/wxa0;->A:Landroid/widget/LinearLayout;

    .line 141
    .line 142
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/dy90;->C:Lv/VText;

    .line 146
    .line 147
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 148
    .line 149
    iget-object v1, v1, Ll/wxa0;->D:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/dy90;->D:Lv/VText;

    .line 155
    .line 156
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 157
    .line 158
    iget-object v1, v1, Ll/wxa0;->G:Landroid/widget/LinearLayout;

    .line 159
    .line 160
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Ll/dy90;->G:Lv/VText;

    .line 164
    .line 165
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 166
    .line 167
    iget-object v1, v1, Ll/wxa0;->M:Landroid/widget/LinearLayout;

    .line 168
    .line 169
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ll/dy90;->I:Lv/VText;

    .line 173
    .line 174
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 175
    .line 176
    iget-object v1, v1, Ll/wxa0;->S:Landroid/widget/LinearLayout;

    .line 177
    .line 178
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/dy90;->K:Lv/VText;

    .line 182
    .line 183
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 184
    .line 185
    iget-object v1, v1, Ll/wxa0;->Y:Landroid/widget/LinearLayout;

    .line 186
    .line 187
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/dy90;->J:Lv/VText;

    .line 191
    .line 192
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 193
    .line 194
    iget-object v1, v1, Ll/wxa0;->V:Landroid/widget/LinearLayout;

    .line 195
    .line 196
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Ll/dy90;->H:Lv/VText;

    .line 200
    .line 201
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 202
    .line 203
    iget-object v1, v1, Ll/wxa0;->P:Landroid/widget/LinearLayout;

    .line 204
    .line 205
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Ll/dy90;->L:Lv/VText;

    .line 209
    .line 210
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 211
    .line 212
    iget-object v1, v1, Ll/wxa0;->h0:Lv/VText;

    .line 213
    .line 214
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ll/dy90;->M:Lv/VText;

    .line 218
    .line 219
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 220
    .line 221
    iget-object v1, v1, Ll/wxa0;->i0:Landroid/widget/LinearLayout;

    .line 222
    .line 223
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Ll/dy90;->N:Lv/VText;

    .line 227
    .line 228
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 229
    .line 230
    iget-object v1, v1, Ll/wxa0;->l0:Landroid/widget/LinearLayout;

    .line 231
    .line 232
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/dy90;->O:Lv/VText;

    .line 236
    .line 237
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 238
    .line 239
    iget-object v1, v1, Ll/wxa0;->o0:Landroid/widget/LinearLayout;

    .line 240
    .line 241
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/dy90;->P:Lv/VText;

    .line 245
    .line 246
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 247
    .line 248
    iget-object v1, v1, Ll/wxa0;->r0:Landroid/widget/LinearLayout;

    .line 249
    .line 250
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 254
    .line 255
    iget-object v1, v0, Ll/wxa0;->g0:Lv/VText;

    .line 256
    .line 257
    iget-object v0, v0, Ll/wxa0;->e0:Landroid/widget/LinearLayout;

    .line 258
    .line 259
    invoke-virtual {p0, v1, v0}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Ll/dy90;->w:Lv/VText;

    .line 263
    .line 264
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 265
    .line 266
    iget-object v1, v1, Ll/wxa0;->k:Lv/VText;

    .line 267
    .line 268
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Ll/dy90;->x:Lv/VText;

    .line 272
    .line 273
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 274
    .line 275
    iget-object v1, v1, Ll/wxa0;->n:Lv/VText;

    .line 276
    .line 277
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 278
    .line 279
    .line 280
    iget-object v0, p0, Ll/dy90;->E:Lv/VText;

    .line 281
    .line 282
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 283
    .line 284
    iget-object v1, v1, Ll/wxa0;->J:Landroid/widget/LinearLayout;

    .line 285
    .line 286
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 287
    .line 288
    .line 289
    iget-object v0, p0, Ll/dy90;->F:Lv/VText;

    .line 290
    .line 291
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 292
    .line 293
    iget-object v1, v1, Ll/wxa0;->M:Landroid/widget/LinearLayout;

    .line 294
    .line 295
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 296
    .line 297
    .line 298
    iget-object v0, p0, Ll/dy90;->Q:Lv/VText;

    .line 299
    .line 300
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 301
    .line 302
    iget-object v1, v1, Ll/wxa0;->u0:Landroid/widget/LinearLayout;

    .line 303
    .line 304
    invoke-virtual {p0, v0, v1}, Ll/ep90;->E(Landroid/view/View;Landroid/view/View;)V

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 308
    .line 309
    iget-object v1, p0, Ll/dy90;->y:Lv/VText;

    .line 310
    .line 311
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 312
    .line 313
    iget-object v3, v3, Ll/wxa0;->r:Landroid/widget/LinearLayout;

    .line 314
    .line 315
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 319
    .line 320
    iget-object v1, p0, Ll/dy90;->z:Lv/VText;

    .line 321
    .line 322
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 323
    .line 324
    iget-object v3, v3, Ll/wxa0;->u:Landroid/widget/LinearLayout;

    .line 325
    .line 326
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 330
    .line 331
    iget-object v1, p0, Ll/dy90;->A:Lv/VText;

    .line 332
    .line 333
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 334
    .line 335
    iget-object v3, v3, Ll/wxa0;->x:Landroid/widget/LinearLayout;

    .line 336
    .line 337
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 341
    .line 342
    iget-object v1, p0, Ll/dy90;->B:Lv/VText;

    .line 343
    .line 344
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 345
    .line 346
    iget-object v3, v3, Ll/wxa0;->A:Landroid/widget/LinearLayout;

    .line 347
    .line 348
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 352
    .line 353
    iget-object v1, p0, Ll/dy90;->C:Lv/VText;

    .line 354
    .line 355
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 356
    .line 357
    iget-object v3, v3, Ll/wxa0;->D:Landroid/widget/LinearLayout;

    .line 358
    .line 359
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 363
    .line 364
    iget-object v1, p0, Ll/dy90;->D:Lv/VText;

    .line 365
    .line 366
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 367
    .line 368
    iget-object v3, v3, Ll/wxa0;->G:Landroid/widget/LinearLayout;

    .line 369
    .line 370
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 374
    .line 375
    iget-object v1, p0, Ll/dy90;->G:Lv/VText;

    .line 376
    .line 377
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 378
    .line 379
    iget-object v3, v3, Ll/wxa0;->M:Landroid/widget/LinearLayout;

    .line 380
    .line 381
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 385
    .line 386
    iget-object v1, p0, Ll/dy90;->I:Lv/VText;

    .line 387
    .line 388
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 389
    .line 390
    iget-object v3, v3, Ll/wxa0;->S:Landroid/widget/LinearLayout;

    .line 391
    .line 392
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 396
    .line 397
    iget-object v1, p0, Ll/dy90;->K:Lv/VText;

    .line 398
    .line 399
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 400
    .line 401
    iget-object v3, v3, Ll/wxa0;->Y:Landroid/widget/LinearLayout;

    .line 402
    .line 403
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 407
    .line 408
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 409
    .line 410
    iget-object v3, v1, Ll/wxa0;->g0:Lv/VText;

    .line 411
    .line 412
    iget-object v1, v1, Ll/wxa0;->e0:Landroid/widget/LinearLayout;

    .line 413
    .line 414
    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 418
    .line 419
    iget-object v1, p0, Ll/dy90;->J:Lv/VText;

    .line 420
    .line 421
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 422
    .line 423
    iget-object v3, v3, Ll/wxa0;->V:Landroid/widget/LinearLayout;

    .line 424
    .line 425
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 429
    .line 430
    iget-object v1, p0, Ll/dy90;->H:Lv/VText;

    .line 431
    .line 432
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 433
    .line 434
    iget-object v3, v3, Ll/wxa0;->P:Landroid/widget/LinearLayout;

    .line 435
    .line 436
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 440
    .line 441
    iget-object v1, p0, Ll/dy90;->L:Lv/VText;

    .line 442
    .line 443
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 444
    .line 445
    iget-object v3, v3, Ll/wxa0;->h0:Lv/VText;

    .line 446
    .line 447
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 451
    .line 452
    iget-object v1, p0, Ll/dy90;->M:Lv/VText;

    .line 453
    .line 454
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 455
    .line 456
    iget-object v3, v3, Ll/wxa0;->i0:Landroid/widget/LinearLayout;

    .line 457
    .line 458
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 462
    .line 463
    iget-object v1, p0, Ll/dy90;->N:Lv/VText;

    .line 464
    .line 465
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 466
    .line 467
    iget-object v3, v3, Ll/wxa0;->l0:Landroid/widget/LinearLayout;

    .line 468
    .line 469
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 473
    .line 474
    iget-object v1, p0, Ll/dy90;->O:Lv/VText;

    .line 475
    .line 476
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 477
    .line 478
    iget-object v3, v3, Ll/wxa0;->o0:Landroid/widget/LinearLayout;

    .line 479
    .line 480
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 484
    .line 485
    iget-object v1, p0, Ll/dy90;->P:Lv/VText;

    .line 486
    .line 487
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 488
    .line 489
    iget-object v3, v3, Ll/wxa0;->r0:Landroid/widget/LinearLayout;

    .line 490
    .line 491
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 495
    .line 496
    iget-object v1, p0, Ll/dy90;->w:Lv/VText;

    .line 497
    .line 498
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 499
    .line 500
    iget-object v3, v3, Ll/wxa0;->k:Lv/VText;

    .line 501
    .line 502
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 506
    .line 507
    iget-object v1, p0, Ll/dy90;->x:Lv/VText;

    .line 508
    .line 509
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 510
    .line 511
    iget-object v3, v3, Ll/wxa0;->n:Lv/VText;

    .line 512
    .line 513
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 517
    .line 518
    iget-object v1, p0, Ll/dy90;->E:Lv/VText;

    .line 519
    .line 520
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 521
    .line 522
    iget-object v3, v3, Ll/wxa0;->J:Landroid/widget/LinearLayout;

    .line 523
    .line 524
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 528
    .line 529
    iget-object v1, p0, Ll/dy90;->F:Lv/VText;

    .line 530
    .line 531
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 532
    .line 533
    iget-object v3, v3, Ll/wxa0;->M:Landroid/widget/LinearLayout;

    .line 534
    .line 535
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    iget-object v0, p0, Ll/fy90;->T:Ljava/util/HashMap;

    .line 539
    .line 540
    iget-object v1, p0, Ll/dy90;->Q:Lv/VText;

    .line 541
    .line 542
    iget-object v3, p0, Ll/fy90;->S:Ll/wxa0;

    .line 543
    .line 544
    iget-object v3, v3, Ll/wxa0;->u0:Landroid/widget/LinearLayout;

    .line 545
    .line 546
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 550
    .line 551
    .line 552
    move-result v0

    .line 553
    if-eqz v0, :cond_0

    .line 554
    .line 555
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    const-string v1, "ru"

    .line 560
    .line 561
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 562
    .line 563
    .line 564
    move-result v0

    .line 565
    if-eqz v0, :cond_0

    .line 566
    .line 567
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 568
    .line 569
    iget-object v1, v0, Ll/wxa0;->g:Lv/VText;

    .line 570
    .line 571
    iget-object v3, v0, Ll/wxa0;->p:Lv/VText;

    .line 572
    .line 573
    iget-object v4, v0, Ll/wxa0;->v:Lv/VText;

    .line 574
    .line 575
    iget-object v5, v0, Ll/wxa0;->y:Lv/VText;

    .line 576
    .line 577
    iget-object v6, v0, Ll/wxa0;->B:Lv/VText;

    .line 578
    .line 579
    iget-object v7, v0, Ll/wxa0;->E:Lv/VText;

    .line 580
    .line 581
    iget-object v8, v0, Ll/wxa0;->H:Lv/VText;

    .line 582
    .line 583
    iget-object v9, v0, Ll/wxa0;->K:Lv/VText;

    .line 584
    .line 585
    iget-object v10, v0, Ll/wxa0;->N:Lv/VText;

    .line 586
    .line 587
    iget-object v11, v0, Ll/wxa0;->T:Lv/VText;

    .line 588
    .line 589
    iget-object v12, v0, Ll/wxa0;->Z:Lv/VText;

    .line 590
    .line 591
    iget-object v0, v0, Ll/wxa0;->f0:Lv/VText;

    .line 592
    .line 593
    const/16 v13, 0xc

    .line 594
    .line 595
    new-array v13, v13, [Landroid/view/View;

    .line 596
    .line 597
    aput-object v1, v13, v2

    .line 598
    .line 599
    const/4 v1, 0x1

    .line 600
    aput-object v3, v13, v1

    .line 601
    .line 602
    const/4 v1, 0x2

    .line 603
    aput-object v4, v13, v1

    .line 604
    .line 605
    const/4 v1, 0x3

    .line 606
    aput-object v5, v13, v1

    .line 607
    .line 608
    const/4 v1, 0x4

    .line 609
    aput-object v6, v13, v1

    .line 610
    .line 611
    const/4 v1, 0x5

    .line 612
    aput-object v7, v13, v1

    .line 613
    .line 614
    const/4 v1, 0x6

    .line 615
    aput-object v8, v13, v1

    .line 616
    .line 617
    const/4 v1, 0x7

    .line 618
    aput-object v9, v13, v1

    .line 619
    .line 620
    const/16 v1, 0x8

    .line 621
    .line 622
    aput-object v10, v13, v1

    .line 623
    .line 624
    const/16 v1, 0x9

    .line 625
    .line 626
    aput-object v11, v13, v1

    .line 627
    .line 628
    const/16 v1, 0xa

    .line 629
    .line 630
    aput-object v12, v13, v1

    .line 631
    .line 632
    const/16 v1, 0xb

    .line 633
    .line 634
    aput-object v0, v13, v1

    .line 635
    .line 636
    invoke-virtual {p0, v13}, Ll/fy90;->j0([Landroid/view/View;)V

    .line 637
    .line 638
    .line 639
    :cond_0
    return-object p1
.end method

.method public t()V
    .locals 8

    .line 1
    invoke-super {p0}, Ll/dy90;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 15
    .line 16
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x0

    .line 35
    const/4 v4, 0x1

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 39
    .line 40
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-interface {v2, v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    move v2, v4

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v2, v3

    .line 55
    :goto_0
    if-eqz v2, :cond_9

    .line 56
    .line 57
    iget-object v5, p0, Ll/fy90;->S:Ll/wxa0;

    .line 58
    .line 59
    iget-object v5, v5, Ll/wxa0;->c:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    iget-object v6, v6, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 68
    .line 69
    iget-object v6, v6, Lcom/p1/mobile/putong/data/IntlMoreGender;->showOnProfile:Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    if-eqz v6, :cond_1

    .line 76
    .line 77
    move v6, v4

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    move v6, v3

    .line 80
    :goto_1
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    const/4 v5, 0x0

    .line 84
    if-nez v1, :cond_2

    .line 85
    .line 86
    move-object v1, v5

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 93
    .line 94
    :goto_2
    if-nez v1, :cond_3

    .line 95
    .line 96
    move-object v6, v5

    .line 97
    goto :goto_3

    .line 98
    :cond_3
    iget-object v6, v1, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 99
    .line 100
    :goto_3
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-interface {v7}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    iget-object v7, v7, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 109
    .line 110
    if-eqz v2, :cond_4

    .line 111
    .line 112
    if-nez v6, :cond_5

    .line 113
    .line 114
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-static {v6}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    goto :goto_4

    .line 123
    :cond_4
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-static {v6}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    :cond_5
    :goto_4
    if-nez v1, :cond_6

    .line 132
    .line 133
    goto :goto_5

    .line 134
    :cond_6
    if-eqz v2, :cond_7

    .line 135
    .line 136
    iget-object v5, v1, Lcom/p1/mobile/putong/data/IntlMoreGender;->subGender:Ljava/lang/String;

    .line 137
    .line 138
    :cond_7
    :goto_5
    if-nez v5, :cond_8

    .line 139
    .line 140
    const-string v5, ""

    .line 141
    .line 142
    :cond_8
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 143
    .line 144
    iget-object v1, v1, Ll/wxa0;->e:Lv/VText;

    .line 145
    .line 146
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 147
    .line 148
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 149
    .line 150
    invoke-interface {v2, v6, v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Lr(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    :cond_9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    const/16 v2, 0x8

    .line 162
    .line 163
    if-nez v1, :cond_b

    .line 164
    .line 165
    invoke-static {}, Ll/r43;->b()Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_a

    .line 170
    .line 171
    goto :goto_6

    .line 172
    :cond_a
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 173
    .line 174
    iget-object v1, v1, Ll/wxa0;->q:Lv/VText;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 180
    .line 181
    iget-object v0, v0, Ll/wxa0;->o:Landroid/widget/LinearLayout;

    .line 182
    .line 183
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/dy90;->u:Lv/VLinear_Dividers;

    .line 187
    .line 188
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 189
    .line 190
    .line 191
    goto :goto_7

    .line 192
    :cond_b
    :goto_6
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 193
    .line 194
    iget-object v0, v0, Ll/wxa0;->o:Landroid/widget/LinearLayout;

    .line 195
    .line 196
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 197
    .line 198
    .line 199
    :goto_7
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    iget-object v5, p0, Ll/fy90;->S:Ll/wxa0;

    .line 214
    .line 215
    if-eqz v1, :cond_c

    .line 216
    .line 217
    iget-object v0, v5, Ll/wxa0;->e0:Landroid/widget/LinearLayout;

    .line 218
    .line 219
    invoke-virtual {p0, v0, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 220
    .line 221
    .line 222
    goto :goto_8

    .line 223
    :cond_c
    iget-object v1, v5, Ll/wxa0;->e0:Landroid/widget/LinearLayout;

    .line 224
    .line 225
    invoke-virtual {p0, v1, v3}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 226
    .line 227
    .line 228
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 229
    .line 230
    iget-object v1, v1, Ll/wxa0;->g0:Lv/VText;

    .line 231
    .line 232
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    :goto_8
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 236
    .line 237
    iget-object v0, v0, Ll/wxa0;->b:Lv/VText;

    .line 238
    .line 239
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 245
    .line 246
    iget-object v0, v0, Ll/wxa0;->B:Lv/VText;

    .line 247
    .line 248
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 249
    .line 250
    sget v2, Lcom/p1/mobile/putong/core/R$string;->kl:I

    .line 251
    .line 252
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    .line 258
    .line 259
    invoke-static {}, Ll/r43;->b()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    const-string v1, "unknown_"

    .line 264
    .line 265
    if-eqz v0, :cond_d

    .line 266
    .line 267
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 276
    .line 277
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 278
    .line 279
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 280
    .line 281
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 282
    .line 283
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    if-nez v2, :cond_d

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 292
    .line 293
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 294
    .line 295
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    check-cast v0, Lcom/p1/mobile/putong/data/BloodType;

    .line 300
    .line 301
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    if-nez v0, :cond_d

    .line 306
    .line 307
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 308
    .line 309
    iget-object v0, v0, Ll/wxa0;->r:Landroid/widget/LinearLayout;

    .line 310
    .line 311
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 312
    .line 313
    .line 314
    :cond_d
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->j()Z

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    if-eqz v0, :cond_f

    .line 319
    .line 320
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 329
    .line 330
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    if-eqz v2, :cond_f

    .line 335
    .line 336
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 337
    .line 338
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result v2

    .line 342
    if-eqz v2, :cond_f

    .line 343
    .line 344
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 345
    .line 346
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 347
    .line 348
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    if-eqz v2, :cond_f

    .line 353
    .line 354
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 355
    .line 356
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 357
    .line 358
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 359
    .line 360
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 361
    .line 362
    .line 363
    move-result v2

    .line 364
    if-nez v2, :cond_e

    .line 365
    .line 366
    iget-object v2, p0, Ll/fy90;->S:Ll/wxa0;

    .line 367
    .line 368
    iget-object v2, v2, Ll/wxa0;->i:Landroid/widget/LinearLayout;

    .line 369
    .line 370
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 371
    .line 372
    .line 373
    :cond_e
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 374
    .line 375
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 376
    .line 377
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 378
    .line 379
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-nez v0, :cond_f

    .line 384
    .line 385
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 386
    .line 387
    iget-object v0, v0, Ll/wxa0;->l:Landroid/widget/LinearLayout;

    .line 388
    .line 389
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 390
    .line 391
    .line 392
    :cond_f
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 401
    .line 402
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    if-eqz v2, :cond_12

    .line 407
    .line 408
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 409
    .line 410
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result v2

    .line 414
    if-eqz v2, :cond_12

    .line 415
    .line 416
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 417
    .line 418
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 419
    .line 420
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 421
    .line 422
    .line 423
    move-result v2

    .line 424
    iget-object v5, p0, Ll/fy90;->S:Ll/wxa0;

    .line 425
    .line 426
    if-nez v2, :cond_10

    .line 427
    .line 428
    iget-object v2, v5, Ll/wxa0;->M:Landroid/widget/LinearLayout;

    .line 429
    .line 430
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 431
    .line 432
    .line 433
    goto :goto_9

    .line 434
    :cond_10
    iget-object v2, v5, Ll/wxa0;->M:Landroid/widget/LinearLayout;

    .line 435
    .line 436
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 437
    .line 438
    .line 439
    :goto_9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 440
    .line 441
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 442
    .line 443
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 448
    .line 449
    if-nez v0, :cond_11

    .line 450
    .line 451
    iget-object v0, v1, Ll/wxa0;->J:Landroid/widget/LinearLayout;

    .line 452
    .line 453
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 454
    .line 455
    .line 456
    goto :goto_a

    .line 457
    :cond_11
    iget-object v0, v1, Ll/wxa0;->J:Landroid/widget/LinearLayout;

    .line 458
    .line 459
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 460
    .line 461
    .line 462
    :cond_12
    :goto_a
    invoke-virtual {p0}, Ll/dy90;->O()Ll/t3m;

    .line 463
    .line 464
    .line 465
    move-result-object v0

    .line 466
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 471
    .line 472
    .line 473
    move-result v1

    .line 474
    if-eqz v1, :cond_13

    .line 475
    .line 476
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 477
    .line 478
    iget-object v1, v1, Ll/wxa0;->b0:Landroid/widget/LinearLayout;

    .line 479
    .line 480
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 481
    .line 482
    .line 483
    iget-object v1, p0, Ll/fy90;->S:Ll/wxa0;

    .line 484
    .line 485
    iget-object v1, v1, Ll/wxa0;->d0:Lv/VText;

    .line 486
    .line 487
    iget-wide v2, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 488
    .line 489
    double-to-long v2, v2

    .line 490
    invoke-static {v2, v3}, Ll/pzi0;->m(J)Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 495
    .line 496
    .line 497
    :cond_13
    iget-object v0, p0, Ll/fy90;->U:Ljava/lang/String;

    .line 498
    .line 499
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-nez v0, :cond_14

    .line 504
    .line 505
    iget-object v0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 506
    .line 507
    iget-object v0, v0, Ll/wxa0;->y0:Lv/VText;

    .line 508
    .line 509
    iget-object v1, p0, Ll/fy90;->U:Ljava/lang/String;

    .line 510
    .line 511
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 512
    .line 513
    .line 514
    iget-object p0, p0, Ll/fy90;->S:Ll/wxa0;

    .line 515
    .line 516
    iget-object p0, p0, Ll/wxa0;->x0:Landroid/widget/LinearLayout;

    .line 517
    .line 518
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 519
    .line 520
    .line 521
    :cond_14
    return-void
.end method

.class public Ll/cs90;
.super Ll/rwa0;
.source "SourceFile"


# instance fields
.field public A:Lv/VLinear;

.field public B:Lv/VImage;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Lv/VText;

.field public I:Ll/w30;

.field public u:Lv/VLinear;

.field public v:Lv/VText;

.field public w:Lv/VImage;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public y:Lv/VLinear;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/rwa0;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Ll/cs90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cs90;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Ll/cs90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cs90;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z(Ll/cs90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cs90;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a0(Ll/cs90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cs90;->h0()V

    return-void
.end method

.method public static synthetic b0(Ll/cs90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cs90;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c0(Ll/cs90;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cs90;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d0(Ll/cs90;)Ll/w30;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cs90;->I:Ll/w30;

    return-object p0
.end method

.method public static bridge synthetic e0(Ll/cs90;Ll/w30;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cs90;->I:Ll/w30;

    return-void
.end method

.method private g0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Ll/gra;->L3()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x1

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v1}, Ll/gj40;->w(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2, v0, v1, v3}, Ll/gj40;->A(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    const/4 v4, 0x0

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    iget-object v2, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 57
    .line 58
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Ll/cs90;->y:Lv/VLinear;

    .line 62
    .line 63
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ll/cs90;->A:Lv/VLinear;

    .line 67
    .line 68
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Ll/cs90;->w:Lv/VImage;

    .line 72
    .line 73
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 77
    .line 78
    const/4 v5, 0x3

    .line 79
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setMaxLines(I)V

    .line 80
    .line 81
    .line 82
    iget-object v2, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 83
    .line 84
    new-instance v5, Ll/as90;

    .line 85
    .line 86
    invoke-direct {v5, p0}, Ll/as90;-><init>(Ll/cs90;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setCallBack(Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/rwa0;->U(Lcom/p1/mobile/putong/core/data/UserTagsData;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_1
    iget-object v2, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 103
    .line 104
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Ll/cs90;->y:Lv/VLinear;

    .line 108
    .line 109
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Ll/cs90;->A:Lv/VLinear;

    .line 113
    .line 114
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object v2, p0, Ll/cs90;->w:Lv/VImage;

    .line 118
    .line 119
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    :goto_1
    invoke-static {}, Ll/gra;->L3()Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_2

    .line 133
    .line 134
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 135
    .line 136
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-nez v2, :cond_2

    .line 141
    .line 142
    iget-object v2, p0, Ll/cs90;->A:Lv/VLinear;

    .line 143
    .line 144
    sget v5, Ll/dbc0;->G6:I

    .line 145
    .line 146
    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Ll/cs90;->B:Lv/VImage;

    .line 150
    .line 151
    sget v5, Ll/dbc0;->Bn:I

    .line 152
    .line 153
    invoke-virtual {v2, v5}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Ll/cs90;->D:Lv/VText;

    .line 157
    .line 158
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    iget-object v2, p0, Ll/cs90;->D:Lv/VText;

    .line 162
    .line 163
    new-instance v5, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v6, "\u5171"

    .line 166
    .line 167
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v0, "\u4e2a"

    .line 180
    .line 181
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_2
    iget-object v0, p0, Ll/cs90;->D:Lv/VText;

    .line 193
    .line 194
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    :goto_2
    invoke-static {}, Ll/gra;->L3()Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_4

    .line 202
    .line 203
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0, v1}, Ll/gj40;->v(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-nez v0, :cond_3

    .line 216
    .line 217
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 218
    .line 219
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    const/16 v1, 0x9

    .line 224
    .line 225
    if-ge v0, v1, :cond_3

    .line 226
    .line 227
    iget-object p0, p0, Ll/cs90;->E:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 228
    .line 229
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 230
    .line 231
    .line 232
    const-string p0, "p_edit_profile_view"

    .line 233
    .line 234
    new-array v0, v4, [Ll/sfj0$a;

    .line 235
    .line 236
    const-string v1, "e_tag_add_photo_guidance"

    .line 237
    .line 238
    invoke-static {v1, p0, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_3
    iget-object p0, p0, Ll/cs90;->E:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 243
    .line 244
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_4
    iget-object p0, p0, Ll/cs90;->E:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 249
    .line 250
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    return-void
.end method

.method private synthetic h0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cs90;->A:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/gra;->L3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/cs90;->A:Lv/VLinear;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic i0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    const/16 v2, 0xbb9

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2, p0, v1}, Ll/gj40;->H(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/putong/data/User;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic j0(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array v0, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_tag_add_photo_guidance"

    .line 5
    .line 6
    const-string v2, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/a2i0;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 37
    .line 38
    invoke-static {p0, p1, p1}, Ll/y1i0;->M(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic k0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "p_edit_profile_view"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/16 v2, 0xbb9

    .line 17
    .line 18
    invoke-virtual {p1, p0, v2, v0, v1}, Ll/gj40;->D(Lcom/p1/mobile/android/app/Frag;ILjava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "p_edit_profile_view"

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/16 v2, 0xbb9

    .line 17
    .line 18
    invoke-virtual {p1, p0, v2, v0, v1}, Ll/gj40;->D(Lcom/p1/mobile/android/app/Frag;ILjava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    const/16 v2, 0xbb9

    .line 23
    .line 24
    invoke-virtual {p1, v0, v2, p0, v1}, Ll/gj40;->G(Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/putong/data/User;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public T(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/rwa0;->T(Lcom/p1/mobile/putong/core/data/UserTagsData;Lcom/p1/mobile/putong/core/data/UserTagData;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/cs90$a;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Ll/cs90$a;-><init>(Ll/cs90;Lcom/p1/mobile/putong/core/data/UserTagData;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public f0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ds90;->b(Ll/cs90;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cs90;->v:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/cs90;->C:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/cs90;->z:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public l()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/gra;->L3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p0}, Ll/gj40;->w(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/core/data/UserTagsData;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserTagsData;->tags:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    :cond_0
    return v1
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    invoke-virtual {p0, v0, p1}, Ll/cs90;->f0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/cs90;->x:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-direct {p0}, Ll/cs90;->g0()V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/gra;->L3()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Ll/cs90;->u:Lv/VLinear;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    new-instance v0, Ll/vr90;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/vr90;-><init>(Ll/cs90;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/cs90;->E:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 39
    .line 40
    new-instance v1, Ll/wr90;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/wr90;-><init>(Ll/cs90;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance v0, Ll/xr90;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/xr90;-><init>(Ll/cs90;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/cs90;->y:Lv/VLinear;

    .line 58
    .line 59
    new-instance v1, Ll/yr90;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/yr90;-><init>(Ll/cs90;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/cs90;->A:Lv/VLinear;

    .line 68
    .line 69
    new-instance v1, Ll/zr90;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/zr90;-><init>(Ll/cs90;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

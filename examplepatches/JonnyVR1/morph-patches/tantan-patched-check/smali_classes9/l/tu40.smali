.class public Ll/tu40;
.super Ll/lp90;
.source "SourceFile"


# instance fields
.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/view/View;

.field public g:Lv/VLinear;

.field public h:Lv/VLinear;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VImage;

.field public k:Landroid/widget/RelativeLayout;

.field public l:Lv/VImage;

.field public m:Landroid/widget/RelativeLayout;

.field public n:Lv/VImage;

.field public o:Lv/VLinear;

.field public p:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public q:Landroid/widget/RelativeLayout;

.field public r:Lv/VImage;

.field public s:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/lp90;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/qa00;->o:I

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic m(Ll/tu40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tu40;->p()V

    return-void
.end method


# virtual methods
.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tu40;->f:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lp90;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/tu40$b;->a:[I

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    aget p1, v1, p1

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-eq p1, v1, :cond_4

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    if-eq p1, v1, :cond_3

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    if-eq p1, v1, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    if-eq p1, v1, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x5

    .line 33
    if-eq p1, v1, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :cond_0
    iget-object p0, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    iget-object p0, p0, Ll/tu40;->o:Lv/VLinear;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    iget-object p0, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_3
    iget-object p0, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_4
    iget-object p0, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;->SuperLike:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 6
    .line 7
    iget-object v0, p0, Ll/lp90;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;->b(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-super {p0, p1, p2}, Ll/lp90;->f(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton$ProfileButtonType;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;)Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/ProfileButton;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public g()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lp90;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/tu40;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lp90;->h(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/lp90;->b(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/lp90;->b(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/lp90;->b(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/lp90;->b(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/tu40;->o()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tu40;->p:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/R$string;->qg:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/tu40$b;->b:[I

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;->a()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    aget p1, v0, p1

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    const/4 v1, 0x0

    .line 28
    packed-switch p1, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :pswitch_0
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 54
    .line 55
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 59
    .line 60
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 70
    .line 71
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 81
    .line 82
    invoke-static {p1, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :pswitch_1
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 88
    .line 89
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 93
    .line 94
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 98
    .line 99
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 103
    .line 104
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 108
    .line 109
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :pswitch_2
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 115
    .line 116
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 120
    .line 121
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 125
    .line 126
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 130
    .line 131
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 135
    .line 136
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 140
    .line 141
    invoke-static {p1, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 142
    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :pswitch_3
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 147
    .line 148
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 152
    .line 153
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 157
    .line 158
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 162
    .line 163
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 167
    .line 168
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :pswitch_4
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 174
    .line 175
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 179
    .line 180
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 184
    .line 185
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 189
    .line 190
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 194
    .line 195
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/tu40;->p:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 199
    .line 200
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 201
    .line 202
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Pg:I

    .line 203
    .line 204
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :pswitch_5
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 214
    .line 215
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 219
    .line 220
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 224
    .line 225
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 229
    .line 230
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 234
    .line 235
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 239
    .line 240
    invoke-static {p1, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 241
    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :pswitch_6
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 246
    .line 247
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 251
    .line 252
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 256
    .line 257
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 258
    .line 259
    .line 260
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 261
    .line 262
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 266
    .line 267
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Ll/tu40;->p:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 271
    .line 272
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 273
    .line 274
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Pg:I

    .line 275
    .line 276
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 281
    .line 282
    .line 283
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 284
    .line 285
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 286
    .line 287
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 292
    .line 293
    .line 294
    goto :goto_0

    .line 295
    :pswitch_7
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 296
    .line 297
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 298
    .line 299
    .line 300
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 301
    .line 302
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 303
    .line 304
    .line 305
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 306
    .line 307
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 308
    .line 309
    .line 310
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 311
    .line 312
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 313
    .line 314
    .line 315
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 316
    .line 317
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 318
    .line 319
    .line 320
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 321
    .line 322
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 323
    .line 324
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 329
    .line 330
    .line 331
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 332
    .line 333
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 334
    .line 335
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 340
    .line 341
    .line 342
    goto :goto_0

    .line 343
    :pswitch_8
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 344
    .line 345
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 346
    .line 347
    .line 348
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 349
    .line 350
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 351
    .line 352
    .line 353
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 354
    .line 355
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 356
    .line 357
    .line 358
    iget-object p1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 359
    .line 360
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 361
    .line 362
    .line 363
    iget-object p1, p0, Ll/tu40;->q:Landroid/widget/RelativeLayout;

    .line 364
    .line 365
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 366
    .line 367
    .line 368
    iget-object p1, p0, Ll/tu40;->i:Landroid/widget/RelativeLayout;

    .line 369
    .line 370
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 371
    .line 372
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 377
    .line 378
    .line 379
    iget-object p1, p0, Ll/tu40;->k:Landroid/widget/RelativeLayout;

    .line 380
    .line 381
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 382
    .line 383
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 388
    .line 389
    .line 390
    iget-object p1, p0, Ll/tu40;->m:Landroid/widget/RelativeLayout;

    .line 391
    .line 392
    iget-object v0, p0, Ll/tu40;->s:Ljava/lang/Integer;

    .line 393
    .line 394
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 399
    .line 400
    .line 401
    :goto_0
    invoke-virtual {p0}, Ll/tu40;->q()V

    .line 402
    .line 403
    .line 404
    return-void

    .line 405
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uu40;->b(Ll/tu40;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final o()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/tu40;->n:Lv/VImage;

    .line 8
    .line 9
    iget-object v1, p0, Ll/tu40;->j:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/dbc0;->Gs:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/tu40;->l:Lv/VImage;

    .line 25
    .line 26
    iget-object p0, p0, Ll/lp90;->c:Landroid/content/Context;

    .line 27
    .line 28
    sget v1, Ll/dbc0;->Hs:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic p()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/tu40;->o:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Ll/tu40;->e:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    iget-object p0, p0, Ll/tu40;->o:Lv/VLinear;

    .line 14
    .line 15
    const/16 v3, 0xbb8

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, p0, v3}, Lcom/p1/mobile/putong/core/ui/match/a;->T(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tu40;->o:Lv/VLinear;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/a;->N()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/match/a;->a:Z

    .line 27
    .line 28
    iget-object v0, p0, Ll/tu40;->o:Lv/VLinear;

    .line 29
    .line 30
    new-instance v1, Ll/qu40;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/qu40;-><init>(Ll/tu40;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public r(Ll/zq90;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/tu40;->l:Lv/VImage;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 24
    .line 25
    const-string v1, "male"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    iget-object v0, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 38
    .line 39
    const-string v1, "female"

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    iget-object v0, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget v0, v0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 50
    .line 51
    int-to-double v0, v0

    .line 52
    const-wide v2, 0x3fe599999999999aL    # 0.675

    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    cmpl-double v0, v0, v2

    .line 58
    .line 59
    if-lez v0, :cond_4

    .line 60
    .line 61
    invoke-static {}, Ll/nmp;->e()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/a;->N()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_4

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/match/a;->a:Z

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    sget-object v0, Ll/as20;->j:Ll/byd0;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ljava/lang/Long;

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    const/4 v1, 0x0

    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    sget-object v0, Ll/as20;->i:Ll/vxd0;

    .line 106
    .line 107
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    sget-object v0, Ll/as20;->j:Ll/byd0;

    .line 115
    .line 116
    invoke-static {}, Ll/pzi0;->o()J

    .line 117
    .line 118
    .line 119
    move-result-wide v2

    .line 120
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    :cond_2
    sget-object v0, Ll/as20;->i:Ll/vxd0;

    .line 128
    .line 129
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Ljava/lang/Integer;

    .line 134
    .line 135
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    const/4 v2, 0x3

    .line 140
    if-lt v0, v2, :cond_3

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_3
    sget-object v0, Ll/as20;->i:Ll/vxd0;

    .line 144
    .line 145
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Ljava/lang/Integer;

    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    add-int/lit8 v2, v2, 0x1

    .line 156
    .line 157
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    const-string v0, "e_superlike_usage_guide"

    .line 165
    .line 166
    const-string v2, "p_suggest_user_profile_info_view"

    .line 167
    .line 168
    new-array v1, v1, [Ll/sfj0$a;

    .line 169
    .line 170
    invoke-static {v0, v2, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/tu40;->l:Lv/VImage;

    .line 174
    .line 175
    new-instance v1, Ll/tu40$a;

    .line 176
    .line 177
    invoke-direct {v1, p0, p1}, Ll/tu40$a;-><init>(Ll/tu40;Ll/zq90;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    .line 183
    :catch_0
    :cond_4
    :goto_0
    return-void
.end method

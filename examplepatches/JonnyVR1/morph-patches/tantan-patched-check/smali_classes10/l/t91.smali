.class public Ll/t91;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/o91;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VImage;

.field public j:Ll/o91;

.field public k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/t91;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t91;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/t91;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t91;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/t91;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t91;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/t91;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t91;->k(Landroid/view/View;)V

    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t91;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/p91;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/p91;-><init>(Ll/t91;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 12
    .line 13
    new-instance v1, Ll/q91;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/q91;-><init>(Ll/t91;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/t91;->a:Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Ll/r91;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/r91;-><init>(Ll/t91;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/t91;->i:Lv/VImage;

    .line 32
    .line 33
    new-instance v1, Ll/s91;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/s91;-><init>(Ll/t91;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t91;->j:Ll/o91;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/t91;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R:I

    .line 8
    .line 9
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/t91;->i()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/u91;->b(Ll/t91;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/o91;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t91;->j:Ll/o91;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/o91;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t91;->f(Ll/o91;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->z(Landroid/app/Dialog;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v0, v1}, Ll/t91;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/c0s;

    .line 19
    .line 20
    iget-object v2, p0, Ll/t91;->j:Ll/o91;

    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CALl_AUDIENCE_APPLY_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Ll/t91;->q()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/t91;->j:Ll/o91;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-virtual {v0, v1}, Ll/o91;->q4(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object p0, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 42
    .line 43
    return-object p0
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->j:Ll/o91;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o91;->s4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->j:Ll/o91;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o91;->d4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->j:Ll/o91;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o91;->t4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/t91;->k:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, -0x1

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :pswitch_0
    invoke-virtual {p0}, Ll/t91;->j()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_1
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 27
    .line 28
    sget v3, Ll/obc0;->m1:I

    .line 29
    .line 30
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/t91;->c:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/t91;->d:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/t91;->e:Landroid/widget/ImageView;

    .line 44
    .line 45
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->T2:I

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 64
    .line 65
    sget v2, Ll/obc0;->B0:I

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/t91;->f:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->e0:I

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 91
    .line 92
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_2
    iget-object p0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :pswitch_3
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 103
    .line 104
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/t91;->c:Lv/VDraweeView;

    .line 108
    .line 109
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/t91;->d:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/t91;->e:Landroid/widget/ImageView;

    .line 118
    .line 119
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->O1:I

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 138
    .line 139
    sget v0, Ll/obc0;->d1:I

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/t91;->c:Lv/VDraweeView;

    .line 145
    .line 146
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const-string v1, "context_single_room"

    .line 161
    .line 162
    invoke-static {v1, p1, v0}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/t91;->d:Lv/VDraweeView;

    .line 166
    .line 167
    iget-object v0, p0, Ll/t91;->j:Ll/o91;

    .line 168
    .line 169
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Ll/t91;->f:Landroid/widget/TextView;

    .line 193
    .line 194
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->h1:I

    .line 199
    .line 200
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 208
    .line 209
    const v0, 0x40ffffff    # 7.9999995f

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    .line 214
    .line 215
    iget-object p0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 216
    .line 217
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 218
    .line 219
    .line 220
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U0:I

    .line 221
    .line 222
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 223
    .line 224
    .line 225
    return-void

    .line 226
    :pswitch_4
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 227
    .line 228
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 232
    .line 233
    sget v3, Ll/obc0;->B1:I

    .line 234
    .line 235
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Ll/t91;->c:Lv/VDraweeView;

    .line 239
    .line 240
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    iget-object p1, p0, Ll/t91;->d:Lv/VDraweeView;

    .line 244
    .line 245
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    iget-object p1, p0, Ll/t91;->e:Landroid/widget/ImageView;

    .line 249
    .line 250
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 254
    .line 255
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->O1:I

    .line 260
    .line 261
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 269
    .line 270
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 274
    .line 275
    sget v0, Ll/obc0;->B0:I

    .line 276
    .line 277
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 278
    .line 279
    .line 280
    iget-object p1, p0, Ll/t91;->f:Landroid/widget/TextView;

    .line 281
    .line 282
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->c0:I

    .line 287
    .line 288
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 293
    .line 294
    .line 295
    iget-object p0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 296
    .line 297
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 298
    .line 299
    .line 300
    return-void

    .line 301
    :pswitch_5
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 302
    .line 303
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Ll/t91;->b:Landroid/widget/ImageView;

    .line 307
    .line 308
    sget v3, Ll/obc0;->m1:I

    .line 309
    .line 310
    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 311
    .line 312
    .line 313
    iget-object p1, p0, Ll/t91;->c:Lv/VDraweeView;

    .line 314
    .line 315
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 316
    .line 317
    .line 318
    iget-object p1, p0, Ll/t91;->d:Lv/VDraweeView;

    .line 319
    .line 320
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 321
    .line 322
    .line 323
    iget-object p1, p0, Ll/t91;->e:Landroid/widget/ImageView;

    .line 324
    .line 325
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 326
    .line 327
    .line 328
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 329
    .line 330
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->p2:I

    .line 335
    .line 336
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    .line 342
    .line 343
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 344
    .line 345
    sget v2, Ll/obc0;->B0:I

    .line 346
    .line 347
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 348
    .line 349
    .line 350
    iget-object p1, p0, Ll/t91;->f:Landroid/widget/TextView;

    .line 351
    .line 352
    invoke-virtual {p0}, Ll/t91;->act()Lcom/p1/mobile/android/app/Act;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->e0:I

    .line 357
    .line 358
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    .line 364
    .line 365
    iget-object p1, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 366
    .line 367
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 368
    .line 369
    .line 370
    iget-object p0, p0, Ll/t91;->h:Landroid/widget/TextView;

    .line 371
    .line 372
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    nop

    .line 377
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t91;->j()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.class public Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/widget/ImageView;

.field public e:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->t(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->E3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/a5i0;->G()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "p_wallet,e_wallet_function_button,click_letter"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/a5i0;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->E0:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->q(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t5i0;->a(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    new-instance v0, Ll/e5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/e5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final k()V
    .locals 1

    .line 1
    new-instance v0, Ll/f5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    new-instance v0, Ll/g5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/g5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    new-instance v0, Ll/d5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/d5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    new-instance v0, Ll/h5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    new-instance v0, Ll/c5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    new-instance v0, Ll/i5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i5i0;-><init>(Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/m27;->I3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->da:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const/4 v1, 0x0

    .line 34
    const-string v2, "p_wallet,vas"

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/a5i0;->v()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-static {}, Ll/joa;->M3()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 65
    .line 66
    invoke-interface {p1, p0, v2, v3, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->qm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-static {}, Ll/a5i0;->W()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-lez p1, :cond_4

    .line 75
    .line 76
    invoke-static {}, Ll/a5i0;->v()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ll/a5i0;->c1()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_2

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 107
    .line 108
    const/4 v5, 0x0

    .line 109
    const/4 v6, 0x1

    .line 110
    const/4 v3, 0x0

    .line 111
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Go(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wi(Lcom/p1/mobile/android/app/Act;Z)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 148
    .line 149
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 150
    .line 151
    invoke-interface {p1, p0, v2, v3, v1}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->dt(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->c1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :goto_0
    invoke-static {}, Ll/m27;->I3()Z

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    if-nez p0, :cond_5

    .line 169
    .line 170
    const-string p0, "boost_purchase_shown"

    .line 171
    .line 172
    new-array p1, v0, [Ljava/lang/Object;

    .line 173
    .line 174
    invoke-static {p0, p1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    :cond_5
    invoke-static {}, Ll/m27;->I3()Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    const/4 p1, 0x1

    .line 182
    if-nez p0, :cond_6

    .line 183
    .line 184
    invoke-static {}, Ll/a5i0;->W()I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    if-lez p0, :cond_7

    .line 189
    .line 190
    :cond_6
    move v0, p1

    .line 191
    :cond_7
    invoke-static {p1, v0}, Ll/a5i0;->O1(IZ)V

    .line 192
    .line 193
    .line 194
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->k8:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance p1, Ll/fe5$e;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {p1, p0}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x7

    .line 31
    invoke-virtual {p0, p1}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "p_wallet,e_wallet_function_button,click_greet"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fm()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->N2:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "intl_letter_wallet"

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/a5i0;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fm()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->N2:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "intl_letter_wallet"

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/a5i0;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    new-array v0, v0, [Ll/sfj0$a;

    .line 13
    .line 14
    const-string v1, "e_wallet_read_receipt"

    .line 15
    .line 16
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "p_wallet,vas"

    .line 26
    .line 27
    invoke-static {p0, p1}, Ll/a5i0;->z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->If()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Up()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    const/4 v0, 0x1

    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->ea:I

    .line 60
    .line 61
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 62
    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->zg()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->b3()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-ge p1, v0, :cond_3

    .line 93
    .line 94
    :cond_2
    invoke-static {}, Ll/a5i0;->s0()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-lt p1, v0, :cond_4

    .line 99
    .line 100
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_4

    .line 113
    .line 114
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->cm(Lcom/p1/mobile/android/app/Act;Z)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_5

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Eb(Lcom/p1/mobile/android/app/Act;)V

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vl()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    const-string v1, "p_messages_view,e_quickchat_button,click"

    .line 183
    .line 184
    const/4 v2, 0x0

    .line 185
    invoke-static {p0, v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-nez p0, :cond_7

    .line 201
    .line 202
    invoke-static {}, Ll/a5i0;->s0()I

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    if-lez p0, :cond_6

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_6
    const/4 v0, 0x0

    .line 210
    :cond_7
    :goto_1
    const/4 p0, 0x3

    .line 211
    invoke-static {p0, v0}, Ll/a5i0;->O1(IZ)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mf()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    const-string v1, "p_wallet,vas"

    .line 15
    .line 16
    if-eqz p1, :cond_3

    .line 17
    .line 18
    invoke-static {}, Ll/joa;->G3()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->fa:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    invoke-static {p1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-interface {p1, p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pg(Lcom/p1/mobile/android/app/Act;Ll/a30;ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-static {}, Ll/a5i0;->x0()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-lez p1, :cond_2

    .line 62
    .line 63
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->fa:I

    .line 64
    .line 65
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    invoke-static {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    invoke-static {}, Ll/a5i0;->x0()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-lez p1, :cond_4

    .line 86
    .line 87
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->fa:I

    .line 88
    .line 89
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 94
    .line 95
    invoke-static {p1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_6

    .line 100
    .line 101
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Qi()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_5

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 123
    .line 124
    invoke-static {p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_6
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :goto_1
    invoke-static {}, Ll/a5i0;->x0()I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-lez p0, :cond_7

    .line 142
    .line 143
    const/4 v0, 0x1

    .line 144
    :cond_7
    const/4 p0, 0x2

    .line 145
    invoke-static {p0, v0}, Ll/a5i0;->O1(IZ)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->e:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    aget p2, v0, p2

    .line 10
    .line 11
    const-string v0, "..."

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    packed-switch p2, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    goto/16 :goto_6

    .line 18
    .line 19
    :pswitch_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->E8:I

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 29
    .line 30
    const-string p2, "intlReadMessage"

    .line 31
    .line 32
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p2}, Ll/joa;->x3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->C8:I

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    cmp-long v0, v2, v4

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    invoke-static {}, Ll/pzi0;->o()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    cmp-long v0, v2, v4

    .line 61
    .line 62
    if-lez v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->Q1:I

    .line 69
    .line 70
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 71
    .line 72
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v0, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 94
    .line 95
    sget p2, Ll/jbc0;->h9:I

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 101
    .line 102
    sget p2, Ll/jbc0;->g9:I

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->n()V

    .line 108
    .line 109
    .line 110
    goto/16 :goto_6

    .line 111
    .line 112
    :pswitch_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 113
    .line 114
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->l8:I

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 120
    .line 121
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->w8:I

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 127
    .line 128
    sget p2, Ll/jbc0;->lc:I

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 134
    .line 135
    sget p2, Ll/jbc0;->f9:I

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->k()V

    .line 141
    .line 142
    .line 143
    goto/16 :goto_6

    .line 144
    .line 145
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->If()Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-eqz v2, :cond_1

    .line 170
    .line 171
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    if-eqz v2, :cond_1

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Up()Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-eqz v2, :cond_1

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_1
    move v1, p2

    .line 201
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 202
    .line 203
    if-eqz v1, :cond_2

    .line 204
    .line 205
    new-instance v2, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .line 209
    .line 210
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->h7:I

    .line 211
    .line 212
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    goto :goto_1

    .line 227
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->a7:I

    .line 228
    .line 229
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    :goto_1
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 237
    .line 238
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->e7:I

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 241
    .line 242
    .line 243
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 244
    .line 245
    sget p2, Ll/jbc0;->j9:I

    .line 246
    .line 247
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 251
    .line 252
    sget p2, Ll/jbc0;->i9:I

    .line 253
    .line 254
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->o()V

    .line 258
    .line 259
    .line 260
    goto/16 :goto_6

    .line 261
    .line 262
    :pswitch_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 263
    .line 264
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->M0:I

    .line 265
    .line 266
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 267
    .line 268
    .line 269
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 270
    .line 271
    invoke-static {}, Ll/c17;->u0()Z

    .line 272
    .line 273
    .line 274
    move-result p2

    .line 275
    if-eqz p2, :cond_3

    .line 276
    .line 277
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->Y3:I

    .line 278
    .line 279
    goto :goto_2

    .line 280
    :cond_3
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->X3:I

    .line 281
    .line 282
    :goto_2
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 283
    .line 284
    .line 285
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 286
    .line 287
    sget p2, Ll/jbc0;->k9:I

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 293
    .line 294
    sget p2, Ll/jbc0;->g8:I

    .line 295
    .line 296
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->m()V

    .line 300
    .line 301
    .line 302
    goto/16 :goto_6

    .line 303
    .line 304
    :pswitch_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 305
    .line 306
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->M0:I

    .line 307
    .line 308
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 309
    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 312
    .line 313
    invoke-static {}, Ll/c17;->u0()Z

    .line 314
    .line 315
    .line 316
    move-result p2

    .line 317
    if-eqz p2, :cond_4

    .line 318
    .line 319
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->Y3:I

    .line 320
    .line 321
    goto :goto_3

    .line 322
    :cond_4
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->X3:I

    .line 323
    .line 324
    :goto_3
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 325
    .line 326
    .line 327
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 328
    .line 329
    sget p2, Ll/jbc0;->l9:I

    .line 330
    .line 331
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 332
    .line 333
    .line 334
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 335
    .line 336
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 337
    .line 338
    .line 339
    move-result-object p2

    .line 340
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 341
    .line 342
    .line 343
    move-result-object p2

    .line 344
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xq()I

    .line 345
    .line 346
    .line 347
    move-result p2

    .line 348
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->l()V

    .line 352
    .line 353
    .line 354
    goto/16 :goto_6

    .line 355
    .line 356
    :pswitch_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 357
    .line 358
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->N0:I

    .line 359
    .line 360
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 361
    .line 362
    .line 363
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 364
    .line 365
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->D0:I

    .line 366
    .line 367
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 368
    .line 369
    .line 370
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 371
    .line 372
    sget v0, Ll/jbc0;->nb:I

    .line 373
    .line 374
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 375
    .line 376
    .line 377
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 378
    .line 379
    sget v0, Ll/jbc0;->l9:I

    .line 380
    .line 381
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 382
    .line 383
    .line 384
    new-instance p2, Ll/b5i0;

    .line 385
    .line 386
    invoke-direct {p2, p1}, Ll/b5i0;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 387
    .line 388
    .line 389
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 390
    .line 391
    .line 392
    goto/16 :goto_6

    .line 393
    .line 394
    :pswitch_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 395
    .line 396
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->d:I

    .line 397
    .line 398
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 399
    .line 400
    .line 401
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 402
    .line 403
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->I7:I

    .line 404
    .line 405
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 409
    .line 410
    sget p2, Ll/jbc0;->m9:I

    .line 411
    .line 412
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 413
    .line 414
    .line 415
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 416
    .line 417
    sget p2, Ll/jbc0;->l9:I

    .line 418
    .line 419
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->p()V

    .line 423
    .line 424
    .line 425
    goto :goto_6

    .line 426
    :pswitch_7
    invoke-static {}, Ll/m27;->I3()Z

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    new-instance p2, Ljava/lang/StringBuilder;

    .line 431
    .line 432
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 433
    .line 434
    .line 435
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->da:I

    .line 436
    .line 437
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object p2

    .line 451
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    .line 452
    .line 453
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    if-eqz v1, :cond_5

    .line 458
    .line 459
    goto :goto_4

    .line 460
    :cond_5
    move-object p2, p1

    .line 461
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 462
    .line 463
    .line 464
    move-result-object p1

    .line 465
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 466
    .line 467
    .line 468
    move-result-object p1

    .line 469
    invoke-interface {p1}, Ll/r97;->a2()Z

    .line 470
    .line 471
    .line 472
    move-result p1

    .line 473
    if-eqz p1, :cond_6

    .line 474
    .line 475
    const-string p1, "\u5168\u7a0b\u4e0d\u95f4\u65ad\u4f18\u5148\u63a8\u8350\uff0c\u8ba910\u500d\u7684\u4eba\u4f18\u5148\u6ed1\u5230\u4f60"

    .line 476
    .line 477
    goto :goto_5

    .line 478
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 479
    .line 480
    .line 481
    move-result-object p1

    .line 482
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U1:I

    .line 483
    .line 484
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object p1

    .line 488
    :goto_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 489
    .line 490
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 491
    .line 492
    .line 493
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 494
    .line 495
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 496
    .line 497
    .line 498
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 499
    .line 500
    sget p2, Ll/jbc0;->kc:I

    .line 501
    .line 502
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 503
    .line 504
    .line 505
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->a:Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;

    .line 506
    .line 507
    sget p2, Ll/jbc0;->e9:I

    .line 508
    .line 509
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 510
    .line 511
    .line 512
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->j()V

    .line 513
    .line 514
    .line 515
    :goto_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->d:Landroid/widget/ImageView;

    .line 516
    .line 517
    if-eqz v1, :cond_7

    .line 518
    .line 519
    const/high16 p2, 0x3f000000    # 0.5f

    .line 520
    .line 521
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 522
    .line 523
    .line 524
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 525
    .line 526
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 527
    .line 528
    .line 529
    move-result-object p2

    .line 530
    sget v0, Ll/h9c0;->j:I

    .line 531
    .line 532
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 533
    .line 534
    .line 535
    move-result p2

    .line 536
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 537
    .line 538
    .line 539
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 540
    .line 541
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 542
    .line 543
    .line 544
    move-result-object p0

    .line 545
    sget p2, Ll/h9c0;->j:I

    .line 546
    .line 547
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 548
    .line 549
    .line 550
    move-result p0

    .line 551
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 552
    .line 553
    .line 554
    return-void

    .line 555
    :cond_7
    const/high16 p2, 0x3f800000    # 1.0f

    .line 556
    .line 557
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 558
    .line 559
    .line 560
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->b:Lv/VText;

    .line 561
    .line 562
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 563
    .line 564
    .line 565
    move-result-object p2

    .line 566
    sget v0, Ll/h9c0;->d0:I

    .line 567
    .line 568
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 569
    .line 570
    .line 571
    move-result p2

    .line 572
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 573
    .line 574
    .line 575
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/TanTanCoinItem;->c:Lv/VText;

    .line 576
    .line 577
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 578
    .line 579
    .line 580
    move-result-object p0

    .line 581
    sget p2, Ll/h9c0;->c0:I

    .line 582
    .line 583
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 584
    .line 585
    .line 586
    move-result p0

    .line 587
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 588
    .line 589
    .line 590
    return-void

    .line 591
    :pswitch_data_0
    .packed-switch 0x1
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

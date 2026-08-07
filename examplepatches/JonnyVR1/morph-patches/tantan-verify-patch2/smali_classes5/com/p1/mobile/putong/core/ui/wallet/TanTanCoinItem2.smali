.class public Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;

.field public e:Landroid/view/View;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->G0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->E0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/app/PutongFrag;Landroid/view/View;)V
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

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->z0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic B0(Landroid/view/View;)V
    .locals 6

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_wallet_instantmatch_btn"

    .line 5
    .line 6
    const-string v1, "p_wallet"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/joa;->D3()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ve()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-static {}, Ll/joa;->R3()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const-string v0, "toast_type"

    .line 35
    .line 36
    const-string v2, "e_instantmatch_intercept_toast"

    .line 37
    .line 38
    if-lez p1, :cond_1

    .line 39
    .line 40
    const-string p1, "renew"

    .line 41
    .line 42
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {v2, v1, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 51
    .line 52
    .line 53
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->a6:I

    .line 54
    .line 55
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const-string p1, "get"

    .line 60
    .line 61
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {v2, v1, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 70
    .line 71
    .line 72
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->Z5:I

    .line 73
    .line 74
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 75
    .line 76
    .line 77
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v2, Ll/r5i0;

    .line 84
    .line 85
    invoke-direct {v2}, Ll/r5i0;-><init>()V

    .line 86
    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 90
    .line 91
    const-string v1, "p_wallet,e_wallet_instantmatch_btn,click"

    .line 92
    .line 93
    const/4 v3, 0x0

    .line 94
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/purchase/c;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    :goto_1
    new-instance p1, Ll/nxm$e;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-direct {p1, p0}, Ll/nxm$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 107
    .line 108
    .line 109
    const-string p0, "p_wallet,e_wallet_instantmatch_btn,click"

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Ll/nxm$e;->b(Ljava/lang/String;)Ll/nxm$e;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance p1, Ll/q5i0;

    .line 116
    .line 117
    invoke-direct {p1}, Ll/q5i0;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p1}, Ll/nxm$e;->c(Ll/a30;)Ll/nxm$e;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Ll/nxm$e;->d()Ll/nxm;

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final synthetic D0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

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

.method public final synthetic E0(Landroid/view/View;)V
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
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->ea:I

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->zg()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->b3()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-ge p1, v0, :cond_2

    .line 50
    .line 51
    :cond_1
    invoke-static {}, Ll/a5i0;->s0()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-lt p1, v0, :cond_3

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->cm(Lcom/p1/mobile/android/app/Act;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_4

    .line 102
    .line 103
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string v1, "use_up"

    .line 118
    .line 119
    invoke-interface {p1, p0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Zc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Vl()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string v1, "p_messages_view,e_quickchat_button,click"

    .line 142
    .line 143
    const/4 v2, 0x0

    .line 144
    invoke-static {p0, v2, p1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->o1(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-nez p0, :cond_6

    .line 160
    .line 161
    invoke-static {}, Ll/a5i0;->s0()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-lez p0, :cond_5

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_5
    const/4 v0, 0x0

    .line 169
    :cond_6
    :goto_1
    const/4 p0, 0x3

    .line 170
    invoke-static {p0, v0}, Ll/a5i0;->O1(IZ)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final synthetic G0(Landroid/view/View;)V
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
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    invoke-static {p1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-interface {p1, p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pg(Lcom/p1/mobile/android/app/Act;Ll/a30;ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-static {}, Ll/a5i0;->x0()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-lez p1, :cond_2

    .line 63
    .line 64
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->fa:I

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 85
    .line 86
    invoke-interface {p1, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_3
    invoke-static {}, Ll/a5i0;->x0()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-lez p1, :cond_4

    .line 95
    .line 96
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->fa:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 103
    .line 104
    invoke-static {p1}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_6

    .line 109
    .line 110
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Qi()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    if-eqz p1, :cond_5

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 140
    .line 141
    invoke-interface {p1, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->i6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_6
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-interface {p1, p0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Uh(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :goto_1
    invoke-static {}, Ll/a5i0;->x0()I

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-lez p0, :cond_7

    .line 167
    .line 168
    const/4 v0, 0x1

    .line 169
    :cond_7
    const/4 p0, 0x2

    .line 170
    invoke-static {p0, v0}, Ll/a5i0;->O1(IZ)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    const/high16 v0, 0x42a00000    # 80.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-static {v1, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 25
    .line 26
    new-array v2, v2, [Landroid/view/View;

    .line 27
    .line 28
    aput-object v1, v2, v3

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/high16 v0, 0x42800000    # 64.0f

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-static {v1, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 48
    .line 49
    new-array v2, v2, [Landroid/view/View;

    .line 50
    .line 51
    aput-object v1, v2, v3

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2$a;->a:[I

    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    aget p2, v0, p2

    .line 63
    .line 64
    const-string v0, "#e9f9ff"

    .line 65
    .line 66
    const-string v1, "..."

    .line 67
    .line 68
    const-string v2, "#ffeff4"

    .line 69
    .line 70
    packed-switch p2, :pswitch_data_0

    .line 71
    .line 72
    .line 73
    goto/16 :goto_3

    .line 74
    .line 75
    :pswitch_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 76
    .line 77
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->E8:I

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 80
    .line 81
    .line 82
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 85
    .line 86
    const-string p2, "intlReadMessage"

    .line 87
    .line 88
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-static {p2}, Ll/joa;->x3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->C8:I

    .line 101
    .line 102
    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    const-wide/16 v4, 0x0

    .line 107
    .line 108
    cmp-long v4, v0, v4

    .line 109
    .line 110
    if-eqz v4, :cond_1

    .line 111
    .line 112
    invoke-static {}, Ll/pzi0;->o()J

    .line 113
    .line 114
    .line 115
    move-result-wide v4

    .line 116
    cmp-long v4, v0, v4

    .line 117
    .line 118
    if-lez v4, :cond_1

    .line 119
    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->Q1:I

    .line 125
    .line 126
    sget-object v4, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 127
    .line 128
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v4, v0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 145
    .line 146
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 150
    .line 151
    sget p2, Ll/jbc0;->vb:I

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 157
    .line 158
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->u0()V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_3

    .line 169
    .line 170
    :pswitch_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 171
    .line 172
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r2:I

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 182
    .line 183
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->s2:I

    .line 184
    .line 185
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 189
    .line 190
    sget p2, Ll/jbc0;->jb:I

    .line 191
    .line 192
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 196
    .line 197
    const-string p2, "#FFF0C8"

    .line 198
    .line 199
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    move-result p2

    .line 203
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->s0()V

    .line 207
    .line 208
    .line 209
    const-string p1, "e_intl_wallet_compliment_iap_click"

    .line 210
    .line 211
    const-string p2, "p_wallet"

    .line 212
    .line 213
    invoke-static {p1, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    goto/16 :goto_3

    .line 217
    .line 218
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ad()Z

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 231
    .line 232
    if-eqz v3, :cond_2

    .line 233
    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    .line 235
    .line 236
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 237
    .line 238
    .line 239
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->h7:I

    .line 240
    .line 241
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    goto :goto_1

    .line 256
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->a7:I

    .line 257
    .line 258
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    :goto_1
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 266
    .line 267
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->e7:I

    .line 268
    .line 269
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 273
    .line 274
    sget p2, Ll/jbc0;->qb:I

    .line 275
    .line 276
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 277
    .line 278
    .line 279
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 280
    .line 281
    const-string p2, "#ffeee5"

    .line 282
    .line 283
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    move-result p2

    .line 287
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->v0()V

    .line 291
    .line 292
    .line 293
    goto/16 :goto_3

    .line 294
    .line 295
    :pswitch_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 296
    .line 297
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->N0:I

    .line 298
    .line 299
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    .line 300
    .line 301
    .line 302
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 303
    .line 304
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->D0:I

    .line 305
    .line 306
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(I)V

    .line 307
    .line 308
    .line 309
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 310
    .line 311
    sget v1, Ll/jbc0;->mb:I

    .line 312
    .line 313
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 314
    .line 315
    .line 316
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 317
    .line 318
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 323
    .line 324
    .line 325
    new-instance p2, Ll/j5i0;

    .line 326
    .line 327
    invoke-direct {p2, p1}, Ll/j5i0;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 328
    .line 329
    .line 330
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 331
    .line 332
    .line 333
    goto/16 :goto_3

    .line 334
    .line 335
    :pswitch_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 336
    .line 337
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->d:I

    .line 338
    .line 339
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 340
    .line 341
    .line 342
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 343
    .line 344
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->I7:I

    .line 345
    .line 346
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 350
    .line 351
    sget p2, Ll/jbc0;->tb:I

    .line 352
    .line 353
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 354
    .line 355
    .line 356
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 357
    .line 358
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 359
    .line 360
    .line 361
    move-result p2

    .line 362
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->w0()V

    .line 366
    .line 367
    .line 368
    goto :goto_3

    .line 369
    :pswitch_5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 370
    .line 371
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 372
    .line 373
    .line 374
    move-result-object p2

    .line 375
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    new-instance p2, Ljava/lang/StringBuilder;

    .line 380
    .line 381
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 382
    .line 383
    .line 384
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->da:I

    .line 385
    .line 386
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object p2

    .line 400
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->o:I

    .line 401
    .line 402
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    if-eqz v3, :cond_3

    .line 407
    .line 408
    goto :goto_2

    .line 409
    :cond_3
    move-object p2, p1

    .line 410
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 411
    .line 412
    .line 413
    move-result-object p1

    .line 414
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U1:I

    .line 415
    .line 416
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p1

    .line 420
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 421
    .line 422
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 423
    .line 424
    .line 425
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 426
    .line 427
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 428
    .line 429
    .line 430
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 431
    .line 432
    sget p2, Ll/jbc0;->ib:I

    .line 433
    .line 434
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 435
    .line 436
    .line 437
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 438
    .line 439
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 440
    .line 441
    .line 442
    move-result p2

    .line 443
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 444
    .line 445
    .line 446
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->r0()V

    .line 447
    .line 448
    .line 449
    goto :goto_3

    .line 450
    :pswitch_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 451
    .line 452
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->I5:I

    .line 453
    .line 454
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 455
    .line 456
    .line 457
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 458
    .line 459
    sget p2, Lcom/p1/mobile/putong/core/pay/R$string;->M5:I

    .line 460
    .line 461
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 462
    .line 463
    .line 464
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 465
    .line 466
    sget p2, Ll/jbc0;->lb:I

    .line 467
    .line 468
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 469
    .line 470
    .line 471
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->e:Landroid/view/View;

    .line 472
    .line 473
    const-string p2, "#F6DBFF"

    .line 474
    .line 475
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 476
    .line 477
    .line 478
    move-result p2

    .line 479
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->t0()V

    .line 483
    .line 484
    .line 485
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->f:Landroid/widget/ImageView;

    .line 486
    .line 487
    if-eqz v3, :cond_4

    .line 488
    .line 489
    const/high16 p2, 0x3f000000    # 0.5f

    .line 490
    .line 491
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 492
    .line 493
    .line 494
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 495
    .line 496
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 497
    .line 498
    .line 499
    move-result-object p2

    .line 500
    sget v0, Ll/h9c0;->j:I

    .line 501
    .line 502
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 503
    .line 504
    .line 505
    move-result p2

    .line 506
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 507
    .line 508
    .line 509
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 510
    .line 511
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    sget p2, Ll/h9c0;->j:I

    .line 516
    .line 517
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 518
    .line 519
    .line 520
    move-result p0

    .line 521
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 522
    .line 523
    .line 524
    return-void

    .line 525
    :cond_4
    const/high16 p2, 0x3f800000    # 1.0f

    .line 526
    .line 527
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 528
    .line 529
    .line 530
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 531
    .line 532
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 533
    .line 534
    .line 535
    move-result-object p2

    .line 536
    sget v0, Ll/h9c0;->d0:I

    .line 537
    .line 538
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 539
    .line 540
    .line 541
    move-result p2

    .line 542
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 543
    .line 544
    .line 545
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->h:Lv/VText;

    .line 546
    .line 547
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 548
    .line 549
    .line 550
    move-result-object p0

    .line 551
    sget p2, Ll/h9c0;->c0:I

    .line 552
    .line 553
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 554
    .line 555
    .line 556
    move-result p0

    .line 557
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 558
    .line 559
    .line 560
    return-void

    .line 561
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->q0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/qa00;->j:I

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->g:Lv/VText;

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s5i0;->a(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r0()V
    .locals 1

    .line 1
    new-instance v0, Ll/p5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p5i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final s0()V
    .locals 1

    .line 1
    new-instance v0, Ll/o5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/o5i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final t0()V
    .locals 1

    .line 1
    new-instance v0, Ll/l5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l5i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final u0()V
    .locals 1

    .line 1
    new-instance v0, Ll/n5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n5i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final v0()V
    .locals 1

    .line 1
    new-instance v0, Ll/k5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k5i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final w0()V
    .locals 1

    .line 1
    new-instance v0, Ll/m5i0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m5i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic y0(Landroid/view/View;)V
    .locals 7

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
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->da:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/a5i0;->W()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-lez p1, :cond_3

    .line 33
    .line 34
    invoke-static {}, Ll/a5i0;->v()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/a5i0;->c1()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

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
    move-result-object v1

    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    const/4 v6, 0x1

    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Go(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wi(Lcom/p1/mobile/android/app/Act;Z)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 106
    .line 107
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 108
    .line 109
    const/4 v3, 0x0

    .line 110
    invoke-interface {p1, p0, v1, v2, v3}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->dt(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string p1, "p_wallet,vas"

    .line 121
    .line 122
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->c1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-nez p0, :cond_4

    .line 138
    .line 139
    const-string p0, "boost_purchase_shown"

    .line 140
    .line 141
    new-array p1, v0, [Ljava/lang/Object;

    .line 142
    .line 143
    invoke-static {p0, p1}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    const/4 p1, 0x1

    .line 159
    if-nez p0, :cond_5

    .line 160
    .line 161
    invoke-static {}, Ll/a5i0;->W()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-lez p0, :cond_6

    .line 166
    .line 167
    :cond_5
    move v0, p1

    .line 168
    :cond_6
    invoke-static {p1, v0}, Ll/a5i0;->O1(IZ)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public final synthetic z0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_intl_wallet_compliment_iap_click"

    .line 2
    .line 3
    const-string v0, "p_wallet"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinItem2;->i:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "p_wallet,vas"

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->g1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
